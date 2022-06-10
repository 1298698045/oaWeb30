<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebClient.apps.files._default" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="ext-strict zen brandQuaternaryBgr" style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>文件 ~ .com - Professional Edition</title>
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zen-container.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zenifiedChatterPageBase.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterBreadcrumbs.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css">
    <script type="text/javascript">
//<![CDATA[
try{(function(){var w=self,l,p,o;if(w&&top){for(;w!==top&&(p=w.parent)&&p!==w&&(o=p.location)&&o.protocol===(l=w.location).protocol&&(o.host===l.host||(p.document&&p.document.domain===w.document.domain));w=p);if(w!==top)throw "";}({f:function(){document.documentElement?document.documentElement.style.display="":(!this.a&&(this.a=10),this.a<1E5&&(window.sfdcRetryShowWindow=this)&&setTimeout("sfdcRetryShowWindow.f()",this.a),this.a*=2)}}.f())})();}catch(e){if(top!==self)top.location=location;else throw e;}//]]></script>
    <script src="/EXT/ext-3.3.3/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/ChatterFiles.js"></script>
    <script src="/jslibrary/sfdc/ChatterFilesTab.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-20 下午5:22", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "ZEN", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-container.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zenifiedChatterPageBase.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterBreadcrumbs.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>     //   ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '106.39.255.240', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcore%2Fchatter%2Ffiles%2FFileTabPage');</script>
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
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif fileTab  FileTabPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();"
    id="ext-gen14" style="overflow: visible;">
    <!-- Main Body Starts Here -->
     <script>var secondsLeftValue = 7120, secondsPopupValue = 7090, lastPageActivityTime = (new Date).getTime(), forceLogout = false; function startSessionTimer() { schedulePopup(7090) } function schedulePopup(a) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); timeoutUniqueId = setTimeout(alertTimeout, 1E3 * a) } function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&amp;startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    <a class="navSkipLink zen-skipLink zen-assistiveText" href="#skiplink">跳到主内容</a>
    <div id="page" class="zen-page">
        <div role="banner">
            <header><div id="appHeaderTop" class="zen-headerTop zen-bgdThemed brandZeronaryBgr"><div class="zen-branding"><img width="175" height="65" title="Salesforce.com" id="phHeaderLogoImage" alt="Salesforce.com" src="/img/seasonLogos/2014_summer_aloha.png"></div><div role="search" class="zen-navViaSearch"><form onsubmit="if (window.ffInAlert) { return false; }" name="sbsearch" method="GET" id="phSearchForm" action="/_ui/search/ui/UnifiedSearchResults"><input type="hidden" value="2" id="searchType" name="searchType"><input type="hidden" value="00Q" id="sen0" name="sen"><input type="hidden" value="001" id="sen1" name="sen"><input type="hidden" value="003" id="sen2" name="sen"><div id="phSearchContainer" class="headerSearchContainer"><div class="headerSearchLeftRoundedCorner"><div class="searchBoxClearContainer"><input type="text" value="" title="搜索..." size="20" placeholder="搜索..." name="str" maxlength="100" id="phSearchInput" autocomplete="off" role="combobox" aria-autocomplete="list" aria-haspopup="true" aria-expanded="false"><a title="清除搜索词" style="visibility:hidden" name="phSearchClearButton" id="phSearchClearButton" href="javascript: void(0);" class="headerSearchClearButton"></a></div><div id="searchButtonContainer" class="headerSearchRightRoundedCorner"><input type="button" id="phSearchButton" value=" 搜索 "></div></div></div></form></div><div class="zen-hasMessages zen-navViaMenus"><h1 class="zen-assistiveText">菜单</h1><div class="zen-pageMessages zen-mrl zen-mbm"><div class="zen-pageMsg hasButtons highImportance"><span class="zen-subPageMsg normalImportance"><a class="zen-actionLink" href="/StoreDoor">剩余 25 天</a></span><span class="zen-subPageMsg highImportance"><input type="button" title="立即订购！" onclick="navigateToUrl('/StoreDoor',null,'立即订购！');" name="立即订购！" class="zen-actionBtn" value=" 立即订购！ "></span></div></div><div role="navigation"><h1 class="zen-assistiveText">菜单</h1><nav><ul class="zen-navMenus"><li class="zen-menu zen-hasSubmenu zen-mrl"><div title="liu jerryliu 的用户菜单" id="userNav" class="menuButton menuButtonRounded"><div id="userNavButton" class="menuButtonButton"><span tabindex="0" id="userNavLabel" class="menuButtonLabel">liu jerryliu</span><div id="userNav-arrow" class="userNav-buttonArrow mbrButtonArrow"></div><div class="userNavButton-btm mbrButton-btm mbrButton-rc"></div></div><div id="userNavMenu" class="menuButtonMenu"><div class="userNavMenu-tr mbrMenu-tr mbrMenu-rc"></div><div class="userNavMenu-tl mbrMenu-tl mbrMenu-rc"></div><div id="userNav-menuItems" class="mbrMenuItems"><a title="我的简档" class="menuButtonMenuLink firstMenuItem" href="/_ui/core/userprofile/UserProfilePage">我的简档</a><a title="我的设置" class="menuButtonMenuLink" href="/ui/setup/Setup?setupid=PersonalSetup">我的设置</a><a title="开发人员控制台 （新窗口）" class="menuButtonMenuLink debugLogLink" href="javascript:openPopupFocus%28%27">开发人员控制台</a><a title="退出" class="menuButtonMenuLink" href="/secur/logout.jsp">退出</a></div><div class="userNavMenu-br mbrMenu-br mbrMenu-rc"></div><div class="userNavMenu-bc mbrMenu-bc"></div><div class="userNavMenu-bl mbrMenu-bl mbrMenu-rc"></div></div></div><script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          new MenuButtonRounded('userNav', false, 16);</script></li><li class="zen-menu zen-noSubmenu zen-mrl"><ul class="zen-inlineList zen-listLarge"><li class="zen-active"><a title="设置" id="setupLink" href="/setup/forcecomHomepage.apexp?setupid=ForceCom&amp;retURL=%2F_ui%2Fcore%2Fchatter%2Ffiles%2FFileTabPage">设置</a></li><li class="zen-active"><a title="帮助和培训 （新窗口）" class="brandZeronaryFgr" href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Flanguage%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">帮助和培训</a></li></ul>
