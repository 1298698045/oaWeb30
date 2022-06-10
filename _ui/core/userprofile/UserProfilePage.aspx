<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfilePage.aspx.cs"
    Inherits="WebClient._ui.core.userprofile.UserProfilePage" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="" class="ext-strict  ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>用户：liu jack ~ Salesforce.com - Developer Edition</title>
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/elements.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/common.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterBreadcrumbs.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/userProfilePage.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/profileSkills.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/knowledgeableWidget.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <script type="text/javascript">
//<![CDATA[
try{(function(){var w=self,l,p,o;if(w&&top){for(;w!==top&&(p=w.parent)&&p!==w&&(o=p.location)&&o.protocol===(l=w.location).protocol&&(o.host===l.host||(p.document&&p.document.domain===w.document.domain));w=p);if(w!==top)throw "";}({f:function(){document.documentElement?document.documentElement.style.display="":(!this.a&&(this.a=10),this.a<1E5&&(window.sfdcRetryShowWindow=this)&&setTimeout("sfdcRetryShowWindow.f()",this.a),this.a*=2)}}.f())})();}catch(e){if(top!==self)top.location=location;else throw e;}//]]&gt;</script>
    <script src="/EXT/ext-3.3.3/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/UmpsWidgetLoader.js"></script>
    <script src="/jslibrary/sfdc/UserProfile.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1413507464000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-10-22 下午4:54", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": false }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
</script>
    <script type="text/javascript">
        var MOTIF_KEY = 'UserProfile';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/chatterBreadcrumbs.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/userProfilePage.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/profileSkills.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/knowledgeableWidget.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1412230112000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413771514000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif userTab  UserProfilePage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table cellspacing="0" cellpadding="0" border="0" id="bodyTable" class="outerNoSidebar">
                <tbody>
                    <tr>
                        <td class="noSidebarCell">
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a><script>                                                                      chatter.getToolbox().setToken('ZQU7xOx_iTPqfTPHvdQXe4y.ieeYHZ9YlVPAfvOH5e_hwtAcu5WI5Mv6GedFxjKR4ukl_8QghiqYc8f0irL_U4xNgGQ7BENggmrQtPZt7j4DW6kk.9q2bVaNxrGSivHSAwwuDU8to589D1vA23WsTOm5nHc=');</script><div
                                        id="chatterTab" class="profilePage userProfilePage">
                                        <div class="profileHeaderContent zen">
                                            <div class="headerContent">
                                                <div class="profileHeader">
                                                    <div>
                                                        <div role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown" data-isselect="false"
                                                            class="zen-select" data-uidsfdc="76">
                                                            <a title="用户动作菜单" id="moderatorMutton" aria-haspopup="true" class="zen-trigger" href="javascript:void(0)"
                                                                data-uidsfdc="74"><b class="zen-selectArrow"></b>
                                                                <div class="test">
                                                                </div>
                                                            </a>
                                                            <ul role="menu" aria-labelledby="moderatorMutton" class="zen-options" data-uidsfdc="75">
                                                                <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" class="zen-firstItem"
                                                                    data-uidsfdc="71"><a title="我的设置" role="menuitem" id="USER_DETAIL" href="/ui/setup/Setup?setupid=PersonalSetup">
                                                                        <span>我的设置</span></a></li><li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option"
                                                                            data-uidsfdc="72"><a title="编辑简档" role="menuitem" href="javascript:SfdcApp.ChatterProfileSection.showDialog%28%27aboutMe%27%29">
                                                                                编辑简档</a></li><li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" class="zen-lastItem"
                                                                                    data-uidsfdc="73"><a title="此页面的帮助" role="menuitem" class="helpLinkElement" href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_profile_overview.htm%2526section%253DCollaboration%2526language%253Dzh_CN%2526release%253D192.8.8%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                                                                        此页面的帮助</a></li></ul>
                                                        </div>
                                                    </div>
                                                    <div>
                                                    </div>
                                                    <div class="clearingBox">
                                                    </div>
                                                </div>
                                                <div role="navigation" class="chatterBreadcrumbs">
                                                    <span id="headBreadcrumbNode"><a href="/_ui/core/chatter/ui/ChatterPage">Chatter</a></span><img
                                                        width="1" height="1" title="" class="breadcrumbSeparator breadcrumbSeparatorLtr"
                                                        alt="" src="/s.gif"><span id="interiorBreadcrumbNode0"><a href="/_ui/core/chatter/ui/ChatterPage?deepLinkType=listView&amp;deepLinkInfo=people">人员</a></span><img
                                                            width="1" height="1" title="" class="breadcrumbSeparator breadcrumbSeparatorLtr"
                                                            alt="" src="/s.gif"><span title="liu jack " id="tailBreadcrumbNode" class="tailNode cxTailNode">liu
                                                                jack&nbsp;<span id="presenceDot_0059000000390Wh" class="presenceDot"><img src="https://umps1t4.salesforce.com/umps/UMPSWidget_184/images/1pxDummy.png"
                                                                    class="green_dot_status_img" alt="undefined" id="presenceDot_0059000000390Wh_greenDot_Presence_0059000000390Wh"></span></span></div>
                                                <div class="clearingBox">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="leftContent">
                                            <div onmouseout="SfdcApp.ChatterProfilePhotoSection.showHideBadgeAndPhotoLinks(false)"
                                                onmouseover="SfdcApp.ChatterProfilePhotoSection.showHideBadgeAndPhotoLinks(true)"
                                                class="photoSection  hasPhotoLinks " id="photoSection">
                                                <span id="displayBadge" class="moderatorBadge">版主</span><span title="liu jack" class="chatter-avatar chatter-avatarFull profileImage"><img
                                                    title="liu jack" class="chatter-photo" alt="liu jack" src="https://c.ap1.content.force.com/profilephoto/005/F"><img
                                                        title="" class="chatter-avatarStyle" alt="" src="/s.gif"></span>
                                                <div class="photoUploadSection">
                                                    <a onfocus="SfdcApp.ChatterProfilePhotoSection.showHideBadgeAndPhotoLinks(true)"
                                                        onblur="SfdcApp.ChatterProfilePhotoSection.showHideBadgeAndPhotoLinks(false)"
                                                        id="uploadLink" href="javascript:void(0);" data-uidsfdc="65">添加照片</a>
                                                </div>
                                                <script>
                                                    Sfdc.onload(function () {
                                                        SfdcApp.ChatterProfileSection.init('uploadPhoto', '#uploadLink', "上载简档照片", "/userprofile/photo/upload.apexp?u=0059000000390Wh", 117, 400);
                                                    });
            </script>
                                            </div>
                                            <script type="text/javascript">
                                                whatToDoNext.accessibilityMode = false;
                                                whatToDoNext.logClicks = false;

                                                whatToDoNext.tabNameType = 'PROFILE';
                                                whatToDoNext.contextId = '0059000000390Wh';
				
