<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layoutEditor.aspx.cs" Inherits="WebClient.layouteditor.layoutEditor" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <title>编辑页面布局: Account Layout ~ .com - 系统设置</title>
    <script src="/static/111213/js/perf/stub.js" type="text/javascript"></script>
    <script src="/jslibrary/ajax4jsf.js"  type="text/javascript"></script>
    <script src="/jslibrary/sfdc/SfdcCore.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/Prototype.js" type="text/javascript"></script>
    <script src="/EXT/ext-3.3.3/ext.js" type="text/javascript"></script>
    <script src="/EXT/ext-3.3.3/examples/ux/MultiSelect.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/source/LayoutEditor.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/MessageHandler.js" type="text/javascript"></script>
    <script src="/static/111213/js/picklist.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/VFState.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/zh_CN.js" type="text/javascript"></script>
    <!--<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>-->
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/elements.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/48.0/sprites/1580155678000/Theme3/zh/base/common.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/setup.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/base/dStandard.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/extended.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/EXT/ext-3.2.2/resources/css/ext-all-notheme.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/ExtCSS-SFDC.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/EXT/ext-3.2.2/examples/ux/css/MultiSelect.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/layoutEditor.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css"
        rel="stylesheet" type="text/css" />
                        <script src="/js/jquery/1.7.1/jquery.min.js"></script>

    <script type="text/javascript">