</li><li class="zen-menu zen-hasSubmenu zen-mrm"><div title="Force.com 应用程序菜单" id="tsid" class="menuButton menuButtonRounded appSwitcher"><div id="tsidButton" class="menuButtonButton"><span tabindex="0" id="tsidLabel" class="menuButtonLabel">市场营销</span><div id="tsid-arrow" class="tsid-buttonArrow mbrButtonArrow"></div><div class="tsidButton-btm mbrButton-btm mbrButton-rc"></div></div><div id="tsidMenu" class="menuButtonMenu"><div class="tsidMenu-tr mbrMenu-tr mbrMenu-rc"></div><div class="tsidMenu-tl mbrMenu-tl mbrMenu-rc"></div><div id="tsid-menuItems" class="mbrMenuItems"><a class="menuButtonMenuLink firstMenuItem" href="/servlet/servlet.Integration?lid=01r90000000vnDj&amp;ic=1&amp;tsid=02u900000017Abf">销售</a><a class="menuButtonMenuLink" href="/_ui/core/chatter/ui/ChatterPage?tsid=02u900000017Abh">Salesforce Chatter</a><a class="menuButtonMenuLink" href="/500/o?tsid=02u900000017Abj">Call Center</a><hr class="menuSeparator"><a class="menuButtonMenuLink" href="/StoreDoor?retURL=https%3A%2F%2Fstore.salesforce.com%2Fapex%2Fwebstorehome">Checkout</a><a target="_blank" class="menuButtonMenuLink" href="https://www.salesforce.com/appexchange">AppExchange</a><a target="_blank" class="menuButtonMenuLink" href="http://developer.force.com">开发人员社区</a><a target="_blank" class="menuButtonMenuLink" href="https://success.salesforce.com">成功社区</a></div><div class="tsidMenu-br mbrMenu-br mbrMenu-rc"></div><div class="tsidMenu-bc mbrMenu-bc"></div><div class="tsidMenu-bl mbrMenu-bl mbrMenu-rc"></div></div></div>
<script>       new MenuButtonRounded('tsid', false, 16);</script></li></ul>
</nav></div></div></div>
<script>    var umps_config = { "locale": "zh_CN", "userLanguage": "zh_CN", "timeFormat": "ah:mm", "sfdcVersion": 190.0,
        "chatterDesktopEnabled": "true", "xoredSessionId": "PZCDRt7NkKDmdU1KPQHQBAmJzXOGIucse1g==", "orgId": "AP1$00D90000000yI4o", 
"umpsUrl": "", "umpsWidgetPath": "UMPSWidget_184", "userId": "005900000038QVZ", "chatterUserType": "s", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "isMeetupsEnabled": "false", "iosMessengerEnabled": "false", "orgWideSearchEnabled": "true", "isGroupChatEnabled": "false", "chatMsgHistoryEnabled": "true", "localeStyle": "1", "isAudioVideoEnabled": "false", "notificationsEnabled": false, "randomMask": "", "chatMsgDeepHistoryEnabled": "false", "contentDomain": "", "baseSfdcUrl": "", "chat_options_help_url": "javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);", "chat_using_help_url": "javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);", "isScreenShareEnabled": "false", "chatMsgDeepHistoryDarkLaunch": "false", "isChatUiEnabled": "true", "maxParticipantsInAdhocChat": "10" };</script><script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     (function () { "use strict"; var a = function () { setTimeout(function () { if (window.self == window.top) { var e = document.createElement("IFRAME"); e.setAttribute("id", "chat_widget_frame"); e.setAttribute("title", "iframe_js"); e.setAttribute("name", "iframe_js"); e.setAttribute("src", ""); e.setAttribute("style", "display:none;frameborder:0"); document.getElementsByTagName("head")[0].appendChild(e) } }, 1); }; window.attachEvent ? window.attachEvent("onload", a) : window.addEventListener("load", a, !1) } ());</script><div role="navigation" id="tabContainer" class="zen-hasTabOrganizer zen-headerBottom brdPalette"><h1 class="zen-assistiveText">选项卡导航</h1><nav><ul id="tabBar" class="zen-inlineList zen-tabMenu"><li id="home_Tab" class="zen-firstItem"><a title="主页选项卡" href="/home/home.jsp">主页</a></li><li id="01r90000000vnDj_Tab"><a title="Getting Started选项卡" href="/servlet/servlet.Integration?lid=01r90000000vnDj&amp;ic=1">Getting Started</a></li><li id="Campaign_Tab"><a title="市场活动选项卡" href="/701/o">市场活动</a></li><li id="Lead_Tab"><a title="潜在客户选项卡" href="/00Q/o">潜在客户</a></li><li id="Contact_Tab"><a title="联系人选项卡" href="/003/o">联系人</a></li><li id="Account_Tab"><a title="客户选项卡" href="/001/o">客户</a></li><li id="report_Tab"><a title="报表选项卡" href="/00O/o">报表</a></li><li id="Dashboard_Tab"><a title="仪表板选项卡" href="/01Z/o">仪表板</a></li><li id="Chatter_Tab"><a title="Chatter选项卡" href="/_ui/core/chatter/ui/ChatterPage">Chatter</a></li><li id="File_Tab" class="brandPrimaryBgr zen-active primaryPalette"><a title="文件选项卡 - 已选取" class="brandPrimaryFgr" href="/_ui/core/chatter/files/FileTabPage">文件</a><span class="zen-assistiveText">（当前选择的）</span></li><li id="AllTab_Tab"><a href="/home/showAllTabs.jsp">&nbsp;<img title="所有选项卡" class="allTabsArrow" alt="所有选项卡" src="/s.gif">&nbsp;</a></li><li id="MoreTabs_Tab" class="zen-notNeeded zen-lastItem zen-moreTabs" data-uidsfdc="115"><a title="更多选项卡菜单（结束）" id="zen-moreTabsAssistiveLink" class="zen-assistiveLink" href="javascript:void(0);" data-uidsfdc="116"><b></b></a><ul id="MoreTabs_List"></ul>
</li></ul>
</nav></div></header>
        </div>
        <div class="zen-bodyZen brdPalette brandPrimaryBrd">
            <div id="bodyInner" class="zen-bodyInner">
                <div role="main" class="zen-main">
                    <a name="skiplink">
                        <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                            alt="内容在此开始" src="/s.gif"></a><div class="mainContentHeader zen-mbm">
                                <ul class="zen-pipedList zen-end">
                                    <li class="zen-lastItem zen-firstItem"><span class="zen-media zen-mediaExt"><span
                                        class="zen-mediaBody"><a class="zen-deemphasize" href="javascript:openPopupFocusEscapePounds(%2727, false, false);">
                                            此页面的帮助</a><a title="此页面的帮助 （新窗口）" class="zen-imgExt" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"><img
                                                title="帮助" class="helpIcon" alt="帮助" src="/s.gif"></a></span></span></li></ul>
                                <div class="zen-media">
                                    <img title="文件" class="zen-mls zen-img pageTitleIcon" alt="文件" src="/s.gif"><div
                                        class="zen-mediaBody">
                                        <h1 class="zen-man">
                                            文件</h1>
                                    </div>
                                </div>
                                <div class="ptBreadcrumb">
                                </div>
                            </div>
                    <script>                        chatter.getToolbox().setToken('63nDFOgkjCHUEl2ZrhaYPEl2VN8aLXdX.i9qekuIAjPVYOp4A3uZYikUaARfHTWb9qQkAp8zv7RUwTQsjWn.MDwBnQaa1M0qUkJ1Hy.F7TB.KwoeEdC8eQ_oLooenRRnFg5C7yjAVI7vUV6_4biqTuiRMTI=');</script>
                    <div class="chatterFilesTabPage chatterListViewContainer">
                        <div class="chatterFilesTabPageHeader">
                            <div role="navigation" class="chatterBreadcrumbs">
                                <span id="headBreadcrumbNode"><a href="/_ui/core/chatter/ui/ChatterPage">Chatter</a></span><img
                                    width="1" height="1" title="" class="breadcrumbSeparator breadcrumbSeparatorLtr"
                                    alt="" src="/s.gif"><span id="tailBreadcrumbNode" class="tailNode cxTailNode">文件</span></div>
                            <div class="pageHelpIconPanel">
                                <a href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_files_overview.htm%2526section%253DCollaboration%2526language%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                    <span class="helpLink">此页面的帮助</span>
                                    <img src="/s.gif" class="helpIcon" alt="此页面的帮助 （新窗口）" title="此页面的帮助 （新窗口）">
                                </a>
                            </div>
                        </div>
                        <div class="leftContent">
                            <div class="chatterFileBrowsePanel" id="chatterFileBrowsePanel">
                                <ul class="brandSideNav">
                                    <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '00D90000000yI4o', Chatter.FileBrowse.SELECTION_TYPES.ORG, '所有文件'); return false"
                                        class="linkItem" id="allFilesBrowseItem" title="所有文件" href="javascript:void(0);">
                                        <span class="hyperlinkTextSpan">所有文件</span></a> </li>
                                    <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '00D90000000yI4o', Chatter.FileBrowse.SELECTION_TYPES.RECENT, '最近查看'); return false"
                                        class="linkItem selectedLinkItem" id="recentFilesBrowseItem" title="最近查看 - 已选取"
                                        href="javascript:void(0);"><span class="hyperlinkTextSpan">最近查看</span></a> </li>
                                    <div class="subHeaderSpacer">
                                    </div>
                                    <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '005900000038QVZ', Chatter.FileBrowse.SELECTION_TYPES.ALL_USER_FILES, '我的文件', true); return false"
                                        class="linkItem fileBrowseSubHeader " title="我的文件" href="javascript:void(0);"><span
                                            class="hyperlinkTextSpan">我的文件</span></a>
                                        <ul id="chatterAllMyFiles">
                                            <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '005900000038QVZ', Chatter.FileBrowse.SELECTION_TYPES.USER, '我拥有的文件'); return false"
                                                class="subLinkItem " title="我拥有的文件" href="javascript:void(0);"><span class="hyperlinkTextSpan">
                                                    我拥有的文件</span></a> </li>
                                            <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '005900000038QVZ', Chatter.FileBrowse.SELECTION_TYPES.SHARED_WITH_ME, '与我共享的文件', true); return false"
                                                class="subLinkItem " title="与我共享的文件" href="javascript:void(0);"><span class="hyperlinkTextSpan">
                                                    与我共享的文件</span></a> </li>
                                            <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '005900000038QVZ', Chatter.FileBrowse.SELECTION_TYPES.FOLLOWED_FILES_ONLY, '我追随的文件', true, false); return false"
                                                class="subLinkItem " title="我追随的文件" href="javascript:void(0);"><span class="hyperlinkTextSpan">
                                                    我追随的文件</span></a> </li>
                                        </ul>
                                    </li>
                                    <li class="liItem">
                                        <div class="subHeaderSpacer">
                                        </div>
                                        <div id="chatterFilesInScrollPanel">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="rightContent">
                            <div class="browseLabelPanel" id="browseLabelPanel">
                                <h2 class="browseLabel" data-contentsfdc-filter="other" id="browseLabel">
                                    最近查看的文件</h2>
                                <span class="browseDesc" id="browseDesc"></span>
                            </div>
                            <div class="zen fileSyncDowloadAndFeedbackHeaderDiv">
                                <ul class="zen-pipedList">
                                    <li><a href="javascript:Sfdc.AccessibleFileSyncMobileDownloadDialog.open()">获取我们的移动应用程序</a></li></ul>
                            </div>
                            <div class="chatterFileListView">
                                <div class="chatterListViewContainer">
                                    <script src="/static/js/picklist.js"></script>
                                    <script>                                        new ContentListViewport('000000000000000', 'ContentVersionRecentlyViewedFileSearch', { "inlineEditData": { "saveUrl": "/_ui/common/udd/object/InlineEditListSave", "massEditable": false, "editable": false }, "rolodexIndex": -1, "entityButtons": [], "buttons": [], "listButtons": [], "retURL": "/_ui/core/chatter/files/FileDetailPage", "capped": false, "rowsPerPage": 25, "page": 1, "hasMassActions": false, "sortState": [{ "field": "last_modified", "dir": "DESC"}], "printURL": "/_ui/core/chatter/files/FileDetailPage", "listData": { "ACTION_COLUMN": [], "author": ["\u003Ca href=\"/_ui/core/userprofile/UserProfilePage?u=005900000038QVZ\" class=\"filesOwnerLink\" title=\"liu jerryliu\"\u003Eliu jerryliu\u003C/a\u003E"], "last_modified": ["\u003Cspan  title=\"2014年9月15日, 下午6:17\"\u003E2014-9-15\u003C/span\u003E"], "title": ["&amp;nbsp;\u003Ca href=\"/069900000017Euf\"\u003E\u003Cspan class=\"fileTypeIcon\"\u003E\u003Cimg src=\"/s.gif\" alt=\"纯文本\" width=\"32\" height=\"32\" class=\"sprite-doctype_txt_32\" title=\"纯文本 (此文件是专有文件。已将其与任何人进行共享)\" /\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"filePrivateIcon\" title=\"纯文本 (此文件是专有文件。已将其与任何人进行共享)\" /\u003E\u003C/span\u003E\u003C/a\u003E\u003Ca href=\"/069900000017Euf\" class=\"fileNameLink\"\u003E\u003Cspan  class=\"fileName\" id=\"069900000017EufAAE_title\" title=\"framework_2014070309\"\u003Eframework_2014070309\u003C/span\u003E\u003C/a\u003E&amp;nbsp;"], "LIST_RECORD_ID": ["068900000017scq"], "actions": ["\u003Ca href=\"javascript:OverlayDialogElement.showFilePreview(%27docViewerOverlay%27,%27069900000017EufAAE_title%27,%27/_swf/190003/sfc%27,%27068900000017scq%27,%27chatter_bubble%27,%27false%27,%27docViewerContainer%27,false,%27txt%27,false,%27%27);\" class=\"contentActionLink\" shouldstayinownframe=\"true\"\u003E\u003Cimg src=\"/img/s.gif\" alt=\"\"  width=\"1\" height=\"1\" class=\"chatterFileIcon previewItemIcon\" title=\"预览\" /\u003E\u003C/a\u003E\u003Ca href=\"javascript: void(0);\" title=\"停止追随该文件以停止接收摘要中的更新。\" revtitle=\"追随该文件以接收摘要中的更新。\" entityid=\"069900000017Euf\" class=\"chatterFollowUnfollowAction  unfollow\" onclick=\"chatter.getFollowUnfollowListAction().toggle(this)\"\u003E\u003C/a\u003E\u003Ca href=\"javascript:Sfdc.ChatterFileFeedActions.openPopup%28%27ActionLink069900000017Euf%27%29%3B\" class=\"more-file-actions\" id=\"ActionLink069900000017Euf\" title=\"打开更多操作列表\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"content-action-link-arrow\" title=\"\" /\u003E\u003C/a\u003E\n\u003Cdiv id=\"contentActionMenuActionLink069900000017Euf\" class=\"contentActionMenu\" docId=\"069900000017Euf\" rendition=\"true\" subscribed=\"true\" sharing=\"true\" role=\"menu\"\u003E\n        \u003Ca href=\"javascript:Sfdc.ChatterFileFeedActions.closePopup(%27contentActionMenuActionLink069900000017Euf%27);\" title=\"关闭更多操作列表\" tabindex=\"-1\" class=\"more-file-actions compactLink\"\u003E\u003Cimg class=\"content-action-link-arrow\" src=\"/s.gif\" alt=\"\"/\u003E\u003C/a\u003E\n      \t    \n\t    \t       \u003Cdiv class=\"contentActionMenuItem\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"https://c.ap1.content.force.com/sfc/servlet.shepherd/version/download/068900000017scq?asPdf=false&amp;amp;operationContext=CHATTER\" class=\"contentActionLink\" shouldstayinownframe=\"true\"\u003E\u003Cimg src=\"/img/s.gif\" alt=\"\"  width=\"1\" height=\"1\" class=\"chatterFileIcon downloadItemIcon\" /\u003E\u003Cspan  class=\"contentActionLabel\"\u003E下载  txt\u003C/span\u003E\u003Cspan  class=\"contentActionLabel fileSize\"\u003E(15&amp;nbsp;KB)\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n    \t    \n    \t       \u003Cdiv class=\"contentActionMenuItem upload unchecked blockLinkItem\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:void();\" class=\"contentActionLink\"\u003E\u003Cspan class=\"docid hidden\"\u003E069900000017Euf\u003C/span\u003E\u003Cimg class=\"chatterFileIcon uploadIcon\" alt=\"\" src=\"/s.gif\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E上载新版本\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n    \t    \n    \t\t\t\t\u003Cdiv class=\"hr\"\u003E\n        \t  \t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithPeople%28%27069900000017Euf%27%2C%27framework_2014070309%27%2C%20%27005900000038QVZ%27%2C%20%27%2Ffile%2Fsharedwithwizard%2F%27%2C%20%27%27%2C%20%27%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E与人共享\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n        \t  \t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithGroups%28%27069900000017Euf%27%2C%20%27framework_2014070309%27%2C%27005900000038QVZ%27%2C%20%27%2Ffile%2Fsharedwithwizard%2F%27%2C%27%27%2C%20%27%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E与小组共享\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n    \t\t  \t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFilePublicLinksDialog.showDialog%28%27069900000017Euf%27%2C%27068900000017scq%27%2C%20%27framework_2014070309%27%2C%20%27%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E通过链接共享\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n\t      \t\t\t\u003C/div\u003E\n      \t\t\t\u003Cdiv class=\"hr\"\u003E\n    \t\t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList%28%27framework_2014070309%27%2C%20%27069900000017Euf%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E共享设置\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n      \t\t\t\u003C/div\u003E\n\u003C/div\u003E\n"], "ACTION_COLUMN_LABELS": [] }, "filter": { "staticTranslation": true, "scopeEntity": "", "scope": -1, "entityType": "069", "type": "ContentVersionRecentlyViewedFileSearch", "editable": false, "id": "000000000000000", "scopeEntity2": "", "bodyClass": "contentSearchTab", "isCloneable": false, "showCheckBox": false, "name": "选择一个要附加的文件", "isCreateNewDisplayed": true, "owner": "000000000000000", "shownColumns": [{ "useRolodex": true, "isSortable": true, "columnName": "actions", "label": "操作" }, { "useRolodex": true, "isSortable": true, "columnName": "title", "label": "名称" }, { "useRolodex": true, "isSortable": true, "columnName": "author", "label": "所有人" }, { "useRolodex": false, "isSortable": true, "columnName": "last_modified", "label": "上次修改时间"}], "language": "CHINESE_SIMP", "filters": [] }, "totalRowCount": 1 }, '00D90000000yI4o', false, '搜索所有文件...', false, '', undefined, true, false, null, null);</script>
                                    <div id="000000000000000_wrapper" class="individualPalette listViewportWrapper">
                                        <div id="000000000000000_listViewport" class="listViewport chatterFileListBlock">
                                            <form onsubmit="return ListViewport.instances['000000000000000'].verify('请至少选择一行')"
                                            name="000000000000000_actionForm" method="POST" id="000000000000000_actionForm" action="">
                                            <input type="hidden" value="" name="000000000000000_pageState" id="000000000000000_pageState"><input
                                                type="hidden" value="" name="000000000000000_rolodexState" id="000000000000000_rolodexState"><input
                                                    type="hidden" value="/_ui/core/chatter/files/FileTabPage" name="retURL" id="retURL"><div
                                                        id="000000000000000_topNav" class="topNav primaryPalette">
                                                        <div class="controls multiUploadControl">
                                                            <div class="blueBar brandSecondaryBrd">
                                                            </div>
                                                            <div id="fileUploaderDiv" class="uploadFile dragDropZoneDiv" style="visibility: visible;">
                                                                <div id="fileUploadBtnDiv" class="btnImportant dragDropZoneButton" style="position: relative;
                                                                    overflow: hidden; direction: ltr;" data-uidsfdc="13">
                                                                    <img width="12" height="12" title="" class="uploadArrow" alt="" src="/static/184/img/chatterfiles/uploadWhiteArrow12.png"><a
                                                                        id="uploadFileButtonLink" class="uploadFileButtonLink" href="javascript:void(0)"
                                                                        data-uidsfdc="12" style="display: none;">上载文件</a><input type="file" name="chatterFile_upload"
                                                                            title="上载文件" multiple="multiple" class="multifile-upload-input-button" id="multiFileInput"
                                                                            data-uidsfdc="14"><input type="button" class="btnImportant" id="multiUploadBtn" value="上载文件"></div>
                                                                <script>                                                                    Sfdc.onReady(function () { Sfdc.ChatterFileUploader.hookupInputForMultiFileUpload({ "btnDivId": "fileUploadBtnDiv", "enableMultiFileUploading": true, "enableMultiFileUploadingForIE": true, "filterParentId": "00D90000000yI4o", "parentEntityName": "yourzine2", "maxFileSize": 2147483648, "maxFileSizeLabel": "2.0&amp;nbsp;GB", "swfUrlPrefix": "/_swf/190003/sfc", "multiUploadHelpUrl": "javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_files_multi_upload.htm%2526section%253DCollaboration%2526language%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" }); });</script>
                                                                <div class="multifile-upload-draganddrop-indicactor">
                                                                    <span>或者拖放以添加文件...</span></div>
                                                            </div>
                                                            <div id="000000000000000_search">
                                                            </div>
                                                            <div class="clearingBox">
                                                            </div>
                                                        </div>
                                                    </div>
                                            <div id="000000000000000_subNav" class="subNav">
                                                <div class="linkBar brandSecondaryBrd">
                                                    <div id="000000000000000_listButtons" class="listButtons">
                                                    </div>
                                                    <div class="clearingBox">
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="000000000000000_listBody" class="listBody">
                                                <div class="zen-listView FileListView zen-listViewFixed zen-listView-sfdc_listView_863629"
                                                    id="sfdc:listView:863629" data-uidsfdc="105">
                                                    <div class="zen-header">
                                                        <h2 class="zen-title">
                                                        </h2>
                                                        <div class="zen-facet zen-facetheader">
                                                        </div>
                                                    </div>
                                                    <div class="zen-navigation">
                                                        <div class="zen-facet zen-facetnavigation">
                                                            <div class="zen-searchBox" id="searchBox:79" style="position: relative;" data-uidsfdc="81">
                                                                <label class="zen-assistiveText" for="searchBox:79:input">
                                                                    搜索所有文件...</label><input type="text" id="searchBox:79:input" title="搜索所有文件..." autocomplete="off"
                                                                        aria-expanded="false" aria-haspopup="true" placeholder="搜索所有文件..." value="" maxlength="100"
                                                                        style="position: relative;" data-uidsfdc="82"><a class="zen-clearInput" href="#"
                                                                            title="" data-uidsfdc="83"></a><a class="zen-mls zen-pas zen-btn zen-searchButton"
                                                                                href="#" title="搜索" data-uidsfdc="84">搜索</a></div>
                                                        </div>
                                                    </div>
                                                    <div class="zen-content">
                                                        <table class="zen-data zen-columnSort ui-listView-ui_listView_734928" id="ui:listView:734928"
                                                            data-uidsfdc="87">
                                                            <thead>
                                                                <tr class="">
                                                                    <th tabindex="-1" title="操作" class="zen-first-child actions" scope="col">
                                                                        操作<span class="zen-visualization"></span>
                                                                    </th>
                                                                    <th tabindex="-1" title="名称" class="title" scope="col">
                                                                        名称<span class="zen-visualization"></span>
                                                                    </th>
                                                                    <th tabindex="-1" title="所有人" class="author" scope="col">
                                                                        所有人<span class="zen-visualization"></span>
                                                                    </th>
                                                                    <th tabindex="-1" title="上次修改时间" class="zen-last-child last_modified" scope="col">
                                                                        上次修改时间<span class="zen-visualization"></span>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                            </tfoot>
                                                            <tbody>
                                                                <tr id="068900000017scq" class="">
                                                                    <td class="actions zen-first-child">
                                                                        <a shouldstayinownframe="true" class="contentActionLink" href="javascript:OverlayDialogElement.showFilePreview(%27docViewerOverlay%27,%27069900000017EufAAE_title%27,%27/_swf/190003/sfc%27,%27068900000017scq%27,%27chatter_bubble%27,%27false%27,%27docViewerContainer%27,false,%27txt%27,false,%27%27);">
                                                                            <img width="1" height="1" title="预览" class="chatterFileIcon previewItemIcon" alt=""
                                                                                src="/img/s.gif"></a><a onclick="chatter.getFollowUnfollowListAction().toggle(this)"
                                                                                    class="chatterFollowUnfollowAction  unfollow" entityid="069900000017Euf" revtitle="追随该文件以接收摘要中的更新。"
                                                                                    title="停止追随该文件以停止接收摘要中的更新。" href="javascript: void(0);"></a><a title="打开更多操作列表" id="ActionLink069900000017Euf"
                                                                                        class="more-file-actions" href="javascript:Sfdc.ChatterFileFeedActions.openPopup%28%27ActionLink069900000017Euf%27%29%3B"><img
                                                                                            title="" class="content-action-link-arrow" alt="" src="/s.gif"></a>
                                                                        <div role="menu" sharing="true" subscribed="true" rendition="true" docid="069900000017Euf"
                                                                            class="contentActionMenu" id="contentActionMenuActionLink069900000017Euf" style="visibility: visible;
                                                                            display: none; position: absolute; left: 52px; top: 78px;" data-uidsfdc="129">
                                                                            <a class="more-file-actions compactLink" tabindex="-1" title="关闭更多操作列表" href="javascript:Sfdc.ChatterFileFeedActions.closePopup(%27contentActionMenuActionLink069900000017Euf%27);"
                                                                                id="ext-gen1">
                                                                                <img alt="" src="/s.gif" class="content-action-link-arrow"></a>
                                                                            <div role="menuitem" tabindex="-1" class="contentActionMenuItem" id="ext-gen2">
                                                                                <a shouldstayinownframe="true" class="contentActionLink" href="https://c.ap1.content.force.com/sfc/servlet.shepherd/version/download/068900000017scq?asPdf=false&amp;operationContext=CHATTER"
                                                                                    id="ext-gen8">
                                                                                    <img width="1" height="1" class="chatterFileIcon downloadItemIcon" alt="" src="/img/s.gif"><span
                                                                                        class="contentActionLabel">下载 txt</span><span class="contentActionLabel fileSize">(15&nbsp;KB)</span></a></div>
                                                                            <div role="menuitem" tabindex="-1" class="contentActionMenuItem upload blockLinkItem"
                                                                                id="ext-gen3">
                                                                                <a class="contentActionLink" href="/069900000017Euf?fa=nv" id="ext-gen9"><span class="docid hidden"
                                                                                    id="ext-gen15">069900000017Euf</span><img src="/s.gif" alt="" class="chatterFileIcon uploadIcon"><span
                                                                                        class="contentActionLabel">上载新版本</span></a></div>
                                                                            <div class="hr">
                                                                                <div role="menuitem" tabindex="-1" class="contentActionMenuItem blockLinkItem emptyIcon"
                                                                                    id="ext-gen4">
                                                                                    <a class="contentActionLink" href="javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithPeople%28%27069900000017Euf%27%2C%27framework_2014070309%27%2C%20%27005900000038QVZ%27%2C%20%27%2Ffile%2Fsharedwithwizard%2F%27%2C%20%27%27%2C%20%27%27%29%3B"
                                                                                        id="ext-gen10">
                                                                                        <img class="emptyIcon" alt="" src="/s.gif"><span class="contentActionLabel">与人共享</span></a></div>
                                                                                <div role="menuitem" tabindex="-1" class="contentActionMenuItem blockLinkItem emptyIcon"
                                                                                    id="ext-gen5">
                                                                                    <a class="contentActionLink" href="javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithGroups%28%27069900000017Euf%27%2C%20%27framework_2014070309%27%2C%27005900000038QVZ%27%2C%20%27%2Ffile%2Fsharedwithwizard%2F%27%2C%27%27%2C%20%27%27%29%3B"
                                                                                        id="ext-gen11">
                                                                                        <img class="emptyIcon" alt="" src="/s.gif"><span class="contentActionLabel">与小组共享</span></a></div>
                                                                                <div role="menuitem" tabindex="-1" class="contentActionMenuItem blockLinkItem emptyIcon"
                                                                                    id="ext-gen6">
                                                                                    <a class="contentActionLink" href="javascript:Sfdc.AccessibleFilePublicLinksDialog.showDialog%28%27069900000017Euf%27%2C%27068900000017scq%27%2C%20%27framework_2014070309%27%2C%20%27%27%29%3B"
                                                                                        id="ext-gen12">
                                                                                        <img class="emptyIcon" alt="" src="/s.gif"><span class="contentActionLabel">通过链接共享</span></a></div>
                                                                            </div>
                                                                            <div class="hr">
                                                                                <div role="menuitem" tabindex="-1" class="contentActionMenuItem blockLinkItem emptyIcon"
                                                                                    id="ext-gen7">
                                                                                    <a class="contentActionLink" href="javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList%28%27framework_2014070309%27%2C%20%27069900000017Euf%27%29%3B"
                                                                                        id="ext-gen13">
                                                                                        <img class="emptyIcon" alt="" src="/s.gif"><span class="contentActionLabel">共享设置</span></a></div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="title">
                                                                        &nbsp;<a href="/069900000017Euf"><span class="fileTypeIcon"><img width="32" height="32"
                                                                            title="纯文本 (此文件是专有文件。已将其与任何人进行共享)" class="sprite-doctype_txt_32" alt="纯文本" src="/s.gif"></span></a><a
                                                                                class="fileNameLink" href="/069900000017Euf"><span title="framework_2014070309" id="069900000017EufAAE_title"
                                                                                    class="fileName">framework_2014070309</span></a>&nbsp;
                                                                    </td>
                                                                    <td class="author">
                                                                        <a title="liu jerryliu" class="filesOwnerLink" href="/_ui/core/userprofile/UserProfilePage?u=005900000038QVZ">
                                                                            liu jerryliu</a>
                                                                    </td>
                                                                    <td class="last_modified zen-last-child">
                                                                        <span title="2014年9月15日, 下午6:17">2014-9-15</span>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <div class="zen-loader">
                                                            <div class="zen-background">
                                                            </div>
                                                            <div class="zen-content">
                                                                正在加载...</div>
                                                        </div>
                                                    </div>
                                                    <div class="zen-footer">
                                                        <div class="zen-facet zen-facetfooter">
                                                            <div class="zen-pager zen-pagerPageInfo" data-uidsfdc="94">
                                                                <span class="zen-pagerControl">1 - 1 共 个 1</span></div>
                                                            <div class="zen-pager zen-pagerNextPrevious" data-uidsfdc="95">
                                                                <a class="zen-pagerControl zen-first zen-disabled" href="#" aria-disabled="true"
                                                                    data-uidsfdc="96"><span title="第一页" class="zen-visualization"></span><span class="zen-label">
                                                                        第一页</span></a><a class="zen-pagerControl zen-previous zen-disabled" href="#" aria-disabled="true"
                                                                            data-uidsfdc="99"><span title="上一页" class="zen-visualization"></span><span class="zen-label">上一页</span></a><a
                                                                                class="zen-pagerControl zen-next zen-disabled" href="#" aria-disabled="true"
                                                                                data-uidsfdc="98"><span class="zen-label">下一页</span><span title="下一页" class="zen-visualization"></span></a><a
                                                                                    class="zen-pagerControl zen-last zen-disabled" href="#" aria-disabled="true"
                                                                                    data-uidsfdc="97"><span class="zen-label">最后一页</span><span title="最后一页" class="zen-visualization"></span></a></div>
                                                            <div class="zen-pager zen-pagerJumpToPage" data-uidsfdc="100">
                                                                <label for="pagerJumpToPage_939459">
                                                                    页</label><input type="text" data-skipfocus="true" class="zen-input zen-inputTiny zen-pagerControl"
                                                                        id="pagerJumpToPage_939459" aria-readonly="true" readonly="" data-uidsfdc="101"><label
                                                                            for="pagerJumpToPage_939459">共 个<span class="zen-pagerControl">1</span></label></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="000000000000000_offPageIds" class="offPageIds">
                                            </div>
                                            </form>
                                            <div id="000000000000000_bottomNav" class="bottomNav">
                                                正在加载...</div>
                                        </div>
                                        <div style="display: none" id="000000000000000_feedContainer" class="feedContainer">
                                            <div id="000000000000000_feedBody" class="feedBody">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Body events -->
                    <script type="text/javascript">function bodyOnLoad(){setFocusOnLoad();if (typeof(startSessionTimer)!='undefined') {startSessionTimer(); };if (typeof(ActivityReminder)!='undefined') {ActivityReminder.initialize([], false, false);};if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)){sfdcPage.executeOnloadQueue();};Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs();SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");new UnifiedSearchAutoCompleteElement("phSearchInput","/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet",1,{},false,null,"phSearchForm",["div","searchOwner","asPhrase","sen"],{},true,3,100);new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");if(window.PreferenceBits){window.PreferenceBits.prototype.csrfToken="etazziWUsIBOTfGUe_2JS_kL.Y2tvwZEZ0IkxcUmiLdDpMYH8iiXka8Wwj2eoO.6H4m6mZFJTZVQdLGdqtmqimsqgvTIVM2DYizWhs7ATsuIX712cejp0IqYmoN5QDqNHp880m8ZDN_cxJp.zti64EmldHzZDfIAz96OECV6j4SLWAJvmuP47SYGgnEy5XcdGMnngQ==";};}function bodyOnBeforeUnload(){if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)){sfdcPage.executeOnBeforeUnloadQueue();};}function bodyOnFocus(){closePopupOnBodyFocus();}function bodyOnUnload(){}</script>
                    <div id="datePicker" class="datePicker">
                        <div class="dateBar">
                            <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();"
                                onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select
                                    title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
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
                                </select><img title="下月" onmouseover="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';"
                                    onfocus="this.className = 'calRightOn';" onclick="DatePicker.datePicker.nextMonth();"
                                    onblur="this.className = 'calRight';" class="calRight" alt="下月" src="/s.gif"><select
                                        title="年" name="calYearPicker" id="calYearPicker"><option value="2013">2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                    </select></div>
                        <div class="calBody">
                            <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                                <tbody>
                                    <tr>
                                        <th scope="col" class="dayOfWeek">
                                            星期日
                                        </th>
                                        <th scope="col" class="dayOfWeek">
                                            星期一
                                        </th>
                                        <th scope="col" class="dayOfWeek">
                                            星期二
                                        </th>
                                        <th scope="col" class="dayOfWeek">
                                            星期三
                                        </th>
                                        <th scope="col" class="dayOfWeek">
                                            星期四
                                        </th>
                                        <th scope="col" class="dayOfWeek">
                                            星期五
                                        </th>
                                        <th scope="col" class="dayOfWeek">
                                            星期六
                                        </th>
                                    </tr>
                                    <tr id="calRow1" class="calRow">
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="calRow2" class="calRow">
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="calRow3" class="calRow">
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="calRow4" class="calRow">
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="calRow5" class="calRow">
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="calRow6" class="calRow">
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                            onblur="hiOff(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="buttonBar">
                                <a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday"
                                    href="javascript:%20void%280%29%3B">今天</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="zen-pageFooter zen-pbl">
            <ul class="zen-pipedList">
                <li class="zen-firstItem"><span class="brandQuaternaryFgr">Copyright &copy; 2000-2014
                    salesforce.com, inc. 公司版权所有。保留所有权利。</span></li><li><a title="隐私声明 （新窗口）" target="_blank"
                        class="brandQuaternaryFgr" href="http://www.salesforce.com/company/privacy.jsp">
                        隐私声明</a></li><li><a title="安全声明 （新窗口）" target="_blank" class="brandQuaternaryFgr"
                            href="http://www.salesforce.com/company/security.jsp">安全声明</a></li><li><a title="使用条款 （新窗口）"
                                target="_blank" class="brandQuaternaryFgr" href="http://www.salesforce.com/company/msa.jsp">
                                使用条款</a></li><li class="zen-lastItem"><a title="508 符合性 （新窗口）" class="brandQuaternaryFgr"
                                    href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Daccessibility_overview.htm%2526section%253Daccessibility%2526language%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                    508 符合性</a></li></ul>
        </div>
        <div>
        </div>
    </div>
    <script>        walkthrough = { log: function () { Sfdc.ClientLogging.addRelay(new Sfdc.ClientLogging.ConsoleLogger(), true); Sfdc.log("Console logging is ON."); } };</script>
    <script>        walkthrough.trials = {};</script>
    <script>        var SFDCSessionVars = { "uid": "005900000038QVZ", "exp": 1411212097000, "host": "login.salesforce.com", "oid": "00D90000000yI4o", "server": "https://login.salesforce.com/login/sessionserver190.html", "act": "u" };</script>
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1408647202000/sfdc/WalkthroughCorePlatform.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/sfdc/WalkthroughCorePlatform.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1408647202000/sfdc/WalkthroughTrials.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/sfdc/WalkthroughTrials.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1400606638000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/sfdc/SfdcSessionBase190.js"></script>
</body>
</html>
