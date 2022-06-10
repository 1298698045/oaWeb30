<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>新建流程: 流程关联 ~ 高效协同 - 协同办公系统</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <!--<link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css" rel="stylesheet" type="text/css" />-->
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-09-25 下午3:21", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-MM-dd ah:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/Business.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <link href="/css/extended.css" rel="stylesheet" type="text/css" />

    <script src="/layui/layui/layui.js"></script>
    <link href="/layui/layui/css/layui.css" rel="stylesheet" />
    <style>
        #mycomments span{
            font-weight:400 !important;
        }
        .subNav a {
            margin-left:20px !important
        }
        .layui-tab-brief>.layui-tab-title .layui-this{
             color:#1E9FFF;
         }
         .layui-tab-brief>.layui-tab-more li.layui-this:after, .layui-tab-brief>.layui-tab-title .layui-this:after {
            border-bottom: 2px solid #1E9FFF;
        }
        .layui-tab{
            margin:0;
            margin-bottom:20px;
        }
        .left-nav-head{
            color:#0085c7;
            font-weight:700;
            line-height:30px;
            padding-left:20px;
        }
        .left-nav-item{
            height:32px;
            line-height:32px;
            padding:0 20px;
            cursor:pointer;
        }
        .left-nav-item.active{
            background-color: #1E9FFF;
            border-left: 3px solid rgba(0, 112, 210, 1.0);
        }
        .left-nav-body{
            padding:10px 0;
            border-top:1px solid #dedede;
        }
        .left-nav{
            float:left;
            width:215px;
        }
        .left-nav-item.active{
            border-left:3px solid #1E9FFF;
            background-color:rgba(0, 112, 210, 0.1);
        }
        .right-content{
            margin-left:220px;
            margin-top:10px;
            overflow:hidden;
        }
        .row-content{
            float:left;
            width:24%;
            margin-left:1%;
        }
        .item-content{
            background-color:#f5f5f5;
            padding:10px 0px;
            border-top:3px solid #dedede;
            margin-bottom:10px;
        }
        .item-content:hover{
            background-color:white;
            border-left:1px solid #dedede;
            border-bottom:1px solid #dedede;
            border-right:1px solid #dedede;
            box-shadow:0 0 5px #f2f2f2;
        }
        .item-head{
            text-align:center;
            font-size:16px;
            color:#292929;
            height:50px;
            line-height:50px;
        }
        .process-item{
            color:#7a7a7a;
            font-size:12px;
            line-height:35px;
            height:35px;
            padding:0 20px;
        }
        .process-item:hover{
            cursor:pointer;
            color:#4d7ad8;
            background-color:#f2f2f2;
        }
        .item-head i{
            font-size:30px;
            vertical-align:middle;
        }
        .process-star,.process-star-fill{
            display:none;
            font-size:12px;
            float:right;
        }
        .process-item:hover .process-star{
            display:block;
        }
        .process-item.star:hover .process-star{
            display:none;
        }
        .process-item.star:hover .process-star-fill{
            display:inline-block;
        }
        .head-search{
            position:absolute;
            right:20px;
            top:10px;
        }
        .layui-input{
            height:30px;
            line-height:30px;
        }
        .search-img{
            position:absolute;
            right:10px;
            top:8px;
            font-size:14px;
        }
        .left-nav-body{
            overflow:auto;
        }
        .layui-tab-content{
            padding:0
        }
        .right-main{
            overflow:auto;
        }
        .item-content{
            width: 100%;
        }
        .process-name{
            display: inline-block;
            width: 85%;
            white-space: normal;
            word-break: break-all;
        }
        .process-item{
            width:auto;
            height: auto;
        }
    </style>
