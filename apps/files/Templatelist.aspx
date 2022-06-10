<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Templatelist.aspx.cs" Inherits="WebClient.apps.files.Templatelist" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>正文、套红模板 ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/setup.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/emailAdministration.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/1412954762000/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DevContextMenu.js"></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = false;
        }
    </script>
    <script>        window.sfdcPage = new ListPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-6-4 下午2:52", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/setup.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/emailAdministration.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script>    //    ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.161', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F01H%3FretURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DCommunicationTemplates%26setupid%3DCommunicationTemplatesWord');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif setupTab  listPage sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
     <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" /><div
        id="contentWrapper">
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
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="pageType noSecondHeader">
                                                正文模板</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="bDescription">
                          可从在线帮助下载示例模板。单击"新建模板"可上载新的正文模板。</div>
                        <script type="text/javascript">
                            function createTemplate() {
                                window.open('/apps/files/DocTemplateEdit.aspx', 'newTemp');
                            }
                        </script>
                        <center>
                            <input value=" 新建模板 " class="btn" name="edit" onclick="createTemplate();"
                                title="新建模板" type="button" /></center>
                        <!-- Begin ListElement -->
                        <!-- motif: Setup -->
                        <div class="bNext">
                            <div class="withFilter">
                                <div class="rolodex"><!--
                                    <a href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=0"
                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">A</span></a><a
                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=1"
                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">B</span></a><a
                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=2"
                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">C</span></a><a
                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=3"
                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">D</span></a><a
                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=4"
                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">E</span></a><a
                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=5"
                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">F</span></a><a
                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=6"
                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">G</span></a><a
                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=7"
                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">H</span></a><a
                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=8"
                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">I</span></a><a
                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=9"
                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">J</span></a><a
                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=10"
                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">K</span></a><a
                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=11"
                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">L</span></a><a
                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=12"
                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">M</span></a><a
                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=13"
                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">N</span></a><a
                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=14"
                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">O</span></a><a
                                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=15"
                                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">P</span></a><a
                                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=16"
                                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">Q</span></a><a
                                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=17"
                                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">R</span></a><a
                                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=18"
                                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">S</span></a><a
                                                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=19"
                                                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">T</span></a><a
                                                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=20"
                                                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">U</span></a><a
                                                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=21"
                                                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">V</span></a><a
                                                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=22"
                                                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">W</span></a><a
                                                                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=23"
                                                                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">X</span></a><a
                                                                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=24"
                                                                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">Y</span></a><a
                                                                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=25"
                                                                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">Z</span></a><a
                                                                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=26"
                                                                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">其他</span></a>--><span
                                                                                                                                                    class="listItemSelected listItemLast">全部</span></div>
                            </div>
                        </div>
                        <!-- WrappingClass -->
                        <div class="listRelatedObject setupBlock">
                            <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                <div class="pbHeader">
                                </div>
                                <div class="pbBody">
                                    <table class="list" border="0" cellspacing="0" cellpadding="0">
                                        <tr class="headerRow">
                                            <th scope="col" class="actionColumn">操作</th>
                                            <th scope="col" class=" zen-deemphasize">
                                                <a href="#"
                                                    title="名称 - 已按升序排序">名称<img src="/s.gif" alt="按升序排序" class="sortAsc" title="按升序排序" /></a>
                                            </th>                                            
                                            <th scope="col" class=" zen-deemphasize">
                                                <a href="#"
                                                    title="文档类型 - 单击此处按升序排序">文档类型</a>
                                            </th>                                          
                                            <th scope="col" class=" zen-deemphasize">
                                                <a href="#"
                                                    title="创建人别名 - 单击此处按升序排序">创建人别名</a>
                                            </th>
                                            <th scope="col" class=" zen-deemphasize">
                                                <a href="#"
                                                    title="创建日期 - 单击此处按升序排序">创建日期</a>
                                            </th>
                                        </tr>
                                         <%=BodyText%>
                                    </table>
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="listElementBottomNav">
                            <div class="bNext">
                                <div class="rolodex"><!--
                                    <a href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=0"
                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">A</span></a><a
                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=1"
                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">B</span></a><a
                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=2"
                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">C</span></a><a
                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=3"
                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">D</span></a><a
                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=4"
                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">E</span></a><a
                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=5"
                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">F</span></a><a
                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=6"
                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">G</span></a><a
                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=7"
                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">H</span></a><a
                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=8"
                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">I</span></a><a
                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=9"
                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">J</span></a><a
                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=10"
                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">K</span></a><a
                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=11"
                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">L</span></a><a
                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=12"
                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">M</span></a><a
                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=13"
                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">N</span></a><a
                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=14"
                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">O</span></a><a
                                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=15"
                                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">P</span></a><a
                                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=16"
                                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">Q</span></a><a
                                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=17"
                                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">R</span></a><a
                                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=18"
                                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">S</span></a><a
                                                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=19"
                                                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">T</span></a><a
                                                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=20"
                                                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">U</span></a><a
                                                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=21"
                                                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">V</span></a><a
                                                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=22"
                                                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">W</span></a><a
                                                                                                                                    href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=23"
                                                                                                                                    class="listItem" shouldstayinownframe="true"><span class="listItemPad">X</span></a><a
                                                                                                                                        href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=24"
                                                                                                                                        class="listItem" shouldstayinownframe="true"><span class="listItemPad">Y</span></a><a
                                                                                                                                            href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=25"
                                                                                                                                            class="listItem" shouldstayinownframe="true"><span class="listItemPad">Z</span></a><a
                                                                                                                                                href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord&amp;lsc=26"
                                                                                                                                                class="listItem" shouldstayinownframe="true"><span class="listItemPad">其他</span></a>--><span
                                                                                                                                                    class="listItemSelected listItemLast">全部</span></div>
                            </div>
                        </div>
                        <!-- End ListElement -->
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, '8bnCmbTMcWE7_w7ugrg8bJnQg8MgRSbEjGKYRn24Iyvc_rgSAnurhPiUmwR1atBBarb5ZGwVpLvzR.N5UpT5VHf66JTLz5iE6Y4uhGRgykKWaSIjObHoaA0_p_ZeMGVdzpUhBwbKRry0Yksd1v.lR3iBK0ZPUT.2ZeCrXx630_1jMVEz'); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '搜索所有设置...', 'quickFindInput version2', 'quickfindInput ghostText version2', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "XRoXCq5kYsrFglA5ydmXkcIcfZSLr6_35SUla2VyRrGsSdTcLCBz110zRMMAZSssh_DoMmfk8ej508HgD4EjhA5X94ovJovBryqY5dLYv9o9klSEDsDY5ROuPmPezN2bLlI5HMQL0yYaNhm8xYAZpJYWAfpzL1TBsDRw7VWLcBwUW3X8BDLJBwSF88HmfILjnuS_2Q=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
          <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1433407880000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>
    <script defer="true" src="/jslibrary/1424969980000/sfdc/Setup.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1424969980000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1425578748000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
</body>
</html>
<!-- page generation time: 288ms -->
