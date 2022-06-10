<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="filelib.aspx.cs" Inherits="WebClient.workspaces.filelib" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="" class="  ext-strict">
<head>
    <title>文档库管理 ~  - Developer Edition</title>
    <script type="text/javascript" src="/static/111213/js/perf/stub.js"></script>
    <script type="text/javascript" src="/jslibrary/sfdc/SfdcCore.js"></script>
    <script type="text/javascript" src="/static/111213/js/picklist.js"></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script type="text/javascript" src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/LineItem.js"></script>
    <script src="/jslibrary/sfdc/source/SearchOnly.js"></script>
    <script src="/jslibrary/sfdc/EntityCustomSearchPage.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" class="user">
    <!--<link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css" class="user">-->
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/AnalyticsHome.css" class="user">
    <!--
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/AnalyticsCommon.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/35.0/sprites/1450809186000/Theme3/zh/base/GuidedTour.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/35.0/sprites/1450809186000/Theme3/zh/base/chatterCore.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/35.0/sprites/1450809186000/Theme3/zh/base/chatterExtended.css" class="user">-->
    <link rel="stylesheet" href="/css/themes/lightning/iconfont.css" />
    <link rel="stylesheet" href="/css/themes/lightning/alerts.css" />
    <link href="/template/css/alert.css" rel="stylesheet" />
    <link href="/layui/layui/css/layui.css" rel="stylesheet" />
    <script src="/layui/layui/layui.js"></script> 
    <script src="/js/CommonUtils.js"></script>    
    <script type="text/javascript">
            function loadNew() {
                if (!commonUtils.isBrowserSupported) {
                    window.location = "/workspaces/fileManagerPage.aspx?t=069";
                }
            }
            loadNew();
    </script>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "isS1Desktop": false, "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-MM-dd HH:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1450733912000", "today": "2016-1-20 上午10:32", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>


    <script type="text/javascript">
        var MOTIF_KEY = 'File';</script>
    <link href="https://ap1..com/favicon.ico" rel="shortcut icon">
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //ClientHash.prototype.needsClientHash('sid_Client','000000390Wh0000000yvHG','36.110.120.9','/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00O%2Fo');</script>
    <style>
         /*#SiteFooter1 {
            position: absolute!important;
            bottom: -44px!important;
        }
        .bodyDivs {
            position: absolute;
            left: 0;
            z-index: -1;
             width: 100%;
        }
        .menuButtonMenu {
            top: 30px!important;
            position: absolute!important;
            left: 0px!important;
            z-index: 9999!important;
        }*/
        .x-panel {
            height: 100%;
        }

        .x-panel-bwrap {
            height: 100%;
            border-bottom: 1px solid #ccc;
        }

        .noSidebarCell, .sidebarCell .fixed {
            padding: 0 10px;
        }

        body .bPageTitle {
            padding: 0;
        }

        .x-form-field-wraps {
            position: relative;
            right: 10px;
            top: 0;
            text-align: right;
            zoom: 1;
            white-space: nowrap;
        }

        .ext-strict .x-form-text {
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .quickfindContainer .quickfindInput {
            background-position: 2px 6px;
        }

        body .btn {
            height: 33px;
            background: #fff;
            border: 1px solid #ccc;
            font-size: 12px;
            width: 89px;
        }

            body .btn:hover {
                color: #333;
                background-color: #e6e6e6;
                border-color: #adadad;
            }

        .slds-nav-vertical__item, .slds-breadcrumb__item {
            margin: 0;
            padding: 0;
        }

            .slds-breadcrumb__item span {
                display: block;
                margin-top: 8px;
            }

        .SelectSearch {
            position: absolute;
            height: 100%;
            overflow: hidden;
            width: -moz-calc(100% - 20px);
            width: -webkit-calc(100% - 20px);
            width: calc(100% - 20px);
            /*width:98.5%;*/
        }

        #contentWrapper {
            height: 100%;
        }

        .bodyDivs {
            /*height:80%;*/
        }

        .outer, .bPageTitle {
            height: 100%;
        }

        .noSidebarCell {
            /*display: block;*/
            height: 100%;
        }

        a {
            text-decoration: none;
        }

        .centerRegiona .page-container {
            position: absolute;
            right: 0;
            padding: 0px 18px 0px 0;
            width: 86.5%;
            width: calc(100% - 240px);
            background: #fff;
            border-top: 1px solid #ccc;
            bottom:-20px;
            border-radius:0 0 4px 0;
            text-align:right;
        }
        .zxf_pagediv .zxfPagenum,.page-container .current,.page-container .zxfinput{
            width: 30px;
            height: 30px;
            line-height: 30px;
        }
        .page-container .current{
            border:1px solid transparent;
        }
        .page-container>*{
            text-align:center;
        }
        .bodyDivs {
            background: #fff;
            border-top: 3px solid;
        }

        .windowViewMode-normal .object-detail-page {
            top: 54px;
        }

        .slds-nav-vertical__action .list_img {
            width: 15px;
            height: 15px;
            margin-right: 10px;
            margin-top: 0px;
        }

        .slds-breadcrumb__item .img {
            height: 30px;
            background: #F88962;
        }

        .img .head_img {
            width: 25px;
            height: 25px;
            margin-left: 2px;
            margin-top: 2px;
        }
        .black {
            position: absolute;
            width: 100%;
            height: 100%;
            background: #000;
            opacity: .5;
            top: 0;
            left: 0;
            z-index: 9;
            display: none;
        }

        .moved {
            z-index: 9;
            position: absolute;
            top: 35%;
            left: 25%;
            width: 535px;
            height: 300px;
            background: #fff;
            display: none;
        }

        .move_active {
            background: #E5F0FA;
        }

        .move_right {
            float: right;
            width: 293px;
            height: 100%;
        }

        .move_right_item {
            margin: 0;
            padding: 12px;
            font-size: 14px;
            border-bottom: 1px solid #ccc;
            cursor: pointer;
        }

            .move_right_item:hover {
                background: rgb(236, 235, 234);
            }

        .closetd {
            right: 0;
            font-size: 18px;
            position: absolute;
            top: -38px;
            width: 30px;
            height: 29px;
            background: #fff;
        }

        .dataRow:hover {
            background: #e6e6e6;
        }
        .centerRegionab .details .pretty input{
            opacity:1  \9;
            position: static  \9;
        }
        .pretty.circle.info label {
            display:none \9;
        }
        .slds-cell-edit.cellContainer .showActionsButton {
            margin-top:-10px \9;
        }
        #chidItems tr {
            background-color:white;
        }
        .file-nav {
            background-color:white;
        }
        .miss-header {
            min-height:1px !important;
        }
        #editFolder,#advancedSearchbtn{
            display:block !important;
        }
        .selectionColumnHeader{
            overflow:hidden;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="/css/lighting.css" />
    <link type="text/css" rel="stylesheet" href="/css/new/iconfont.css" />
    <link type="text/css" rel="stylesheet" href="/css/filelib.css" />
    <link href="/css/pretty.min.css" rel="stylesheet" />
    <link href="/content/video/zxf_page.css" rel="stylesheet" />
    <script src="/js/rem.js"></script>
    <script src="/content/video/zxf_page.js"></script>
    <script src="/workspaces/folderOpration.js?a=1"></script>
    <link href="/template/css/indexStyle.css" rel="stylesheet">
    <link href="/template/css/header.css" rel="stylesheet">
     <script type="text/javascript" src="/EXT/ext-3.3.3/ext.js"></script>
    <style>
        .cencela li{
            display:block !important;
            text-align:left;
            padding:10px;
            border-bottom: 0;
        }
        .cencela li:hover{
            background-color:#f2f2f2;
        }
        .centerRegionab tr {
            height:50px;
        }
        .cencela {
            border-radius:4px;
            box-shadow: 0px 0px 10px 2px rgba(56, 56, 56, 0.2);
            width:120px;
            border-top: 1px solid #dedede;
        }
        .object-detail-page {
            position:static;
        }
       
        #chidItems tr  a img{
            margin-top:8px \9;
        }
        #chidItems tr {
            display:block;            
        }
        #chidItems td {
            position:relative;
            padding-left:8px;
            border:0;
            vertical-align:middle;
            line-height:50px;
            white-space:nowrap;
        }
        #chidItems .pretty{
            box-sizing:border-box;
            position:absolute;
            top:16px;
        }
        #chidItems a img {
            width:32px !important;
            height:32px !important;
            margin-top:9px;
            float:left;
        }
        #chidItems .showActionsButton {
            top:14px;
            margin-top:3px \9;
        }
        .uiScroller.native {
            overflow:hidden;
        }
        #chidItems{
            overflow:auto;
            overflow-x:hidden;
        }
        .slds-container--small {
            width:auto;
        }
        .file-nav {
            padding:10px;
            color:rgb(0, 109, 204);
            border-bottom:1px solid #dedede;
        }
        .file-nav span{
            cursor:pointer;
        }
        #SiteFooter1 {
            display:none;
        }
        .success .iconfont.icon-duihao::before{
            display:none !important;
        }
        .sort-icon {
            width:13px;
            height:13px;
            display:inline;
            padding: 0 13px 0 0;
            background: url(/easyui/themes/black/images/datagrid_icons.png) no-repeat -64px center;
            opacity:0.7;
        }
        .sort-icon.down{
            background: url(/easyui/themes/black/images/datagrid_icons.png) no-repeat 0px center;
            opacity:1;
            color:blue;
        }
        .sort-icon.up{
            background: url(/easyui/themes/black/images/datagrid_icons.png) no-repeat -16px center;
            opacity:1;
        }
        #chidItems tr:hover{
            background-color:#f2f2f2;
        }
        #chidItems{
            counter-reset: number;
        }
        #chidItems .slds-row-number:after {
            content: counter(number);
            counter-increment:number;
        }
        body #iframe {
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: none;
            height:620px;
            border:0;
        }
        .popup-mask {
            position:fixed;
            background: url(/img/bgOverlayDialogBackground.png);
            background-color: transparent;
            top:0;
            left:0;
            width:100%;
            height:100%;
            display:none;
        }
        #iframe2 {
            position: fixed;
            z-index: 101;
            background-color: white;
            left: 0%;
            top: 0%;
            border-radius: 7px;
            display: none;
            border:0;
            width:100%;
            height:100%;
        }
        .bodyDivs{
            z-index:1 !important;
        }
        #AppBodyHeader{
            position:relative;
            z-index:2;
        }
        #tabContainer{
            box-shadow:none;
        }
        .sortimgbtn{
            width: 16px;
            height: 16px;
            margin-right:5px;
            cursor:pointer;
        }
        .searchselect{
            position:relative;
        }
        .searchselect img{
            height:14px;
            width:14px;
            position:absolute;
            right:10px;
            top:8px;
        }
        .searchselect .layui-edge{
            display:none;
        }
    </style>
