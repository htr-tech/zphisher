# ---- Base Stage ----
# Use a specific version of Alpine as base image
FROM alpine:3.14 AS base

LABEL maintainer="https://github.com/htr-tech/zphisher"

# Set environment variables
ENV ZPHISHER_VERSION=main

# Install necessary dependencies with security hardening
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
        bash \
        ncurses \
        curl \
        unzip \
        wget \
        php \
        ca-certificates

# Fetch Zphisher securely from GitHub repository
WORKDIR /zphisher
RUN wget -qO zphisher.zip https://github.com/htr-tech/zphisher/archive/refs/heads/$ZPHISHER_VERSION.zip && \
    unzip zphisher.zip && \
    mv zphisher-$ZPHISHER_VERSION/* . && \
    rm -rf zphisher-$ZPHISHER_VERSION zphisher.zip

# Change permissions to the script and other necessary files
RUN chmod +x zphisher.sh && \
    chmod -R 755 /zphisher

# Create a dedicated user and group
RUN addgroup -S zphisher_group && adduser -S -G zphisher_group zphisher_user

# Set ownership and permissions
RUN chown -R zphisher_user:zphisher_group /zphisher

# ---- Final Stage ----
# Use a smaller base image for runtime
FROM alpine:3.14 AS final

LABEL maintainer="https://github.com/htr-tech/zphisher"

# Copy only necessary files and CA certificates from the base stage
COPY --from=base /zphisher /zphisher
COPY --from=base /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

# Set non-root user for improved security
RUN addgroup -S zphisher_group && adduser -S -G zphisher_group zphisher_user
USER zphisher_user

# Set the working directory
WORKDIR /zphisher

# Healthcheck to ensure the container is healthy
HEALTHCHECK --interval=30s --timeout=3s \
    CMD wget -qO- http://localhost/ || exit 1

# Handle potential startup bugs gracefully
CMD ["bash", "-c", "\
    if [ ! -f zphisher.sh ]; then \
        echo 'ERROR: zphisher.sh not found. Exiting.'; \
        exit 1; \
    fi; \
    ./zphisher.sh \
"]

