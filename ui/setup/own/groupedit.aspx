<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="groupedit.aspx.cs" Inherits="WebClient.setup.own.groupedit" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>我的小组: 小组成员关系：新建小组 ~ Salesforce.com - Professional Edition</title>
   <link href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/elements.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/common.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css" rel="stylesheet"  type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/setupV2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//<![CDATA[
try{(function(){var w=self,l,p,o;if(w&&top){for(;w!==top&&(p=w.parent)&&p!==w&&(o=p.location)&&o.protocol===(l=w.location).protocol&&(o.host===l.host||(p.document&&p.document.domain===w.document.domain));w=p);if(w!==top)throw "";}({f:function(){document.documentElement?document.documentElement.style.display="":(!this.a&&(this.a=10),this.a<1E5&&(window.sfdcRetryShowWindow=this)&&setTimeout("sfdcRetryShowWindow.f()",this.a),this.a*=2)}}.f())})();}catch(e){if(top!==self)top.location=location;else throw e;}//]]&gt;</script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = true;
        }
</script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411677186000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-10-7 下午3:23", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": true }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411676930000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1412138707000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>
    
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>     //   ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.233', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fsetup%2Fown%2Fgroupedit.jsp%3FretURL%3D%252Fsetup%252Fown%252Fpersonalgroups.jsp%253Fsetupid%253DGroups%2526retURL%253D%25252Fui%25252Fsetup%25252FSetup%25253Fsetupid%25253DPersonalInfo%26own%3D005900000038QVZ%26setupid%3DGroups');</script>
    <iframe id="chat_widget_frame" title="iframe_js" name="iframe_js" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/_js.html?cflag=190.18.17&amp;parentUrl=https://ap1.salesforce.com"
        style="display: none; frameborder: 0"></iframe>
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
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif setupTab  sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
     <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
     <div  id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div id="bodyDiv_setup" class="bodyDiv brdPalette brandPrimaryBrd">
            <table width="100%" cellspacing="0" cellpadding="0" border="0" id="bodyTable" class="outer setupV2">
                <tbody>
                    <tr>
                        <td class="oLeft">
                           <cc1:SetupNavTree2 id="SetupNavTree1" Version="2" runat="server" />
                        </td>
                        <td id="bodyCell" class="oRight">
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                                        <div class="ptBody">
                                            <div class="content">
                                                <img title="" class="pageTitleIcon" alt="" src="/s.gif"><h1 class="pageType">
                                                    我的小组<span class="titleSeparatingColon">:</span></h1>
                                                <h2 class="pageDescription">
                                                    小组成员关系：新建小组</h2>
                                                <div class="blank">
                                                    &nbsp;</div>
                                            </div>
                                            <div class="links">
                                                <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcreating_and_editing_groups.htm%2526section%253DPersonal_Setup%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                                    <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a></div>
                                        </div>
                                        <div class="ptBreadcrumb">
                                        </div>
                                    </div>
                            <form onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }"
                            name="editPage" method="post" id="editPage" action="/setup/own/groupedit.jsp?setupid=Groups">
                            <input type="hidden" value="uVmFKrsvtHY8PbNqoMAhtwUPfyTJQYFX7hHW5R6jwtBYa.OhKSNCkorRa959C6ZC1mkIPbh9xhZTTItsSE9uiijLMTvrP3OG6d1WQSPJrfEiuFFAsCFVAJF5PM92uGgZgg4eP4n706b3C3lIV6QV7HceEKk="
                                id="_CONFIRMATIONTOKEN" name="_CONFIRMATIONTOKEN"><input type="hidden" value="/setup/own/personalgroups.jsp?setupid=Groups&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo"
                                    id="cancelURL" name="cancelURL"><input type="hidden" value="" id="duel0" name="duel0"><input
                                        type="hidden" value="" id="duel1" name="duel1"><input type="hidden" value="005900000038QVZ"
                                            id="own" name="own"><input type="hidden" value="/setup/own/personalgroups.jsp?setupid=Groups&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo"
                                                id="retURL" name="retURL"><input type="hidden" value="/setup/own/groupedit.jsp?retURL=%2Fsetup%2Fown%2Fpersonalgroups.jsp%3Fsetupid%3DGroups%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DPersonalInfo&amp;setupid=Groups&amp;own=005900000038QVZ"
                                                    id="save_new_url" name="save_new_url"><input type="hidden" value="Groups" id="setupid"
                                                        name="setupid"><div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock bLayoutBlock secondaryPalette">
                                                            <div class="pbHeader">
                                                                <table cellspacing="0" cellpadding="0" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="pbTitle">
                                                                                <img width="12" height="1" style="margin-right: 0.25em; margin-right: 0.25em; margin-right: 0.25em;
                                                                                    margin-right: 0.25em;" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                                        小组信息</h2>
                                                                            </td>
                                                                            <td id="topButtonRow" class="pbButton">
                                                                                <input type="submit" name="save" title="保存" class="primary btn" value=" 保存 ">
                                                                                <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 ">
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="pbBody">
                                                                <div style="display: none" id="errorDiv_ep" class="pbError">
                                                                    错误：无效数据。<br>
                                                                    请查看下列所有错误消息以纠正数据。</div>
                                                                <div id="head_1_ep" class="pbSubheader brandTertiaryBgr first tertiaryPalette">
                                                                    <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                                                        <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                                            class="requiredText"> = 必填信息</span></span></span><h3>
                                                                                新建个人小组<span class="titleSeparatingColon">:</span></h3>
                                                                </div>
                                                                <div class="pbSubsection">
                                                                    <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="labelCol requiredInput">
                                                                                    <label for="p2">
                                                                                        <span class="requiredMark">*</span>标签</label>
                                                                                </td>
                                                                                <td class="dataCol col02">
                                                                                    <div class="requiredInput">
                                                                                        <div class="requiredBlock">
                                                                                        </div>
                                                                                        <input type="text" size="20" name="p2" maxlength="40" id="p2"></div>
                                                                                </td>
                                                                                <td class="labelCol empty last">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCol empty last">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="detailRow">
                                                                                <td colspan="4">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="detailRow last">
                                                                                <td colspan="4">
                                                                                    <div id="duel" class="duelingListBox">
                                                                                        <div style="display: none" id="editPage_duel_errorMsg" class="errorMsg">
                                                                                            &nbsp;</div>
                                                                                        <div>
                                                                                            <label for="sharing_search">
                                                                                                搜索：</label>&nbsp;<select title="小组类型" onchange="duel_select_0Var.filter()" name="sharing_search"
                                                                                                    id="sharing_search">
                                                                                                    <option value="P">个人小组</option>
                                                                                                    <option selected="" value="R">公用小组</option>
                                                                                                    <option value="U">用户</option>
                                                                                                    <option value="A">角色</option>
                                                                                                    <option value="D">角色和下属</option>
                                                                                                </select>&nbsp;&nbsp;<label for="searchValue_sharing_search">属于：</label>&nbsp;<input
                                                                                                    type="text" size="20" onpropertychange="duel_select_0Var.handlePropertyChange();"
                                                                                                    onkeydown="return duel_select_0Var.handleKeyDown(event);" name="searchValue_sharing_search"
                                                                                                    maxlength="80" id="searchValue_sharing_search">&nbsp;<input type="button" title="查找"
                                                                                                        onclick="duel_select_0Var.doSearch();" name="go_duel_select_0" id="go_duel_select_0Var"
                                                                                                        class="btn" value=" 查找 "><br>
                                                                                            <div id="error_duel_select_0" class="errorMsg" style="visibility: hidden;">
                                                                                            </div>
                                                                                        </div>
                                                                                        <table class="layout">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td class="selectCell">
                                                                                                        <div class="selectTitle">
                                                                                                            <label for="duel_select_0">
                                                                                                                可用成员</label></div>
                                                                                                        <select size="14" name="duel_select_0" multiple="multiple" id="duel_select_0">
                                                                                                            <option value="R:00G90000001bn4d">小组：销售1组</option>
                                                                                                        </select>
                                                                                                    </td>
                                                                                                    <td class="zen-phs buttonCell">
                                                                                                        <div class="text">
                                                                                                            添加</div>
                                                                                                        <div class="zen-mbs text">
                                                                                                            <a id="duel_select_0_right" href="javascript:if (!document.getElementById('duel_select_0').disabled&& !document.getElementById('duel_select_1').disabled) {duel_select_0Var.beforeMoveRight();;window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');}">
                                                                                                                <img title="添加" class="rightArrowIcon" alt="添加" src="/s.gif"></a></div>
                                                                                                        <div class="text">
                                                                                                            <a id="duel_select_0_left" href="javascript:if (!document.getElementById('duel_select_0').disabled&& !document.getElementById('duel_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');duel_select_0Var.moveLeft();}">
                                                                                                                <img title="删除" class="leftArrowIcon" alt="删除" src="/s.gif"></a></div>
                                                                                                        <div class="duelingText">
                                                                                                            删除</div>
                                                                                                    </td>
                                                                                                    <td class="selectCell">
                                                                                                        <div class="selectTitle">
                                                                                                            <label for="duel_select_1">
                                                                                                                所选成员</label></div>
                                                                                                        <select size="14" name="duel_select_1" multiple="multiple" id="duel_select_1">
                                                                                                            <option value="">--无--</option>
                                                                                                        </select>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                        <script>                                                                                            window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_select_0', 'duel_select_1'], 'editPage_duel_errorMsg');</script>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                            <div class="pbBottomButtons">
                                                                <table cellspacing="0" cellpadding="0" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="pbTitle">
                                                                                <img width="12" height="1" style="margin-right: 0.25em; margin-right: 0.25em; margin-right: 0.25em;
                                                                                    margin-right: 0.25em;" title="" class="minWidth" alt="" src="/s.gif">&nbsp;
                                                                            </td>
                                                                            <td id="bottomButtonRow" class="pbButtonb">
                                                                                <input type="submit" name="save" title="保存" class="primary btn" value=" 保存 ">
                                                                                <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 ">
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="pbFooter secondaryPalette">
                                                                <div class="bg">
                                                                </div>
                                                            </div>
                                                        </div>
                            <script>if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save","cancel"]); }</script>
                            <script type="text/javascript">



                                var duel_select_0Var = new SelectFilterElement("sharing_search", "R", "duel_select_0", "", "duel_select_1", 100, true, null);


                                var existingSelduel_select_0 = document.getElementById('duel_select_1');
                                duel_select_0Var.addOptions(false, [['P', '个人小组：开发一组', 'P:00G90000001bypq', '开发一组', existingSelduel_select_0, ''], ['R', '小组：销售1组', 'R:00G90000001bn4d', '销售1组', existingSelduel_select_0, ''], ['U', '用户：LAN', 'U:005900000038vJx', 'lan', existingSelduel_select_0, ''], ['U', '用户：liu jerryliu', 'U:005900000038QVZ', 'liu jerryliu', existingSelduel_select_0, ''], ['U', '用户：liuyon', 'U:005900000038vJy', 'liuyon', existingSelduel_select_0, ''], ['U', '用户：qin', 'U:005900000038vK0', 'qin', existingSelduel_select_0, ''], ['U', '用户：wang', 'U:005900000038vJz', 'wang', existingSelduel_select_0, ''], ['A', '角色：区域销售', 'A:00G90000001bxw8', '区域销售', existingSelduel_select_0, ''], ['A', '角色：开发工程师', 'A:00G90000001bxwD', '开发工程师', existingSelduel_select_0, ''], ['A', '角色：总经理', 'A:00G90000001bn4O', '总经理', existingSelduel_select_0, ''], ['A', '角色：技术总监', 'A:00G90000001bxvo', '技术总监', existingSelduel_select_0, ''], ['A', '角色：技术经理', 'A:00G90000001bxvt', '技术经理', existingSelduel_select_0, ''], ['A', '角色：董事秘书', 'A:00G90000001bxvj', '董事秘书', existingSelduel_select_0, ''], ['A', '角色：董事长', 'A:00G90000001bxve', '董事长', existingSelduel_select_0, ''], ['A', '角色：销售代表', 'A:00G90000001bxw3', '销售代表', existingSelduel_select_0, ''], ['A', '角色：销售总监', 'A:00G90000001bn4T', '销售总监', existingSelduel_select_0, ''], ['A', '角色：销售经理', 'A:00G90000001bn4Y', '销售经理', existingSelduel_select_0, ''], ['D', '角色和下属：区域销售', 'D:00G90000001bxw9', '区域销售', existingSelduel_select_0, ''], ['D', '角色和下属：开发工程师', 'D:00G90000001bxwE', '开发工程师', existingSelduel_select_0, ''], ['D', '角色和下属：总经理', 'D:00G90000001bn4P', '总经理', existingSelduel_select_0, ''], ['D', '角色和下属：技术总监', 'D:00G90000001bxvp', '技术总监', existingSelduel_select_0, ''], ['D', '角色和下属：技术经理', 'D:00G90000001bxvu', '技术经理', existingSelduel_select_0, ''], ['D', '角色和下属：董事秘书', 'D:00G90000001bxvk', '董事秘书', existingSelduel_select_0, ''], ['D', '角色和下属：董事长', 'D:00G90000001bxvf', '董事长', existingSelduel_select_0, ''], ['D', '角色和下属：销售代表', 'D:00G90000001bxw4', '销售代表', existingSelduel_select_0, ''], ['D', '角色和下属：销售总监', 'D:00G90000001bn4U', '销售总监', existingSelduel_select_0, ''], ['D', '角色和下属：销售经理', 'D:00G90000001bn4Z', '销售经理', existingSelduel_select_0, '']]); if (existingSelduel_select_0.options.length == 0) {
                                    existingSelduel_select_0.options[0] = new Option('--无--', '');
                                }

