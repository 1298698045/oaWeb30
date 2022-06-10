<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigureMyTabs.aspx.cs"
    Inherits="WebClient.setup.layout.ConfigureMyTabs" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>自定义我的选项卡 ~ Salesforce.com - Professional Edition</title>
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
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
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
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411677186000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-10-8 上午10:03", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": true }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
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
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '106.39.222.40', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fp%2Fsetup%2Flayout%2FConfigureMyTabs%3FretURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DDisplayAndLayout%26setupid%3DCustomizeTabs');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif setupTab  ConfigureMyTabs sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv_setup">
            <table class="outer setupV2" width="100%" id="bodyTable" border="0" cellspacing="0"
                cellpadding="0">
                <tr>
                    <td class="oLeft">
                        <cc1:SetupNavTree2 ID="SetupNavTree1" Version="2" runat="server" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="pageType noSecondHeader">
                                                自定义我的选项卡</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Duser_userdisplay_tabs.htm%2526section%253DPersonal_Setup%2526language%253Dzh_CN%2526release%253D190.18.17%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="bDescription">
                            选择要在您的每一个应用程序中显示的选项卡。</div>
                        <form action="/p/setup/layout/ConfigureMyTabs?setupid=CustomizeTabs" id="editPage"
                        method="post" name="editPage" onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');">
                        <input type="hidden" name="_CONFIRMATIONTOKEN" id="_CONFIRMATIONTOKEN" value="6gFOUYTRjpxTNwBS289IMvLwF6nkS5uhG9jy1kT1QRhXveTZ9qI5MzZynHYWhT65F8kkCgGNewqN61MT67Fm8nVuZtqMvjLLlwtdaeVo8ni5aw5A95ODy0_JClZgzIghWrxLqMCZcWVlXGexDVG7CvzVnH1qVDyfVRHV_GnBLY70N.Pn" /><input
                            type="hidden" name="cancelURL" id="cancelURL" value="/ui/setup/Setup?setupid=DisplayAndLayout" /><input
                                type="hidden" name="duel0" id="duel0" value="" /><input type="hidden" name="duel1"
                                    id="duel1" value="" /><input type="hidden" name="p5" id="p5" value="02u900000017Abi" /><input
                                        type="hidden" name="p6" id="p6" value="" /><input type="hidden" name="retURL" id="retURL"
                                            value="/ui/setup/Setup?setupid=DisplayAndLayout" /><input type="hidden" name="save_new_url"
                                                id="save_new_url" value="/p/setup/layout/ConfigureMyTabs?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDisplayAndLayout&amp;setupid=CustomizeTabs" /><input
                                                    type="hidden" name="setupid" id="setupid" value="CustomizeTabs" /><script>                                                                                                                          var defaultTabWarning = new DefaultTabWarning('duel_select_1');</script><script
                                                        language="Javascript1.2">
var oldTabs = new Array();
oldTabs[0] = 'home';
oldTabs[1] = '01r90000000vnDj';
oldTabs[2] = 'Campaign';
oldTabs[3] = 'Lead';
oldTabs[4] = 'Contact';
oldTabs[5] = 'Account';
oldTabs[6] = 'report';
oldTabs[7] = 'Dashboard';
oldTabs[8] = 'Chatter';
oldTabs[9] = 'File';