</script>
                                            <li class="recElement todoElement ">
                                                <div id="todoItem" class="todoList">
                                                    <div id="listItem-addPhoto">
                                                        <a onclick="whatToDoNext.uploadPhoto();" href="javascript: void(0);">
                                                            <img alt="" src="/s.gif" class="recImage photo">
                                                            添加您的照片</a>
                                                        <p>
                                                            向人们展示您是谁。您可能会通过一张照片获得更多追随者！</p>
                                                        <div class="dismiss">
                                                            <a onclick="whatToDoNext.dismissThisItem('addPhoto', 'listItem-addPhoto');" href="javascript: void(0);">
                                                                跳过 &gt;</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <div class="contactInfo profileSection">
                                                <div class="vfButtonBar">
                                                    <h3>
                                                        联系人
                                                        <div class="vfButtonBarButton">
                                                            <div class="editPen">
                                                                <a class="contactInfoLaunch editLink" href="javascript:void(0);" data-uidsfdc="66">
                                                                    <img title="编辑简档" alt="编辑简档" src="/img/func_icons/util/pencil12.gif">
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </h3>
                                                    <script>
                                                        Sfdc.onload(function () {
                                                            SfdcApp.ChatterProfileSection.init('contactInfo', '.contactInfoLaunch ', "编辑简档", "/_ui/core/userprofile/ContactInfoEditPage?u=0059000000390Wh&amp;focus=email", 460, 670);
                                                        });
            </script>
                                                </div>
                                                <div class="profileSectionBody">
                                                    <div class="profileSectionData emailAddr">
                                                        <a href="mailto:jackliu185@sina.com">jackliu185@sina.com</a>
                                                    </div>
                                                    <div class="profileSectionData address">
                                                        <div class="profileSectionDataLine address">
                                                            CN
                                                        </div>
                                                        <div class="profileSectionDataLine address">
                                                            100000
                                                        </div>
                                                        <div class="profileSectionDataLine address">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="influenceBoxHeader">
                                                <h3>
                                                    贡献度 <span>
                                                        <img title="Info" tabindex="0" onmouseover="SfdcApp.InfluenceInfoHover.show(this, '0059000000390Wh');"
                                                            onmouseout="SfdcApp.InfluenceInfoHover.hide(this, '0059000000390Wh');" onfocus="SfdcApp.InfluenceInfoHover.show(this, '0059000000390Wh');"
                                                            onblur="SfdcApp.InfluenceInfoHover.hide(this, '0059000000390Wh');" class="influenceInfo"
                                                            alt="Info" src="/s.gif"></span>
                                                </h3>
                                            </div>
                                            <div class="influence-widget">
                                                观察者 <span class="influence-extra">0% 名用户中最具影响力的一位！ </span>
                                                <div class="influence-bar">
                                                    <div class="section observer highlight">
                                                    </div>
                                                    <div class="section active ">
                                                    </div>
                                                    <div class="section top ">
                                                    </div>
                                                    <div style="left: 2.0%;" class="marker">
                                                    </div>
                                                </div>
                                            </div>
                                            <table id="influenceBox" class="influence">
                                                <tbody>
                                                    <tr>
                                                        <td class="influenceSection border left">
                                                            <div class="influenceNumber">
                                                                1
                                                            </div>
                                                            <div title="个帖子或留言" class="influenceText">
                                                                个帖子或留言
                                                            </div>
                                                        </td>
                                                        <td class="influenceSection border">
                                                            <div class="influenceNumber dim">
                                                                0
                                                            </div>
                                                            <div title="个已收到留言" class="influenceText">
                                                                个已收到留言
                                                            </div>
                                                        </td>
                                                        <td class="influenceSection">
                                                            <div class="influenceNumber dim">
                                                                0
                                                            </div>
                                                            <div title="个已收到的赞" class="influenceText">
                                                                个已收到的赞
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="mainContent">
                                            <div id="centerContent" class="centerContent">
                                                <div class="profileTabSetContainer zen" id="profileTabSetContainer" style="display: block;">
                                                    <div aria-multiselectable="false" id="TabPanel" class="zen-box zen-tabs zen-simpleTabs profileTabs">
                                                        <div class="zen-inner">
                                                            <div class="zen-header profileTabSetHeader" id="profileTabSetHeader">
                                                                <div id="profileTabSetHeaderWrapper">
                                                                    <ul role="tablist" class="profileTabSet zen-tabControl" id="profileTabSet">
                                                                        <li role="presentation" class="zen-current"><a title="摘要" role="tab" onclick="SfdcApp.Chatter.ProfileTabSet.handleTabChange(this.getAttribute('data-id'));"
                                                                            id="profileTab_sfdc.ProfilePlatformFeed" data-type="STANDARD" data-id="sfdc.ProfilePlatformFeed"
                                                                            aria-selected="true" aria-controls="profileTabContent_sfdc.ProfilePlatformFeed"
                                                                            class="profileTab" href="javascript:void(0);">摘要</a></li>
                                                                        <li role="presentation"><a title="概览" role="tab" onclick="SfdcApp.Chatter.ProfileTabSet.handleTabChange(this.getAttribute('data-id'));"
                                                                            id="profileTab_sfdc.ProfilePlatformOverview" data-type="STANDARD" data-id="sfdc.ProfilePlatformOverview"
                                                                            aria-selected="false" aria-controls="profileTabContent_sfdc.ProfilePlatformOverview"
                                                                            class="profileTab" href="javascript:void(0);">概览</a></li>
                                                                    </ul>
                                                                    <div role="presentation" data-sfdc-widget="SfdcCmp.Ui.Dropdown" class="profileMore hidden zen-select"
                                                                        id="profileMore" data-uidsfdc="79">
                                                                        <a class="profileMoreTrigger profileTab zen-trigger" id="profileMoreTrigger" href="javascript:void(0);"
                                                                            data-uidsfdc="77"><span id="profileMoreTriggerLabel">更多</span> <b alt="更多" class="profileMoreTriggerIcon">
                                                                            </b>
                                                                            <div style="clear: both;">
                                                                            </div>
                                                                        </a>
                                                                        <ul class="profileMoreList zen-options" id="profileMoreList" data-uidsfdc="78">
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="zen-body profileTabBody">
                                                                <div id="profileLoadingOverlay" style="visibility: hidden;">
                                                                </div>
                                                                <ul role="presentation" class="zen-tabBody" id="profileTabContent">
                                                                    <li role="tabpanel" id="profileTabContent_sfdc.ProfilePlatformFeed" data-id="sfdc.ProfilePlatformFeed"
                                                                        aria-labeledby="profileTab_sfdc.ProfilePlatformFeed" aria-hidden="false" class="profileTabContent zen-current">
                                                                        <div class="profileFeed" id="profileFeed">
                                                                            <div class="profileSection">
                                                                                <script>                                                                                    chatter.getToolbox().setToken('SWz.Vc5A_IwG.iItknxzFQvqTiEEpIpR.aYb8uTmcDba2WZLESyfftw1t7AmoA1JB.D6MUwxUH4i2YCjAb31fmSPTQc5XO.VwKII.AVXbQXBN5mQplEfY05liIkrr_FC4_BACaEh0celax7REoBk4F2fvIo=');</script>
                                                                                <div data-topics="" data-publisher="{&quot;subjectId&quot;:&quot;0059000000390Wh&quot;,&quot;entityType&quot;:&quot;用户&quot;,&quot;useDefaultState&quot;:true,&quot;useEnhancedKeyboardNavigation&quot;:true}"
                                                                                    class="publishercontainer zen  defaultState  cxchattertextareacontainer chattertextareacontainer">
                                                                                    <ul class="publisherFeedItemTypeChoices">
                                                                                        <li label="TextPost" class="publisherFeedItemTypeChoice"><a onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'TextPost', 'TextPost', event);"
                                                                                            id="publisherAttachTextPost" class="publisherattach publisherattachTextPost   withArrowAttached"
                                                                                            title="张贴" href="javascript:void(0);">
                                                                                            <img title="" class="publishericon " alt="" src="/s.gif">
                                                                                            <span class="publisherattachtext ">张贴</span> <span class="pArrow"></span></a>
                                                                                        </li>
                                                                                        <li label="ContentPost" class="publisherFeedItemTypeChoice"><a onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'ContentPost', 'ContentPost', event);"
                                                                                            id="publisherAttachContentPost" class="publisherattach publisherattachContentPost   "
                                                                                            title="文件" href="javascript:void(0);">
                                                                                            <img title="" class="publishericon " alt="" src="/s.gif">
                                                                                            <span class="publisherattachtext ">文件</span> <span class="pArrow"></span></a>
                                                                                        </li>
                                                                                        <li label="LinkPost" class="publisherFeedItemTypeChoice"><a onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'LinkPost', 'LinkPost', event);"
                                                                                            id="publisherAttachLinkPost" class="publisherattach publisherattachLinkPost   "
                                                                                            title="链接" href="javascript:void(0);">
                                                                                            <img title="" class="publishericon " alt="" src="/s.gif">
                                                                                            <span class="publisherattachtext ">链接</span> <span class="pArrow"></span></a>
                                                                                        </li>
                                                                                        <li class="publisherFeedItemTypeChoice">
                                                                                            <div role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown" class="zen-select publisherattach publisherTypeOverflow"
                                                                                                data-uidsfdc="51">
                                                                                                <a aria-haspopup="true" title="单击以查看更多选项" href="javascript:void(0);" class="zen-trigger"
                                                                                                    id="publisherDropdown" data-uidsfdc="49"><span class="triggerText">更多</span> <span
                                                                                                        class="publisherTypeOverflowSelected hidden"><span class="publisherattachtext truncateLabel">
                                                                                                        </span></span><span class="publisherArrowContainer"><b class="zen-selectArrow"></b>
                                                                                                    </span></a><span class="pArrow"></span>
                                                                                                <ul aria-labelledby="publisherDropdown" role="menu" class="zen-options" data-uidsfdc="50">
                                                                                                    <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="47"><a
                                                                                                        title="投票" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'PollPost', 'PollPost', event);"
                                                                                                        id="publisherAttachPollPost" class="publisherattach publisherattachPollPost publisherFeedItemTypeChoice"
                                                                                                        href="javascript:void(0);"><span>
                                                                                                            <img title="" class="publishericon" alt="" src="/s.gif"><span class="publisherattachtext">投票</span></span></a></li><li
                                                                                                                role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="48"><a title="问题"
                                                                                                                    role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'QuestionPost', 'QuestionPost', event);"
                                                                                                                    id="publisherAttachQuestionPost" class="publisherattach publisherattachQuestionPost publisherFeedItemTypeChoice"
                                                                                                                    href="javascript:void(0);"><span>
                                                                                                                        <img title="" class="publishericon" alt="" src="/s.gif"><span class="publisherattachtext">问题</span></span></a></li>
                                                                                                </ul>
                                                                                            </div>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <div class="publisherWrapper" style="visibility: visible;">
                                                                                        <div lazyinit="" class="TextPost publisherTemplate activeTemplate">
                                                                                            <div class="publisherTextAreaPlaceholder alignTop">
                                                                                                <div id="publisherTextArea" class="publisherTextAreaContainer">
                                                                                                    <div class="publisherTextAreaInner">
                                                                                                        <textarea wrap="soft" type="text" title="您正在处理什么？" tabindex="0" role="textbox" name="publishereditablearea"
                                                                                                            id="publishereditablearea" class="chatterTopicsEnabled  groupAtMentionsEnabled publishertextarea"
                                                                                                            data-uidsfdc="57">您正在处理什么？</textarea>
                                                                                                        <input type="hidden" value="您正在处理什么？" name="publisherprompttext" id="publisherprompttext">
                                                                                                    </div>
                                                                                                    <div style="display: none;" class="cxchattermessagecontainer chattermessagecontainer"
                                                                                                        id="publishererrorcontainer">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="publisherBottomBarPlaceholder">
                                                                                                <div id="publisherBottomBar" class="bottomBar">
                                                                                                    <div class="bottomBarLeft">
                                                                                                        <span class="publisherPostToElementPlaceholder"><span id="publisherPostToElement"><span
                                                                                                            class="postTo"><span class="postToText">到</span><span class="postToTarget"><span
                                                                                                                class="postToDropdown postToGroupDropdown">
                                                                                                                <div data-autofocus="true" data-isselect="true" data-expandmode="click" role="application"
                                                                                                                    data-sfdc-widget="SfdcCmp.Ui.Dropdown" class="zen-select " data-uidsfdc="56">
                                                                                                                    <a aria-haspopup="true" title="我的追随者" onclick="" href="javascript:void(0);" class="zen-trigger "
                                                                                                                        id="" data-uidsfdc="54"><b class="zen-selectArrow"></b>我的追随者 </a>
                                                                                                                    <ul aria-labelledby="" role="menu" class="zen-options " data-uidsfdc="55">
                                                                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="52"><a
                                                                                                                            title="我的追随者" role="menuitem" onclick="chatter.getPublisher().getWidget('postToWidget').setTargetToMyProfile();"
                                                                                                                            class="postToMyProfile" href="javascript:;">我的追随者</a></li><li role="presentation"
                                                                                                                                data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="53"><a title="小组" role="menuitem"
                                                                                                                                    onclick="chatter.getPublisher().getWidget('postToWidget').setTargetToGroup();"
                                                                                                                                    class="postToGroup" href="javascript:;">小组</a></li>
                                                                                                                    </ul>
                                                                                                                </div>
                                                                                                            </span><span class="groupSelection">
                                                                                                                <input type="text" value="搜索小组" class="groupSelectionInput" id="publisherGroupSelectionInput">
                                                                                                                <span class="groupRecipient"><span class="groupIconContainer">
                                                                                                                    <img id="publisherGroupSelectionInputGroupRecipient" class="groupIcon" src="/profilephoto/0F9/T">
                                                                                                                    <img class="groupPrivateIcon" src="/s.gif">
                                                                                                                </span>
                                                                                                                    <label for="publisherGroupSelectionInputGroupRecipient">
                                                                                                                        <span class="groupInfo"></span>
                                                                                                                    </label>
                                                                                                                    <img class="nameFadeOut" src="/s.gif">
                                                                                                                    <a class="removeGroup" title="删除" href="javascript:;"></a></span></span>
                                                                                                                <script>                                                                                                                    chatter.getPublisher().addPostToWidget();</script>
                                                                                                            </span></span></span></span><span class="publisherVisibilityWidgetPlaceholder"><span
                                                                                                                class="visibilityWidgetParent" id="publisherVisibilityWidget"><a onclick="chatter.getPublisher().getWidget('visibilityWidget').toggleDisplay();"
                                                                                                                    class="iconParent" href="javascript:void(0);">
                                                                                                                    <img title="谁可以查看您的帖子？" id="publisherVisibilityIcon" class="visibilityicon " alt="谁可以查看您的帖子？"
                                                                                                                        src="/s.gif">
                                                                                                                </a>
                                                                                                                <script>                                                                                                                    chatter.getPublisher().addVisibilityWidget("javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_post_visibility.htm%2526language%253Dzh_CN%2526release%253D192.8.8%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);", false, false, false, true);</script>
                                                                                                            </span></span>
                                                                                                    </div>
                                                                                                    <div class="bottomBarRight">
                                                                                                        <span class="publisherShareButtonPlaceholder">
                                                                                                            <input type="button" title="共享" onclick="chatter.getPublisher().submit();" name="publishersharebutton"
                                                                                                                class="zen-btn zen-highlightBtn" value="共享" id="publishersharebutton"></span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div lazyinit="true" class="ContentPost publisherTemplate ">
                                                                                            <!--<div class="contentPublisherSlideDown customPanel alignTop"><div class="panel hidden" id="chatterFileStageOne"><div class="panelBody clear"><table  class="chatterPublisherActionsContainer" cellpadding="0" cellspacing="0"><tr><td class="chatterPublisherFileActionContainerLeft"><a href="javascript:" id="chatterLinkFileAction" onclick="chatter.getPublisher().getHandler('ContentPost').setMyFilesFilterFlag(true);chatter.getPublisher().getHandler('ContentPost').showLinkFile(this);" title="从 Salesforce 选择一个文件">从 Salesforce 选择一个文件</a></td><td id="chatterUploadFileActionPanel"><a href="javascript:" id="chatterUploadFileAction" onclick="chatter.getPublisher().getHandler('ContentPost').showFileInfo(this, null, false);" title="从您的电脑上载一个文件">从您的电脑上载一个文件</a><input  class="file hidden" id="hiddenFileBtn" name="hiddenFileBtn" onchange="chatter.getPublisher().getHandler('ContentPost').fileNewInfoUpdate(this);" size="20" type="file" /></td></tr>
