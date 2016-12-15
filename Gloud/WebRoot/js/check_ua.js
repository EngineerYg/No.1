function mobile_device_detect(url) {
    var thisOS = navigator.platform;
    var os = new Array("iPhone", "iPod", "iPad", "android", "Nokia", "SymbianOS", "Symbian", "Windows Phone", "Phone", "Linux armv71", "MAUI", "UNTRUSTED/1.0", "Windows CE", "BlackBerry", "IEMobile");
    for (var i = 0; i < os.length; i++) {
        if (thisOS.match(os[i])) {
            window.location = url;
            return true;
        }
    }
    if (navigator.platform.indexOf('iPad') != -1) {
        window.location = url;
        return true;
    }
    var check = navigator.appVersion;
    if (check.match(/linux/i)) {
        if (check.match(/mobile/i) || check.match(/X11/i)) {
            window.location = url;
            return true;
        }
    }
    Array.prototype.in_array = function (e) {
        for (i = 0; i < this.length; i++) {
            if (this[i] == e)
                return true;
        }
        return false;
    }
    return false;
}

function sw_check_jump() {
    var userAgent = navigator.userAgent,
        rMsie = /(msie\s|trident.*rv:)([\w.]+)/,
        rFirefox = /(firefox)\/([\w.]+)/,
        rOpera = /(opera).+version\/([\w.]+)/,
        rChrome = /(chrome)\/([\w.]+)/,
        rSafari = /version\/([\w.]+).*(safari)/;

    function uaMatch(ua) {
        var match = rMsie.exec(ua);
        if (match != null) {
            return {browser: "IE", version: match[2] || "0"};
        }
        var match = rFirefox.exec(ua);
        if (match != null) {
            return {browser: match[1] || "", version: match[2] || "0"};
        }
        var match = rOpera.exec(ua);
        if (match != null) {
            return {browser: match[1] || "", version: match[2] || "0"};
        }
        var match = rChrome.exec(ua);
        if (match != null) {
            return {browser: match[1] || "", version: match[2] || "0"};
        }
        var match = rSafari.exec(ua);
        if (match != null) {
            return {browser: match[1] || "", version: match[2] || "0"};
        }
        if (match != null) {
            return {browser: "", version: "0"};
        }
    }

    function browserSupport(userAgent) {
        // 判断浏览器版本
        var browserMatch = uaMatch(userAgent.toLowerCase());
        if (browserMatch.browser) {
            browser = browserMatch.browser;
            version = browserMatch.version;
        }
        if (browserMatch.version == "0")
            browserMatch.version = "未知";

        // 判断浏览器类型，以及是否支持
        var ret = {support: false, name: "未知浏览器", ver: browserMatch.version, suggestion: "暂不支持该浏览器。"};
        if (userAgent.toLowerCase().indexOf('edge/') >= 0) {
            ret.name = "微软Edge浏览器";
            ret.support = true;
            ret.suggestion = "";
            return ret;
        }
        else if ($.ua().isSougou) {
            ret.name = "搜狗浏览器";
            if ($.ua().isWebkit) {
                ret.name += "（Chrome核心）";
                ret.support = true;
                ret.suggestion = "";
            }
            else {
                ret.name += "（IE核心）";
                ret.suggestion += "请点击地址栏右侧的图标切换到高速模式。";
            }
            return ret;
        }
        else if ($.ua().is360se) {
            ret.name = "360安全浏览器";
            if ($.ua().isWebkit) {
                ret.name += "（Chrome核心）";
                ret.support = true;
                ret.suggestion = "";
            }
            else {
                ret.name += "（IE核心）";
                ret.suggestion += "请点击地址栏右侧的图标切换到极速模式。";
            }
            return ret;
        }
        else if ($.ua().is360ee) {
            ret.name = "360极速浏览器";
            if ($.ua().isWebkit) {
                ret.name += "（Chrome核心）";
                ret.support = true;
                ret.suggestion = "";
            }
            else {
                ret.name += "（IE核心）";
                ret.suggestion += "请点击地址栏右侧的图标切换到极速模式。";
            }
            return ret;
        }
        else if ($.ua().isFirefox) {
            ret.name = "火狐浏览器（Firefox）";
            ret.support = true;
            ret.suggestion = "";
            return ret;
        }
        else if ($.ua().isLiebao) {
            ret.name = "猎豹浏览器（Chrome核心）";
            ret.support = true;
            ret.suggestion = "";
            return ret;
        }
        else if ($.ua().isIe) {
            ret.name = "IE浏览器";
            ret.ver = $.ua().ie; // 这个IE版本检测更准确
            if ($.ua().ie >= 10) {
                ret.support = true;
                ret.suggestion = "";
            }
            else
                ret.suggestion += "请换用下方推荐的其他浏览器。如果您使用的是360或搜狗浏览器，请点击地址栏右侧的图标切换到极速模式。";
            return ret;
        }
        else if ($.ua().isChrome) {
            ret.name = "谷歌Chrome浏览器";
            ret.support = true;
            ret.suggestion = "";
            return ret;
        }
        else if ($.ua().isWebkit) {
            ret.name = "未知浏览器（Webkit核心）";
            ret.support = true;
            ret.suggestion = "";
            return ret;
        }
        ret.suggestion += "请换用下方推荐的其他浏览器。";
        return ret;
    }

    var ret = browserSupport(userAgent);
    if (!ret.support) {
        var now_url = window.location.href;
        if (now_url.indexOf("user/explorer") < 0) {
            location.href = '/index.php/user/explorer';
        }
    }
}

if (!mobile_device_detect("http://m.gloud.cn/"))
    sw_check_jump();