function tabSetSelChange(item) {
  saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');;

  var sel = document.getElementById('duel_select_1');
  var hasChanged = sel.options.length != oldTabs.length;
  if (!hasChanged) {
    for (var i = 0; i < oldTabs.length; i++) {
      if (oldTabs[i] !=  sel.options[i].value) {
        hasChanged = true;
        break;
      }
    }
  }
  if (hasChanged) {
    var s = '在切换到"_new_tab_set_name_"之前是否要保存对"市场营销"的自定义？';
    if (window.confirm(s.replace(/_new_tab_set_name_/, item.options[item.selectedIndex].text))) {
      document.editPage.p6.value = '1';
    }
  }
  document.editPage.submit();
}
                                                    </script>
                        <div class="bPageBlock brandSecondaryBrd bEditBlock bLayoutBlock secondaryPalette"
                            id="ep">
                            <div class="pbHeader pbHeaderEmpty">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="12" height="1" class="minWidth" title="" style="margin-right: 0.25em;
                                                margin-right: 0.25em; margin-right: 0.25em;" /><h2 class="mainTitle">
                                                </h2>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div class="pbError" id="errorDiv_ep" style="display: none">
                                    错误：无效数据。<br />
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <label for="p4">
                                                    <span class="requiredMark">*</span>自定义应用程序：</label>
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <select id="p4" name="p4" onchange="javascript:tabSetSelChange(this);">
                                                    <option value="02u900000017Abg">平台</option>
                                                    <option value="02u900000017Abf">销售</option>
                                                    <option value="02u900000017Abh">Salesforce Chatter</option>
                                                    <option value="02u900000017Abi" selected="selected">市场营销</option>
                                                    <option value="02u900000017Abj">Call Center</option>
                                                    <option value="02u90000001A1V8">人力资源</option>
                                                    <option value="02u90000001A2ec">内容</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol empty">
                                                &nbsp;
                                            </td>
                                            <td class="dataCol empty" colspan="3">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr class="detailRow last">
                                            <td colspan='4'>
                                                <div class="duelingListBox" id="duel">
                                                    <div class="errorMsg" id="editPage_duel_errorMsg" style="display: none">
                                                        &nbsp;</div>
                                                    <table class="layout">
                                                        <tr>
                                                            <td class="selectCell">
                                                                <div class="selectTitle">
                                                                    <label for="duel_select_0">
                                                                        可用选项卡</label></div>
                                                                <select id="duel_select_0" multiple="multiple" name="duel_select_0" size="11" style="width: 200px">
                                                                    <option value="JigsawSearch">Data.com</option>
                                                                    <option value="01r90000000wrUQ">报销单</option>
                                                                    <option value="Product2">产品</option>
                                                                    <option value="Order">订单</option>
                                                                    <option value="Case">个案</option>
                                                                    <option value="Contract">合同</option>
                                                                    <option value="Pricebook2">价格手册</option>
                                                                    <option value="UserProfile">简档</option>
                                                                    <option value="ProfilePlatformOverview">简档概览</option>
                                                                    <option value="ProfilePlatformFeed">简档摘要</option>
                                                                    <option value="Solution">解决方案</option>
                                                                    <option value="Console">控制台</option>
                                                                    <option value="01r90000000wql5">请假条</option>
                                                                    <option value="OtherUserProfile">人员</option>
                                                                    <option value="Document">文档</option>
                                                                    <option value="CollaborationGroup">小组</option>
                                                                    <option value="Opportunity">业务机会</option>
                                                                    <option value="Forecasting3">预测</option>
                                                                </select>
                                                            </td>
                                                            <td class="zen-phs buttonCell">
                                                                <div class="text">
                                                                    添加</div>
                                                                <div class="zen-mbs text">
                                                                    <a href="javascript:if (!document.getElementById('duel_select_0').disabled&& !document.getElementById('duel_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');}"
                                                                        id="duel_select_0_right">
                                                                        <img src="/s.gif" alt="添加" class="rightArrowIcon" title="添加" /></a></div>
                                                                <div class="text">
                                                                    <a href="javascript:if (!document.getElementById('duel_select_0').disabled&& !document.getElementById('duel_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0,'--无--', ['home'],  ['主页选项卡不能删除，且必须为第一个选项卡。'] ,'--无--',false,null,'editPage_duel_errorMsg');}"
                                                                        id="duel_select_0_left">
                                                                        <img src="/s.gif" alt="删除" class="leftArrowIcon" title="删除" /></a></div>
                                                                <div class="duelingText">
                                                                    删除</div>
                                                            </td>
                                                            <td class="selectCell">
                                                                <div class="selectTitle">
                                                                    <label for="duel_select_1">
                                                                        选定选项卡</label></div>
                                                                <select id="duel_select_1" multiple="multiple" name="duel_select_1" size="11" style="width: 200px">
                                                                    <option value="home">主页</option>
                                                                    <option value="01r90000000vnDj">Getting Started</option>
                                                                    <option value="Campaign">市场活动（默认）</option>
                                                                    <option value="Lead">潜在客户</option>
                                                                    <option value="Contact">联系人</option>
                                                                    <option value="Account">客户</option>
                                                                    <option value="report">报表</option>
                                                                    <option value="Dashboard">仪表板</option>
                                                                    <option value="Chatter">Chatter</option>
                                                                    <option value="File">文件</option>
                                                                </select>
                                                            </td>
                                                            <td class="zen-phs buttonCell">
                                                                <div class="text">
                                                                    向上</div>
                                                                <div class="zen-mbs text">
                                                                    <a href="javascript:window.editPage_DLBEInstance.instMoveUp(document.editPage.duel_select_1, 'home', null, '主页选项卡不能删除，且必须为第一个选项卡。','editPage_duel_errorMsg');"
                                                                        id="duel_select_1_up">
                                                                        <img src="/s.gif" alt="向上" class="upArrowIcon" title="向上" /></a></div>
                                                                <div class="text">
                                                                    <a href="javascript:window.editPage_DLBEInstance.instMoveDown(document.editPage.duel_select_1, 'home', null, '主页选项卡不能删除，且必须为第一个选项卡。','editPage_duel_errorMsg');"
                                                                        id="duel_select_1_down">
                                                                        <img src="/s.gif" alt="向下" class="downArrowIcon" title="向下" /></a></div>
                                                                <div class="text">
                                                                    向下</div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <script>                                                        window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_select_0', 'duel_select_1'], 'editPage_duel_errorMsg', function () { return defaultTabWarning.defaultIsSelectedToMove(); }, '市场活动 是此应用程序的默认登录选项卡。如果您将其删除，那么在您首次进入此应用程序时，您将看到 主页 选项卡而非 市场活动 选项卡。仍想删除 市场活动 吗？');</script>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="pbBottomButtons">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="12" height="1" class="minWidth" title="" style="margin-right: 0.25em;
                                                margin-right: 0.25em; margin-right: 0.25em;" />&nbsp;
                                        </td>
                                        <td class="pbButtonb" id="bottomButtonRow">
                                            <input value=" 保存 " class="primary btn" title="保存" name="save" type="submit" />
                                            <input value=" 取消 " class="btn" title="取消" name="cancel" type="submit" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script>                            if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "cancel"]); }</script>
                        </form>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "Pndrxj1J.XgsWemtavPtm9e_rm0bshF1D685c4IKvZXH6ZH6Nb4Qweo6AdSjua3V7cOo8f6a2kfxHaf1nbQJLjCkNle2TjtMfZHvML4tGq6_Ikyvfkbc7ZD2p7Vs7W9FzCiNNKdByMTHZCHPENhJdNeqcb544Sk5laNVG8QcZFDT3E.Nt4Bjtk01FLH152aAmOTFig=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>        walkthrough = { log: function () { Sfdc.ClientLogging.addRelay(new Sfdc.ClientLogging.ConsoleLogger(), true); Sfdc.log("Console logging is ON."); } };</script>
    <script>        walkthrough.trials = {};</script>
    <script>        var SFDCSessionVars = { "uid": "005900000038QVZ", "exp": 1412740865000, "host": "login.salesforce.com", "oid": "00D90000000yI4o", "server": "https://login.salesforce.com/login/sessionserver190.html", "act": "u" };</script>
    <script defer="true" src="/jslibrary/sfdc/Setup.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/WalkthroughCorePlatform.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/WalkthroughTrials.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
</body>
</html>
<!-- page generation time: 66ms -->
