<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileManagerPage.aspx.cs" Inherits="WebClient.workspaces.fileManagerPage" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="" class="  ext-strict">
<head>
    <title>文档库管理 ~  - Developer Edition</title>
    <script type="text/javascript" src="/static/111213/js/perf/stub.js"></script>
    <!--<script type="text/javascript" src="/faces/a4j/g/3_3_3.Finalorg.ajax4jsf.javascript.AjaxScript?rel=1453004515000"></script>-->
    <script type="text/javascript" src="/jslibrary/sfdc/SfdcCore.js"></script>
    <script type="text/javascript" src="/EXT/ext-3.3.3/ext.js"></script>
    <!--
    <script type="text/javascript" src="/jslibrary/1449190104000/sfdc/AnalyticsFramework.js"></script>
    <script type="text/javascript" src="/jslibrary/1449190104000/sfdc/GuidedTour.js"></script>
    <script type="text/javascript" src="/jslibrary/1449190104000/sfdc/AnalyticsHome.js"></script>
      <script type="text/javascript" src="/jslibrary/sfdc/VFState.js"></script>   -->
    <script type="text/javascript" src="/static/111213/js/picklist.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script type="text/javascript" src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/LineItem.js"></script>
    <script src="/jslibrary/sfdc/source/SearchOnly.js"></script>
    <!--<script src="/jslibrary/sfdc/source/SearchOnlyExtend.js"></script>-->
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
    <script src="/js/CommonUtils.js"></script>
    <script type="text/javascript">
        function loadNew() {
            if (commonUtils.isBrowserSupported) {
               //window.location = "/workspaces/filelib.aspx?t=069";
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
    </style>
</head>
<body onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif reportTab  sfdcBody brandQuaternaryBgr   ext-gecko ext-gecko3 x-theme-aloha-esque" onload="if(this.bodyOnLoad)bodyOnLoad();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onunload="if(this.bodyOnUnload)bodyOnUnload();" id="ext-gen3" style="overflow: hidden;">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper" style="position: absolute; width: 98.5%; height: calc(100% - 28px);">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" style="height: calc(100% - 119px);">
            <table cellspacing="0" cellpadding="0" border="0" id="bodyTable" class="outerNoSidebar" style="height: calc(100% - 44px); margin-top: 20px; width: 100%; display: block;">
                <tbody style="height: 100%; width: 100%; display: block;">
                    <tr style="height: 100%; width: 100%; display: block;">
                        <td class="noSidebarCell" style="height: 100%; display: block;">
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" alt="内容在此开始" src="/s.gif"></a><span id="thePage"></span><span id="thePage:j_id0"></span><div class="bPageTitle">
                                    <div class="ptBody secondaryPalette brandSecondaryBrd">
                                        <div class="content">
                                            <img alt="文档库" title="文档库" class="pageTitleIcon" src="/s.gif"><h1 class="pageType noSecondHeader"><a href="/_ui/filemanager/folder">文档库</a></h1>
                                            <div class="blank"></div>
                                        </div>
                                        <div class="addNewButtons" style="float: right">
                                            <!--<input style="height:25px;" type="button" value="新建目录..." title="新建目录..." onclick="navigateToUrl('/reportbuilder/reportType.apexp', null, 'newRep')" class="btn">-->
                                            <input style="height: 33px;" type="button" value="上传文件..." title="上传文件" onclick="setLastMousePosition(event); uploadFile()" class="btn">
                                            <input style="height: 33px;" type="button" value="新建文件夹" title="新建文件夹" class="btn">
                                        </div>
                                        <div class="links">
                                            <!--<a onclick="if(!Sfdc.analytics.home.AnalyticsHome.GUIDED_TOUR.isCurrentlyOpen()) {Sfdc.analytics.home.AnalyticsHome.GUIDED_TOUR.start(true);}" href="javascript:%20void%280%29%3B">指导教程</a> | <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dreports_home.htm%2526section%253DReports%2526language%253Dzh_CN%2526release%253D198.17.7%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"><span class="helpLink">此页面的帮助</span><img title="" class="helpIcon" alt="" src="/s.gif"></a>-->
                                        </div>
                                    </div>
                                </div>
                            <span id="thePage:rerenderPanel">
                                <script type="text/javascript">
                                    var response = {};
                                </script>
                            </span>
                            <input type="hidden" name="currentFolder" id="currentFolder" />
                            <div style="visibility: hidden" id="homeContent" class="homeContent">
                            </div>
                            <div id="homeContentDest" class="homeContent" style="height: 81%;">
                                <div id="ext-comp-1015" class=" homePanel x-border-layout-ct" style="width: 100%; height: 100%;">
                                    <div id="folderTreePanel" class=" x-panel" style="border: solid; border: 1px; width: 240px; left: 0px; top: 0px; height: 100%;"></div>

                                    <script type="text/javascript">
                                        var treeHeight = 0;
                                        //Ext.onReady(function () {
                                        jQuery(document).ready(function () {
                                            treeHeight = getAutoHeight();
                                            //alert(treeHeight);
                                            treeHeight = treeHeight - 111 - 37 - 30 - 20; //111：导航30：padding
                                            // jQuery("#folderTreePanel").height(treeHeight);
                                            //jQuery("#gridBody").height(treeHeight-111);
                                            //alert(treeHeight);
                                            // shorthand
                                            var Tree = Ext.tree;
                                            //debugger
                                            var tree = new Tree.TreePanel({
                                                rootVisible: !1, autoScroll: !0,
                                                /*
                                                useArrows: true,
                                                animate: false,
                                                enableDD: true,
                                                */
                                                //containerScroll: true,
                                                border: true,
                                                height: treeHeight,
                                                //auto create TreeLoader
                                                //FolderTreeServlet
                                                dataUrl: "/_ui/content/folder/archfoldertreeservlet?type=100100&checksecurity=1",
                                                root: {
                                                    nodeType: 'async',
                                                    text: '文档库',
                                                    draggable: false,
                                                    id: ''
                                                }
                                            });

                                            tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
                                            // render the tree
                                            tree.render('folderTreePanel');
                                            tree.getRootNode().expand();

                                            jQuery("#ext-gen5").height('100%');

                                            loadGrids("");
                                        });
                                        function treeSelectionChange(a, b) {
                                            var nodeId = a.selNode.id;
                                            document.getElementById("currentFolder").value = nodeId;
                                            //alert(deptId);deptId
                                            //debugger;
                                            var extSrch = "&node=" + nodeId;
                                            //document.getElementById("selectValue").value = deptId;
                                            //document.getElementById("selectText").value = a.selNode.text;
                                            //window.sfdcPage.filterResults(null, '/_ui/busop/orderitem/SelectSearch?srtOrd=1&addTo=80190000000PJyk&offset=0&deptId=', '/_ui/busop/orderitem/SelectSearch?srtOrd=1&isNFltr=1&addTo=80190000000PJyk&offset=0&relatedListId=PricebookEntry&deptid=' + deptId, 'noh=1', 'PricebookEntry', 5, extSrch);
                                            loadGrids(extSrch);
                                        }
                                        function searchFiles() {
                                            var folderId = document.getElementById("currentFolder").value;
                                            var extSrch = "&node=" + folderId;
                                            var src = document.getElementById("ext-comp-1017").value;
                                            if (src != "") {
                                                extSrch += "&search=" + encodeURIComponent(src);
                                                loadGrids(extSrch);
                                            }
                                        }
                                        function searchKeyDown() {
                                            if (event.keyCode == 13) {
                                                searchFiles();
                                            }
                                        }
                                    </script>
                                    <script type="text/javascript">
                                        function resizePage() {
                                            //debugger;
                                            //var leftHeight = jQuery("#ext-gen5").height();
                                            // var gridHeight = jQuery("#ext-comp-1016").height();
                                            //alert(gridHeight);
                                            if (gridHeight > leftHeight) {
                                                //myHeight = gridHeight;
                                                // jQuery("#ext-gen5").height(gridHeight-111);
                                                //jQuery("#sidebarCmp").height(gridHeight);
                                            }
                                            //jQuery("#ext-gen5").height(treeHeight - 50);
                                            // jQuery("#homeContentDest").height(treeHeight);
                                        }
                                        function loadGrids(extSrch) {
                                            var url = "/_ui/filefolder/list/ListServlet?dataType=filefolder&type=100100&checksecurity=1" + extSrch;
                                            jQuery.ajax({
                                                async: true, cache: false, dataType: "json",
                                                error: function (request, textStatus, errorThrown) {
                                                    //debugger;
                                                    errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, "&gt;");
                                                    //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
                                                },
                                                success: function (data, textStatus) {
                                                    // debugger;
                                                    renderGrid(data);
                                                    resizePage();
                                                },
                                                type: "GET",
                                                url: url
                                            });
                                        }
                                        function uploadFile() {
                                            
                                            var folderId = document.getElementById("currentFolder").value;
                                            
                                            if (folderId == "") {
                                                //alert("请选择要上传文件存放的目录！");
                                                //return;
                                            }
                                            openPopup('/workspaces/Fileupload.aspx?pid=' + folderId + '&type=100100&objectTypeCode=100100&', 'file', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
                                        }
                                        function downloadFile(fileId) {
                                            window.open("/apps/files/FileDownload.aspx?objectTypeCode=100100&filesource=100100&id=" + fileId, "DownloadFile", null, true);
                                        }
                                        function openControlViewFile(fileId) {
                                            console.log(fileId)
                                            //window.open(, "OpenFile", "", true);
                                            var url = "/apps/files/DocEditor.aspx?objectTypeCode=100100&filesource=100100&EditType=0,0&readOnly=1&id=" + fileId;
                                            openPopupFocusEscapePounds(url, '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);
                                        }
                                        function viewFile(fileId) {
                                            console.log(fileId)
                                            //window.open("/apps/files/FileViewer.aspx?filesource=100100&id=" + fileId, "ViewFile", "", true);
                                            var url = "/apps/files/FileViewer.aspx?objectTypeCode=100100&filesource=100100&id=" + fileId;
                                            openPopupFocusEscapePounds(url, '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);
                                        }
                                        function renderGrid(data) {
                                            var html = "";
                                            for (var i = 0; i < data.length; i++) {
                                                var item = data[i];
                                                if ((i % 2) == 0)
                                                    html += "<tr class=\" dataRow even\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";
                                                else
                                                    html += "<tr class=\" dataRow odd\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";

                                                html += "<td class=\" actionColumn  \" scope=\"row\">";
                                                //html += " <a title=\"编辑\" class=\"actionLink\" href='' onclick=\"\">编辑</a>&nbsp;|&nbsp;";
                                                if (item.cls == "folder") {
                                                    // html += " <a title=\"编辑\" class=\"actionLink\" href='/workspaces/editFolder.aspx?t=069&id=" + item.id + "&retUrl=%2f069%2fo' onclick=\"void()\">编辑</a>&nbsp;|&nbsp;";
                                                    // html += " <a title=\"删除\" class=\"actionLink\" onclick=\"return confirmDelete();\" href='/setup/own/deleteredirect.aspx?delID=" + item.id + "&type=100200&retURL=%2f069%2fo'>删除</a>";
                                                }
                                                else {
                                                    if (item.canadmin == "True") {
                                                        html += " <a title=\"删除\" class=\"actionLink\" onclick=\"return confirmDelete();\" href='/setup/own/deleteredirect.aspx?delID=" + item.id + "&type=100100&retURL=%2f069%2fo'>删除</a>&nbsp;|&nbsp; ";
                                                    }
                                                    html += "<a title=\"下载\" class=\"actionLink\" href='#' onclick=\"downloadFile('" + item.id + "')\">下载</a>";
                                                    //docx,docx,xls,xlsx,pdf
                                                    if (item.fileExtension == ".xls" || item.fileExtension == "xls" ||
                                                        item.fileExtension == ".xlsx" || item.fileExtension == "xlsx" ||
                                                        item.fileExtension == ".docx" || item.fileExtension == "docx" ||
                                                        item.fileExtension == ".doc" || item.fileExtension == "doc") {
                                                        html += "&nbsp;|&nbsp; <a title=\"查看\" class=\"actionLink\" href='#' onclick=\"openControlViewFile('" + item.id + "')\">查看</a>";
                                                    }
                                                    else if (item.fileExtension == ".pdf" || item.fileExtension == "pdf"
                                                       || item.fileExtension == ".jpg" || item.fileExtension == "jpg"
                                                        || item.fileExtension == ".png" || item.fileExtension == "png"
                                                        || item.fileExtension == ".gif" || item.fileExtension == "gif"
                                                        || item.fileExtension == ".bmp" || item.fileExtension == "bmp") {
                                                        html += "&nbsp;|&nbsp; <a title=\"查看\" class=\"actionLink\" href='#' onclick=\"viewFile('" + item.id + "')\">查看</a>";
                                                    }
                                                }
                                                html += "</td>";
                                                html += " <td class=\"dataCell\">";
                                                if (item.cls == "folder") {
                                                    html += "<img unselectable=\"off\" class=\"x-analytics-report-folder-icon\" src=\"/img/icon/accounts16.png\" alt=\"\"><a href=\"#\" onclick=\"loadGrids('&node=" + item.id + "')\">";
                                                }
                                                else {
                                                    html += "<img unselectable=\"off\" class=\"x-analytics-report-folder-icon\" src=\"/img/icon/contracts16.png\" alt=\"\"><a href=\"#\" onclick=\"openFile('" + item.id + "')\">";
                                                }
                                                html += item.text + "</a></td>";

                                                html += " <td class=\"dataCell\">" + item.createdby + "</td>";
                                                html += " <td class=\"dataCell\">" + item.created + "</td>";
                                                html += " <td class=\"dataCell\">" + item.modifiedon + "</td>";
                                                html += "</tr>";

                                            }
                                            jQuery("#chidItems").html(html)
                                        }
                                    </script>
                                    <script>
                                        function getAutoHeight() {
                                            var x = 0, y = 0;
                                            if (self.innerHeight) // all except Explorer
                                            {
                                                x = self.innerWidth;
                                                y = self.innerHeight;
                                            }
                                            else if (document.documentElement && document.documentElement.clientHeight)
                                                // Explorer 6 Strict Mode
                                            {
                                                x = document.documentElement.clientWidth;
                                                y = document.documentElement.clientHeight;
                                            }
                                            else if (document.body) // other Explorers
                                            {
                                                x = document.body.clientWidth;
                                                y = document.body.clientHeight;
                                            }
                                            return y;
                                        }
                                    </script>
                                    <div id="ext-comp-1016" class=" x-panel x-panel-noborder x-border-panel" style="left: 247px; top: 0px; width: calc(100% - 243px);">
                                        <!-- Begin RelatedListElement -->
                                        <div class="bRelatedList" style="height: 100%; overflow: auto;">
                                            <!-- Begin ListElement -->
                                            <!-- motif: Account -->
                                            <!-- WrappingClass -->
                                            <div class="hotListElement">
                                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                                    <!--<form onsubmit="if (window.ffInAlert) { return false; }" name="actionForm" method="POST" id="actionForm" autocomplete="off" action="">-->
                                                    <div class="pbHeader">
                                                        <!--
                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="pbTitle">
                                                                        <img src="/s.gif" alt="" width="12" height="1" class="minWidth" title="" style="margin-right: 0.25em;" />&nbsp;<h3></h3>
                                                                    </td>
                                                                    <td class="pbButton"></td>
                                                                    <td class="pbHelp"></td>
                                                                </tr>
                                                            </table>
                                                            -->
                                                        <div id="listview_subNav" class="subNav">
                                                            <div class="linkBar brandSecondaryBrd">
                                                                <div id="listview_search" class=" quickfindContainer">
                                                                    <div class="x-form-field-wraps x-form-field-trigger-wrap" id="ext-gen113" style="padding-left: 10px;">
                                                                        <input type="text" name="ext-comp-1017" id="ext-comp-1017" onchange="searchFiles()" autocomplete="off" size="16" class="x-form-text x-form-field quickfindInput x-form-empty-field" style="width: 210px; height: 26px;" title="快速搜索" onkeydown="searchKeyDown()" /><img class="x-form-trigger undefined" alt="" src="/s.gif" id="ext-gen114" style="display: none;">
                                                                    </div>
                                                                </div>
                                                                <div class="clearingBox"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="pbBody" style="overflow: auto;" id="gridBody">
                                                        <table class="list" cellspacing="0" cellpadding="0" border="0">
                                                            <tr class="headerRow">
                                                                <th class="actionColumn" scope="col" style="width: 100px;">操作
                                                                </th>
                                                                <th class=" zen-deemphasize" scope="col">名称
                                                                </th>
                                                                <th class=" zen-deemphasize" scope="col">创建人
                                                                </th>
                                                                <th class=" zen-deemphasize" scope="col">创建时间
                                                                </th>
                                                                <th class="PhoneNumberElement zen-deemphasize" scope="col">最后修改时间
                                                                </th>
                                                            </tr>
                                                            <tbody id="chidItems">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="pbFooter secondaryPalette">
                                                        <div class="bg">
                                                        </div>
                                                    </div>
                                                    <!--</form>-->
                                                </div>
                                            </div>
                                            <div class="listElementBottomNav">
                                            </div>
                                            <!-- End ListElement -->
                                        </div>
                                        <!-- End RelatedListElement -->
                                    </div>
                                    <div id="sidebarCmp-xsplit" class="x-layout-split x-layout-split-west x-splitbar-h" style="opacity: 0; left: 240px; top: 0px; height: 367px;" data-uidsfdc="4">
                                        &nbsp;<div class="x-layout-mini x-layout-mini-west" id="ext-gen62">&nbsp;</div>
                                    </div>
                                </div>
                            </div>
                            <!-- Body events -->
                            <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4Tmkwd01TMHlNMVF3TWpvek1qbzFOaTQ1TXpoYSxBazhWVWRXc1BOa1BZRWVQZUxraVFiLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");; if (this.loadChatFrameJs) loadChatFrameJs(); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd01TMHlNMVF3TWpvek1qbzFOeTQzTURCYSxKRDBEejZnLWRXd1FWRUtLR2ZtV2lqLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                            <div id="datePicker" class="datePicker">
                                <div class="dateBar">
                                    <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();" onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
                                        <option value="1">二月</option>
                                        <option value="2">三月</option>
                                        <option value="3">四月</option>
                                        <option value="4">五月</option>
                                        <option value="5">六月</option>
                                        <option value="6">七月</option>
                                        <option value="7">八月</option>
                                        <option value="8">九月</option>
                                        <option value="9">十月</option>
                                        <option value="10">十一月</option>
                                        <option value="11">十二月</option>
                                    </select><img title="下月" onmouseover="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';" onfocus="this.className = 'calRightOn';" onclick="DatePicker.datePicker.nextMonth();" onblur="this.className = 'calRight';" class="calRight" alt="下月" src="/s.gif"><select title="年" name="calYearPicker" id="calYearPicker"><option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                    </select>
                                </div>
                                <div class="calBody">
                                    <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                                        <tbody>
                                            <tr>
                                                <th scope="col" class="dayOfWeek">星期日</th>
                                                <th scope="col" class="dayOfWeek">星期一</th>
                                                <th scope="col" class="dayOfWeek">星期二</th>
                                                <th scope="col" class="dayOfWeek">星期三</th>
                                                <th scope="col" class="dayOfWeek">星期四</th>
                                                <th scope="col" class="dayOfWeek">星期五</th>
                                                <th scope="col" class="dayOfWeek">星期六</th>
                                            </tr>
                                            <tr id="calRow1" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow2" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow3" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow4" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow5" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow6" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="buttonBar"><a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday" href="javascript:%20void%280%29%3B">今天</a></div>
                                </div>
                            </div>
                            <!-- End page content -->
                        </td>
                        </t>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
</body>
</html>
