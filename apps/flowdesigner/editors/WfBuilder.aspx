<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WfBuilder.aspx.cs" Inherits="WebClient.apps.wf.WfBuilder" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNavNoMain.ascx" TagName="TopNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>方案生成器 ~ .com - Professional Edition</title>
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/elements.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/common.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/SchemaBuilder.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/SchemaBuilder.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        // UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-21 下午4:04", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1410289302000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1410289302000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1410289302000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1410289302000/Theme3/zh/base/SchemaBuilder.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1410289302000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1410289302000/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //      ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '106.39.255.229', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fplatform%2Fschema%2Fui%2Fschemabuilder%2FSchemaBuilderUi%3FretURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DStudio%26setupid%3DSchemaBuilder');</script>
    <style type="text/css">
        .setupQiCsvFileSelector a, .setupQiCsvFileSelector a:hover
        {
            color: #1b75af;
        }
        .setupQiCsvFileSelector a.cancel
        {
            color: #333;
            font-weight: bold;
            margin-right: 10px;
        }
        .setupQiCsvFileSelector .upload-wrapper
        {
            display: inline-block;
            position: relative;
            cursor: pointer;
            overflow: hidden;
        }
        .setupQiCsvFileSelector .upload-wrapper form
        {
            position: absolute;
            top: 0;
            right: 0;
            -ms-filter: alpha(opacity=0);
            filter: alpha(opacity=0);
            opacity: 0;
        }
        .setupQiCsvFileSelector .upload-wrapper input
        {
            height: 30px;
            font-size: 100px;
            cursor: pointer;
        }
        .setupQiCsvFileSelector .browse-button
        {
            padding: .6em 1.2em;
            background-color: #1b75af;
            border: 1px solid #c5c6c8;
            border-radius: 3px;
            cursor: pointer;
            color: #fff;
            font-weight: bold;
            text-align: center;
            display: inline-block;
        }
        .setupQiCsvFileSelector .detail .status
        {
            display: block;
            margin: 10px 0;
            font-weight: bold;
        }
    </style>
    <style type="text/css">
        .setupQiDatasourceSelectorList
        {
            border: solid 1px #d8d9d9;
            border-radius: 3px;
            background-color: #fff;
        }
        .setupQiDatasourceSelectorList.list
        {
            margin: 20px 0;
            list-style: none;
            padding: 0;
        }
        .setupQiDatasourceSelectorList.list li
        {
            margin: 0;
        }
        .setupQiDatasourceSelectorList.list li.odd
        {
            border-top: solid 1px #d8d9d9;
            border-bottom: solid 1px #d8d9d9;
        }
        .setupQiDatasourceSelectorList .source
        {
            position: relative;
            padding: 25px 20px;
        }
        .setupQiDatasourceSelectorList .source .label
        {
            font-weight: bold;
            font-size: 1.33em;
            padding-left: 50px;
            float: left;
            line-height: 30px;
        }
        .setupQiDatasourceSelectorList .source .detail
        {
            text-align: right;
            display: block;
        }
        .setupQiDatasourceSelectorList .source a, .setupQiDatasourceSelectorList .source a:hover
        {
            text-decoration: none;
        }
        .setupQiDatasourceSelectorList .source a.upload
        {
            color: #1b75af;
            font-weight: bold;
            font-size: 1.33em;
            line-height: 30px;
        }
        .setupQiDatasourceSelectorList .outlook .label
        {
            background: url("/img/import/import_sprite.png") no-repeat 0 -10px;
        }
        .setupQiDatasourceSelectorList .gmail .label
        {
            background: url("/img/import/import_sprite.png") no-repeat 0 -60px;
        }
        .setupQiDatasourceSelectorList .linkedIn .label
        {
            background: url("/img/import/import_sprite.png") no-repeat 0 -110px;
        }
        .setupQiDatasourceSelectorList .act .label
        {
            background: url("/img/import/import_sprite.png") no-repeat 0 -160px;
        }
        .setupQiDatasourceSelectorList .source .loading
        {
            padding: 0 0 0 24px;
            border: none;
            font-weight: normal;
            font-size: 1.33em;
            background: url('/setup/dataimporter/barloading.gif') left center no-repeat;
        }
        .setupQiDatasourceSelectorList .source .help
        {
            color: #929ba3;
            display: block;
        }
    </style>
    <style type="text/css">
        .setupQiAccountsAndContacts
        {
            padding: 20px;
            font-family: 'Helvetica Neue' ,Helvetica,Arial;
        }
        .setupQiAccountsAndContacts.mask.fadeIn
        {
            background: #ffffff;
            -ms-filter: alpha(opacity=60);
            filter: alpha(opacity=60);
            opacity: .6;
        }
        .setupQiAccountsAndContacts.uiDialog.dialog.default
        {
            color: #3a4c5c;
            background: #f4f5f6;
            border: 1px solid #d8d9d9;
            border-radius: 3px;
            box-shadow: 5px 5px 5px rgba(0,0,0,.16);
        }
        .setupQiAccountsAndContacts.uiDialog.modal
        {
            top: 15%;
        }
        .setupQiAccountsAndContacts.dialog.default .title
        {
            color: #3a4c5c;
            display: block;
            text-align: center;
            font-size: 1.7em;
            font-weight: normal;
        }
        .setupQiAccountsAndContacts.dialog.default .content
        {
            border: none;
            box-shadow: none;
            background-color: inherit;
            padding: 0;
        }
        .setupQiAccountsAndContacts.uiDialog .uiMessage
        {
            position: relative;
        }
        .setupQiAccountsAndContacts.uiDialog .buttons
        {
            text-align: right;
        }
        .setupQiAccountsAndContacts.uiDialog .buttons .uiButton
        {
            margin-left: 8px;
            border: 1px solid #c5c6c8;
            color: #757575;
            padding: 4px 10px;
            font-size: 1.367em;
            background: #eeeff0;
            box-shadow: none;
            text-shadow: none;
            font-weight: normal;
        }
        .setupQiAccountsAndContacts.uiDialog .buttons .uiButton
        {
            border-radius: 1px;
            box-shadow: 1px 1px 1px rgba(0, 0, 0, .16);
            padding: 4px 20px;
        }
        .setupQiAccountsAndContacts.uiDialog .buttons .uiButton .label
        {
            color: #333;
        }
        .setupQiAccountsAndContacts.uiDialog .buttons a
        {
            vertical-align: middle;
            padding: 4px 10px;
            margin: 4px 3px;
            display: inline-block;
            color: #1b75af;
            text-decoration: none;
            font-size: 1.2em;
        }
        .setupQiAccountsAndContacts.uiDialog .buttons a:hover
        {
            color: #1b75af;
            text-decoration: none;
        }
        .setupQiAccountsAndContacts.uiDialog .close, .setupQiAccountsAndContacts.uiDialog .close:hover, .setupQiAccountsAndContacts.uiDialog .close:focus
        {
            background: url(/img/import/close.png) no-repeat center center;
            border-radius: 1px;
            border: none;
            width: 17px;
            height: 17px;
        }
    </style>
 
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif setupTab  SchemaBuilderUi sfdcBody brandQuaternaryBgr miniHeaderBody"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    data-uidsfdc="23" onpageshow="event.persisted&& (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
    <script>        var secondsLeftValue = 6936, secondsPopupValue = 6906, lastPageActivityTime = (new Date).getTime(), forceLogout = false; function startSessionTimer() { schedulePopup(6906) } function schedulePopup(a) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); timeoutUniqueId = setTimeout(alertTimeout, 1E3 * a) } function doLogout() { window.location = "/secur/logout.jsp" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&amp;startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    <a class="navSkipLink zen-skipLink zen-assistiveText" href="#skiplink">优先级</a><div
        id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopNav ID="TopNav1" runat="server" />
            <script>                var umps_config = { "locale": "zh_CN", "userLanguage": "zh_CN", "timeFormat": "ah:mm", "sfdcVersion": 190.0, "chatterDesktopEnabled": "true", "xoredSessionId": "swiMW6XSTBEAbZu8QA3LeDkrkfr1faWyPObS7mYAgcrsj8jHTZXjiQxt0ySrsZQlqR9578obdQxRg3Wspde2BNhvqeOzOnGUiPeWHOZnPb9MUexd+hUNFw1lPFnAmEF8y47TLBgLSpAbWAR+YDw0uw==", "orgId": "AP1$00D90000000yI4o", "umpsUrl": "https://umps1t4.salesforce.com", "umpsWidgetPath": "UMPSWidget_184", "userId": "005900000038QVZ", "chatterUserType": "s", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "isMeetupsEnabled": "false", "iosMessengerEnabled": "false", "orgWideSearchEnabled": "true", "isGroupChatEnabled": "false", "chatMsgHistoryEnabled": "true", "localeStyle": "1", "isAudioVideoEnabled": "false", "notificationsEnabled": false, "randomMask": "gzjIYpXifCEwXavFCTmkWXh5wLukLcb1RMintCtRuK60w4edBsqh/2UgsGji8MBq/XVOq4FVHUlmwjHpz5TvNoAB45HhfELS8ZunbbwdUPgtFN4sqyJ/fUIVVm2hrSgyjtyGWF9Tes9CaHMGEFkD/A==", "chatMsgDeepHistoryEnabled": "false", "contentDomain": "https://c.ap1.content.force.com", "baseSfdcUrl": "https://ap1.salesforce.com", "chat_options_help_url": "javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_chat_options_dialog.htm%2526section%253DCollaboration%2526language%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);", "chat_using_help_url": "javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_chat_using.htm%2526section%253DCollaboration%2526language%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);", "isScreenShareEnabled": "false", "chatMsgDeepHistoryDarkLaunch": "false", "isChatUiEnabled": "true", "maxParticipantsInAdhocChat": "10" };</script>
            <script>                (function () { "use strict"; var a = function () { setTimeout(function () { if (window.self == window.top) { var e = document.createElement("IFRAME"); e.setAttribute("id", "chat_widget_frame"); e.setAttribute("title", "iframe_js"); e.setAttribute("name", "iframe_js"); e.setAttribute("src", "https://umps1t4.salesforce.com/umps/UMPSWidget_184/_js.html?cflag=190.18.10&parentUrl=https://ap1.salesforce.com"); e.setAttribute("style", "display:none;frameborder:0"); document.getElementsByTagName("head")[0].appendChild(e) } }, 1); }; window.attachEvent ? window.attachEvent("onload", a) : window.addEventListener("load", a, !1) } ());</script>
        </div>
        <a name="skiplink">
            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                title="内容在此开始" /></a><div class="bPageTitle">
                    <div class="ptBody">
                        <div class="content">
                            <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="pageType noSecondHeader">
                                方案生成器</h1>
                            <div class="blank">
                                &nbsp;</div>
                        </div>
                        <div class="links">
                            <a href="#" title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif"
                                alt="" class="helpIcon" /></a></div>
                    </div>
                    <div class="ptBreadcrumb">
                    </div>
                </div>
        <script>            (function () { "use strict"; var a = function () { setTimeout(function () { if (window.self == window.top) { var e = document.createElement("IFRAME"); e.setAttribute("id", "chat_widget_frame"); e.setAttribute("title", "iframe_js"); e.setAttribute("name", "iframe_js"); e.setAttribute("src", "https://umps1t4.salesforce.com/umps/UMPSWidget_184/_js.html?cflag=190.18.10&amp;parentUrl=https://ap1.salesforce.com"); e.setAttribute("style", "display:none;frameborder:0"); document.getElementsByTagName("head")[0].appendChild(e) } }, 1); }; window.attachEvent ? window.attachEvent("onload", a) : window.addEventListener("load", a, !1) } ());</script>
    </div>
    <script src="/js/raphael/raphael-min.js"></script>
    <div id="schemaBuilderWrapper" class="chatterChatEnabled sbWrapper">
        <div id="spinnerMask" class="spinnerMask" style="display: none;">
            <div class="spinnerCt">
                <img width="32" height="32" align="middle" title="正在加载..." class="spinner" alt="正在加载..."
                    src="/img/analytics/reportbuilder/icons/spinner32.gif"><div class="loadingIndicator">
                        正在加载...</div>
            </div>
            <div class="mask">
            </div>
        </div>
        <div role="complementary" id="schemaBuilderToolbar" class="toolbar">
            <!--schemaBuilderToolbar-->
        </div>
        <div class="main">
            <div role="main" id="schemaBuilder" class="schemaBuilder schemabuilderZoom1" style="height: 180px;
                width: 1123px; left: 243px;">
                <fieldset id="ZoomTool" class="zoomTool" style="top: 150px; left: 1073px;">
                    <a id="ZoomInBtn" class="zoomInBtn iconButton" data-uidsfdc="38"></a>
                    <div class="zoomLevelIndicator">
                        <img class="zoomLevelIndicatorImg" src="/img/schemabuilder/zoom1.png" usemap="#zoomIndicatorMap"><map
                            name="zoomIndicatorMap" id="zoomIndicatorMap"><area coords="0,0,25,10" shape="RECT"
                                href="" data-uidsfdc="41"><area coords="0,10,25,19" shape="RECT" href="" data-uidsfdc="42"><area
                                    coords="0,19,25,28" shape="RECT" href="" data-uidsfdc="43"><area coords="0,28,25,37"
                                        shape="RECT" href="" data-uidsfdc="44"><area coords="0,37,25,47" shape="RECT" href=""
                                            data-uidsfdc="45"></map></div>
                    <a id="ZoomOutBtn" class="zoomOutBtn iconButton" data-uidsfdc="39"></a>
                </fieldset>
                <div id="graph" style="overflow: hidden; width: 100%; height: 100%; position: absolute;">
                </div>
                <!--
                <div unselectable="on" style="overflow: hidden; width: 100%; height: 100%; position: absolute;
                    left: 0px; top: 0px; userselect: none; mozuserselect: none;" onselectstart="return false;"
                    id="viewport" class="viewport" data-uidsfdc="5">
                    <div style="position: absolute; left: -10214.8px; top: -10835.2px;width: 100%; height: 100%;" id="schemaBuilderCanvas" class="canvas"
                        data-uidsfdc="4">
                         
                       
                    </div>               </div>
                    -->
                <center id="splash" style="padding-top: 230px; width: 100%;">
                    <img src="images/loading.gif" alt="" />
                </center>
                <!--
                <div class="viewportBorder">
                </div>-->
                <!--
                <div id="schemaBuilderMiniNav" role="navigation" class="mininav" style="height: 150px;
                    width: 150px;" data-uidsfdc="46">
                    <h2 class="offscreen">
                        导航窗口</h2>
                    <div id="schemaBuilderLocator" class="locator" data-uidsfdc="58" style="left: 14.6019px;
                        top: 38.3685px; width: 50.7992px; height: 8.14234px;">
                        <div class="locatorbg">
                        </div>
                    </div>                    
                    <div class="mininavBoxHolder">
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 36.64053075995175px;
                            top: 36.685765983112184px;" title="市场活动成员" id="mn_CampaignMember" class="mininavBox selected">
                        </div>
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 70.521712907117px;
                            top: 63.3745476477684px;" title="联系人" id="mn_Contact" class="mininavBox">
                        </div>
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 75.09047044632088px;
                            top: 89.20386007237636px;" title="客户" id="mn_Account" class="mininavBox">
                        </div>
                        <div style="height: 9.996984318455972px; width: 12.30398069963812px; left: 11.761158021712907px;
                            top: 95.58202653799759px;" title="产品" id="mn_Product2" class="mininavBox">
                        </div>
                        <div style="height: 8.91133896260555px; width: 12.30398069963812px; left: 117.34016887816648px;
                            top: 123.13027744270205px;" title="价格手册" id="mn_Pricebook2" class="mininavBox">
                        </div>
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 89.29433051869724px;
                            top: 112.99758745476478px;" title="合同" id="mn_Contract" class="mininavBox">
                        </div>
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 3.5735826296743065px;
                            top: 22.662846803377565px;" title="潜在客户" id="mn_Lead" class="mininavBox">
                        </div>
                        <div style="height: 16.601326899879375px; width: 12.30398069963812px; left: 0px;
                            top: 113.26899879372739px;" title="业务机会产品" id="mn_OpportunityLineItem" class="mininavBox">
                        </div>
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 11.806393244873343px;
                            top: 53.96562123039807px;" title="市场活动" id="mn_Campaign" class="mininavBox">
                        </div>
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 64.14354644149579px;
                            top: 122.08986731001207px;" title="报价" id="mn_Quote" class="mininavBox">
                        </div>
                        <div style="height: 24.336550060313634px; width: 12.30398069963812px; left: 40.84740651387214px;
                            top: 103.04583835946924px;" title="业务机会" id="mn_Opportunity" class="mininavBox">
                        </div>
                        <div style="height: 22.120024125452353px; width: 12.30398069963812px; left: 49.03498190591074px;
                            top: 66.85765983112184px;" title="资产" id="mn_Asset" class="mininavBox">
                        </div>
                        <div style="height: 25.78407720144753px; width: 12.30398069963812px; left: 97.30096501809409px;
                            top: 54.23703256936068px;" title="个案" id="mn_Case" class="mininavBox">
                        </div>
                        <div style="height: 17.73220747889023px; width: 12.30398069963812px; left: 29.221954161640532px;
                            top: 132.26779252110978px;" title="报价行项目" id="mn_QuoteLineItem" class="mininavBox">
                        </div>
                        <div style="height: 11.082629674306395px; width: 12.30398069963812px; left: 0px;
                            top: 0px;" title="解决方案" id="mn_Solution" class="mininavBox">
                        </div>
                    </div>                    
                </div>-->
                <!--
                <div id="schemaBuilderLegend" class="legendWidget" data-uidsfdc="59" style="">
                    <h4>
                        图例
                        <button class="iconButton closeLegend">
                        </button>
                    </h4>
                    <ul>
                        <li>
                            <img src="/img/schemabuilder/legend-lookup.png" />查找关系</li><li>
                                <img src="/img/schemabuilder/legend-md.png" />主-详细信息关系</li><li>
                                    <img src="/img/schemabuilder/required.png" />必填字段</li></ul>
                </div>-->
                <div id="schemaBuilderLineInfo" class="lineInfo hidden" data-uidsfdc="61">
                </div>
                <div id="footer" style="display: none">
                    <p id="status">
                        Loading...
                    </p>
                    <br />
                </div>
                <input id="source" type="checkbox" />Source
                <textarea id="xml" style="height: 480; width: 100%; display: none; border-style: none;"></textarea>
                <input type="hidden" id="txtFlowLayout" name="txtFlowLayout" runat="server" />
                <div style="text-align: left; display: none">
                    <div id="mainActions" style="width: 100%; padding-top: 8px; padding-left: 24px; padding-bottom: 8px;">
                    </div>
                    <div id="zoomActions" style="width: 100%; padding-left: 54px; padding-top: 4px;">
                    </div>
                </div>
            </div>
            <div role="complementary" id="schemaBuilderSidebar" class="sidebar">
                <div onmouseover="Sfdc.Dom.addClass(this,'indicator-hover')" onmouseout="Sfdc.Dom.removeClass(this,'indicator-hover')"
                    onfocus="Sfdc.Dom.addClass(this,'indicator-hover')" onblur="Sfdc.Dom.removeClass(this,'indicator-hover')"
                    id="sidebar:indicator" class="indicator" data-uidsfdc="9">
                </div>
                <div id="sidebarcontent" class="sidebarContent">
                    <ul class="sidebarHeader">
                        <li><a id="SchemaElementHeader" class="SideBarHeaderLink selectedTab" href="sidebarSchemaElements"
                            data-uidsfdc="16">元素</a></li><li><a id="ObjectHeader" class="SideBarHeaderLink" href="sidebarObject"
                                data-uidsfdc="17">对象</a></li></ul>
                    <div id="sidebarSchemaElements" class="sidebarTabContent" data-uidsfdc="6" style="height: 143px;">
                        <span class="infotext"><span class="SchemaElementInstruction">将新自定义对象和字段拖放至方案中。</span></span><div
                            id="objectSection" class="objectSection">
                            <h3>
                                对象</h3>
                            <ul class="objectElementList">
                                <li id="objectElement" class="schemaElement objectElement">
                                    <div class="customobject SideBarIcon">
                                    </div>
                                    <div title="自定义对象为数据库表格，用于在 Salesforce.com 中存储组织特有的数据。您可以使用自定义对象扩展 Salesforce.com 功能或构建新应用程序功能。">
                                        对象</div>
                                </li>
                            </ul>
                        </div>
                        <div id="fieldSection" class="fieldSection">
                            <h3>
                                字段</h3>
                            <ul class="fieldElementList">
                                <li id="AUTONUMBER" class="schemaElement fieldElement">
                                    <div class="AUTONUMBER SideBarIcon">
                                    </div>
                                    <div title="系统使用您定义的显示格式生成的序列编号。该编号对于每条新记录会自动递增。" class="AUTONUMBER SideBarLabel">
                                        自动编号</div>
                                </li>
                                <li id="FORMULA" class="schemaElement fieldElement">
                                    <div class="FORMULA SideBarIcon">
                                    </div>
                                    <div title="根据您定义的公式表达式派生其值的只读字段。任何来源字段有所更改，该公式字段均将更新。" class="FORMULA SideBarLabel">
                                        公式</div>
                                </li>
                                <li id="SUMMARY" class="schemaElement fieldElement">
                                    <div class="SUMMARY SideBarIcon">
                                    </div>
                                    <div title="在相关列表中显示字段的汇总值、最小值或最大值的只读字段，或在相关列表中列出的所有记录的记录数。" class="SUMMARY SideBarLabel">
                                        累计汇总</div>
                                </li>
                            </ul>
                            <ul class="fieldElementList">
                                <li id="LOOKUP" class="schemaElement fieldElement">
                                    <div class="LOOKUP SideBarIcon">
                                    </div>
                                    <div title="创建一个将此对象链接到另一对象的关系。关系字段允许用户单击查找图标，以从弹出列表中选择值。另一对象是列表中值的源。" class="LOOKUP SideBarLabel">
                                        查找</div>
                                </li>
                                <li id="HIERARCHY" class="schemaElement fieldElement">
                                    <div class="HIERARCHY SideBarIcon">
                                    </div>
                                    <div title=" 允许用户单击查找图标并从弹出列表中选择其它<Entity>。" class="HIERARCHY SideBarLabel">
                                        层次结构</div>
                                </li>
                                <li id="MASTERDETAIL" class="schemaElement fieldElement">
                                    <div class="MASTERDETAIL SideBarIcon">
                                    </div>
                                    <div title="创建一个此对象（子级或&quot;详细信息&quot;）与另一对象（父级或&quot;主&quot;）之间的父子关系。页面布局上需要本字段。删除父级对象将删除本子级记录。"
                                        class="MASTERDETAIL SideBarLabel">
                                        主-详细信息</div>
                                </li>
                            </ul>
                            <ul class="fieldElementList">
                                <li id="CHECKBOX" class="schemaElement fieldElement">
                                    <div class="CHECKBOX SideBarIcon">
                                    </div>
                                    <div title="允许用户选择&quot;真&quot;（选取）或&quot;假&quot;（不选取）值。" class="CHECKBOX SideBarLabel">
                                        复选框</div>
                                </li>
                                <li id="CURRENCY" class="schemaElement fieldElement">
                                    <div class="CURRENCY SideBarIcon">
                                    </div>
                                    <div title="允许用户输入美元或其他币种金额，并将字段自动转换为币种金额格式。此功能在将数据导出到 Excel 或其它电子表格时非常有用。" class="CURRENCY SideBarLabel">
                                        币种</div>
                                </li>
                                <li id="DATE" class="schemaElement fieldElement">
                                    <div class="DATE SideBarIcon">
                                    </div>
                                    <div title="允许用户输入日期或从弹出式日历中选择日期。" class="DATE SideBarLabel">
                                        日期</div>
                                </li>
                                <li id="DATETIME" class="schemaElement fieldElement">
                                    <div class="DATETIME SideBarIcon">
                                    </div>
                                    <div title="允许用户输入日期和时间，或从弹出式日历中选择日期。当用户单击弹出式日历中的某个日期后，该日期和当前时间将输入到&quot;日期/时间&quot;字段。"
                                        class="DATETIME SideBarLabel">
                                        日期/时间</div>
                                </li>
                                <li id="EMAIL" class="schemaElement fieldElement">
                                    <div class="EMAIL SideBarIcon">
                                    </div>
                                    <div title="允许用户输入电子邮件地址，对其进行验证以确保格式正确。如果对于一个联系人和潜在客户指定了此字段，则用户单击“发送电子邮件”时可以选择地址。注意，自定义电子邮件地址无法用于批量电子邮件。"
                                        class="EMAIL SideBarLabel">
                                        电子邮件</div>
                                </li>
                                <li id="NUMBER" class="schemaElement fieldElement">
                                    <div class="NUMBER SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何数字。将删除前置零。" class="NUMBER SideBarLabel">
                                        数字</div>
                                </li>
                                <li id="PERCENT" class="schemaElement fieldElement">
                                    <div class="PERCENT SideBarIcon">
                                    </div>
                                    <div title="允许用户输入百分比数字（例如，&quot;10&quot;），并自动向数字添加百分号。" class="PERCENT SideBarLabel">
                                        百分比</div>
                                </li>
                                <li id="PHONE" class="schemaElement fieldElement">
                                    <div class="PHONE SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何电话号码。自动将其转换为电话号码格式。" class="PHONE SideBarLabel">
                                        电话</div>
                                </li>
                                <li id="PICKLIST" class="schemaElement fieldElement">
                                    <div class="PICKLIST SideBarIcon">
                                    </div>
                                    <div title="允许用户从定义的列表中选择值。" class="PICKLIST SideBarLabel">
                                        选项列表</div>
                                </li>
                                <li id="MULTIPICKLIST" class="schemaElement fieldElement">
                                    <div class="MULTIPICKLIST SideBarIcon">
                                    </div>
                                    <div title="允许用户从定义的列表中选择多个值。" class="MULTIPICKLIST SideBarLabel">
                                        选项列表（多项选择）</div>
                                </li>
                                <li id="TEXT" class="schemaElement fieldElement">
                                    <div class="TEXT SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何字母和数字组合。" class="TEXT SideBarLabel">
                                        文本</div>
                                </li>
                                <li id="ENCRYPTED" class="schemaElement fieldElement">
                                    <div class="ENCRYPTED SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何字母和数字组合，并将它们以加密格式存储。" class="ENCRYPTED SideBarLabel">
                                        加密文本</div>
                                </li>
                                <li id="TEXTAREA" class="schemaElement fieldElement">
                                    <div class="TEXTAREA SideBarIcon">
                                    </div>
                                    <div title="允许用户输入多行文本，最多可输入 255 个字符。" class="TEXTAREA SideBarLabel">
                                        文本区</div>
                                </li>
                                <li id="LTA" class="schemaElement fieldElement">
                                    <div class="LTA SideBarIcon">
                                    </div>
                                    <div title="允许用户输入多行文本，最多可输入 131,072 个字符。" class="LTA SideBarLabel">
                                        长文本区</div>
                                </li>
                                <li id="RTA" class="schemaElement fieldElement">
                                    <div class="RTA SideBarIcon">
                                    </div>
                                    <div title="允许用户输入格式化文本、添加图片和链接。最多有 131,072 个字符在分开行上。" class="RTA SideBarLabel">
                                        富文本区域</div>
                                </li>
                                <li id="URL" class="schemaElement fieldElement">
                                    <div class="URL SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何有效的网址。当用户单击该字段时，该 URL 将在单独的浏览器窗口中打开。" class="URL SideBarLabel">
                                        URL</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div id="sidebarObject" class="sidebarTabContent tabHidden">
                        <div id="sideBarObjectHeader" class="sideBarObjectHeader">
                            <h2 class="offscreen">
                                可用对象</h2>
                            <span class="infotext">选择要在生成器上显示的对象。</span><ul class="filter-list">
                                <li>
                                    <h3 class="offscreen">
                                        对象筛选器</h3>
                                    <label for="group-filter">
                                        从下面选择</label><select name="group-filter" id="group-filter" data-uidsfdc="128"><option
                                            selected="selected" value="all">所有对象</option>
                                            <option value="sel">所选对象</option>
                                            <option value="std">标准对象</option>
                                            <option value="cus">自定义对象</option>
                                            <option value="sys">系统对象</option>
                                        </select></li><li>
                                            <div class="quickfindContainer">
                                                <input type="text" size="20" name="quick-filter" maxlength="80" id="quick-filter"
                                                    data-uidsfdc="129" class="quickfindInput ghostText"></div>
                                        </li>
                            </ul>
                        </div>
                        <div id="ObjectList" class="sidebarObjectList">
                            <div id="object-listpane" class="object-listpane" style="height: 143px;">
                                <h3 class="offscreen">
                                    对象</h3>
                                <p class="pipelist">
                                    <a id="selectAll" href="#" data-uidsfdc="130">选择全部</a> | <a id="clearAll" href="#"
                                        data-uidsfdc="131">清除所有</a></p>
                                <ul id="object-list" class="object-list clear" data-uidsfdc="132">
                                    <li class="sel std" id="Quote:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Quote:objListItemCb"><label for="Quote:objListItemCb">报价</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="QuoteLineItem:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="QuoteLineItem:objListItemCb"><label for="QuoteLineItem:objListItemCb">报价行项目</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Product2:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Product2:objListItemCb"><label for="Product2:objListItemCb">产品</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="Order:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Order:objListItemCb"><label for="Order:objListItemCb">订单</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="OrderItem:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="OrderItem:objListItemCb"><label for="OrderItem:objListItemCb">订单产品</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkThanks:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkThanks:objListItemCb"><label for="WorkThanks:objListItemCb">感谢</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Case:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Case:objListItemCb"><label for="Case:objListItemCb">个案</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Contract:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Contract:objListItemCb"><label for="Contract:objListItemCb">合同</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkBadgeDefinition:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkBadgeDefinition:objListItemCb"><label for="WorkBadgeDefinition:objListItemCb">徽章定义</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="Activity:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Activity:objListItemCb"><label for="Activity:objListItemCb">活动</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Pricebook2:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Pricebook2:objListItemCb"><label for="Pricebook2:objListItemCb">价格手册</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="PricebookEntry:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="PricebookEntry:objListItemCb"><label for="PricebookEntry:objListItemCb">价格手册条目</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Solution:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Solution:objListItemCb"><label for="Solution:objListItemCb">解决方案</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Account:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Account:objListItemCb"><label for="Account:objListItemCb">客户</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Contact:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Contact:objListItemCb"><label for="Contact:objListItemCb">联系人</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Lead:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Lead:objListItemCb"><label for="Lead:objListItemCb">潜在客户</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="Task:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Task:objListItemCb"><label for="Task:objListItemCb">任务</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Campaign:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Campaign:objListItemCb"><label for="Campaign:objListItemCb">市场活动</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="CampaignMember:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="CampaignMember:objListItemCb"><label for="CampaignMember:objListItemCb">市场活动成员</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="Event:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Event:objListItemCb"><label for="Event:objListItemCb">事件</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Opportunity:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Opportunity:objListItemCb"><label for="Opportunity:objListItemCb">业务机会</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="OpportunityLineItem:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="OpportunityLineItem:objListItemCb"><label for="OpportunityLineItem:objListItemCb">业务机会产品</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="User:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="User:objListItemCb"><label for="User:objListItemCb">用户</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Asset:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Asset:objListItemCb"><label for="Asset:objListItemCb">资产</label><br
                                                class="clear">
                                    </li>
                                </ul>
                                <span id="object-list-nomatches">找不到匹配目标。</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>        //  Sfdc.onReady(function () { SfdcApp.schemaBuilder = new SfdcApp.SchemaBuilder({ retUrl: '/ui/setup/Setup?setupid=Studio', _CONFIRMATIONTOKEN: 'laVp7jHRlzEUq_rSsGbFEytpTOoL7oQe1V21f1LCvYF1QBpbMaohC3OwLxLB8QhRkidyP2JTljfuFQRdE_Z5Ht1JE.DUQlPpKF5neKz7OVYbXdo2AcrWuxW57zbUCoDOrIwCRJagf6OvsE38FnSf3ntDkdSkh6FcwjQgv49eiuKFc8adBtZpC3C3h43gLVWp8rkFYw==', sbl: { "hlf": true, "srf": true, "sblid": "0GH90000001kA8P", "slf": true }, epf: false, printMode: false, dt: { "D": true, "E": true, "F": true, "B": true, "C": true, "L": true, "N": true, "H": true, "J": true, "U": true, "1": true, "V": true, "Q": true, "6": true, "P": true, "S": true, "Y": true, "z": true, "X": true, "Z": true} }); });</script>
    <!-- Body events -->
    <script type="text/javascript">
        function bodyOnLoad() {
            new mxApplication('config/diagrameditor.xml');

            setFocusOnLoad();
            //if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
            //if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
            if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ;
            //if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
            // new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
            // new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
            //new GhostTextInputWrapperElement('quick-filter', '快速查找...', 'quickfindInput', 'quickfindInput ghostText', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "mQc48ji_Cqg=="; };
        }
        function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
        function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }
    </script>
</body>
</html>
