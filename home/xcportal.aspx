<%@ Page Language="C#"%>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
   
    <script src="/static/js/perf/stub.js"></script>
    <cc1:PageTitle ID="PageTitle1" ResourceKey="Home" runat="server" />
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/homeCalendar.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/dashboard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/dashboardViewCommon.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/ChatterFiles.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/OnboardingSplash.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/WalkthroughCoreUI.css">
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/jq.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/js/DashboardViewHome.js"></script>
    <link href="/css/new/swiper.min.css" rel="stylesheet" />
    <link href="/css/newsHome.css" rel="stylesheet" type="text/css" />
    
    <style>
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
        .selted table {
            table-layout: fixed;
        }
        .selted .listItem {
            width:80%;
        }
        .selted .listItem a{
            width:100%;
            display:inline-block;
            overflow:hidden;
            text-overflow:ellipsis;
        }
        .content-item{
            padding:10px;
            box-sizing:border-box;
            margin:10px 0;
        }
        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color:#000;
            margin: 0;
            padding: 0;
        }
        #content1{
            width:330px;
            padding:10px;
        }
        .swiper-slide{
            height:auto;
            width:310px;
        }
        .swiper-slide img{
            height:248px;
            width:310px;
            margin:0;
        }
        .swiper-title{
            background-color:#f6f7f8;
            text-align:center;
            line-height:30px;
        }
        .zen .zen-tabMenu a{
            font-size:13px;
        }
        .swiper-container{
            width:310px;
            height:auto;
        }
        *{
            margin:0;
            padding:0;
        }
        .optT ul,.optT li{
            list-style:none;
        }
        .optCnt ul li{
            display:block;
            margin-left:0;
            line-height:24px;
            color:#999;
        }
        .listItem .name{
            color:#323434;
        }
        .listItem .name:hover{
            color:#0065ce;
            cursor:pointer;
        }
        .listItem .name{
            width:60%;
            overflow:hidden;
            display:block;
            float:left;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        .listItem .time{
            float:left;
            width:20%;
            text-align:right;
            overflow:hidden;
            display:block;
            text-overflow:ellipsis;
            white-space:nowrap;
            padding-right:10px;
            box-sizing:border-box;
        }
        #bodyCell{
            min-width:950px;
        }
        .listItem .dept{
            float:left;
            text-align:center;
            width:20%;
            overflow:hidden;
            display:block;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        .optCnt-item img{
            width:200px;
            height:200px;
            margin-top:10px;
        }
        .optCnt-item{
            float:left;
            width:200px;
            margin:0 10px;
        }
        #content5 .optCnt{
            overflow:hidden;
        }
        .optCnt-item .swiper-title{
            width:200px;
            text-align:center;
            overflow:hidden;
            display:block;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        a{
            text-decoration:none;
        }
    </style>
</head>

<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
    <script type="text/javascript">
        var secondsLeftValue = 7196, secondsPopupValue = 7166, lastPageActivityTime = (new Date).getTime(), forceLogout = false;
        function startSessionTimer() { schedulePopup(7166) }
        function schedulePopup(a) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); timeoutUniqueId = setTimeout(alertTimeout, 1E3 * a) }
        function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null;
        function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } }
        function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() }
        function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.aspx?sfdc.setJsDomain=1", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus }
        function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&amp;startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) }
        function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }
    </script>
    <a class="navSkipLink zen-skipLink zen-assistiveText" href="#skiplink">跳到主内容</a>
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="outer">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                            <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                        </td>
                        <td id="bodyCell" class="oRight">
                            <div id="main-content">
                                <table style="width:100%;table-layout:fixed;">
                                    <tr>
                                        <td width="330px">
                                            <div class="content-item" id="content1" style="padding-top:30px;">
                                                <div class="mod06-cont" style="height:190px;">
                                <ins class="sinaads sinaads-done" data-ad-pdps="PDPS000000045976" data-ad-status="done" style="display: block; overflow: hidden; text-decoration: none;">
                                <ins style="text-decoration: none; margin: 0px auto; width: 310px; display: block; position: relative; overflow: hidden;">
                                    <iframe width="310" height="240" frameborder="0" marginwidth="0" marginheight="0" vspace="0"
                                        hspace="0" allowtransparency="true" scrolling="no" src="focuspic.html"></iframe>
                                </ins>
                            </ins>
                                                <%--<div class="swiper-container">
                                                    <div class="swiper-wrapper">
                                                        <div class="swiper-slide">
                                                            <img src="/img/images/Image.png"/>
                                                            <div class="swiper-title">海淀区妇幼保健院人事档案整理及专项审核技术</div>
                                                        </div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                        <div class="swiper-slide"></div>
                                                    </div>
                                                </div>--%>
                                            </div>
                                        </td>
                                        <td colspan="2">
                                            <div class="content-item" id="content2">
                                                <div class="content-item-nav">
                                                    <div class="option">
                                                        <div class="optRight"> 
                                                            <a href="/content/catelist.aspx?t=home&contentTypeCode=1&objectTypeCode=100201&parentId=f7a5114f-0075-48b3-b7cb-58d6cf511369" target="_blank" class="bLink">更多</a>

                                                        </div>
                                                        <div class="optT"> 
                                                            <ul> 
                                                                <li class="cur last" id="79245B03-BC52-4FCB-9912-89E34F4AB968">科室投稿</li> 
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="optCnt">
                                                        <ul>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                

                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td colspan="2">
                                            <div class="content-item" id="content3">
                                                <div class="content-item-nav">
                                                    <div class="option">
                                                        <div class="optRight"> 
                                                            <a href="/content/catelist.aspx?t=home&contentTypeCode=1&objectTypeCode=100201&parentId=f7a5114f-0075-48b3-b7cb-58d6cf511369" target="_blank" class="bLink">更多</a>

                                                        </div>
                                                        <div class="optT"> 
                                                            <ul> 
                                                                <li class="cur last" id="94E77FF4-89FF-4EE4-811A-18DC589042FA">媒体报道</li> 
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="optCnt">
                                                        <ul>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="content-item" id="content4">
                                                <div class="content-item-nav">
                                                    <div class="option">
                                                        <div class="optRight"> 
                                                            <a href="/content/catelist.aspx?t=home&contentTypeCode=1&objectTypeCode=100201&parentId=f7a5114f-0075-48b3-b7cb-58d6cf511369" target="_blank" class="bLink">更多</a>

                                                        </div>
                                                        <div class="optT"> 
                                                            <ul> 
                                                                <li class="cur" id="0EDDEF8D-4300-4513-90CE-0BF23C9D914C">医院动态</li> 
                                                                <li class="" id="D2942263-AFB7-4404-AD34-D1837C6312C3">科普宣传</li>  
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="optCnt">
                                                        <ul>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                            <li class="listItem">
                                                                <span class="name">通知公告海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术海淀区妇幼保健院人事档案整理及专项审核技术</span>
                                                                <span class="dept">临床科室</span>
                                                                <span class="time">0123-01-25</span>                                                                
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="content-item" id="content5">
                                                <div class="content-item-nav">
                                                    <div class="option">
                                                        <div class="optRight"> 
                                                            <a href="/content/catelist.aspx?t=home&contentTypeCode=1&objectTypeCode=100201&parentId=f7a5114f-0075-48b3-b7cb-58d6cf511369" target="_blank" class="bLink">更多</a>

                                                        </div>
                                                        <div class="optT"> 
                                                            <ul> 
                                                                <li class="cur" id="A2EF6BDA-AFE5-409E-8D10-5F7A1AAF3027">院内信息周报</li> 
                                                                <li class=""id="CF80C57B-98CF-486A-9AC1-79AA83733640">海妇支部简报</li> 
                                                                <li class="" id="AB396365-EA4E-441D-B7DD-0750FBF54C43">海淀妇幼报</li> 
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="optCnt">
                                                        <div class="optCnt-item">
                                                            <img src="/img/images/02.1.1-1.Image.png"/>
                                                            <div class="swiper-title">海淀区妇幼保健院人事档案整理及专项审核技术</div>
                                                        
                                                        </div>
                                                        <div class="optCnt-item">
                                                            <img src="/img/images/02.1.1-1.Image.png"/>
                                                            <div class="swiper-title">海淀区妇幼保健院人事档案整理及专项审核技术</div>
                                                        
                                                        </div>
                                                        <div class="optCnt-item">
                                                            <img src="/img/images/02.1.1-1.Image.png"/>
                                                            <div class="swiper-title">海淀区妇幼保健院人事档案整理及专项审核技术</div>
                                                        
                                                        </div>
                                                        <div class="optCnt-item">
                                                            <img src="/img/images/02.1.1-1.Image.png"/>
                                                            <div class="swiper-title">海淀区妇幼保健院人事档案整理及专项审核技术</div>
                                                        
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>






    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <link href="/css/attendClock.css" rel="stylesheet" />
    <script src="/js/CommonUtils.js"></script>
    <script src="/js/attendClock.js"></script>
    <script src="/js/swiper3.js"></script>
    <script>
        var swiper = new Swiper('.swiper-container');
        
            
        getdata('79245B03-BC52-4FCB-9912-89E34F4AB968')
        getdata('94E77FF4-89FF-4EE4-811A-18DC589042FA')
        getdata('0EDDEF8D-4300-4513-90CE-0BF23C9D914C')
        getdata('A2EF6BDA-AFE5-409E-8D10-5F7A1AAF3027')
        function getdata(folderId) {
            ajaxMethodGetData('hd.publicity.content.list', {
                folderId: folderId,
                pageSize: 100
            }, function (data) {
                var html = '<ul>'
                for (var i = 0; i < data.rows.length; i++) {
                    var res = data.rows[i]
                    if (folderId == 'AB396365-EA4E-441D-B7DD-0750FBF54C43' || folderId == 'CF80C57B-98CF-486A-9AC1-79AA83733640' || folderId == 'A2EF6BDA-AFE5-409E-8D10-5F7A1AAF3027') {
                        if (i < 5) {
                            html += '<div class="optCnt-item"><a href="/Portal/viewArticle.aspx?id=' + res.id + '" target="' + res.contentId + '">'
                                    + '<img src="' + res.linkUrl + '">'
                                    +'<div class="swiper-title" title="'+res.name+'">'+res.name+'</div>'
                                    +'</a></div>'
                        }
                    } else {
                        html += '<li class="listItem">'
                    + '    <span class="name"><a title="' + res.name + '" target="' + res.contentId + '" href="/Portal/viewArticle.aspx?id=' + res.contentId + '">' + res.name + '</a></span>'
                    + '    <span class="dept">' + res.businessUnitName + '</span>'
                    + '    <span class="time">' + res.createdOn + '</span>'
                    + '</li>'
                    }
                }
                html += '</ul>'
                $('#' + folderId).parents('.content-item').find('.optCnt').html(html)
            })
        }
        $('.optT li').click(function () {
            getdata($(this).attr('id'))
        })
    </script>
</body>
</html>
