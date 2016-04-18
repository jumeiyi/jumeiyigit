/// <reference path="../fancyapps-fancyBox/lib/jquery.mousewheel-3.0.6.pack.js" />
/// <reference path="../fancyapps-fancyBox/source/jquery.fancybox.js" />
/// <reference path="../fancyapps-fancyBox/source/jquery.fancybox.js" />
/// <reference path="../jumidialog/popup.js" />


; (function ($) {
    $.Frame = function () {   
    }
    $.Frame.Config = {};

    FrameNameSpace = $.Frame;
    if (typeof js == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/js.Util/js.lang.Class.min.js'></script>");
        document.write("<script language=javascript src='Scripts/FrameJs/js.Util/js.events.EventDispatcher.min.js'></script>");
        document.write("<script language=javascript src='Scripts/FrameJs/js.Util/js.util.ArrayList.min.js'></script>");
        document.write("<script language=javascript src='Scripts/FrameJs/js.Util/js.util.Dictionary.min.js'></script>");
    }

    if (typeof $.fn.ajaxSubmit == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/jquery.form.min.js'></script>");
    }

    if (typeof FrameNameSpace.ExceptionProcess == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/frame.exception.min.js'></script>");
    }
    if (typeof FrameNameSpace.Control == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/frame.control.min.js'></script>");
    }
    if (typeof FrameNameSpace.Validation == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/configs/validation.config.js'></script>");
        document.write("<script language=javascript src='Scripts/FrameJs/frame.validation.min.js'></script>");
    }
    if (typeof FrameNameSpace.Ajax == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/frame.ajax.js'></script>");
    }

    if (typeof FrameNameSpace.Message == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/configs/message.config.js'></script>");
        document.write("<script language=javascript src='Scripts/FrameJs/frame.message.js'></script>");
    }
    if (typeof FrameNameSpace.Bind == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/frame.bind.js'></script>");
    }
    if (typeof FrameNameSpace.Constant == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/configs/constant.config.js'></script>");
    }
    ////jquery ui
    //if (typeof $.ui == "undefined") {
    //    document.write("<script type='text/javascript' src='/Scripts/jquery-ui-1.11.2.min.js'></script>");
    //    document.write("<link type='text/css' rel='stylesheet' href='/css/jquery-ui-1.11.2.min.css' />")
    //}
    ////dialog
    //if (typeof dialog == "undefined") {
    //    document.write("<script language=javascript src='/Scripts/dialog.min.js'></script>");
    //}
    if (typeof $.popup == "undefined") {
        document.write("<script language=javascript src='Scripts/jumidialog/popup.js'></script>");
        document.write("<link type='text/css' rel='stylesheet' href='Scripts/jumidialog/popup.css' />")
    }
    //if (typeof $.popwindow == "undefined") {
    //    document.write("<script language=javascript src='../../Scripts/jumidialog/popwindow.js'></script>");
    //    document.write("<link type='text/css' rel='stylesheet' href='../../Scripts/jumidialog/popwindow.css' />")
    //}
    if (typeof $.fancybox == "undefined") {
        document.write("<script src='Scripts/fancyapps-fancyBox/source/jquery.fancybox.pack.js?v=2.1.5'></script>");
        document.write("<script src='Scripts/fancyapps-fancyBox/lib/jquery.mousewheel-3.0.6.pack.js'></script>");
        document.write("<link type='text/css' rel='stylesheet' href='Scripts/fancyapps-fancyBox/source/jquery.fancybox.css?v=2.1.5' />")
    }
    if (typeof $.attrchange == "undefined") {
        document.write("<script language=javascript src='Scripts/FrameJs/attrchange.min.js'></script>");
    }
}(jQuery));

String.format = function () {
    if (arguments.length == 0)
        return null;
    var str = arguments[0];
    for (var i = 1; i < arguments.length; i++) {
        var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
        str = str.replace(re, arguments[i]);
    }
    return str;
};


String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
}

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return "";
}
/**       
 * 对Date的扩展，将 Date 转化为指定格式的String       
 * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q) 可以用 1-2 个占位符       
 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)       
 * eg:       
 * (new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423       
 * (new Date()).format("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04       
 * (new Date()).format("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04       
 * (new Date()).format("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04       
 * (new Date()).format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18       
 */
Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份           
        "d+": this.getDate(), //日           
        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时           
        "H+": this.getHours(), //小时           
        "m+": this.getMinutes(), //分           
        "s+": this.getSeconds(), //秒           
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度           
        "S": this.getMilliseconds() //毫秒           
    };
    var week = {
        "0": "/u65e5",
        "1": "/u4e00",
        "2": "/u4e8c",
        "3": "/u4e09",
        "4": "/u56db",
        "5": "/u4e94",
        "6": "/u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}
/* 得到日期年月日等加数字后的日期 */
Date.prototype.dateAdd = function (interval, number) {
    var d = this;
    var k = { 'y': 'FullYear', 'q': 'Month', 'm': 'Month', 'w': 'Date', 'd': 'Date', 'h': 'Hours', 'n': 'Minutes', 's': 'Seconds', 'ms': 'MilliSeconds' };
    var n = { 'q': 3, 'w': 7 };
    eval('d.set' + k[interval] + '(d.get' + k[interval] + '()+' + ((n[interval] || 1) * number) + ')');
    return d;
}
/* 计算两日期相差的日期年月日等 */
Date.prototype.dateDiff = function (interval, objDate2) {
    var d = this, i = {}, t = d.getTime(), t2 = objDate2.getTime();
    i['y'] = objDate2.getFullYear() - d.getFullYear();
    i['q'] = i['y'] * 4 + Math.floor(objDate2.getMonth() / 4) - Math.floor(d.getMonth() / 4);
    i['m'] = i['y'] * 12 + objDate2.getMonth() - d.getMonth();
    i['ms'] = objDate2.getTime() - d.getTime();
    i['w'] = Math.floor((t2 + 345600000) / (604800000)) - Math.floor((t + 345600000) / (604800000));
    i['d'] = Math.floor(t2 / 86400000) - Math.floor(t / 86400000);
    i['h'] = Math.floor(t2 / 3600000) - Math.floor(t / 3600000);
    i['n'] = Math.floor(t2 / 60000) - Math.floor(t / 60000);
    i['s'] = Math.floor(t2 / 1000) - Math.floor(t / 1000);
    return i[interval];
}
//调用：fmoney("12345.675910", 3)，返回12,345.676 
function fmoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
    r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}


