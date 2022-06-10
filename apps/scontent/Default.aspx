<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebClient.apps.scontent.Default" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="">
<head>
    <title>信息管理 ~ .com - Developer Edition</title>
    <script src="/static/js/perf/stub.js" type="text/javascript"></script>
    <script src="/jslibrary/ajax4jsf.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/SfdcCore.js" type="text/javascript"></script>
    <script src="/EXT/ext-3.3.3/ext.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/AnalyticsFramework.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/ItemHome.js" type="text/javascript"></script>
    <script src="/static/js/picklist.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/VFState.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/zh_CN.js" type="text/javascript"></script>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css" rel="stylesheet"   type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css" rel="stylesheet" type="text/css" />
     <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/setup.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/ExtCSS-SFDC.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/AnalyticsCommon.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/AnalyticsHome.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css" rel="stylesheet"
        type="text/css" />
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1415122952000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-11-13 下午10:33", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'News';</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //   ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '125.39.9.45', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00O%3Ffcf%3D00l90000000gRD2');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outerNoSidebar" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="noSidebarCell">
                        <!-- Start page content table -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><span id="thePage"></span>
                                <span id="thePage:j_id0"></span><div class="bPageTitle">
                                        <div class="ptBody secondaryPalette brandSecondaryBrd">
                                            <div class="content">
                                                <img src="/s.gif" class="pageTitleIcon" title="信息和通知" alt="信息和通知" /><h1 class="pageType noSecondHeader">
                                                    列表</h1>
                                                <div class="blank">
                                                </div>
                                            </div>
                                            <div class="links" style="display:none"><!--
                                                <a href="javascript:%20void%280%29%3B" onclick="if(!Sfdc.analytics.home.AnalyticsHome.GUIDED_TOUR.isCurrentlyOpen()) {Sfdc.analytics.home.AnalyticsHome.GUIDED_TOUR.start(true);}">
                                                    指导教程</a> | <a href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                        title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                            class="helpIcon" title="" /></a>--></div>
                                        </div>
                                    </div>
                        <script type="text/javascript">
                            function newInfo()
                            {
                                var type = document.getElementById("type").value;
                                var tab = document.getElementById("t").value;
                                navigateToUrl("/" + tab + "/e?type=" + type + "&retURL=%2F" + tab + "%2Fo", null, 'newInfo');
                            }
                        </script>
                        <div class="addNewButtons">
                            <input class="btn" onclick="newInfo()"
                                title="新建信息..." type="button" value="新建信息..." /><!--
                            <input class="btn" onclick="navigateToUrl('/091/e?type=100202&&retURL=%2F091%2Fo', null, 'newNoti')"
                                title="新建通知..." type="button" value="新建通知..." />-->
                            <input class="btn" onclick="navigateToUrl('/apps/scontent/overviewContents.aspx?t=090&pageId=4dce3406-9173-490b-8a5d-a28332ab4bb1', null, 'browserInfo')"
                                title="浏览信息..." type="button" value="浏览信息" />
                        </div>
                        <script type="text/javascript">
                            Sfdc.analytics.home.AnalyticsHome.init(true, { 'canEditReports': true }, "javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);");
                        </script>
                        <form id="thePage:j_id16" name="thePage:j_id16" method="post" action="overviewContents.aspx"
                        enctype="application/x-www-form-urlencoded">
                        <input type="hidden" name="thePage:j_id16" value="thePage:j_id16" />
                        <input id="input" name="input" type="hidden" />
                        <script id="thePage:j_id16:j_id18" type="text/javascript">               commitShares = function () { A4J.AJAX.Submit('thePage:j_id16', null, { 'oncomplete': function (request, event, data) { Sfdc.analytics.home.ServerProxy.updateResponse(response); }, 'similarityGroupingId': 'thePage:j_id16:j_id18', 'parameters': { 'thePage:j_id16:j_id18': 'thePage:j_id16:j_id18'} }) };
                        </script><script id="thePage:j_id16:j_id19" type="text/javascript">      getAllShared = function () { A4J.AJAX.Submit('thePage:j_id16', null, { 'oncomplete': function (request, event, data) { Sfdc.analytics.home.ServerProxy.updateResponse(response); }, 'similarityGroupingId': 'thePage:j_id16:j_id19', 'parameters': { 'thePage:j_id16:j_id19': 'thePage:j_id16:j_id19'} }) };
                        </script><script id="thePage:j_id16:j_id20" type="text/javascript">     getUnsharedPerGroupType = function () { A4J.AJAX.Submit('thePage:j_id16', null, { 'oncomplete': function (request, event, data) { Sfdc.analytics.home.ServerProxy.updateResponse(response); }, 'similarityGroupingId': 'thePage:j_id16:j_id20', 'parameters': { 'thePage:j_id16:j_id20': 'thePage:j_id16:j_id20'} }) };
                        </script><script id="thePage:j_id16:j_id21" type="text/javascript">    getSharedPerGroupType = function () { A4J.AJAX.Submit('thePage:j_id16', null, { 'oncomplete': function (request, event, data) { Sfdc.analytics.home.ServerProxy.updateResponse(response); }, 'similarityGroupingId': 'thePage:j_id16:j_id21', 'parameters': { 'thePage:j_id16:j_id21': 'thePage:j_id16:j_id21'} }) };
                        </script><div id="thePage:j_id16:j_id34">
                        </div>
                        </form>
                        <span id="ajax-view-state-page-container" style="display: none"><span id="ajax-view-state"
                            style="display: none">
                            <input type="hidden" id="com.salesforce.visualforce.ViewState" name="com.salesforce.visualforce.ViewState"
                                value="" /><input
                                    type="hidden" id="com.salesforce.visualforce.ViewStateVersion" name="com.salesforce.visualforce.ViewStateVersion"
                                    value="201411071949480061" /><input type="hidden" id="com.salesforce.visualforce.ViewStateMAC"
                                        name="com.salesforce.visualforce.ViewStateMAC" value="ABORF1csFGt4fVavUIHxrQO8a/Gc" /><input
                                            type="hidden" id="com.salesforce.visualforce.ViewStateCSRF" name="com.salesforce.visualforce.ViewStateCSRF"
                                            value="" /></span></span>
                                            <span  id="thePage:rerenderPanel">
                                                <script type="text/javascript">
                                                    var response = {};
                                                </script>
                                            </span>
                        <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                        <div class="homeContent" id="homeContent" style="visibility: hidden">
                            <div class="sidebar" id="sidebar">
                                <script type="text/javascript" >

                                    Ext.onReady(function () {
                                        var type = document.getElementById("type").value;
                                        var tab = document.getElementById("t").value;
                                        var newItemFolderUrl = '/00l/e?t=' + tab + '&retURL=%2F' + tab + '%2Fo';
                                        //if (type == "100202") {
                                         //   newItemFolderUrl = '/00l/e?t=091&retURL=%2F091%2Fo&Type=' + type;
                                        //}
                                        new Sfdc.analytics.home.FolderTree({
                                            /*
                                            canAddReportFolder: true,
                                            newReportFolderUrl: '/00l/e?retURL=%2F00O%2Fo&Type=r',
                                            canAddDashboardFolder: true,
                                            newDashboardFolderUrl: '/00l/e?retURL=%2F00O%2Fo&Type=b',
                                            */
                                            dataUrl: "/_ui/content/folder/FolderTreeServlet?type=" + type,
                                            canAddItemFolder: true,
                                            newItemFolderUrl: newItemFolderUrl,
                                            folderId:'',
                                            folderType: type
                                            //folderId: '2457E5FB-DF73-409A-A3F6-6BF72F5BC6EE',
                                            //folderType: 'c'
                                        }).renderTo('sidebar');
                                    });
                                </script>
                            </div>
                            <div class="noTableBody listview" id="listview">
                                <span class="listViewTitle">栏目</span>
                                <script type="text/javascript" src="/static/js/picklist.js"></script>
                                <script type="text/javascript">
                                    var getDataUrl = "/_ui/analytics/reporting/ui/home/AnalyticsHomeListServlet";
                                    getDataUrl = "/_ui/contents/ListFolderContent";
                                    Sfdc.analytics.home.AnalyticsHomeListViewport.init();
                                    Sfdc.analytics.home.AnalyticsHome.LV = new Sfdc.analytics.home.AnalyticsHomeListViewport('00B90000008LeeX', 'listview', 'contents', { "inlineEditData": { "saveUrl": "/_ui/common/udd/object/InlineEditListSave", "massEditable": false, "editable": false }, "rolodexIndex": -1, "csrfToken": "", "entityButtons": [], "buttons": [], "listButtons": [], "retURL": "/00O?fcf=00B90000008LeeX&rolodexIndex=-1&page=1", "capped": false, "rowsPerPage": 25, "page": 1, "hasMassActions": false, "sortState": [{ "field": "NAME", "dir": "ASC"}], "printURL": "/00O?fcf=00B90000008LeeX&rolodexIndex=-1&page=1", "listData": { "ACTION_COLUMN": [], "FOLDER_NAME": [], "NAME": [], "CREATED_BY_NAME": [], "CRON_TRIGGER_ID": [], "LIST_RECORD_ID": [], "ACTION_ITEMS_COLUMN": [], "ITEM_FOLDER_ID_KEY": [], "ITEM_MOVE_TO_ANY_VISIBLE_FOLDER_KEY": [], "ITEM_DASHBOARD_MOVE_TO_PERSONAL_FOLDER": [], "ITEM_EDIT_ACCESS_KEY": [], "ACTION_COLUMN_LABELS": [] }, "filter": { "staticTranslation": false, "scopeEntity": "", "scope": 2, "availableColumns": [{ "useRolodex": false, "isSortable": true, "columnName": "CRON_TRIGGER_ID", "label": "已计划" }, { "useRolodex": true, "isSortable": true, "columnName": "FOLDER_NAME", "label": "文件夹" }, { "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["用户", "005"]], "isSortable": true, "columnName": "CREATED_BY_NAME", "label": "创建人", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "useNewLookups": false }, { "useRolodex": false, "fieldType": "DATETIME", "isSortable": true, "columnName": "CREATED_DATE", "label": "创建日期", "fieldId": "CreatedDate", "hasTime": true }, { "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["用户", "005"]], "isSortable": true, "columnName": "LASTMODIFIED", "label": "上次修改人", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "useNewLookups": false }, { "useRolodex": false, "fieldType": "DATETIME", "isSortable": true, "columnName": "LASTMODIFIEDDATE", "label": "上次修改日期", "fieldId": "LastModifiedDate", "hasTime": true}], "entityType": "00O", "type": "analytics", "editable": true, "id": "00B90000008LeeX", "scopeEntity2": "", "bodyClass": "reportTab", "isCloneable": true, "showCheckBox": false, "name": "View_0059000000390WhAAI", "isCreateNewDisplayed": true, "owner": "0059000000390Wh", "shownColumns": [{ "useRolodex": true, "maxLength": 40, "fieldType": "TEXT", "isSortable": true, "columnName": "NAME", "label": "名称", "fieldId": "Name" }, { "useRolodex": false, "isSortable": true, "columnName": "CRON_TRIGGER_ID", "label": "已计划" }, { "useRolodex": true, "isSortable": true, "columnName": "FOLDER_NAME", "label": "文件夹" }, { "useRolodex": false, "fieldType": "DATETIME", "isSortable": true, "columnName": "CREATED_DATE", "label": "创建日期", "fieldId": "CreatedDate", "hasTime": true },{ "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["用户", "005"]], "isSortable": true, "columnName": "CREATED_BY_NAME", "label": "创建人", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "useNewLookups": false}], "language": "CHINESE_SIMP", "filters": [] }, "totalRowCount": 0 }, null, null, 'c', -1, '查找文章...', '25', true, getDataUrl);
                                </script>
                                <script>      //                              Sfdc.analytics.home.AnalyticsHomeListViewport.init(); Sfdc.analytics.home.AnalyticsHome.LV = new Sfdc.analytics.home.AnalyticsHomeListViewport('00B90000008LeeX', 'listview', 'analytics', { "inlineEditData": { "saveUrl": "/_ui/common/udd/object/InlineEditListSave", "massEditable": false, "editable": false }, "rolodexIndex": -1, "csrfToken": "", "entityButtons": [], "buttons": [], "listButtons": [], "retURL": "/00O?fcf=00B90000008LeeX&rolodexIndex=-1&page=1", "capped": false, "rowsPerPage": 25, "page": 1, "hasMassActions": false, "printURL": "/00O?fcf=00B90000008LeeX&rolodexIndex=-1&page=1", "listData": { "NAME": ["\u003Cdiv class=\"nameFieldContainer iconContainer\"\u003E\u003Cimg src=\"/s.gif\" alt=\"仪表板\"  class=\"dashboardIcon\" title=\"仪表板\"/\u003E\u003C/div\u003E\u003Cdiv class=\"nameFieldContainer descrContainer\"\u003E\u003Ca href=\"/01Z90000000QllK\" shouldstayinownframe=\"true\"\u003E\u003Cspan\u003EMilestones PM Project Snapshots\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E", "\u003Cdiv class=\"nameFieldContainer iconContainer\"\u003E\u003Cimg src=\"/s.gif\" alt=\"仪表板\"  class=\"dashboardIcon\" title=\"仪表板\"/\u003E\u003C/div\u003E\u003Cdiv class=\"nameFieldContainer descrContainer\"\u003E\u003Ca href=\"/01Z90000000QllJ\" shouldstayinownframe=\"true\"\u003E\u003Cspan\u003EMilestones PM Individual Dashboard\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E", "\u003Cdiv class=\"nameFieldContainer iconContainer\"\u003E\u003Cimg src=\"/s.gif\" alt=\"报表\"  class=\"reportIcon\" title=\"报表\"/\u003E\u003C/div\u003E\u003Cdiv class=\"nameFieldContainer descrContainer\"\u003E\u003Ca href=\"/00O900000080tYR\"\u003E\u003Cspan\u003E我的客户联系人\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E", "\u003Cdiv class=\"nameFieldContainer iconContainer\"\u003E\u003Cimg src=\"/s.gif\" alt=\"报表\"  class=\"reportIcon\" title=\"报表\"/\u003E\u003C/div\u003E\u003Cdiv class=\"nameFieldContainer descrContainer\"\u003E\u003Ca href=\"/00O900000080r5D\"\u003E\u003Cspan\u003E我联系的客户\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E"], "CREATED_BY_NAME": ["\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E"], "CRON_TRIGGER_ID": ["&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;"], "ACTION_ITEMS_COLUMN": [[{ "action": "EDIT", "extraInfo": { "label": "编辑", "url": "/01Z90000000QllK/e?retURL=%2F00O%2Fo"} }, { "action": "DELETE", "extraInfo": { "csrf": "RxsA_DBJJFReTqxJhdgxeSphKa1bWBB5rhI8C0tUGC9vuXnBhTzhvegQIkP_MHE17KumJ_HzE9Ax57tK7ivdzysDyRh_j6gsTJ42N4_Wk0f5xTd.2EKtAOb83Q19rwB70qdQbN9uRp97UNIwtIc692jfpr4=", "label": "删除", "url": "/setup/own/deleteredirect.jsp?delID=01Z90000000QllK&retURL=%2F00O%2Fo&_CONFIRMATIONTOKEN=wp5mcqyqXDbQOu6ppM26kfo9.DTPjFFv9lulZvRa9tFIT3jPP6gr9qfVnzmgpVsODC8b666J9KDff072ymF1_1lNi00aRbENWq_bFQtnmoJButkM2BR6G4xj4tyj19scSKmaUfhtRdRozHizokpI8qe9Gdc%3D"}}], [{ "action": "EDIT", "extraInfo": { "label": "编辑", "url": "/01Z90000000QllJ/e?retURL=%2F00O%2Fo"} }, { "action": "DELETE", "extraInfo": { "csrf": "WGG9X9H5yOynsNeWexgNhBvB.6peoWwzMwzytsETcnQfnNK0zBWamZEn5TaMC44q.G86C2P7AwCCd7zPSEeEAABb1hDokwjQkdIn5s8iXkeCail98EJa0RdJCE58IJp2gCcEHSf.dklyXIrgoou3j4zanHo=", "label": "删除", "url": "/setup/own/deleteredirect.jsp?delID=01Z90000000QllJ&retURL=%2F00O%2Fo&_CONFIRMATIONTOKEN=wBxTkMgkFf9CiydkCdxN2I3r.8lzjPEDG3U4UKiLVwXaBduJGB34yqGkLAJlyIi5Qjmudq44wTd7NvOPcah9E3cy5uSVmSo0UYeAuwyaxdjpIAMv5fA8MagbiUpGbtM0dOBJtXVqy3CW.Rh8HUHxRzfQ66w%3D"}}], [{ "action": "EDIT", "extraInfo": { "label": "自定义", "url": "/00O900000080tYR/e?retURL=%2F00O%2Fo"} }, { "action": "DELETE", "extraInfo": { "csrf": "VpjwlCP9ZtD6Jb3aNG.xKQpkZyFGJztLpJ4VN2Zt9jc7jPELWyjX.7RenM8F.FVBm5rrcJP1rKeIVEVv7GhpoaRgFKvJ_St3mcuYNvqUj7b63jYJBHJqE46ZrtSKUeBU4RevuMYVEyb1UjywapZfVOvQNlY=", "label": "删除", "url": "/setup/own/deleteredirect.jsp?delID=00O900000080tYR&retURL=%2F00O%2Fo&_CONFIRMATIONTOKEN=BpiHcBf1oQQ5CuVrFFPFl2qZr1xGybBsWdrqGnk9wNAmkit0a47RZnDF041TFzIJGqgfzVIK2SuYBCwW.UncRU3As_V1MyLCoNWWWGl7qmPTynhjXQgAbZYcgqq316KfSuYVmJObg6yexgXaXMfepJpxJq8%3D"} }, { "action": "EXPORT", "extraInfo": { "label": "导出", "url": "/00O900000080tYR?csvsetup=1"}}], [{ "action": "EDIT", "extraInfo": { "label": "自定义", "url": "/00O900000080r5D/e?retURL=%2F00O%2Fo"} }, { "action": "DELETE", "extraInfo": { "csrf": "d7ILcCYY3ZMPVse_AMzy8Akfigxsy1y.4BmhZZxj9KJHPChdYvRwve7w3J47ZJ5IJGfQSfWLom5x1adA5SdVgLcoLXUphMXHUsBdk6PNR0WTmbTRwmaxqNhMiJ5FeCsU3cM4Jfbn7oD8i6q5F208B4PZ7F8=", "label": "删除", "url": "/setup/own/deleteredirect.jsp?delID=00O900000080r5D&retURL=%2F00O%2Fo&_CONFIRMATIONTOKEN=GfQeUQurSvDwI.RMwCSwXDa_0kLbtHH3mrb2G0rYxOAvN38vmxielinC40s8B15.RvGyXp9vT6nNdSu_EYctmTgEs1vJAfl_AR1KtpFbKYHclrEafxkOG3OMFh1i5X2ATdS1ZT4kyflkipuW2UHjMH0vGWU%3D"} }, { "action": "EXPORT", "extraInfo": { "label": "导出", "url": "/00O900000080r5D?csvsetup=1"}}]], "ACTION_COLUMN_LABELS": [], "ACTION_COLUMN": [["\u003Cspan class=\"actionItems\"\u003E\u003Cimg src=\"/s.gif\" alt=\"操作\" class=\"actionButtonArrow\" title=\"操作\" /\u003E\u003Cspan class=\"managedIcon\"\u003E\u003C/span\u003E\u003C/span\u003E"], ["\u003Cspan class=\"actionItems\"\u003E\u003Cimg src=\"/s.gif\" alt=\"操作\" class=\"actionButtonArrow\" title=\"操作\" /\u003E\u003Cspan class=\"managedIcon\"\u003E\u003C/span\u003E\u003C/span\u003E"], ["\u003Cspan class=\"actionItems\"\u003E\u003Cimg src=\"/s.gif\" alt=\"操作\" class=\"actionButtonArrow\" title=\"操作\" /\u003E\u003Cspan class=\"managedIcon\"\u003E\u003C/span\u003E\u003C/span\u003E"], ["\u003Cspan class=\"actionItems\"\u003E\u003Cimg src=\"/s.gif\" alt=\"操作\" class=\"actionButtonArrow\" title=\"操作\" /\u003E\u003Cspan class=\"managedIcon\"\u003E\u003C/span\u003E\u003C/span\u003E"]], "LASTMODIFIED": ["\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/0059000000390Wh\"\u003E\u003Cspan\u003Eliu jack\u003C/span\u003E\u003C/a\u003E"], "CREATED_DATE": ["2014-12-6 上午9:32", "2014-12-6 上午9:32", "2014-11-24 下午10:20", "2014-11-24 下午4:54"], "FOLDER_NAME": ["Milestones PM Dashboards", "Milestones PM Dashboards", "我的个人自定义报表", "我的个人自定义报表"], "LIST_RECORD_ID": ["01Z90000000QllK", "01Z90000000QllJ", "00O900000080tYR", "00O900000080r5D"], "ITEM_REPORT_MOVE_TO_UNFILED_PUBLIC_KEY": [false, false, true, true], "ITEM_MOVE_TO_ANY_VISIBLE_FOLDER_KEY": [true, true, true, true], "ITEM_FOLDER_ID_KEY": ["00l90000000gWg6", "00l90000000gWg6", "0059000000390Wh", "0059000000390Wh"], "ITEM_DASHBOARD_MOVE_TO_PERSONAL_FOLDER": [true, true, false, false], "ITEM_EDIT_ACCESS_KEY": [true, true, true, true] }, "columnWidths": [368, 125, 125, 80, 174, 174], "filter": { "staticTranslation": false, "scopeEntity": "", "scope": 2, "availableColumns": [{ "useRolodex": false, "isSortable": true, "columnName": "CRON_TRIGGER_ID", "label": "已计划" }, { "useRolodex": true, "isSortable": true, "columnName": "FOLDER_NAME", "label": "文件夹" }, { "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["用户", "005"]], "isSortable": true, "columnName": "CREATED_BY_NAME", "label": "创建人", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "useNewLookups": false }, { "useRolodex": false, "fieldType": "DATETIME", "isSortable": true, "columnName": "CREATED_DATE", "label": "创建日期", "fieldId": "CreatedDate", "hasTime": true }, { "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["用户", "005"]], "isSortable": true, "columnName": "LASTMODIFIED", "label": "上次修改人", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "useNewLookups": false }, { "useRolodex": false, "fieldType": "DATETIME", "isSortable": true, "columnName": "LASTMODIFIEDDATE", "label": "上次修改日期", "fieldId": "LastModifiedDate", "hasTime": true}], "entityType": "00O", "type": "analytics", "editable": true, "id": "00B90000008LeeX", "scopeEntity2": "", "bodyClass": "reportTab", "isCloneable": true, "showCheckBox": false, "name": "View_0059000000390WhAAI", "isCreateNewDisplayed": true, "owner": "0059000000390Wh", "shownColumns": [{ "useRolodex": true, "maxLength": 40, "fieldType": "TEXT", "isSortable": true, "columnName": "NAME", "label": "名称", "fieldId": "Name" }, { "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["用户", "005"]], "isSortable": true, "columnName": "LASTMODIFIED", "label": "上次修改人", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "useNewLookups": false }, { "useRolodex": false, "fieldType": "DATETIME", "isSortable": true, "columnName": "CREATED_DATE", "label": "创建日期", "fieldId": "CreatedDate", "hasTime": true }, { "useRolodex": false, "isSortable": true, "columnName": "CRON_TRIGGER_ID", "label": "已计划" }, { "useRolodex": true, "isSortable": true, "columnName": "FOLDER_NAME", "label": "文件夹" }, { "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["用户", "005"]], "isSortable": true, "columnName": "CREATED_BY_NAME", "label": "创建人", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "useNewLookups": false}], "language": "CHINESE_SIMP", "filters": [] }, "totalRowCount": 4 }, null, null, null, -1, '查找报表和仪表板...', '25', true);</script>
                                <div class="individualPalette listViewportWrapper" id="listview_wrapper">
                                    <div class="listViewport reportBlock" id="listview_listViewport">
                                        <form action="" id="listview_actionForm" method="POST" name="listview_actionForm"
                                        onsubmit="return ListViewport.instances['listview'].verify('请至少选择一行')">
                                        <input type="hidden" id="listview_pageState" name="listview_pageState" value="" /><input
                                            type="hidden" id="listview_rolodexState" name="listview_rolodexState" value="" /><input
                                                type="hidden" id="retURL" name="retURL" value="/09O?fcf=00l90000000gRD2" /><div class="topNav primaryPalette"
                                                    id="listview_topNav">
                                                    <div class="controls">
                                                        <span class="divisionLabel" id="listview_divisionLabel"></span>
                                                        <div class="topNavTab" id="listview_topNavTab">
                                                        </div>
                                                        <div class="clearingBox">
                                                        </div>
                                                    </div>
                                                </div>
                                        <div class="subNav" id="listview_subNav">
                                            <div class="linkBar brandSecondaryBrd">
                                                <div id="listview_search">
                                                </div>
                                                <div class="filterSection">
                                                    <div class="filtersContainer">
                                                        <select id="listview_scope" name="scope">
                                                            <option value="noFilter" selected="selected">所有项目</option>
                                                            <option value="recentlyViewed">最近查看</option>
                                                            <option value="createdByMe">我创建的项目</option>
                                                        </select></div>
                                                    <div class="filtersContainer">
                                                        <select id="listview_entityType" name="entityType">
                                                            <option value=""  selected="selected">所有类型</option>
                                                            <option value="0">草稿</option>
                                                            <option value="1">已发布</option> 
                                                            <option value="2">审核不通过</option>                                                            
                                                        </select></div>
                                                </div>
                                                <div class="clearingBox">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="listBody" id="listview_listBody">
                                            <div class="exception" id="listview_exception">
                                            </div>
                                        </div>
                                        <div class="offPageIds" id="listview_offPageIds">
                                        </div>
                                        </form>
                                        <div class="bottomNav" id="listview_bottomNav">
                                            正在加载...</div>
                                    </div>
                                    <div class="feedContainer" id="listview_feedContainer" style="display: none">
                                        <div class="feedBody" id="listview_feedBody">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="homeContent" id="homeContentDest">
                        </div>
                        <script type="text/javascript">
                            Ext.BLANK_IMAGE_URL = '/s.gif';
                            Ext.QuickTips.init();

                            sfdc.analytics.framework.initTreeSearchQuickfindInput();

                            var disableTour = false;
                            //Sfdc.analytics.home.AnalyticsHome.initGuidedTour(disableTour, "javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);");

                            Sfdc.analytics.home.AnalyticsHome.initAfterPageLoad();

                            // Only supporting the resizing logic if not in accessable mode or on an IOS device.
                            if (UserContext.isAccessibleMode ||            Sfdc.userAgent.isSafariIOS ||            Sfdc.userAgent.isSafariIpad) {

                                // Make the home content visible and adjust the styling
                                var homeContent = Sfdc.get('homeContent');
                                Sfdc.Dom.setStyle(homeContent, 'visibility', 'visible');

                                var sidebar = Sfdc.get('sidebar');
                                Sfdc.Dom.addClass(sidebar, 'noTableSidebar');

                                var listView = Sfdc.get('listview');
                                Sfdc.Dom.setStyle(listView, 'padding', '0 10px');
                            }
                            else {

                                // W-1621147
                                // Want to allow resizing of the folder tree. Customers had labels cropped.
                                // Using an Ext Panel with a border layout to get a scroll bar.
                                //
                                // Unfortunately, the two elements we want to resize are not Ext components.
                                // Ext only resizes components nicely. We're grabbing the existing elements
                                // that visualforce has rendered and then have some logic to fix up the sizes.

                                // Render the panel to homeContent
                                Ext.onReady(function () {
                                    var homePanel = new Sfdc.analytics.home.HomePanel({
                                        elementName: 'homeContentDest',
                                        sidebarElem: 'sidebar',
                                        listviewElem: 'listview'
                                    });

                                    homePanel.render('homeContentDest');
                                    homePanel.fitSize();
                                });
                            }

                        </script>
                        <script src="/jslibrary/sfdc/Chatter.js"></script>
                        <script>    //chatter.getToolbox().setToken('');</script>
                        <script type="text/javascript">                            Sfdc.onReady(function () {
                                SfdcApp && SfdcApp.Visualforce && SfdcApp.Visualforce.VSManager && SfdcApp.Visualforce.VSManager.vfPrepareForms(["thePage:j_id16"]);
                            });
                        </script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); ; if (this.loadChatFrameJs) loadChatFrameJs(); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "xIcfQm72sM4MFIaclM4cVryHmYNWnRSVCPApZTmJRXzxhJl_G1ZBTMBgiV8wqeq5vRyd1WiVkeenYw9YRgjLCDtj..elerdM13UF4ZYt.DH22pi9Atm9.iRDBAm.pHlrkBQSqKZ60WeYWXj_f73JSdoYD1jAa8xYhSWjqBVeU3UW.t5mJl8Fs9Pvs1DGm7S4gBlcjg=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();"
                                    onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                    onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker"
                                        name="calMonthPicker" title="月"><option value="0">一月</option>
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
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';"
                                        onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';"
                                        onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';"
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2013">
                                            2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                        </select></div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">
                                            星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">
                                        今天</a></div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    
    <div style="position: absolute; z-index: 15000; visibility: hidden; left: -10000px; top: -10000px;" class="x-menu x-menu-floating x-layer actionMenu 00l90000000gRD2-r x-hide-offsets" id="ext-comp-1033"><a tabindex="-1" onclick="return false;" href="#" class="x-menu-focus" id="ext-gen295"></a><ul class="x-menu-list" id="ext-gen296" style="height: 114px;"><li class="x-menu-list-item " id="x-menu-el-ext-comp-1338"><a href="#" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1338"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen353"><span class="x-menu-item-text" id="ext-gen354">固定到顶部</span></a></li><li class="x-menu-list-item " id="x-menu-el-ext-comp-1339"><a href="#" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1339"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen355"><span class="x-menu-item-text" id="ext-gen356">取消固定</span></a></li><li class="x-menu-list-item  x-menu-sep-li" id="x-menu-el-ext-comp-1340"><span class="x-menu-sep" id="ext-gen357">&nbsp;</span></li><li class="x-menu-list-item " id="x-menu-el-ext-comp-1341"><a href="#" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1341"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen358"><span class="x-menu-item-text" id="ext-gen359">共享</span></a></li><li class="x-menu-list-item " id="x-menu-el-ext-comp-1342"><a href="/00l90000000gRD2/e?cancelURL=%2F00O%3Ffcf%3D00l90000000gRD2&amp;retURL=%2F00O%2Fo" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1342"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen360"><span class="x-menu-item-text" id="ext-gen361">编辑</span></a></li><li class="x-menu-list-item " id="x-menu-el-ext-comp-1343"><a href="#" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1343"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen362"><span class="x-menu-item-text" id="ext-gen363">删除</span></a></li></ul></div>
    <div style="position: absolute; z-index: 15000; visibility: hidden; left: 271px; top: 291px;" class="x-menu x-menu-floating x-layer actionMenu x-menu-plain x-menu-nosep actionMenu-00O900000080tYR" id="ext-comp-1022"><a tabindex="-1" onclick="return false;" href="#" class="x-menu-focus" id="ext-gen138"></a><ul class="x-menu-list" id="ext-gen139" style="height: 78px;"><li class="x-menu-list-item" id="x-menu-el-ext-comp-1040"><a href="/00O900000080tYR/e?retURL=%2F00O%3Ffcf%3D00B90000008LeeX%26rolodexIndex%3D-1%26page%3D1" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1040"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen177"><span class="x-menu-item-text" id="ext-gen178">自定义</span></a></li><li class="x-menu-list-item" id="x-menu-el-ext-comp-1041"><a href="#" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1041"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen179"><span class="x-menu-item-text" id="ext-gen180">删除</span></a></li><li class="x-menu-list-item" id="x-menu-el-ext-comp-1042"><a href="/00O900000080tYR?csvsetup=1" unselectable="on" hidefocus="true" class="x-menu-item" id="ext-comp-1042"><img class="x-menu-item-icon " src="/s.gif" alt="" id="ext-gen181"><span class="x-menu-item-text" id="ext-gen182">导出</span></a></li></ul></div>
</body>
</html>
<!-- page generation time: 87ms -->
