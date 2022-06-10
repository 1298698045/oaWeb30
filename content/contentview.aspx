<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contentview.aspx.cs" Inherits="Supermore.content.contentview" %>


<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title></title>
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
    <link href="/css/contentview.css" rel="stylesheet" />
    <%--<link href="/css/contentsrc_result.css" rel="stylesheet" />--%>
    <link href="/css/dashboard_icon.css" rel="stylesheet" />
    <link href="/css/new/swiper.min.css" rel="stylesheet" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/js/swiper.min.js"></script>

    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/jq.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/js/DashboardViewHome.js"></script>
    <link href="/content/video/zxf_page.css" rel="stylesheet" />
    <script src="/content/video/zxf_page.js"></script>
    <style>
        body {
            margin: 0!important;
        }

        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
    </style>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.198', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=/home/home.jsp');</script>
     <script src="/survey/js/tools.js"></script>
    <script src="/content/contentview.js"></script>
</head>
<!--hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr
        hasMotif homeTab homepage ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr
        -->
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload=""
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
            <%--<uc1:TopRight ID="TopRight1" runat="server" />--%>
            <%--<uc1:MainNav ID="MainNav1" runat="server" />--%>
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" style="border-top: 0;">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="" style="background: #F4F7FC;">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td id="bodyCell" class="oRight" style="background: #fff; padding: 0 163px;">
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <script type="text/javascript">
                                function onLoadSelector() { /* CustomReportSelector.java injects a call to nonexistent onLoadSelector see Bug W-1599971 */ }
                            </script>


                            <%--content start--%>

                            <div class="catelist">
                                <div>
                                    <%--style="padding: 20px 60px;"--%>
                                    <p class="view_title">
                                        <span class="view_index"><a href="/home/home.aspx">首页</a>&nbsp;/&nbsp;</span>
                                        <span class="view_index"><a href="/content/catelist.aspx">新闻中心</a>&nbsp;/&nbsp;</span>
                                        <span class="view_new">正文</span>
                                    </p>
                                    <p class="catelist_title"></p>
                                    <div class="catelist_Remarks">
                                        <span class="catelist_label contentTitle"></span>
                                        <span class="catelist_img">
                                            <img alt="" src="/img/Avatar.png" /></span>
                                        <span class="catalist_people contentAutor"></span>
                                        <span>·</span>
                                        <span class="catalist_department contentDepatName"></span>
                                        <span>·</span>
                                        <span class="catalist_comment contentCommentCount"></span>
                                        <span>评论</span>
                                        <span>·</span>
                                        <span class="catalist_read contentReadCount"></span>
                                        <span>阅读</span>
                                        <span>·</span>
                                        <span class="catalist_date contentDate"></span>
                                    </div>
                                    <div  class="cate_content">
                                    </div>
                                    <div class="attachmentsContainor">
                                        <div class="cate_content_Remarks">
                                            <div class="cate_content_title">附件:</div>
                                            <div id="attachments" style="display:inline-block;"></div>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="cate_content_Remarks">
                                            <span class="cate_content_title">相关标签:</span>
                                            <div class="cate_content_labels" style="display:inline-block;"></div>
                                        </div>
                                        <div class="cate_content_annex" style="width:190px;margin:0 auto;">
                                            <div class="cate_content_annex_like">
                                                <span class="iconfont icon-zan"></span>
                                                <span class="likeCount"></span>
                                            </div>
                                            <div class="cate_content_annex_dislike">
                                                <span class="iconfont icon-lajigarbage5"></span>
                                                <span class="dislikeCount"></span>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="cate_contentComment">
                                            <div class="cate_contentComment_img">
                                                <img src="/img/Avatar.png" alt="Alternate Text" />
                                            </div>
                                            <div style="width: 92%; float: right; position: relative;">
                                                <input type="type" class="cate_contentComment_input" placeholder="写下您的评论..." />
                                                <div class="cate_contentComment_btn">评论</div>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="comment_list" id="comment">
                                            <ul class="comment_list_ul">
                                                <li class="comment_list_ul_item comment_list_ul_item_active">评论<span class="comment_list_ul_item_num"></span></li>
                                                <li class="comment_list_ul_item">阅读<span class="read_list_ul_item_num"></span></li>
                                                <li class="clear"></li>
                                            </ul>
                                            <div>
                                                <div class="comment_list_cont" style="display: block;">
                                                    <ul class="comment_list_cont_ul">

                                                    </ul>
                                                    
                                                    <div class="look_more look_morecomment">
                                                        查看更多评论
                                                    </div>
                                                </div>

                                                <div class="comment_list_cont">

                                                    <ul class="read_list_cont_ul">

                                                    </ul>

                                                    <div class="look_more look_moreReader">
                                                        查看更多读者
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="catelists">
                                <div class="catelists_title">最新</div>
                                <ul class="catelists_ul catelists_ul_latest">
                                    
                                </ul>

                                <div class="catelists_title">推荐相关</div>
                                <ul class="catelists_ul _related catelists_ul_related">
                                    
                                </ul>
                            </div>
                            <div id="top" style="display: none;">
                                <div class="Gotop">
                                    <img src="/img/top.png" alt="Alternate Text" />
                                </div>
                                <div class="Gocomment">
                                    <a href="#comment" style="display: block;">
                                        <img src="/img/comment.png" alt="Alternate Text" />
                                    </a>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <%--content end--%>
                            <script type="text/javascript">
                                
                                var height = $(window).height() - 500;
                                //scroll() 方法为滚动事件
                                $(window).scroll(function () {
                                    if ($(window).scrollTop() > height) {
                                        $("#top").fadeIn(500);
                                    } else {
                                        $("#top").fadeOut(500);
                                    }
                                });
                                $(document).ready(function () {
                                    var nScrollHight = 0; //滚动距离总长(注意不是滚动条的长度)
                                    var nScrollTop = 0;   //滚动到的当前位置
                                    var nDivHight = $("#div1").height();
                                    $("#div1").scroll(function () {
                                        nScrollHight = $(this)[0].scrollHeight;
                                        nScrollTop = $(this)[0].scrollTop;
                                        if (nScrollTop + nDivHight >= nScrollHight)
                                            alert("滚动条到底部了");
                                    });
                                });
                                $(".Gotop").click(function () {
                                    $('body,html').animate({ scrollTop: 0 }, 100);
                                    return false;
                                });
                            </script>

                            <!-- Body events -->
                            <script type="text/javascript">
                                function bodyOnLoad() {
                                    
                                    if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                    if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                                    if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };
                                    Sfdc.Cookie.deleteCookie('setupopen'); Sfdc.Cookie.deleteCookie('roleopen');;

                                    if (this.loadChatFrameJs) loadChatFrameJs();
                                    SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                    new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    SfdcApp.MruHovers.global_data.url = 'retURL=/home/home.aspx&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1410773133280';

                                    if (document.getElementById('sidebarDiv')) {
                                        Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                    };

                                    getUnreadEmailQty(updateUnreadEmailQty)
                                   
                                }
                                function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                                function bodyOnFocus() { closePopupOnBodyFocus(); }
                                function bodyOnUnload() { }
                                function updateUnreadEmailQty(data) {
                                    jQuery("#unreadMails").html("（" + data.unread + "）");
                                }
                            </script>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%--<cc1:PageFooter ID="SiteFooter1" runat="server" />
        <div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>--%>
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>