</head>
<body class="hasMotif Custom18Tab massAddCampaignMemberWiz MassAddCampaignMembersSelectCampaignStage sfdcBody brandQuaternaryBgr"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            
                
              <div class="layui-tab-content">
                  <div class="left-nav">
                      <div class="left-nav-head">
                          流程分类
                      </div>
                      <div class="left-nav-body">
                          <div class="left-nav-item active">全部</div>
                      </div>
                  </div>
                  <div class="right-content">
                      <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                      <ul class="layui-tab-title">
                        <li class="layui-this">全部流程</li>
                        <li>我的收藏</li>
                        <li>最近使用</li>
                      </ul>
                      <div class="head-search">
                          <input type="text"autocomplete="off" class="layui-input">
                          <i class="search-img layui-icon layui-icon-search"></i>
                      </div>
                      </div>
                      <div class="right-main">
                          <div class="row-content">
                          
                      </div>
                      <div class="row-content">
                          
                      </div>
                      <div class="row-content">
                          
                      </div>
                      <div class="row-content">
                          
                      </div>
                      </div>
                      
                  </div>
            </div> 
        </div>
    </div>
    <script type="text/javascript" src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script type="text/javascript" src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script type="text/javascript">
                            function bodyOnLoad() {
                                setFocusOnLoad();
                                //jQuery("#treeRootNode").height(jQuery("#lineItemView_wrapper").height());
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQxTkROYSx4c3dtLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&isAjaxRequest=1&renderMode=RETRO&nocache=1437552855562'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQyT1RSYSw2cDlmLE1HVXdaalF3"; };
                            } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
    <script>
        
        $('.left-nav-body').height($(window).height() - 180)
        $('.right-main').height($(window).height() - 200)
        getworkflow()

        $('.layui-tab-title li').eq(0).click(function () {
            $('.left-nav-item').removeClass('active')
            $('.left-nav-item:first').addClass('active')
            $('.item-content').show()
            $('.process-item').show().addClass('active')
            $('.layui-input').val('')
        })
        $('.layui-tab-title li').eq(1).click(function () {
            $('.left-nav-item').removeClass('active')
            $('.left-nav-item:first').addClass('active')
            $('.process-item').hide().removeClass('active')
            $('.item-content').hide()
            $('.process-item.star').show().addClass('active')
            $('.process-item.star').parents('.item-content').show()
            $('.layui-input').val('')
        })
        $('.layui-tab-title li').eq(2).click(function () {
            $('.left-nav-item').removeClass('active')
            $('.left-nav-item:first').addClass('active')
            $('.process-item').hide().removeClass('active')
            $('.item-content').hide()
            $('.process-item.latestused').show().addClass('active')
            $('.process-item.latestused').parents('.item-content').show()
            $('.layui-input').val('')
        })
        function getworkflow() {
            ajaxMethodData('process.search', null, function (data) {
                for (var i = 0; i < data.processLists.length; i++) {
                    var res = data.processLists[i]
                    $('.left-nav-body').append('<div class="left-nav-item" wfid="' + res.folderId + '">' + res.name + '</div>')

                    var index = 0
                    var length = $('.row-content').eq(0).find('.process-item').length
                    for (var k = 0; k < $('.row-content').length; k++) {
                        if ($('.row-content').eq(k).find('.process-item').length < length) {
                            index = k
                            length = $('.row-content').eq(k).find('.process-item').length
                        } else {

                        }
                    }
                    if (res.Processes.length > 0) {
                        var count = res.Processes.length;
                        $('.row-content').eq(index).append('<div class="item-content" wfid="' + res.folderId + '" style="display: block;">'
                          + '    <div class="item-head">'
                          + '        <i class="layui-icon layui-icon-list" style="color: rgb(85, 210, 212);"></i>'
                          + '        <span class="item-title">' + res.name + '(<span class="item-total">' + count + '</span>)</span>'
                          + '    </div>'
                          + '    <div class="item-body">'
                          + '    </div>'
                          + '</div>')
                    }
                    for (var j = 0; j < res.Processes.length; j++) {
                        var Processes = res.Processes[j]
                        $('.item-content[wfid="' + res.folderId + '"]').append('<div processId="' +Processes.processId + '" class="process-item active" style="display: block;">'
                                  + '<span  onclick="showDialog(\'/apps/wf/createInstancePop.aspx?t=a0M&processId=' + Processes.processId + '&name=' + Processes.name + '\', \'createInstancePop\', \'发起事务\',600, 400)"; class="process-name">' + Processes.name + '</span>'
                                  + '<span onclick="addfavorite(\'' + Processes.processId + '\')" class="process-star"><i class="layui-icon layui-icon-star"></i></span>'
                                  + '<span onclick="deletefavorite(this)" class="process-star-fill"><i class="layui-icon layui-icon-star-fill"></i></span>'
                                  +'</div>')
                    }
                }
                $('.left-nav-item').click(function () {
                    $('.left-nav-item').removeClass('active')
                    $(this).addClass('active')
                    searchprocess()
                })
                var coloarr = ['rgb(85, 210, 212)', 'rgb(179, 123, 250)', 'rgb(255, 198, 46)', 'rgb(85, 210, 212)', 'rgb(55, 178, 255)', 'rgb(255, 94, 86)']
                $('.item-content').each(function (index) {
                    var number = index % 6;
                    //console.log(number)
                    $(this).find('.item-head i').css('color', coloarr[number])
                    $(this).css('border-top-color', coloarr[number])
                })
                getfavorite()
                getlatestused()
            })


        }
        function getfavorite() {
            ajaxMethodData('process.favorite.getlist', null, function (data) {
                $('.star').removeClass('star')
                for (var i = 0; i < data.rows.length; i++) {
                    var res = data.rows[i]
                    var ProcessId = res.ProcessId
                    $('.process-item[processid="' + ProcessId + '"]').addClass('star').attr('favoriteid', res.ValueId)
                }
            })

        }
        function getlatestused() {
            ajaxMethodData('process.latestused.getlist', null, function (data) {
                for (var i = 0; i < data.rows.length; i++) {
                    var res = data.rows[i]
                    var ProcessId = res.id
                    $('.process-item[processid="' + ProcessId + '"]').addClass('latestused')
                }
            })

        }
        function searchprocess() {
            var folderId = $('.left-nav-item.active').attr('wfid')
            $('.item-content').hide()
            if (folderId) {
                if ($('.item-content[wfid="' + folderId + '"]').find('.process-item.active').length > 0) {
                    $('.item-content[wfid="' + folderId + '"]').show()
                }
            } else {
                $('.item-content').each(function () {
                    if ($(this).find('.process-item.active').length > 0) {
                        $(this).show()
                    }
                })
            }
        }
        $('.head-search input').change(function () {
            var search = $(this).val()
            $('.item-content').hide()
            $('.process-item').hide()
            $('.process-item').each(function () {
                if ($(this).html().indexOf(search) != -1 && $(this).hasClass('active')) {
                   $(this).show()
                   $(this).parents('.item-content').show()
                }
            })
        })
        function addfavorite(id) {
            ajaxMethodGetData('process.favorite.add', { processid: id }, function (data) {
                layer.msg(data.msg)
                getfavorite()
            })
        }
        function deletefavorite(that) {
            var id = $(that).parent().attr('favoriteid')
            ajaxMethodGetData('process.favorite.delete', { valueId: id }, function (data) {
                layer.msg(data.msg)
                getfavorite()
            })
        }
    </script>
</body>
</html>