</head>
<body onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif homeTab  sfdcBody brandQuaternaryBgr   ext-gecko ext-gecko3 x-theme-aloha-esque" onload="if(this.bodyOnLoad)bodyOnLoad();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onunload="if(this.bodyOnUnload)bodyOnUnload();" id="ext-gen3" style="overflow: hidden;">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper" style="position: absolute; width: 99%; height: calc(100% - 28px);">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDivs brdPalette brandPrimaryBrd" style="height: calc(100% - 119px);">
            <table cellspacing="0" cellpadding="0" border="0" id="bodyTable" class="outerNoSidebar" style="height: 100%; padding: 0; width: 100%; display: block;">
                <tbody style="height: 100%; width: 100%; display: block;">
                    <tr style="height: 100%; width: 100%; display: block;">
                        <td class="noSidebarCell" style="height: 100%; padding: 0; display: block;">

                            <input type="hidden" name="currentFolder" id="currentFolder" />

                            <div class="bPageTitle" style="padding: 0;">
                                <div class="slds-brand-band">
                                    <div class="slds-template__container">
                                        <div class="lafSinglePaneWindowManager">
                                            <div class="windowViewMode-normal">
                                                <div class="forceContentFilesHomeDesktop">
                                                        <div class="miss-header">
                                                            <div class="header-left-logo">
                                                                <img style="width:30px;height:30px;margin:1px;" src="/img/images/filelib.png">
                                                            </div>
                                                            <div class="header-left-title2">
                                                                <p class="header-left-title-name">文件管理</p>
                                                            </div>
                                                            <div class="header-right-buttonbtn">
                                                                <div class="buttonbtn buttonbtnsousuo">
                                                                    <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="datasearch()">
                                                                </div>
                                                                <div class="buttonbtn-group" id="advancedSearchbtn">
                                                                    <div class="buttonbtn advancedSearch">高级搜索</div>
                                                                </div>
                                                                <div class="buttonbtn-group" style="display:none">
                                                                    <div class="buttonbtn filequanxian">文件夹权限设置</div>
                                                                </div>
                                                                <div class="buttonbtn-group" style="display:none">
                                                                    <div id="btnUploadfile" class="morefile buttonbtn">上传文件</div>
                                                                </div>
                                                                <div class="buttonbtn-group" id="editFolder">
                                                                    <div class="buttonbtn editFolder">新建文件夹</div>
                                                                </div>
                                                                <div class="buttonbtn-group"style="display:none">
                                                                    <div class="buttonbtn sortFolder">文件夹排序</div>
                                                                </div>
                                                                <div class="buttonbtn-group"style="display:none">
                                                                    <div class="buttonbtn sortfile">文件排序</div>
                                                                </div>
                                                            </div>
                                                            <div class="clear"></div>

                                                            </div>
                                                    <div class="slds-card slds-grid object-detail-page" style="border-top: 1px solid #ccc;">
                                                        <div class="slds-grid slds-container--fluid slds-grid--vertical-stretch">
                                                            <div class="slds-container--small slds-grid slds-grid--vertical-stretch">
                                                                <div class="slds-grid slds-grid--vertical slds-navigation-list--vertical objectManagerLeftNav" style="padding-top: 0; height: calc(100% - 0px);">
                                                                    <ul class="left_ul">
                                                                        <li class="slds-nav-vertical__item slds-is-actives">
                                                                            <a class="slds-nav-vertical__action" href="javascript:;" style="font-weight: 400;">
                                                                                <span>
                                                                                    <img src="/img/new.png" alt="Alternate Text" class="list_img" /></span>
                                                                                <span class="type">最近使用</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="slds-nav-vertical__item" id="10010000-0000-0000-0000-000000000001">
                                                                            <a class="slds-nav-vertical__action open" href="javascript:;" style="font-weight: 400;">
                                                                                <span>
                                                                                    <img src="/img/mine.png" alt="Alternate Text" class="list_img" /></span>
                                                                                <span class="type">我的文件</span>
                                                                            </a>
                                                                            <%-- <ul class="second" style="display: none;">
                                                                            </ul>--%>
                                                                        </li>
                                                                        <li class="slds-nav-vertical__item" id="10010000-0000-0000-0000-000000000003">
                                                                            <a class="slds-nav-vertical__action open" href="javascript:;" style="font-weight: 400;">
                                                                                <span>
                                                                                    <img src="/img/share.png" alt="Alternate Text" class="list_img" /></span>
                                                                                <span class="type">共享文件</span>
                                                                            </a>
                                                                            <%-- <ul class="second" style="display: none;">
                                                                            </ul>--%>
                                                                        </li>
                                                                        <li class="slds-nav-vertical__item" id="10010000-0000-0000-0000-000000000002">
                                                                            <a class="slds-nav-vertical__action open" href="javascript:;" style="font-weight: 400;">
                                                                                <span>
                                                                                    <img src="/img/company.png" alt="Alternate Text" class="list_img" /></span>
                                                                                <span class="type">单位文件</span>
                                                                            </a>
                                                                            <%-- <ul class="second" style="display: none;">
                                                                            </ul>--%>
                                                                        </li>
                                                                        <li class="slds-nav-vertical__item" id="10010000-0000-0000-0000-000000000303">
                                                                            <a class="slds-nav-vertical__action open" href="javascript:;" style="font-weight: 400;">
                                                                                <span>
                                                                                    <img src="/img/company.png" alt="Alternate Text" class="list_img" /></span>
                                                                                <span class="type">流程归档目录</span>
                                                                            </a>
                                                                            <%-- <ul class="second" style="display: none;">
                                                                            </ul>--%>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="centerRegiona" style="height: calc(100% - 0px); overflow: hidden;">
                                                                <div class="centerRegionab">
                                                                    <div class="detailsOuter allow-horizontal-form runtime_sales_activitiesTaskDetails inlineEditEnabled">
                                                                        <div class="details" style="margin: 0; border-top: 0;">
                                                                            <div style="min-height: 150px; height: 100%;" id="processList">
                                                                                <div class="slds-grid listDisplays safari-workaround-anchor">
                                                                                    <div class="slds-grid listViewContainer safari-workaround">
                                                                                        <div class="slds-col slds-no-space forceListViewManagerPrimaryDisplayManager">
                                                                                            <div class="forceListViewManagerGrid">
                                                                                                <div class="listViewContent slds-table--header-fixed_container">
                                                                                                    <div class="uiScroller scroller-wrapper scroll-bidirectional native" style="height: calc(100% - 0px);">
                                                                                                        <div class="scroller actionBarPlugin" style="min-width: 100%; height: 100%;">
                                                                                                            <div class="slds-table--edit_container slds-is-relative  inlineEdit--enabled keyboardMode--inactive inlineEditGrid forceInlineEditGrid" style="position: static;">
                                                                                                                <div class="file-nav">
                                                                                                                    <span name="我的文件"fileid="10010000-0000-0000-0000-000000000001"> / 最近使用</span>
                                                                                                                </div>
                                                                                                                 <table class="slds-table forceRecordLayout slds-table--header-fixed slds-table--edit slds-table--bordered resizable-cols slds-table--resizable-cols uiVirtualDataTable slds-no-cell-focus">
                                                                                                                    <thead>
                                                                                                                        <tr class="slds-text-title--caps">
                                                                                                                            <th class="errorColumnHeader selectionColumnHeader" style="width: 60px;">
                                                                                                                                <div class="slds-cell-fixed" style="width: 60px;">
                                                                                                                                    <div class="slds-th__action">
                                                                                                                                        <span class="slds-truncate"></span>
                                                                                                                                        <span class="assistiveText">项目编号
                                                                                                                                        </span>
                                                                                                                                    </div>
                                                                                                                                </div>
                                                                                                                            </th>
                                                                                                                            <th class="selectionColumnHeader">
                                                                                                                                <div class="pretty circle info" style="margin-left: 8px;">
                                                                                                                                    <input type="checkbox" name="check" class="check">
                                                                                                                                    <label>
                                                                                                                                        <i class="mdi mdi-check"></i>
                                                                                                                                        <span class="fullName"></span>
                                                                                                                                        &nbsp;&nbsp;
                                                                                                                                            <span class="Unit"></span><span></span>
                                                                                                                                    </label>
                                                                                                                                </div>
                                                                                                                            </th>
                                                                                                                            <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable" style="width: 50%;" name="name">
                                                                                                                                <div class="slds-cell-fixed">
                                                                                                                                    <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                                                                                                                        <span class="slds-truncate" style="color: rgb(81, 79, 77);">文件名称</span>
                                                                                                                                        <span class="sort-icon"></span>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </th>
                                                                                                                            <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable"style="width: 10%;" name="SortNumber">
                                                                                                                                <div class="slds-cell-fixed">
                                                                                                                                    <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                                                                                                                        <span class="slds-truncate" style="color: rgb(81, 79, 77);">序号</span>
                                                                                                                                        <span class="sort-icon"></span>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </th>
                                                                                                                            <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable"style="width: 10%;" name="fileSize">
                                                                                                                                <div class="slds-cell-fixed">
                                                                                                                                    <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                                                                                                                        <span class="slds-truncate" style="color: rgb(81, 79, 77);">大小</span>
                                                                                                                                        <span class="sort-icon"></span>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </th>
                                                                                                                            <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable"style="width: 10%;" name="createdOn">
                                                                                                                                <div class="slds-cell-fixed">
                                                                                                                                    <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                                                                                                                        <span class="slds-truncate" style="color: rgb(81, 79, 77);">时间</span>
                                                                                                                                        <span class="sort-icon"></span>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </th>
                                                                                                                            <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable"style="width: 10%;" name="createdBy">
                                                                                                                                <div class="slds-cell-fixed">
                                                                                                                                    <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                                                                                                                        <span class="slds-truncate" style="color: rgb(81, 79, 77);">创建人</span>
                                                                                                                                        <span class="sort-icon"></span>

                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </th>

                                                                                                                            <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable"style="width: 10%;">
                                                                                                                                <div class="slds-cell-fixed">
                                                                                                                                    <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                                                                                                                        <span class="slds-truncate" style="color: rgb(81, 79, 77);"></span>
                                                                                                                                        <i class="iconfont icon-jiantou1" style="display: none;"></i>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </th>
                                                                                                                        </tr>
                                                                                                                    </thead>
                                                                                                                  
                                                                                                                </table>
                                                                                                                <div id="chidItems">

                                                                                                                </div>
                                                                                                                  
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="zxf_pagediv">
                                                                    <div class="page-container"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="left_ID" style="display: none;"></div>
                            <div class="right_ID" style="display: none;"></div>
                            <script>
                                $('.slds-nav-vertical__item').click(function () {
                                    $('.buttonbtn-group').show()
                                    //if ($(this).find('.type').html() == '共享文件' || $(this).find('.type').html() == '单位文件') {
                                    //    $('.buttonbtn-group').show()
                                    //} else {
                                    //    $('.filequanxian').parent().hide()
                                    //}
                                    //if ($(this).find('.type').html() == '最近使用') {
                                    $('.buttonbtn-group').hide()
                                    $('.advancedSearch').parent().show()
                                    //} 

                                    $('.slds-nav-vertical__item').removeClass('slds-is-actives');
                                    $(this).addClass('slds-is-actives');
                                    var i = $(this).index();
                                    if (i == 0) {
                                        loadGrids(0, i);
                                        $('.left_ID').html('');
                                        $('.right_ID').html('');
                                    } else if (i == 1) {
                                        loadGrids(1, i);
                                        $('.left_ID').html($(this).attr('id'));
                                        $('.right_ID').html('');
                                    } else if (i == 2) {
                                        loadGrids(2, i);
                                        $('.left_ID').html($(this).attr('id'));
                                        $('.right_ID').html('');
                                    } else if (i == 3) {
                                        loadGrids(3, i);
                                        $('.left_ID').html($(this).attr('id'));
                                        $('.right_ID').html('');
                                    }
                                    else if (i == 4) {
                                        loadGrids(4, i);
                                        $('.left_ID').html($(this).attr('id'));
                                        $('.right_ID').html('');
                                    }
                                    if (i != 0) {
                                        var id = $(this).attr('id')
                                        var html = $(this).find('.type').html()
                                        }else{
                                        var id = $('.slds-nav-vertical__item').eq(1).attr('id')
                                        var html = $('.slds-nav-vertical__item').eq(1).find('.type').html()
                                    }
                                    $('.file-nav').html('<span name="' +html + '"fileid="' + id + '"onclick=loadGrids("' + i + '","' + i + '")> / ' + $(this).find('.type').html() + '</span>')
                                    $('.file-nav span:last').click(function () {
                                        if ($(this).attr('name') == '共享文件' || $(this).attr('name') == '单位文件') {
                                            $('.buttonbtn-group').show()
                                        } else {
                                            $('.buttonbtn-group').hide()
                                        }
                                    })
                                })


                                $('.check').click(function () {
                                    if ($(this).attr('checked') == 'checked') {
                                        for (var i = 0; i < $("#chidItems .pretty").length; i++) {
                                            //console.log($("#chidItems .pretty").eq(i).children('input'));
                                            $("#chidItems .pretty").eq(i).children('input').attr('checked', true);
                                        }
                                    }
                                    else {
                                        for (var i = 0; i < $("#chidItems .pretty").length; i++) {
                                            //console.log($("#chidItems .pretty").eq(i).children('input'));
                                            $("#chidItems .pretty").eq(i).children('input').attr('checked', false);
                                        }
                                    }
                                   
                                })
                                function createpage(pageNum, current) {
                                    $(".zxf_pagediv").html('<div class="page-container"></div>')
                                    pageNum = Math.ceil(pageNum / 20)
                                    $(".page-container").createPage({
                                        pageNum: pageNum,
                                        current:current,
                                        backfun: function (e) {
                                            //console.log(e);//回调
                                            refreshGrid()
                                        }
                                    });
                                }
                                //翻页
                                


                                $('.search').keydown(function (e) {

                                    if (e.keyCode == 13) {

                                        var val = $('.search').val();
                                        //   console.log(encodeURIComponent(val));
                                        var vals = encodeURIComponent(val);
                                        jQuery.ajax({
                                            async: true, cache: false, dataType: "json",
                                            error: function (request, textStatus, errorThrown) {
                                                errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, "&gt;");
                                            },
                                            type: "GET",
                                            url: "/apps/CommandProcessor.ashx?cmd=file.files.search&search=" + vals,
                                            success: function (data, textStatus) {
                                                //  console.log(data);
                                                renderGrid(data);
                                            }
                                        })

                                    }

                                });
                                //搜索
                                $('.search').blur(function () {
                                    var val = $('.search').val();
                                    //   console.log(encodeURIComponent(val));
                                    var vals = encodeURIComponent(val);
                                    jQuery.ajax({
                                        async: true, cache: false, dataType: "json",
                                        error: function (request, textStatus, errorThrown) {
                                            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, "&gt;");
                                        },
                                        type: "GET",
                                        url: "/apps/CommandProcessor.ashx?cmd=file.files.search&search=" + vals,
                                        success: function (data, textStatus) {
                                            //  console.log(data);
                                            renderGrid(data);
                                        }
                                    })
                                })

                                var html = '';
                                var type = '';
                                var left = '';
                                loadGrids(0, '')
                            </script>
                            <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4Tmkwd01TMHlNMVF3TWpvek1qbzFOaTQ1TXpoYSxBazhWVWRXc1BOa1BZRWVQZUxraVFiLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");; if (this.loadChatFrameJs) loadChatFrameJs(); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd01TMHlNMVF3TWpvek1qbzFOeTQzTURCYSxKRDBEejZnLWRXd1FWRUtLR2ZtV2lqLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>

                            <ul style="position: absolute; right: 19px;" class="cencela">
                                
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <div class="move_id" style="display: none;"></div>
    <div class="black"></div>
    <div class="moved" style="border-radius: 5px;">
        <button class="closetd">x</button>
        <div class="slds-container--small slds-grid slds-grid--vertical-stretch">
            <div class="slds-grid slds-grid--vertical slds-navigation-list--vertical objectManagerLeftNav" style="padding-top: 0; height: calc(100% - 0px); border-radius: 5px;">
                <ul class="left_ul">
                    <li class="slds-nav-vertical__item move_item move_active" id="10010000-0000-0000-0000-000000000001">
                        <a class="slds-nav-vertical__action open" href="javascript:;" style="font-weight: 400;">
                            <span>
                                <img src="/img/mine.png" alt="Alternate Text" class="list_img">
                            </span>
                            <span class="type">我的文件</span>
                        </a>

                    </li>
                    <li class="slds-nav-vertical__item move_item" id="10010000-0000-0000-0000-000000000003">
                        <a class="slds-nav-vertical__action open" href="javascript:;" style="font-weight: 400;">
                            <span>
                                <img src="/img/share.png" alt="Alternate Text" class="list_img"></span>
                            <span class="type">共享文件</span>
                        </a>

                    </li>
                    <li class="slds-nav-vertical__item move_item" id="10010000-0000-0000-0000-000000000002">
                        <a class="slds-nav-vertical__action open" href="javascript:;" style="font-weight: 400;">
                            <span>
                                <img src="/img/company.png" alt="Alternate Text" class="list_img"></span>
                            <span class="type">单位文件</span>
                        </a>

                    </li>
                </ul>
            </div>
        </div>
        <div class="move_right">
            <ul class="move_right_ul">
            </ul>
        </div>
    </div>
    <iframe frameborder="0" id="iframe"src="#"></iframe>
    <iframe frameborder="0" id="iframe2"src="#"></iframe>
    <script src="/js/alert.js"></script>
    <script>
        function move() {
            $('.black').show();
            $('.moved').show();
        }
        $('.closetd').click(function () {
            $('.black').hide();
            $('.moved').hide();
        })
        $(document).ready(function () {
            //console.log($(".centerRegionab"))
            var height = $(window).height() - 200
            $('.object-detail-page').height(height)
            $('#chidItems').height(height-128)
        })
        //上传文件
        //$("#btnUploadfile").click(function () {
        //    if ($('.file-nav span').length > 1) {
        //        var id = $('.file-nav span:last').attr('fileid')
        //        openPopup("/workspaces/Fileupload.aspx?&type=100100&objectTypeCode=100100&pid=" + id + '&disabled=disabled', 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        //    } else {
        //       alert('请先进入文件夹')
        //    }
        //});
        var filedata = {
            objectTypeCode: '100100'
        }
        jQuery(document).ready(function () {
            $('body').append('<iframe id="iframe_display" name="iframe_display" style="display: none;"></iframe>  ')
            $("#btnUploadfile").after('<form style="display:none;" enctype="multipart/form-data" target="iframe_display" method="post" action="/apps/CommandProcessor.ashx?cmd=file.attachment.upload" id="fileform"><input id="fileinput" value="123" onchange="filechange(this)" style="display:none" type="file" name="file" multiple="multiple" class="el-upload__input">'
                + '<input type="hidden" name="pid" id="pid"/></form>')
            $("#btnUploadfile").click(function () {
                //setLastMousePosition(event);
                var pid = $('.file-nav span:last').attr('fileid');
                var entityCode = "";
                var type = "";
                var CategoryName = $('.missionright-file-type .shituu span').html()
                if (CategoryName == '全部') {
                    CategoryName = ''
                }
                if (typeof FormData != 'undefined') {
                    $(this).next().find('#fileinput').trigger('click')
                } else {
                    openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
                }
            });
        });
        function filechange(that) {
            var form = $('#fileform')
            $('#pid').val($('.file-nav span:last').attr('fileid'))
            if (typeof FormData != 'undefined') {
                if ($(that).val() != '') {
                    $('.popup-mask').show()
                    $('#iframe').show().attr('src', '/alert/fileupdata.html').css({
                        height: 200,
                        marginTop: '-100px'
                    })
                    var formdata = new FormData(form[0]);
                    $.ajax({
                        url: "/apps/CommandProcessor.ashx?cmd=file.upload",
                        type: "post",
                        data: formdata,
                        contentType: false,
                        processData: false,
                        mimeType: "multipart/form-data",
                        success: function (data) {
                            console.log(data)
                            return false;

                        },
                        error: function (error) {
                            console.log("error", error)
                        },
                        xhr: function () {
                            var xhr = $.ajaxSettings.xhr();
                            if (onprogress && xhr.upload) {
                                xhr.upload.addEventListener("progress", onprogress, false);
                                return xhr;
                            }
                        },
                    })
                }
            } else {
                form.submit()
            }
        }
        function onprogress(evt) {
            var loaded = evt.loaded;
            var tot = evt.total;
            var per = Math.floor(100 * loaded / tot);
            console.log(per)
            console.log(evt)
            $('#iframe').contents().find('.loadedsize').html((loaded / 1024 / 1024).toFixed(2) + 'M')
            $('#iframe').contents().find('.totsize').html((tot / 1024 / 1024).toFixed(2) + 'M')
            $('#iframe').contents().find('.progress-in').css('width', per + '%')
            if (per == 100) {
                $('.popup-mask').hide()
                $('#iframe').hide()
                success2('上传成功')
                var extSrch = parent.$('.slds-nav-vertical__item.slds-is-actives').attr('id')
                if (extSrch == '10010000-0000-0000-0000-000000000001') {
                    extSrch = 'my'
                } else if (extSrch == '10010000-0000-0000-0000-000000000003') {
                    extSrch = 'share'
                } else if (extSrch == '10010000-0000-0000-0000-000000000002') {
                    extSrch = 'org'
                } else if (extSrch == '10010000-0000-0000-0000-000000000303') {
                    extSrch = 'archive'
                } else {
                    extSrch = 'latestuse'
                }
                if (parent.$('.file-nav span').length > 1) {
                    parent.loadFolderData(parent.$('.file-nav span:last').attr('fileid'), extSrch)
                } else {
                    parent.loadGrids(extSrch)
                }
            }
        }
        //新建文件夹
        function editFolder(id) {
            $('#iframe').show().attr('src', '/alert/editFolder_ie8.html?id=' + id).height(620).css('margin-top','-310px')
            $('.popup-mask').show()
        }
        $('.editFolder').click(function () {
            editFolder('')
        })
        //文件夹排序
        $('.sortFolder').click(function () {
            $('#iframe').show().attr('src', '/alert/sortFolder_ie8.html?scope=0').height(460).css('margin-top', '-220px')
            $('.popup-mask').show()
        })
        //文件排序
        $('.sortfile').click(function () {
            $('#iframe').show().attr('src', '/alert/sortFolder_ie8.html?scope=1').height(460).css('margin-top', '-220px')
            $('.popup-mask').show()
        })
        //文件预览
        function openControlViewFile(url, type, link,name) {
            $('#iframe2').show().attr('src', '/alert/fileview.html?url=' + url + '&&FileExtension=' + type + '&&link=' + link+'&&name='+name)
        }
        //文件详情
        function ViewFile(id) {
            window.open('/files/filedetail.aspx?id=' + id + '&ObjectType=1')
        }
        //权限设置
        $('.filequanxian').click(function () {
            if ($('.file-nav span').length > 1) {
                var id = $('.file-nav span:last').attr('fileid')
                $('.popup-mask').show()
                $('#iframe').show().attr('src', '/alert/folderquanxian_ie8.html?id=' + id).height(480).css('margin-top','-240px')
            } else {
                alert('请先进入文件夹')
            }
        })
        //重命名
        function changename(id, name, type) {
            $('#iframe').show().attr('src', '/alert/file/folderchangename_ie8.html?id=' + id + '&name=' + name + '&type=' + type).height(315).css('margin-top', '-150px')
            $('.popup-mask').show()
        }
        //序号
        function changesort(id,name,type) {
            $('#iframe').show().attr('src', '/alert/file/folderchangesort_ie8.html?id=' + id + '&name=' + name + '&type=' + type).height(420).css('margin-top', '-200px')
            $('.popup-mask').show()
        }
        //删除
        function deletefile(id, type, canDelete) {
            if (canDelete != 'false') {
                $('.popup-mask').show()
                $('#iframe').show().attr('src', '/alert/delete_ie8.html?id=' + id + '&type=' + type + '&objTypeCode=文件').height(280).css('margin-top', '-150px')
            }
            else {
                error3('对不起，您没有删除权限！')
            }
        }
        function error3(type) {
            $("body").append('<div class="success red red3" style="left: 45%;width: auto; z-index:9999;"><span class="success_icon" style="background: #C23934;border: 1px solid #fff;"><i class="iconfont icon-cuohao" style="top: -7px;position: relative;left: 2px;font-size: 20px;"></i></span><div class="toastContent slds-notify__content" style="flex: 1;"><div class="slds-align-middle slds-hyphenate" style="font-size: 16px;"><span class="toastMessage slds-text-heading--small forceActionsText"></span></div></div></div>')
            if (type) {
                $(".toastMessage").html(type)
            }
            setTimeout(function () {
                $(".success").remove()
                parent.$('#changeDiv').hide()
            }, 3000)
        }
        //移动
        function removeclass(id,type) {
            $('.popup-mask').show()
            $('#iframe').show().attr('src', '/alert/file/changeclass_ie8.html?id=' + id + '&type=' + type).height(550).css('margin-top', '-280px')
        }
        //排序
        $('.sort-icon').click(function () {
            $('.sort-icon').not(this).removeClass('up')
            $('.sort-icon').not(this).removeClass('down')
            if (!$(this).hasClass('up')) {
                $(this).addClass('up')
                $(this).removeClass('down')
            } else {
                $(this).addClass('down')
                $(this).removeClass('up')
            }
        })
        function reloadfolder() {
            var extSrch = $('.slds-nav-vertical__item.slds-is-actives').attr('id')
            if (extSrch == '10010000-0000-0000-0000-000000000001') {
                extSrch = 'my'
            } else if (extSrch == '10010000-0000-0000-0000-000000000003') {
                extSrch = 'share'
            } else if (extSrch == '10010000-0000-0000-0000-000000000002') {
                extSrch = 'org'
            } else {
                extSrch = 'latestuse'
            }
            if ($('.file-nav span').length > 1) {
                loadFolderData(parent.$('.file-nav span:last').attr('fileid'), extSrch)
            } else {
                loadGrids(extSrch)
            }
        }
    </script>
    <div class="popup-mask"></div>
    <div id="advancedSearch">
        <div class="hightsearch" style="display: block;">
             <form class="layui-form" action="">

                <div class="hightsearch-head">
                    <div>
                        <div class="left">
                            <span class="search-name">标题:</span>
                            <input class="search-input" type="" name="UserName" value="">
                        </div>
                        <div class="left">
                            <span class="search-name">创建日期:</span>
                            <input id="advancedSearchCreatedOn" class="search-input" type="" name="CreatedOn" value="">
                        </div>
                    </div>
                    <div>
                        <div class="left ">
                            <span class="search-name">创建人:</span>
                            <div class="layui-input-block searchselect" lktp="8" >
                                <select class="" lay-search name="advancedSearchEmployeeId" id="advancedSearchEmployeeId" >
                                    <option value="">请选择</option>
                                </select>
                                <img onclick="choosepeople('advancedSearchEmployeeId')" src="/img/images/02.1-1.Search_.png" />

                            </div>
                        </div>
                        <div class="left">
                            <span class="search-name">部门:</span>
                            <div class="layui-input-block searchselect" lktp="10" >
                                <select class="" lay-search name="advancedSearchDeptId" id="advancedSearchDeptId" >
                                    <option value="">请选择</option>
                                </select>
                                <img onclick="choosedept('advancedSearchDeptId')" src="/img/images/02.1-1.Search_.png" />

                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="hightsearch-footbtn">
                <div>
                    <div class="hightsearch-shur">搜 索</div>
                    <div class="hightsearch-clear">重 置</div>
                    <div class="hightsearch-quite">取 消</div>
                </div>

            </div>
        </div>
    </div>

    <style>
        .hightsearch-head {
            padding: 20px;
            border-bottom: 1px solid #dedede;
        }

        .hightsearch-head > div {
            height: 50px;
            line-height: 50px;
        }

        .hightsearch-head select {
            position: relative \9;
            top: 10px \9;
        }

        .search-btn.active {
            background-color: #0094ff;
            color: white;
        }

        .search-name {
            display: inline-block;
            width: 60px;
        }

        .hightsearch-head .search-input {
            border-right: 1px solid #dedede;
            width: 300px;
        }

        .hightsearch-head > div > div {
            padding: 0 20px;
        }

        .hightsearch-footbtn {
            border-bottom: 1px solid #dedede;
            height: 65px;
            padding: 15px 0;
            box-sizing: border-box;
        }

        .hightsearch-footbtn >div {
            width: 300px;
            margin: 0 auto;
            height: 50px;
        }

        .hightsearch-footbtn > div div {
            border: 1px solid #dedede;
            border-radius: 4px;
            float: left;
            margin-right: 15px;
            padding: 8px 25px;
            cursor: pointer;
        }
        .hightsearch-footbtn > div div:hover {
            background-color: #f2f2f2;
        }
        
        .hightsearch-footbtn .hightsearch-shur {
            background-color: #0094ff;
            color: white;
        }

        .hightsearch-footbtn .hightsearch-shur:hover {
            background-color: #20699c;
        }
        .hightsearch-people {
            overflow: auto;
        }
        .hightsearch {
            display: none;
        }
        .hightsearch-head .search-input {
            border-right: 1px solid #dedede;
            width: 300px;
        }
        .search-input {
            height: 30px;
            border: 1px solid #dedede;
            border-right: 1px;
        }
        #advancedSearch {
            position:absolute;
            width:560px;
            background-color:white;
            border:1px solid #dedede \9;
            box-shadow:0px 0px 5px #000;
            right:10px;
            top:180px;
        }
        #advancedSearch .search-input{
            width:155px;
            box-sizing:border-box;
        }
        #advancedSearch .layui-input{
            width:150px;
            box-sizing:border-box;
            height:30px;
            line-height:30px;
        }
        .left {
            float:left;
        }
        #advancedSearch .layui-input-block {
            margin-left:0;
            display:inline-block;
        }
        #advancedSearch {
            display:none;
        }
    </style>

    
    <script>
        $('.advancedSearch').click(function () {
            $('#advancedSearch').show()
        })


        var form = ''
        layui.use(['form', 'laydate'], function () {
            form = layui.form

            var laydate = layui.laydate
            laydate.render({
                elem: '#advancedSearchCreatedOn',
                type: 'date',
                format: 'yyyy-MM-dd',
                range: true
            });

            form.on('select(attributeschook)', function (data) {
                attributeschookchange(data)
            });

            form.on('select(operatorchook)', function (data) {
                operatorchookchange(data)
            });
            getlookup()
        });

        function getlookup() {
            $('.searchselect').off()
            $('.searchselect').click(function () {
                var that = this
                d = {
                    Lktp: $(that).attr('Lktp'),
                }
                if ($(this).find('select option').length < 2) {
                    $(this).find('input').off()
                    searchlookup(d, that)
                }
                $(this).find('input').off()
                $(this).find('input').change(function () {
                    $(this).find('input').off()
                    d = {
                        Lktp: $(that).attr('Lktp'),
                        Lksrch: $(this).val()
                    }
                    searchlookup(d, that)
                })
            })
        }


        function searchlookup(d, that) {
            ajaxMethodGetData('ui.entity.lookup', d, function (data) {
                $(that).find('select').html('<option value="">请选择</option>')
                for (var i = 0; i < data.listData.length; i++) {
                    $(that).find('select').append('<option value="' + data.listData[i].ID + '">' + data.listData[i].Name + '</option>')
                }
                form.render('select');
                $(that).find('.layui-form-select').addClass('layui-form-selected')
                $(that).find('input').focus()
                if (d.Lksrch) {
                    $(that).find('input').val(d.Lksrch)
                }
            })
        }
        $('.hightsearch-quite').click(function () {
            $('#advancedSearch').hide()
        })
        $('.hightsearch-clear').click(function () {
            $('#advancedSearch input').val('')
            $('#advancedSearch select').val('')
        })
        $('.hightsearch-shur').click(function () {
            var Name = $('input[name="UserName"]').val()
            var CreatedOn = $('input[name="CreatedOn"]').val()
            var CreatedBy = $('#advancedSearchEmployeeId').attr('layvalue')
            var BusinessUnitId = $('#advancedSearchDeptId').val()
            ajaxMethodGetData('file.advance.search', {
                Name: Name,
                CreatedOn: CreatedOn,
                CreatedBy: CreatedBy,
                BusinessUnitId: BusinessUnitId,
            }, function (data) {
                renderGrid(data);
            })
            $('#advancedSearch').hide()
        })
        function datasearch() {
            
        }
        $('#srchText').keyup(function () {
            var search = $('#srchText').val()
            $('#chidItems tr').each(function (i, dom) {
                if ($(dom).find('.selectionColumnHeader').html().indexOf(search) == '-1') {
                    $(this).hide()
                } else {
                    $(this).show()
                }
            })
        })
    </script>
    <script>
        $(document).ready(function () {
            if (getQueryString('more') == '1') {
                $('.slds-nav-vertical__item').eq(4).trigger('click');
                setTimeout(function () {
                    $('#chidItems tr').each(function (i, dom) {
                        if ($(dom).find('.selectionColumnHeader').text() == '医院发文') {
                            $(this).children('.selectionColumnHeader').trigger('click');
                        }
                    })
                }, 1000)
            }
        })
    </script>
</body>
</html>