//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = false;
        }
    </script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1418697584000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-12-25 下午2:27", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        // ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '118.186.239.76', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Flayouteditor%2FlayoutEditor.apexp%3Ftype%3DAccount%26lid%3D00h9000000RbNya%26retURL%3D%252F00190000019mlFI');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif setupTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />            
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv_setup">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="oLeft">
                      <cc1:SetupNavTree ID="SetupNavTree1" runat="server" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><span id="j_id0"></span><span
                                    id="j_id0:j_id5"></span>
                        <script type="text/javascript">
                           // sfdcPage.appendToOnloadQueue(function () { new Sfdc.GuidedTour({ "steps": [{ "locator": "div.selectorItem#troughCategory__Analytics", "position": "t-b", "offsets": [0, 0], "width": 350, "height": 200, "useArrow": true, "arrowOffset": 0, "title": "添加报表图表", "content": "\u003Cdiv class=\"analyticsFeatureCallout\"\u003E\u003Ctable\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cp\u003E直接在详细信息页面上向用户显示有用的报表数据。只需从此处将报表图表拖放到页面布局中，并调整图表设置。观看此视频以开始使用！\u003C/p\u003E\u003C/td\u003E\u003Ctd\u003E\u003Ca target=\"_blank\" href=\"http://www..com/_app/video/reports/help/Showing_Report_Charts_on_Pages\"\u003E\u003Cimg id=\"analyticsFeatureCalloutThumbnail\" src=\"/projRes/analytics-platform/img/showing-report-charts-on-pages.png\" /\u003E\u003C/a\u003E\u003C/td\u003E\u003C/div\u003E", "toolbarItems": [{ "xtype": "button", "labelType": "showLaterLabel", "action": "showLaterHandler"}], "countStep": true, "afterShow": function () { Ext.onReady(function () { var analyticsItem = Ext.get('troughCategory__Analytics'); if (analyticsItem) { var trough = Ext.get('troughSelector'); if (trough) { analyticsItem.scrollIntoView(trough); } analyticsItem.parent().addClass('hover'); } }); } }], "shouldShowHandler": function () { return Ext.util.Cookies.get('embeddedcomponentcalloutcookie') !== '1'; }, "showLaterHandlerIntercept": function () { Ext.util.Cookies.set('embeddedcomponentcalloutcookie', '1'); Ext.get('troughCategory__Analytics').parent().removeClass('hover'); }, "closeForeverHandlerIntercept": function () { Ext.util.Cookies.set('embeddedcomponentcalloutcookie', '1'); Ext.get('troughCategory__Analytics').parent().removeClass('hover'); UserContext.userPreferences.setBoolean('HideEmbeddedComponentsFeatureCallout', true); }, "closeIntroLabel": "不了，谢谢", "closeOutroLabel": "关闭", "showLaterLabel": "稍后显示", "startTourLabel": "开始浏览", "endTourLabel": "结束浏览", "previousLabel": "上一页", "continueLabel": "继续", "replayLabel": "重放" }).start(); }, 'Guided Tour: start'); ;
                        </script>
                        <div id="loadingSpinner">
                            <h1>
                                &#27491;&#22312;&#21152;&#36733;...</h1>
                        </div>
                        <script type="text/javascript">
                            //Speed up appearance of page rendering on IE only, no effect on other browsers
                            window.offscreenBuffering = false;
                        </script>
                        <div class="layoutEdit">
                            <span id="j_id0:messagePanel">
                                <script type="text/javascript">
                                    if (false) {
                                        window.scrollTo(0, 0);
                                    }
                                </script>
                                <span id="j_id0:messages"></span></span><span id="j_id0:checkNameResult">
                                    <script type="text/javascript">
                                        if (typeof (VFEditor) != "undefined") {
                                            if (VFEditor.callbacks['checkName']) {
                                                VFEditor.callbacks['checkName'](false);
                                            }
                                        }
                                    </script>
                                </span><span id="j_id0:checkReportContextFilterableResult">
                                    <script type="text/javascript">
                                        if (typeof (VFEditor) != "undefined") {
                                            var callbackKey = 'checkReportContextFilterable' + '';
                                            if (VFEditor.callbacks[callbackKey]) {
                                                VFEditor.callbacks[callbackKey]([], false);
                                            }
                                        }
                                    </script>
                                </span><span id="j_id0:analyticsSearchResult">
                                    <script type="text/javascript">
                                        if (typeof (VFEditor) != "undefined") {
                                            var callbackKey = 'analyticsSearch' + '';
                                            //todo dan.perry Add callId for no overlap
                                            if (VFEditor.callbacks[callbackKey]) {
                                                VFEditor.callbacks[callbackKey]([]);
                                            }
                                        }
                                    </script>
                                </span><span id="j_id0:j_id40"></span>
                            <table id="j_id0:headerBar" class="headerBar">
                                <tbody>
                                    <tr>
                                        <td class="layoutName">
                                            <span id="j_id0:j_id43">
                                                <div id="layoutName">
                                                    &nbsp;</div>
                                            </span>
                                        </td>
                                        <td class="headerButtons">
                                            <span id="j_id0:j_id45">
                                                <div id="headerButtons">
                                                </div>
                                            </span>
                                        </td>
                                        <td class="headerLinks">
                                            <span id="j_id0:j_id47">
                                                <div id="headerLinks">
                                                    <a href="#" onclick="VFEditor.confirmLeave('contextPaneEditor')">&#33258;&#23450;&#20041;&#25511;&#21046;&#21488;&#32452;&#20214;</a><a
                                                        href="#" onclick="return VFEditor.confirmLeave('miniLayout')">&#24494;&#32553;&#39029;&#38754;&#24067;&#23616;</a><a
                                                            href="#" onclick="return VFEditor.confirmLeave('relatedObjects')">&#24494;&#32553;&#25511;&#21046;&#21488;&#35270;&#22270;</a><!--<span
                                                                id="j_id0:j_id61" class="seperator">|</span><a href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                                    title="&#24110;&#21161; &#65288;&#26032;&#31383;&#21475;&#65289;" class="helpLink"><span
                                                                        class="text">&#27492;&#39029;&#38754;&#30340;&#24110;&#21161;</span><img src="/s.gif"
                                                                            title="Help" class="helpIcon" /></a>-->
                                                </div>
                                            </span>
                                        </td>
                                        <td class="nonce">
                                            <form id="j_id0:f" name="j_id0:f" method="post" action="/layouteditor/layoutEditor.aspx"
                                            enctype="application/x-www-form-urlencoded">
                                            <input type="hidden" name="j_id0:f" value="j_id0:f" />
                                            <input type="hidden" name="layoutId" id="layoutId" value="<%=Request["lid"]%>" />
                                            <input type="hidden" name="entityId" id="entityId" value="<%=Request["type"]%>" />
                                            <div style="display: none">
                                                <input class="btn" id="j_id0:f:quickSave" name="j_id0:f:quickSave" onclick="VFEditor.showProgress(); VFEditor.updateJsonLayout();A4J.AJAX.Submit('j_id0:f',event,{'oncomplete':function(request,event,data){VFEditor.afterQuicksave();},'similarityGroupingId':'j_id0:f:quickSave','parameters':{'j_id0:f:quickSave':'j_id0:f:quickSave'} } );return false;"
                                                    value="Quick Save" type="button" /><input class="btn" id="j_id0:f:save" name="j_id0:f:save"
                                                        onclick="VFEditor.showProgress(); VFEditor.updateJsonLayout();;A4J.AJAX.Submit('j_id0:f',event,{'oncomplete':function(request,event,data){VFEditor.afterSave();},'similarityGroupingId':'j_id0:f:save','parameters':{'j_id0:f:save':'j_id0:f:save'} } );return false;"
                                                        value="Save" type="button" /><input class="btn" id="j_id0:f:saveAs" name="j_id0:f:saveAs"
                                                            onclick="VFEditor.showProgress(); VFEditor.updateJsonLayout();A4J.AJAX.Submit('j_id0:f',event,{'oncomplete':function(request,event,data){VFEditor.afterSaveAs();},'similarityGroupingId':'j_id0:f:saveAs','parameters':{'j_id0:f:saveAs':'j_id0:f:saveAs'} } );return false;"
                                                            value="Save As" type="button" /><input id="j_id0:f:cancel" type="submit" name="j_id0:f:cancel"
                                                                value="Cancel" class="btn" /><input id="j_id0:f:jsonLayout" type="hidden" name="j_id0:f:jsonLayout" /><input
                                                                    id="j_id0:f:clearUserLists" type="hidden" name="j_id0:f:clearUserLists" value="false" /><script
                                                                        id="j_id0:f:j_id70" type="text/javascript">                                                                                                                                                                vfeditor_checkName = function (layoutName) { A4J.AJAX.Submit('j_id0:f', null, { 'similarityGroupingId': 'j_id0:f:j_id70', 'parameters': { 'layoutName': (typeof layoutName != 'undefined' && layoutName != null) ? layoutName : '', 'j_id0:f:j_id70': 'j_id0:f:j_id70'} }) };
                                                                    </script><script id="j_id0:f:j_id72" type="text/javascript">                                                                                 vfeditor_checkReportContextFilterable = function (reportId) { A4J.AJAX.Submit('j_id0:f', null, { 'similarityGroupingId': 'j_id0:f:j_id72', 'parameters': { 'j_id0:f:j_id72': 'j_id0:f:j_id72', 'reportId': (typeof reportId != 'undefined' && reportId != null) ? reportId : ''} }) };
                                                                    </script><script id="j_id0:f:j_id74" type="text/javascript">                                                                                 vfeditor_hideIEMessage = function () { A4J.AJAX.Submit('j_id0:f', null, { 'oncomplete': function (request, event, data) { VFEditor.refreshTroughPosition(); }, 'similarityGroupingId': 'j_id0:f:j_id74', 'parameters': { 'j_id0:f:j_id74': 'j_id0:f:j_id74'} }) };
                                                                    </script><script id="j_id0:f:j_id75" type="text/javascript">                                                                                 vfeditor_analyticsSearch = function (criteria, callbackSuffix) { A4J.AJAX.Submit('j_id0:f', null, { 'similarityGroupingId': 'j_id0:f:j_id75', 'parameters': { 'callbackSuffix': (typeof callbackSuffix != 'undefined' && callbackSuffix != null) ? callbackSuffix : '', 'j_id0:f:j_id75': 'j_id0:f:j_id75', 'criteria': (typeof criteria != 'undefined' && criteria != null) ? criteria : ''} }) };
                                                                    </script>
                                            </div>
                                            <script type="text/javascript">
                                                var commandButtonsById = {
                                                    quickSave: "j_id0:f:quickSave",
                                                    save: "j_id0:f:save",
                                                    cancel: "j_id0:f:cancel",
                                                    saveAs: "j_id0:f:saveAs"
                                                };

                                                var hiddenInputsById = {
                                                    jsonLayout: "j_id0:f:jsonLayout",
                                                    clearUserLists: "j_id0:f:clearUserLists"
                                                }
                                            </script>
                                            <div id="j_id0:f:j_id88">
                                            </div>
                                            </form>
                                            <span id="ajax-view-state-page-container" style="display: none"><span id="ajax-view-state"
                                                style="display: none">
                                                <input type="hidden" id="com.salesforce.visualforce.ViewState" name="com.salesforce.visualforce.ViewState"
                                                    value="" /><input
                                                        type="hidden" id="com.salesforce.visualforce.ViewStateVersion" name="com.salesforce.visualforce.ViewStateVersion"
                                                        value="" /><input type="hidden" id="com.salesforce.visualforce.ViewStateMAC"
                                                            name="com.salesforce.visualforce.ViewStateMAC" value="ARfc0Y9zxnZtyJc/fiH2f6JiuwXb" /><input
                                                                type="hidden" id="com.salesforce.visualforce.ViewStateCSRF" name="com.salesforce.visualforce.ViewStateCSRF"
                                                                value="" /></span></span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <script type="text/javascript">

                            
                                //layoutData = { "relatedContent": { "sectionName": "移动卡", "labelKey": "RelatedContent", "categoriesAllowed": { "AuraComponent": true, "RelatedLookup": true, "Page": true, "Canvas": true }, "nameReadonly": true, "canChangeColumns": true, "canDeleteSection": false, "showEditHeader": true, "showDetailHeader": true, "sortOrder": "v", "columns": [] }, "otherLayouts": [{ "id": "e6297bb7-c752-46ed-94ae-45f673a1060e", "name": "HRPost Layout", "label": "岗位", "issortable": false, "namespace": null, "type": null }], "buttonsRevoked": ["BTN__Submit"], "summaryLayout": { "columns": [[], [], [], []], "style": [["Default"]] }, "taggingInfo": { "privateAllowed": false, "publicAllowed": false, "hasPrivate": false, "hasPublic": false }, "specialOptions": [{ "id": "highlightsPanel", "label": "高亮显示面板", "instr": "在控制台中显示", "value": false, "isRadio": false }, { "id": "interactionLogPanel", "label": "交互式日志", "instr": "在控制台中显示", "value": false, "isRadio": false }], "isDetailMode": false, "layoutName": "HRPost Layout", "namespacePrefix": "", "layoutTitle": "岗位", "layoutNameEditable": true, "showClearUserLists": true, "title": "岗位", "otherLayoutUrlTpl": "/layouteditor/layoutEditor.apexp?type={type}&lid={id}&retURL=%2F0039000001HgjaT&setupid=ContactLayouts", "paletteClass": "listRelatedObject customnotabBlock", "sections": [], "relatedLists": [], "isUserLayout": false }
                                //troughData =
                                layoutData = <%=LayoutDataJsonMethod()%>
                                troughData = <%=TroughDataJson%>
                                    console.log(troughData)
                                //troughData =[{"type":"M","alwaysDisplayed":true,"alwaysNotRequired":false,"alwaysNotReadonly":false,"length":100,"required":false,"alwaysReadonly":false,"readonly":false,"id":"9fe55955-179a-4372-8bf9-c96ebfd4122f","displayCategory":"Field","category":"CustomField","name":"Name","label":"岗位名称"}];
                                //console.log(layoutData)
                                //console.log(troughData)
                               //troughData = [{ "label": "Data.com 密钥", "alwaysRequired": false, "type": "S", "id": "Jigsaw", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Jigsaw", "length": 20, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "QA__09D90000003DSaT", "category": "QuickAction", "name": "Contact.Deskcom__SF1_Contact_Page", "displayCategory": "QuickAction", "label": "Desk.com Case", "actionType": "自定义 Visualforce" }, { "id": "QuickAction__Contact.Deskcom__SF1_Contact_Page", "category": "PlatformAction", "name": "Contact.Deskcom__SF1_Contact_Page", "displayCategory": "PlatformAction", "label": "Desk.com Case", "actionType": "快速操作" }, { "stdListButtons": [{ "label": "新建", "id": "New", "isCustom": false, "isDefaultOff": false }], "label": "Desk.com Cases", "isSortCustomizable": true, "id": "RL__00N9000000DoRHi", "defaultColumns": ["NAME", "00N9000000DoRHs", "00N9000000DoRHq", "00N9000000DoRHr", "00N9000000DoRHn", "00N9000000DoRHj", "00N9000000DoRHg", "CREATED_DATE"], "category": "CustomRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "NAME", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "NAME", "label": "Heading", "isSortable": true, "type": "S" }, { "filterColumn": "00N9000000DoRHs", "label": "Subject", "isSortable": true, "type": "S" }, { "filterColumn": "00N9000000DoRHq", "label": "Priority", "isSortable": true, "type": "L" }, { "filterColumn": "00N9000000DoRHr", "label": "Status", "isSortable": true, "type": "L" }, { "filterColumn": "00N9000000DoRHn", "label": "Channel", "isSortable": true, "type": "L" }, { "filterColumn": "00N9000000DoRHj", "label": "Lead", "isSortable": true, "type": "M" }, { "filterColumn": "00N9000000DoRHg", "label": "Account", "isSortable": true, "type": "m" }, { "filterColumn": "CREATED_DATE", "label": "创建日期", "isSortable": true, "type": "F" }] }, { "id": "PG__06690000005iBg8", "category": "Page", "height": 200, "showScrollbars": false, "showLabel": false, "width": -100, "name": "DeskCaseContact [Deskcom__DeskCaseContact]", "displayCategory": "Page", "label": "DeskCaseContact", "isMobileEnabled": false }, { "id": "PG__06690000005hzAR", "category": "Page", "height": 200, "showScrollbars": false, "showLabel": false, "width": -100, "name": "Explorer_Contact_Page [sfexplorer__Explorer_Contact_Page]", "displayCategory": "Page", "label": "Explorer_Contact_Page", "isMobileEnabled": false }, { "id": "RL__RelatedEmailStatusList", "defaultColumns": ["ACTIVITY.SUBJECT", "EMAIL_STATUS.CREATED_DATE", "EMAIL_STATUS.FIRST_OPEN_DATE", "EMAIL_STATUS.TIMES_OPENED", "EMAIL_STATUS.LAST_OPEN_DATE"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "label": "HTML 电子邮件状态", "nameColumn": "ACTIVITY.SUBJECT", "isSortCustomizable": true, "listCustomizable": true, "selectableColumns": [{ "filterColumn": "ACTIVITY.SUBJECT", "label": "主题", "isSortable": true, "type": "L" }, { "filterColumn": "EMAIL_STATUS.CREATED_DATE", "label": "发送日期", "isSortable": true, "type": "F" }, { "filterColumn": "EMAIL_STATUS.FIRST_OPEN_DATE", "label": "打开日期", "isSortable": true, "type": "F" }, { "filterColumn": "EMAIL_STATUS.TIMES_OPENED", "label": "打开次数", "isSortable": true, "type": "N", "sampleData": "6,118" }, { "filterColumn": "EMAIL_STATUS.LAST_OPEN_DATE", "label": "上次打开时间", "isSortable": true, "type": "F" }] }, { "label": "Languages", "alwaysRequired": false, "type": "S", "id": "00N9000000CFoa5", "category": "CustomField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Languages", "length": 100, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "label": "Level", "alwaysRequired": false, "type": "L", "id": "00N9000000CFoa6", "category": "CustomField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Level", "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "id": "01N90000000Myqa", "category": "CustomSControl", "height": 200, "showScrollbars": false, "showLabel": false, "width": -100, "name": "redirectToSmart", "displayCategory": "SControl", "label": "redirectToSmart" }, { "id": "AURA__sfa:socialPanel", "category": "AuraComponent", "name": "sfa:socialPanel", "displayCategory": "Aura", "label": "Twitter" }, { "label": "Twitter Username", "alwaysRequired": false, "type": "S", "id": "00N9000000DoRHu", "category": "CustomField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Deskcom.twitter_username", "length": 255, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "stdListButtons": [{ "label": "新建", "id": "New", "isCustom": false, "isDefaultOff": false }], "label": "VCSEmails", "isSortCustomizable": true, "id": "RL__00N9000000Dlef8", "defaultColumns": ["NAME"], "category": "CustomRelatedList", "customListButtons": [{ "label": "Compose to Case", "id": "00b90000000gYFe", "isCustom": true, "isDefaultOff": false }, { "label": "Compose to Contact", "id": "00b90000000gYFf", "isCustom": true, "isDefaultOff": false }, { "label": "Compose to Lead", "id": "00b90000000gYFg", "isCustom": true, "isDefaultOff": false }, { "label": "Compose to Opportunity", "id": "00b90000000gYFh", "isCustom": true, "isDefaultOff": false }, { "label": "Compose to Account", "id": "00b90000000gYFi", "isCustom": true, "isDefaultOff": false }, { "label": "Forward to Contact", "id": "00b90000000gYFj", "isCustom": true, "isDefaultOff": false }, { "label": "Forward to Case", "id": "00b90000000gYFk", "isCustom": true, "isDefaultOff": false }, { "label": "Forward to Contact", "id": "00b90000000gYFl", "isCustom": true, "isDefaultOff": false }, { "label": "Forward to Lead", "id": "00b90000000gYFm", "isCustom": true, "isDefaultOff": false }, { "label": "Forward to Opportunity", "id": "00b90000000gYFn", "isCustom": true, "isDefaultOff": false }, { "label": "Reply All to Case", "id": "00b90000000gYFo", "isCustom": true, "isDefaultOff": false }, { "label": "Reply All to Contact", "id": "00b90000000gYFp", "isCustom": true, "isDefaultOff": false }, { "label": "Reply All to Lead", "id": "00b90000000gYFq", "isCustom": true, "isDefaultOff": false }, { "label": "Reply All to Opportunity", "id": "00b90000000gYFr", "isCustom": true, "isDefaultOff": false }, { "label": "Reply to Case", "id": "00b90000000gYFs", "isCustom": true, "isDefaultOff": false }, { "label": "Reply to Contact", "id": "00b90000000gYFt", "isCustom": true, "isDefaultOff": false }, { "label": "Reply to Lead", "id": "00b90000000gYFu", "isCustom": true, "isDefaultOff": false }, { "label": "Reply to Opportunity", "id": "00b90000000gYFv", "isCustom": true, "isDefaultOff": false }], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "NAME", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "NAME", "label": "Name", "isSortable": true, "type": "S" }] }, { "id": "01N90000000Myqb", "category": "CustomSControl", "height": 200, "showScrollbars": false, "showLabel": false, "width": -100, "name": "viewEmail", "displayCategory": "SControl", "label": "viewEmail" }, { "stdListButtons": [], "label": "报价", "isSortCustomizable": true, "id": "RL__RelatedQuoteList", "defaultColumns": ["QUOTE.QUOTENUMBER", "QUOTE.NAME", "QUOTE.EXPIRATIONDATE", "QUOTE.ISSYNCING", "Discount", "GrandTotal", "CreatedBy"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "QUOTE.QUOTENUMBER", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "QUOTE.QUOTENUMBER", "label": "报价编号", "isSortable": true, "type": "V" }, { "filterColumn": "QUOTE.NAME", "label": "报价名称", "isSortable": true, "type": "S" }, { "filterColumn": "QUOTE.EXPIRATIONDATE", "label": "到期日期", "isSortable": true, "type": "D" }, { "filterColumn": "QUOTE.ISSYNCING", "label": "正在同步", "isSortable": true, "type": "B" }, { "filterColumn": "Discount", "label": "折扣", "isSortable": true, "type": "N" }, { "filterColumn": "GrandTotal", "label": "总计", "isSortable": true, "type": "C" }, { "filterColumn": "CreatedBy", "label": "创建人", "isSortable": true, "type": "M" }] }, { "label": "备注", "alwaysRequired": false, "type": "J", "id": "Description", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Description", "length": 32000, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "RL__RelatedNoteList", "defaultColumns": [], "category": "StandardRelatedList", "columnsLoaded": false, "displayCategory": "RelatedList", "label": "备注和附件", "isSortCustomizable": false, "listCustomizable": false }, { "id": "BTN__Edit", "category": "StandardButton", "btnOrder": 0, "removable": true, "name": "Edit", "displayCategory": "Button", "label": "编辑" }, { "id": "StandardButton__Edit", "category": "PlatformAction", "name": "Edit", "displayCategory": "PlatformAction", "label": "编辑", "actionType": "标准按钮" }, { "label": "部门", "alwaysRequired": false, "type": "S", "id": "Department", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Department", "length": 80, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "BTN__ViewCustomerPortal", "category": "StandardButton", "btnOrder": 6, "removable": true, "name": "ViewCustomerPortal", "displayCategory": "Button", "label": "查看客户用户" }, { "label": "出生日期", "alwaysRequired": false, "type": "D", "id": "Birthdate", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Birthdate", "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "label": "传真", "alwaysRequired": false, "type": "G", "id": "Fax", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Fax", "length": 40, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "label": "创建人", "alwaysRequired": false, "type": "Y", "id": "CreatedBy", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "typeArgs": ["用户"], "alwaysNotReadonly": false, "name": "CreatedBy", "displayCategory": "Field", "required": false, "alwaysReadonly": true, "readonly": true }, { "id": "RLo__CreatedBy", "category": "RelatedLookup", "name": "CreatedBy", "displayCategory": "RelatedLookup", "label": "创建人" }, { "id": "00b90000000gTJ8", "category": "CustomLink", "removable": true, "name": "WebLink", "displayCategory": "CustomLink", "label": "地图" }, { "label": "电话", "alwaysRequired": false, "type": "H", "id": "Phone", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Phone", "length": 40, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "label": "电子邮件", "alwaysRequired": false, "type": "E", "id": "Email", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Email", "length": 80, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "ProductivityAction__EmailHighlightAction", "category": "PlatformAction", "name": "EmailHighlightAction", "displayCategory": "PlatformAction", "label": "发送电子邮件", "actionType": "工作效率（突出显示）操作" }, { "id": "BTN__Clone", "category": "StandardButton", "btnOrder": 2, "removable": true, "name": "Clone", "displayCategory": "Button", "label": "复制" }, { "id": "StandardButton__Clone", "category": "PlatformAction", "name": "Clone", "displayCategory": "PlatformAction", "label": "复制", "actionType": "标准按钮" }, { "stdListButtons": [{ "label": "新个案", "id": "NewCase", "isCustom": false, "isDefaultOff": false }], "label": "个案", "isSortCustomizable": true, "id": "RL__RelatedCaseList", "defaultColumns": ["CASES.CASE_NUMBER", "CASES.SUBJECT", "CASES.PRIORITY", "CASES.CREATED_DATE", "CASES.STATUS", "OWNER_NAME"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "CASES.CASE_NUMBER", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "CASES.CASE_NUMBER", "label": "个案", "isSortable": true, "type": "V" }, { "filterColumn": "CASES.SUBJECT", "label": "主题", "isSortable": true, "type": "S" }, { "filterColumn": "CASES.PRIORITY", "label": "优先级", "isSortable": true, "type": "L" }, { "filterColumn": "CASES.CREATED_DATE", "label": "开始日期/时间", "isSortable": true, "type": "F" }, { "filterColumn": "CASES.STATUS", "label": "状态", "isSortable": true, "type": "L" }, { "filterColumn": "OWNER_NAME", "label": "所有人", "isSortable": true, "type": "M" }] }, { "id": "BTN__DataDotComClean", "category": "StandardButton", "btnOrder": 9, "removable": true, "name": "DataDotComClean", "displayCategory": "Button", "label": "更新" }, { "label": "更新状态", "alwaysRequired": false, "type": "L", "id": "CleanStatus", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "name": "CleanStatus", "displayCategory": "Field", "required": false, "readonly": true, "alwaysReadonly": true }, { "id": "BTN__Share", "category": "StandardButton", "btnOrder": 3, "removable": true, "name": "Share", "displayCategory": "Button", "label": "共享" }, { "id": "StandardButton__Share", "category": "PlatformAction", "name": "Share", "displayCategory": "PlatformAction", "label": "共享", "actionType": "标准按钮" }, { "stdListButtons": [{ "label": "记录电话", "id": "LogCall", "isCustom": false, "isDefaultOff": false }, { "label": "邮件合并", "id": "MailMerge", "isCustom": false, "isDefaultOff": false }, { "label": "发送电子邮件", "id": "SendEmail", "isCustom": false, "isDefaultOff": false }, { "label": "请求更新", "id": "RequestUpdate", "isCustom": false, "isDefaultOff": false }, { "label": "查看全部", "id": "ViewAll", "isCustom": false, "isDefaultOff": false }], "label": "活动历史", "isSortCustomizable": false, "id": "RL__RelatedHistoryList", "defaultColumns": ["TASK.SUBJECT", "TASK.WHAT_NAME", "ACTIVITY.TASK", "TASK.DUE_DATE", "CORE.USERS.FULL_NAME", "TASK.LAST_UPDATE"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "TASK.SUBJECT", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "TASK.SUBJECT", "label": "主题", "isSortable": true, "type": "S" }, { "filterColumn": "TASK.WHAT_NAME", "label": "相关项", "isSortable": true, "type": "m" }, { "filterColumn": "ACTIVITY.TASK", "label": "任务", "isSortable": true, "type": "B" }, { "filterColumn": "TASK.DUE_DATE", "label": "到期日期", "isSortable": true, "type": "F" }, { "filterColumn": "CORE.USERS.FULL_NAME", "label": "被分配人", "isSortable": true, "type": "M" }, { "filterColumn": "TASK.LAST_UPDATE", "label": "上次修改日期/时间", "isSortable": true, "type": "F" }] }, { "id": "QA__09D90000002aw8k", "category": "QuickAction", "targetEntityLabel": "任务", "name": "LogACall", "displayCategory": "QuickAction", "label": "记录电话", "actionType": "记录电话" }, { "id": "QuickAction__LogACall", "category": "PlatformAction", "name": "LogACall", "displayCategory": "PlatformAction", "label": "记录电话", "actionType": "快速操作" }, { "label": "家庭电话", "alwaysRequired": false, "type": "H", "id": "HomePhone", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "HomePhone", "length": 40, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "BTN__DisableCustomerPortal", "category": "StandardButton", "btnOrder": 8, "removable": true, "name": "DisableCustomerPortal", "displayCategory": "Button", "label": "禁用客户用户" }, { "label": "客户名", "alwaysRequired": false, "type": "Y", "id": "Account", "category": "StandardField", "alwaysDisplayed": true, "alwaysNotRequired": false, "typeArgs": ["客户"], "alwaysNotReadonly": false, "name": "Account", "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "RLo__Account", "category": "RelatedLookup", "name": "Account", "displayCategory": "RelatedLookup", "label": "客户名" }, { "label": "联系人所有人", "alwaysRequired": false, "type": "Y", "id": "Owner", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "typeArgs": ["用户"], "alwaysNotReadonly": false, "name": "Owner", "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "RLo__Owner", "category": "RelatedLookup", "name": "Owner", "displayCategory": "RelatedLookup", "label": "联系人所有人" }, { "id": "QA__FeedItem.LinkPost", "category": "QuickAction", "name": "FeedItem.LinkPost", "displayCategory": "QuickAction", "label": "链接", "actionType": "张贴" }, { "id": "QuickAction__FeedItem.LinkPost", "category": "PlatformAction", "name": "FeedItem.LinkPost", "displayCategory": "PlatformAction", "label": "链接", "actionType": "快速操作" }, { "id": "RL__RelatedContentDistributionList", "defaultColumns": ["Name", "CreatedBy", "CreatedDate", "ViewCount", "LastViewDate"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "label": "内容递送", "nameColumn": "Name", "isSortCustomizable": true, "listCustomizable": true, "selectableColumns": [{ "filterColumn": "Name", "label": "内容递送名称", "isSortable": true, "type": "S" }, { "filterColumn": "CreatedBy", "label": "创建人", "isSortable": true, "type": "M" }, { "filterColumn": "CreatedDate", "label": "创建日期", "isSortable": true, "type": "F" }, { "filterColumn": "ViewCount", "label": "查看计数", "isSortable": true, "type": "N", "sampleData": "19,164" }, { "filterColumn": "LastViewDate", "label": "最后一次查看", "isSortable": true, "type": "F" }] }, { "stdListButtons": [], "label": "批准历史", "isSortCustomizable": false, "id": "RL__RelatedProcessHistoryList", "defaultColumns": ["CreatedDate", "StepStatus", "OriginalActor", "Actor", "Comments"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "StepStatus", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "CreatedDate", "label": "日期", "isSortable": true, "type": "F" }, { "filterColumn": "StepStatus", "label": "状态", "isSortable": true, "type": "L" }, { "filterColumn": "OriginalActor", "label": "被分配人", "isSortable": true, "type": "M" }, { "filterColumn": "Actor", "label": "实际批准人", "isSortable": true, "type": "M" }, { "filterColumn": "Comments", "label": "留言", "isSortable": true, "type": "S" }] }, { "label": "其他地址", "alwaysRequired": false, "type": "A", "id": "OtherAddress", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "label": "其它电话", "alwaysRequired": false, "type": "H", "id": "OtherPhone", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "OtherPhone", "length": 40, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "BTN__EnableCustomerPortal", "category": "StandardButton", "btnOrder": 5, "removable": true, "name": "EnableCustomerPortal", "displayCategory": "Button", "label": "启用客户用户" }, { "label": "潜在客户来源", "alwaysRequired": false, "type": "L", "id": "LeadSource", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "LeadSource", "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "id": "BTN__RequestUpdate", "category": "StandardButton", "btnOrder": 4, "removable": true, "name": "RequestUpdate", "displayCategory": "Button", "label": "请求更新" }, { "id": "StandardButton__RequestUpdate", "category": "PlatformAction", "name": "RequestUpdate", "displayCategory": "PlatformAction", "label": "请求更新", "actionType": "标准按钮" }, { "id": "BTN__Delete", "category": "StandardButton", "btnOrder": 1, "removable": true, "name": "Delete", "displayCategory": "Button", "label": "删除" }, { "id": "StandardButton__Delete", "category": "PlatformAction", "name": "Delete", "displayCategory": "PlatformAction", "label": "删除", "actionType": "标准按钮" }, { "label": "上次保持联系保存日期", "alwaysRequired": false, "type": "F", "id": "LastCUUpdateDate", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "name": "LastCUUpdateDate", "displayCategory": "Field", "required": false, "readonly": true, "alwaysReadonly": true }, { "label": "上次保持联系请求日期", "alwaysRequired": false, "type": "F", "id": "LastCURequestDate", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "name": "LastCURequestDate", "displayCategory": "Field", "required": false, "readonly": true, "alwaysReadonly": true }, { "label": "上次修改人", "alwaysRequired": false, "type": "Y", "id": "LastModifiedBy", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "typeArgs": ["用户"], "alwaysNotReadonly": false, "name": "LastModifiedBy", "displayCategory": "Field", "required": false, "alwaysReadonly": true, "readonly": true }, { "id": "RLo__LastModifiedBy", "category": "RelatedLookup", "name": "LastModifiedBy", "displayCategory": "RelatedLookup", "label": "上次修改人" }, { "stdListButtons": [{ "label": "添加到市场活动", "id": "AddCampaign", "isCustom": false, "isDefaultOff": false }], "label": "市场活动历史", "isSortCustomizable": true, "id": "RL__RelatedCampaignList", "defaultColumns": ["CAMPAIGN.NAME", "CAMPAIGN.START_DATE", "CAMPAIGN.CAMPAIGN_TYPE", "CM.STATUS", "CM.RESPONDED", "CM.LAST_UPDATE"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "CAMPAIGN.NAME", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "CAMPAIGN.NAME", "label": "市场活动名称", "isSortable": true, "type": "S" }, { "filterColumn": "CAMPAIGN.START_DATE", "label": "开始日期", "isSortable": true, "type": "D" }, { "filterColumn": "CAMPAIGN.CAMPAIGN_TYPE", "label": "类型", "isSortable": true, "type": "L" }, { "filterColumn": "CM.STATUS", "label": "状态", "isSortable": true, "type": "L" }, { "filterColumn": "CM.RESPONDED", "label": "已回复", "isSortable": true, "type": "B" }, { "filterColumn": "CM.LAST_UPDATE", "label": "更新的成员状态", "isSortable": true, "type": "F" }] }, { "label": "手机", "alwaysRequired": false, "type": "H", "id": "MobilePhone", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "MobilePhone", "length": 40, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "BTN__Submit", "category": "StandardButton", "btnOrder": 7, "removable": true, "name": "Submit", "displayCategory": "Button", "label": "提交待审批" }, { "id": "StandardButton__Submit", "category": "PlatformAction", "name": "Submit", "displayCategory": "PlatformAction", "label": "提交待审批", "actionType": "标准按钮" }, { "id": "QA__FeedItem.PollPost", "category": "QuickAction", "name": "FeedItem.PollPost", "displayCategory": "QuickAction", "label": "投票", "actionType": "张贴" }, { "id": "QuickAction__FeedItem.PollPost", "category": "PlatformAction", "name": "FeedItem.PollPost", "displayCategory": "PlatformAction", "label": "投票", "actionType": "快速操作" }, { "label": "退出传真列表", "alwaysRequired": false, "type": "B", "id": "HasOptedOutOfFax", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "name": "HasOptedOutOfFax", "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "label": "退出邮寄列表", "alwaysRequired": false, "type": "B", "id": "HasOptedOutOfEmail", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "name": "HasOptedOutOfEmail", "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "stdListButtons": [{ "label": "新建任务", "id": "NewTask", "isCustom": false, "isDefaultOff": false }, { "label": "新建事件", "id": "NewEvent", "isCustom": false, "isDefaultOff": false }, { "label": "新建会议请求", "id": "NewProposeMeeting", "isCustom": false, "isDefaultOff": false }], "label": "未处理活动", "isSortCustomizable": false, "id": "RL__RelatedActivityList", "defaultColumns": ["TASK.SUBJECT", "TASK.WHAT_NAME", "ACTIVITY.TASK", "TASK.DUE_DATE", "TASK.STATUS", "TASK.PRIORITY", "CORE.USERS.FULL_NAME"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "TASK.SUBJECT", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "TASK.SUBJECT", "label": "主题", "isSortable": true, "type": "S" }, { "filterColumn": "TASK.WHAT_NAME", "label": "相关项", "isSortable": true, "type": "m" }, { "filterColumn": "ACTIVITY.TASK", "label": "任务", "isSortable": true, "type": "B" }, { "filterColumn": "TASK.DUE_DATE", "label": "到期日期", "isSortable": true, "type": "F" }, { "filterColumn": "TASK.STATUS", "label": "状态", "isSortable": true, "type": "L" }, { "filterColumn": "TASK.PRIORITY", "label": "优先级", "isSortable": true, "type": "L" }, { "filterColumn": "CORE.USERS.FULL_NAME", "label": "被分配人", "isSortable": true, "type": "M" }] }, { "id": "QA__FeedItem.ContentPost", "category": "QuickAction", "name": "FeedItem.ContentPost", "displayCategory": "QuickAction", "label": "文件", "actionType": "张贴" }, { "id": "QuickAction__FeedItem.ContentPost", "category": "PlatformAction", "name": "FeedItem.ContentPost", "displayCategory": "PlatformAction", "label": "文件", "actionType": "快速操作" }, { "id": "QA__FeedItem.QuestionPost", "category": "QuickAction", "name": "FeedItem.QuestionPost", "displayCategory": "QuickAction", "label": "问题", "actionType": "张贴" }, { "id": "QuickAction__FeedItem.QuestionPost", "category": "PlatformAction", "name": "FeedItem.QuestionPost", "displayCategory": "PlatformAction", "label": "问题", "actionType": "快速操作" }, { "label": "勿致电", "alwaysRequired": false, "type": "B", "id": "DoNotCall", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "name": "DoNotCall", "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "id": "RL__ContentDocumentRelatedList", "defaultColumns": ["VERSION.TITLE", "VERSION.CREATED_DATE", "VERSION.LAST_UPDATE"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "label": "相关内容", "nameColumn": "VERSION.TITLE", "isSortCustomizable": true, "listCustomizable": true, "selectableColumns": [{ "filterColumn": "VERSION.TITLE", "label": "标题", "isSortable": true, "type": "S" }, { "filterColumn": "VERSION.CREATED_DATE", "label": "创建日期", "isSortable": true, "type": "F" }, { "filterColumn": "VERSION.LAST_UPDATE", "label": "上次修改日期", "isSortable": true, "type": "F" }] }, { "id": "QA__09D90000002aw8e", "category": "QuickAction", "targetEntityLabel": "备注", "name": "NewNote", "displayCategory": "QuickAction", "label": "新建备注", "actionType": "创建记录" }, { "id": "QuickAction__NewNote", "category": "PlatformAction", "name": "NewNote", "displayCategory": "PlatformAction", "label": "新建备注", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8f", "category": "QuickAction", "targetEntityLabel": "个案", "name": "NewCase", "displayCategory": "QuickAction", "label": "新建个案", "actionType": "创建记录" }, { "id": "QuickAction__NewCase", "category": "PlatformAction", "name": "NewCase", "displayCategory": "PlatformAction", "label": "新建个案", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8a", "category": "QuickAction", "targetEntityLabel": "客户", "name": "NewAccount", "displayCategory": "QuickAction", "label": "新建客户", "actionType": "创建记录" }, { "id": "QuickAction__NewAccount", "category": "PlatformAction", "name": "NewAccount", "displayCategory": "PlatformAction", "label": "新建客户", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8b", "category": "QuickAction", "targetEntityLabel": "联系人", "name": "NewContact", "displayCategory": "QuickAction", "label": "新建联系人", "actionType": "创建记录" }, { "id": "QuickAction__NewContact", "category": "PlatformAction", "name": "NewContact", "displayCategory": "PlatformAction", "label": "新建联系人", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8c", "category": "QuickAction", "targetEntityLabel": "潜在客户", "name": "NewLead", "displayCategory": "QuickAction", "label": "新建潜在客户", "actionType": "创建记录" }, { "id": "QuickAction__NewLead", "category": "PlatformAction", "name": "NewLead", "displayCategory": "PlatformAction", "label": "新建潜在客户", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8j", "category": "QuickAction", "targetEntityLabel": "任务", "name": "NewTask", "displayCategory": "QuickAction", "label": "新建任务", "actionType": "创建记录" }, { "id": "QuickAction__NewTask", "category": "PlatformAction", "name": "NewTask", "displayCategory": "PlatformAction", "label": "新建任务", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8l", "category": "QuickAction", "targetEntityLabel": "事件", "name": "NewEvent", "displayCategory": "QuickAction", "label": "新建事件", "actionType": "创建记录" }, { "id": "QuickAction__NewEvent", "category": "PlatformAction", "name": "NewEvent", "displayCategory": "PlatformAction", "label": "新建事件", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8h", "category": "QuickAction", "targetEntityLabel": "小组", "name": "NewGroup", "displayCategory": "QuickAction", "label": "新建小组", "actionType": "创建记录" }, { "id": "QuickAction__NewGroup", "category": "PlatformAction", "name": "NewGroup", "displayCategory": "PlatformAction", "label": "新建小组", "actionType": "快速操作" }, { "id": "QA__09D90000002aw8d", "category": "QuickAction", "targetEntityLabel": "业务机会", "name": "NewOpportunity", "displayCategory": "QuickAction", "label": "新建业务机会", "actionType": "创建记录" }, { "id": "QuickAction__NewOpportunity", "category": "PlatformAction", "name": "NewOpportunity", "displayCategory": "PlatformAction", "label": "新建业务机会", "actionType": "快速操作" }, { "label": "姓名", "alwaysRequired": true, "type": "M", "id": "Name", "category": "StandardField", "alwaysDisplayed": true, "alwaysNotRequired": false, "alwaysNotReadonly": true, "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "stdListButtons": [{ "label": "新建", "id": "New", "isCustom": false, "isDefaultOff": false }], "label": "业务机会", "isSortCustomizable": true, "id": "RL__RelatedOpportunityList", "defaultColumns": ["OPPORTUNITY.NAME", "OPPORTUNITY.STAGE_NAME", "OPPORTUNITY.AMOUNT", "OPPORTUNITY.CLOSE_DATE"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "OPPORTUNITY.NAME", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "OPPORTUNITY.NAME", "label": "业务机会名称", "isSortable": true, "type": "S" }, { "filterColumn": "OPPORTUNITY.STAGE_NAME", "label": "阶段", "isSortable": true, "type": "L" }, { "filterColumn": "OPPORTUNITY.AMOUNT", "label": "金额", "isSortable": true, "type": "C" }, { "filterColumn": "OPPORTUNITY.CLOSE_DATE", "label": "结束日期", "isSortable": true, "type": "D" }] }, { "id": "QA__FeedItem.MobileSmartActions", "category": "QuickAction", "name": "FeedItem.MobileSmartActions", "displayCategory": "QuickAction", "label": "移动智能操作", "actionType": "张贴" }, { "id": "QuickAction__FeedItem.MobileSmartActions", "category": "PlatformAction", "name": "FeedItem.MobileSmartActions", "displayCategory": "PlatformAction", "label": "移动智能操作", "actionType": "快速操作" }, { "label": "邮寄地址", "alwaysRequired": false, "type": "A", "id": "MailingAddress", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "label": "允许客户入口网站自助注册", "alwaysRequired": false, "type": "B", "id": "CanAllowPortalSelfReg", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": true, "alwaysNotReadonly": false, "name": "CanAllowPortalSelfReg", "displayCategory": "Field", "required": false, "readonly": false, "alwaysReadonly": false }, { "id": "QA__FeedItem.TextPost", "category": "QuickAction", "name": "FeedItem.TextPost", "displayCategory": "QuickAction", "label": "张贴", "actionType": "张贴" }, { "id": "QuickAction__FeedItem.TextPost", "category": "PlatformAction", "name": "FeedItem.TextPost", "displayCategory": "PlatformAction", "label": "张贴", "actionType": "快速操作" }, { "label": "职务", "alwaysRequired": false, "type": "S", "id": "Title", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "Title", "length": 128, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "label": "直属上司", "alwaysRequired": false, "type": "Y", "id": "ReportsTo", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "typeArgs": ["联系人"], "alwaysNotReadonly": false, "name": "ReportsTo", "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "id": "RLo__ReportsTo", "category": "RelatedLookup", "name": "ReportsTo", "displayCategory": "RelatedLookup", "label": "直属上司" }, { "id": "ProductivityAction__CallHighlightAction", "category": "PlatformAction", "name": "CallHighlightAction", "displayCategory": "PlatformAction", "label": "致电", "actionType": "工作效率（突出显示）操作" }, { "label": "助理", "alwaysRequired": false, "type": "S", "id": "AssistantName", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "AssistantName", "length": 40, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "label": "助理电话", "alwaysRequired": false, "type": "H", "id": "AssistantPhone", "category": "StandardField", "alwaysDisplayed": false, "alwaysNotRequired": false, "alwaysNotReadonly": false, "name": "AssistantPhone", "length": 40, "displayCategory": "Field", "required": false, "alwaysReadonly": false, "readonly": false }, { "stdListButtons": [{ "label": "新建", "id": "New", "isCustom": false, "isDefaultOff": false }], "label": "资产", "isSortCustomizable": true, "id": "RL__RelatedAssetList", "defaultColumns": ["ASSET.NAME", "ASSET.SERIAL_NUMBER", "ASSET.INSTALL_DATE", "ASSET.QUANTITY", "ACCOUNT.NAME", "ASSET.STATUS", "ASSET.IS_COMPETITOR_PRODUCT"], "category": "StandardRelatedList", "customListButtons": [], "columnsLoaded": false, "displayCategory": "RelatedList", "nameColumn": "ASSET.NAME", "listCustomizable": true, "selectableColumns": [{ "filterColumn": "ASSET.NAME", "label": "资产名称", "isSortable": true, "type": "S" }, { "filterColumn": "ASSET.SERIAL_NUMBER", "label": "序列号", "isSortable": true, "type": "S" }, { "filterColumn": "ASSET.INSTALL_DATE", "label": "安装日期", "isSortable": true, "type": "D" }, { "filterColumn": "ASSET.QUANTITY", "label": "数量", "isSortable": true, "type": "N", "sampleData": "937.13" }, { "filterColumn": "ACCOUNT.NAME", "label": "客户名", "isSortable": true, "type": "m" }, { "filterColumn": "ASSET.STATUS", "label": "状态", "isSortable": true, "type": "L" }, { "filterColumn": "ASSET.IS_COMPETITOR_PRODUCT", "label": "竞争对手资产", "isSortable": true, "type": "B" }] }, { "id": "RL__RelatedGroupsListOnRecord", "defaultColumns": [], "category": "StandardRelatedList", "columnsLoaded": false, "displayCategory": "RelatedList", "label": "组", "isSortCustomizable": false, "listCustomizable": false }];

                                analyticsTroughData = [{ "width": 480, "hideOnError": false, "label": "Snapshots-Active Project Count (DB)", "id": "ALC__00O90000008VXC6", "chartType": "line_0", "category": "Analytics", "height": 384, "includeContext": true, "hidden": false, "name": "00O90000008VXC6", "cacheData": true, "folderName": "Milestones PM", "displayCategory": "Analytics", "className": "fieldDrop", "showTitle": false }, { "width": 480, "hideOnError": false, "label": "Snapshots: Total Estimated Task Hrs (DB)", "id": "ALC__00O90000008VXC7", "chartType": "column_2", "category": "Analytics", "height": 384, "includeContext": true, "hidden": false, "name": "00O90000008VXC7", "cacheData": true, "folderName": "Milestones PM", "displayCategory": "Analytics", "className": "fieldDrop", "showTitle": false }, { "width": 480, "hideOnError": false, "label": "My Project Hours / Week (DB)", "id": "ALC__00O90000008VXBx", "chartType": "column_0", "category": "Analytics", "height": 384, "includeContext": true, "hidden": false, "name": "00O90000008VXBx", "cacheData": true, "folderName": "Milestones PM", "displayCategory": "Analytics", "className": "fieldDrop", "showTitle": false }, { "width": 480, "hideOnError": false, "label": "Milestones and Open Tasks by Proj (LPM1)", "id": "ALC__00O90000008VXBs", "chartType": "column_1", "category": "Analytics", "height": 384, "includeContext": true, "hidden": false, "name": "00O90000008VXBs", "cacheData": true, "folderName": "Milestones PM", "displayCategory": "Analytics", "className": "fieldDrop", "showTitle": false }];
                                categoryData = [{ "name": "Field", "label": "字段", "labelSingular": "字段", "showBlank": true, "showNewSection": true }, { "name": "Button", "label": "按钮", "labelSingular": "按钮", "showBlank": false, "showNewSection": false }, { "name": "CustomLink", "label": "自定义链接", "labelSingular": "自定义链接", "showBlank": true, "showNewSection": false }, { "name": "QuickAction", "label": "快速操作", "labelSingular": "快速操作", "showBlank": false, "showNewSection": false }, { "name": "PlatformAction", "label": "Salesforce1 操作", "labelSingular": "Salesforce1 操作", "showBlank": false, "showNewSection": false }, { "name": "RelatedLookup", "label": "展开的查找", "labelSingular": "展开的查找", "showBlank": false, "showNewSection": false }, { "name": "RelatedList", "label": "相关列表", "labelSingular": "相关列表", "showBlank": false, "showNewSection": false }, { "name": "Analytics", "label": "报表图表", "labelSingular": "报表", "showBlank": false, "showNewSection": true }, { "name": "AnalyticsCloud", "label": "Analytics Cloud 资产", "labelSingular": "资产", "showBlank": false, "showNewSection": true }, { "name": "Aura", "label": "组件", "labelSingular": "组件", "showBlank": false, "showNewSection": false }, { "name": "Page", "label": "Visualforce 页面", "labelSingular": "页", "showBlank": true, "showNewSection": true }, { "name": "SControl", "label": "Custom S-Control", "labelSingular": "Custom S-Control", "showBlank": true, "showNewSection": true }, { "name": "Canvas", "label": "画布应用程序", "labelSingular": "画布", "showBlank": true, "showNewSection": true}];
                                sampleByType = { "D": "2015-7-25", "E": "sarah.sample@company.com", "F": "2015-7-25 上午8:47", "G": "1-415-555-1212", "A": "US\u003Cbr/\u003E94105 CA San Francisco\u003Cbr/\u003ESuite 300, The Landmark @ One Market", "C": "￥123.45", "L": "示例%f", "M": "Sample Sarah", "m": "示例%f", "H": "1-415-555-1212", "I": "示例%f", "J": "示例%f", "U": "www.salesforce.com", "V": "GEN-2004-001234", "Q": "示例%f", "7": "示例%f", "S": "示例%f", "9": "\u003Cspan class=\"linkSample\"\u003E示例%f\u003C/span\u003E", "Y": "\u003Cspan class=\"linkSample\"\u003E示例%l\u003C/span\u003E", "z": "示例%f", "X": "示例%f" };
                                datatypeNames = { "D": "日期", "E": "电子邮件", "F": "日期/时间", "G": "传真", "A": "地址", "B": "复选框", "C": "币种", "L": "选项列表", "M": "名称", "N": "数字", "O": "选项列表", "H": "电话", "I": "分部", "J": "长文本区", "K": "查找", "U": "URL", "T": "加密", "W": "IP 地址", "V": "自动编号", "Q": "选项列表（多项选择）", "P": "百分比", "S": "文本", "R": "文本", "Y": "查找", "X": "文本区", "f": "时间", "g": "地理定位", "d": "数据类别组索引", "e": "选项列表", "c": "加密二进制", "n": "命名空间", "l": "文件", "m": "名称", "v": "复杂值", "7": "记录类型", "6": "加密文本", "r": "Raw (Base64)", "5": "富文本区域", "4": "加密二进制 (Base64)", "9": "内容", "8": "BitVector", "z": "富文本区域", "x": "外部查找" };
                                profileData = [{ "id": "00e90000001jAUY", "label": "Authenticated Website" }, { "id": "00e90000001jAUX", "label": "Cross Org Data Proxy User" }, { "id": "00e90000001txhU", "label": "Custom: Marketing Profile" }, { "id": "00e90000001txhT", "label": "Custom: Sales Profile" }, { "id": "00e90000001txhV", "label": "Custom: Support Profile" }, { "id": "00e90000001jAUW", "label": "Customer Community Login User" }, { "id": "00e90000001jAUk", "label": "Customer Community User" }, { "id": "00e90000001jAUa", "label": "Customer Portal Manager Custom" }, { "id": "00e90000001jAUf", "label": "Customer Portal Manager Standard" }, { "id": "00e90000001jAUg", "label": "Force.com - App Subscription User" }, { "id": "00e90000001jAUl", "label": "Force.com - Free User" }, { "id": "00e90000001jAUe", "label": "Gold Partner User" }, { "id": "00e90000001jAUd", "label": "High Volume Customer Portal" }, { "id": "00e90000001jAUb", "label": "Identity User" }, { "id": "00e90000001jAUh", "label": "Partner App Subscription User" }, { "id": "00e90000001jAUj", "label": "Partner Community Login User" }, { "id": "00e90000001jAUi", "label": "Partner Community User" }, { "id": "00e90000001jAUc", "label": "Silver Partner User" }, { "id": "00e90000001jAUZ", "label": "Work.com Only User" }, { "id": "00e90000001jAUV", "label": "标准 Platform 用户" }, { "id": "00e90000001txhY", "label": "标准用户" }, { "id": "00e90000001txhX", "label": "合同经理" }, { "id": "00e90000001txhR", "label": "解决方案经理" }, { "id": "00e90000001txhW", "label": "市场营销用户" }, { "id": "00e90000001txhO", "label": "系统管理员" }, { "id": "00e90000001txhS", "label": "只读"}];
                                //otherLayoutIdNames = [["00h9000000RbNyz", "Contact (Marketing) Layout"], ["00h9000000RbNyu", "Contact (Sales) Layout"], ["00h9000000RbNz4", "Contact (Support) Layout"]];
                                otherLayoutIdNames = [];
                                dragDropMap = { "CustomField": ["fieldDrop"], "DetailButtonBar": [""], "StandardButton": ["sButtonDrop"], "CustomRelatedList": ["rlDrop"], "EmptySpace": ["fieldDrop", "customLinkDrop"], "Analytics": ["fieldDrop"], "PlatformAction": ["paDrop"], "CustomButton": ["cButtonDrop"], "AnalyticsCloud": ["fieldDrop"], "Control": ["fieldDrop"], "AuraComponent": ["rloDrop"], "QuickAction": ["qaDrop"], "StandardRelatedList": ["rlDrop"], "RelatedLookup": ["rloDrop"], "Page": ["rloDrop", "fieldDrop"], "StandardField": ["fieldDrop"], "Canvas": ["rloDrop", "fieldDrop"], "Tagging": [""], "CustomLink": ["customLinkDrop"], "CustomSControl": ["fieldDrop"] };
                       
                            </script>
                            <div id="trough">
                            </div>
                            <div class="layout" id="outerTarget">
                            </div>
                            <div class="trough" style="display: none">
                                <div class="selector">
                                    <ul>
                                        <li class="selected">
                                            <div class="selectedItem" id="selectorTest">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <script type="text/javascript">
                            //For old layoutPreview to work properly:
                            function toXML() {
                                return Ext.util.JSON.encode(Ext.getCmp('targetPanel').save());
                            }

                            var VFEditor = {
                                layoutId: "<%=LayoutId%>".length > 0 ? "<%=LayoutId%>" : null,

                                layoutType: "<%=LayoutType%>",

                                callbacks: {},

                                handler: null,

                                MAX_RELATED_LIST_COLUMNS: 10,

                                MAX_SCONTROLS: 20,

                                MAX_PAGES: 20,

                                MAX_EXPANDED_LOOKUPS: 20,

                                MAX_CHARTS: 2,

                                MAX_SECTION_TITLE_LENGTH: 80,

                                HEADER_BAR_ID: 'j_id0:headerBar',

                                relatedListHelpUrl: "javascript:openPopupFocusEscapePounds%28%27https%3A%2F%2Flogin..com%2Fservices%2Fauth%2Fsso%2F00D30000000XsfGEAS%2FHTAuthProvider%3FstartURL%3D%25252Fapex%25252Fhtdoor%25253Floc%25253Dhelp%252526target%25253Dcustomizing_related_lists.htm%252526section%25253DCustomizing%252526language%25253Dzh_CN%252526release%25253D192.15.5%252526instance%25253DAP1%26site%3Dhttps%253A%252F%252Fhelp.salesforce.com%27%2C%20%27Help%27%2C%201024%2C%20768%2C%20%27width%3D1024%2Cheight%3D768%2Cresizable%3Dyes%2Ctoolbar%3Dyes%2Cstatus%3Dyes%2Cscrollbars%3Dyes%2Cmenubar%3Dyes%2Cdirectories%3Dno%2Clocation%3Dyes%2Cdependant%3Dno%27%2C%20false%2C%20false%29%3B",

                                summaryLayoutHelpUrl: "javascript:openPopupFocusEscapePounds%28%27https%3A%2F%2Flogin..com%2Fservices%2Fauth%2Fsso%2F00D30000000XsfGEAS%2FHTAuthProvider%3FstartURL%3D%25252Fapex%25252Fhtdoor%25253Floc%25253Dhelp%252526target%25253Dcustomize_layoutcustomize_highlights_panel_config.htm%252526section%25253DCustomizing%252526language%25253Dzh_CN%252526release%25253D192.15.5%252526instance%25253DAP1%26site%3Dhttps%253A%252F%252Fhelp.salesforce.com%27%2C%20%27Help%27%2C%201024%2C%20768%2C%20%27width%3D1024%2Cheight%3D768%2Cresizable%3Dyes%2Ctoolbar%3Dyes%2Cstatus%3Dyes%2Cscrollbars%3Dyes%2Cmenubar%3Dyes%2Cdirectories%3Dno%2Clocation%3Dyes%2Cdependant%3Dno%27%2C%20false%2C%20false%29%3B",

                                analyticsDisableCachingHelpUrl: "javascript:openPopupFocusEscapePounds%28%27https%3A%2F%2Flogin..com%2Fservices%2Fauth%2Fsso%2F00D30000000XsfGEAS%2FHTAuthProvider%3FstartURL%3D%25252Fapex%25252Fhtdoor%25253Floc%25253Dhelp%252526target%25253Dreports_embed_chartdialog_datarefresh.htm%252526section%25253DReports%252526language%25253Dzh_CN%252526release%25253D192.15.5%252526instance%25253DAP1%26site%3Dhttps%253A%252F%252Fhelp.salesforce.com%27%2C%20%27Help%27%2C%201024%2C%20768%2C%20%27width%3D1024%2Cheight%3D768%2Cresizable%3Dyes%2Ctoolbar%3Dyes%2Cstatus%3Dyes%2Cscrollbars%3Dyes%2Cmenubar%3Dyes%2Cdirectories%3Dno%2Clocation%3Dyes%2Cdependant%3Dno%27%2C%20false%2C%20false%29%3B",

                                analyticsChartPropertiesHelpUrl: "javascript:openPopupFocusEscapePounds%28%27https%3A%2F%2Flogin..com%2Fservices%2Fauth%2Fsso%2F00D30000000XsfGEAS%2FHTAuthProvider%3FstartURL%3D%25252Fapex%25252Fhtdoor%25253Floc%25253Dhelp%252526target%25253Dreports_embed_chartdialogmap.htm%252526section%25253DReports%252526language%25253Dzh_CN%252526release%25253D192.15.5%252526instance%25253DAP1%26site%3Dhttps%253A%252F%252Fhelp.salesforce.com%27%2C%20%27Help%27%2C%201024%2C%20768%2C%20%27width%3D1024%2Cheight%3D768%2Cresizable%3Dyes%2Ctoolbar%3Dyes%2Cstatus%3Dyes%2Cscrollbars%3Dyes%2Cmenubar%3Dyes%2Cdirectories%3Dno%2Clocation%3Dyes%2Cdependant%3Dno%27%2C%20false%2C%20false%29%3B",

                                uiPrefsUrl: "/ui/setup/org/UserInterfaceUI?setupid=AccountLayouts&retURL=%2F00190000019mlFI",

                                helpTitle: '帮助 （新窗口）',

                                helpIconHtml: '<img src="/s.gif" alt="帮助"  class="helpIcon" title="帮助"/>',

                                showBackToListLink: true,

                                showPreviewAs: true,

                                showPreviewButton: true,

                                allowSaveAs: true,

                                showLayoutPropertiesButton: true,

                                showTroughSelector: true,

                                allowBlankSpace: true,

                                allowRemoveOfAlwaysDisplayed: false,

                                removeEmptyCategories: true,

                                showButtonsSection: true,

                                showQuickActionSection: true,

                                isChatterEnabled: true,

                                isMDPEnabled: true,

                                isFeedTrackingEnabled: true,

                                showRelatedContentSection: true,

                                itemsHaveProperties: true,

                                canModifyHeadersInSections: true,

                                canModifyColumnsInSections: true,

                                defaultNumColumnsInSections: 2,

                                previewUrl: "/setup/layout/preview.aspx?type=Account&newEditor=1",

                                tutorialUrl: "",

                                loadRelatedListServletUrl: "/_ui/common/config/layout2/AjaxLoadRelatedListItem?setupid=AccountLayouts",

                                validateSpansInRelatedListServletUrl: "/_ui/common/config/layout2/AjaxValidateSpanningFormulasInRelatedList?setupid=AccountLayouts",

                                labelMap: { "propertiesButtonLabel": "布局属性", "quickFindLabel": "{0}名称", "newSectionItemLabel": "部分", "backToLayoutLabel": "页面布局列表", "notVisibleOnSectionLabel": "（标题不可见）", "layoutPackageLinkLabel": "已安装的软件包", "namespacePrefixLabel": "命名空间前缀", "previewButtonLabel": "预览" },

                                hideGack: true,

                                cookiePath: '/layouteditor',

                                quickActionsDefaults: [{ "id": "QA__FeedItem.TextPost", "category": "QuickAction", "name": "FeedItem.TextPost", "displayCategory": "QuickAction", "label": "张贴", "actionType": "张贴" }, { "id": "QA__FeedItem.ContentPost", "category": "QuickAction", "name": "FeedItem.ContentPost", "displayCategory": "QuickAction", "label": "文件", "actionType": "张贴" }, { "id": "QA__FeedItem.MobileSmartActions", "category": "QuickAction", "name": "FeedItem.MobileSmartActions", "displayCategory": "QuickAction", "label": "移动智能操作", "actionType": "张贴" }, { "id": "QA__FeedItem.LinkPost", "category": "QuickAction", "name": "FeedItem.LinkPost", "displayCategory": "QuickAction", "label": "链接", "actionType": "张贴" }, { "id": "QA__FeedItem.PollPost", "category": "QuickAction", "name": "FeedItem.PollPost", "displayCategory": "QuickAction", "label": "投票", "actionType": "张贴" }, { "id": "QA__FeedItem.QuestionPost", "category": "QuickAction", "name": "FeedItem.QuestionPost", "displayCategory": "QuickAction", "label": "问题", "actionType": "张贴"}],

                                isGlobalLayout: false,

                                loadingDone: function () {
                                    Ext.fly('loadingSpinner').remove();
                                    window.selenium_loadingDone = true;
                                },

                                showPreview: function (profileId) {
                                    var url = VFEditor.previewUrl;
                                    if (profileId) {
                                        url += "&profileId=" + profileId;
                                    }
                                    window.open(url, 'preview', 'width=700,height=500,' +'location=no,dependent=no,resizable=yes,' + 'toolbar=no,status=no,directories=no,menubar=no,' + 'scrollbars=1', false);
                                },

                                updateJsonLayout: function () {
                                    Sfdc.get(hiddenInputsById.jsonLayout).value = toXML();
                                    Sfdc.get(hiddenInputsById.clearUserLists).value = Ext.getCmp('targetPanel').getClearUserLists();
                                },

                                showProgress: function () {
                                    Ext.MessageBox.show({
                                        msg: '布局保存中...',
                                        progressText: '保存中...',
                                        width: 300,
                                        wait: true,
                                        waitConfig: { interval: 40 }
                                    });
                                },

                                registerCallback: function (fnName, callback, chain) {
                                    var oldCallback = VFEditor.callbacks[fnName];
                                    if (chain && oldCallback) {
                                        VFEditor.callbacks[fnName] = function () {
                                            oldCallback.apply(this, arguments);
                                            callback.apply(this, arguments);
                                        };
                                    } else {
                                        VFEditor.callbacks[fnName] = callback;
                                    }
                                },

                                unregisterCallback: function (fnName) {
                                    delete VFEditor.callbacks[fnName];
                                },

                                afterSave: function () {
                                    VFEditor.hideProgress();
                                    VFEditor.refreshTroughPosition();
                                },

                                afterQuicksave: function () {
                                    VFEditor.hideProgress();
                                    VFEditor.refreshTroughPosition();
                                    if (VFEditor.handler) {
                                        VFEditor.handler.clear();
                                    }
                                },

                                afterSaveAs: function () {
                                    VFEditor.afterQuicksave();
                                    if (VFEditor.handler) {
                                        VFEditor.handler.clear();
                                    }
                                },

                                hideProgress: function () {
                                    Ext.MessageBox.hide();
                                },

                                refreshTroughPosition: function () {
                                    Ext.getCmp('troughPanel').refreshOrigPosition();
                                },

                                getCommand: function (name) {
                                    var fn = function () {
                                        Ext.getDom(commandButtonsById[name]).click()
                                    };

                                    switch (name) {
                                        case 'save':
                                        case 'quickSave':
                                            return function () {
                                                Ext.getCmp('targetPanel').preSave(fn);
                                            };
                                        case 'saveAs':
                                            return function () {
                                                Ext.getCmp('targetPanel').preSave(fn, null, true);
                                            };
                                        default:
                                            return fn;
                                    }
                                },

                                showTutorial: function () {
                                    if (''.length > 0) {
                                        openPopupFocus('');
                                    }
                                },

                                confirmLeave: function (keyOrUrl, isUrl) {
                                    if (VFEditor.handler && VFEditor.handler.isDirty()) {
                                        if (!confirm("如果您离开此页，会丢失所有未保存的更改。是否继续？")) {
                                            return;
                                        }

                                    }
                                    if (isUrl) {
                                        window.location = keyOrUrl;
                                    } else {
                                        switch (keyOrUrl) {
                                            case 'multiline':
                                                window.location = "";
                                                break;
                                            case 'relatedObjects':
                                                window.location = "/_ui/common/config/layout2/RightPanelLayoutUi/e?id=00h9000000RbNya&retURL=%2Flayouteditor%2FlayoutEditor.apexp%3Ftype%3DAccount%26lid%3D00h9000000RbNya%26retURL%3D%252F00190000019mlFI&setupid=AccountLayouts";
                                                break;
                                            case 'miniLayout':
                                                window.location = "/_ui/common/config/layout2/MiniLayoutUi/e?lid=00h9000000RbNya&retURL=%2Flayouteditor%2FlayoutEditor.apexp%3Ftype%3DAccount%26lid%3D00h9000000RbNya%26retURL%3D%252F00190000019mlFI&setupid=AccountLayouts"
                                                break;
                                            case 'compactView':
                                                window.location = "/_ui/common/config/layout2/CompactLayoutUi/e?lid=00h9000000RbNya&retURL=%2Flayouteditor%2FlayoutEditor.apexp%3Ftype%3DAccount%26lid%3D00h9000000RbNya%26retURL%3D%252F00190000019mlFI&setupid=AccountLayouts";
                                                break;
                                            case 'layoutList':
                                                window.location = "/ui/setup/layout/PageLayouts?type=Account&setupid=AccountLayouts";
                                                break;
                                            case 'contextPaneEditor':
                                                window.location = "/ui/support/servicedesk/sidebarcomponent/ConsoleSidebarSetupEditor?lid=00h9000000RbNya&retURL=%2Flayouteditor%2FlayoutEditor.apexp%3Ftype%3DAccount%26lid%3D00h9000000RbNya%26retURL%3D%252F00190000019mlFI&setupid=AccountLayouts";
                                                break;
                                            case 'feedView':
                                                window.location = "";
                                                break;
                                        }
                                    }
                                },

                                hidePLEWarning: function () {
                                    UserContext.userPreferences.setBoolean("HideNewPLEWarnIE6", true, vfeditor_hideIEMessage);
                                },

                                gack: function () {
                                    if (Ext) {
                                        Ext.MessageBox.show({
                                            closable: false,
                                            title: "发生服务器内部错误",
                                            msg: '处理您的请求时出错。已将该问题通知支持小组。如果您认为拥有可能对再现或纠正错误有帮助的其他信息，请联系\u003Ca href=\"https://help..com/apex/hthome\"\u003E 支持\u003C/a\u003E。请提供所请求页面的 URL、该页面显示的错误 ID 及其他相关信息。对因此给您带来的不便，我们深表歉意！\u003Cbr/\u003E\u003Cbr/\u003E再次感谢您的耐心和协助。同时感谢您使用 ！',
                                            buttons: {
                                                cancel: '返回上一页。'
                                            },
                                            fn: function (btnId) {
                                                if (btnId == 'cancel') {
                                                    VFEditor.getCommand('cancel')();
                                                }
                                            }
                                        });
                                    }
                                }
                            }

                            VFEditor.maxByCategory = {
                                'CustomSControl': VFEditor.MAX_SCONTROLS,
                                'Page': VFEditor.MAX_PAGES,
                                'RelatedLookup': VFEditor.MAX_EXPANDED_LOOKUPS,
                                'Analytics': VFEditor.MAX_CHARTS
                            };
                        </script>
                        <script type="text/javascript">                            Sfdc.onReady(function () {
                                SfdcApp && SfdcApp.Visualforce && SfdcApp.Visualforce.VSManager && SfdcApp.Visualforce.VSManager.vfPrepareForms(["j_id0:f"]);

                            });</script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '搜索所有设置...', 'quickFindInput version2', 'quickfindInput ghostText version2', null, null, true); ; if (this.loadChatFrameJs) loadChatFrameJs(); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
       <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script defer="true" src="/jslibrary/sfdc/Setup.js"></script>
    <script>
        
    </script>
</body>
</html>
<!-- page generation time: 1016ms -->
