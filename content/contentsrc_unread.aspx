<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title>搜索 ~ 凤凰协同办公系统</title>
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
    <link href="/css/contentsrc_result.css" rel="stylesheet" />
    <link href="/css/dashboard_icon.css" rel="stylesheet" />
    <link href="/css/new/swiper.min.css" rel="stylesheet" />
    <script type="text/javascript">
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
    <link href="/portal/css/home.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />

    <script src="/content/video/zxf_page.js"></script>
    <style>
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
        #js_style_css_module_global_WB_outframe
        {
            height: 42px;
        }

        .tab_fix_bottom
        {
            position: absolute;
            bottom: 0px;
            top: auto;
        }

        .tab_fix
        {
            position: fixed;
        }

        .UG_list_b
        {
            height: 30px;
            line-height: 30px;
        }

        .list_title_b
        {
            font-size: 14px;
        }

        .time
        {
            float: right;
        }

        .loadings
        {
            display: none;
            border-radius: 5px;
            text-align: center;
            line-height: 34px;
            margin: 5px;
            background: #F1F1F1;
        }

            .loadings img
            {
                margin-left: 50%;
            }
            html{
                background-color:transparent;
            }
        .a_span {
            max-width:75%;
            display:inline-block;
            overflow:hidden;
            text-overflow:ellipsis;
            float:left;
            margin-right:5px;
            white-space:nowrap;
        }
        .red {
            font-weight:700;
            color:red;
            font-size:12px;
        }
        #plc_main{
            width:70%;
            margin-left:20%;
            margin-top:20px;
        }
        .WB_frame_c{
            width:100%;
        }
        .UG_list_b .list-skin{
            margin-top:10px;
        }
        #contentsearch {
            line-height: 30px;
        }
        .information_header_center{
            margin:5px 0 0 50px;
            text-align:center;
        }
        .information_header_center_input {
            padding: 0 0 0 25px;
            height: 34px;
            color: rgb(153, 153, 153);
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 500px;
        }
        .icon-sousuo1{
            top:auto;
            left:auto;
            margin-top:10px;
            margin-left:10px;
        }
        .left-table {
            border-right: 1px solid #dedede;
            overflow-y: auto;
            width: 10%;
        }
        .left-table1{
            height:auto;
            /*margin-top:104px;*/
            background:#fff;
            border-top:0;
            width: 14%;
        }
        #left-table{
            min-height:800px;
        }
        #column{
            /*font-size: 14px;
            font-weight: 700;*/
        }
        .UG_contents{
            width:86%;
            margin-left:14%;
            padding-top: 5px;
        }
        #plc_main {
            width: 80%;
            margin-left: 15%;
            margin-top: 20px;
        }
        #left-table1 li{
            padding-left:20px;
        }
       #paging{
            width: 333px;
            margin: 0 auto;
        }
       .top-location-left{
           cursor:pointer;
       }
       .is-important{
           color: #dc1111 !important;
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
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="" style="background: #F4F7FC;">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                       
                        <td id="bodyCell" class="oRight" style="background: #fff;">
                            <!-- Start page content table -->
                            <ul class="left-table" style="float:left;" id="left-table">
                            </ul>
                            <div id="plc_main">
                                <div id="plc_unlogin_home_main">
                                    <div class="information_header_center">
                                         <i class="iconfont icon-sousuo1"></i>
                                         <input type="" class="information_header_center_input" value="" id="contentsearch">
                                    </div>
                                    <div class="WB_frame_c">
                                        <div class="top-location">
                                            <div class="top-location-left"></div>
                                            
                                            <div class="top-location-right">
                                               <%-- <img src="/portal/img/12125.png" alt="Alternate Text" />
                                                <span>当前位置：</span>
                                                <span>首页</span>>
                                                <span class="location1name">行政规章制度</span>>
                                                <span class="location2name">行政管理</span>--%>
                                            </div>
                                        </div>
                                        <div id="pl_unlogin_home_feed">
                                            <!--榜单栏位置-->
                                            <%--<div class="UG_slider"></div>--%>
                                            <ul class="left-table left-table1" style="float:left;" id="left-table1"></ul>
                                            <div class="UG_contents" id="PCD_pictext_i_v5">
                                                <!--feed内容-->
                                                <ul class="pt_ul clearfix" id="div_content">
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>



                            <div class="clear"></div>
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
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
        <%--<div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>--%>
    </div>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script src="/js/CommonUtils.js"></script>

    
       <script type="text/javascript">
           getpage()
           function getpage() {
               ajaxMethodGetData('page.getlist', null, function (data) {
                   $('#left-table li').remove()
                   $('#left-table').append('<li class="" pageid="unread" id="unread">'
                                   + '    <a>'
                                   + '        <span class="">未读通知</span></a>'
                                   + '</li>')
                   for (var i = 0; i < data.rows.length; i++) {
                       var res = data.rows[i]
                       $('#left-table').append('<li title="' + res.Name + '" class="" pageid="' + res.ContentPageId + '">'
                                       + '    <a>'
                                       + '        <span class="">' + res.Name + '</span></a>'
                                       + '</li>')
                   }
                   $('#left-table li').eq(0).addClass('active')
                   $('#left-table li').click(function () {
                       $(this).addClass('active')
                       $(this).siblings().removeClass('active')
                       var pageid = $(this).attr('pageid')
                       if (pageid == 'unread') {
                           location.href = '/content/contentsrc_unread.aspx'
                       }
                       else {
                           window.location.href = '/content/contentsrc.aspx?t=PortalHome&pageid=' + pageid
                       }
                   })
                   $('#left-table li').each(function () {
                       if ($(this).find('span').html() == getQueryString('pageName')) {
                           $(this).addClass('active')
                       }
                   })
                   getcolumn()
               })
           }
           
           function getcolumn() {
               ajaxMethodGetData('tree.get&entity=noticetree', null, function (data) {
                   var height = $('#left-table').height()-104;
                   $('#left-table1').height(height);
                   $('#left-table1 li').remove()
                   $('#left-table1').append('<li class="" columnid="" id="column">'
                                   + '    <a>'
                                   + '        <span class="">全部</span></a>'
                                   + '</li>')
                   for (var i = 0; i < data.rows.length; i++) {
                       var res = data.rows[i]
                       $('#left-table1').append('<li title="' + res.text + '" class="" columnid="' + res.id + '">'
                                       + '    <a>'
                                       + '        <span class="">' + res.text + '</span></a>'
                                       + '</li>')
                   }
                   $('#left-table1 li').eq(0).addClass('active')
                   $('#left-table1 li').click(function () {
                       var columnid = $(this).attr('columnid')
                           $(this).addClass('active')
                           $(this).siblings().removeClass('active')
                           var folderId = $(this).attr("columnid");
                           window.data.FolderId = folderId
                           LoadInfo.contentList(0);                       
                   })
               })

           }



        var LikesNum = 0;
        var DataPageNumber = 0;
        var LoadDataSuccess = false;

        var folderId = "";
        var finished = 0;
        var parentId = getQueryString("parentid");
        var tokenStr = getQueryString("token");
        if (!tokenStr) { tokenStr = "" }

        LoadInfo = {
            init: function () {
                var _this = this;

            },

            bindClick: function () {
                //$('#leftNav a').click(function () {
                //    folderId = $(this).attr("valueid");
                //    window.data.FolderId = folderId
                //    //LikesNum = 0;
                //    $("#div_loading").hide();
                //    $('#div_content').html("");
                //    $('#leftNav a').removeClass('active')
                //    $(this).addClass('active')
                //    $('.location2name').html($(this).text())
                //    LoadInfo.contentList(0);
                //})
            },

            contentList: function (pageNumber) {
                if (pageNumber == 0) {
                    DataPageNumber = pageNumber;
                }
                
                window.data.rowsPerPage = 20
                window.data.pageNumber = pageNumber +1
                $.ajax({
                    url: window.url,
                    type: 'get',
                    data: window.data,
                    dataType: 'json',
                    async: true,
                    cache: false,
                    success: function (res) {
                        //Total
                        var search = getQueryString('search')
                        if (search) {
                            var data = {
                                rows: res.rows,
                                listData: res.rows,
                                total: res.total
                            }
                        } else {
                            var data = {
                                rows: res.rows,
                                listData: res.rows,
                                total: res.total
                            }
                        }
                        $('#div_content').html('');

                        if (data.rows != null && data.rows.length > 0) {

                            var totalPages = 0;
                            var pageHtml = '';
                            totalPages = Math.ceil(data.total / 20);

                            for (var i = 0; i < data.listData.length; i++) {
                                var res = data.listData[i]
                                if (res.createdOn) {
                                    var CreatedOn = res.createdOn
                                } else {
                                    var CreatedOn = res.CreatedOn
                                }
                                CreatedOn = CreatedOn.split(' ')[0]
                                var IsImportant = res.IsImportant

                                if (res.title) {
                                    var Title = res.title
                                } else {
                                    var Title = res.Title
                                }
                                if (res.contentId) {
                                    var ContentId = res.contentId
                                } else {
                                    var ContentId = res.ContentId
                                }
                                var location1name = '未读通知';
                                var location2name = res.FolderIdName;
                                if (IsImportant=='True') {
                                    $('#div_content').append('<li title="' + Title + '" class="UG_list_b">'
                                    + '<p class="list_title_b">'
                                    + '<i></i>'
                                    + '<div class="list-skin"></div>'
                                    + '<a class="S_txt1 is-important" href="/portal/viewArticle.aspx?id=' + ContentId + '&location1name=' + location1name + '&location2name=' + location2name + '"target="_blank"><span class="a_span">' + Title + '</span></a>'

                                    + '<span class="time">' + CreatedOn + '</span>'
                                    + '</p>'
                                + '</li>');
                                } else {
                                    $('#div_content').append('<li title="' + Title + '" class="UG_list_b">'
                                    + '<p class="list_title_b">'
                                    + '<i></i>'
                                    + '<div class="list-skin"></div>'
                                    + '<a class="S_txt1" href="/portal/viewArticle.aspx?id=' + ContentId + '&location1name=' + location1name + '&location2name=' + location2name + '"target="_blank"><span class="a_span">' + Title + '</span></a>'
                                    + '<span class="time">' + CreatedOn + '</span>'
                                    + '</p>'
                                + '</li>');
                                }
                            }
                            finished = 0;
                            $("#div_loading").hide();
                            LoadDataSuccess = true;
                            pageHtml = "<div id='paging' style='text-align:right;font-size:16px;'>";
                            pageHtml += "<a style='cursor:pointer;'><span onclick='LoadPrePageData();'>上一页</span></a>";
                            pageHtml += "<a style='cursor:pointer'><span style='margin:6px;' onclick='LoadNextPageData();'>下一页</span></a>";
                            pageHtml += "<span id='CurrentPageNumber'><span></span><input id='pageto'autocomplete='off' type='text'></span>";
                            pageHtml += "<span id='TotalPageNumber'></span>";
                            pageHtml += "</div>";
                            $('#div_content').append(pageHtml);

                            $('#pageto').keyup(function (e) {
                                if (e.keyCode == '13') {
                                    var page = $(this).val()
                                    LoadInfo.contentList(Number(page) - 1);
                                }
                            })

                            $('#CurrentPageNumber span').text("当前页：");
                            $('#CurrentPageNumber input').val(Number(Number(pageNumber) + 1));
                            $('#TotalPageNumber').text(" 总页数:" + totalPages);
                        } else {
                            LoadDataSuccess = false;
                        }
                    }
                });
            },

        };

        function LoadNextPageData() {
            if (DataPageNumber+1 < $('#TotalPageNumber').html().split(':')[1]) {
                DataPageNumber = DataPageNumber + 1;
                LoadInfo.contentList(DataPageNumber);
            }
            
            
        }

        function LoadPrePageData() {

            if (DataPageNumber - 1 >= 0)
                LoadInfo.contentList(DataPageNumber - 1);

            if (LoadDataSuccess && (DataPageNumber - 1) >= 0)
                DataPageNumber = DataPageNumber - 1;
        }
        var url = ''
        var data = {}
        $(document).ready(function () {
            var search = getQueryString('search')
            url = '/apps/CommandProcessor.ashx?cmd=content.unread.search'
            window.data = {
                title_filter: search,
            }
            $('.top-location-left').html('栏目')
            //window.data.FolderId = $('#left-table1 li').eq(0).attr('columnid')
            LoadInfo.contentList(0);
            $('.top-location-left').click(function () {
                $('#left-table1 li').removeClass('active')
                $('#left-table1 li').eq(0).addClass('active')
                window.data.FolderId = '';
                LoadInfo.contentList(0);
            })
        });
        $('#contentsearch').change(function () {
            var search = $(this).val()
            window.data.title_filter = search
            LoadInfo.contentList(0);
        })
    </script>
</body>
</html>