</table></div></div><div class="panel hidden" id="chatterFileStageTwo"><div class="clearContentPanelButtonContainer"><a href="javascript: void(0);" class="clearContentPanelButton" onclick="chatter.getPublisher().getHandler('ContentPost').clearPanelState();" title="关闭发行人">&nbsp;</a></div><div class="panelBody clear"><form action="" id="chatterFileForm" method="POST" name="chatterFileForm"><div class="requiredLegendContainer" id="requiredLegend"><span class="requiredLegend"><span class="requiredExampleOuter"><span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span  class="requiredText"> = 必填信息</span></span>&nbsp;</div><table  class="postInput" border="0" cellpadding="0" cellspacing="0"><tr id="chatterFileRow"><td colspan="2"><label for="chatterFile" style="display:none;">&nbsp;</label><div><div class="requiredInput"><div class="requiredBlock"></div><input  class="file" id="chatterFile" name="chatterFile" onchange="chatter.getPublisher().getHandler('ContentPost').fileInfoUpdate(this);" size="24" title="选择文件" type="file" /><div class="errorMsg hidden"></div></div><div class="uploadFileSizeLimit"><span  class="fileSize">最大文件大小为 2&nbsp;GB</span></div></div></td></tr>
<tr class="hidden" id="fileNameRow"><TH scope="row"><label for="fileName"><span class="requiredMark">*</span>名称</label></TH><td><div class="requiredInput"><div class="requiredBlock"></div><input  class="fileFormInputElement" id="fileName" maxlength="260" name="fileName" size="20" title="名称" type="text" value="" /><div class="errorMsg hidden"></div></div></td></tr>
<tr id="descRow"><TH scope="row"><label for="desc">描述</label></TH><td><div><textarea  class="fileFormInputElement" cols="60" id="desc" maxlength="1005" name="desc" rows="4" title="描述" type="text" wrap="soft"></textarea><div class="errorMsg hidden"></div></div></td></tr>
</table><input type="hidden"  id="hiddenFileName" name="hiddenFileName" value="" /><div class="sharedWithOptionPanel hidden" id="sharedWithOptionPanel"><label>您想使用该文件做什么？</label><ul><li class="sharedWithStatusBar"><a href="javascript:void(0);" class="lockItemIcon" id="shareOptionStatus" onclick="Sfdc.AccessibleUploadFileDialog.showShareOptionDropdown(this, {pubLinkEnabled:true});return false;"><span>专用上载</span><img src="/s.gif" alt="" width="1" height="1" class="tinyDownArrowIcon" title="" /></a></li></ul>
</div><input type="hidden"  id="shareOption" name="shareOption" value="pvt" /></form></div></div><div class="panel hidden" id="chatterFileNewStageTwo"><div class="clearContentPanelButtonContainer"><a href="javascript: void(0);" class="clearContentPanelButton" onclick="chatter.getPublisher().getHandler('ContentPost').clearPanelState();" title="关闭发行人">&nbsp;</a></div><div class="panelBody clear"><div id="chatterSelectedFileInfo"><div class="selectedFileDetailsContainer"><div class="imgBlock fileType32x32Icon"><img src="/s.gif" alt="" width="32" height="32" id="chatterSelectedFileTypeIcon" title="" /></div><div class="fileDetails"><div class="title"><span  id="chatterSelectedFileName"></span>&nbsp;<span  class="size" id="chatterSelectedFileSize"></span></div></div></div></div></div></div><div class="panel hidden" id="chatterFileContent"><div class="clearContentPanelButtonContainer"><a href="javascript: void(0);" class="clearContentPanelButton" onclick="chatter.getPublisher().getHandler('ContentPost').clearPanelState();" title="关闭发行人">&nbsp;</a></div><div class="panelBody clear"><div id="chatterExistContentInfo"></div></div></div></div><div class="publisherTextAreaPlaceholder alignCenter"></div><div class="publisherBottomBarPlaceholder"></div>-->
                                                                                        </div>
                                                                                        <div lazyinit="true" class="LinkPost publisherTemplate ">
                                                                                            <!--<div class="contentPublisherSlideDown customPanel alignTop"><div class="panel"><div class="panelBody clear"><table  class="postInput"><tr><TH scope="row"><label for="url"><span class="requiredMark">*</span>链接 URL</label></TH><td><div class="requiredInput"><div class="requiredBlock"></div><input  class="fileFormInputElement" id="url" maxlength="1005" name="url" size="20" title="链接 URL" type="text" value="http://" /><div class="errorMsg hidden"></div></div></td></tr>
<tr><TH scope="row"><label for="urlName">链接名称</label></TH><td><div class="urlName"><input  class="fileFormInputElement" id="urlName" maxlength="260" name="urlName" size="20" title="链接" type="text" value="" /><div class="errorMsg hidden"></div></div></td></tr>
</table></div></div></div><div class="publisherTextAreaPlaceholder alignCenter"></div><div class="publisherBottomBarPlaceholder"></div>-->
                                                                                        </div>
                                                                                        <div lazyinit="true" class="PollPost publisherTemplate ">
                                                                                            <!--<div class="publisherTextAreaPlaceholder alignTop"></div>
<div class="customPanel alignCenter">
	<div class="publisherpollchoices">
					<div class="publisherpollchoice">
					<label class="publisherpollchoicelabel" for="choiceinput1">选项 1</label>
					<input id="choiceinput1" title="选项 1" type="text" class="publisherpollchoiceinput" />		
					<div class="errorMsg hidden"></div>
			</div>
			<div class="publisherpollchoice">
					<label class="publisherpollchoicelabel" for="choiceinput2">选项 2</label>
					<input id="choiceinput2" title="选项 2" type="text" class="publisherpollchoiceinput" />		
					<div class="errorMsg hidden"></div>
			</div>
	</div>
	<div class="publisherpolladdchoice">