</script>
                            </form>
                            <!-- Body events -->
                            <script type="text/javascript">function bodyOnLoad(){if ((typeof duel_select_0Var != 'undefined') && (typeof duel_select_0Var.init != 'undefined')) { duel_select_0Var.init();};if (typeof(startSessionTimer)!='undefined') {startSessionTimer(); };if (typeof(ActivityReminder)!='undefined') {ActivityReminder.initialize([], false, false);};SetupTreeNode.prototype.initializeSetup();if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)){sfdcPage.executeOnloadQueue();};; if (this.loadChatFrameJs) loadChatFrameJs();SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");new UnifiedSearchAutoCompleteElement("phSearchInput","/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet",1,{},false,null,"phSearchForm",["div","searchOwner","asPhrase","sen"],{},true,3,100);new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true);if(window.PreferenceBits){window.PreferenceBits.prototype.csrfToken="xWDNiBrPQQazfDq1ClWdQHrZOy9U5Ahi68Tg9Wa.NX0froCBbg4IhDMahHePKGWOH_FYI8Z66Hl9551tRzGctjFHXgSDGza0SGxTWZIRnUlXUHqVSiaqGJsl_e6qZw.HUq1p1n23IhZZh9LTE3tO8OAnUGZZxfb0eP.eKh79QtLpEQMLUuLjdqejoJruhCFC4iDWIw==";};}function bodyOnBeforeUnload(){if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)){sfdcPage.executeOnBeforeUnloadQueue();};}function bodyOnFocus(){closePopupOnBodyFocus();}function bodyOnUnload(){}</script>
                            <!-- End page content -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
         <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>        walkthrough = { log: function () { Sfdc.ClientLogging.addRelay(new Sfdc.ClientLogging.ConsoleLogger(), true); Sfdc.log("Console logging is ON."); } };</script>
    <script>        walkthrough.trials = {};</script>
    <script>        var SFDCSessionVars = { "uid": "005900000038QVZ", "exp": 1412673617000, "host": "login.salesforce.com", "oid": "00D90000000yI4o", "server": "https://login.salesforce.com/login/sessionserver190.html", "act": "u" };</script>
    <script src="/jslibrary/1400606638000/sfdc/Setup.js" defer="true"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1408647202000/sfdc/WalkthroughCorePlatform.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/1408647202000/sfdc/WalkthroughCorePlatform.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1408647202000/sfdc/WalkthroughTrials.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/1408647202000/sfdc/WalkthroughTrials.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1400606638000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/1400606638000/sfdc/SfdcSessionBase190.js"></script>
  
    <div id="walkthrough-quick-import">
        <div>
            <input type="hidden"><div id="auraErrorMessage">
            </div>
            <link type="text/css" rel="stylesheet" href="/l/%7B%22mode%22%3A%22PROD%22%2C%22app%22%3A%22aura%3AintegrationServiceApp%22%2C%22preloads%22%3A%5B%22aura%22%2C%22ui%22%5D%2C%22loaded%22%3A%7B%22APPLICATION%40markup%3A%2F%2Faura%3AintegrationServiceApp%22%3A%22eVSTXyKN5PxZyDf9VF84vQ%22%7D%2C%22lastmod%22%3A%221410464213000%22%2C%22fwuid%22%3A%22pvD_-TGLa0o4QjJud0CEhQ%22%7D/app.css">
            <style></style>
            <script src="/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/moment/moment.js"></script>
            <script src="/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/walltime-js/olson/walltime-data_Asia-Shanghai.js"></script>
            <script src="/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/walltime-js/walltime.js"></script>
            <script src="/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/ckeditor-3.6.6/ckeditor.js"></script>
            <script src="/auraFW/javascript/pvD_-TGLa0o4QjJud0CEhQ/aura_prod.js"></script>
            <script src="/l/%7B%22mode%22%3A%22PROD%22%2C%22app%22%3A%22aura%3AintegrationServiceApp%22%2C%22preloads%22%3A%5B%22aura%22%2C%22ui%22%5D%2C%22loaded%22%3A%7B%22APPLICATION%40markup%3A%2F%2Faura%3AintegrationServiceApp%22%3A%22eVSTXyKN5PxZyDf9VF84vQ%22%7D%2C%22lastmod%22%3A%221410464213000%22%2C%22fwuid%22%3A%22pvD_-TGLa0o4QjJud0CEhQ%22%7D/app.js"></script>
            <script>
                $A.initConfig({ "host": "", "token": "MDd7I2t9etQu_gzL9KkYhr1VTX0W8y68cdZeQp6SWFSrZjf7bW8BCFRA.CVixsmjDFl2BSer2wns5_1ZLI9iZzyhzaBklSMoJ_ukMv5pZWWo2PhbozOnynmy4nQUUwzWTCSkYw==", "context": { "mode": "PROD", "app": "aura:integrationServiceApp", "preloads": ["aura", "ui"], "loaded": { "APPLICATION@markup://aura:integrationServiceApp": "eVSTXyKN5PxZyDf9VF84vQ" }, "lastmod": "1410464213000", "fwuid": "pvD_-TGLa0o4QjJud0CEhQ", "globalValueProviders": [{ "type": "$Browser", "values": { "formFactor": "DESKTOP", "isWindowsPhone": false, "isPhone": false, "S1Features": { "isCustomizeTodayEnabled": false, "isOfflineEnabled": true, "isUitrkLoggingEnabled": true }, "isFIREFOX": true, "isIPad": false, "isAndroid": false, "isTablet": false, "isWEBKIT": false, "containerVersion": "", "isContainer": false, "isIE7": false, "isIE6": false, "isIE9": false, "isIE8": false, "isIPhone": false, "isIOS": false, "isIE10": false} }, { "type": "$Locale", "values": { "userLocaleLang": "zh", "userLocaleCountry": "CN", "language": "zh", "country": "CN", "variant": "", "langLocale": "zh_CN", "dateFormat": "yyyy-M-d", "datetimeFormat": "yyyy-M-d H:mm:ss", "timeFormat": "H:mm:ss", "timezone": "Asia/Shanghai", "timezoneFileName": "Asia-Shanghai", "numberFormat": "#,##0.###", "decimal": ".", "grouping": ",", "zero": "0", "percentFormat": "#,##0%", "currencyFormat": "¤#,##0.00", "currencyCode": "CNY", "currency": "￥"} }, { "type": "$SObjectType", "values": { "CurrentUser": { "Email": "youtter100@163.com", "FirstName": "jerryliu", "Id": "005900000038QVZ"}}}] }, "instance": { "serId": 1, "value": { "componentDef": "markup://aura:integrationServiceApp", "creationPath": "/*[0]"}} }, true, true, true);
    </script>
            <script>var config = {"context":{"mode":"PROD","app":"aura:integrationServiceApp","preloads":["aura","ui"],"loaded":{"COMPONENT@markup://setup:qiAccountsAndContacts":"0HyJWhjaOps047b7w8gS5g","APPLICATION@markup://aura:integrationServiceApp":"eVSTXyKN5PxZyDf9VF84vQ"},"lastmod":"1410464213000","fwuid":"pvD_-TGLa0o4QjJud0CEhQ","globalValueProviders":[{"type":"$Label","values":{"diCsvSelectionActivity":{"linkedIn":"LinkedIn","outlook":"Outlook CSV","gmail":"GMail CSV","act":"ACT! CSV"},"diFileSelector":{"mimeTypeNotAccepted":"不允许选定文件的 MIME 类型。","multipleSelectionDisabled":"不允许选择多个文件。","maximumSizeExceeded":"超过最大文件大小。"},"quickimport":{"confirmationLabel":"您的导入已开始！我们会在完成后发送电子邮件给您。","outlookLabel":"Outlook","uploadLabel":"上载","loadingLabel":"正在加载","connectLabel":"连接","doneLabel":"完成","cancelLabel":"取消","loadingHelpLabel":"您可以在此导入期间正常工作。","dataImporterLabel":"选择其他格式","title":"快速联系人导入","uploadError":"上载错误，请重试。","uploadHelpLabel":"有问题？访问有关从 {0} 导出的帮助教程。","windowTitle":"导入联系人的对话框窗口","chooseFileLabel":"选择文件","noFileSelected":"未选择文件"}}},{"type":"$Browser","values":{"formFactor":"DESKTOP","isWindowsPhone":false,"isPhone":false,"S1Features":{"isCustomizeTodayEnabled":false,"isOfflineEnabled":true,"isUitrkLoggingEnabled":true},"isFIREFOX":true,"isIPad":false,"isAndroid":false,"isTablet":false,"isWEBKIT":false,"containerVersion":"","isContainer":false,"isIE7":false,"isIE6":false,"isIE9":false,"isIE8":false,"isIPhone":false,"isIOS":false,"isIE10":false}},{"type":"$Locale","values":{"userLocaleLang":"zh","userLocaleCountry":"CN","language":"zh","country":"CN","variant":"","langLocale":"zh_CN","dateFormat":"yyyy-M-d","datetimeFormat":"yyyy-M-d H:mm:ss","timeFormat":"H:mm:ss","timezone":"Asia/Shanghai","timezoneFileName":"Asia-Shanghai","numberFormat":"#,##0.###","decimal":".","grouping":",","zero":"0","percentFormat":"#,##0%","currencyFormat":"¤#,##0.00","currencyCode":"CNY","currency":"￥"}},{"type":"$SObjectType","values":{"CurrentUser":{"Email":"youtter100@163.com","FirstName":"jerryliu","Id":"005900000038QVZ"}}}],"componentDefs":[{"serId":1,"value":{"descriptor":"markup://force:message","rendererDef":{"serId":2,"value":{"descriptor":"js://force.message","afterRender":function(cmp, helper) {
        this.superAfterRender();
        
        var theme = cmp.get("v.theme");
        if ("pOne" === theme) {
            
            
            
            var iconElem = document.querySelector(".forceMessage.pOne .icon");
            iconElem.setAttribute("data-icon", "\ue024");
            $A.util.addClass(iconElem, "forceIcon");
        }
    }}},"styleDef":{"serId":3,"value":{"descriptor":"css://force.message","code":".forceMessage{color:#464646;padding:5px;margin:10px;border:1px solid;border-radius:5px;font-size:13px;line-height:18px}.forceMessage h4{font-weight:bold;font-size:16px}.forceMessage .bBody p{margin:0}.forceMessage .bLeft .icon{margin-right:10px}.forceMessage.message{margin:0;border:0}.forceMessage.message .bLeft .icon{display:none}.forceMessage.warning{border-color:#f8e38e;background-color:#ffffdc}.forceMessage.warning.strength_0 .bLeft .icon,.forceMessage.warning.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/warning16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.warning.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/warning24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.warning.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/warning32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.error{border-color:#f2a199;background-color:#fdedea}.forceMessage.error.strength_0 .bLeft .icon,.forceMessage.error.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/error16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.error.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/error24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.error.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/error32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.confirm{border-color:#9bebb3;background-color:#edfff1}.forceMessage.confirm.strength_0 .bLeft .icon,.forceMessage.confirm.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/confirm16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.confirm.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/confirm24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.confirm.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/confirm32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.info{border-color:#bee6ff;background-color:#f5fcff}.forceMessage.info.strength_0 .bLeft .icon,.forceMessage.info.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/info16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.info.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/info24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.info.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/info32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.strength_0{border:none;background-color:transparent}.forceMessage.strength_0 .bLeft .icon{margin-right:5px}.forceMessage.desktopBoxed{border:0;border-radius:3px;margin:0;color:#fff}.forceMessage.desktopBoxed .bBody .summary{font-size:16px;font-weight:bold;margin-bottom:5px}.forceMessage.desktopBoxed .bBody .detail{font-size:14px}.forceMessage.desktopBoxed a{color:#ffffff;text-decoration:underline}.forceMessage.desktopBoxed.error{background-color:#d68184;border-color:#d68184}.forceMessage.desktopBoxed.warning{background-color:#e7bc49;border-color:#e7bc49}.forceMessage.desktopBoxed.info{background-color:#669bd7;border-color:#669bd7}.forceMessage.desktopBoxed.confirm{background-color:#60c170;border-color:#60c170}.forceMessage.desktopBoxed.strength_3{padding:15px 20px}.forceMessage.desktopBoxed.error.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/red-error.png\") no-repeat;width:34px;height:34px}.forceMessage.desktopBoxed.warning.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/yellow-warning.png\") no-repeat;width:39px;height:34px}.forceMessage.desktopBoxed.info.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/blue-info.png\") no-repeat;width:34px;height:34px}.forceMessage.desktopBoxed.confirm.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/green-check.png\") no-repeat;width:34px;height:34px}.forceMessage.desktopBoxed.strength_3 .bLeft .icon{margin-right:20px}.forceMessage.desktop{background-color:transparent;border:0;color:#292929}.forceMessage.desktop a{color:#1b6cc8;text-decoration:none}.forceMessage.desktop.error.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/error_red.png\") no-repeat}.forceMessage.desktop.warning.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/warning_yellow.png\") no-repeat;width:34px;height:34px}.forceMessage.pOne.error.strength_3 .bLeft .icon{background:none;width:24px;height:24px;content:\"\";margin-right:14px;font-size:24px;color:#be554b;line-height:38px}.forceMessage.pOne.error.strength_3 .bBody .summary{padding-bottom:7px}.forceMessage.pOne.error.strength_3 .bBody .summary,.forceMessage.pOne.error.strength_3 .bBody .detail{line-height:1em}.forceMessage.pOne .summary{font-size:15px;padding-bottom:14px;font-family:'ProximaNovaSoft-Semibold';color:#3c3d3e}.forceMessage.pOne .detail{font-size:15px;color:#3c3d3e}.forceMessage.pOne.error{margin:0;padding:14px;border:none;background:#e8eaeb;border-bottom:1px solid #cfd4d9}","className":"forceMessage"}},"controllerDef":{"serId":4,"value":{"descriptor":"compound://ui.message","actionDefs":[{"serId":5,"value":{"descriptor":"js://ui.message/ACTION$press","name":"press","code":function(cmp) {
        var theMessage = cmp.getElement();
        $A.util.addClass(theMessage,"hide");
    },"actionType":"CLIENT"}}]}},"superDef":{"serId":6,"value":"markup://ui:message"},"attributeDefs":[{"serId":7,"value":{"descriptor":"body","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":8,"value":{"descriptor":"class","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":9,"value":{"descriptor":"dir","typeDefDescriptor":"aura://String","defaultValue":{"descriptor":"dir","value":"ltr"},"required":false,"visibility":"PUBLIC"}},{"serId":10,"value":{"descriptor":"label","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":11,"value":{"descriptor":"namespaceOverride","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":12,"value":{"descriptor":"actionable","typeDefDescriptor":"aura://Boolean","defaultValue":{"descriptor":"actionable","value":true},"required":false,"visibility":"PUBLIC"}},{"serId":13,"value":{"descriptor":"role","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":14,"value":{"descriptor":"ariaDescribedby","typeDefDescriptor":"aura://String","defaultValue":{"descriptor":"ariaDescribedby","value":""},"required":false,"visibility":"PUBLIC"}},{"serId":15,"value":{"descriptor":"value","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}},{"serId":16,"value":{"descriptor":"visible","typeDefDescriptor":"aura://Boolean","defaultValue":{"descriptor":"visible","value":true},"required":false,"visibility":"PUBLIC"}},{"serId":17,"value":{"descriptor":"title","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":18,"value":{"descriptor":"severity","typeDefDescriptor":"aura://String","required":true,"visibility":"PUBLIC"}},{"serId":19,"value":{"descriptor":"closable","typeDefDescriptor":"aura://Boolean","defaultValue":{"descriptor":"closable","value":false},"required":false,"visibility":"PUBLIC"}},{"serId":20,"value":{"descriptor":"strength","typeDefDescriptor":"aura://Integer","defaultValue":{"descriptor":"strength","value":1},"required":false,"visibility":"PUBLIC"}},{"serId":21,"value":{"descriptor":"summary","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":22,"value":{"descriptor":"detail","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":23,"value":{"descriptor":"theme","typeDefDescriptor":"aura://String","defaultValue":{"descriptor":"theme","value":""},"required":false,"visibility":"PUBLIC"}}],"registerEventDefs":[{"serId":24,"value":{"eventDef":{"serId":25,"value":{"descriptor":"markup://ui:mouseup","type":"COMPONENT","superDef":{"serId":26,"value":{"descriptor":"markup://ui:baseMouseEvent","type":"COMPONENT","superDef":{"serId":27,"value":{"descriptor":"markup://ui:baseDOMEvent","type":"COMPONENT","superDef":{"serId":28,"value":{"descriptor":"markup://aura:componentEvent","type":"COMPONENT","attributes":{}}},"attributes":{"domEvent":{"serId":29,"value":{"descriptor":"domEvent","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}}}}},"attributes":{"domEvent":{"serRefId":29},"button":{"serId":30,"value":{"descriptor":"button","typeDefDescriptor":"aura://Integer","required":false,"visibility":"PUBLIC"}}}}},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mouseup","isGlobal":true}},{"serId":31,"value":{"eventDef":{"serId":32,"value":{"descriptor":"markup://ui:mousedown","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mousedown","isGlobal":true}},{"serId":33,"value":{"eventDef":{"serId":34,"value":{"descriptor":"markup://ui:mousemove","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mousemove","isGlobal":true}},{"serId":35,"value":{"eventDef":{"serId":36,"value":{"descriptor":"markup://ui:dblclick","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"dblclick","isGlobal":true}},{"serId":37,"value":{"eventDef":{"serId":38,"value":{"descriptor":"markup://ui:mouseout","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mouseout","isGlobal":true}},{"serId":39,"value":{"eventDef":{"serId":40,"value":{"descriptor":"markup://ui:click","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"click","isGlobal":true}},{"serId":41,"value":{"eventDef":{"serId":42,"value":{"descriptor":"markup://ui:mouseover","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mouseover","isGlobal":true}}],"facets":[{"descriptor":"class","value":{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":["strength_",{"exprType":"PROPERTY","path":["v","strength"]}]}," "]},{"exprType":"PROPERTY","path":["v","theme"]}]}," "]},{"exprType":"PROPERTY","path":["v","class"]}]}},{"descriptor":"body","value":[{"componentDef":{"serId":43,"value":"markup://aura:renderIf"},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","body","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serId":44,"value":"markup://aura:html"},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":45,"value":"markup://aura:expression"},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","body"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"body"}},"tag":{"descriptor":"tag","value":"p"}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","summary","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","summary"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"summary"}},"tag":{"descriptor":"tag","value":"p"}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","detail","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","detail"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"detail"}},"tag":{"descriptor":"tag","value":"p"}}}}]}}}}]}]}},{"serId":46,"value":{"descriptor":"markup://setup:diInputFile","controllerDef":{"serId":47,"value":{"descriptor":"compound://setup.diInputFile","actionDefs":[{"serId":48,"value":{"descriptor":"js://setup.diInputFile/ACTION$change","name":"change","code":function(cmp, event, helper) {
	    var button = cmp.find('browse-button');
	    if (button) {
		    var buttonFiles = button.getElement().files;
			var attrs = cmp.getAttributes();
			var files = [];
			var errors = [];

			
			if (buttonFiles) {
	        	for (var i = 0; i < buttonFiles.length; i++) {
	    			var file = buttonFiles[i];
        			var accept = attrs.getValue('accept').getValue();
    		        if (accept && file.type && file.type.length &gt; 0 && accept.indexOf(file.type) < 0) {
    		        	errors[errors.length] = { 'fileName' : file.name, 'message': 'mimeTypeNotAccepted' };
    		        	continue;
    		        }
        			var maxFileSizeBytes = attrs.getValue('maxFileSizeBytes').getValue();
    		        if (maxFileSizeBytes && file.size && file.size &gt; maxFileSizeBytes) {
    		        	errors[errors.length] = { 'fileName' : file.name, 'message': 'maximumSizeExceeded' };
    		        	continue;    		        
    		        }
            		files[files.length] = file;	        		
	        	}
    			var multiple = attrs.getValue('multiple').getValue();
	        	if (!multiple && buttonFiles.length &gt; 1) {
		        	errors[errors.length] = { 'message': 'multipleSelectionDisabled' };
	        	}
			}

			if (errors.length &gt; 0) {
		        var compEvent = cmp.getEvent('fileRejected');
		        compEvent.setParams({ 
		        	'errors': errors
		        });
		        compEvent.fire();
			}
			else if (files.length &gt; 0) {
				var details = [];
				for (var i = 0; i < files.length; i++) {
					details[details.length] = {
						'fileName' : files[i].name,
						'fileType' : files[i].type,
						'fileSize' : files[i].size
					};
				}

		        var compEvent = cmp.getEvent('fileSelected');
		        compEvent.setParams({ 
		        	'files': files,
		        	'fileDetails': details,
		        	'fileName': files[0].name,
		        	'fileType': files[0].type,
		        	'fileSize': files[0].size,
					'form': null
		        });
		        compEvent.fire();
			}
			else {
				
		        var compEvent = cmp.getEvent('fileSelected');
		        compEvent.setParams({ 
		        	'files': files,
		        	'fileDetails': {},
		        	'fileName': null,
		        	'fileType': null,
		        	'fileSize': null,
					'form': cmp.find('upload-form')
		        });
		        compEvent.fire();
			}
	    }
    },"actionType":"CLIENT"}}]}},"superDef":{"serId":49,"value":"markup://aura:component"},"attributeDefs":[{"serRefId":7},{"serId":50,"value":{"descriptor":"accept","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":51,"value":{"descriptor":"maxFileSizeBytes","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},{"serId":52,"value":{"descriptor":"multiple","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}},{"serId":53,"value":{"descriptor":"class","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":54,"value":{"descriptor":"disabled","typeDefDescriptor":"apex://boolean","defaultValue":{"descriptor":"disabled","value":false},"required":false,"visibility":"PUBLIC"}},{"serId":55,"value":{"descriptor":"name","typeDefDescriptor":"apex://string","defaultValue":{"descriptor":"name","value":"file"},"required":false,"visibility":"PUBLIC"}},{"serId":56,"value":{"descriptor":"size","typeDefDescriptor":"apex://integer","defaultValue":{"descriptor":"size","value":30},"required":false,"visibility":"PUBLIC"}}],"interfaces":["markup://setup:diFileSelector"],"registerEventDefs":[{"serId":57,"value":{"eventDef":{"serId":58,"value":{"descriptor":"markup://setup:diFileSelected","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"files":{"serId":59,"value":{"descriptor":"files","typeDefDescriptor":"apex://object","required":false,"visibility":"PUBLIC"}},"fileDetails":{"serId":60,"value":{"descriptor":"fileDetails","typeDefDescriptor":"aura://List","required":false,"serializeTo":"NONE","visibility":"PUBLIC"}},"fileName":{"serId":61,"value":{"descriptor":"fileName","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileType":{"serId":62,"value":{"descriptor":"fileType","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileSize":{"serId":63,"value":{"descriptor":"fileSize","typeDefDescriptor":"apex://long","required":false,"visibility":"PUBLIC"}},"form":{"serId":64,"value":{"descriptor":"form","typeDefDescriptor":"aura://Aura.Component","required":false,"visibility":"PUBLIC"}}}}},"attributeName":"fileSelected","isGlobal":false}},{"serId":65,"value":{"eventDef":{"serId":66,"value":{"descriptor":"markup://setup:diFileRejected","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"errors":{"serId":67,"value":{"descriptor":"errors","typeDefDescriptor":"aura://List","required":false,"serializeTo":"NONE","visibility":"PUBLIC"}}}}},"attributeName":"fileRejected","isGlobal":false}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"localId":"upload-form","attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"localId":"browse-button","attributes":{"values":{"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":{"exprType":"PROPERTY","path":["v","class"]},"accept":{"exprType":"PROPERTY","path":["v","accept"]},"disabled":{"exprType":"PROPERTY","path":["v","disabled"]},"name":{"exprType":"PROPERTY","path":["v","name"]},"multiple":{"exprType":"FUNCTION","key":"if","args":[{"exprType":"PROPERTY","path":["v","multiple"]},"multiple",null]},"onchange":{"exprType":"PROPERTY","path":["c","change"]},"type":"file","size":{"exprType":"PROPERTY","path":["v","size"]}}},"tag":{"descriptor":"tag","value":"input"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"encoding":"multipart/form-data","enctype":"multipart/form-data","action":"","method":"post"}},"tag":{"descriptor":"tag","value":"form"}}}}]}]}},{"serId":68,"value":{"descriptor":"markup://setup:diInvisibleFileUploader","helperDef":{"serId":69,"value":{"descriptor":"js://setup.diInvisibleFileUploader","functions":{"uploadAbort":function(cmp, e) { 
        var compEvent = cmp.getEvent('uploadCompleted');
        compEvent.setParams({ 'responseText' : e.target.responseText,
            				  'status' : e.target.status,
        	                  'successful' : false, 
        	                  'aborted' : true });
        compEvent.fire();
	},"getFormData":function(cmp) {
		if (!this.supportFileApi()) {
			return null;
		}
		var attrs = cmp.getAttributes();

		var files = attrs.getValue('files').getValue();
		var names = [];
		for (var i = 0; i < files.length; ++i) {
			names[i] = attrs.getValue('names').getRawValue(i);
		}

		var formData = new FormData();
		for (var i = 0; i < files.length; i++) {
			formData.append(names[i], files[i]);
		}

		return formData;
	},"uploadError":function(cmp, e) { 
        var compEvent = cmp.getEvent('uploadCompleted');
        compEvent.setParams({ 'responseText' : e.target.responseText, 
        	                  'status' : e.target.status,
        	                  'successful' : false, 
        	                  'aborted' : false });
        compEvent.fire();
	},"uploadFinish":function(cmp, e) { 
		var status = e.target.status;
		var successful = status &gt;= 200 && status < 300 || status===1223;

        var compEvent = cmp.getEvent('uploadCompleted');
        compEvent.setParams({ 'responseText' : e.target.responseText, 
            				  'status' : status,
        	                  'successful' : successful,
        	                  'aborted' : false });
        compEvent.fire();
	},"supportFileApi":function() {
		return window.File && window.FileList && window.FileReader;
	},"uploadProgress":function(cmp, e) { 
	    if (e.lengthComputable) {
	        var percentComplete = Math.round(e.loaded * 100 / e.total);	 
	        if (percentComplete < 100) {
		        var compEvent = cmp.getEvent('uploadProgress');
		        compEvent.setParams({ 'bytesUploaded' : e.loaded,      
		        	                  'bytesTotal' : e.total,
		        	                  'percentComplete' : percentComplete });
		        compEvent.fire();
	        }	        
	    }
	},"createHiddenIFrame":function(id) {
		var frame = null;
		if ($A.get('$Browser.isIE7') === true) {
			
			
			frame = document.createElement('<iframe name="' + id + '"/&gt;');
		}
		else {
			frame = document.createElement("IFRAME");
			frame.setAttribute("name", id);
		}
		frame.setAttribute("id", id);
		frame.setAttribute("style", "display: none;");

		return frame;
	},"onUploadComplete":function(cmp, event, frame) {
		var successful = false;
		var responseText;
				
		try {
			var doc = frame.contentWindow.document || frame.contentDocument || frame.docmument || window.frames[frame.id].document;
			if (doc) {
				var firstChild = doc.body && doc.body.firstChild;
				if(firstChild && /pre/i.test(firstChild.tagName)) {
					responseText = firstChild.textContent;
				}
				else {
					responseText = doc.body.innerHTML;
				}

				successful = true;
			}
		}
		catch(e) {
			responseText = '{"errMsg":"'+ e.message + '"}';
		}

		var compEvent = cmp.getEvent('uploadCompleted');
		compEvent.setParams({
			'responseText' : responseText,
			'status' : 200,
			'successful' : successful,
			'aborted' : false
		});
		compEvent.fire();
	},"createHiddenInputs":function(params) {
		var fragment = document.createDocumentFragment();

		if (!params) {
			return fragment;
		}

		for(var name in params) {
			var input = document.createElement("INPUT");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", name);
			input.setAttribute("value", params[name]);

			fragment.appendChild(input);
		}

		return fragment;
	}}}},"controllerDef":{"serId":70,"value":{"descriptor":"compound://setup.diInvisibleFileUploader","actionDefs":[{"serId":71,"value":{"descriptor":"js://setup.diInvisibleFileUploader/ACTION$upload","name":"upload","code":function(cmp, event, helper) {
		var attrs = cmp.getAttributes();
		var url = attrs.getValue('url').getValue();

		if (helper.supportFileApi()) {
			var formData = helper.getFormData(cmp);

			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener('progress', function(e) { helper.uploadProgress(cmp, e); }, false);
			xhr.addEventListener('load', function(e) { helper.uploadFinish(cmp, e); }, false);
			xhr.addEventListener('error', function(e) { helper.uploadError(cmp, e); }, false);
			xhr.addEventListener('abort', function(e) { helper.uploadAbort(cmp, e); }, false);
			xhr.open('POST', url);
			xhr.send(formData);
		}
		else {
			var formCmp = attrs.getValue("form").getValue();
			var id = formCmp.getGlobalId();
			var form = formCmp.getElement();
			
			var iframe = helper.createHiddenIFrame(id);
			document.body.appendChild(iframe);


			var onLoad = function(e) {
				helper.onUploadComplete(cmp, e, iframe);

				
				setTimeout(function() {
					$A.util.removeOn(iframe, "load", onLoad);
					iframe.parentNode.removeChild(iframe);
				}, 10);
			};
			$A.util.on(iframe, "load", onLoad);
			
			form.setAttribute("target", id);
			form.setAttribute("action", url);
			
			
			var additionalParams = {
				"isIFrame": "true"
			};
			form.appendChild(helper.createHiddenInputs(additionalParams));

			form.submit();
		}
	},"actionType":"CLIENT"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7},{"serId":72,"value":{"descriptor":"files","typeDefDescriptor":"apex://object","required":false,"visibility":"PUBLIC"}},{"serId":73,"value":{"descriptor":"names","typeDefDescriptor":"apex://string[]","required":false,"visibility":"PUBLIC"}},{"serId":74,"value":{"descriptor":"url","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":75,"value":{"descriptor":"form","typeDefDescriptor":"aura://Aura.Component","required":false,"visibility":"PUBLIC"}},{"serId":76,"value":{"descriptor":"upload","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}}],"interfaces":["markup://setup:diFileUploader"],"registerEventDefs":[{"serId":77,"value":{"eventDef":{"serId":78,"value":{"descriptor":"markup://setup:diFileUploadProgress","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"bytesUploaded":{"serId":79,"value":{"descriptor":"bytesUploaded","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},"bytesTotal":{"serId":80,"value":{"descriptor":"bytesTotal","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},"percentComplete":{"serId":81,"value":{"descriptor":"percentComplete","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}}}}},"attributeName":"uploadProgress","isGlobal":false}},{"serId":82,"value":{"eventDef":{"serId":83,"value":{"descriptor":"markup://setup:diFileUploadCompleted","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"responseText":{"serId":84,"value":{"descriptor":"responseText","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"status":{"serId":85,"value":{"descriptor":"status","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},"successful":{"serId":86,"value":{"descriptor":"successful","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}},"aborted":{"serId":87,"value":{"descriptor":"aborted","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}}}}},"attributeName":"uploadCompleted","isGlobal":false}}],"handlerDefs":[{"serId":88,"value":{"action":{"exprType":"PROPERTY","path":["c","upload"]},"value":{"exprType":"PROPERTY","path":["v","upload"]},"name":"change"}}]}},{"serId":89,"value":{"descriptor":"markup://setup:qiAccountsAndContacts","helperDef":{"serId":90,"value":{"descriptor":"js://setup.qiAccountsAndContacts","functions":{"initiateUpload":function(uploadCmp, params) {
		var files = params.files;
		var names = [];
		for (var i = 0; i < files.length; i++) {
			names[names.length] = 'file'; 
		}

		var attrs = uploadCmp.getAttributes();
		attrs.setValue('files', files);
		attrs.setValue('form', params.form);
		attrs.setValue('names', names);
		attrs.setValue('url', params.url);
		attrs.setValue('upload', true);
	},"getDataSource":function(cmp) {
        var source = cmp.getValue('v.source').getValue();
        var sourceLabels = {
            outlook: "{!$Label.diCsvSelectionActivity.outlook}",
            gmail: "{!$Label.diCsvSelectionActivity.gmail}",
            linkedIn: "{!$Label.diCsvSelectionActivity.linkedIn}",
            act: "{!$Label.diCsvSelectionActivity.act}"
        };

        return $A.expressionService.getValue(cmp, sourceLabels[source]).getValue();
    },"showSuccess":function(cmp) {
		var message = $A.expressionService.getValue(cmp, '{!$Label.quickimport.confirmationLabel}').getValue();
		cmp.getAttributes().getValue('message').setValue(message);
		cmp.find('message').setValue("v.severity", 'confirm');
	},"setLoadingViewState":function(cmp) {
		this.setViewState(cmp, 'loading');
	},"setSelectedViewState":function(cmp) {
		this.setViewState(cmp, 'selected');
	},"setViewState":function(cmp, viewState) {
		var source = cmp.getValue('v.source').getValue();
		var list = cmp.find('dataSourceList');
		var sourceCmp = list.find(this.localIdBySource[source]);

		sourceCmp.getSuper().getValue('v.viewState').setValue(viewState);
	},"initiateGmailImport":function(cmp, params) {
		var action = cmp.get('c.importGmailContacts');
		action.setAbortable();
		action.setParams(params);
		action.setCallback(cmp, this.onImportCallback(cmp));

		return action;
	},"collapseDataSources":function(cmp, matcherFn) {
        if(!matcherFn) {
            return;
        }
        var list = cmp.find('dataSourceList');
        var sourceCmp;

        
        for(var source in this.localIdBySource) {
            sourceCmp = list.find(this.localIdBySource[source]);
            if(sourceCmp && matcherFn(sourceCmp)){
                var action = sourceCmp.get('c.collapse');
                if(action) {
                    action.run();
                }
            }
        }
    },"onImportCallback":function(cmp) {
		var helper = this;

		return function(action) {
			if (action.getState() === 'ERROR') {
				helper.showError(cmp, action.getError()[0].message);
				helper.setSelectedViewState(cmp);
			}
			else {
				helper.showSuccess(cmp);
				helper.setDoneViewState(cmp);
			}
		};
	},"setInitialViewState":function(cmp) {
		this.setViewState(cmp, 'initial');
	},"setDoneViewState":function(cmp) {
		this.setViewState(cmp, 'done');
	},"showError":function(cmp, message) {
		cmp.getAttributes().getValue('message').setValue(message);
		cmp.find('message').setValue("v.severity", 'error');
	},"initiateCsvImport":function(cmp, encoding) {
		var action = cmp.get('c.initiateCsvImport');
		action.setAbortable();
		action.setParams({
			'encoding' : encoding,
			'dataSource' : this.getDataSource(cmp)
		});
		action.setCallback(cmp, this.onImportCallback(cmp));

		return action;
	},"localIdBySource":{"linkedIn":"linkedIn","outlook":"outlook","gmail":"gmail","act":"act"}}}},"styleDef":{"serId":91,"value":{"descriptor":"css://setup.qiAccountsAndContacts","code":".setupQiAccountsAndContacts{padding:20px;font-family:'Helvetica Neue',Helvetica,Arial}.setupQiAccountsAndContacts.mask.fadeIn{background:#ffffff;-ms-filter:alpha(opacity=60);filter:alpha(opacity=60);opacity:.6}.setupQiAccountsAndContacts.uiDialog.dialog.default{color:#3a4c5c;background:#f4f5f6;border:1px solid #d8d9d9;border-radius:3px;box-shadow:5px 5px 5px rgba(0,0,0,.16)}.setupQiAccountsAndContacts.uiDialog.modal{top:15%}.setupQiAccountsAndContacts.dialog.default .title{color:#3a4c5c;display:block;text-align:center;font-size:1.7em;font-weight:normal}.setupQiAccountsAndContacts.dialog.default .content{border:none;box-shadow:none;background-color:inherit;padding:0}.setupQiAccountsAndContacts.uiDialog .uiMessage{position:relative}.setupQiAccountsAndContacts.uiDialog .buttons{text-align:right}.setupQiAccountsAndContacts.uiDialog .buttons .uiButton{margin-left:8px;border:1px solid #c5c6c8;color:#757575;padding:4px 10px;font-size:1.367em;background:#eeeff0;box-shadow:none;text-shadow:none;font-weight:normal}.setupQiAccountsAndContacts.uiDialog .buttons .uiButton{border-radius:1px;box-shadow:1px 1px 1px rgba(0, 0, 0, .16);padding:4px 20px}.setupQiAccountsAndContacts.uiDialog .buttons .uiButton .label{color:#333}.setupQiAccountsAndContacts.uiDialog .buttons a{vertical-align:middle;padding:4px 10px;margin:4px 3px;display:inline-block;color:#1b75af;text-decoration:none;font-size:1.2em}.setupQiAccountsAndContacts.uiDialog .buttons a:hover{color:#1b75af;text-decoration:none}.setupQiAccountsAndContacts.uiDialog .close,.setupQiAccountsAndContacts.uiDialog .close:hover,.setupQiAccountsAndContacts.uiDialog .close:focus{background:url(/img/import/close.png) no-repeat center center;border-radius:1px;border:none;width:17px;height:17px}","className":"setupQiAccountsAndContacts"}},"controllerDef":{"serId":92,"value":{"descriptor":"compound://setup.qiAccountsAndContacts","actionDefs":[{"serId":93,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp, event, helper) {
        var params = event.getParams();

        
        if(params.viewState !== "selected") {
            return;
        }

        helper.collapseDataSources(cmp, function(sourceCmp) {
            return sourceCmp.get("v.source") !== params.source;
        });
    },"actionType":"CLIENT"}},{"serId":94,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$openDataImporter","name":"openDataImporter","code":function(cmp) {
		window.location = cmp.get('m.dataImporterAppLocation');
	},"actionType":"CLIENT"}},{"serId":95,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$uploadProgress","name":"uploadProgress","code":function(cmp, event) {

	},"actionType":"CLIENT"}},{"serId":96,"value":{"name":"initiateCsvImport","descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.AccountAndContactController/ACTION$initiateCsvImport","actionType":"SERVER","returnType":"java://java.lang.String","background":false,"caboose":false,"params":[{"serId":97,"value":{"name":"dataSource","type":"java://java.lang.String"}},{"serId":98,"value":{"name":"encoding","type":"java://java.lang.String"}}]}},{"serId":99,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$initiateGmailImport","name":"initiateGmailImport","code":function(cmp, event, helper) {
		cmp.getAttributes().setValue('source', 'gmail');

		this.runAfter(helper.initiateGmailImport(cmp, {
			code: event.getParam('code'),
			state: event.getParam('state'),
			csrfToken: event.getParam('csrfToken')
		}));

		helper.setLoadingViewState(cmp);
	},"actionType":"CLIENT"}},{"serId":100,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$fileSelected","name":"fileSelected","code":function(cmp, event, helper) {
		cmp.getAttributes().setValue('source', event.getParam('source'));

		var uploader = cmp.find('uploader');
		helper.initiateUpload(uploader, {
			files: event.getParam('files'),
			form: event.getParam('form'),
			url: cmp.get("m.uploadServletUrl")
		});

		helper.setLoadingViewState(cmp);
	},"actionType":"CLIENT"}},{"serId":101,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$uploadCompleted","name":"uploadCompleted","code":function(cmp, event, helper) {
		var successful = event.getParam('successful');
		var responseText = event.getParam('responseText');

        var response;
        try {
            response = Sfdc.JSON.parseWithCSRF(responseText);
        }
        catch(e){
            Sfdc.log("Invalid response for file upload. " + e);

            
            if (/ec=302/i.test(responseText)) {
                Sfdc.Url.navigateTo(window.location.href);
                return;
            }
        }

		if (successful && !("errMsg" in response)) {
			this.runAfter(helper.initiateCsvImport(cmp, response.encoding));
		}
		else {
			var uploadError = $A.expressionService.getValue(cmp, '{!$Label.quickimport.uploadError}').getValue();
			helper.showError(cmp, response && response.errMsg || uploadError);

			helper.setSelectedViewState(cmp);
		}

	},"actionType":"CLIENT"}},{"serId":102,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$triggerOpenDialog","name":"triggerOpenDialog","code":function(cmp, event) {
		var open = $A.get("e.ui:openDialog");
		var domEvent = event.getParam("triggerEvent");

		open.setParams({
			dialog : cmp.find("overlay"),
			triggerEvent: domEvent
		});
		open.fire();
	},"actionType":"CLIENT"}},{"serId":103,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$openDialog","name":"openDialog","code":function(cmp, event, helper) {
		
        cmp.setValue("v.message", null);
        helper.collapseDataSources(cmp, function(){
            return true;
        });
	},"actionType":"CLIENT"}},{"serId":104,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$close","name":"close","code":function(cmp, event, helper) {
		var closeEvent = $A.get("e.ui:closeDialog");

		closeEvent.setParams({
			dialog : cmp.find("overlay"),
			confirmClicked : true
		});
		closeEvent.fire();
	},"actionType":"CLIENT"}},{"serId":105,"value":{"name":"importGmailContacts","descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.AccountAndContactController/ACTION$importGmailContacts","actionType":"SERVER","returnType":"java://java.lang.String","background":false,"caboose":false,"params":[{"serId":106,"value":{"name":"code","type":"java://java.lang.String"}},{"serId":107,"value":{"name":"state","type":"java://java.lang.String"}},{"serId":108,"value":{"name":"csrfToken","type":"java://java.lang.String"}}]}}]}},"modelDef":{"serId":109,"value":{"descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.AccountAndContactModel","members":[{"serId":110,"value":{"name":"dataImporterAppLocation","type":"java://java.lang.String"}},{"serId":111,"value":{"name":"uploadServletUrl","type":"java://java.lang.String"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7},{"serId":112,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":113,"value":{"descriptor":"message","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}}],"handlerDefs":[{"serId":114,"value":{"eventDef":{"serId":115,"value":{"descriptor":"markup://setup:qiOpenImportDialog","type":"APPLICATION","superDef":{"serId":116,"value":{"descriptor":"markup://aura:applicationEvent","type":"APPLICATION","attributes":{}}},"attributes":{"triggerEvent":{"serId":117,"value":{"descriptor":"triggerEvent","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}}}}},"action":{"exprType":"PROPERTY","path":["c","triggerOpenDialog"]}}},{"serId":118,"value":{"eventDef":{"serId":119,"value":{"descriptor":"markup://setup:qiImportGmailContacts","type":"APPLICATION","superDef":{"serRefId":116},"attributes":{"code":{"serId":120,"value":{"descriptor":"code","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},"state":{"serId":121,"value":{"descriptor":"state","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},"csrfToken":{"serId":122,"value":{"descriptor":"csrfToken","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}}}}},"action":{"exprType":"PROPERTY","path":["c","initiateGmailImport"]}}},{"serId":123,"value":{"eventDef":{"serId":124,"value":{"descriptor":"markup://ui:openDialog","type":"APPLICATION","superDef":{"serRefId":116},"attributes":{"dialog":{"serId":125,"value":{"descriptor":"dialog","typeDefDescriptor":"aura://Aura.Component","required":false,"visibility":"PUBLIC"}},"triggerEvent":{"serId":126,"value":{"descriptor":"triggerEvent","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}}}}},"action":{"exprType":"PROPERTY","path":["c","openDialog"]}}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serId":127,"value":"markup://ui:dialogManager"}},{"componentDef":{"serId":128,"value":"markup://ui:dialog"},"localId":"overlay","attributes":{"values":{"closeLabel":{"descriptor":"closeLabel","value":""},"description":{"descriptor":"description","value":{"exprType":"PROPERTY","path":["$Label","quickimport","windowTitle"]}},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","title"]}},"isModal":{"descriptor":"isModal","value":true},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"ne","args":[{"exprType":"PROPERTY","path":["v","message"]},null]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":1},"localId":"message","attributes":{"values":{"title":{"descriptor":"title","value":""},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","message"]}}}}}]},"strength":{"descriptor":"strength","value":1},"severity":{"descriptor":"severity","value":"info"}}}}]}}}},{"componentDef":{"serId":129,"value":{"descriptor":"markup://setup:qiDatasourceSelectorList","styleDef":{"serId":130,"value":{"descriptor":"css://setup.qiDatasourceSelectorList","code":".setupQiDatasourceSelectorList{border:solid 1px #d8d9d9;border-radius:3px;background-color:#fff}.setupQiDatasourceSelectorList.list{margin:20px 0;list-style:none;padding:0}.setupQiDatasourceSelectorList.list li{margin:0}.setupQiDatasourceSelectorList.list li.odd{border-top:solid 1px #d8d9d9;border-bottom:solid 1px #d8d9d9}.setupQiDatasourceSelectorList .source{position:relative;padding:25px 20px}.setupQiDatasourceSelectorList .source .label{font-weight:bold;font-size:1.33em;padding-left:50px;float:left;line-height:30px}.setupQiDatasourceSelectorList .source .detail{text-align:right;display:block}.setupQiDatasourceSelectorList .source a,.setupQiDatasourceSelectorList .source a:hover{text-decoration:none}.setupQiDatasourceSelectorList .source a.upload{color:#1b75af;font-weight:bold;font-size:1.33em;line-height:30px}.setupQiDatasourceSelectorList .outlook .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -10px}.setupQiDatasourceSelectorList .gmail .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -60px}.setupQiDatasourceSelectorList .linkedIn .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -110px}.setupQiDatasourceSelectorList .act .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -160px}.setupQiDatasourceSelectorList .source .loading{padding:0 0 0 24px;border:none;font-weight:normal;font-size:1.33em;background:url('/setup/dataimporter/barloading.gif') left center no-repeat}.setupQiDatasourceSelectorList .source .help{color:#929ba3;display:block}","className":"setupQiDatasourceSelectorList"}},"controllerDef":{"serId":131,"value":{"descriptor":"compound://setup.qiDatasourceSelectorList","actionDefs":[{"serId":132,"value":{"descriptor":"js://setup.qiDatasourceSelectorList/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp, event) {
        var compEvent = cmp.getEvent('viewStateChanged');
        compEvent.setParams(event.getParams());
        compEvent.fire();
    },"actionType":"CLIENT"}},{"serId":133,"value":{"descriptor":"js://setup.qiDatasourceSelectorList/ACTION$fileSelected","name":"fileSelected","code":function(cmp, event, helper) {
		cmp.getAttributes().getValue('message').setValue(null);

		var compEvent = cmp.getEvent('fileSelected');
		compEvent.setParams({
			'files': event.getParam('files'),
			'fileDetails': event.getParam('fileDetails'),
			'fileName': event.getParam('fileName'),
			'fileType': event.getParam('fileType'),
			'fileSize': event.getParam('fileSize'),
			'source': event.getParam('source'),
			'form': event.getParam('form')
		});
		compEvent.fire();
	},"actionType":"CLIENT"}},{"serId":134,"value":{"descriptor":"js://setup.qiDatasourceSelectorList/ACTION$fileRejected","name":"fileRejected","code":function(cmp, event, helper) {

	},"actionType":"CLIENT"}}]}},"modelDef":{"serId":135,"value":{"descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.DatasourceSelectionModel","members":[{"serId":136,"value":{"name":"actHelpUrl","type":"java://java.lang.String"}},{"serId":137,"value":{"name":"linkedInHelpUrl","type":"java://java.lang.String"}},{"serId":138,"value":{"name":"outlookHelpUrl","type":"java://java.lang.String"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7}],"registerEventDefs":[{"serId":139,"value":{"eventDef":{"serId":140,"value":{"descriptor":"markup://setup:qiDataSourceViewStateChanged","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"source":{"serId":141,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}},"viewState":{"serId":142,"value":{"descriptor":"viewState","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}}}}},"attributeName":"viewStateChanged","isGlobal":false}},{"serId":143,"value":{"eventDef":{"serId":144,"value":{"descriptor":"markup://setup:diCsvFileSelected","type":"COMPONENT","superDef":{"serRefId":58},"attributes":{"encoding":{"serId":145,"value":{"descriptor":"encoding","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileType":{"serRefId":62},"form":{"serRefId":64},"source":{"serId":146,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileSize":{"serRefId":63},"files":{"serRefId":59},"fileName":{"serRefId":61},"fileDetails":{"serRefId":60}}}},"attributeName":"fileSelected","isGlobal":false}},{"serId":147,"value":{"eventDef":{"serRefId":66},"attributeName":"fileRejected","isGlobal":false}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":148,"value":{"descriptor":"markup://setup:qiCsvFileSelector","styleDef":{"serId":149,"value":{"descriptor":"css://setup.qiCsvFileSelector","code":".setupQiCsvFileSelector a,.setupQiCsvFileSelector a:hover{color:#1b75af}.setupQiCsvFileSelector a.cancel{color:#333;font-weight:bold;margin-right:10px}.setupQiCsvFileSelector .upload-wrapper{display:inline-block;position:relative;cursor:pointer;overflow:hidden}.setupQiCsvFileSelector .upload-wrapper form{position:absolute;top:0;right:0;-ms-filter:alpha(opacity=0);filter:alpha(opacity=0);opacity:0}.setupQiCsvFileSelector .upload-wrapper input{height:30px;font-size:100px;cursor:pointer}.setupQiCsvFileSelector .browse-button{padding:.6em 1.2em;background-color:#1b75af;border:1px solid #c5c6c8;border-radius:3px;cursor:pointer;color:#fff;font-weight:bold;text-align:center;display:inline-block}.setupQiCsvFileSelector .detail .status{display:block;margin:10px 0;font-weight:bold}","className":"setupQiCsvFileSelector"}},"controllerDef":{"serId":150,"value":{"descriptor":"compound://setup.qiCsvFileSelector","actionDefs":[{"serId":151,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp, event) {
		cmp.getValue('v.message').setValue('');
	},"actionType":"CLIENT"}},{"serId":152,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$openHelp","name":"openHelp","code":function(cmp, event, helper) {
		var url = cmp.getValue("v.helpUrl").getValue();

		if (url) {
			openPopupFocusEscapePounds(decodeURIComponent(url), 'Help');
		}
	},"actionType":"CLIENT"}},{"serId":153,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$fileSelected","name":"fileSelected","code":function(cmp, event, helper) {
		var attrs = cmp.getAttributes();

		attrs.getValue('message').setValue(event.getParam('fileName'));

		var compEvent = cmp.getEvent('fileSelected');
		compEvent.setParams({
			'files': event.getParam('files'),
			'fileDetails': event.getParam('fileDetails'),
			'fileName': event.getParam('fileName'),
			'fileType': event.getParam('fileType'),
			'fileSize': event.getParam('fileSize'),
			'source': attrs.getValue('source').getValue(),
			'form': event.getParam('form')
		});
		compEvent.fire();
	},"actionType":"CLIENT"}},{"serId":154,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$expand","name":"expand","code":function(cmp, event) {
		cmp.getSuper().getValue('v.viewState').setValue('selected');
	},"actionType":"CLIENT"}},{"serId":155,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$fileRejected","name":"fileRejected","code":function(cmp, event, helper) {
		var errors = event.getParam('errors');
		var error = errors.getValue(0);
		var message = error.getValue('message').getValue();

		var errorMessage = null;
		if (message === 'multipleSelectionDisabled') {
			errorMessage = $A.expressionService.getValue(cmp, '{!$Label.diFileSelector.multipleSelectionDisabled}').getValue();
		}
		else if (message === 'maximumSizeExceeded') {
			errorMessage = $A.expressionService.getValue(cmp, '{!$Label.diFileSelector.maximumSizeExceeded}').getValue();
		}
		else if (message === 'mimeTypeNotAccepted') {
			errorMessage = $A.expressionService.getValue(cmp, '{!$Label.diFileSelector.mimeTypeNotAccepted}').getValue();
		}

		cmp.getAttributes().getValue('message').setValue(errorMessage);
	},"actionType":"CLIENT"}},{"serId":156,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$collapse","name":"collapse","code":function(cmp, event) {
        
        
        var viewState = cmp.getSuper().getValue('v.viewState');
        if(viewState.getValue() === 'selected') {
		    viewState.setValue('initial');
        }
	},"actionType":"CLIENT"}}]}},"modelDef":{"serId":157,"value":{"descriptor":"java://ui.aura.components.setup.dataimporter.FileSelectionModel","members":[{"serId":158,"value":{"name":"actIconLocation","type":"java://java.lang.String"}},{"serId":159,"value":{"name":"csvIconLocation","type":"java://java.lang.String"}},{"serId":160,"value":{"name":"csvMimeType","type":"java://java.lang.String"}},{"serId":161,"value":{"name":"defaultFileEncoding","type":"java://java.lang.String"}},{"serId":162,"value":{"name":"fileEncodings","type":"java://java.util.List"}},{"serId":163,"value":{"name":"gmailIconLocation","type":"java://java.lang.String"}},{"serId":164,"value":{"name":"maxFileSizeBytes","type":"java://java.lang.Integer"}},{"serId":165,"value":{"name":"outlookIconLocation","type":"java://java.lang.String"}}]}},"superDef":{"serId":166,"value":{"descriptor":"markup://setup:qiDataSource","controllerDef":{"serId":167,"value":{"descriptor":"compound://setup.qiDataSource","actionDefs":[{"serId":168,"value":{"descriptor":"js://setup.qiDataSource/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp) {
		var attr = cmp.getAttributes();
		var source = attr.getValue("source").getValue();
        var viewStateObj = attr.getValue("viewState");
		var viewState = viewStateObj.getValue();

        
        if(viewState === viewStateObj.oldValue) {
            return;
        }

		var compEvent = cmp.getEvent('viewStateChanged');
		compEvent.setParams({
			source: source,
			viewState: viewState
		});
		compEvent.fire();
	},"actionType":"CLIENT"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7},{"serId":169,"value":{"descriptor":"cssClass","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":170,"value":{"descriptor":"label","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}},{"serId":171,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}},{"serId":172,"value":{"descriptor":"viewState","typeDefDescriptor":"apex://string","defaultValue":{"descriptor":"viewState","value":"initial"},"required":true,"visibility":"PUBLIC"}},{"serId":173,"value":{"descriptor":"initialContent","typeDefDescriptor":"aura://Aura.Component[]","required":true,"visibility":"PUBLIC"}},{"serId":174,"value":{"descriptor":"selectedContent","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":175,"value":{"descriptor":"loadingContent","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":176,"value":{"descriptor":"doneContent","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}}],"registerEventDefs":[{"serId":177,"value":{"eventDef":{"serRefId":140},"attributeName":"viewStateChanged","isGlobal":false}}],"handlerDefs":[{"serId":178,"value":{"action":{"exprType":"PROPERTY","path":["c","viewStateChanged"]},"value":{"exprType":"PROPERTY","path":["v","viewState"]},"name":"change"}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":179,"value":"markup://ui:outputText"},"attributes":{"values":{"class":{"descriptor":"class","value":"label"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","label"]}}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"initial"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serId":180,"value":"markup://aura:if"},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","initialContent","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"selected"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":180},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","selectedContent","length"]},0.0]}},"else":{"descriptor":"else","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","selectedContent"]}}}}}]}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"loading"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":180},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","loadingContent","length"]},0.0]}},"else":{"descriptor":"else","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","loadingContent"]}}}}}]}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"done"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":180},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","doneContent","length"]},0.0]}},"else":{"descriptor":"else","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","doneContent"]}}}}}]}}}}]}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"detail"}},"tag":{"descriptor":"tag","value":"div"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":{"exprType":"FUNCTION","key":"add","args":["source ",{"exprType":"PROPERTY","path":["v","cssClass"]}]}}},"tag":{"descriptor":"tag","value":"div"}}}}]}],"isAbstract":true}},"attributeDefs":[{"serRefId":7},{"serRefId":169},{"serRefId":170},{"serRefId":171},{"serRefId":172},{"serRefId":173},{"serRefId":174},{"serRefId":175},{"serRefId":176},{"serId":181,"value":{"descriptor":"message","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":182,"value":{"descriptor":"helpUrl","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}}],"registerEventDefs":[{"serRefId":177},{"serId":183,"value":{"eventDef":{"serRefId":144},"attributeName":"fileSelected","isGlobal":false}},{"serId":184,"value":{"eventDef":{"serRefId":66},"attributeName":"fileRejected","isGlobal":false}}],"handlerDefs":[{"serId":185,"value":{"action":{"exprType":"PROPERTY","path":["c","viewStateChanged"]},"name":"viewStateChanged"}}],"facets":[{"descriptor":"initialContent","value":[{"componentDef":{"serId":186,"value":"markup://ui:outputURL"},"attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","expand"]}},"class":{"descriptor":"class","value":"upload"},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","uploadLabel"]}},"value":{"descriptor":"value","value":"#"}}}}]},{"descriptor":"loadingContent","value":[{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"loading"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingLabel"]}}}}},{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"help"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingHelpLabel"]}}}}}]},{"descriptor":"selectedContent","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"localId":"cancel","attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","collapse"]}},"class":{"descriptor":"class","value":"cancel"},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","cancelLabel"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","cancelLabel"]}},"value":{"descriptor":"value","value":"#"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"attributes":{"values":{"class":{"descriptor":"class","value":"browse-button"},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","chooseFileLabel"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","chooseFileLabel"]}},"value":{"descriptor":"value","value":"#"}}}},{"componentDef":{"serRefId":46},"localId":"browse-inputFile","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"maxFileSizeBytes":{"descriptor":"maxFileSizeBytes","value":{"exprType":"PROPERTY","path":["m","maxFileSizeBytes"]}},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"multiple":{"descriptor":"multiple","value":false},"size":{"descriptor":"size","value":16}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"upload-wrapper"}},"tag":{"descriptor":"tag","value":"div"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{}},"tag":{"descriptor":"tag","value":"div"}}}},{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"status"},"value":{"descriptor":"value","value":{"exprType":"FUNCTION","key":"or","args":[{"exprType":"PROPERTY","path":["v","message"]},{"exprType":"PROPERTY","path":["$Label","quickimport","noFileSelected"]}]}}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":187,"value":"markup://aura:label"},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"localId":"help","attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","openHelp"]}},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["v","label"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["v","label"]}},"value":{"descriptor":"value","value":"#"}}}}]},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","uploadHelpLabel"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"help"}},"tag":{"descriptor":"tag","value":"div"}}}}]}],"hasServerDeps":true}},"localId":"outlook","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"source":{"descriptor":"source","value":"outlook"},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","outlookLabel"]}},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"cssClass":{"descriptor":"cssClass","value":"outlook"},"helpUrl":{"descriptor":"helpUrl","value":{"exprType":"PROPERTY","path":["m","outlookHelpUrl"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"even"}},"tag":{"descriptor":"tag","value":"li"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":188,"value":{"descriptor":"markup://setup:qiGmailContactSelector","styleDef":{"serId":189,"value":{"descriptor":"css://setup.qiGmailContactSelector","code":"","className":"setupQiGmailContactSelector"}},"controllerDef":{"serId":190,"value":{"descriptor":"compound://setup.qiGmailContactSelector","actionDefs":[{"serRefId":168},{"serId":191,"value":{"descriptor":"js://setup.qiGmailContactSelector/ACTION$connect","name":"connect","code":function(cmp, event, helper) {
		var url = UserContext.getUrl("/import/oauth_home.jsp?source=gmail");

		openwizard2(url, 'gmailOAuth', '1');
	},"actionType":"CLIENT"}}]}},"superDef":{"serRefId":166},"attributeDefs":[{"serRefId":7},{"serRefId":169},{"serRefId":170},{"serRefId":171},{"serRefId":172},{"serRefId":173},{"serRefId":174},{"serRefId":175},{"serRefId":176}],"registerEventDefs":[{"serRefId":177}],"facets":[{"descriptor":"initialContent","value":[{"componentDef":{"serRefId":186},"attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","connect"]}},"class":{"descriptor":"class","value":"upload"},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","connectLabel"]}},"value":{"descriptor":"value","value":"#"}}}}]},{"descriptor":"loadingContent","value":[{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"loading"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingLabel"]}}}}},{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"help"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingHelpLabel"]}}}}}]}]}},"localId":"gmail","attributes":{"values":{"source":{"descriptor":"source","value":"gmail"},"label":{"descriptor":"label","value":"Gmail"},"cssClass":{"descriptor":"cssClass","value":"gmail"},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"odd"}},"tag":{"descriptor":"tag","value":"li"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":148},"localId":"linkedIn","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"source":{"descriptor":"source","value":"linkedIn"},"label":{"descriptor":"label","value":"LinkedIn"},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"cssClass":{"descriptor":"cssClass","value":"linkedIn"},"helpUrl":{"descriptor":"helpUrl","value":{"exprType":"PROPERTY","path":["m","linkedInHelpUrl"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"even"}},"tag":{"descriptor":"tag","value":"li"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":148},"localId":"act","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"source":{"descriptor":"source","value":"act"},"label":{"descriptor":"label","value":"Act!"},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"cssClass":{"descriptor":"cssClass","value":"act"},"helpUrl":{"descriptor":"helpUrl","value":{"exprType":"PROPERTY","path":["m","actHelpUrl"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"odd"}},"tag":{"descriptor":"tag","value":"li"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"list"}},"tag":{"descriptor":"tag","value":"ul"}}}}]}],"hasServerDeps":true}},"localId":"dataSourceList","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}},{"componentDef":{"serRefId":68},"localId":"uploader","attributes":{"values":{"uploadCompleted":{"descriptor":"uploadCompleted","value":{"exprType":"PROPERTY","path":["c","uploadCompleted"]}},"uploadProgress":{"descriptor":"uploadProgress","value":{"exprType":"PROPERTY","path":["c","uploadProgress"]}}}}}]},"buttons":{"descriptor":"buttons","value":[{"componentDef":{"serId":192,"value":"markup://ui:dialogButtons"},"localId":"buttons","attributes":{"values":{"defaultButtons":{"descriptor":"defaultButtons","value":"none"},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"localId":"dataImporter","attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","openDataImporter"]}},"class":{"descriptor":"class","value":""},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","dataImporterLabel"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","dataImporterLabel"]}},"value":{"descriptor":"value","value":"#"}}}},{"componentDef":{"serId":193,"value":"markup://ui:button"},"localId":"close","attributes":{"values":{"press":{"descriptor":"press","value":{"exprType":"PROPERTY","path":["c","close"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","doneLabel"]}}}}}]}}}}]},"clickOutToClose":{"descriptor":"clickOutToClose","value":false}}}}]}],"hasServerDeps":true}},{"serRefId":148},{"serRefId":166},{"serRefId":129},{"serRefId":188}],"eventDefs":[{"serRefId":144},{"serRefId":66},{"serRefId":58},{"serRefId":83},{"serRefId":78},{"serRefId":140},{"serRefId":119},{"serRefId":115}]},"actions":[{"id":"ais","state":"SUCCESS","returnValue":{"serId":194,"value":{"componentDef":"markup://setup:qiAccountsAndContacts","creationPath":"/*[0]","model":{"dataImporterAppLocation":"/setup/dataImporter.app","uploadServletUrl":"/_ui/core/dataimporter/servlet/DataImporterUploadServlet"}}},"error":[],"components":[{"serRefId":194},{"serId":195,"value":{"componentDef":"markup://force:message","creationPath":"/*[0]/$/*[1]/*[0]/*[0]"}},{"serId":196,"value":{"componentDef":"markup://setup:qiDatasourceSelectorList","creationPath":"/*[0]/$/*[1]/*[1]","model":{"actHelpUrl":"https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dexporting_from_act.htm%2526section%253Dimport_data%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com","linkedInHelpUrl":"https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dexporting_from_linkedin.htm%2526section%253Dimport_data%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com","outlookHelpUrl":"https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dexporting_from_outlook.htm%2526section%253Dimport_data%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com"}}},{"serId":197,"value":{"componentDef":"markup://setup:qiCsvFileSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[0]/*[0]","model":{"actIconLocation":"/setup/dataimporter/icon-act.png","csvIconLocation":"/setup/dataimporter/icon-csv.png","csvMimeType":"text/csv,application/csv,application/vnd.ms-excel","defaultFileEncoding":"ISO-8859-1","fileEncodings":[{"value":"ISO-8859-1","label":"ISO-8859-1（通用美语和西欧语言，ISO-LATIN-1）","default":false},{"value":"MS932","label":"Windows 日语","default":false},{"value":"Big5","label":"Big5 繁体中文","default":false},{"value":"JIS 自动选择","label":"日语（自动检测）","default":false},{"value":"UTF-8","label":"Unicode (UTF8)","default":false},{"value":"UTF-16","label":"Unicode (UTF16)","default":false},{"value":"EUC-KR","label":"KS C 5601 韩语","default":false},{"value":"GB2312","label":"GB2312 简体中文","default":false},{"value":"Big5-HKSCS","label":"Big5 繁体中文 (HKSCS)","default":false},{"value":"x-SJIS_0213","label":"日文 (Shift_JIS-2004)","default":false}],"gmailIconLocation":"/setup/dataimporter/icon-gmail.png","maxFileSizeBytes":52428800,"outlookIconLocation":"/setup/dataimporter/icon-outlook.png"}}},{"serId":198,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[0]/*[0]/$"}},{"serId":199,"value":{"componentDef":"markup://setup:diInputFile","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[0]/*[0]/$/selectedContent[0]/*[1]/*[1]"}},{"serId":200,"value":{"componentDef":"markup://setup:qiGmailContactSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[1]/*[0]"}},{"serId":201,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[1]/*[0]/$"}},{"serId":202,"value":{"componentDef":"markup://setup:qiCsvFileSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[2]/*[0]","model":{"actIconLocation":"/setup/dataimporter/icon-act.png","csvIconLocation":"/setup/dataimporter/icon-csv.png","csvMimeType":"text/csv,application/csv,application/vnd.ms-excel","defaultFileEncoding":"ISO-8859-1","fileEncodings":[{"value":"ISO-8859-1","label":"ISO-8859-1（通用美语和西欧语言，ISO-LATIN-1）","default":false},{"value":"MS932","label":"Windows 日语","default":false},{"value":"Big5","label":"Big5 繁体中文","default":false},{"value":"JIS 自动选择","label":"日语（自动检测）","default":false},{"value":"UTF-8","label":"Unicode (UTF8)","default":false},{"value":"UTF-16","label":"Unicode (UTF16)","default":false},{"value":"EUC-KR","label":"KS C 5601 韩语","default":false},{"value":"GB2312","label":"GB2312 简体中文","default":false},{"value":"Big5-HKSCS","label":"Big5 繁体中文 (HKSCS)","default":false},{"value":"x-SJIS_0213","label":"日文 (Shift_JIS-2004)","default":false}],"gmailIconLocation":"/setup/dataimporter/icon-gmail.png","maxFileSizeBytes":52428800,"outlookIconLocation":"/setup/dataimporter/icon-outlook.png"}}},{"serId":203,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[2]/*[0]/$"}},{"serId":204,"value":{"componentDef":"markup://setup:diInputFile","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[2]/*[0]/$/selectedContent[0]/*[1]/*[1]"}},{"serId":205,"value":{"componentDef":"markup://setup:qiCsvFileSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[3]/*[0]","model":{"actIconLocation":"/setup/dataimporter/icon-act.png","csvIconLocation":"/setup/dataimporter/icon-csv.png","csvMimeType":"text/csv,application/csv,application/vnd.ms-excel","defaultFileEncoding":"ISO-8859-1","fileEncodings":[{"value":"ISO-8859-1","label":"ISO-8859-1（通用美语和西欧语言，ISO-LATIN-1）","default":false},{"value":"MS932","label":"Windows 日语","default":false},{"value":"Big5","label":"Big5 繁体中文","default":false},{"value":"JIS 自动选择","label":"日语（自动检测）","default":false},{"value":"UTF-8","label":"Unicode (UTF8)","default":false},{"value":"UTF-16","label":"Unicode (UTF16)","default":false},{"value":"EUC-KR","label":"KS C 5601 韩语","default":false},{"value":"GB2312","label":"GB2312 简体中文","default":false},{"value":"Big5-HKSCS","label":"Big5 繁体中文 (HKSCS)","default":false},{"value":"x-SJIS_0213","label":"日文 (Shift_JIS-2004)","default":false}],"gmailIconLocation":"/setup/dataimporter/icon-gmail.png","maxFileSizeBytes":52428800,"outlookIconLocation":"/setup/dataimporter/icon-outlook.png"}}},{"serId":206,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[3]/*[0]/$"}},{"serId":207,"value":{"componentDef":"markup://setup:diInputFile","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[3]/*[0]/$/selectedContent[0]/*[1]/*[1]"}},{"serId":208,"value":{"componentDef":"markup://setup:diInvisibleFileUploader","creationPath":"/*[0]/$/*[1]/*[2]"}}]}]};
$A.run(function() { $A.clientService.injectComponent(config, "walkthrough-quick-import", "quickImport"); });
</script>
        </div>
        <!---->
        <div class="mask hidden uiDialog setupQiAccountsAndContacts" data-aura-rendered-by="411:2.a">
            <!---->
        </div>
        <div class="dialog hidden  modal medium default uiDialog setupQiAccountsAndContacts"
            aria-live="assertive" aria-atmoic="true" role="dialog" aria-labelledby="5:2.a-title"
            data-aura-rendered-by="412:2.a">
            <h2 class="title" id="5:2.a-title" data-aura-rendered-by="413:2.a">
                快速联系人导入<span class="assistiveText" data-aura-rendered-by="415:2.a">导入联系人的对话框窗口</span></h2>
            <div class="content" data-aura-rendered-by="417:2.a">
                <!---->
                <ul class="list setupQiDatasourceSelectorList" data-aura-rendered-by="60:2.a">
                    <li class="even" data-aura-rendered-by="61:2.a">
                        <div class="source outlook setupQiCsvFileSelector" data-aura-rendered-by="124:2.a"
                            data-uidsfdc="30">
                            <span class="label uiOutputText" dir="ltr" data-aura-rendered-by="127:2.a">
                                <!---->
                                Outlook</span><div class="detail" data-aura-rendered-by="131:2.a">
                                    <a class="upload uiOutputURL" href="javascript:void(0);" title="" dir="ltr" data-aura-rendered-by="66:2.a">
                                        <!---->
                                        上载</a><!----><!----><!----></div>
                        </div>
                    </li>
                    <li class="odd" data-aura-rendered-by="152:2.a">
                        <div class="source gmail setupQiGmailContactSelector" data-aura-rendered-by="176:2.a"
                            data-uidsfdc="31">
                            <span class="label uiOutputText" dir="ltr" data-aura-rendered-by="179:2.a">
                                <!---->
                                Gmail</span><div class="detail" data-aura-rendered-by="183:2.a">
                                    <a class="upload uiOutputURL" href="javascript:void(0);" title="" dir="ltr" data-aura-rendered-by="157:2.a">
                                        <!---->
                                        连接</a><!----><!----><!----></div>
                        </div>
                    </li>
                    <li class="even" data-aura-rendered-by="204:2.a">
                        <div class="source linkedIn setupQiCsvFileSelector" data-aura-rendered-by="267:2.a"
                            data-uidsfdc="32">
                            <span class="label uiOutputText" dir="ltr" data-aura-rendered-by="270:2.a">
                                <!---->
                                LinkedIn</span><div class="detail" data-aura-rendered-by="274:2.a">
                                    <a class="upload uiOutputURL" href="javascript:void(0);" title="" dir="ltr" data-aura-rendered-by="209:2.a">
                                        <!---->
                                        上载</a><!----><!----><!----></div>
                        </div>
                    </li>
                    <li class="odd" data-aura-rendered-by="295:2.a">
                        <div class="source act setupQiCsvFileSelector" data-aura-rendered-by="358:2.a" data-uidsfdc="33">
                            <span class="label uiOutputText" dir="ltr" data-aura-rendered-by="361:2.a">
                                <!---->
                                Act!</span><div class="detail" data-aura-rendered-by="365:2.a">
                                    <a class="upload uiOutputURL" href="javascript:void(0);" title="" dir="ltr" data-aura-rendered-by="300:2.a">
                                        <!---->
                                        上载</a><!----><!----><!----></div>
                        </div>
                    </li>
                </ul>
                <!---->
            </div>
            <div class="buttons" data-aura-rendered-by="420:2.a">
                <!---->
                <a class="uiOutputURL" href="javascript:void(0);" title="选择其他格式" dir="ltr" data-aura-rendered-by="391:2.a">
                    <!---->
                    选择其他格式</a>
                <button class="default uiBlock uiButton" accesskey="" type="button" data-aura-rendered-by="399:2.a">
                        <!---->
                        <span class=" label bBody truncate" dir="ltr" data-aura-rendered-by="402:2.a">完成</span><!----></button><!----></div>
            <button class="close  default uiBlock uiButton" title="Close this window" accesskey=""
                type="button" data-aura-rendered-by="424:2.a">
                <!---->
                <span class=" label bBody truncate" dir="ltr" data-aura-rendered-by="427:2.a"></span>
                <!---->
            </button>
        </div>
    </div>
    <div class="zen collapsed" id="walkthrough-sidebar">
        <div id="walkthrough-sidebar-inner">
            <div id="walkthrough-sidebar-content">
                <div id="walkthrough-header">
                    <a id="walkthrough-roleselector-left" href="javascript:void(0)" data-uidsfdc="15">
                    </a>
                    <ul id="walkthrough-sidebar-roles">
                        <li data-role-id="sales-rep" id="walkthrough-role-sales-rep"><span>销售代表</span><div
                            class="walkthrough-sidebar-role walkthrough-role-sales-rep">
                        </div>
                        </li>
                        <li data-role-id="owner" id="walkthrough-role-owner"><span>公司所有人</span><div class="walkthrough-sidebar-role walkthrough-role-owner">
                        </div>
                        </li>
                        <li data-role-id="it" id="walkthrough-role-it" class="selected"><span>信息技术</span><div
                            class="walkthrough-sidebar-role walkthrough-role-it">
                        </div>
                        </li>
                        <li data-role-id="sales-manager" id="walkthrough-role-sales-manager"><span>销售管理员</span><div
                            class="walkthrough-sidebar-role walkthrough-role-sales-manager">
                        </div>
                        </li>
                    </ul>
                    <a id="walkthrough-roleselector-right" href="javascript:void(0)" data-uidsfdc="16">
                    </a>
                </div>
                <div id="walkthrough-sidebar-body">
                    <ul data-uidsfdc="14">
                        <li class="" id="walkthrough-list-walkthrough-intro-it">
                            <div>
                                <a href="javascript:void(0)" data-walkthrough-id="intro-it">简介</a></div>
                        </li>
                        <li class="" id="walkthrough-list-walkthrough-add-custom-field">
                            <div>
                                <a href="javascript:void(0)" data-walkthrough-id="add-custom-field">为客户添加自定义字段</a></div>
                        </li>
                        <li class="" id="walkthrough-list-walkthrough-create-data-validation-rule">
                            <div>
                                <a href="javascript:void(0)" data-walkthrough-id="create-data-validation-rule">创建数据验证规则</a></div>
                        </li>
                        <li class="" id="walkthrough-list-walkthrough-integrate-other-applications">
                            <div>
                                <a href="javascript:void(0)" data-walkthrough-id="integrate-other-applications">与其他应用程序集成</a></div>
                        </li>
                        <li class="" id="walkthrough-list-walkthrough-invite-coworker">
                            <div>
                                <a href="javascript:void(0)" data-walkthrough-id="invite-coworker">邀请同事试用</a></div>
                        </li>
                    </ul>
                </div>
                <div id="walkthrough-footer" data-uidsfdc="17">
                    <a title="导入联系人" href="javascript:void(0)" id="walkthrough-import-label">导入联系人</a></div>
            </div>
            <div id="walkthrough-sidebar-toolbar">
                <div id="walkthrough-sidebar-toggle" data-uidsfdc="13">
                    <img title="展开逐步解说导航" alt="展开逐步解说导航" src="/img/spacer.gif"></div>
                <div>
                    逐步解说</div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://ap1.salesforce.com/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/moment/moment.js"></script>
    <script type="text/javascript" src="https://ap1.salesforce.com/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/walltime-js/olson/walltime-data_Asia-Shanghai.js"></script>
    <link type="text/css" rel="stylesheet" href="https://umps1t4.salesforce.com/umps/UMPSWidget_184/css/presence_css.css?cflag=184.28">
    <script type="text/javascript" src="https://ap1.salesforce.com/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/walltime-js/walltime.js"></script>
    <script type="text/javascript" src="https://ap1.salesforce.com/auraFW/resources/pvD_-TGLa0o4QjJud0CEhQ/ckeditor-3.6.6/ckeditor.js"></script>
    <script type="text/javascript" src="https://ap1.salesforce.com/auraFW/javascript/pvD_-TGLa0o4QjJud0CEhQ/aura_prod.js"></script>
    <script type="text/javascript" src="https://ap1.salesforce.com/l/%7B%22mode%22%3A%22PROD%22%2C%22app%22%3A%22aura%3AintegrationServiceApp%22%2C%22preloads%22%3A%5B%22aura%22%2C%22ui%22%5D%2C%22loaded%22%3A%7B%22APPLICATION%40markup%3A%2F%2Faura%3AintegrationServiceApp%22%3A%22eVSTXyKN5PxZyDf9VF84vQ%22%7D%2C%22lastmod%22%3A%221410464213000%22%2C%22fwuid%22%3A%22pvD_-TGLa0o4QjJud0CEhQ%22%7D/app.js"></script>
    <script type="text/javascript">
        $A.initConfig({ "host": "", "token": "MDd7I2t9etQu_gzL9KkYhr1VTX0W8y68cdZeQp6SWFSrZjf7bW8BCFRA.CVixsmjDFl2BSer2wns5_1ZLI9iZzyhzaBklSMoJ_ukMv5pZWWo2PhbozOnynmy4nQUUwzWTCSkYw==", "context": { "mode": "PROD", "app": "aura:integrationServiceApp", "preloads": ["aura", "ui"], "loaded": { "APPLICATION@markup://aura:integrationServiceApp": "eVSTXyKN5PxZyDf9VF84vQ" }, "lastmod": "1410464213000", "fwuid": "pvD_-TGLa0o4QjJud0CEhQ", "globalValueProviders": [{ "type": "$Browser", "values": { "formFactor": "DESKTOP", "isWindowsPhone": false, "isPhone": false, "S1Features": { "isCustomizeTodayEnabled": false, "isOfflineEnabled": true, "isUitrkLoggingEnabled": true }, "isFIREFOX": true, "isIPad": false, "isAndroid": false, "isTablet": false, "isWEBKIT": false, "containerVersion": "", "isContainer": false, "isIE7": false, "isIE6": false, "isIE9": false, "isIE8": false, "isIPhone": false, "isIOS": false, "isIE10": false} }, { "type": "$Locale", "values": { "userLocaleLang": "zh", "userLocaleCountry": "CN", "language": "zh", "country": "CN", "variant": "", "langLocale": "zh_CN", "dateFormat": "yyyy-M-d", "datetimeFormat": "yyyy-M-d H:mm:ss", "timeFormat": "H:mm:ss", "timezone": "Asia/Shanghai", "timezoneFileName": "Asia-Shanghai", "numberFormat": "#,##0.###", "decimal": ".", "grouping": ",", "zero": "0", "percentFormat": "#,##0%", "currencyFormat": "¤#,##0.00", "currencyCode": "CNY", "currency": "￥"} }, { "type": "$SObjectType", "values": { "CurrentUser": { "Email": "youtter100@163.com", "FirstName": "jerryliu", "Id": "005900000038QVZ"}}}] }, "instance": { "serId": 1, "value": { "componentDef": "markup://aura:integrationServiceApp", "creationPath": "/*[0]"}} }, true, true, true);
    </script>
    <!---->
    <script type="text/javascript">var config = {"context":{"mode":"PROD","app":"aura:integrationServiceApp","preloads":["aura","ui"],"loaded":{"COMPONENT@markup://setup:qiAccountsAndContacts":"0HyJWhjaOps047b7w8gS5g","APPLICATION@markup://aura:integrationServiceApp":"eVSTXyKN5PxZyDf9VF84vQ"},"lastmod":"1410464213000","fwuid":"pvD_-TGLa0o4QjJud0CEhQ","globalValueProviders":[{"type":"$Label","values":{"diCsvSelectionActivity":{"linkedIn":"LinkedIn","outlook":"Outlook CSV","gmail":"GMail CSV","act":"ACT! CSV"},"diFileSelector":{"mimeTypeNotAccepted":"不允许选定文件的 MIME 类型。","multipleSelectionDisabled":"不允许选择多个文件。","maximumSizeExceeded":"超过最大文件大小。"},"quickimport":{"confirmationLabel":"您的导入已开始！我们会在完成后发送电子邮件给您。","outlookLabel":"Outlook","uploadLabel":"上载","loadingLabel":"正在加载","connectLabel":"连接","doneLabel":"完成","cancelLabel":"取消","loadingHelpLabel":"您可以在此导入期间正常工作。","dataImporterLabel":"选择其他格式","title":"快速联系人导入","uploadError":"上载错误，请重试。","uploadHelpLabel":"有问题？访问有关从 {0} 导出的帮助教程。","windowTitle":"导入联系人的对话框窗口","chooseFileLabel":"选择文件","noFileSelected":"未选择文件"}}},{"type":"$Browser","values":{"formFactor":"DESKTOP","isWindowsPhone":false,"isPhone":false,"S1Features":{"isCustomizeTodayEnabled":false,"isOfflineEnabled":true,"isUitrkLoggingEnabled":true},"isFIREFOX":true,"isIPad":false,"isAndroid":false,"isTablet":false,"isWEBKIT":false,"containerVersion":"","isContainer":false,"isIE7":false,"isIE6":false,"isIE9":false,"isIE8":false,"isIPhone":false,"isIOS":false,"isIE10":false}},{"type":"$Locale","values":{"userLocaleLang":"zh","userLocaleCountry":"CN","language":"zh","country":"CN","variant":"","langLocale":"zh_CN","dateFormat":"yyyy-M-d","datetimeFormat":"yyyy-M-d H:mm:ss","timeFormat":"H:mm:ss","timezone":"Asia/Shanghai","timezoneFileName":"Asia-Shanghai","numberFormat":"#,##0.###","decimal":".","grouping":",","zero":"0","percentFormat":"#,##0%","currencyFormat":"¤#,##0.00","currencyCode":"CNY","currency":"￥"}},{"type":"$SObjectType","values":{"CurrentUser":{"Email":"youtter100@163.com","FirstName":"jerryliu","Id":"005900000038QVZ"}}}],"componentDefs":[{"serId":1,"value":{"descriptor":"markup://force:message","rendererDef":{"serId":2,"value":{"descriptor":"js://force.message","afterRender":function(cmp, helper) {
        this.superAfterRender();
        
        var theme = cmp.get("v.theme");
        if ("pOne" === theme) {
            
            
            
            var iconElem = document.querySelector(".forceMessage.pOne .icon");
            iconElem.setAttribute("data-icon", "\ue024");
            $A.util.addClass(iconElem, "forceIcon");
        }
    }}},"styleDef":{"serId":3,"value":{"descriptor":"css://force.message","code":".forceMessage{color:#464646;padding:5px;margin:10px;border:1px solid;border-radius:5px;font-size:13px;line-height:18px}.forceMessage h4{font-weight:bold;font-size:16px}.forceMessage .bBody p{margin:0}.forceMessage .bLeft .icon{margin-right:10px}.forceMessage.message{margin:0;border:0}.forceMessage.message .bLeft .icon{display:none}.forceMessage.warning{border-color:#f8e38e;background-color:#ffffdc}.forceMessage.warning.strength_0 .bLeft .icon,.forceMessage.warning.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/warning16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.warning.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/warning24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.warning.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/warning32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.error{border-color:#f2a199;background-color:#fdedea}.forceMessage.error.strength_0 .bLeft .icon,.forceMessage.error.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/error16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.error.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/error24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.error.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/error32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.confirm{border-color:#9bebb3;background-color:#edfff1}.forceMessage.confirm.strength_0 .bLeft .icon,.forceMessage.confirm.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/confirm16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.confirm.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/confirm24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.confirm.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/confirm32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.info{border-color:#bee6ff;background-color:#f5fcff}.forceMessage.info.strength_0 .bLeft .icon,.forceMessage.info.strength_1 .bLeft .icon{background:transparent url(\"/img/msg_icons/info16.png\") no-repeat left center;width:16px;height:16px}.forceMessage.info.strength_2 .bLeft .icon{background:transparent url(\"/img/msg_icons/info24.png\") no-repeat left center;width:24px;height:24px}.forceMessage.info.strength_3 .bLeft .icon{background:transparent url(\"/img/msg_icons/info32.png\") no-repeat left center;width:32px;height:32px}.forceMessage.strength_0{border:none;background-color:transparent}.forceMessage.strength_0 .bLeft .icon{margin-right:5px}.forceMessage.desktopBoxed{border:0;border-radius:3px;margin:0;color:#fff}.forceMessage.desktopBoxed .bBody .summary{font-size:16px;font-weight:bold;margin-bottom:5px}.forceMessage.desktopBoxed .bBody .detail{font-size:14px}.forceMessage.desktopBoxed a{color:#ffffff;text-decoration:underline}.forceMessage.desktopBoxed.error{background-color:#d68184;border-color:#d68184}.forceMessage.desktopBoxed.warning{background-color:#e7bc49;border-color:#e7bc49}.forceMessage.desktopBoxed.info{background-color:#669bd7;border-color:#669bd7}.forceMessage.desktopBoxed.confirm{background-color:#60c170;border-color:#60c170}.forceMessage.desktopBoxed.strength_3{padding:15px 20px}.forceMessage.desktopBoxed.error.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/red-error.png\") no-repeat;width:34px;height:34px}.forceMessage.desktopBoxed.warning.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/yellow-warning.png\") no-repeat;width:39px;height:34px}.forceMessage.desktopBoxed.info.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/blue-info.png\") no-repeat;width:34px;height:34px}.forceMessage.desktopBoxed.confirm.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/green-check.png\") no-repeat;width:34px;height:34px}.forceMessage.desktopBoxed.strength_3 .bLeft .icon{margin-right:20px}.forceMessage.desktop{background-color:transparent;border:0;color:#292929}.forceMessage.desktop a{color:#1b6cc8;text-decoration:none}.forceMessage.desktop.error.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/error_red.png\") no-repeat}.forceMessage.desktop.warning.strength_3 .bLeft .icon{background:url(\"/relatedlist/images/message/warning_yellow.png\") no-repeat;width:34px;height:34px}.forceMessage.pOne.error.strength_3 .bLeft .icon{background:none;width:24px;height:24px;content:\"\";margin-right:14px;font-size:24px;color:#be554b;line-height:38px}.forceMessage.pOne.error.strength_3 .bBody .summary{padding-bottom:7px}.forceMessage.pOne.error.strength_3 .bBody .summary,.forceMessage.pOne.error.strength_3 .bBody .detail{line-height:1em}.forceMessage.pOne .summary{font-size:15px;padding-bottom:14px;font-family:'ProximaNovaSoft-Semibold';color:#3c3d3e}.forceMessage.pOne .detail{font-size:15px;color:#3c3d3e}.forceMessage.pOne.error{margin:0;padding:14px;border:none;background:#e8eaeb;border-bottom:1px solid #cfd4d9}","className":"forceMessage"}},"controllerDef":{"serId":4,"value":{"descriptor":"compound://ui.message","actionDefs":[{"serId":5,"value":{"descriptor":"js://ui.message/ACTION$press","name":"press","code":function(cmp) {
        var theMessage = cmp.getElement();
        $A.util.addClass(theMessage,"hide");
    },"actionType":"CLIENT"}}]}},"superDef":{"serId":6,"value":"markup://ui:message"},"attributeDefs":[{"serId":7,"value":{"descriptor":"body","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":8,"value":{"descriptor":"class","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":9,"value":{"descriptor":"dir","typeDefDescriptor":"aura://String","defaultValue":{"descriptor":"dir","value":"ltr"},"required":false,"visibility":"PUBLIC"}},{"serId":10,"value":{"descriptor":"label","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":11,"value":{"descriptor":"namespaceOverride","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":12,"value":{"descriptor":"actionable","typeDefDescriptor":"aura://Boolean","defaultValue":{"descriptor":"actionable","value":true},"required":false,"visibility":"PUBLIC"}},{"serId":13,"value":{"descriptor":"role","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":14,"value":{"descriptor":"ariaDescribedby","typeDefDescriptor":"aura://String","defaultValue":{"descriptor":"ariaDescribedby","value":""},"required":false,"visibility":"PUBLIC"}},{"serId":15,"value":{"descriptor":"value","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}},{"serId":16,"value":{"descriptor":"visible","typeDefDescriptor":"aura://Boolean","defaultValue":{"descriptor":"visible","value":true},"required":false,"visibility":"PUBLIC"}},{"serId":17,"value":{"descriptor":"title","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},{"serId":18,"value":{"descriptor":"severity","typeDefDescriptor":"aura://String","required":true,"visibility":"PUBLIC"}},{"serId":19,"value":{"descriptor":"closable","typeDefDescriptor":"aura://Boolean","defaultValue":{"descriptor":"closable","value":false},"required":false,"visibility":"PUBLIC"}},{"serId":20,"value":{"descriptor":"strength","typeDefDescriptor":"aura://Integer","defaultValue":{"descriptor":"strength","value":1},"required":false,"visibility":"PUBLIC"}},{"serId":21,"value":{"descriptor":"summary","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":22,"value":{"descriptor":"detail","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":23,"value":{"descriptor":"theme","typeDefDescriptor":"aura://String","defaultValue":{"descriptor":"theme","value":""},"required":false,"visibility":"PUBLIC"}}],"registerEventDefs":[{"serId":24,"value":{"eventDef":{"serId":25,"value":{"descriptor":"markup://ui:mouseup","type":"COMPONENT","superDef":{"serId":26,"value":{"descriptor":"markup://ui:baseMouseEvent","type":"COMPONENT","superDef":{"serId":27,"value":{"descriptor":"markup://ui:baseDOMEvent","type":"COMPONENT","superDef":{"serId":28,"value":{"descriptor":"markup://aura:componentEvent","type":"COMPONENT","attributes":{}}},"attributes":{"domEvent":{"serId":29,"value":{"descriptor":"domEvent","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}}}}},"attributes":{"domEvent":{"serRefId":29},"button":{"serId":30,"value":{"descriptor":"button","typeDefDescriptor":"aura://Integer","required":false,"visibility":"PUBLIC"}}}}},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mouseup","isGlobal":true}},{"serId":31,"value":{"eventDef":{"serId":32,"value":{"descriptor":"markup://ui:mousedown","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mousedown","isGlobal":true}},{"serId":33,"value":{"eventDef":{"serId":34,"value":{"descriptor":"markup://ui:mousemove","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mousemove","isGlobal":true}},{"serId":35,"value":{"eventDef":{"serId":36,"value":{"descriptor":"markup://ui:dblclick","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"dblclick","isGlobal":true}},{"serId":37,"value":{"eventDef":{"serId":38,"value":{"descriptor":"markup://ui:mouseout","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mouseout","isGlobal":true}},{"serId":39,"value":{"eventDef":{"serId":40,"value":{"descriptor":"markup://ui:click","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"click","isGlobal":true}},{"serId":41,"value":{"eventDef":{"serId":42,"value":{"descriptor":"markup://ui:mouseover","type":"COMPONENT","superDef":{"serRefId":26},"attributes":{"domEvent":{"serRefId":29},"button":{"serRefId":30}}}},"attributeName":"mouseover","isGlobal":true}}],"facets":[{"descriptor":"class","value":{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":[{"exprType":"FUNCTION","key":"add","args":["strength_",{"exprType":"PROPERTY","path":["v","strength"]}]}," "]},{"exprType":"PROPERTY","path":["v","theme"]}]}," "]},{"exprType":"PROPERTY","path":["v","class"]}]}},{"descriptor":"body","value":[{"componentDef":{"serId":43,"value":"markup://aura:renderIf"},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","body","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serId":44,"value":"markup://aura:html"},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":45,"value":"markup://aura:expression"},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","body"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"body"}},"tag":{"descriptor":"tag","value":"p"}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","summary","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","summary"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"summary"}},"tag":{"descriptor":"tag","value":"p"}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","detail","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","detail"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"detail"}},"tag":{"descriptor":"tag","value":"p"}}}}]}}}}]}]}},{"serId":46,"value":{"descriptor":"markup://setup:diInputFile","controllerDef":{"serId":47,"value":{"descriptor":"compound://setup.diInputFile","actionDefs":[{"serId":48,"value":{"descriptor":"js://setup.diInputFile/ACTION$change","name":"change","code":function(cmp, event, helper) {
	    var button = cmp.find('browse-button');
	    if (button) {
		    var buttonFiles = button.getElement().files;
			var attrs = cmp.getAttributes();
			var files = [];
			var errors = [];

			
			if (buttonFiles) {
	        	for (var i = 0; i < buttonFiles.length; i++) {
	    			var file = buttonFiles[i];
        			var accept = attrs.getValue('accept').getValue();
    		        if (accept && file.type && file.type.length &gt; 0 && accept.indexOf(file.type) < 0) {
    		        	errors[errors.length] = { 'fileName' : file.name, 'message': 'mimeTypeNotAccepted' };
    		        	continue;
    		        }
        			var maxFileSizeBytes = attrs.getValue('maxFileSizeBytes').getValue();
    		        if (maxFileSizeBytes && file.size && file.size &gt; maxFileSizeBytes) {
    		        	errors[errors.length] = { 'fileName' : file.name, 'message': 'maximumSizeExceeded' };
    		        	continue;    		        
    		        }
            		files[files.length] = file;	        		
	        	}
    			var multiple = attrs.getValue('multiple').getValue();
	        	if (!multiple && buttonFiles.length &gt; 1) {
		        	errors[errors.length] = { 'message': 'multipleSelectionDisabled' };
	        	}
			}

			if (errors.length &gt; 0) {
		        var compEvent = cmp.getEvent('fileRejected');
		        compEvent.setParams({ 
		        	'errors': errors
		        });
		        compEvent.fire();
			}
			else if (files.length &gt; 0) {
				var details = [];
				for (var i = 0; i < files.length; i++) {
					details[details.length] = {
						'fileName' : files[i].name,
						'fileType' : files[i].type,
						'fileSize' : files[i].size
					};
				}

		        var compEvent = cmp.getEvent('fileSelected');
		        compEvent.setParams({ 
		        	'files': files,
		        	'fileDetails': details,
		        	'fileName': files[0].name,
		        	'fileType': files[0].type,
		        	'fileSize': files[0].size,
					'form': null
		        });
		        compEvent.fire();
			}
			else {
				
		        var compEvent = cmp.getEvent('fileSelected');
		        compEvent.setParams({ 
		        	'files': files,
		        	'fileDetails': {},
		        	'fileName': null,
		        	'fileType': null,
		        	'fileSize': null,
					'form': cmp.find('upload-form')
		        });
		        compEvent.fire();
			}
	    }
    },"actionType":"CLIENT"}}]}},"superDef":{"serId":49,"value":"markup://aura:component"},"attributeDefs":[{"serRefId":7},{"serId":50,"value":{"descriptor":"accept","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":51,"value":{"descriptor":"maxFileSizeBytes","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},{"serId":52,"value":{"descriptor":"multiple","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}},{"serId":53,"value":{"descriptor":"class","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":54,"value":{"descriptor":"disabled","typeDefDescriptor":"apex://boolean","defaultValue":{"descriptor":"disabled","value":false},"required":false,"visibility":"PUBLIC"}},{"serId":55,"value":{"descriptor":"name","typeDefDescriptor":"apex://string","defaultValue":{"descriptor":"name","value":"file"},"required":false,"visibility":"PUBLIC"}},{"serId":56,"value":{"descriptor":"size","typeDefDescriptor":"apex://integer","defaultValue":{"descriptor":"size","value":30},"required":false,"visibility":"PUBLIC"}}],"interfaces":["markup://setup:diFileSelector"],"registerEventDefs":[{"serId":57,"value":{"eventDef":{"serId":58,"value":{"descriptor":"markup://setup:diFileSelected","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"files":{"serId":59,"value":{"descriptor":"files","typeDefDescriptor":"apex://object","required":false,"visibility":"PUBLIC"}},"fileDetails":{"serId":60,"value":{"descriptor":"fileDetails","typeDefDescriptor":"aura://List","required":false,"serializeTo":"NONE","visibility":"PUBLIC"}},"fileName":{"serId":61,"value":{"descriptor":"fileName","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileType":{"serId":62,"value":{"descriptor":"fileType","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileSize":{"serId":63,"value":{"descriptor":"fileSize","typeDefDescriptor":"apex://long","required":false,"visibility":"PUBLIC"}},"form":{"serId":64,"value":{"descriptor":"form","typeDefDescriptor":"aura://Aura.Component","required":false,"visibility":"PUBLIC"}}}}},"attributeName":"fileSelected","isGlobal":false}},{"serId":65,"value":{"eventDef":{"serId":66,"value":{"descriptor":"markup://setup:diFileRejected","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"errors":{"serId":67,"value":{"descriptor":"errors","typeDefDescriptor":"aura://List","required":false,"serializeTo":"NONE","visibility":"PUBLIC"}}}}},"attributeName":"fileRejected","isGlobal":false}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"localId":"upload-form","attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"localId":"browse-button","attributes":{"values":{"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":{"exprType":"PROPERTY","path":["v","class"]},"accept":{"exprType":"PROPERTY","path":["v","accept"]},"disabled":{"exprType":"PROPERTY","path":["v","disabled"]},"name":{"exprType":"PROPERTY","path":["v","name"]},"multiple":{"exprType":"FUNCTION","key":"if","args":[{"exprType":"PROPERTY","path":["v","multiple"]},"multiple",null]},"onchange":{"exprType":"PROPERTY","path":["c","change"]},"type":"file","size":{"exprType":"PROPERTY","path":["v","size"]}}},"tag":{"descriptor":"tag","value":"input"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"encoding":"multipart/form-data","enctype":"multipart/form-data","action":"","method":"post"}},"tag":{"descriptor":"tag","value":"form"}}}}]}]}},{"serId":68,"value":{"descriptor":"markup://setup:diInvisibleFileUploader","helperDef":{"serId":69,"value":{"descriptor":"js://setup.diInvisibleFileUploader","functions":{"uploadAbort":function(cmp, e) { 
        var compEvent = cmp.getEvent('uploadCompleted');
        compEvent.setParams({ 'responseText' : e.target.responseText,
            				  'status' : e.target.status,
        	                  'successful' : false, 
        	                  'aborted' : true });
        compEvent.fire();
	},"getFormData":function(cmp) {
		if (!this.supportFileApi()) {
			return null;
		}
		var attrs = cmp.getAttributes();

		var files = attrs.getValue('files').getValue();
		var names = [];
		for (var i = 0; i < files.length; ++i) {
			names[i] = attrs.getValue('names').getRawValue(i);
		}

		var formData = new FormData();
		for (var i = 0; i < files.length; i++) {
			formData.append(names[i], files[i]);
		}

		return formData;
	},"uploadError":function(cmp, e) { 
        var compEvent = cmp.getEvent('uploadCompleted');
        compEvent.setParams({ 'responseText' : e.target.responseText, 
        	                  'status' : e.target.status,
        	                  'successful' : false, 
        	                  'aborted' : false });
        compEvent.fire();
	},"uploadFinish":function(cmp, e) { 
		var status = e.target.status;
		var successful = status &gt;= 200 && status < 300 || status===1223;

        var compEvent = cmp.getEvent('uploadCompleted');
        compEvent.setParams({ 'responseText' : e.target.responseText, 
            				  'status' : status,
        	                  'successful' : successful,
        	                  'aborted' : false });
        compEvent.fire();
	},"supportFileApi":function() {
		return window.File && window.FileList && window.FileReader;
	},"uploadProgress":function(cmp, e) { 
	    if (e.lengthComputable) {
	        var percentComplete = Math.round(e.loaded * 100 / e.total);	 
	        if (percentComplete < 100) {
		        var compEvent = cmp.getEvent('uploadProgress');
		        compEvent.setParams({ 'bytesUploaded' : e.loaded,      
		        	                  'bytesTotal' : e.total,
		        	                  'percentComplete' : percentComplete });
		        compEvent.fire();
	        }	        
	    }
	},"createHiddenIFrame":function(id) {
		var frame = null;
		if ($A.get('$Browser.isIE7') === true) {
			
			
			frame = document.createElement('<iframe name="' + id + '"/&gt;');
		}
		else {
			frame = document.createElement("IFRAME");
			frame.setAttribute("name", id);
		}
		frame.setAttribute("id", id);
		frame.setAttribute("style", "display: none;");

		return frame;
	},"onUploadComplete":function(cmp, event, frame) {
		var successful = false;
		var responseText;
				
		try {
			var doc = frame.contentWindow.document || frame.contentDocument || frame.docmument || window.frames[frame.id].document;
			if (doc) {
				var firstChild = doc.body && doc.body.firstChild;
				if(firstChild && /pre/i.test(firstChild.tagName)) {
					responseText = firstChild.textContent;
				}
				else {
					responseText = doc.body.innerHTML;
				}

				successful = true;
			}
		}
		catch(e) {
			responseText = '{"errMsg":"'+ e.message + '"}';
		}

		var compEvent = cmp.getEvent('uploadCompleted');
		compEvent.setParams({
			'responseText' : responseText,
			'status' : 200,
			'successful' : successful,
			'aborted' : false
		});
		compEvent.fire();
	},"createHiddenInputs":function(params) {
		var fragment = document.createDocumentFragment();

		if (!params) {
			return fragment;
		}

		for(var name in params) {
			var input = document.createElement("INPUT");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", name);
			input.setAttribute("value", params[name]);

			fragment.appendChild(input);
		}

		return fragment;
	}}}},"controllerDef":{"serId":70,"value":{"descriptor":"compound://setup.diInvisibleFileUploader","actionDefs":[{"serId":71,"value":{"descriptor":"js://setup.diInvisibleFileUploader/ACTION$upload","name":"upload","code":function(cmp, event, helper) {
		var attrs = cmp.getAttributes();
		var url = attrs.getValue('url').getValue();

		if (helper.supportFileApi()) {
			var formData = helper.getFormData(cmp);

			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener('progress', function(e) { helper.uploadProgress(cmp, e); }, false);
			xhr.addEventListener('load', function(e) { helper.uploadFinish(cmp, e); }, false);
			xhr.addEventListener('error', function(e) { helper.uploadError(cmp, e); }, false);
			xhr.addEventListener('abort', function(e) { helper.uploadAbort(cmp, e); }, false);
			xhr.open('POST', url);
			xhr.send(formData);
		}
		else {
			var formCmp = attrs.getValue("form").getValue();
			var id = formCmp.getGlobalId();
			var form = formCmp.getElement();
			
			var iframe = helper.createHiddenIFrame(id);
			document.body.appendChild(iframe);


			var onLoad = function(e) {
				helper.onUploadComplete(cmp, e, iframe);

				
				setTimeout(function() {
					$A.util.removeOn(iframe, "load", onLoad);
					iframe.parentNode.removeChild(iframe);
				}, 10);
			};
			$A.util.on(iframe, "load", onLoad);
			
			form.setAttribute("target", id);
			form.setAttribute("action", url);
			
			
			var additionalParams = {
				"isIFrame": "true"
			};
			form.appendChild(helper.createHiddenInputs(additionalParams));

			form.submit();
		}
	},"actionType":"CLIENT"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7},{"serId":72,"value":{"descriptor":"files","typeDefDescriptor":"apex://object","required":false,"visibility":"PUBLIC"}},{"serId":73,"value":{"descriptor":"names","typeDefDescriptor":"apex://string[]","required":false,"visibility":"PUBLIC"}},{"serId":74,"value":{"descriptor":"url","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":75,"value":{"descriptor":"form","typeDefDescriptor":"aura://Aura.Component","required":false,"visibility":"PUBLIC"}},{"serId":76,"value":{"descriptor":"upload","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}}],"interfaces":["markup://setup:diFileUploader"],"registerEventDefs":[{"serId":77,"value":{"eventDef":{"serId":78,"value":{"descriptor":"markup://setup:diFileUploadProgress","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"bytesUploaded":{"serId":79,"value":{"descriptor":"bytesUploaded","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},"bytesTotal":{"serId":80,"value":{"descriptor":"bytesTotal","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},"percentComplete":{"serId":81,"value":{"descriptor":"percentComplete","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}}}}},"attributeName":"uploadProgress","isGlobal":false}},{"serId":82,"value":{"eventDef":{"serId":83,"value":{"descriptor":"markup://setup:diFileUploadCompleted","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"responseText":{"serId":84,"value":{"descriptor":"responseText","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"status":{"serId":85,"value":{"descriptor":"status","typeDefDescriptor":"apex://integer","required":false,"visibility":"PUBLIC"}},"successful":{"serId":86,"value":{"descriptor":"successful","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}},"aborted":{"serId":87,"value":{"descriptor":"aborted","typeDefDescriptor":"apex://boolean","required":false,"visibility":"PUBLIC"}}}}},"attributeName":"uploadCompleted","isGlobal":false}}],"handlerDefs":[{"serId":88,"value":{"action":{"exprType":"PROPERTY","path":["c","upload"]},"value":{"exprType":"PROPERTY","path":["v","upload"]},"name":"change"}}]}},{"serId":89,"value":{"descriptor":"markup://setup:qiAccountsAndContacts","helperDef":{"serId":90,"value":{"descriptor":"js://setup.qiAccountsAndContacts","functions":{"initiateUpload":function(uploadCmp, params) {
		var files = params.files;
		var names = [];
		for (var i = 0; i < files.length; i++) {
			names[names.length] = 'file'; 
		}

		var attrs = uploadCmp.getAttributes();
		attrs.setValue('files', files);
		attrs.setValue('form', params.form);
		attrs.setValue('names', names);
		attrs.setValue('url', params.url);
		attrs.setValue('upload', true);
	},"getDataSource":function(cmp) {
        var source = cmp.getValue('v.source').getValue();
        var sourceLabels = {
            outlook: "{!$Label.diCsvSelectionActivity.outlook}",
            gmail: "{!$Label.diCsvSelectionActivity.gmail}",
            linkedIn: "{!$Label.diCsvSelectionActivity.linkedIn}",
            act: "{!$Label.diCsvSelectionActivity.act}"
        };

        return $A.expressionService.getValue(cmp, sourceLabels[source]).getValue();
    },"showSuccess":function(cmp) {
		var message = $A.expressionService.getValue(cmp, '{!$Label.quickimport.confirmationLabel}').getValue();
		cmp.getAttributes().getValue('message').setValue(message);
		cmp.find('message').setValue("v.severity", 'confirm');
	},"setLoadingViewState":function(cmp) {
		this.setViewState(cmp, 'loading');
	},"setSelectedViewState":function(cmp) {
		this.setViewState(cmp, 'selected');
	},"setViewState":function(cmp, viewState) {
		var source = cmp.getValue('v.source').getValue();
		var list = cmp.find('dataSourceList');
		var sourceCmp = list.find(this.localIdBySource[source]);

		sourceCmp.getSuper().getValue('v.viewState').setValue(viewState);
	},"initiateGmailImport":function(cmp, params) {
		var action = cmp.get('c.importGmailContacts');
		action.setAbortable();
		action.setParams(params);
		action.setCallback(cmp, this.onImportCallback(cmp));

		return action;
	},"collapseDataSources":function(cmp, matcherFn) {
        if(!matcherFn) {
            return;
        }
        var list = cmp.find('dataSourceList');
        var sourceCmp;

        
        for(var source in this.localIdBySource) {
            sourceCmp = list.find(this.localIdBySource[source]);
            if(sourceCmp && matcherFn(sourceCmp)){
                var action = sourceCmp.get('c.collapse');
                if(action) {
                    action.run();
                }
            }
        }
    },"onImportCallback":function(cmp) {
		var helper = this;

		return function(action) {
			if (action.getState() === 'ERROR') {
				helper.showError(cmp, action.getError()[0].message);
				helper.setSelectedViewState(cmp);
			}
			else {
				helper.showSuccess(cmp);
				helper.setDoneViewState(cmp);
			}
		};
	},"setInitialViewState":function(cmp) {
		this.setViewState(cmp, 'initial');
	},"setDoneViewState":function(cmp) {
		this.setViewState(cmp, 'done');
	},"showError":function(cmp, message) {
		cmp.getAttributes().getValue('message').setValue(message);
		cmp.find('message').setValue("v.severity", 'error');
	},"initiateCsvImport":function(cmp, encoding) {
		var action = cmp.get('c.initiateCsvImport');
		action.setAbortable();
		action.setParams({
			'encoding' : encoding,
			'dataSource' : this.getDataSource(cmp)
		});
		action.setCallback(cmp, this.onImportCallback(cmp));

		return action;
	},"localIdBySource":{"linkedIn":"linkedIn","outlook":"outlook","gmail":"gmail","act":"act"}}}},"styleDef":{"serId":91,"value":{"descriptor":"css://setup.qiAccountsAndContacts","code":".setupQiAccountsAndContacts{padding:20px;font-family:'Helvetica Neue',Helvetica,Arial}.setupQiAccountsAndContacts.mask.fadeIn{background:#ffffff;-ms-filter:alpha(opacity=60);filter:alpha(opacity=60);opacity:.6}.setupQiAccountsAndContacts.uiDialog.dialog.default{color:#3a4c5c;background:#f4f5f6;border:1px solid #d8d9d9;border-radius:3px;box-shadow:5px 5px 5px rgba(0,0,0,.16)}.setupQiAccountsAndContacts.uiDialog.modal{top:15%}.setupQiAccountsAndContacts.dialog.default .title{color:#3a4c5c;display:block;text-align:center;font-size:1.7em;font-weight:normal}.setupQiAccountsAndContacts.dialog.default .content{border:none;box-shadow:none;background-color:inherit;padding:0}.setupQiAccountsAndContacts.uiDialog .uiMessage{position:relative}.setupQiAccountsAndContacts.uiDialog .buttons{text-align:right}.setupQiAccountsAndContacts.uiDialog .buttons .uiButton{margin-left:8px;border:1px solid #c5c6c8;color:#757575;padding:4px 10px;font-size:1.367em;background:#eeeff0;box-shadow:none;text-shadow:none;font-weight:normal}.setupQiAccountsAndContacts.uiDialog .buttons .uiButton{border-radius:1px;box-shadow:1px 1px 1px rgba(0, 0, 0, .16);padding:4px 20px}.setupQiAccountsAndContacts.uiDialog .buttons .uiButton .label{color:#333}.setupQiAccountsAndContacts.uiDialog .buttons a{vertical-align:middle;padding:4px 10px;margin:4px 3px;display:inline-block;color:#1b75af;text-decoration:none;font-size:1.2em}.setupQiAccountsAndContacts.uiDialog .buttons a:hover{color:#1b75af;text-decoration:none}.setupQiAccountsAndContacts.uiDialog .close,.setupQiAccountsAndContacts.uiDialog .close:hover,.setupQiAccountsAndContacts.uiDialog .close:focus{background:url(/img/import/close.png) no-repeat center center;border-radius:1px;border:none;width:17px;height:17px}","className":"setupQiAccountsAndContacts"}},"controllerDef":{"serId":92,"value":{"descriptor":"compound://setup.qiAccountsAndContacts","actionDefs":[{"serId":93,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp, event, helper) {
        var params = event.getParams();

        
        if(params.viewState !== "selected") {
            return;
        }

        helper.collapseDataSources(cmp, function(sourceCmp) {
            return sourceCmp.get("v.source") !== params.source;
        });
    },"actionType":"CLIENT"}},{"serId":94,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$openDataImporter","name":"openDataImporter","code":function(cmp) {
		window.location = cmp.get('m.dataImporterAppLocation');
	},"actionType":"CLIENT"}},{"serId":95,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$uploadProgress","name":"uploadProgress","code":function(cmp, event) {

	},"actionType":"CLIENT"}},{"serId":96,"value":{"name":"initiateCsvImport","descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.AccountAndContactController/ACTION$initiateCsvImport","actionType":"SERVER","returnType":"java://java.lang.String","background":false,"caboose":false,"params":[{"serId":97,"value":{"name":"dataSource","type":"java://java.lang.String"}},{"serId":98,"value":{"name":"encoding","type":"java://java.lang.String"}}]}},{"serId":99,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$initiateGmailImport","name":"initiateGmailImport","code":function(cmp, event, helper) {
		cmp.getAttributes().setValue('source', 'gmail');

		this.runAfter(helper.initiateGmailImport(cmp, {
			code: event.getParam('code'),
			state: event.getParam('state'),
			csrfToken: event.getParam('csrfToken')
		}));

		helper.setLoadingViewState(cmp);
	},"actionType":"CLIENT"}},{"serId":100,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$fileSelected","name":"fileSelected","code":function(cmp, event, helper) {
		cmp.getAttributes().setValue('source', event.getParam('source'));

		var uploader = cmp.find('uploader');
		helper.initiateUpload(uploader, {
			files: event.getParam('files'),
			form: event.getParam('form'),
			url: cmp.get("m.uploadServletUrl")
		});

		helper.setLoadingViewState(cmp);
	},"actionType":"CLIENT"}},{"serId":101,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$uploadCompleted","name":"uploadCompleted","code":function(cmp, event, helper) {
		var successful = event.getParam('successful');
		var responseText = event.getParam('responseText');

        var response;
        try {
            response = Sfdc.JSON.parseWithCSRF(responseText);
        }
        catch(e){
            Sfdc.log("Invalid response for file upload. " + e);

            
            if (/ec=302/i.test(responseText)) {
                Sfdc.Url.navigateTo(window.location.href);
                return;
            }
        }

		if (successful && !("errMsg" in response)) {
			this.runAfter(helper.initiateCsvImport(cmp, response.encoding));
		}
		else {
			var uploadError = $A.expressionService.getValue(cmp, '{!$Label.quickimport.uploadError}').getValue();
			helper.showError(cmp, response && response.errMsg || uploadError);

			helper.setSelectedViewState(cmp);
		}

	},"actionType":"CLIENT"}},{"serId":102,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$triggerOpenDialog","name":"triggerOpenDialog","code":function(cmp, event) {
		var open = $A.get("e.ui:openDialog");
		var domEvent = event.getParam("triggerEvent");

		open.setParams({
			dialog : cmp.find("overlay"),
			triggerEvent: domEvent
		});
		open.fire();
	},"actionType":"CLIENT"}},{"serId":103,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$openDialog","name":"openDialog","code":function(cmp, event, helper) {
		
        cmp.setValue("v.message", null);
        helper.collapseDataSources(cmp, function(){
            return true;
        });
	},"actionType":"CLIENT"}},{"serId":104,"value":{"descriptor":"js://setup.qiAccountsAndContacts/ACTION$close","name":"close","code":function(cmp, event, helper) {
		var closeEvent = $A.get("e.ui:closeDialog");

		closeEvent.setParams({
			dialog : cmp.find("overlay"),
			confirmClicked : true
		});
		closeEvent.fire();
	},"actionType":"CLIENT"}},{"serId":105,"value":{"name":"importGmailContacts","descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.AccountAndContactController/ACTION$importGmailContacts","actionType":"SERVER","returnType":"java://java.lang.String","background":false,"caboose":false,"params":[{"serId":106,"value":{"name":"code","type":"java://java.lang.String"}},{"serId":107,"value":{"name":"state","type":"java://java.lang.String"}},{"serId":108,"value":{"name":"csrfToken","type":"java://java.lang.String"}}]}}]}},"modelDef":{"serId":109,"value":{"descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.AccountAndContactModel","members":[{"serId":110,"value":{"name":"dataImporterAppLocation","type":"java://java.lang.String"}},{"serId":111,"value":{"name":"uploadServletUrl","type":"java://java.lang.String"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7},{"serId":112,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":113,"value":{"descriptor":"message","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}}],"handlerDefs":[{"serId":114,"value":{"eventDef":{"serId":115,"value":{"descriptor":"markup://setup:qiOpenImportDialog","type":"APPLICATION","superDef":{"serId":116,"value":{"descriptor":"markup://aura:applicationEvent","type":"APPLICATION","attributes":{}}},"attributes":{"triggerEvent":{"serId":117,"value":{"descriptor":"triggerEvent","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}}}}},"action":{"exprType":"PROPERTY","path":["c","triggerOpenDialog"]}}},{"serId":118,"value":{"eventDef":{"serId":119,"value":{"descriptor":"markup://setup:qiImportGmailContacts","type":"APPLICATION","superDef":{"serRefId":116},"attributes":{"code":{"serId":120,"value":{"descriptor":"code","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},"state":{"serId":121,"value":{"descriptor":"state","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}},"csrfToken":{"serId":122,"value":{"descriptor":"csrfToken","typeDefDescriptor":"aura://String","required":false,"visibility":"PUBLIC"}}}}},"action":{"exprType":"PROPERTY","path":["c","initiateGmailImport"]}}},{"serId":123,"value":{"eventDef":{"serId":124,"value":{"descriptor":"markup://ui:openDialog","type":"APPLICATION","superDef":{"serRefId":116},"attributes":{"dialog":{"serId":125,"value":{"descriptor":"dialog","typeDefDescriptor":"aura://Aura.Component","required":false,"visibility":"PUBLIC"}},"triggerEvent":{"serId":126,"value":{"descriptor":"triggerEvent","typeDefDescriptor":"aura://Object","required":false,"visibility":"PUBLIC"}}}}},"action":{"exprType":"PROPERTY","path":["c","openDialog"]}}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serId":127,"value":"markup://ui:dialogManager"}},{"componentDef":{"serId":128,"value":"markup://ui:dialog"},"localId":"overlay","attributes":{"values":{"closeLabel":{"descriptor":"closeLabel","value":""},"description":{"descriptor":"description","value":{"exprType":"PROPERTY","path":["$Label","quickimport","windowTitle"]}},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","title"]}},"isModal":{"descriptor":"isModal","value":true},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"ne","args":[{"exprType":"PROPERTY","path":["v","message"]},null]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":1},"localId":"message","attributes":{"values":{"title":{"descriptor":"title","value":""},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","message"]}}}}}]},"strength":{"descriptor":"strength","value":1},"severity":{"descriptor":"severity","value":"info"}}}}]}}}},{"componentDef":{"serId":129,"value":{"descriptor":"markup://setup:qiDatasourceSelectorList","styleDef":{"serId":130,"value":{"descriptor":"css://setup.qiDatasourceSelectorList","code":".setupQiDatasourceSelectorList{border:solid 1px #d8d9d9;border-radius:3px;background-color:#fff}.setupQiDatasourceSelectorList.list{margin:20px 0;list-style:none;padding:0}.setupQiDatasourceSelectorList.list li{margin:0}.setupQiDatasourceSelectorList.list li.odd{border-top:solid 1px #d8d9d9;border-bottom:solid 1px #d8d9d9}.setupQiDatasourceSelectorList .source{position:relative;padding:25px 20px}.setupQiDatasourceSelectorList .source .label{font-weight:bold;font-size:1.33em;padding-left:50px;float:left;line-height:30px}.setupQiDatasourceSelectorList .source .detail{text-align:right;display:block}.setupQiDatasourceSelectorList .source a,.setupQiDatasourceSelectorList .source a:hover{text-decoration:none}.setupQiDatasourceSelectorList .source a.upload{color:#1b75af;font-weight:bold;font-size:1.33em;line-height:30px}.setupQiDatasourceSelectorList .outlook .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -10px}.setupQiDatasourceSelectorList .gmail .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -60px}.setupQiDatasourceSelectorList .linkedIn .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -110px}.setupQiDatasourceSelectorList .act .label{background:url(\"/img/import/import_sprite.png\") no-repeat 0 -160px}.setupQiDatasourceSelectorList .source .loading{padding:0 0 0 24px;border:none;font-weight:normal;font-size:1.33em;background:url('/setup/dataimporter/barloading.gif') left center no-repeat}.setupQiDatasourceSelectorList .source .help{color:#929ba3;display:block}","className":"setupQiDatasourceSelectorList"}},"controllerDef":{"serId":131,"value":{"descriptor":"compound://setup.qiDatasourceSelectorList","actionDefs":[{"serId":132,"value":{"descriptor":"js://setup.qiDatasourceSelectorList/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp, event) {
        var compEvent = cmp.getEvent('viewStateChanged');
        compEvent.setParams(event.getParams());
        compEvent.fire();
    },"actionType":"CLIENT"}},{"serId":133,"value":{"descriptor":"js://setup.qiDatasourceSelectorList/ACTION$fileSelected","name":"fileSelected","code":function(cmp, event, helper) {
		cmp.getAttributes().getValue('message').setValue(null);

		var compEvent = cmp.getEvent('fileSelected');
		compEvent.setParams({
			'files': event.getParam('files'),
			'fileDetails': event.getParam('fileDetails'),
			'fileName': event.getParam('fileName'),
			'fileType': event.getParam('fileType'),
			'fileSize': event.getParam('fileSize'),
			'source': event.getParam('source'),
			'form': event.getParam('form')
		});
		compEvent.fire();
	},"actionType":"CLIENT"}},{"serId":134,"value":{"descriptor":"js://setup.qiDatasourceSelectorList/ACTION$fileRejected","name":"fileRejected","code":function(cmp, event, helper) {

	},"actionType":"CLIENT"}}]}},"modelDef":{"serId":135,"value":{"descriptor":"java://ui.aura.components.setup.accountAndContactQuickImport.DatasourceSelectionModel","members":[{"serId":136,"value":{"name":"actHelpUrl","type":"java://java.lang.String"}},{"serId":137,"value":{"name":"linkedInHelpUrl","type":"java://java.lang.String"}},{"serId":138,"value":{"name":"outlookHelpUrl","type":"java://java.lang.String"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7}],"registerEventDefs":[{"serId":139,"value":{"eventDef":{"serId":140,"value":{"descriptor":"markup://setup:qiDataSourceViewStateChanged","type":"COMPONENT","superDef":{"serRefId":28},"attributes":{"source":{"serId":141,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}},"viewState":{"serId":142,"value":{"descriptor":"viewState","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}}}}},"attributeName":"viewStateChanged","isGlobal":false}},{"serId":143,"value":{"eventDef":{"serId":144,"value":{"descriptor":"markup://setup:diCsvFileSelected","type":"COMPONENT","superDef":{"serRefId":58},"attributes":{"encoding":{"serId":145,"value":{"descriptor":"encoding","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileType":{"serRefId":62},"form":{"serRefId":64},"source":{"serId":146,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},"fileSize":{"serRefId":63},"files":{"serRefId":59},"fileName":{"serRefId":61},"fileDetails":{"serRefId":60}}}},"attributeName":"fileSelected","isGlobal":false}},{"serId":147,"value":{"eventDef":{"serRefId":66},"attributeName":"fileRejected","isGlobal":false}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":148,"value":{"descriptor":"markup://setup:qiCsvFileSelector","styleDef":{"serId":149,"value":{"descriptor":"css://setup.qiCsvFileSelector","code":".setupQiCsvFileSelector a,.setupQiCsvFileSelector a:hover{color:#1b75af}.setupQiCsvFileSelector a.cancel{color:#333;font-weight:bold;margin-right:10px}.setupQiCsvFileSelector .upload-wrapper{display:inline-block;position:relative;cursor:pointer;overflow:hidden}.setupQiCsvFileSelector .upload-wrapper form{position:absolute;top:0;right:0;-ms-filter:alpha(opacity=0);filter:alpha(opacity=0);opacity:0}.setupQiCsvFileSelector .upload-wrapper input{height:30px;font-size:100px;cursor:pointer}.setupQiCsvFileSelector .browse-button{padding:.6em 1.2em;background-color:#1b75af;border:1px solid #c5c6c8;border-radius:3px;cursor:pointer;color:#fff;font-weight:bold;text-align:center;display:inline-block}.setupQiCsvFileSelector .detail .status{display:block;margin:10px 0;font-weight:bold}","className":"setupQiCsvFileSelector"}},"controllerDef":{"serId":150,"value":{"descriptor":"compound://setup.qiCsvFileSelector","actionDefs":[{"serId":151,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp, event) {
		cmp.getValue('v.message').setValue('');
	},"actionType":"CLIENT"}},{"serId":152,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$openHelp","name":"openHelp","code":function(cmp, event, helper) {
		var url = cmp.getValue("v.helpUrl").getValue();

		if (url) {
			openPopupFocusEscapePounds(decodeURIComponent(url), 'Help');
		}
	},"actionType":"CLIENT"}},{"serId":153,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$fileSelected","name":"fileSelected","code":function(cmp, event, helper) {
		var attrs = cmp.getAttributes();

		attrs.getValue('message').setValue(event.getParam('fileName'));

		var compEvent = cmp.getEvent('fileSelected');
		compEvent.setParams({
			'files': event.getParam('files'),
			'fileDetails': event.getParam('fileDetails'),
			'fileName': event.getParam('fileName'),
			'fileType': event.getParam('fileType'),
			'fileSize': event.getParam('fileSize'),
			'source': attrs.getValue('source').getValue(),
			'form': event.getParam('form')
		});
		compEvent.fire();
	},"actionType":"CLIENT"}},{"serId":154,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$expand","name":"expand","code":function(cmp, event) {
		cmp.getSuper().getValue('v.viewState').setValue('selected');
	},"actionType":"CLIENT"}},{"serId":155,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$fileRejected","name":"fileRejected","code":function(cmp, event, helper) {
		var errors = event.getParam('errors');
		var error = errors.getValue(0);
		var message = error.getValue('message').getValue();

		var errorMessage = null;
		if (message === 'multipleSelectionDisabled') {
			errorMessage = $A.expressionService.getValue(cmp, '{!$Label.diFileSelector.multipleSelectionDisabled}').getValue();
		}
		else if (message === 'maximumSizeExceeded') {
			errorMessage = $A.expressionService.getValue(cmp, '{!$Label.diFileSelector.maximumSizeExceeded}').getValue();
		}
		else if (message === 'mimeTypeNotAccepted') {
			errorMessage = $A.expressionService.getValue(cmp, '{!$Label.diFileSelector.mimeTypeNotAccepted}').getValue();
		}

		cmp.getAttributes().getValue('message').setValue(errorMessage);
	},"actionType":"CLIENT"}},{"serId":156,"value":{"descriptor":"js://setup.qiCsvFileSelector/ACTION$collapse","name":"collapse","code":function(cmp, event) {
        
        
        var viewState = cmp.getSuper().getValue('v.viewState');
        if(viewState.getValue() === 'selected') {
		    viewState.setValue('initial');
        }
	},"actionType":"CLIENT"}}]}},"modelDef":{"serId":157,"value":{"descriptor":"java://ui.aura.components.setup.dataimporter.FileSelectionModel","members":[{"serId":158,"value":{"name":"actIconLocation","type":"java://java.lang.String"}},{"serId":159,"value":{"name":"csvIconLocation","type":"java://java.lang.String"}},{"serId":160,"value":{"name":"csvMimeType","type":"java://java.lang.String"}},{"serId":161,"value":{"name":"defaultFileEncoding","type":"java://java.lang.String"}},{"serId":162,"value":{"name":"fileEncodings","type":"java://java.util.List"}},{"serId":163,"value":{"name":"gmailIconLocation","type":"java://java.lang.String"}},{"serId":164,"value":{"name":"maxFileSizeBytes","type":"java://java.lang.Integer"}},{"serId":165,"value":{"name":"outlookIconLocation","type":"java://java.lang.String"}}]}},"superDef":{"serId":166,"value":{"descriptor":"markup://setup:qiDataSource","controllerDef":{"serId":167,"value":{"descriptor":"compound://setup.qiDataSource","actionDefs":[{"serId":168,"value":{"descriptor":"js://setup.qiDataSource/ACTION$viewStateChanged","name":"viewStateChanged","code":function(cmp) {
		var attr = cmp.getAttributes();
		var source = attr.getValue("source").getValue();
        var viewStateObj = attr.getValue("viewState");
		var viewState = viewStateObj.getValue();

        
        if(viewState === viewStateObj.oldValue) {
            return;
        }

		var compEvent = cmp.getEvent('viewStateChanged');
		compEvent.setParams({
			source: source,
			viewState: viewState
		});
		compEvent.fire();
	},"actionType":"CLIENT"}}]}},"superDef":{"serRefId":49},"attributeDefs":[{"serRefId":7},{"serId":169,"value":{"descriptor":"cssClass","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":170,"value":{"descriptor":"label","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}},{"serId":171,"value":{"descriptor":"source","typeDefDescriptor":"apex://string","required":true,"visibility":"PUBLIC"}},{"serId":172,"value":{"descriptor":"viewState","typeDefDescriptor":"apex://string","defaultValue":{"descriptor":"viewState","value":"initial"},"required":true,"visibility":"PUBLIC"}},{"serId":173,"value":{"descriptor":"initialContent","typeDefDescriptor":"aura://Aura.Component[]","required":true,"visibility":"PUBLIC"}},{"serId":174,"value":{"descriptor":"selectedContent","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":175,"value":{"descriptor":"loadingContent","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}},{"serId":176,"value":{"descriptor":"doneContent","typeDefDescriptor":"aura://Aura.Component[]","required":false,"visibility":"PUBLIC"}}],"registerEventDefs":[{"serId":177,"value":{"eventDef":{"serRefId":140},"attributeName":"viewStateChanged","isGlobal":false}}],"handlerDefs":[{"serId":178,"value":{"action":{"exprType":"PROPERTY","path":["c","viewStateChanged"]},"value":{"exprType":"PROPERTY","path":["v","viewState"]},"name":"change"}}],"facets":[{"descriptor":"body","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":179,"value":"markup://ui:outputText"},"attributes":{"values":{"class":{"descriptor":"class","value":"label"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","label"]}}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"initial"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serId":180,"value":"markup://aura:if"},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","initialContent","length"]},0.0]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"selected"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":180},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","selectedContent","length"]},0.0]}},"else":{"descriptor":"else","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","selectedContent"]}}}}}]}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"loading"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":180},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","loadingContent","length"]},0.0]}},"else":{"descriptor":"else","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","loadingContent"]}}}}}]}}}}]}}}},{"componentDef":{"serRefId":43},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"eq","args":[{"exprType":"PROPERTY","path":["v","viewState"]},"done"]}},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":180},"attributes":{"values":{"isTrue":{"descriptor":"isTrue","value":{"exprType":"FUNCTION","key":"gt","args":[{"exprType":"PROPERTY","path":["v","doneContent","length"]},0.0]}},"else":{"descriptor":"else","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","initialContent"]}}}}}]},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":45},"attributes":{"values":{"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["v","doneContent"]}}}}}]}}}}]}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"detail"}},"tag":{"descriptor":"tag","value":"div"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":{"exprType":"FUNCTION","key":"add","args":["source ",{"exprType":"PROPERTY","path":["v","cssClass"]}]}}},"tag":{"descriptor":"tag","value":"div"}}}}]}],"isAbstract":true}},"attributeDefs":[{"serRefId":7},{"serRefId":169},{"serRefId":170},{"serRefId":171},{"serRefId":172},{"serRefId":173},{"serRefId":174},{"serRefId":175},{"serRefId":176},{"serId":181,"value":{"descriptor":"message","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}},{"serId":182,"value":{"descriptor":"helpUrl","typeDefDescriptor":"apex://string","required":false,"visibility":"PUBLIC"}}],"registerEventDefs":[{"serRefId":177},{"serId":183,"value":{"eventDef":{"serRefId":144},"attributeName":"fileSelected","isGlobal":false}},{"serId":184,"value":{"eventDef":{"serRefId":66},"attributeName":"fileRejected","isGlobal":false}}],"handlerDefs":[{"serId":185,"value":{"action":{"exprType":"PROPERTY","path":["c","viewStateChanged"]},"name":"viewStateChanged"}}],"facets":[{"descriptor":"initialContent","value":[{"componentDef":{"serId":186,"value":"markup://ui:outputURL"},"attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","expand"]}},"class":{"descriptor":"class","value":"upload"},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","uploadLabel"]}},"value":{"descriptor":"value","value":"#"}}}}]},{"descriptor":"loadingContent","value":[{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"loading"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingLabel"]}}}}},{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"help"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingHelpLabel"]}}}}}]},{"descriptor":"selectedContent","value":[{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"localId":"cancel","attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","collapse"]}},"class":{"descriptor":"class","value":"cancel"},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","cancelLabel"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","cancelLabel"]}},"value":{"descriptor":"value","value":"#"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"attributes":{"values":{"class":{"descriptor":"class","value":"browse-button"},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","chooseFileLabel"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","chooseFileLabel"]}},"value":{"descriptor":"value","value":"#"}}}},{"componentDef":{"serRefId":46},"localId":"browse-inputFile","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"maxFileSizeBytes":{"descriptor":"maxFileSizeBytes","value":{"exprType":"PROPERTY","path":["m","maxFileSizeBytes"]}},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"multiple":{"descriptor":"multiple","value":false},"size":{"descriptor":"size","value":16}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"upload-wrapper"}},"tag":{"descriptor":"tag","value":"div"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{}},"tag":{"descriptor":"tag","value":"div"}}}},{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"status"},"value":{"descriptor":"value","value":{"exprType":"FUNCTION","key":"or","args":[{"exprType":"PROPERTY","path":["v","message"]},{"exprType":"PROPERTY","path":["$Label","quickimport","noFileSelected"]}]}}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":187,"value":"markup://aura:label"},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"localId":"help","attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","openHelp"]}},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["v","label"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["v","label"]}},"value":{"descriptor":"value","value":"#"}}}}]},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","uploadHelpLabel"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"help"}},"tag":{"descriptor":"tag","value":"div"}}}}]}],"hasServerDeps":true}},"localId":"outlook","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"source":{"descriptor":"source","value":"outlook"},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","outlookLabel"]}},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"cssClass":{"descriptor":"cssClass","value":"outlook"},"helpUrl":{"descriptor":"helpUrl","value":{"exprType":"PROPERTY","path":["m","outlookHelpUrl"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"even"}},"tag":{"descriptor":"tag","value":"li"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serId":188,"value":{"descriptor":"markup://setup:qiGmailContactSelector","styleDef":{"serId":189,"value":{"descriptor":"css://setup.qiGmailContactSelector","code":"","className":"setupQiGmailContactSelector"}},"controllerDef":{"serId":190,"value":{"descriptor":"compound://setup.qiGmailContactSelector","actionDefs":[{"serRefId":168},{"serId":191,"value":{"descriptor":"js://setup.qiGmailContactSelector/ACTION$connect","name":"connect","code":function(cmp, event, helper) {
		var url = UserContext.getUrl("/import/oauth_home.jsp?source=gmail");

		openwizard2(url, 'gmailOAuth', '1');
	},"actionType":"CLIENT"}}]}},"superDef":{"serRefId":166},"attributeDefs":[{"serRefId":7},{"serRefId":169},{"serRefId":170},{"serRefId":171},{"serRefId":172},{"serRefId":173},{"serRefId":174},{"serRefId":175},{"serRefId":176}],"registerEventDefs":[{"serRefId":177}],"facets":[{"descriptor":"initialContent","value":[{"componentDef":{"serRefId":186},"attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","connect"]}},"class":{"descriptor":"class","value":"upload"},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","connectLabel"]}},"value":{"descriptor":"value","value":"#"}}}}]},{"descriptor":"loadingContent","value":[{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"loading"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingLabel"]}}}}},{"componentDef":{"serRefId":179},"attributes":{"values":{"class":{"descriptor":"class","value":"help"},"value":{"descriptor":"value","value":{"exprType":"PROPERTY","path":["$Label","quickimport","loadingHelpLabel"]}}}}}]}]}},"localId":"gmail","attributes":{"values":{"source":{"descriptor":"source","value":"gmail"},"label":{"descriptor":"label","value":"Gmail"},"cssClass":{"descriptor":"cssClass","value":"gmail"},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"odd"}},"tag":{"descriptor":"tag","value":"li"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":148},"localId":"linkedIn","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"source":{"descriptor":"source","value":"linkedIn"},"label":{"descriptor":"label","value":"LinkedIn"},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"cssClass":{"descriptor":"cssClass","value":"linkedIn"},"helpUrl":{"descriptor":"helpUrl","value":{"exprType":"PROPERTY","path":["m","linkedInHelpUrl"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"even"}},"tag":{"descriptor":"tag","value":"li"}}}},{"componentDef":{"serRefId":44},"attributes":{"values":{"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":148},"localId":"act","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"source":{"descriptor":"source","value":"act"},"label":{"descriptor":"label","value":"Act!"},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"cssClass":{"descriptor":"cssClass","value":"act"},"helpUrl":{"descriptor":"helpUrl","value":{"exprType":"PROPERTY","path":["m","actHelpUrl"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"odd"}},"tag":{"descriptor":"tag","value":"li"}}}}]},"HTMLAttributes":{"descriptor":"HTMLAttributes","value":{"class":"list"}},"tag":{"descriptor":"tag","value":"ul"}}}}]}],"hasServerDeps":true}},"localId":"dataSourceList","attributes":{"values":{"fileSelected":{"descriptor":"fileSelected","value":{"exprType":"PROPERTY","path":["c","fileSelected"]}},"fileRejected":{"descriptor":"fileRejected","value":{"exprType":"PROPERTY","path":["c","fileRejected"]}},"viewStateChanged":{"descriptor":"viewStateChanged","value":{"exprType":"PROPERTY","path":["c","viewStateChanged"]}}}}},{"componentDef":{"serRefId":68},"localId":"uploader","attributes":{"values":{"uploadCompleted":{"descriptor":"uploadCompleted","value":{"exprType":"PROPERTY","path":["c","uploadCompleted"]}},"uploadProgress":{"descriptor":"uploadProgress","value":{"exprType":"PROPERTY","path":["c","uploadProgress"]}}}}}]},"buttons":{"descriptor":"buttons","value":[{"componentDef":{"serId":192,"value":"markup://ui:dialogButtons"},"localId":"buttons","attributes":{"values":{"defaultButtons":{"descriptor":"defaultButtons","value":"none"},"body":{"descriptor":"body","value":[{"componentDef":{"serRefId":186},"localId":"dataImporter","attributes":{"values":{"linkClick":{"descriptor":"linkClick","value":{"exprType":"PROPERTY","path":["c","openDataImporter"]}},"class":{"descriptor":"class","value":""},"title":{"descriptor":"title","value":{"exprType":"PROPERTY","path":["$Label","quickimport","dataImporterLabel"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","dataImporterLabel"]}},"value":{"descriptor":"value","value":"#"}}}},{"componentDef":{"serId":193,"value":"markup://ui:button"},"localId":"close","attributes":{"values":{"press":{"descriptor":"press","value":{"exprType":"PROPERTY","path":["c","close"]}},"label":{"descriptor":"label","value":{"exprType":"PROPERTY","path":["$Label","quickimport","doneLabel"]}}}}}]}}}}]},"clickOutToClose":{"descriptor":"clickOutToClose","value":false}}}}]}],"hasServerDeps":true}},{"serRefId":148},{"serRefId":166},{"serRefId":129},{"serRefId":188}],"eventDefs":[{"serRefId":144},{"serRefId":66},{"serRefId":58},{"serRefId":83},{"serRefId":78},{"serRefId":140},{"serRefId":119},{"serRefId":115}]},"actions":[{"id":"ais","state":"SUCCESS","returnValue":{"serId":194,"value":{"componentDef":"markup://setup:qiAccountsAndContacts","creationPath":"/*[0]","model":{"dataImporterAppLocation":"/setup/dataImporter.app","uploadServletUrl":"/_ui/core/dataimporter/servlet/DataImporterUploadServlet"}}},"error":[],"components":[{"serRefId":194},{"serId":195,"value":{"componentDef":"markup://force:message","creationPath":"/*[0]/$/*[1]/*[0]/*[0]"}},{"serId":196,"value":{"componentDef":"markup://setup:qiDatasourceSelectorList","creationPath":"/*[0]/$/*[1]/*[1]","model":{"actHelpUrl":"https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dexporting_from_act.htm%2526section%253Dimport_data%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com","linkedInHelpUrl":"https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dexporting_from_linkedin.htm%2526section%253Dimport_data%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com","outlookHelpUrl":"https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dexporting_from_outlook.htm%2526section%253Dimport_data%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com"}}},{"serId":197,"value":{"componentDef":"markup://setup:qiCsvFileSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[0]/*[0]","model":{"actIconLocation":"/setup/dataimporter/icon-act.png","csvIconLocation":"/setup/dataimporter/icon-csv.png","csvMimeType":"text/csv,application/csv,application/vnd.ms-excel","defaultFileEncoding":"ISO-8859-1","fileEncodings":[{"value":"ISO-8859-1","label":"ISO-8859-1（通用美语和西欧语言，ISO-LATIN-1）","default":false},{"value":"MS932","label":"Windows 日语","default":false},{"value":"Big5","label":"Big5 繁体中文","default":false},{"value":"JIS 自动选择","label":"日语（自动检测）","default":false},{"value":"UTF-8","label":"Unicode (UTF8)","default":false},{"value":"UTF-16","label":"Unicode (UTF16)","default":false},{"value":"EUC-KR","label":"KS C 5601 韩语","default":false},{"value":"GB2312","label":"GB2312 简体中文","default":false},{"value":"Big5-HKSCS","label":"Big5 繁体中文 (HKSCS)","default":false},{"value":"x-SJIS_0213","label":"日文 (Shift_JIS-2004)","default":false}],"gmailIconLocation":"/setup/dataimporter/icon-gmail.png","maxFileSizeBytes":52428800,"outlookIconLocation":"/setup/dataimporter/icon-outlook.png"}}},{"serId":198,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[0]/*[0]/$"}},{"serId":199,"value":{"componentDef":"markup://setup:diInputFile","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[0]/*[0]/$/selectedContent[0]/*[1]/*[1]"}},{"serId":200,"value":{"componentDef":"markup://setup:qiGmailContactSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[1]/*[0]"}},{"serId":201,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[1]/*[0]/$"}},{"serId":202,"value":{"componentDef":"markup://setup:qiCsvFileSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[2]/*[0]","model":{"actIconLocation":"/setup/dataimporter/icon-act.png","csvIconLocation":"/setup/dataimporter/icon-csv.png","csvMimeType":"text/csv,application/csv,application/vnd.ms-excel","defaultFileEncoding":"ISO-8859-1","fileEncodings":[{"value":"ISO-8859-1","label":"ISO-8859-1（通用美语和西欧语言，ISO-LATIN-1）","default":false},{"value":"MS932","label":"Windows 日语","default":false},{"value":"Big5","label":"Big5 繁体中文","default":false},{"value":"JIS 自动选择","label":"日语（自动检测）","default":false},{"value":"UTF-8","label":"Unicode (UTF8)","default":false},{"value":"UTF-16","label":"Unicode (UTF16)","default":false},{"value":"EUC-KR","label":"KS C 5601 韩语","default":false},{"value":"GB2312","label":"GB2312 简体中文","default":false},{"value":"Big5-HKSCS","label":"Big5 繁体中文 (HKSCS)","default":false},{"value":"x-SJIS_0213","label":"日文 (Shift_JIS-2004)","default":false}],"gmailIconLocation":"/setup/dataimporter/icon-gmail.png","maxFileSizeBytes":52428800,"outlookIconLocation":"/setup/dataimporter/icon-outlook.png"}}},{"serId":203,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[2]/*[0]/$"}},{"serId":204,"value":{"componentDef":"markup://setup:diInputFile","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[2]/*[0]/$/selectedContent[0]/*[1]/*[1]"}},{"serId":205,"value":{"componentDef":"markup://setup:qiCsvFileSelector","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[3]/*[0]","model":{"actIconLocation":"/setup/dataimporter/icon-act.png","csvIconLocation":"/setup/dataimporter/icon-csv.png","csvMimeType":"text/csv,application/csv,application/vnd.ms-excel","defaultFileEncoding":"ISO-8859-1","fileEncodings":[{"value":"ISO-8859-1","label":"ISO-8859-1（通用美语和西欧语言，ISO-LATIN-1）","default":false},{"value":"MS932","label":"Windows 日语","default":false},{"value":"Big5","label":"Big5 繁体中文","default":false},{"value":"JIS 自动选择","label":"日语（自动检测）","default":false},{"value":"UTF-8","label":"Unicode (UTF8)","default":false},{"value":"UTF-16","label":"Unicode (UTF16)","default":false},{"value":"EUC-KR","label":"KS C 5601 韩语","default":false},{"value":"GB2312","label":"GB2312 简体中文","default":false},{"value":"Big5-HKSCS","label":"Big5 繁体中文 (HKSCS)","default":false},{"value":"x-SJIS_0213","label":"日文 (Shift_JIS-2004)","default":false}],"gmailIconLocation":"/setup/dataimporter/icon-gmail.png","maxFileSizeBytes":52428800,"outlookIconLocation":"/setup/dataimporter/icon-outlook.png"}}},{"serId":206,"value":{"componentDef":"markup://setup:qiDataSource","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[3]/*[0]/$"}},{"serId":207,"value":{"componentDef":"markup://setup:diInputFile","creationPath":"/*[0]/$/*[1]/*[1]/$/*[0]/*[3]/*[0]/$/selectedContent[0]/*[1]/*[1]"}},{"serId":208,"value":{"componentDef":"markup://setup:diInvisibleFileUploader","creationPath":"/*[0]/$/*[1]/*[2]"}}]}]};
$A.run(function() { $A.clientService.injectComponent(config, "walkthrough-quick-import", "quickImport"); });
</script>
    <div id="presence_widget" class="presence_chat_widget">
        <div id="chat_dock_pane" class="chat_dock_pane" style="display: block;">
            <div id="chat_dock_bg_pane" class="float_right">
                <div class="chat_dock_pane_group" id="presence_chat_container">
                </div>
                <div class="chat_dock_pane_group" id="presence_chat_dock">
                </div>
                <div class="chat_dock_pane_group chat_buddy_list_pane" id="presence_main">
                    <div class="chat_buddy_list_main_box main_box_shadow" id="presence_buddylist">
                        <div class="chat_buddy_list_main_inner">
                            <div class="presence_buddylist_header" id="presence_widgetstatus" tabindex="0">
                                <div class="presence_buddylist_header_inner" id="presence_buddylist_status">
                                    <span class="roster_title_collapsed" id="roster_title_collapsed">
                                        <img title="弹出" class="pop_out_chat minimized float_right" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                            id="popout_chat_min" tabindex="0" alt="弹出"><span class="hide" id="chat_roster_collapsed_disconnect"><img
                                                width="16" height="12" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/spinner_16_174.gif"
                                                alt="loader" class="chat_error float_right">正在连接...</span><span class="active" id="presence_buddylist_presence_status"><img
                                                    src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                    class="roster_header_min_icon float_left" alt="null"></span><img src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                        class="chat_buddy_status_img float_right hide" alt="roster_title_collapsed"><span
                                                            title="新消息" class="newMessages_roster hide" id="buddy_list_notify"></span><span class="buddy_list_min_text"
                                                                id="buddy_list_min_text">聊天 </span></span><span class="roster_title_expanded" id="roster_title_expanded">
                                                                    <img style="display: block;" title="弹出" class="pop_out_chat float_right" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                                        id="popout_chat" tabindex="0" alt="弹出"><img style="display: none" title="弹出" class="popout_chat_win float_right hide"
                                                                            src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                                            id="popout_chat_win" alt="弹出"><a class="chat_feedback_link float_right hide" id="chat_feedback_link"
                                                                                href="http://uesurveys.salesforce.com/collector/Survey.ashx?Name=Chat_feedback_survey_pilot"
                                                                                target="_blank">有意见反馈？</a><img title="聊天" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                                                    class="roster_header_icon float_left" alt="聊天"><div class="buddy_list_max_text">
                                                                                        聊天</div>
                                                                </span>
                                </div>
                            </div>
                            <div class="chat_buddy_list_content_wrapper">
                                <div class="chat_buddy_list_menus" id="chat_buddy_list_menus">
                                    <span id="options_mink_menu_id" class="options_mink_menu float_left" tabindex="0"><a
                                        title="更改您的状态" class="roster_menu_btn" onclick="return false;" href="javascript:void(0);"
                                        tabindex="-1" id="presence_status_options_btn"><span class="active" id="buddylist_presence_status">
                                            <img border="0" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                alt="active" class="chat_buddy_status_img float_left"></span><span class="underline_hover"
                                                    id="buddylist_presence_text">可以聊天</span><img border="0" class="down_arrow" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                        alt="更改您的状态"></a></span><ul tabindex="513" class="options_menu menu_box_shadow hide"
                                                            id="presence_status_options" role="listbox" style="outline: 0px none;">
                                                            <li class="presence_mink"><a class="roster_menu_btn"><span class="active" id="buddylist_presence_status_mink">
                                                                <img border="0" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                                    alt="active" class="chat_buddy_status_img float_left"></span><span class="underline_hover"
                                                                        id="buddylist_presence_text_mink">可以聊天</span><img class="down_arrow" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                                            alt="null"></a></li><li tabindex="1" class="menu_box_list active" presencestat="AVAILABLE"
                                                                                id="optAvailable">
                                                                                <img border="0" alt="active" class="chat_buddy_status_img float_left" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png">
                                                                                可以聊天 </li>
                                                            <li tabindex="1" class="menu_box_list away" presencestat="AWAY" id="optAway">
                                                                <img border="0" alt="active" class="chat_buddy_status_img float_left" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png">
                                                                离开 </li>
                                                            <li tabindex="1" class="menu_box_list offline" presencestat="UNAVAILABLE" id="optUnavailable">
                                                                <img border="0" alt="active" class="chat_buddy_status_img float_left" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png">
                                                                离线 </li>
                                                        </ul>
                                    <a href="javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_chat_using.htm%2526section%253DCollaboration%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                        tabindex="505" id="umpswidget_help_icon">
                                        <img title="帮助" class="help_grey_icon image_hover float_right" id="help_grey_icon_id"
                                            src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                            tabindex="0" alt="帮助"></a><a class="roster_menu_btn roster_menu_btn_right" id="optionsMenuBtn"><img
                                                title="选项" class="gear_icon image_hover float_right" id="settings_menu_btn" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                tabindex="0" alt="选项"></a><a class="roster_menu_btn roster_menu_btn_right" id="HistoryListBtn"><img
                                                    title="ViewHistory" id="history_icon_id" class="history_icon image_hover float_right"
                                                    src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                    tabindex="0" alt="ViewHistory"></a><ul id="settings_menu_boxId" class="settings_menu menu_box_shadow hide"
                                                        tabindex="1" role="listbox" style="outline: 0px none;">
                                                        <li class="lightGreyTxt menu_list_li">在聊天列表中显示</li><li class="menu_box_list" tabindex="1">
                                                            <span class="tick"></span>我的收藏</li><li class="menu_box_list"><span class="tick"></span>
                                                                我追随的人</li><li class="menu_box_list"><span class="tick"></span>离线人员</li><div class="blueHR">
                                                                </div>
                                                        <li class="menu_box_list"><span class="tick"></span>播放声音</li><li class="menu_box_list">
                                                            <span class="tick"></span>显示表情符号</li><div class="blueHR">
                                                            </div>
                                                        <li class="menu_box_list"><a class="decoration_none" onclick="return false;" href="javascript:void(0);">
                                                            <span class="tick"></span>选项...</a></li></ul>
                                </div>
                                <div id="chat_buddy_list_content_box">
                                    <div class="chat_buddy_search_container" id="chat_buddy_search_container">
                                        <div id="chat_buddy_roster_search" class="chat_buddy_search">
                                            <span title="清除搜索" class="chat_buddy_search_close float_right hide" id="chat_buddy_search_close">
                                            </span><span title="搜索" class="chat_buddy_search_icon float_left"></span>
                                            <label class="assistiveText" for="presence_buddy_search">
                                                查找人物...</label><input type="text" title="搜索" maxlength="120" value="查找人物..." id="presence_buddy_search"
                                                    class="lightGreyTxt input_default"></div>
                                        <div class="chat_buddy_roster_disconnect hide" id="chat_buddy_roster_disconnect">
                                            <img width="16" height="12" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/spinner_16_174.gif"
                                                alt="loader" class="chat_error float_right">正在连接...</div>
                                    </div>
                                    <div class="fav_popup_holder hide" id="fav_popup_holder">
                                    </div>
                                    <div class="fake_headers_holder hide" id="fake_headers_holder">
                                        <div class="followedList hide" id="umps_convList_dummy">
                                            <div class="followedList_inner">
                                                <div class="newMessages expanded headers hide" id="curConv_list_notify_dummy">
                                                </div>
                                                <img src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                    class="down_arrow" alt="null">当前会话</div>
                                        </div>
                                        <div class="followedList hide" id="umps_favorites_dummy">
                                            <div class="followedList_inner">
                                                <div id="fav_edt_btns_dummy">
                                                    <div title="编辑" class="fav_edit_btn float_right hide" id="umps_fav_edit_dummy">
                                                        编辑</div>
                                                    <div title="完成" class="fav_edit_btn float_right hide" id="umps_fav_done_dummy">
                                                        完成</div>
                                                </div>
                                                <img src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                    class="down_arrow" id="fav_arrow_dummy" alt="null">我的收藏</div>
                                        </div>
                                        <div class="followedList hide" id="followedList_dummy">
                                            <div class="followedList_inner">
                                                <img src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                    class="down_arrow" id="follow_arrow_dummy" alt="null">我追随的人</div>
                                        </div>
                                        <div class="followedList hide" id="searchList_dummy">
                                            <div class="followedList_inner">
                                                <img src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                    class="down_arrow" alt="null">每个人</div>
                                        </div>
                                    </div>
                                    <div class="chat_buddy_list_content_box content_box_shadow buddy_scroll_pane" id="buddyScrollPane">
                                        <div class="buddy_scroll_pane_content" id="buddyScrollPane_content">
                                            <div class="followedList expanded hide" id="umps_convList" tabindex="0">
                                                <div class="followedList_inner">
                                                    <div title="新消息" class="newMessages headers hide" id="curConv_list_notify">
                                                    </div>
                                                    <img title="折叠" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                        class="down_arrow" id="conv_arrow_image" alt="折叠">当前会话</div>
                                            </div>
                                            <div class="chat_buddy_list_body hide" id="umps_convlist_body" tabindex="0" role="listbox">
                                            </div>
                                            <div class="followedList" id="umps_favorites" tabindex="0">
                                                <div class="followedList_inner">
                                                    <div title="编辑" class="fav_edit_btn float_right hide" id="umps_fav_edit" tabindex="0">
                                                        编辑</div>
                                                    <div title="完成" class="fav_edit_btn float_right hide" id="umps_fav_done" tabindex="0">
                                                        完成</div>
                                                    <img title="折叠" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                        class="down_arrow" id="favorites_arrow_image" alt="折叠">我的收藏</div>
                                            </div>
                                            <div class="chat_buddy_list_body" id="umps_favorites_body" tabindex="0" role="listbox">
                                                <div class="umps_favorites_empty">
                                                    将人物拖至此处...</div>
                                            </div>
                                            <div class="followedList" id="followedList" tabindex="0">
                                                <div class="followedList_inner">
                                                    <img title="折叠" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                        class="down_arrow" id="follow_arrow_image" alt="折叠">我追随的人<span class="hide"> (<span
                                                            id="followedListCount">0 / 0</span>)</span></div>
                                            </div>
                                            <div id="jiffy_tocsv" class="hide">
                                                test</div>
                                            <div class="chat_buddy_list_body last" id="presence_buddylist_body" tabindex="0"
                                                role="listbox">
                                                <div class="presence_buddylist_empty" id="presence_buddylist_empty">
                                                    没有人可以聊天。</div>
                                            </div>
                                            <div class="followedList hide" id="user_searchlist" tabindex="0">
                                                <div class="followedList_inner">
                                                    <img title="折叠" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                        class="down_arrow" id="search_arrow_image" alt="折叠">每个人</div>
                                            </div>
                                            <div class="chat_buddy_list_body last hide" id="user_searchlist_body" tabindex="0"
                                                role="listbox">
                                            </div>
                                        </div>
                                        <div class="scrollbar_holder hide">
                                            <div class="scroll_drag">
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
    <script type="text/javascript">var umpsHttpGateWay=function(d){var g=function(){if(window.XMLHttpRequest){return new window.XMLHttpRequest()}else{try{return new ActiveXObject("MSXML2.XMLHTTP.3.0")}catch(j){}}return null};var h=function(m,l){if(!m){return}var k=[];for(var n in m){k.push(n+"="+encodeURIComponent(m[n]))}var j=(l?"?":"")+k.join("&amp;");return j};var a=d.url;var b=g();var f="";var c=a;if(d.data&&d.method=="POST"){f=h(d.data,false)}if(d.data&&d.method==="GET"){f=h(d.data,a.indexOf("?")===-1);c=a+f}b.open(d.method,c,true);if(d.headers){for(key in d.headers){try{if(d.headers.hasOwnProperty(key)){b.setRequestHeader(key,d.headers[key])}}catch(e){alert(e)}}}var i=b.send(f);b.onreadystatechange=function(){if(b.readyState===4){var j=b.status;if(j&gt;=200&&j<300||j===304){d.success(b.responseText)}else{d.failure(b.responseText)}d.success=d.failure=d.beforerequest=null}}};</script>
    <script type="text/javascript">        var umpsdoPageReload = function () { document.location.href = document.location.href; }</script>
    <object width="1" height="1" type="application/x-shockwave-flash" data="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/message_alert_new.swf"
        id="umps_audible_div" style="visibility: visible;">
        <param name="allowscriptaccess" value="always">
    </object>
    <div id="umps_tooltip" class="presence_chat_widget tooltip hide" style="display: none;">
    </div>
    <div class="presence_chat_overlay">
        <div class="main_panel" style="width: 650px; height: 400px;">
            <div class="overlay_top_right">
                <a onclick="return false;" href="javascript:void(0);" id="overlayPanelFocusElement">
                </a>
                <div class="overlay_top_left">
                    <span class="chat_close_wrap" title="关闭">
                        <img src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                            alt="关闭" class="chat_close"></span>选项</div>
            </div>
            <div class="overlay_middle">
                <div class="overlay_inner_content">
                    <div>
                        <div align="center" class="pref_loader_mak hide">
                        </div>
                        <div align="right" class="help_icon_holder">
                            <a title="帮助" href="javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_chat_options_dialog.htm%2526section%253DCollaboration%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                id="help_chat_options">
                                <div class="float_right help_grey_icon">
                                </div>
                                帮助</a></div>
                        <div>
                            <div class="overlay_btns_pnl float_left">
                                <ul>
                                    <li class="overlay_tab_btns active"><a class="outline_none" onclick="return false;"
                                        href="javascript:void(0);">一般设置</a></li><li class="overlay_tab_btns"><a class="outline_none"
                                            tabindex="-1" onclick="return false;" href="javascript:void(0);">声音和通知</a></li><li
                                                class="overlay_tab_btns"><a class="outline_none" tabindex="-1" onclick="return false;"
                                                    href="javascript:void(0);">聊天列表</a></li></ul>
                            </div>
                            <div class="overlay_tabs_pnl">
                                <div class="overlay_tab_content active">
                                </div>
                                <div class="overlay_tab_content">
                                </div>
                                <div class="overlay_tab_content">
                                </div>
                            </div>
                        </div>
                        <div align="center" class="pref_error_text hide">
                        </div>
                        <div align="center" class="overlay_btm_btns_pnl">
                            <label class="assistiveText" for="pref_saveBtn_id">
                            </label>
                            <input type="submit" id="pref_saveBtn_id" class="overlay_btn" value="保存"><label class="assistiveText"
                                for="pref_canceBnt_id"></label><input type="submit" id="pref_canceBnt_id" class="overlay_btn"
                                    value="取消"></div>
                    </div>
                </div>
            </div>
            <div class="overlay_bottom_right">
                <div class="overlay_bottom_left">
                </div>
            </div>
        </div>
    </div>
    <div class="presence_chat_overlay_mask overlay_mask">
    </div>
    <div class="presence_chat_widget chat_timestamp">
    </div>
    <div class="presence_chat_widget umps_popup_panel hide" style="height: auto; display: none;">
        <div class="chat_search_header">
            <span class="chat_close_wrap" title="关闭">
                <img id="presence_umps_119_popup_close" class="chat_close" alt="关闭" src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"></span><span
                    id="presence_umps_119_popup_hdr_txt"></span></div>
        <div id="umps_119">
        </div>
        <div class="umps_popup_toolbar">
        </div>
        <div class="umps_popup_arrow">
        </div>
    </div>
</body>
</html>
