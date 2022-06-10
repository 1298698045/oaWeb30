<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createWF.aspx.cs" Inherits="WebClient.apps.wf.createWF" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程定义: <%=ProcessName%> 流程管理 ~ 协同办公系统 - 高效协同</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/Campaign.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <!--<script src="/jslibrary/sfdc/GuidedTour.js"></script>-->
     <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/Business.js"></script>
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-09-25 下午3:21", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-MM-dd ah:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif campaignTab  overviewPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <!--
            <div class="bPageTitle dashBackLink">
                <div class="ptBreadcrumb" style="font-size: 12px;">
                    &nbsp;<a shouldstayinownframe="true" href="/01Z?fcf=00l90000001tbML">转到仪表板列表</a>
                    | &nbsp;<a shouldstayinownframe="true" href="/01Z?fcf=00l90000001tbML">转到仪表板列表</a>
                </div>
            </div>
            -->
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="outer">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td class=" sidebarCell sidebarCollapsible sidebarCollapsed" id="sidebarCell">
                            <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                        </td>
                        <td id="bodyCell" class="oRight">
                            <!-- Start page content -->
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img title="市场活动" class="pageTitleIcon" alt="市场活动" src="/s.gif"><h1 class="pageType noSecondHeader">编辑流程定义：<%=ProcessName%></h1>
                                        <div class="blank">
                                            &nbsp;
                                        </div>
                                    </div>
                                    <div class="links">
                                        <a title="此页面的帮助 （新窗口）" href="#"><span class="helpLink">此页面的帮助</span><img class="helpIcon"
                                            alt="" src="/s.gif"></a>
                                    </div>
                                </div>
                                <div class="ptBreadcrumb">
                                </div>
                            </div>
                                 <script type="text/javascript">
                                     function searchUsers() {
                                         document.getElementById("fsharefsharegroups").checked = true;
                                         var sel = document.getElementById("sharing_search");
                                         if (sel.value == "U") {
                                             var srchText = jQuery("#searchValue_sharing_search").val();
                                             searchAllUsers(fillUserList, srchText);
                                         }
                                         else if (sel.value == "B") {
                                             var srchText = jQuery("#searchValue_sharing_search").val();
                                             searchAllDepts(fillDeptList, srchText);
                                         }
                                         else {
                                             //duel_select_0Var.doSearch();
                                             //duel_select_0Var.doSearch();
                                             duel_select_0Var.doSearch();
                                             {
                                                 Sfdc.Dom.show('duel');
                                                 document.getElementById('fsharefsharegroups').checked = true;
                                             }
                                         }
                                     }
                                     function fillUserList(data) {
                                         var arrData = new Array();
                                         var allowAdded = true;
                                         var sele = document.getElementById("duel_select_0");
                                         jQuery('#duel_select_0').find('option').remove();
                                         var type = jQuery('#sharing_search').val();

                                         if (data) {
                                             //debugger;
                                             for (var i = 0; i < data.length; i++) {
                                                 var item = data[i];
                                                 sele.add(new Option('用户：' + item.name, type + ':' + item.id));
                                                 //['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, '']
                                                 if (allowAdded) {
                                                     var data2 = [type, '用户：' + item.name, type + ':' + item.id, item.name, existingSelduel_select_0, ''];
                                                     arrData[i] = data2;
                                                 }
                                             }
                                             //arrData += "]";
                                             if (allowAdded) {
                                                 duel_select_0Var.addOptions(false, arrData);
                                             }
                                         }
                                     }

                                     function fillDeptList(data) {
                                         var arrData = new Array();
                                         var allowAdded = true;
                                         var sele = document.getElementById("duel_select_0");
                                         jQuery('#duel_select_0').find('option').remove();
                                         var type = jQuery('#sharing_search').val();

                                         if (data) {
                                             //debugger;
                                             for (var i = 0; i < data.length; i++) {
                                                 var item = data[i];
                                                 sele.add(new Option('部门：' + item.text, type + ':' + item.id));
                                                 //['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, '']
                                                 if (allowAdded) {
                                                     var data2 = [type, '部门：' + item.text, type + ':' + item.id, item.text, existingSelduel_select_0, ''];
                                                     arrData[i] = data2;
                                                 }
                                             }
                                             //arrData += "]";
                                             if (allowAdded) {
                                                 duel_select_0Var.addOptions(false, arrData);
                                             }
                                         }
                                     }

                                        </script>
                            <script src="/static/js/picklist.js"></script>
                            <form enctype="application/x-www-form-urlencoded" onsubmit="saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }"
                                name="editPage" method="post" id="editPage" action="/121/e">

                                <input type="hidden" value="createWF.aspx" id="save_new_url" name="save_new_url">
                                <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                                <input name="duel0" id="duel0" value="" type="hidden">
                                <input name="duel1" id="duel1" value="" type="hidden">
                                <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">流程定义编辑</h2>
                                                    </td>
                                                    <td id="topButtonRow" class="pbButton">
                                                        <input type="submit" name="save" title="保存" class="btn" value=" 保存 " /><!--
                                                                <input type="submit" name="save_new" title="保存并新建" class="btn" value=" 保存并新建 " />-->
                                                        <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 " />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbBody">
                                        <div style="display: none" id="errorDiv_ep" class="pbError">
                                            错误：无效数据。<br />
                                            请查看下列所有错误消息以纠正数据。
                                        </div>
                                        <div id="head_1_ep" class="pbSubheader brandTertiaryBgr first tertiaryPalette">
                                            <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                                <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                    class="requiredText"> = 必填信息</span></span></span><h3>步骤 1。流程信息<span class="titleSeparatingColon">:</span></h3>
                                        </div>
                                        <div class="pbSubsection">
                                            <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                                <tbody>
                                                    <tr>
                                                        <td class="labelCol requiredInput">
                                                            <label for="cpn1">
                                                                <span class="requiredMark">*</span>流程名称</label>
                                                        </td>
                                                        <td class="dataCol col02">
                                                            <div class="requiredInput">
                                                                <div class="requiredBlock">
                                                                </div>
                                                                <input type="text" tabindex="1" size="20" name="wfName" maxlength="80" id="wfName" value="<%=ProcessName%>" />
                                                            </div>
                                                        </td>
                                                        <td class="labelCol">
                                                            <label>
                                                                所有人</label>
                                                        </td>
                                                        <td class="dataCol">
                                                            <%=OwnerName%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="labelCol">
                                                            <label for="cpn16">
                                                                <span class="requiredMark">*</span>关联表单</label>
                                                        </td>
                                                        <td class="dataCol col02">
                                                            <div class="requiredInput">
                                                                <div class="requiredBlock">
                                                                </div>
                                                                <input type="hidden" value="<%=EntityLayoutId%>" id="entityLayout_lkid" name="entityLayout_lkid" />
                                                                <input type="hidden" value="" id="entityLayout_lkold" name="entityLayout_lkold" />
                                                                <input type="hidden" value="FormLookup" id="entityLayout_lktp" name="entityLayout_lktp" />
                                                                <input type="hidden" value="0" id="entityLayout_lspf" name="entityLayout_lspf" />
                                                                <input type="hidden" value="0" id="entityLayout_lspfsub" name="entityLayout_lspfsub" />
                                                                <input type="hidden" value="0" id="entityLayout_mod" name="entityLayout_mod" />
                                                                <input type="hidden" value="" name="entityLayout_onpk" id="entityLayout_onpk" />
                                                                <span class="lookupInput">
                                                                    <input type="text" value="<%=EntityLayoutName%>" tabindex="1" size="20" onchange="getElementByIdCS('entityLayout_lkid').value='';getElementByIdCS('entityLayout_mod').value='1';"
                                                                        name="entityLayout" maxlength="255" id="entityLayout" /><a title="表单 查找（新窗口）" tabindex="1" onclick="setLastMousePosition(event)"
                                                                            id="entityLayout_lkwgt" href="javascript:formpicker('entityLayout')"><img
                                                                                title="表单 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="表单 查找（新窗口）"
                                                                                src="/s.gif"></a>
                                                                </span>
                                                            </div>
                                                        </td>
                                                         <td class="labelCol last">
                                                                <label for="cpn6">
                                                                    隐藏流程</label>
                                                            </td>
                                                            <td class="dataCol last">
                                                                <input type="checkbox" name="IsHide" id="IsHide" value="0"  />隐藏流程
                                                            </td>
                                                    </tr>
                                                        <!--
                                                    <td class="dataCol col02">
                                                        <div class="requiredInput">
                                                            <div class="requiredBlock">
                                                            </div>
                                                            <input type="hidden" value="<%=EntityObjectId%>" id="objectId_lkid"
                                                                name="objectId_lkid"><input type="hidden" value="" id="objectId_lkold" name="objectId_lkold"><input
                                                                    type="hidden" value="EntityLookup" id="objectId_lktp" name="objectId_lktp"><input type="hidden"
                                                                        value="0" id="objectId_lspf" name="objectId_lspf"><input type="hidden" value="0" id="objectId_lspfsub"
                                                                            name="objectId_lspfsub"><input type="hidden" value="0" id="objectId_mod" name="objectId_mod"><input
                                                                                type="hidden" value=""
                                                                                name="objectId_onpk" id="objectId_onpk">
                                                            <span class="lookupInput">
                                                                <input type="text" value="<%=EntityObjectName%>" tabindex="1" size="20" onchange="getElementByIdCS('objectId_lkid').value='';getElementByIdCS('objectId_mod').value='1';"
                                                                    name="objectId" maxlength="255" id="objectId" /><a title="被分配人 查找（新窗口）" tabindex="1" onclick="setLastMousePosition(event)"
                                                                        id="objectId_lkwgt" href="javascript:%20openLookup%28%27%2F_ui%2Fcommon%2Fdata%2FLookupPage%3Flkfm%3DeditPage%26lknm%3DobjectId%26lktp%3D%27%20%2B%20getElementByIdCS%28%27objectId_lktp%27%29.value%2C670%2C%271%27%2C%27%26lksrch%3D%27%20%2B%20escapeUTF%28getElementByIdCS%28%27objectId%27%29.value.substring%280%2C%2080%29%29%29"><img
                                                                            title="被分配人 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="被分配人 查找（新窗口）"
                                                                            src="/s.gif"></a></span></div>
                                                    </td>
                                                    <td class="labelCol">
                                                        <label for="cpn3">
                                                            状态</label>
                                                    </td>
                                                    <td class="dataCol">
                                                        <span>
                                                            <select tabindex="5" name="cpn3" id="cpn3">
                                                                <option value="">--无--</option>
                                                                <option value="0">草稿</option>
                                                                <option value="1">已启用</option>
                                                                <option value="2">已停用</option>
                                                            </select></span><script>       new picklist('cpn3', '25', null, ['Planned', 'Planned'], ' id=\"cpn3\" name=\"cpn3\" tabindex=\"5\"', true, true);</script>
                                                    </td>
                                                     </tr>-->
                                                       
                                                        <tr>
                                                            <td class="labelCol">
                                                                <label for="cpn2">
                                                                    <span class="requiredMark">*</span>流程分类</label>
                                                            </td>
                                                            <td class="dataCol col02">
                                                                <div class="requiredInput">
                                                                    <div class="requiredBlock">
                                                                    </div>
                                                                    <input type="hidden" name="parent_lkid" id="parent_lkid" value="<%=FolderId%>" /><input type="hidden" name="parent_lkold" id="parent_lkold" value="" />
                                                                    <input type="hidden" name="parent_lktp" id="parent_lktp" value="WorkFlowFolderLookup" /><input type="hidden" name="parent_lspf" id="parent_lspf" value="1" />
                                                                    <input type="hidden" name="parent_lspfsub" id="parent_lspfsub" value="0" />
                                                                    <input type="hidden" name="parent_mod" id="parent_mod" value="1" />
                                                                    <span class="lookupInput">
                                                                        <input type="text" id="parent" maxlength="255" name="parent" onchange="getElementByIdCS('parent_lkid').value='';getElementByIdCS('parent_mod').value='1';" size="20" tabindex="4" value="<%=FolderName%>" />
                                                                        <a href="javascript:treeNodePicker('parent','processCategoryTree')"
                                                                             id="parent_lkwgt" onclick="setLastMousePosition(event)" 
                                                                            tabindex="4" title="分类 查找（新窗口）">
                                                                            <img src="/s.gif" alt="分类 查找（新窗口）" class="lookupIcon" 
                                                                                onblur="this.className = 'lookupIcon';" 
                                                                                onfocus="this.className = 'lookupIconOn';" 
                                                                                onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" 
                                                                                onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" 
                                                                                title="客户名 查找（新窗口）">
                                                                        </a></span>
                                                                </div>
                                                            </td>
                                                            <td class="labelCol last">
                                                                <label for="cpn6">
                                                                    附件</label>
                                                            </td>
                                                            <td class="dataCol last">
                                                                <input type="checkbox" name="requireAttach" id="requireAttach" value="1"  <%=RequireAttachHTML%> />必须上传附件
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                           <td class="labelCol requiredInput">
                                                            <label for="cpn1">
                                                                <span class="requiredMark">*</span>显示顺序</label>
                                                             </td>
                                                        <td class="dataCol col02">
                                                            <div class="requiredInput">
                                                                <div class="requiredBlock">
                                                                </div>
                                                                <input type="text" tabindex="7" size="20" name="Position" maxlength="80" id="Position" value="<%=Position%>" />
                                                            </div>
                                                        </td>
                                                        <td class="labelCol">
                                                            <label>
                                                                </label>
                                                        </td>
                                                        <td class="dataCol">
                                                            
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="labelCol last">
                                                                <label for="cpn4">
                                                                    描述</label><div class="textCounterOuter">
                                                                        <div class="textCounterMiddle">
                                                                            <div id="cpn4_counter" class="textCounter">
                                                                                32000 剩余
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                            </td>
                                                            <td colspan="3" class="data2Col last">
                                                                <textarea wrap="soft" type="text" tabindex="8" rows="6" onmousedown="handleTextAreaElementChangeWithByteCheck('cpn4', 32000, 0, '剩余', '超出极限');"
                                                                    onkeyup="handleTextAreaElementChangeWithByteCheck('cpn4', 32000, 0, '剩余', '超出极限');"
                                                                    onkeydown="handleTextAreaElementChangeWithByteCheck('cpn4', 32000, 0, '剩余', '超出极限');"
                                                                    onclick="handleTextAreaElementChangeWithByteCheck('cpn4', 32000, 0, '剩余', '超出极限');"
                                                                    onchange="handleTextAreaElementChangeWithByteCheck('cpn4', 32000, 0, '剩余', '超出极限');"
                                                                    name="description" maxlength="32000" id="cpn4" cols="75"><%=Description%></textarea>
                                                            </td>
                                                        </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="pbSubblock">
                                            <div class="pbSubheader brandTertiaryBgr tertiaryPalette">
                                                <h3>步骤 2。限制可视性</h3>
                                            </div>
                                            <div class="pbSubbody">
                                                <!--<input class=" radio" id="fsharefsharenone" name="fshare" onclick="Sfdc.Dom.hideByDisplay('duel')" value="fsharenone" type="radio"><label for="fsharefsharenone">仅对<b>我</b>可视</label><br>-->
                                                <input class=" radio" <%=ShareAll%> id="fsharefshareall" name="fshare" onclick="    Sfdc.Dom.hideByDisplay('duel')" value="fshareall" type="radio" /><label for="fsharefshareall"><b>所有用户</b><!--皆可视（包括合作伙伴和客户入口网站用户）--></label><br/>
                                                <input class=" radio" <%=ShareGroups%> id="fsharefsharegroups" name="fshare" onclick="    Sfdc.Dom.show('duel');" value="fsharegroups" type="radio" /><label for="fsharefsharegroups">某些<b>用户组</b>可视</label><%=this.ShareScriptHTML%><br/>
                                                <br/>
                                                <div class="duelingListBox" id="duel" data-uidsfdc="27" style="display:block;">
                                                    <div class="errorMsg" id="editPage_duel_errorMsg" style="display: none">&nbsp;</div>
                                                    <div>
                                                        <label for="sharing_search">搜索：</label>&nbsp;<select id="sharing_search" name="sharing_search" onchange="duel_select_0Var.filter()" title="小组类型">
                                                            <option value="R" selected="">公用小组</option>
                                                            <option value="B">部门</option>
                                                            <option value="A">角色</option>
                                                            <option value="U">用户</option>
                                                            <!--<option value="D">角色、内部和入口网站下属</option>
                                                            <option value="I">角色和内部下属</option>-->
                                                        </select>&nbsp;&nbsp;<label for="searchValue_sharing_search">属于：</label>&nbsp;
                                                        <input id="searchValue_sharing_search" maxlength="80" name="searchValue_sharing_search" onkeydown="return duel_select_0Var.handleKeyDown(event);" onpropertychange="duel_select_0Var.handlePropertyChange();{Sfdc.Dom.show('duel');document.getElementById('fsharefsharegroups').checked=true;}" size="20" type="text">
                                                        &nbsp;<input value=" 查找 " class="btn" id="go_duel_select_0Var" name="go_duel_select_0" onclick="searchUsers()" title="查找" type="button"><br/>
                                                        <div class="errorMsg" id="error_duel_select_0" style="visibility: hidden;"></div>
                                                    </div>
                                                    <table class="layout" style="display:block">
                                                        <tbody>
                                                            <tr>
                                                                <td class="selectCell">
                                                                    <div class="selectTitle">
                                                                        <label for="duel_select_0">可供共享</label></div>
                                                                    <select id="duel_select_0" multiple="multiple" name="duel_select_0" size="14">
                                                                        <%=AvailableSelectOptions%>
                                                                    </select></td>
                                                                <td class="zen-phs buttonCell">
                                                                    <div class="text">添加</div>
                                                                    <div class="zen-mbs text"><a href="javascript:if%20%28%21document.getElementById%28%27duel_select_0%27%29.disabled%26%26%20%21document.getElementById%28%27duel_select_1%27%29.disabled%29%20%7Bduel_select_0Var.beforeMoveRight%28%29%3B%3Bwindow.editPage_DLBEInstance.instMoveOption%28document.editPage.duel_select_0%2C%20document.editPage.duel_select_1%2Cwindow.editPage_DLBEInstance.emptyLabel%2C%20%5B%5D%2C%20null%2Cwindow.editPage_DLBEInstance.emptyLabel%2Cfalse%2Cnull%2C%27editPage_duel_errorMsg%27%29%3B%7D" id="duel_select_0_right">
                                                                        <img src="/img/s.gif" alt="添加" class="rightArrowIcon" title="添加"></a></div>
                                                                    <div class="text"><a href="javascript:if%20%28%21document.getElementById%28%27duel_select_0%27%29.disabled%26%26%20%21document.getElementById%28%27duel_select_1%27%29.disabled%29%20%7Bwindow.editPage_DLBEInstance.instMoveOption%28document.editPage.duel_select_1%2C%20document.editPage.duel_select_0%2Cwindow.editPage_DLBEInstance.emptyLabel%2C%20%5B%5D%2C%20null%2Cwindow.editPage_DLBEInstance.emptyLabel%2Cfalse%2Cnull%2C%27editPage_duel_errorMsg%27%29%3Bduel_select_0Var.moveLeft%28%29%3B%7D" id="duel_select_0_left">
                                                                        <img src="/img/s.gif" alt="删除" class="leftArrowIcon" title="删除"></a></div>
                                                                    <div class="duelingText">删除</div>
                                                                </td>
                                                                <td class="selectCell">
                                                                    <div class="selectTitle">
                                                                        <label for="duel_select_1">共享用户</label></div>
                                                                    <select id="duel_select_1" multiple="multiple" name="duel_select_1" size="14">
                                                                        <%=SelectedOptions%>
                                                                    </select></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <script>window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_select_0', 'duel_select_1'], 'editPage_duel_errorMsg'); window.editPage_DLBEInstance.emptyLabel = '--无--';</script>
                                                </div>
                                                <div id="deptTree" style="display:block">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pbBottomButtons">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif">&nbsp;
                                                    </td>
                                                    <td id="bottomButtonRow" class="pbButtonb">
                                                        <input type="submit" title="保存" tabindex="14" name="save" class="btn" value=" 保存 "><!--
                                                                <input type="submit" title="保存并新建" tabindex="15" name="save_new" class="btn" value=" 保存并新建 ">-->
                                                        <input type="submit" title="取消" tabindex="16" name="cancel" class="btn" value=" 取消 ">
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
                                <script>                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "save_new", "cancel"]); }</script>
                            </form>
                            <script>                                picklist.initAll()</script>
                            <script>                                window.sfdcPage.appendToOnloadQueue(function () {
                                    DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Campaign&amp;setupid=CampaignFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Campaign&amp;retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&amp;setupid=CampaignFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Campaign", "newUrl": "/01I/e?retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&amp;setupid=Campaign", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&amp;tableEnumOrId=Campaign&amp;setupid=CampaignValidations", "newUrl": "/03d/e?retURL=%2F701%2Fo&amp;TableEnumOrId=Campaign&amp;Active=1&amp;setupid=CampaignValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017Abi/e?retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&amp;setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑布局", "hoverText": "自定义此页面布局", "url": "/layouteditor/layoutEditor.apexp?type=Campaign&amp;lid=00h9000000QXrw1&amp;retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&amp;setupid=CampaignLayouts", "newWindow": false, "newInNewWindow": false, "section": 1 }]);
                                    new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&amp;retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo");
                                });</script>
                            <script type="text/javascript">
                                var duel_select_0Var = new SelectFilterElement("sharing_search", "R", "duel_select_0", "", "duel_select_1", 100, true, null);
                                var existingSelduel_select_0 = document.getElementById('duel_select_1');
                                duel_select_0Var.addOptions(false, [<%=AvailableSelectOptions%>]);
                                if (existingSelduel_select_0 != null && existingSelduel_select_0.options.length == 0) {
                                    existingSelduel_select_0.options[0] = new Option('--无--', '');
                                }
                            </script>
                            <!-- Body events -->
                            <script type="text/javascript">
                                function bodyOnLoad() {
                                    //new ForeignKeyInputElement("Parent", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "701" });
                                    handleTextAreaElementChangeWithByteCheck('cpn4', 32000, 0, '剩余', '超出极限'); setFocusOnLoad();
                                    //if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                    //if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                                    //if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ;
                                    //if (this.loadChatFrameJs) loadChatFrameJs();
                                    //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                    // new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    // SfdcApp.MruHovers.global_data.url = 'retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1411289494410';
                                    if (document.getElementById('sidebarDiv')) {
                                        Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                    };
                                    // if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "2ydEC9835.yUtg.d4tXcEthTwFNjtT6RxndSEvbKBkM6KjKib4QtaN.TIjrCSE0YQ=="; };
                                }
                                function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                                function bodyOnFocus() { closePopupOnBodyFocus(); }
                                function bodyOnUnload() { }</script>
                            <div id="datePicker" class="datePicker">
                                <div class="dateBar">
                                    <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                        onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();"
                                        onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select
                                            title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
                                            <option value="01">二月</option>
                                            <option value="02">三月</option>
                                            <option value="03">四月</option>
                                            <option value="04">五月</option>
                                            <option value="05">六月</option>
                                            <option value="06">七月</option>
                                            <option value="07">八月</option>
                                            <option value="08">九月</option>
                                            <option value="09">十月</option>
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
                                            </select>
                                </div>
                                <div class="calBody">
                                    <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                                        <tbody>
                                            <tr>
                                                <th scope="col" class="dayOfWeek">星期日
                                                </th>
                                                <th scope="col" class="dayOfWeek">星期一
                                                </th>
                                                <th scope="col" class="dayOfWeek">星期二
                                                </th>
                                                <th scope="col" class="dayOfWeek">星期三
                                                </th>
                                                <th scope="col" class="dayOfWeek">星期四
                                                </th>
                                                <th scope="col" class="dayOfWeek">星期五
                                                </th>
                                                <th scope="col" class="dayOfWeek">星期六
                                                </th>
                                            </tr>
                                            <tr id="calRow1" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow2" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow3" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow4" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow5" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow6" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">&nbsp;
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="buttonBar">
                                        <a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday"
                                            href="javascript:%20void%280%29%3B">今天</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End page content -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script type="text/javascript" src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script type="text/javascript" src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script>
        function treeNodePicker(a, b) {
            $('#iframe').show().attr('src', '/alert/common/treeNodePicker.html?lknm=' + a + '&treename=' + b+'&title=流程分类')
            $('.popup-mask').show()
        }
        function formpicker(a) {
            $('#iframe').show().attr('src', '/apps/wf/formPicker.html?lknm=' + a)
            $('.popup-mask').show()
        }
    </script>
    <script src="/js/addiframe.js"></script>
    
</body>
</html>