<a href="javascript: void(0);" title="添加更多选项" id="polladdchoice" onclick="chatter.getPublisher().getHandler('PollPost').addPollChoiceInputElement(this);">			添加更多选项
</a>	</div>
</div>
<div class="publisherBottomBarPlaceholder"></div>-->
                                                                                        </div>
                                                                                        <div lazyinit="" class="QuestionPost publisherTemplate ">
                                                                                            <div class="deflectionPanel">
                                                                                                <div class="publisherQuestionTitleInner">
                                                                                                    <input type="text" value="您想知道什么？" title="您想知道什么？" size="20" name="publisherQuestionTitle"
                                                                                                        maxlength="255" id="publisherQuestionTitle" data-deflection="n" class="publisherQuestionTitle"></div>
                                                                                                <div class="publisherTextAreaPlaceholder alignTop">
                                                                                                </div>
                                                                                                <div class="publisherBottomBarPlaceholder">
                                                                                                </div>
                                                                                                <div class="publisherDeflectionPlaceholder">
                                                                                                </div>
                                                                                                <div class="publisherSpinnerPlaceholder">
                                                                                                    <img title="正在加载..." class="loadingImage" alt="正在加载..." src="/img/loading.gif"><span
                                                                                                        class="publisherSpinnerText">寻找答案...</span></div>
                                                                                                <div class="publisherDeflectionNoResultsPlaceholder">
                                                                                                    <span class="publisherNoResultsText">未找到类似问题。</span></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="externalGroupWarning">
                                                                                        与客户共享</div>
                                                                                    <div class="clear">
                                                                                    </div>
                                                                                    <script>                                                                                        Sfdc.Dom.onReady(function () { chatter.getPublisher().wire('TextPost', 'TextPost'); });</script>
                                                                                </div>
                                                                                <script>                                                                                    chatter.getToolbox().setToken('2IaLmE83gn2r9oC0jI4RH52xoZx5.IokZEbTZmfGqLwzcqkLld._IZe7OqlM4x8d8sUEu8mmR1vaAlsYa8wNXZ.FxD7TKwa4cddw.w_HRIeX7VeRlqM.m8W011FubwUmZ5Ute.u72PTqZEgB2u93tUSGsxc=');</script>
                                                                                <div id="feedwrapper" class="cxfeedinnerwrapper ">
                                                                                    <div data-feed="{&quot;subjectId&quot;:&quot;0059000000390Wh&quot;,&quot;feedType&quot;:&quot;USER&quot;,&quot;writable&quot;:&quot;ReadWrite&quot;,&quot;numFeedItems&quot;:12,&quot;canSortFeed&quot;:true,&quot;sortByComments&quot;:false,&quot;showFeedTitle&quot;:false,&quot;isDropDownFiltersVisible&quot;:false,&quot;alwaysShowFullText&quot;:false,&quot;isShowMoreOfThis&quot;:false,&quot;isCompactFeed&quot;:false,&quot;feedfilter&quot;:&quot;all&quot;,&quot;keyprefix&quot;:&quot;&quot;}"
                                                                                        class="feedcontainer cxfeedcontainer zen actionsOnHoverEnabled">
                                                                                        <span class="feedDropDown">
                                                                                            <div data-sfdc-widget="SfdcCmp.chatter.ComboMenu" class="comboMenu zen-line feedsupermenu "
                                                                                                data-uidsfdc="45">
                                                                                                <div data-sfdc-widget="SfdcCmp.Ui.SearchBox" class="zen-searchBox comboSearchMax feedSearch"
                                                                                                    data-uidsfdc="44">
                                                                                                    <form onsubmit="chatter.getFeed().runSearch(event);" class="feedSearchForm">
                                                                                                    <label class="zen-assistiveText" for="searchInput">
                                                                                                        搜索此摘要</label>
                                                                                                    <input type="text" alt="搜索此摘要" title="搜索此摘要..." aria-haspopup="true" aria-expanded="false"
                                                                                                        placeholder="搜索此摘要..." maxlength="100" id="searchInput" class="feedSearchTerm"
                                                                                                        data-uidsfdc="40">
                                                                                                    <a title="清除搜索" onclick="chatter.getFeed().clearSearch()" href="#" class="zen-clearInput"
                                                                                                        data-uidsfdc="41"></a><a class="feedSearchClear" title="清除搜索" onclick="chatter.getFeed().clearSearch()"
                                                                                                            href="javascript:void(0);">
                                                                                                            <img alt="清除搜索" class="feedSearchClearIcon" src="/s.gif">
                                                                                                        </a>
                                                                                                    </form>
                                                                                                    <div class="feedSearchClosedButton">
                                                                                                        <a title="搜索此摘要" onclick="chatter.getFeed().expandSearchAndHideMenu()" href="javascript:void(0);">
                                                                                                            <img alt="搜索此摘要" class="feedSearchIcon" src="/s.gif">
                                                                                                        </a>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="zen-smlineSep">
                                                                                                    |</div>
                                                                                                <div data-autocollapse="true" data-autofocus="true" data-isselect="true" data-expandmode="click"
                                                                                                    role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown" class="zen-select "
                                                                                                    data-uidsfdc="30">
                                                                                                    <a aria-haspopup="true" title="" href="javascript:void(0);" onclick="" class="zen-trigger "
                                                                                                        id="feedFilterDropDownElement" data-uidsfdc="28"><span class="triggerTitleText">排序标准<span
                                                                                                            id="sortDisplay">张贴日期</span><b class="zen-selectArrow"></b></span> </a>
                                                                                                    <div aria-labelledby="feedFilterDropDownElement" role="menu" class="zen-options "
                                                                                                        data-uidsfdc="29">
                                                                                                        <span class="facet facetheader ">
                                                                                                            <h4>
                                                                                                                排序标准</h4>
                                                                                                        </span><span role="radiogroup" data-sfdc-widget="SfdcCmp.Ui.OptGroup" class="zen-optgroup combomenu-filter"
                                                                                                            data-uidsfdc="18">
                                                                                                            <ul class="feedsortby">
                                                                                                                <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" class="zen-checked"
                                                                                                                    data-uidsfdc="19"><span class="zen-visualization"></span><a title="张贴日期" role="menuitemradio"
                                                                                                                        onclick="chatter.getFeed().toggleSort(this, false, event);" data-value="张贴日期"
                                                                                                                        aria-checked="true" href="javascript:;">张贴日期</a></li><li data-sfdc-widget="SfdcCmp.Ui.Option"
                                                                                                                            data-uidsfdc="20"><span class="zen-visualization"></span><a title="最新活动" role="menuitemradio"
                                                                                                                                onclick="chatter.getFeed().toggleSort(this, true, event);" data-value="最新活动"
                                                                                                                                href="javascript:;">最新活动</a></li></ul>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </span>
                                                                                        <div class="clearingBox">
                                                                                        </div>
                                                                                        <div style="display: none" class="nonFeedSuccess zen-message zen-confirm">
                                                                                            <img class="leftImage" src="/img/msg_icons/confirm24.png">
                                                                                            <div class="nonFeedSuccessContent">
                                                                                                <div class="nonFeedSuccessTitle">
                                                                                                    成功！</div>
                                                                                                <div class="nonFeedSuccessMessage">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="clearingBox">
                                                                                            </div>
                                                                                        </div>
                                                                                        <script type="text/javascript">
                                                                                            chatter.getFeed().setCommentVisibilityHelpLink("javascript:openPopupFocusEscapePounds('https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcollab_mention_visibility.htm%2526language%253Dzh_CN%2526release%253D192.8.8%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);");
                </script>
                                                                                        <div onmouseout="chatter.getToolbox().removeClassOnMouseOut(event, this, 'cxhover');"
                                                                                            onmouseover="Sfdc.Dom.addClass(this, 'cxhover');" data-hovdata="dir=chatterHover-above"
                                                                                            data-feeditem="{&quot;parentid&quot;:&quot;0059000000390Wh&quot;,&quot;parentname&quot;:&quot;用户&quot;,&quot;parentActualName&quot;:&quot;liu jack&quot;,&quot;feedItemType&quot;:&quot;ContentPost&quot;}"
                                                                                            class="cxfeeditem feeditem" id="0D59000000qV7ln" data-uidsfdc="105">
                                                                                            <span class=""><a href="/0059000000390Wh" data-uidsfdc="107"><span data-hovid="0059000000390Wh"
                                                                                                class="chatter-avatar feeditemusericon chatter-avatarRegular" data-uidsfdc="106"
                                                                                                id="hoverItem106">
                                                                                                <img width="45" height="45" class="chatter-photo" alt="liu jack" src="https://c.ap1.content.force.com/profilephoto/005/T"
                                                                                                    data-uidsfdc="121"><img class="chatter-avatarStyle" alt="" src="/s.gif" data-uidsfdc="122"></span></a>
                                                                                                <div id="0059000000390WhHover" style="position: absolute; display: none; z-index: 105;
                                                                                                    top: 720px; left: 239px;" data-uidsfdc="120">
                                                                                                    <div class="chatterHover chatterHover-above">
                                                                                                        <div class="wrapper" style="top: 0px;">
                                                                                                            <div class="loadHover">
                                                                                                                正在加载...</div>
                                                                                                        </div>
                                                                                                        <div class="arrow">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </span>
                                                                                            <div class="feeditemcontent cxfeeditemcontent">
                                                                                                <div class="feeditembodyandfooter">
                                                                                                    <div class="feeditembody">
                                                                                                        <div class="preamblecontainer displayblock">
                                                                                                            <span><span class="feeditemfirstentity"><a data-hovid="0059000000390Wh" class="actorentitylink"
                                                                                                                href="/0059000000390Wh" data-uidsfdc="108" id="hoverItem108">liu jack</a></span>
                                                                                                                张贴一个文件。</span>
                                                                                                        </div>
                                                                                                        <span class="feeditemtext cxfeeditemtext"></span>
                                                                                                        <div class="feeditemaux cxfeeditemaux">
                                                                                                            <span>
                                                                                                                <table class="contentPost">
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td id="left_1279318356" class="thumbnailCell">
                                                                                                                                <a onmouseover="Sfdc.ChatterFileFeedActions.onHover(this);" onfocus="Sfdc.ChatterFileFeedActions.onHover(this);"
                                                                                                                                    class="contentThumbnail-a" href="javascript:OverlayDialogElement.showFilePreview%28%27docViewerOverlay%27%2C%27title_1279318356%27%2C%27%2F_swf%2F192001%2Fsfc%27%2C%27068900000018kca%27%2C%27chatter_bubble%27%2C%27false%27%2C%27docViewerContainer%27%2Cfalse%2C%27txt%27%2Cfalse%2C%27%27%29%3B">
                                                                                                                                    <img title="单击预览" class="contentThumbnail" alt="单击预览" src="https://c.ap1.content.force.com/sfc/servlet.shepherd/version/renditionDownload?rendition=THUMB120BY90&amp;versionId=068900000018kca&amp;operationContext=CHATTER&amp;contentId=05T900000032UuB"></a>
                                                                                                                            </td>
                                                                                                                            <td class="rightSideCell">
                                                                                                                                <table class="contentdetails">
                                                                                                                                    <tbody>
                                                                                                                                        <tr>
                                                                                                                                            <td>
                                                                                                                                                <div class="contentFileTitle">
                                                                                                                                                    <a class="contentActionLink" href="/068900000018kca"><span title="shopex" id="title_1279318356"
                                                                                                                                                        class="contentTitleLink">shopex</span></a></div>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td class="moreFileActions-td">
                                                                                                                                                <a shouldstayinownframe="true" class="contentActionLink" href="https://c.ap1.content.force.com/sfc/servlet.shepherd/version/download/068900000018kca?asPdf=false&amp;operationContext=CHATTER">
                                                                                                                                                    <img width="1" height="1" class="chatterFileIcon downloadItemIcon" alt="" src="/img/s.gif"><span
                                                                                                                                                        class="contentActionLabel">下载 txt</span><span class="contentActionLabel fileSize">(549&nbsp;B)</span></a>
                                                                                                                                                <span class="feeditemseparatingdot">·</span> <a title="打开更多操作列表" id="contentActionLink5229"
                                                                                                                                                    class="more-file-actions" href="javascript:Sfdc.ChatterFileFeedActions.openPopup%28%27contentActionLink5229%27%29%3B">
                                                                                                                                                    <span class="contentActionLabel">更多操作</span><img title="" class="content-action-link-arrow"
                                                                                                                                                        alt="" src="/s.gif"></a>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </tbody>
                                                                                                                                </table>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                                <div role="menu" sharing="true" subscribed="false" rendition="true" docid="0699000000181HJ"
                                                                                                                    class="contentActionMenu" id="contentActionMenucontentActionLink5229">
                                                                                                                    <a class="more-file-actions" tabindex="-1" title="关闭更多操作列表" href="javascript:Sfdc.ChatterFileFeedActions.closePopup(%27contentActionMenucontentActionLink5229%27);">
                                                                                                                        <span class="contentActionLabel">更多操作</span><img alt="" src="/s.gif" class="content-action-link-arrow"></a>
                                                                                                                    <div role="menuitem" tabindex="-1" class="contentActionMenuItem">
                                                                                                                        <div class="zen">
                                                                                                                            <div onclick="SfdcApp.Chatter.SubscribeButton.onClick(event);" data-sfdc-network-id="000000000000000"
                                                                                                                                data-sfdc-entity-id="0699000000181HJ" data-chatter-widget="subscribeBtn">
                                                                                                                                <span data-chatter-subscribe="1" class="zen-media zen-mediaExt"><a class="zen-mrs zen-img"
                                                                                                                                    href="javascript:void(0);">
                                                                                                                                    <img width="1" height="1" title="追随该文件以接收摘要中的更新。" class="chatter-icon chatter-followIcon"
                                                                                                                                        alt="追随该文件以接收摘要中的更新。" src="/s.gif"></a><span class="zen-mediaBody"><a title="追随该文件以接收摘要中的更新。"
                                                                                                                                            href="javascript:void(0);">追随</a></span></span><span style="display: none" onmouseover="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                                                                                                onmouseout="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" onfocus="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                                                                                                onblur="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" class="zen-media zen-mediaExt"><img
                                                                                                                                                    width="1" height="1" title="停止追随该文件以停止接收摘要中的更新。" class="chatter-icon zen-mrs chatter-checkedIcon zen-img"
                                                                                                                                                    alt="停止追随该文件以停止接收摘要中的更新。" src="/s.gif"><span class="zen-mediaBody">正在追随<a title="停止追随该文件以停止接收摘要中的更新。"
                                                                                                                                                        data-chatter-subscribe="0" class="zen-mls zen-imgExt" href="javascript:void(0);"><img
                                                                                                                                                            width="1" height="1" title="停止追随该文件以停止接收摘要中的更新。" class="chatter-icon chatter-unfollowIcon"
                                                                                                                                                            alt="停止追随该文件以停止接收摘要中的更新。" src="/s.gif"></a></span></span></div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div class="hr">
                                                                                                                        <div role="menuitem" tabindex="-1" class="contentActionMenuItem">
                                                                                                                            <a shouldstayinownframe="true" class="contentActionLink" href="javascript:OverlayDialogElement.showFilePreview(%27docViewerOverlay%27,%27shopex%27,%27/_swf/192001/sfc%27,%27068900000018kca%27,%27chatter_bubble%27,%27false%27,%27docViewerContainer%27,false,%27txt%27,false,%27%27);">
                                                                                                                                <img width="1" height="1" class="chatterFileIcon previewItemIcon" alt="" src="/img/s.gif"><span
                                                                                                                                    class="contentActionLabel">预览</span></a></div>
                                                                                                                        <div role="menuitem" tabindex="-1" class="contentActionMenuItem upload unchecked">
                                                                                                                            <a class="contentActionLink" href="javascript:void();"><span class="docid hidden">0699000000181HJ</span><img
                                                                                                                                src="/s.gif" alt="" class="chatterFileIcon uploadIcon"><span class="contentActionLabel">上载新版本</span></a></div>
                                                                                                                        <div role="menuitem" tabindex="-1" class="contentActionMenuItem blockLinkItem emptyIcon">
                                                                                                                            <a class="contentActionLink" href="/0699000000181HJ">
                                                                                                                                <img class="emptyIcon" alt="" src="/s.gif"><span class="contentActionLabel">查看文件详细信息</span></a></div>
                                                                                                                        <div role="menuitem" tabindex="-1" class="contentActionMenuItem blockLinkItem emptyIcon">
                                                                                                                            <a class="contentActionLink" href="javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList%28%27shopex%27%2C%20%270699000000181HJ%27%29%3B">
                                                                                                                                <img class="emptyIcon" alt="" src="/s.gif"><span class="contentActionLabel">文件共享设置</span></a></div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                        <div class="feeditemtopics">
                                                                                                            <div data-iswidget="false" data-referrer="FEED_ITEM_TOPIC" data-entityid="0D59000000qV7ln"
                                                                                                                id="topicContainer0D59000000qV7ln" class="topics init">
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="feeditemfooter">
                                                                                                        <span class="cxallfeedactions"><a onclick="chatter.getFeed().showCommentBoxViaAnchor(this);"
                                                                                                            class="feeditemactionlink cxaddcommentaction" title="此帖子的留言" href="javascript:void(0);">
                                                                                                            留言</a> <span class="cxfeeditemcommentdot feeditemseparatingdot">&nbsp;&nbsp;·&nbsp;&nbsp;</span>
                                                                                                            <a onclick="chatter.getFeed().likeItem(this, '0D59000000qV7ln', 'ContentPost');"
                                                                                                                class="feeditemactionlink cxlikeitemaction" style="" title="说此帖子赞" href="javascript:void(0);">
                                                                                                                赞</a> <a onclick="chatter.getFeed().unlikeItem(this, '0D59000000qV7ln');" class="feeditemactionlink cxunlikeitemaction"
                                                                                                                    style="display: none;" title="停止说此帖子赞" href="javascript:void(0);">取消赞</a>
                                                                                                            <span class="cxfeeditemlikedot feeditemseparatingdot">&nbsp;&nbsp;·&nbsp;&nbsp;</span>
                                                                                                            <span style="display: none;" class="bookmarked"><span class="zen-assistiveText">Feeditem
                                                                                                                已添加书签</span></span> <a class="dialog_RechatDialog0D59000000qV7ln" onclick="if(!window.RechatDialog0D59000000qV7ln) { window.RechatDialog0D59000000qV7ln = chatter.createModalOverlay({id:'RechatDialog0D59000000qV7ln',height:'700',title:'共享帖子',url:'/feeditems/rechatoverlay',width:'532px',extraClass:'rechatDialog',params:{type:'followers',feeditemid:'0D59000000qV7ln'},isDialogPositionAbsolute:'true'});  window.RechatDialog0D59000000qV7ln.register(); }  window.RechatDialog0D59000000qV7ln.open();"
                                                                                                                    href="javascript:void(0);"><span title="共享帖子">共享</span></a> <span class=" feeditemseparatingdot">
                                                                                                                        &nbsp;&nbsp;·&nbsp;&nbsp;</span> <span class="feeditemActionMenu">
                                                                                                                            <div data-autofocus="false" data-expandmode="click" role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown"
                                                                                                                                class="zen-select " data-uidsfdc="33">
                                                                                                                                <a aria-haspopup="true" title="更多操作" onclick="" href="javascript:void(0);" class="zen-trigger feeditemActionMenuButton"
                                                                                                                                    id="spillovermenu0D59000000qV7ln" data-uidsfdc="31"><b class=""></b></a>
                                                                                                                                <ul aria-labelledby="spillovermenu0D59000000qV7ln" role="menu" class="zen-options "
                                                                                                                                    data-uidsfdc="32">
                                                                                                                                    <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="21"><a
                                                                                                                                        title="收藏此帖子为书签" role="menuitem" onclick="chatter.getFeed().bookmark(this, '0D59000000qV7ln');"
                                                                                                                                        href="javascript: void(0);">书签</a></li><li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option"
                                                                                                                                            data-uidsfdc="22"><a title="添加主题到本帖子" role="menuitem" onclick="SfdcApp.TopicsFeed.editFromMenu('0D59000000qV7ln')"
                                                                                                                                                href="javascript: void(0);">添加主题</a></li><li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option"
                                                                                                                                                    data-uidsfdc="23"><a title="删除此帖子" role="menuitem" onclick="chatter.getFeed().checkAccessAndDeleteItem(this, '0D59000000qV7ln', true)"
                                                                                                                                                        href="javascript: void(0);">删除</a></li>
                                                                                                                                </ul>
                                                                                                                            </div>
                                                                                                                        </span></span><a class="feeditemtimestamp" title="单击此帖子的单项目视图。" href="/0D59000000qV7ln">
                                                                                                                            今天, 下午4:51</a> &nbsp;
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="feeditemextras cxchattertextareacontainer chattertextareacontainer">
                                                                                                    <div style="display: none" class="cxcomments feeditemcomments">
                                                                                                        <div style="display: none" class="cxlikecontainer feedItemExtrasMetaText">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div style="display: none" class="cxnewcomment newCommentContainer">
                                                                                                        <div class="feeditemcomment feeditemnewcomment feeditemcommenttext">
                                                                                                            <div class="feeditemcommentphotocontainer">
                                                                                                                <a class="feeditemcommentphoto" href="/0059000000390Wh">
                                                                                                                    <img alt="liu jack" title="liu jack" src="https://c.ap1.content.force.com/profilephoto/005/T">
                                                                                                                </a>
                                                                                                            </div>
                                                                                                            <div class="feeditemcommentnew  zen">
                                                                                                                <div class="newcommenttextwrapper">
                                                                                                                    <textarea title="编写留言..." role="textbox" tabindex="0" class="foobar cxnewcommenttext groupAtMentionsEnabled   chatterTopicsEnabled "></textarea>
                                                                                                                </div>
                                                                                                                <div style="display: none" class="cxvalidationmessage cxchattermessagecontainer chattermessagecontainer">
                                                                                                                </div>
                                                                                                                <div class="feeditemvisibilitycontainer">
                                                                                                                </div>
                                                                                                                <input type="button" onclick="chatter.getFeed().newComment(this, '0D59000000qV7ln', 'ContentPost');"
                                                                                                                    title="留言" value="留言" class="zen-btn cxnewcommentaction newcommentbutton cxchattersubmit">
                                                                                                                <div>
                                                                                                                    <a onmousedown="chatter.getFeed().contentCommentActionMouseDown(this);" onfocus="chatter.getFeed().contentCommentActionFocus(this);"
                                                                                                                        onclick="chatter.getFeed().createContentComment(this,'0D59000000qV7ln', false);"
                                                                                                                        class="cxcontentcommentaction" onblur="chatter.getFeed().contentCommentActionBlur(this);"
                                                                                                                        href="javascript:void(0);">
                                                                                                                        <img src="/s.gif" class="cxcontentcommentactionimg">
                                                                                                                        <span class="cxcontentcommentactiontext">附加文件</span> </a>
                                                                                                                </div>
                                                                                                                <div class="cxcontentcommentinfo">
                                                                                                                </div>
                                                                                                                <div class="feedclearfloat">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="feeditemcommentplaceholder cxcommentplaceholder" style="display: none">
                                                                                                        <label>
                                                                                                            <span>单击以留言</span>
                                                                                                            <input type="text" onkeypress="return chatter.getFeed().showCommentBoxViaPlaceholderOnKeyPress(this, event);"
                                                                                                                onfocus="return chatter.getFeed().showCommentBoxViaPlaceholder(this);" onclick="return chatter.getFeed().showCommentBoxViaPlaceholder(this);"
                                                                                                                class="cxcommentplaceholderaction" value="编写留言..." readonly="true">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div onmouseout="chatter.getToolbox().removeClassOnMouseOut(event, this, 'cxhover');"
                                                                                            onmouseover="Sfdc.Dom.addClass(this, 'cxhover');" data-hovdata="dir=chatterHover-above"
                                                                                            data-feeditem="{&quot;parentid&quot;:&quot;00U9000000UdObX&quot;,&quot;parentname&quot;:&quot;事件&quot;,&quot;parentActualName&quot;:&quot;接待客户&quot;,&quot;feedItemType&quot;:&quot;CreateRecordEvent&quot;}"
                                                                                            class="cxfeeditem feeditem" id="0D59000000qAGPL" data-uidsfdc="101">
                                                                                            <span class=""><a href="/0059000000390Wh" data-uidsfdc="103"><span title="liu jack"
                                                                                                data-hovid="0059000000390Wh" class="chatter-avatar feeditemusericon chatter-avatarRegular"
                                                                                                data-uidsfdc="102" id="hoverItem102">
                                                                                                <img width="45" height="45" title="liu jack" class="chatter-photo" alt="liu jack"
                                                                                                    src="https://c.ap1.content.force.com/profilephoto/005/T"><img title="" class="chatter-avatarStyle"
                                                                                                        alt="" src="/s.gif"></span></a> </span>
                                                                                            <div class="feeditemcontent cxfeeditemcontent">
                                                                                                <div class="feeditembodyandfooter">
                                                                                                    <div class="feeditembody">
                                                                                                        <div class="preamblecontainer displayblock">
                                                                                                            <span><span class="feeditemfirstentity"><a href="/00U9000000UdObX"><span class="eventMru">
                                                                                                                <img title="事件" class="mruIcon" alt="事件" src="/s.gif"></span>接待客户</a></span> &mdash;
                                                                                                                <span class="feeditemsecondentity"><a data-hovid="0059000000390Wh" class="actorentitylink"
                                                                                                                    href="/0059000000390Wh" data-uidsfdc="104" id="hoverItem104">liu jack</a></span>
                                                                                                                已创建事件。</span>
                                                                                                        </div>
                                                                                                        <span class="feeditemtext cxfeeditemtext"></span>
                                                                                                        <div class="feeditemaux cxfeeditemaux">
                                                                                                            <div class="rscontainer">
                                                                                                                <div class="rsicon">
                                                                                                                    <a href="/00U9000000UdObX">
                                                                                                                        <img width="16" height="16" title="事件" alt="事件" src="/img/icon/calendar16.png"></a>
                                                                                                                </div>
                                                                                                                <div class="rsbody">
                                                                                                                    <div class="rstitle">
                                                                                                                        <a href="/00U9000000UdObX">接待客户</a>
                                                                                                                    </div>
                                                                                                                    <div class="rstopcontainer">
                                                                                                                        <ul class="rstopcontent">
                                                                                                                            <li class="rsproperty"><span class="rspropertyhead">主题:</span><span class="rspropertyvalue">接待客户</span></li><li
                                                                                                                                class="rsproperty"><span class="rspropertyhead">位置:</span><span class="rspropertyvalue"></span></li><li
                                                                                                                                    class="rsproperty"><span class="rspropertyhead">开始:</span><span class="rspropertyvalue">2014-10-20
                                                                                                                                        下午3:00</span></li><li class="rsproperty"><span class="rspropertyhead">结束:</span><span
                                                                                                                                            class="rspropertyvalue">2014-10-21 下午4:00</span></li></ul>
                                                                                                                    </div>
                                                                                                                    <div class="rsmorecontainer">
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="feeditemtopics">
                                                                                                            <div data-iswidget="false" data-referrer="FEED_ITEM_TOPIC" data-entityid="0D59000000qAGPL"
                                                                                                                id="topicContainer0D59000000qAGPL" class="topics init">
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="feeditemfooter">
                                                                                                        <span class="cxallfeedactions"><a onclick="chatter.getFeed().showCommentBoxViaAnchor(this);"
                                                                                                            class="feeditemactionlink cxaddcommentaction" title="此帖子的留言" href="javascript:void(0);">
                                                                                                            留言</a> <span class="cxfeeditemcommentdot feeditemseparatingdot">&nbsp;&nbsp;·&nbsp;&nbsp;</span>
                                                                                                            <a onclick="chatter.getFeed().likeItem(this, '0D59000000qAGPL', 'CreateRecordEvent');"
                                                                                                                class="feeditemactionlink cxlikeitemaction" style="" title="说此帖子赞" href="javascript:void(0);">
                                                                                                                赞</a> <a onclick="chatter.getFeed().unlikeItem(this, '0D59000000qAGPL');" class="feeditemactionlink cxunlikeitemaction"
                                                                                                                    style="display: none;" title="停止说此帖子赞" href="javascript:void(0);">取消赞</a>
                                                                                                            <span class="cxfeeditemlikedot feeditemseparatingdot">&nbsp;&nbsp;·&nbsp;&nbsp;</span>
                                                                                                            <span style="display: none;" class="bookmarked"><span class="zen-assistiveText">Feeditem
                                                                                                                已添加书签</span></span> <span class="feeditemActionMenu">
                                                                                                                    <div data-autofocus="false" data-expandmode="click" role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown"
                                                                                                                        class="zen-select " data-uidsfdc="36">
                                                                                                                        <a aria-haspopup="true" title="更多操作" onclick="" href="javascript:void(0);" class="zen-trigger feeditemActionMenuButton"
                                                                                                                            id="spillovermenu0D59000000qAGPL" data-uidsfdc="34"><b class=""></b></a>
                                                                                                                        <ul aria-labelledby="spillovermenu0D59000000qAGPL" role="menu" class="zen-options "
                                                                                                                            data-uidsfdc="35">
                                                                                                                            <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="24"><a
                                                                                                                                title="收藏此帖子为书签" role="menuitem" onclick="chatter.getFeed().bookmark(this, '0D59000000qAGPL');"
                                                                                                                                href="javascript: void(0);">书签</a></li><li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option"
                                                                                                                                    data-uidsfdc="25"><a title="添加主题到本帖子" role="menuitem" onclick="SfdcApp.TopicsFeed.editFromMenu('0D59000000qAGPL')"
                                                                                                                                        href="javascript: void(0);">添加主题</a></li>
                                                                                                                        </ul>
                                                                                                                    </div>
                                                                                                                </span></span><a class="feeditemtimestamp" title="单击此帖子的单项目视图。" href="/0D59000000qAGPL">
                                                                                                                    两天前, 下午2:52</a> &nbsp;
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="feeditemextras cxchattertextareacontainer chattertextareacontainer">
                                                                                                    <div style="display: none" class="cxcomments feeditemcomments">
                                                                                                        <div style="display: none" class="cxlikecontainer feedItemExtrasMetaText">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div style="display: none" class="cxnewcomment newCommentContainer">
                                                                                                        <div class="feeditemcomment feeditemnewcomment feeditemcommenttext">
                                                                                                            <div class="feeditemcommentphotocontainer">
                                                                                                                <a class="feeditemcommentphoto" href="/0059000000390Wh">
                                                                                                                    <img alt="liu jack" title="liu jack" src="https://c.ap1.content.force.com/profilephoto/005/T">
                                                                                                                </a>
                                                                                                            </div>
                                                                                                            <div class="feeditemcommentnew  zen">
                                                                                                                <div class="newcommenttextwrapper">
                                                                                                                    <textarea title="编写留言..." role="textbox" tabindex="0" class="foobar cxnewcommenttext groupAtMentionsEnabled   chatterTopicsEnabled "></textarea>
                                                                                                                </div>
                                                                                                                <div style="display: none" class="cxvalidationmessage cxchattermessagecontainer chattermessagecontainer">
                                                                                                                </div>
                                                                                                                <div class="feeditemvisibilitycontainer">
                                                                                                                </div>
                                                                                                                <input type="button" onclick="chatter.getFeed().newComment(this, '0D59000000qAGPL', 'CreateRecordEvent');"
                                                                                                                    title="留言" value="留言" class="zen-btn cxnewcommentaction newcommentbutton cxchattersubmit">
                                                                                                                <div>
                                                                                                                    <a onmousedown="chatter.getFeed().contentCommentActionMouseDown(this);" onfocus="chatter.getFeed().contentCommentActionFocus(this);"
                                                                                                                        onclick="chatter.getFeed().createContentComment(this,'0D59000000qAGPL', false);"
                                                                                                                        class="cxcontentcommentaction" onblur="chatter.getFeed().contentCommentActionBlur(this);"
                                                                                                                        href="javascript:void(0);">
                                                                                                                        <img src="/s.gif" class="cxcontentcommentactionimg">
                                                                                                                        <span class="cxcontentcommentactiontext">附加文件</span> </a>
                                                                                                                </div>
                                                                                                                <div class="cxcontentcommentinfo">
                                                                                                                </div>
                                                                                                                <div class="feedclearfloat">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="feeditemcommentplaceholder cxcommentplaceholder" style="display: none">
                                                                                                        <label>
                                                                                                            <span>单击以留言</span>
                                                                                                            <input type="text" onkeypress="return chatter.getFeed().showCommentBoxViaPlaceholderOnKeyPress(this, event);"
                                                                                                                onfocus="return chatter.getFeed().showCommentBoxViaPlaceholder(this);" onclick="return chatter.getFeed().showCommentBoxViaPlaceholder(this);"
                                                                                                                class="cxcommentplaceholderaction" value="编写留言..." readonly="true">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div onmouseout="chatter.getToolbox().removeClassOnMouseOut(event, this, 'cxhover');"
                                                                                            onmouseover="Sfdc.Dom.addClass(this, 'cxhover');" data-hovdata="dir=chatterHover-above"
                                                                                            data-feeditem="{&quot;parentid&quot;:&quot;0059000000390Wh&quot;,&quot;parentname&quot;:&quot;用户&quot;,&quot;parentActualName&quot;:&quot;liu jack&quot;,&quot;feedItemType&quot;:&quot;CollaborationGroupCreated&quot;}"
                                                                                            class="cxfeeditem feeditem" id="0D59000000qAG9A" data-uidsfdc="96">
                                                                                            <span class=""><a href="/0059000000390Wh" data-uidsfdc="98"><span title="liu jack"
                                                                                                data-hovid="0059000000390Wh" class="chatter-avatar feeditemusericon chatter-avatarRegular"
                                                                                                data-uidsfdc="97" id="hoverItem97">
                                                                                                <img width="45" height="45" title="liu jack" class="chatter-photo" alt="liu jack"
                                                                                                    src="https://c.ap1.content.force.com/profilephoto/005/T"><img title="" class="chatter-avatarStyle"
                                                                                                        alt="" src="/s.gif"></span></a> </span>
                                                                                            <div class="feeditemcontent cxfeeditemcontent">
                                                                                                <div class="feeditembodyandfooter">
                                                                                                    <div class="feeditembody">
                                                                                                        <div class="preamblecontainer displayblock">
                                                                                                            <span><span class="feeditemfirstentity"><a data-hovid="0059000000390Wh" class="actorentitylink"
                                                                                                                href="/0059000000390Wh" data-uidsfdc="99" id="hoverItem99">liu jack</a></span> 已创建公用小组
                                                                                                                <a target="_blank" data-hovid="0F990000000UIub" class="feeditemsecondentity" href="/0F990000000UIub"
                                                                                                                    data-uidsfdc="100" id="hoverItem100">全部 yz</a>。</span>
                                                                                                        </div>
                                                                                                        <span class="feeditemtext cxfeeditemtext"></span>
                                                                                                        <div class="feeditemtopics">
                                                                                                            <div data-iswidget="false" data-referrer="FEED_ITEM_TOPIC" data-entityid="0D59000000qAG9A"
                                                                                                                id="topicContainer0D59000000qAG9A" class="topics init">
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="feeditemfooter">
                                                                                                        <span class="cxallfeedactions"><a onclick="chatter.getFeed().showCommentBoxViaAnchor(this);"
                                                                                                            class="feeditemactionlink cxaddcommentaction" title="此帖子的留言" href="javascript:void(0);">
                                                                                                            留言</a> <span class="cxfeeditemcommentdot feeditemseparatingdot">&nbsp;&nbsp;·&nbsp;&nbsp;</span>
                                                                                                            <a onclick="chatter.getFeed().likeItem(this, '0D59000000qAG9A', 'CollaborationGroupCreated');"
                                                                                                                class="feeditemactionlink cxlikeitemaction" style="" title="说此帖子赞" href="javascript:void(0);">
                                                                                                                赞</a> <a onclick="chatter.getFeed().unlikeItem(this, '0D59000000qAG9A');" class="feeditemactionlink cxunlikeitemaction"
                                                                                                                    style="display: none;" title="停止说此帖子赞" href="javascript:void(0);">取消赞</a>
                                                                                                            <span class="cxfeeditemlikedot feeditemseparatingdot">&nbsp;&nbsp;·&nbsp;&nbsp;</span>
                                                                                                            <span style="display: none;" class="bookmarked"><span class="zen-assistiveText">Feeditem
                                                                                                                已添加书签</span></span> <span class="feeditemActionMenu">
                                                                                                                    <div data-autofocus="false" data-expandmode="click" role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown"
                                                                                                                        class="zen-select " data-uidsfdc="39">
                                                                                                                        <a aria-haspopup="true" title="更多操作" onclick="" href="javascript:void(0);" class="zen-trigger feeditemActionMenuButton"
                                                                                                                            id="spillovermenu0D59000000qAG9A" data-uidsfdc="37"><b class=""></b></a>
                                                                                                                        <ul aria-labelledby="spillovermenu0D59000000qAG9A" role="menu" class="zen-options "
                                                                                                                            data-uidsfdc="38">
                                                                                                                            <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="26"><a
                                                                                                                                title="收藏此帖子为书签" role="menuitem" onclick="chatter.getFeed().bookmark(this, '0D59000000qAG9A');"
                                                                                                                                href="javascript: void(0);">书签</a></li><li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option"
                                                                                                                                    data-uidsfdc="27"><a title="添加主题到本帖子" role="menuitem" onclick="SfdcApp.TopicsFeed.editFromMenu('0D59000000qAG9A')"
                                                                                                                                        href="javascript: void(0);">添加主题</a></li>
                                                                                                                        </ul>
                                                                                                                    </div>
                                                                                                                </span></span><a class="feeditemtimestamp" title="单击此帖子的单项目视图。" href="/0D59000000qAG9A">
                                                                                                                    两天前, 下午2:50</a> &nbsp;
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="feeditemextras cxchattertextareacontainer chattertextareacontainer">
                                                                                                    <div style="display: none" class="cxcomments feeditemcomments">
                                                                                                        <div style="display: none" class="cxlikecontainer feedItemExtrasMetaText">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div style="display: none" class="cxnewcomment newCommentContainer">
                                                                                                        <div class="feeditemcomment feeditemnewcomment feeditemcommenttext">
                                                                                                            <div class="feeditemcommentphotocontainer">
                                                                                                                <a class="feeditemcommentphoto" href="/0059000000390Wh">
                                                                                                                    <img alt="liu jack" title="liu jack" src="https://c.ap1.content.force.com/profilephoto/005/T">
                                                                                                                </a>
                                                                                                            </div>
                                                                                                            <div class="feeditemcommentnew  zen">
                                                                                                                <div class="newcommenttextwrapper">
                                                                                                                    <textarea title="编写留言..." role="textbox" tabindex="0" class="foobar cxnewcommenttext groupAtMentionsEnabled   chatterTopicsEnabled "></textarea>
                                                                                                                </div>
                                                                                                                <div style="display: none" class="cxvalidationmessage cxchattermessagecontainer chattermessagecontainer">
                                                                                                                </div>
                                                                                                                <div class="feeditemvisibilitycontainer">
                                                                                                                </div>
                                                                                                                <input type="button" onclick="chatter.getFeed().newComment(this, '0D59000000qAG9A', 'CollaborationGroupCreated');"
                                                                                                                    title="留言" value="留言" class="zen-btn cxnewcommentaction newcommentbutton cxchattersubmit">
                                                                                                                <div>
                                                                                                                    <a onmousedown="chatter.getFeed().contentCommentActionMouseDown(this);" onfocus="chatter.getFeed().contentCommentActionFocus(this);"
                                                                                                                        onclick="chatter.getFeed().createContentComment(this,'0D59000000qAG9A', false);"
                                                                                                                        class="cxcontentcommentaction" onblur="chatter.getFeed().contentCommentActionBlur(this);"
                                                                                                                        href="javascript:void(0);">
                                                                                                                        <img src="/s.gif" class="cxcontentcommentactionimg">
                                                                                                                        <span class="cxcontentcommentactiontext">附加文件</span> </a>
                                                                                                                </div>
                                                                                                                <div class="cxcontentcommentinfo">
                                                                                                                </div>
                                                                                                                <div class="feedclearfloat">
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="feeditemcommentplaceholder cxcommentplaceholder" style="display: none">
                                                                                                        <label>
                                                                                                            <span>单击以留言</span>
                                                                                                            <input type="text" onkeypress="return chatter.getFeed().showCommentBoxViaPlaceholderOnKeyPress(this, event);"
                                                                                                                onfocus="return chatter.getFeed().showCommentBoxViaPlaceholder(this);" onclick="return chatter.getFeed().showCommentBoxViaPlaceholder(this);"
                                                                                                                class="cxcommentplaceholderaction" value="编写留言..." readonly="true">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <script type="text/javascript">
                                                                                            chatter.getYoutubeVideo().onPageLoaded();
    </script>
                                                                                    </div>
                                                                                    <script type="text/javascript">
                                                                                        chatter.getFeed().wire();
                                                                                        chatter.getFeed().setItemTypeFilter(null);
            
        </script>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li role="tabpanel" id="profileTabContent_sfdc.ProfilePlatformOverview" data-id="sfdc.ProfilePlatformOverview"
                                                                        aria-labeledby="profileTab_sfdc.ProfilePlatformOverview" aria-hidden="true" class="profileTabContent">
                                                                        <div class="profileOverview" id="profileOverview">
                                                                            <div class="profileTwoColumn">
                                                                                <div class="profileRightColumn">
                                                                                    <div class="profileTopicsDiv">
                                                                                    </div>
                                                                                    <div data-hovdata="dir=chatterHover-left" id="followerPanel" class="followers 0059000000390Wh thumbnailPanel profileSection"
                                                                                        data-uidsfdc="95">
                                                                                        <div class="vfButtonBar">
                                                                                            <div>
                                                                                                <h3>
                                                                                                    追随者</h3>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div>
                                                                                            <div class="panelEmptyContent">
                                                                                                没有追随者。
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <script type="text/javascript">                                                                                        chatter.getFollowersPanel().wire('0059000000390Wh');</script>
                                                                                    <div data-hovdata="dir=chatterHover-left" id="followingPanel" class="following thumbnailPanel profileSection"
                                                                                        data-uidsfdc="93">
                                                                                        <div class="vfButtonBar">
                                                                                            <div>
                                                                                                <a class="dialog_followingDialog" onclick="if(!window.followingDialog) { window.followingDialog = chatter.createModalOverlay({id:'followingDialog',height:'420',title:'正在追随',url:'/user/0059000000390Wh/following',params:{dialogId:'followingDialog'},onClose:function onClose() { SfdcApp.Chatter.FollowListOverlay.closeDialog('0059000000390Wh'); }});  window.followingDialog.register(); }  window.followingDialog.open();"
                                                                                                    href="javascript:void(0);"><span id="showFollowingLink">显示全部 (1)</span></a>
                                                                                            </div>
                                                                                            <div>
                                                                                                <h3>
                                                                                                    正在追随</h3>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div>
                                                                                            <table class="thumbnailTable">
                                                                                            </table>
                                                                                        </div>
                                                                                        <div class="entitiesList">
                                                                                            <ul>
                                                                                                <li data-hovid="069900000017xZK" data-uidsfdc="94" id="hoverItem94"><a class="fileTypeIcon entityLink"
                                                                                                    title="contact" href="/069900000017xZK">
                                                                                                    <img width="16" height="16" title="内容" class="sprite-doctype_csv_16" alt="内容" src="/s.gif">
                                                                                                    <span>contact</span> </a></li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="profileLeftColumn">
                                                                                    <div id="knowledgeableAbout" class="profileSection profileTopics">
                                                                                        <div class="vfButtonBar">
                                                                                            <h3>
                                                                                                了如指掌
                                                                                            </h3>
                                                                                        </div>
                                                                                        <div class="skillList">
                                                                                            <div id="skillPills">
                                                                                                <div class="panelEmptyContent">
                                                                                                    鼓励同行对专业知识领域进行背书。
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div id="profileAboutMe">
                                                                                        <div class="aboutMe profileSection">
                                                                                            <div class="vfButtonBar">
                                                                                                <h3>
                                                                                                    关于我
                                                                                                    <div class="vfButtonBarButton">
                                                                                                        <div class="editPen">
                                                                                                            <a class="aboutMeLaunch editLink" href="javascript:void(0);" data-uidsfdc="67">
                                                                                                                <img title="编辑简档" alt="编辑简档" src="/img/func_icons/util/pencil12.gif">
                                                                                                            </a>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </h3>
                                                                                                <script>
                                                                                                    Sfdc.onload(function () {
                                                                                                        SfdcApp.ChatterProfileSection.init('aboutMe', '.aboutMeLaunch ', "编辑简档", "/_ui/core/userprofile/ContactInfoEditPage?u=0059000000390Wh&amp;focus=aboutMe", 460, 670);
                                                                                                    });
            </script>
                                                                                            </div>
                                                                                            <div class="profileSectionBody">
                                                                                                <div class="panelEmptyContent">
                                                                                                    输入信息这样人们可以了解更多您的信息。
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="profileGroupsAndFiles">
                                                                                        <div class="profileFilesOwnedDiv">
                                                                                            <div class="recentFilesPanel profileSection" id="recentFilesPanel">
                                                                                                <div class="entityId">
                                                                                                    0059000000390Wh</div>
                                                                                                <div class="vfButtonBar">
                                                                                                    <div class="showAllLink">
                                                                                                        <a title="显示全部" href="/_ui/core/chatter/content/UserFileListPage?u=0059000000390Wh">
                                                                                                            显示全部</a>
                                                                                                    </div>
                                                                                                    <div>
                                                                                                        <h3>
                                                                                                            所拥有的文件</h3>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="content">
                                                                                                    <table data-hovdata="dir=chatterHover-above" class="recentFilesTable" data-uidsfdc="83"
                                                                                                        id="83">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <a class="fileTypeIcon" href="/068900000018kca" data-uidsfdc="85">
                                                                                                                        <img width="16" height="16" title="纯文本" data-hovid="0699000000181HJ" class="sprite-doctype_txt_16"
                                                                                                                            alt="纯文本" src="/s.gif" data-uidsfdc="84" id="hoverItem84"></a>
                                                                                                                </td>
                                                                                                                <td data-hovid="0699000000181HJ" data-uidsfdc="86" id="hoverItem86">
                                                                                                                    <span title="shopex" class="recentFilesItem" id="RecentFileItem_1690445458"><a href="/068900000018kca">
                                                                                                                        shopex</a> </span>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <a class="fileTypeIcon" href="/068900000018kcL" data-uidsfdc="88">
                                                                                                                        <img width="16" height="16" title="CSV" data-hovid="0699000000181H4" class="sprite-doctype_csv_16"
                                                                                                                            alt="CSV" src="/s.gif" data-uidsfdc="87" id="hoverItem87"><img title="" class="filePrivateIcon"
                                                                                                                                alt="" src="/s.gif"></a>
                                                                                                                </td>
                                                                                                                <td data-hovid="0699000000181H4" data-uidsfdc="89" id="hoverItem89">
                                                                                                                    <span title="Exp_20140828194816__" class="recentFilesItem" id="RecentFileItem_108162796">
                                                                                                                        <a href="/068900000018kcL">Exp_20140828194816__</a> </span>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <a class="fileTypeIcon" href="/068900000018gIV" data-uidsfdc="91">
                                                                                                                        <img width="16" height="16" title="CSV" data-hovid="069900000017xZK" class="sprite-doctype_csv_16"
                                                                                                                            alt="CSV" src="/s.gif" data-uidsfdc="90" id="hoverItem90"></a>
                                                                                                                </td>
                                                                                                                <td data-hovid="069900000017xZK" data-uidsfdc="92" id="hoverItem92">
                                                                                                                    <span title="contact" class="recentFilesItem" id="RecentFileItem_1120947010"><a href="/068900000018gIV">
                                                                                                                        contact</a> </span>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="profileGroupsDiv">
                                                                                            <div data-hovdata="dir=chatterHover-left" id="groupListPanel" class="thumbnailPanel profileSection"
                                                                                                data-uidsfdc="80">
                                                                                                <div class="vfButtonBar">
                                                                                                    <div>
                                                                                                        <a onclick="if(!window.groupListDialog) {window.groupListDialog = new GroupListAccessibleUrlDialog('groupListDialog', '小组', '/user/0059000000390Wh/grouplistoverlay', '0059000000390Wh', '420');window.groupListDialog.width=500;window.groupListDialog.register();}window.groupListDialog.open(null);"
                                                                                                            id="moreGroupsLink" href="javascript:%20void%280%29%3B">显示全部 (1)</a>
                                                                                                    </div>
                                                                                                    <div>
                                                                                                        <h3>
                                                                                                            小组</h3>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="groupList">
                                                                                                    <ul>
                                                                                                        <li data-gid="0F990000000UIub">
                                                                                                            <div data-hovid="0F990000000UIub" class="groupThumbnail" data-uidsfdc="81" id="hoverItem81">
                                                                                                                <a title="全部 yz" href="/_ui/core/chatter/groups/GroupProfilePage?g=0F990000000UIub">
                                                                                                                    <span title="全部 yz" class="chatter-avatarMedium chatter-avatar">
                                                                                                                        <img width="30" height="30" title="全部 yz" class="chatter-photo" alt="全部 yz" src="https://c.ap1.content.force.com/profilephoto/72990000000JOUb/T"><img
                                                                                                                            title="" class="chatter-avatarStyle" alt="" src="/s.gif"></span></a>
                                                                                                            </div>
                                                                                                            <div class="groupLabel">
                                                                                                                <div>
                                                                                                                    <a title="全部 yz" data-hovid="0F990000000UIub" class="entityLink" href="/0F990000000UIub"
                                                                                                                        data-uidsfdc="82" id="hoverItem82">全部 yz</a>
                                                                                                                </div>
                                                                                                                <div class="memberCount">
                                                                                                                    <span class="membercount">1</span> 位成员
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </li>
                                                                                                    </ul>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="clearingBox">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="clearingBox">
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="clearingBox">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearingBox">
                                            </div>
                                        </div>
                                    </div>
                            <!-- Body events -->
                            <script type="text/javascript">                                function bodyOnLoad() { SfdcApp.Umps.widgetLoader.addWidget({ "userId": "0059000000390Wh", "method": "UMPSWidget.paintGreenDot", "containerId": "presenceDot_0059000000390Wh" }); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcCmp.init(Sfdc.get('.profileHeaderContent')); SfdcApp.Chatter.ProfileTabSet.initialize('0059000000390Wh', 'sfdc.ProfilePlatformFeed'); SfdcApp.ChatterProfileSection.init('aboutMe', '.editAboutMe', '编辑简档', '/_ui/core/userprofile/ContactInfoEditPage?u=0059000000390Wh&amp;focus=aboutMe', '460', '670'); SfdcApp.Umps.widgetLoader.init({ "url": "https://umps1t4.salesforce.com/umps/UMPSWidget_184/js/Widgets/UMPSWidget.js?v=174.1" }); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fcore%2Fuserprofile%2FUserProfilePage&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1413968079431'; SfdcApp.TopicsFeed.setupHandlers('topicContainer0D59000000qV7ln'); SfdcApp.TopicsFeed.setupHandlers('topicContainer0D59000000qAGPL'); SfdcApp.TopicsFeed.setupHandlers('topicContainer0D59000000qAG9A'); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "oFQvg.SMes7My2hts13lxz72KhtQGUueVEW860Yc0qC8pJ4_S4qTXkwy3VcgzjroufHR9C.paq6AC0jHHH7Au.zrqcVm.Z4tcd01NujwGGI0S._WjPyElFTRWxgUEc3ptw4o8oQG4wfotEzKoX7eNHoqmcWuImMUXsOD4Zcjdedjn7r0Ne7GS.R4ZBgZREe86Tg_Ag=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                            <!-- End page content -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1413975103000, "host": "login.salesforce.com", "oid": "00D90000000yvHG", "server": "", "act": "u" };</script>
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script src="/jslibrary/sfdc/KnowledgeableAbout.js" defer="true"></script>
    <script>    //    var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1406927496000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/sfdc/SfdcSessionBase190.js"></script> 
    <div id="uploadPhoto" role="dialog" aria-live="assertive" aria-describedby="uploadPhotoTitle"
        class="overlayDialog " style="width: 400px;">
        <div class="topRight movable">
            <a onfocus="document.getElementById(&quot;uploadPhotoX&quot;).focus()" title="对话框开头"
                style="width: 2px; height: 2px; position: absolute; border: 0; margin: 0; padding: 0;
                background: none; outline: none; z-index: -1; cursor: none;" onclick="return false;"
                href="javascript:void(0)" id="uploadPhotoFocusPoint">对话框开头</a>
            <div class="topLeft">
                <a class="dialogClose" href="javascript:void(0)" onclick="sfdcPage.getDialogById('uploadPhoto').cancel()"
                    onmouseout="this.className = 'dialogClose'" onmouseover="this.className = 'dialogCloseOn'"
                    tabindex="0" title="关闭" id="uploadPhotoX">关闭</a><h2 id="uploadPhotoTitle">
                        上载简档照片</h2>
            </div>
        </div>
        <div class="middle">
            <div id="uploadPhotoContent" class="innerContent">
                <h2 id="uploadPhotoHeader">
                </h2>
                <div id="uploadPhotoInner">
                </div>
            </div>
        </div>
        <div class="bottomRight">
            <label for="uploadPhotoBlurCatch" style="display: none;">
                '&nbsp;'</label>
            <input type="text" style="width: 2px; height: 2px; position: absolute; border: 0;
                margin: 0; padding: 0; background: none; outline: none; z-index: -1; cursor: none;"
                id="uploadPhotoBlurCatch">
            <div class="bottomLeft">
            </div>
        </div>
    </div>
    <div id="contactInfo" role="dialog" aria-live="assertive" aria-describedby="contactInfoTitle"
        class="overlayDialog " style="width: 670px;">
        <div class="topRight movable">
            <a onfocus="document.getElementById(&quot;contactInfoX&quot;).focus()" title="对话框开头"
                style="width: 2px; height: 2px; position: absolute; border: 0; margin: 0; padding: 0;
                background: none; outline: none; z-index: -1; cursor: none;" onclick="return false;"
                href="javascript:void(0)" id="contactInfoFocusPoint">对话框开头</a>
            <div class="topLeft">
                <a class="dialogClose" href="javascript:void(0)" onclick="sfdcPage.getDialogById('contactInfo').cancel()"
                    onmouseout="this.className = 'dialogClose'" onmouseover="this.className = 'dialogCloseOn'"
                    tabindex="0" title="关闭" id="contactInfoX">关闭</a><h2 id="contactInfoTitle">
                        编辑简档</h2>
            </div>
        </div>
        <div class="middle">
            <div id="contactInfoContent" class="innerContent">
                <h2 id="contactInfoHeader">
                </h2>
                <div id="contactInfoInner">
                </div>
            </div>
        </div>
        <div class="bottomRight">
            <label for="contactInfoBlurCatch" style="display: none;">
                '&nbsp;'</label>
            <input type="text" style="width: 2px; height: 2px; position: absolute; border: 0;
                margin: 0; padding: 0; background: none; outline: none; z-index: -1; cursor: none;"
                id="contactInfoBlurCatch">
            <div class="bottomLeft">
            </div>
        </div>
    </div>
    <div id="aboutMe" role="dialog" aria-live="assertive" aria-describedby="aboutMeTitle"
        class="overlayDialog " style="width: 670px;">
        <div class="topRight movable">
            <a onfocus="document.getElementById(&quot;aboutMeX&quot;).focus()" title="对话框开头"
                style="width: 2px; height: 2px; position: absolute; border: 0; margin: 0; padding: 0;
                background: none; outline: none; z-index: -1; cursor: none;" onclick="return false;"
                href="javascript:void(0)" id="aboutMeFocusPoint">对话框开头</a>
            <div class="topLeft">
                <a class="dialogClose" href="javascript:void(0)" onclick="sfdcPage.getDialogById('aboutMe').cancel()"
                    onmouseout="this.className = 'dialogClose'" onmouseover="this.className = 'dialogCloseOn'"
                    tabindex="0" title="关闭" id="aboutMeX">关闭</a><h2 id="aboutMeTitle">
                        编辑简档</h2>
            </div>
        </div>
        <div class="middle">
            <div id="aboutMeContent" class="innerContent">
                <h2 id="aboutMeHeader">
                </h2>
                <div id="aboutMeInner">
                </div>
            </div>
        </div>
        <div class="bottomRight">
            <label for="aboutMeBlurCatch" style="display: none;">
                '&nbsp;'</label>
            <input type="text" style="width: 2px; height: 2px; position: absolute; border: 0;
                margin: 0; padding: 0; background: none; outline: none; z-index: -1; cursor: none;"
                id="aboutMeBlurCatch">
            <div class="bottomLeft">
            </div>
        </div>
    </div>
    
</body>
</html>
