
	(function () {
	  'use strict';
	
	  // Add indexOf to Array
	  if (!Array.prototype.indexOf) {
	    Array.prototype.indexOf = function (elt) {
	      var len = this.length >>> 0;
	
	      var from = Number(arguments[1]) || 0;
	      from = (from < 0)
	        ? Math.ceil(from)
	        : Math.floor(from);
	      if (from < 0) {
	        from += len;
	      }
	
	      for (; from < len; from++) {
	        if (from in this && this[from] === elt) {
	          return from;
	        }
	      }
	      return -1;
	    };
	  }
	
	  var BrowserDetect = {
	    init: function () {
	      this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
	      this.version = this.searchVersion(navigator.userAgent) || this.searchVersion(navigator.appVersion) || "an unknown version";
	      this.OS = this.searchString(this.dataOS) || "an unknown OS";
	    },
	    searchString: function (data) {
	      for (var i = 0; i < data.length; i++) {
	        var dataString = data[i].string;
	        var dataProp = data[i].prop;
	        this.versionSearchString = data[i].versionSearch || data[i].identity;
	        if (dataString) {
	          if (dataString.indexOf(data[i].subString) !== -1)
	            return data[i].identity;
	        }
	        else if (dataProp)
	          return data[i].identity;
	      }
	    },
	    searchVersion: function (dataString) {
	      var index = dataString.indexOf(this.versionSearchString);
	      if (index >= 0)
	        return parseFloat(dataString.substring(index + this.versionSearchString.length + 1));
	    },
	    dataBrowser: [
	      {
	        string: navigator.userAgent,
	        subString: "Chrome",
	        identity: "Chrome"
	      },
	      {  string: navigator.userAgent,
	        subString: "OmniWeb",
	        versionSearch: "OmniWeb/",
	        identity: "OmniWeb"
	      },
	      {
	        string: navigator.vendor,
	        subString: "Apple",
	        identity: "Safari",
	        versionSearch: "Version"
	      },
	      {
	        prop: window.opera,
	        identity: "Opera",
	        versionSearch: "Version"
	      },
	      {
	        string: navigator.vendor,
	        subString: "iCab",
	        identity: "iCab"
	      },
	      {
	        string: navigator.vendor,
	        subString: "KDE",
	        identity: "Konqueror"
	      },
	      {
	        string: navigator.userAgent,
	        subString: "Firefox",
	        identity: "Firefox"
	      },
	      {
	        string: navigator.vendor,
	        subString: "Camino",
	        identity: "Camino"
	      },
	      {   // for newer Netscapes (6+)
	        string: navigator.userAgent,
	        subString: "Netscape",
	        identity: "Netscape"
	      },
	      {
	        string: navigator.userAgent,
	        subString: "MSIE",
	        identity: "Explorer",
	        versionSearch: "MSIE"
	      },
	      {
	        string: navigator.userAgent,
	        subString: "Gecko",
	        identity: "Mozilla",
	        versionSearch: "rv"
	      },
	      {         // for older Netscapes (4-)
	        string: navigator.userAgent,
	        subString: "Mozilla",
	        identity: "Netscape",
	        versionSearch: "Mozilla"
	      }
	    ],
	    dataOS: [
	      {
	        string: navigator.platform,
	        subString: "Win",
	        identity: "Windows"
	      },
	      {
	        string: navigator.platform,
	        subString: "Mac",
	        identity: "Mac"
	      },
	      {
	        string: navigator.userAgent,
	        subString: "iPhone",
	        identity: "iPhone/iPod"
	      },
	      {
	        string: navigator.platform,
	        subString: "Linux",
	        identity: "Linux"
	      }
	    ]
	  };
	  BrowserDetect.init();
	
	  /**
	   * Global SNEI Unified Footer Object
	   * Only variable that bleeds to the global namespace to be accessible
	   *
	   * @type {}
	   */
	  window.SNEIUnifiedFooter = {
	    // Variables that can be set indirectly using the corresponding data- attribute
	    isResponsive: "1",
	    openLinksInNewWindow: "0",
	    displayCookieWarning: "1",
	    displayBrowserWarning: "0",
	    containerId: "footerContainer",
	    useDefaultCss: "1",
	    callbackFuncName: null,
	    onRenderFuncName: null,
	    includeSonyFont: "0",
	
	    // Internal
	    footerJSON: {},
	    baseCSS: "@font-face{font-family:\"Sony-Icons-Footer\";src:url(\"data:application/x-font-woff;charset=utf-8;base64,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\") format(\"woff\"),url(\"data:application/x-font-ttf;charset=utf-8;base64,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\") format(\"truetype\");font-weight:normal;font-style:normal}.sen-fonticon,.snei-social [class*=\"fonticon-\"]{display:inline-block;line-height:0.6}.sen-fonticon:before,.snei-social [class*=\"fonticon-\"]:before,.snei-social [class*=\"fonticon-\"][class*=\"--after\"]:after{font-family:\'Sony-Icons-Footer\';speak:none;font-style:normal;font-weight:normal;line-height:1;text-decoration:inherit;text-transform:none}.snei-social [class*=\"fonticon-10-\"]{font-size:1.0em}.snei-social [class*=\"fonticon-15-\"]{font-size:1.5em}.snei-social [class*=\"fonticon-20-\"]{font-size:2.0em}.snei-social [class*=\"fonticon-30-\"]{font-size:3.0em}.snei-social [class*=\"fonticon-40-\"]{font-size:4.0em;line-height:0.65}.snei-social [class*=\"fonticon-50-\"]{font-size:5.0em;line-height:0.65}.snei-social [class*=\"fonticon-60-\"]{font-size:6.0em;line-height:0.65}.snei-social .fonticon-10-chevron-sm,.snei-social .fonticon-10-chevron-sm--after{margin:0 -.125em}.snei-social .fonticon-15-facebook-sm:before,.snei-social .fonticon-15-facebook-sm--after:after{content:\"\\f050\"}.snei-social .fonticon-15-gplus:before,.snei-social .fonticon-15-gplus--after:after{content:\"\\f051\"}.snei-social .fonticon-15-instagram:before,.snei-social .fonticon-15-instagram--after:after{content:\"\\f052\"}.snei-social .fonticon-15-twitter:before,.snei-social .fonticon-15-twitter--after:after{content:\"\\f053\"}.snei-social .fonticon-15-weibo:before,.snei-social .fonticon-15-weibo--after:after{content:\"\\f054\"}.snei-social .fonticon-15-youtube:before,.snei-social .fonticon-15-youtube--after:after{content:\"\\f055\"}.snei-footer{*zoom:1;font-family:\"SST W01 Light\",\"Helvetica Neue\",Helvetica,Arial,sans-serif;font-weight:normal;font-style:normal;font-size:16px;background:#262626;position:relative;z-index:50}.snei-footer:before,.snei-footer:after{display:table;content:\"\";line-height:0}.snei-footer:after{clear:both}.snei-footer *,.snei-footer *:before,.snei-footer *:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.snei-footer a{color:#fff;display:block;text-decoration:none}.snei-label{font-family:\"SST W01 Bold\",\"Helvetica Neue\",Helvetica,Arial,sans-serif;font-weight:normal;font-style:normal;font-size:.875em;text-transform:uppercase;margin:0 0 20px;color:#fff}.snei-list{list-style:none;margin:0;padding:0}.snei-list li{margin:15px 0;line-height:1}.snei-container{*zoom:1;margin:0 auto;width:93.06122%;max-width:1400px}.snei-container:before,.snei-container:after{display:table;content:\"\";line-height:0}.snei-container:after{clear:both}.snei-grid{*zoom:1;margin:0 auto;width:92.76316%;max-width:1190px}.snei-grid:before,.snei-grid:after{display:table;content:\"\";line-height:0}.snei-grid:after{clear:both}.snei-column-services,.snei-column-store,.snei-column-account,.snei-column-legal,.snei-column-sen{float:left;padding:30px 0;margin-right:2.45098%}.snei-column-services{width:14.70588%}.snei-column-store{width:9.80392%}.snei-column-account{width:14.70588%}.snei-column-legal{width:32.09804%}.snei-column-sen{background:#3c3c3c;width:30.88235%;padding:30px 2.45098%;margin-right:0;min-height:286px}.snei-column-sen .snei-label{font-family:\"SST W01 Roman\",\"Helvetica Neue\",Helvetica,Arial,sans-serif;font-weight:normal;font-style:normal;font-size:1em;text-transform:none;margin-top:-10px;margin-bottom:5px}.snei-column-sen .snei-list{*zoom:1;margin-bottom:15px;font-size:.8125em}.snei-column-sen .snei-list:before,.snei-column-sen .snei-list:after{display:table;content:\"\";line-height:0}.snei-column-sen .snei-list:after{clear:both}.snei-column-sen .snei-list li{float:left;margin:10px 10% 10px 0;width:100%}.snei-column-sen .snei-list li:last-child{margin-right:0}.snei-social{*zoom:1;-webkit-backface-visibility:hidden;-moz-backface-visibility:hidden;backface-visibility:hidden;margin-bottom:20px}.snei-social:before,.snei-social:after{display:table;content:\"\";line-height:0}.snei-social:after{clear:both}.snei-social span{position:absolute;top:-9999px;left:-9999px}.snei-social a{display:inline-block;vertical-align:top;background:#343434;width:2.25em;height:2em;margin-bottom:.1875em;text-align:center;color:#fff}.snei-social a:hover,.snei-social a:active,.snei-social a:focus,.snei-social a.active{color:#fff;background:#343434}.snei-social a i{position:relative;margin-top:3px;margin-bottom:0;line-height:1;-webkit-font-smoothing:antialiased;overflow:hidden}.snei-social .snei-social-twitter{background-color:#00acee}.snei-social .snei-social-twitter .fonticon-15-twitter{margin-right:2px}.snei-social .snei-social-facebook{background-color:#3b5b99}.snei-social .snei-social-facebook .fonticon-15-facebook-sm{margin-right:8px}.snei-social .snei-social-gplus{background-color:#db4a39}.snei-social .snei-social-youtube{background-color:#ef3c39}.snei-social .snei-social-youtube .fonticon-15-youtube{margin-right:4px}.snei-social .snei-social-instagram{background-color:#ed7900}.snei-social .snei-social-instagram .fonticon-15-instagram{font-size:1.3em;margin-top:5px}.snei-social .snei-social-weibo{background-color:#d72930}.snei-social .snei-social-weibo .fonticon-15-weibo{font-size:1.3em;margin-top:6px}#cookieWarningMessage{left:0;bottom:-125px;position:fixed;text-align:center;width:100%;background:#000;background:rgba(0,0,0,0.9);border-top:1px solid #000000;z-index:999999;padding:25px 50px 25px 15px;font-size:14px;-webkit-box-shadow:0 -1px 3px rgba(0,0,0,0.75);-moz-box-shadow:0 -1px 3px rgba(0,0,0,0.75);box-shadow:0 -1px 3px rgba(0,0,0,0.75);color:white}#cookieWarningMessage a, #cookieWarningMessage #cookiesTellMeMoreLink{padding:0;color:#00A2FF;white-space:nowrap}#cookieWarningMessage a:hover, #cookieWarningMessage #cookiesTellMeMoreLink:hover{text-decoration:underline}#cookieWarningMessage .cw_close{position:fixed;top:auto; bottom:25px;right:10px;margin:0;border:none;padding:0;text-align:center;background:#494949;color:white;font-size:1em;width:25px;height:25px;border-radius:3px;cursor:pointer}",
	    responsiveCSS: "@media (max-width: 47.9375em){.snei-label{padding:10px 20px;background:#494949;margin-bottom:0;font-size:1em}.snei-list li{margin:0;border-top:1px solid #454545}.snei-list li:first-child{border-top:none}.snei-list a{display:block;padding:10px 20px}.snei-container,.snei-grid{padding:0;width:auto}.snei-column-services,.snei-column-store,.snei-column-account,.snei-column-legal,.snei-column-sen{margin:0;padding:0;float:none;width:auto}.snei-column-sen{padding-bottom:20px}.snei-column-sen .snei-label{margin:0}.snei-column-sen .snei-label br{display:none}.snei-column-sen .snei-list{margin:0;font-size:1em}.snei-column-sen .snei-list li{float:none;margin:0}.snei-social,.snei-country-selector{margin:10px 20px 0}}#cookieWarningMessage{left:0;bottom:-125px;position:fixed;text-align:center;width:100%;background:#000;background:rgba(0,0,0,0.9);border-top:1px solid #000000;z-index:999999;padding:25px 50px 25px 15px;font-size:14px;-webkit-box-shadow:0 -1px 3px rgba(0,0,0,0.75);-moz-box-shadow:0 -1px 3px rgba(0,0,0,0.75);box-shadow:0 -1px 3px rgba(0,0,0,0.75);color:white}#cookieWarningMessage #cookiesTellMeMoreLink{padding:0;color:#00A2FF;white-space:nowrap}#cookieWarningMessage #cookiesTellMeMoreLink:hover{text-decoration:underline}#cookieWarningMessage .cw_close{position:fixed;top:auto;bottom:25px;right:10px;margin:0;border:none;padding:0;text-align:center;background:#494949;color:white;font-size:1em;width:25px;height:25px;border-radius:3px;cursor:pointer} ",
	    defaultTemplate: "<section id=\"snei-footer\" class=\"snei-footer\"> <div class=\"snei-container\"> <div class=\"snei-grid\"> {% if(o.service && o.service.title!='' && o.service.list.length > 0) { %} <div class=\"snei-column-services\"> <h5 class=\"snei-label\">{%=o.service.title %}</h5> {% if(o.service.list.length > 0) { %} <ul class=\"snei-list\"> {% for (var y = 0; y < o.service.list.length; y ++) { %} {% var currentTarget = o.openNewWindowHTML ? o.openNewWindowHTML : o.service.list[y].target; %} <li> <a href=\"{%=o.service.list[y].link %}\" target=\"{%=currentTarget %}\">{%=o.service.list[y].title %}</a> </li> {% } %} </ul> {% } %} </div> {% } %} {% if(o.shop) { %} <div class=\"snei-column-store\"> <h5 class=\"snei-label\">{%=o.shop.title %}</h5> {% if(o.shop.list.length > 0) { %} <ul class=\"snei-list\"> {% for (var y = 0; y < o.shop.list.length; y ++) { %} {% var currentTarget = o.openNewWindowHTML ? o.openNewWindowHTML : o.shop.list[y].target; %} <li> <a href=\"{%=o.shop.list[y].link %}\" target=\"{%=currentTarget %}\">{%=o.shop.list[y].title %}</a> </li> {% } %} </ul> {% } %} </div> {% } %} {% if(o.account) { %} <div class=\"snei-column-account\"> <h5 class=\"snei-label\">{%=o.account.title %}</h5> {% if(o.account.list.length > 0) { %} <ul class=\"snei-list\"> {% for (var y = 0; y < o.account.list.length; y ++) { %} {% var currentTarget = o.openNewWindowHTML ? o.openNewWindowHTML : o.account.list[y].target; %} <li> <a href=\"{%=o.account.list[y].link %}\" target=\"{%=currentTarget %}\">{%=o.account.list[y].title %}</a> </li> {% } %} </ul> {% } %} </div> {% } %} {% if(o.legal) { %} <div class=\"snei-column-legal\"> <h5 class=\"snei-label\">{%=o.legal.title %}</h5> {% if(o.legal.list.length > 0) { %} <ul class=\"snei-list\"> {% for (var y = 0; y < o.legal.list.length; y ++) { %} {% var currentTarget = o.openNewWindowHTML ? o.openNewWindowHTML : o.legal.list[y].target; %} <li> <a href=\"{%=o.legal.list[y].link %}\" target=\"{%=currentTarget %}\">{%=o.legal.list[y].title %}</a> </li> {% } %} </ul> {% } %} </div> {% } %} <div class=\"snei-column-sen\"> {% if(o.sen) { %} <h5 class=\"snei-label\"> {%#o.sen.title.replace(/([^>\\r\\n]?)(\\r\\n|\\n\\r|\\r|\\n)/g, \'$1<br />$2\') %} </h5> {% } %} {% if(o.about && o.about.list.length > 0) { %} <ul class=\"snei-list\"> {% for (var y = 0; y < o.about.list.length; y ++) { %} {% var currentTarget = o.openNewWindowHTML ? o.openNewWindowHTML : o.about.list[y].target; %} <li> <a href=\"{%=o.about.list[y].link %}\" target=\"{%=currentTarget %}\">{%=o.about.list[y].title %}</a> </li> {% } %} </ul> {% } %} {% if(o.social && o.social.list.length > 0) { %} <div class=\"snei-social\"> {% for (var y = 0; y < o.social.list.length; y ++) { %} {% var socialClassName = \"\"; var socialIconClassName = \"\"; switch (o.social.list[y].id) { case \"footerLink_Twitter\": socialClassName = \"snei-social-twitter\"; socialIconClassName = \"fonticon-15-twitter\"; break; case \"footerLink_Facebook\": socialClassName = \"snei-social-facebook\"; socialIconClassName = \"fonticon-15-facebook-sm\"; break; case \"footerLink_GooglePlus\": socialClassName = \"snei-social-gplus\"; socialIconClassName = \"fonticon-15-gplus\"; break; case \"footerLink_Youtube\": socialClassName = \"snei-social-youtube\"; socialIconClassName = \"fonticon-15-youtube\"; break; case \"footerLink_Instagram\": socialClassName = \"snei-social-instagram\"; socialIconClassName = \"fonticon-15-instagram\"; break; case \"footerLink_Weibo\": socialClassName = \"snei-social-weibo\"; socialIconClassName = \"fonticon-15-weibo\"; break; } var currentTarget = o.openNewWindowHTML ? o.openNewWindowHTML : o.social.list[y].target; %} <a href=\"{%=o.social.list[y].link %}\" title=\"{%=o.social.list[y].title %}\" class=\"{%=socialClassName %}\" target=\"{%=currentTarget %}\"> <i class=\"{%=socialIconClassName %}\"></i> <span>{%=o.social.list[y].title %}</span> </a> {% } %} </div> {% } %} </div> </div> </div> </section>",
	    html: null,
	    cookieWarningScript: "",
	    head: document.getElementsByTagName('head')[0],
	    tmpl: null,
	
	    /**
	     * Returns a cookie by name
	     *
	     * @param {String} c_name
	     * @returns {*}
	     */
	    getCookie: function (c_name) {
	      var i, x, y, ARRcookies = document.cookie.split(";");
	      for (i = 0; i < ARRcookies.length; i++) {
	        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
	        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
	        x = x.replace(/^\s+|\s+$/g, "");
	        if (x == c_name) {
	          return decodeURI(y);
	        }
	      }
	    },
	
	    /**
	     * Sets a cookie with lifetime in minutes
	     *
	     * @param {String} c_name Cookie Name
	     * @param {*} value
	     * @param {Integer} exmins
	     */
	    setCookie: function (c_name, value, exmins) {
	      var domainSplit = document.domain.split(".");
	      var cookieDomain = domainSplit[domainSplit.length - 2] + "." + domainSplit[domainSplit.length - 1];
	      var exdate = new Date();
	      exdate.setMinutes(exdate.getMinutes() + exmins);
	      var c_value = encodeURI(value) + ((exmins == null) ? "" : ";expires=" + exdate.toUTCString() + "domain=." + cookieDomain + ";path=/");
	      document.cookie = c_name + "=" + c_value;
	    },
	
	    /**
	     * Renders a given template with data
	     * @param {String} str Template String
	     * @param {JSON} data JSON Data
	     * @returns {String}
	     */
	    template: function (str, data) {
	      if (!this.tmpl) {
	        /*
	         * JavaScript Templates 2.4.1
	         * https://github.com/blueimp/JavaScript-Templates
	         *
	         * Inspired by John Resig's JavaScript Micro-Templating:
	         * http://ejohn.org/blog/javascript-micro-templating/
	         */
	        var tmpl = function (str, data) {
	          var f = !/[^\w\-\.:]/.test(str) ? tmpl.cache[str] = tmpl.cache[str] ||
	            tmpl(tmpl.load(str)) :
	            new Function(
	              tmpl.arg + ',tmpl',
	              "var _e=tmpl.encode" + tmpl.helper + ",_s='" +
	                str.replace(tmpl.regexp, tmpl.func) +
	                "';return _s;"
	            );
	          return data ? f(data, tmpl) : function (data) {
	            return f(data, tmpl);
	          };
	        };
	        tmpl.cache = {};
	        tmpl.load = function (id) {
	          return document.getElementById(id).innerHTML;
	        };
	        tmpl.regexp = /([\s'\\])(?!(?:[^{]|\{(?!%))*%\})|(?:\{%(=|#)([\s\S]+?)%\})|(\{%)|(%\})/g;
	        tmpl.func = function (s, p1, p2, p3, p4, p5) {
	          if (p1) { // whitespace, quote and backspace in HTML context
	            return {
	              "\n": "\\n",
	              "\r": "\\r",
	              "\t": "\\t",
	              " ": " "
	            }[p1] || "\\" + p1;
	          }
	          if (p2) { // interpolation: {%=prop%}, or unescaped: {%#prop%}
	            if (p2 === "=") {
	              return "'+_e(" + p3 + ")+'";
	            }
	            return "'+(" + p3 + "==null?'':" + p3 + ")+'";
	          }
	          if (p4) { // evaluation start tag: {%
	            return "';";
	          }
	          if (p5) { // evaluation end tag: %}
	            return "_s+='";
	          }
	        };
	        tmpl.encReg = /[<>&"'\x00]/g;
	        tmpl.encMap = {
	          "<": "&lt;",
	          ">": "&gt;",
	          "&": "&amp;",
	          "\"": "&quot;",
	          "'": "\'"
	        };
	        tmpl.encode = function (s) {
	          /*jshint eqnull:true */
	          return (s == null ? "" : "" + s).replace(
	            tmpl.encReg,
	            function (c) {
	              return tmpl.encMap[c] || "";
	            }
	          );
	        };
	        tmpl.arg = "o";
	        tmpl.helper = ",print=function(s,e){_s+=e?(s==null?'':s):_e(s);}" + ",include=function(s,d){_s+=tmpl(s,d);}";
	
	        this.tmpl = tmpl;
	      }
	      return this.tmpl(str, data);
	    },
	
	    /**
	     * Checks the parameters on the script tag for any optional overrides
	     *
	     * @return {void}
	     */
	    initializeWithDataAttributes: function () {
	      var scripts = document.getElementsByTagName('script'),
	        dataAttributeMatrix = {
	          'data-id': 'containerId',
	          'data-useDefaultCss': 'useDefaultCss',
	          'data-isResponsive': 'isResponsive',
	          'data-callback': 'callbackFuncName',
	          'data-openLinksInNewWindow': 'openLinksInNewWindow',
	          'data-displayCookieWarning': 'displayCookieWarning',
	          'data-onRender': 'onRenderFuncName',
	          'data-includeSonyFont': 'includeSonyFont'
	        },
	        dataAttributeValue,
	        correspondingProperty,
	        thisScriptTag = null;
	
	      for (var i = 0; i < scripts.length; i++) {
	        if (scripts[i].src.indexOf("unifiedfooter.") >= 0) {
	          thisScriptTag = scripts[i];
	          break;
	        }
	        if (scripts[i].src.search("type=1384785453") >= 0) {
	          thisScriptTag = scripts[i];
	          break;
	        }
	      }
	      if (null == thisScriptTag) {
	        throw new Exception('Could not find unified footer script tag');
	      }
	
	      for (var dataAttributeName in dataAttributeMatrix) {
	        if (dataAttributeMatrix.hasOwnProperty(dataAttributeName)) {
	          correspondingProperty = dataAttributeMatrix[dataAttributeName];
	          dataAttributeValue = thisScriptTag.getAttribute(dataAttributeName);
	          this[correspondingProperty] = dataAttributeValue || this[correspondingProperty];
	        }
	      }
	    },
	
	    /**
	     * Loads the footer
	     *
	     * @return {void}
	     */
	    load: function () {
	      this.initializeWithDataAttributes();
	      this.loadFooterCssAndJs();
	      this.insert();
	    },
	
	    /**
	     * Inserts a CSS stylesheet into the document
	     *
	     * @param {String} css
	     * @return {void}
	     */
	    insertCss: function (css) {
	      var cssSheet = document.createElement('style');
	      cssSheet.type = 'text/css';
	      if (cssSheet.styleSheet) {
	        cssSheet.styleSheet.cssText = css;
	      } else {
	        cssSheet.appendChild(document.createTextNode(css));
	      }
	      this.head.appendChild(cssSheet);
	    },
	
	    /**
	     * Inserts the font family
	     *
	     * @return {void}
	     */
	    insertFont: function () {
	      var linkSheet = document.createElement('link');
	      linkSheet.rel = 'stylesheet';
	      if (BrowserDetect.browser === 'MSIE') {
	        linkSheet.href = '//www.playstationnetwork.com/typo3conf/ext/sonyswt_template/Resources/Public/build/deploy/fonts/fonts-eot.css';
	      } else {
	        var fontType = navigator.userAgent.match(/android|vita|playstation/gi) !== null ? 'ttf' : 'woff';
	        linkSheet.href = '//fonts.sony.net/shf/v6/b64-fonts-' + fontType + '.css';
	      }
	      this.head.appendChild(linkSheet);
	    },
	
	    /**
	     * Inserts a JS script into the document
	     *
	     * @param {String} js
	     * @return {void}
	     */
	    insertJs: function (js) {
	      var jsNode = document.createElement('script');
	      jsNode.type = 'text/javascript';
	      jsNode.text = js;
	      this.head.appendChild(jsNode);
	    },
	
	    /**
	     * Injects the footer's CSS into the document head
	     *
	     * @return {void}
	     */
	    loadFooterCssAndJs: function () {
	      // Add default styles, if not disabled
	      if ("1" !== this.useDefaultCss) {
	        return;
	      }
	      this.insertCss(this.baseCSS);
	      // Add responsive, if not disabled
	      if ("1" === this.isResponsive) {
	        this.insertCss(this.responsiveCSS);
	      }
	      // Add font
	      if ("1" === this.includeSonyFont) {
	        this.insertFont();
	      }
	    },
	
	    /**
	     * Creates the HTML
	     *
	     * @return {void}
	     */
	    buildCookieWarning: function () {
	      var openNewWindowHTML = "";
	      if (this.openLinksInNewWindow == "1") {
	        openNewWindowHTML = "_blank";
	      }
	
	      // Adding variable values to the footerJSON to be used in the template
	      this.footerJSON.openNewWindowHTML = openNewWindowHTML;
	
	      if (this.callbackFuncName) {
	        var callbackFunc = window[this.callbackFuncName],
	          returnValue = callbackFunc.call(this, this.defaultTemplate);
	
	        if (typeof returnValue === 'string') {
	          this.defaultTemplate = returnValue;
	        } else {
	          // Abort.
	          console.log('The parsed template is not valid. Aborted footer parsing.');
	          return;
	        }
	      }
	
	      // Parse template
	      var result;
	      try {
	        result = this.template(this.defaultTemplate, this.footerJSON);
	      } catch (e) {
	        // If the template string don't have space character which is unlikely, then the template will fail.
	        result = this.template('tmpl-error', e);
	      }
	
	      this.appendToHTMLString(result);
	
	      this.insertCookieWarningHTMLandEventHandler();
	    },
	
	    /**
	     * Computes a nodes height including box-shadow
	     * @param {Node} element
	     * @return {int}
	     */
	    getElementHeight: function (element) {
	      // Trouble is, that the cookie uses box-shadow which isn't included in getBoundingClientRect()
	      // Determining the elements true height need to take box-shadow into account.
	      // 1st value of matched values can be ignored since it positions the box-shadow horizontally
	      // The remaining values position the bs vertically and therefore need to be added
	      // but we need to transform them to positive numbers (neg. values mean position up/pos. values = pos down)
	      // Since the regEx ignores the minus in front of numbers we do not need to check for neg. values inside the loop.
	      // This is our box-shadow:
	      // rgba(0, 0, 0, 0.74902) 0px -1px 3px 0px
	      // .match(/(\dpx)/gim)
	      // ["0px", "1px", "3px", "0px"]
	      if (!(element instanceof Node)) {
	        return;
	      }
	      var elemHeight = element.getBoundingClientRect().height,
	        elemBoxShadow = getComputedStyle(element).getPropertyValue('box-shadow'),
	        elemBoxShadowMatch = elemBoxShadow.match(/(\dpx)/gim),
	        value,
	        sum = 0,
	        k;
	
	      for (k = 1; k < elemBoxShadowMatch.length; k++) {
	        value = parseFloat(elemBoxShadowMatch[k]);
	        sum += value;
	      }
	
	      return parseInt(elemHeight + sum);
	    },
	
	    /**
	     * Logic for the CookieWarning: inserts html and adds event handler
	     *
	     * @return {void}
	     */
	    insertCookieWarningHTMLandEventHandler: function () {
	      var that = this;
	      var cookieWarningMessage;
	      var cWMheight;
	
	      // Display cookie warning on first hit
	      if (this.footerJSON.labels.cookieWarningContent != undefined
	        && this.footerJSON.labels.cookieWarningContent != ""
	        && this.displayCookieWarning == "1"
	        && this.getCookie("cookieWarningMessageHasDisplayed") != "true") {
	
	        this.appendToHTMLString("<div id=\"cookieWarningMessage\">" + this.footerJSON.labels.cookieWarningContent + "<button type='button' class='cw_close'><span aria-hidden='true'>X</span></button></div>");
	
	        this.insertHTMLStringIntoDOM();
	        cookieWarningMessage = document.getElementById('cookieWarningMessage');
	
	        cWMheight = this.getElementHeight(cookieWarningMessage);
	        setTimeout(function () {
	          that.showCookieWarning(cookieWarningMessage, cWMheight);
	        }, 0);
	      } else {
	        this.insertHTMLStringIntoDOM();
	      }
	    },
	
	    /**
	     * Moves the Cookie Warning into the display
	     *
	     * @param {Node} cookieWarningMessage
	     * @param {int} cWMheight
	     * @returns {void}
	     */
	    showCookieWarning: function (cookieWarningMessage, cWMheight) {
	      var bottom = -cWMheight;
	      cookieWarningMessage.style.bottom = bottom + 'px';
	      cookieWarningMessage.style.left = '0px';
	
	      this.cWMclickHandler(cookieWarningMessage, cWMheight);
	
	      function moveWarningUp() {
	        bottom++;
	        cookieWarningMessage.style.bottom = bottom + 'px';
	        if (bottom === 0) {
	          clearInterval(id2);
	        }
	      }
	
	      var id2 = setInterval(moveWarningUp, 1000 / 60);
	    },
	
	    /**
	     * Removes the Cookie Warning by moving it out of the display
	     *
	     * @param {Node} cookieWarningMessage
	     * @returns {void}
	     */
	    removeCookieWarning: function (cookieWarningMessage) {
	      var bottom = 0,
	        cWMheight = this.getElementHeight(cookieWarningMessage);
	
	      function moveWarningDown() {
	        bottom--;
	        cookieWarningMessage.style.bottom = bottom + 'px';
	        if (bottom === -cWMheight) {
	          clearInterval(id);
	          cookieWarningMessage.style.display = 'none';
	        }
	      }
	
	      var id = setInterval(moveWarningDown, 10);
	      this.setCookie("cookieWarningMessageHasDisplayed", "true", (365 * 60 * 60));
	    },
	
	    /**
	     * Registers the event handler that removes the Cookie Warning
	     *
	     * @param {Node} cookieWarningMessage
	     * @param {int} cWMheight
	     * @returns {void}
	     */
	    cWMclickHandler: function (cookieWarningMessage, cWMheight) {
	      var that = this;
	      var cWMessage = cookieWarningMessage.getElementsByClassName('cw_close')[0];
	      cWMessage.onclick = function (e) {
	        that.removeCookieWarning(cookieWarningMessage);
	      };
	    },
	
	    htmlStr: '',
	    /**
	     * Build a html string that appends every html string that gets processed
	     *
	     * @param {Node} htmlStr
	     * @returns {void}
	     */
	    appendToHTMLString: function (htmlStr) {
	      this.htmlStr += htmlStr;
	    },
	
	    /**
	     * Inserts the htmlString into the DOM
	     *
	     * @returns {void}
	     */
	    insertHTMLStringIntoDOM: function () {
	      document.getElementById(this.containerId).innerHTML = this.htmlStr;
	    },
	
	    /**
	     * Inserts the footer
	     *
	     * @return {void}
	     */
	    insert: function () {
	      // data is injected by TYPO3; placed here because we otherwise get warnings all over the place because of syntax
	      this.footerJSON = {"service":{"title":"Services","id":"header_Services","list":[{"title":"PlayStation Store","link":"https:\/\/www.playstationnetwork.com\/en-gb\/store\/","target":"_blank","id":"footerLink_PSN"},{"title":"PlayStation Video","link":"https:\/\/www.playstationnetwork.com\/en-gb\/video\/","target":"_blank","id":"footerLink_VideoOnDemand"},{"title":"PlayStation Music","link":"https:\/\/www.playstationnetwork.com\/en-gb\/music\/","target":"_blank","id":"footerLink_MusicUnlimited"},{"title":"PlayStation Now","link":"https:\/\/www.playstation.com\/en-gb\/explore\/playstation-now\/","target":"_blank","id":"footerLink_PSNow"},{"title":"PlayStation Plus","link":"https:\/\/www.playstation.com\/en-gb\/explore\/playstation-plus\/","target":"_blank","id":"footerLink_PSPlus"}]},"account":{"title":"Account","id":"header_Account","list":[{"title":"Manage Account","link":"https:\/\/id.sonyentertainmentnetwork.com\/id\/management\/","target":"_blank","id":"footerLink_AccountManagement"},{"title":"My Media","link":"https:\/\/account.sonyentertainmentnetwork.com\/liquid\/login.action","target":"_blank","id":"footerLink_MyMedia"}]},"legal":{"title":"Legal","id":"header_Legal","list":[{"title":"Terms of Service","link":"https:\/\/www.playstationnetwork.com\/en-gb\/terms-of-service\/","target":"_blank","id":"footerLink_TermsOfService"},{"title":"Privacy Policy","link":"https:\/\/www.playstationnetwork.com\/en-gb\/privacy-policy\/","target":"_blank","id":"footerLink_PrivacyPolicy"},{"title":"Health Warning","link":"https:\/\/www.playstationnetwork.com\/en-gb\/health-warnings\/","target":"_blank","id":"5889be1d30d7b"},{"title":"Contact Us","link":"https:\/\/www.playstation.com\/footer\/about-us\/","target":"_blank","id":"footerLink_ContactUs"},{"title":"Ratings","link":"https:\/\/www.playstationnetwork.com\/en-gb\/ratings\/","target":"_blank","id":"footerLink_PSN"}]},"about":{"title":"Meta - About","id":"header_LearnMore","list":[{"title":"About Us","link":"https:\/\/www.playstation.com\/footer\/about-us\/","target":"_blank","id":"footerLink_AboutUs"},{"title":"Support","link":"https:\/\/www.playstation.com\/en-gb\/get-help\/help-library","target":"_blank","id":"footerLink_Support"}]},"social":{"title":"Social Media","id":"footerLink_SocialMedia","list":[{"title":"Twitter","link":"http:\/\/twitter.com\/PlayStationUK","target":"_blank","id":"footerLink_Twitter"},{"title":"Facebook","link":"https:\/\/www.facebook.com\/PlayStationAccess","target":"_blank","id":"footerLink_Facebook"},{"title":"Google+","link":"https:\/\/plus.google.com\/106749926655265456368\/posts","target":"_blank","id":"footerLink_GooglePlus"},{"title":"YouTube","link":"https:\/\/www.youtube.com\/user\/PlayStationAccess","target":"_blank","id":"footerLink_Youtube"}]},"sen":{"title":"PlayStation Network","id":"footerLink_SEN"},"labels":{"browserWarningContent":"","cookieWarningContent":""}};
	      this.buildCookieWarning();
	
	      if (this.onRenderFuncName) {
	        window[this.onRenderFuncName].call(this);
	      }
	    }
	  };
	
	  SNEIUnifiedFooter.load();
	})();
	