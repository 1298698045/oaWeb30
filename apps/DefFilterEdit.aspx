<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefFilterEdit.aspx.cs"
    Inherits="WebClient.apps.DefFilterEdit" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title><%=EntityTitle%>: 新建视图 ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/FilterEdit.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-5-22 上午9:13", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Case';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script>    //    ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.175', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fui%2Flist%2FFilterEditPage%3Fftype%3Dt%26retURL%3D%252F500%26cancelURL%3D%252F500%252Fo');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab filterEdit FilterEditPage sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form id="sessiontimeout" method="post" name="sessiontimeout" onsubmit="if (window.ffInAlert) { return false; }">
    <input type="hidden" name="continueButton" id="continueButton" value="继续工作" /><input
        type="hidden" name="doNotTimeoutLocation" id="doNotTimeoutLocation" value="/page/timeoutrefresh.aspx" /><input
            type="hidden" name="doTimeoutLocation" id="doTimeoutLocation" value="https://login..com/?ec=301&amp;startURL=%2Fpage%2Ftimeoutrefresh.aspx&amp;stbdtimeout=1" /><input
                type="hidden" name="logoutButton" id="logoutButton" value="退出" /><input type="hidden"
                    name="timeoutText" id="timeoutText" value="由于安全原因，您的  会话即将超时。<br><br>您希望作何选择？" /></form>
    <script>        var secondsLeftValue = 7027, secondsPopupValue = 6997, lastPageActivityTime = (new Date).getTime(), forceLogout = true; function startSessionTimer() { schedulePopup(7027, 6997) } function schedulePopup(a, b) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); forceLogout && null != redirectUniqueId && clearTimeout(redirectUniqueId); if (forceLogout) { redirectUniqueId = setTimeout(logout, 1E3 * a); } timeoutUniqueId = setTimeout(alertTimeout, 1E3 * b) } function logout() { (forceLogout && "function" == typeof getRTimeout) ? getRTimeout() : doLogout() } function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; redirectUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsLeftValue, secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function updateRedirectTimeouts(a) { "undefined" != typeof a && (secondsLeftValue = a); null != redirectUniqueId && clearTimeout(redirectUniqueId); redirectUniqueId = setTimeout(logout, 1E3 * (secondsLeftValue)); } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    <a href="#skiplink" class="navSkipLink zen-skipLink zen-assistiveText">跳到主内容</a><div
        id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
           <uc1:topright id="TopRight1" runat="server" />
            <uc1:mainnav id="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                     <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                       <cc1:LeftQuickMenu runat="server" id="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="个案" class="pageTitleIcon" title="个案" /><h1 class="pageType">
                                                <%=EntityTitle%><span class="titleSeparatingColon">:</span></h1>
                                            <h2 class="pageDescription">
                                                新建视图</h2>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                            <form action="/ui/list/FilterEditPage" id="editPage" method="post" name="editPage"
                            onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');saveAllSelected([ document.editPage.colselector_select_0, document.editPage.colselector_select_1 ], [ document.editPage.colselector0, document.editPage.colselector1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }">
                            <input type="hidden"  name="colselector0" id="colselector0" value="" />
                            <input type="hidden" name="colselector1"  id="colselector1" value="" />
                            <input type="hidden" name="duel0" id="duel0" value="" />
                            <input type="hidden" name="duel1" id="duel1" value="" />
                            <input type="hidden" name="f_standalone"  id="f_standalone" value="0" />
                            <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                                <div class="pbHeader">
                                                            <table>
                                                                <tr>
                                                                    <td class="pbTitle">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="pbButtonb">
                                                                        <input value=" 保存 " class="primary btn" name="save" title="保存" type="submit" /><input
                                                                            value=" 取消 " class="btn" name="cancel" title="取消" type="submit" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                            <div class="pbBody">
                                <div class="pbSubblock">
                                    <div class="pbSubheader brandTertiaryBgr first tertiaryPalette">
                                        <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                            <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                class="requiredText"> = 必填信息</span></span></span><h3>
                                                    步骤 1。输入视图名称</h3>
                                    </div>
                                    <div class="pbSubbody">
                                        <table>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="fname">
                                                        <span class="requiredMark">*</span>视图名称:</label>
                                                </td>
                                                <td class="dataCol">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <input id="fname" maxlength="40" name="fname" onblur="DeveloperNameInputElement.setName(this, document.getElementById(&#39;devname&#39;), &#39;View&#39;);"
                                                            size="40" type="text" value="<%=QueryName%>" /></div>
                                                </td>
                                            </tr><!--
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="devname">
                                                        <span class="requiredMark">*</span>视图唯一名称:</label>
                                                </td>
                                                <td class="dataCol">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <input id="devname" maxlength="80" name="devname" size="20" type="text" /><div class="mouseOverInfoOuter"
                                                            onfocus="addMouseOver(this)" onmouseover="addMouseOver(this)" tabindex="0">
                                                            <img src="/s.gif" alt="" class="infoIcon" title="" /><div class="mouseOverInfo" style="display: none;">
                                                                API 和受管软件包使用的唯一名称。名称必须以字母开头，仅使用字母数字字符和下划线。名称不能以下划线结尾或包含两条连续的下划线。</div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>-->
                                        </table>
                                    </div>
                                </div>
                                <div class="pbSubblock">
                                    <div class="pbSubheader brandTertiaryBgr tertiaryPalette">
                                        <h3>
                                            步骤 2。指定过滤条件</h3>
                                    </div>
                                    <div class="pbSubbody">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td nowrap="nowrap" width="25%">
                                                    <strong>按所有人过滤：</strong><br />
                                                    <input class=" radio" checked="checked" id="fscope0" name="fscope" onchange="FilterEdit.prototype.disableDiv('div_rep',!this.checked)"
                                                        type="radio" value="0" /><label for="fscope0">全部</label><script>    document.getElementById("fscope0").checked = true;</script><br />
                                                    <input class=" radio" id="fscope1" name="fscope" onchange="FilterEdit.prototype.disableDiv('div_rep',this.checked)"
                                                        type="radio" value="1" /><label for="fscope1">我的</label><br /><!--
                                                    <input class=" radio" id="fscope9" name="fscope" onchange="FilterEdit.prototype.disableDiv('div_rep',this.checked)"
                                                        type="radio" value="9" /><label for="fscope9">队列</label><select id="fentity" name="fentity"
                                                            title="队列"><option value="">--无--</option>
                                                        </select><br />
                                                    <input class=" radio" id="fscope36" name="fscope" type="radio" value="36" /><label
                                                        for="fscope36">我的个案小组</label>-->
                                                </td>
                                                <td align="right" nowrap="nowrap">
                                                    <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                        class="tipsLink" title="高级筛选器帮助 （新窗口）"><span class="helpLink brandTertiaryFgr">高级筛选器帮助</span><img
                                                            src="/s.gif" alt="帮助" class="helpIcon" title="帮助" /></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <strong>按附加字段过滤（可选）：</strong><ul>
                                        </ul>
                                        <table class="declarativeFilterTable">
                                            <tr>
                                                <th scope="col">
                                                    &nbsp;
                                                </th>
                                                <th scope="col">
                                                    字段
                                                </th>
                                                <th scope="col">
                                                    运算符
                                                </th>
                                                <th scope="col">
                                                    值
                                                </th>
                                            </tr>
                                            <%=FilterConditionHTML%>
                                        </table>
                                        <input type="hidden" id="lookup" name="lookup" value="" /><span class="addRemoveControl"
                                            id="frowButtons" style="display: none"><a href="javascript:addRow%28%29%3B" id="fAddRowLink">添加行</a><span
                                                class="greyedLink" id="fAddRowLinkGreyed">添加行</span>&nbsp;<a href="javascript:removeRow%28%29%3B"
                                                    id="fRemoveRowLink">删除行</a><span class="greyedLink" id="fRemoveRowLinkGreyed">删除行</span></span><div
                                                        class="addRemoveControl booleanFilterTopMargin">
                                                        <script>                                                            var lastRow = 4; greyLink('fRemoveRowLink'); unGreyLink('fAddRowLink'); function onLoadBooleanFilter() { if (document.getElementById('bool_filter').value && document.getElementById('bool_filter_span').style.display == 'none') { toggleBooleanFilter(); } } function greyLink(linkId) { if (document.getElementById(linkId)) { document.getElementById(linkId).style.display = 'none'; document.getElementById(linkId + 'Greyed').style.display = ''; } } function unGreyLink(linkId) { if (document.getElementById(linkId)) { document.getElementById(linkId).style.display = ''; document.getElementById(linkId + 'Greyed').style.display = 'none'; } } function addRow() { if (lastRow < 9) { toggleRow(++lastRow, true); } document.getElementById('fAddRowLink').blur(); } function removeRow() { if (lastRow > 4) { toggleRow(lastRow--, false); } document.getElementById('fRemoveRowLink').blur(); } function toggleRow(row, showing) { var displayRow = showing ? '' : 'none'; var x = row + 1; document.getElementById('frow' + x).style.display = displayRow; var op = document.getElementById('fop' + x); op.style.width = document.getElementById('fop' + 1).style.width; if (!showing) { document.getElementById('fcol' + x).selectedIndex = 0; document.getElementById('fop' + x).selectedIndex = 0; document.getElementById('fval' + x).value = ''; document.getElementById('flkp' + x).style.display = 'none'; } if (lastRow > 4) { unGreyLink('fRemoveRowLink'); } else greyLink('fRemoveRowLink'); if (lastRow < 9) { unGreyLink('fAddRowLink'); } else greyLink('fAddRowLink'); } function toggleBooleanFilter() { if (document.getElementById('fcol1').disabled) return; var bool_filter = document.getElementById('bool_filter_span'); var showing = (bool_filter.style.display == 'none'); var display = showing ? '' : 'none'; var displayRow = showing ? (isIE ? 'block' : 'table-row') : 'none'; if (document.getElementById('frowButtons')) { document.getElementById('frowButtons').style.display = displayRow; } bool_filter.style.display = display; document.getElementById('bool_filter_toggle').innerHTML = showing ? '清除高级选项' : '添加筛选逻辑'; if (!showing) { document.getElementById('bool_filter').value = ''; lastRow = 4; } else if (!document.getElementById('bool_filter').value || (document.getElementById('bool_filter').value == '')) { var initialBoolFilter = ''; for (var i = 0; i < 10; i++) { var x = i + 1; var colEle = document.getElementById('fcol' + x); if (typeof colEle.selectedIndex == 'number' ? colEle.selectedIndex != 0 : colEle.value.length > 0) { if (initialBoolFilter.length > 0) initialBoolFilter += ' AND '; initialBoolFilter += (i + 1); } } document.getElementById('bool_filter').value = initialBoolFilter; } var andVisibility = showing ? 'hidden' : 'visible'; for (var i = 0; i < 10; i++) { if (i >= 5 && !showing) toggleRow(i, showing); var x = i + 1; document.getElementById('f' + x).style.display = display; if (i < 4) document.getElementById('and' + x).style.visibility = andVisibility; } }</script>
                                                        <a href="javascript:toggleBooleanFilter%28%29" id="bool_filter_toggle">添加筛选逻辑</a><br />
                                                        <span id="bool_filter_span" style="display: none">
                                                            <label for="bool_filter">
                                                                筛选器逻辑：</label><br />
                                                            <input id="bool_filter" maxlength="120" name="bool_filter" size="80" type="text" />&nbsp;<a
                                                                href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                                class="tipsLink" title="提示 （新窗口）"><span class="helpLink brandTertiaryFgr">提示</span><img
                                                                    src="/s.gif" alt="帮助" class="helpIcon" title="帮助" /></a><br />
                                                            <img src="/img/zh/report_boolean_filter.gif" alt="使用过滤器打开以上提示链接，寻求帮助" width="533"
                                                                height="211" title="使用过滤器打开以上提示链接，寻求帮助" /><br />
                                                        </span>
                                                    </div>
                                    </div>
                                </div>
                                <div class="pbSubblock">
                                    <div class="pbSubheader brandTertiaryBgr tertiaryPalette">
                                        <h3>
                                            步骤 3。选择要显示的字段</h3>
                                    </div>
                                    <div class="pbSubbody">
                                        <div class="duelingListBox" id="colselector">
                                            <div class="errorMsg" id="editPage_colselector_errorMsg" style="display: none">
                                                &nbsp;</div>
                                            <table class="layout">
                                                <tr>
                                                    <td class="selectCell">
                                                        <div class="selectTitle">
                                                            <label for="colselector_select_0">
                                                                可用字段</label></div>
                                                        <select id="colselector_select_0" multiple="multiple" name="colselector_select_0"
                                                            size="15">
                                                             <%=AvaliableFields%>
                                                        </select>
                                                    </td>
                                                    <td class="zen-phs buttonCell">
                                                        <div class="text">
                                                            添加</div>
                                                        <div class="zen-mbs text">
                                                            <a href="javascript:if (!document.getElementById('colselector_select_0').disabled&& !document.getElementById('colselector_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.colselector_select_0, document.editPage.colselector_select_1,'--无--', [], null,'--无--',false,null,'editPage_colselector_errorMsg');}"
                                                                id="colselector_select_0_right">
                                                                <img src="/s.gif" alt="添加" class="rightArrowIcon" title="添加" /></a></div>
                                                        <div class="text">
                                                            <a href="javascript:if (!document.getElementById('colselector_select_0').disabled&& !document.getElementById('colselector_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.colselector_select_1, document.editPage.colselector_select_0,'--无--', [], null,'--无--',true,'列表不能为空。', 'editPage_colselector_errorMsg');}"
                                                                id="colselector_select_0_left">
                                                                <img src="/s.gif" alt="删除" class="leftArrowIcon" title="删除" /></a></div>
                                                        <div class="duelingText">
                                                            删除</div>
                                                    </td>
                                                    <td class="selectCell">
                                                        <div class="selectTitle">
                                                            <label for="colselector_select_1">
                                                                选取的字段</label></div>
                                                        <select id="colselector_select_1" multiple="multiple" name="colselector_select_1"
                                                            size="15">
                                                            <%=DisplayColums%>
                                                        </select>
                                                    </td>
                                                    <td class="zen-phs buttonCell">
                                                        <div class="text">
                                                            顶部</div>
                                                        <div class="text">
                                                            <a href="javascript:window.editPage_DLBEInstance.instMoveTop(document.editPage.colselector_select_1,'editPage_colselector_errorMsg');">
                                                                <img src="/s.gif" alt="顶部" class="doubleArrowUp" title="顶部" /></a></div>
                                                        <div class="text">
                                                            向上</div>
                                                        <div class="zen-mbs text">
                                                            <a href="javascript:window.editPage_DLBEInstance.instMoveUp(document.editPage.colselector_select_1, null, null, null,'editPage_colselector_errorMsg');"
                                                                id="colselector_select_1_up">
                                                                <img src="/s.gif" alt="向上" class="upArrowIcon" title="向上" /></a></div>
                                                        <div class="text">
                                                            <a href="javascript:window.editPage_DLBEInstance.instMoveDown(document.editPage.colselector_select_1, null, null, null,'editPage_colselector_errorMsg');"
                                                                id="colselector_select_1_down">
                                                                <img src="/s.gif" alt="向下" class="downArrowIcon" title="向下" /></a></div>
                                                        <div class="text">
                                                            向下</div>
                                                        <div class="text">
                                                            <a href="javascript:window.editPage_DLBEInstance.instMoveBottom(document.editPage.colselector_select_1,'editPage_colselector_errorMsg');">
                                                                <img src="/s.gif" alt="底部" class="doubleArrowDwn" title="底部" /></a></div>
                                                        <div class="text">
                                                            底部</div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <script>                                                window.editPage_DLBEInstance = new DuelingListBoxesElement(['colselector_select_0', 'colselector_select_1'], 'editPage_colselector_errorMsg');</script>
                                        </div>
                                    </div>
                                </div>
                                <div class="pbSubblock">
                                    <div class="pbSubheader brandTertiaryBgr tertiaryPalette">
                                        <h3>
                                            步骤 4。限制可视性</h3>
                                    </div>
                                    <div class="pbSubbody">
                                        <input class=" radio" checked="checked" id="fsharefsharenone" name="fshare" onclick="Sfdc.Dom.hideByDisplay('duel')"
                                            type="radio" value="fsharenone" /><label for="fsharefsharenone">仅对<b>我</b>可视</label><script>  document.getElementById("fsharefsharenone").checked = true;</script><br />
                                        <input class=" radio" id="fsharefshareall" name="fshare" onclick="Sfdc.Dom.hideByDisplay('duel')"
                                            type="radio" value="fshareall" /><label for="fsharefshareall"><b>所有用户</b>皆可视（包括合作伙伴和客户入口网站用户）</label><br />
                                        <input class=" radio" id="fsharefsharegroups" name="fshare" onclick="Sfdc.Dom.show('duel');"
                                            type="radio" value="fsharegroups" /><label for="fsharefsharegroups">某些<b>用户组</b>可视</label><br />
                                        <br />
                                        <div class="duelingListBox" id="duel">
                                            <div class="errorMsg" id="editPage_duel_errorMsg" style="display: none">
                                                &nbsp;</div>
                                            <div>
                                                <label for="sharing_search">
                                                    搜索：</label>&nbsp;<select id="sharing_search" name="sharing_search" onchange="duel_select_0Var.filter()"
                                                        title="小组类型">
                                                        <option value="R" selected>公用小组</option>
                                                        <option value="A">角色</option>
                                                        <option value="D">角色、内部和入口网站下属</option>
                                                        <option value="I">角色和内部下属</option>
                                                    </select>&nbsp;&nbsp;<label for="searchValue_sharing_search">属于：</label>&nbsp;<input
                                                        id="searchValue_sharing_search" maxlength="80" name="searchValue_sharing_search"
                                                        onkeydown="return duel_select_0Var.handleKeyDown(event);" onpropertychange="duel_select_0Var.handlePropertyChange();{Sfdc.Dom.show('duel');document.getElementById('fsharefsharegroups').checked=true;}"
                                                        size="20" type="text" />&nbsp;<input value=" 查找 " class="btn" id="go_duel_select_0Var"
                                                            name="go_duel_select_0" onclick="duel_select_0Var.doSearch();{Sfdc.Dom.show('duel');document.getElementById('fsharefsharegroups').checked=true;}"
                                                            title="查找" type="button" /><br />
                                                <div class="errorMsg" id="error_duel_select_0">
                                                </div>
                                            </div>
                                            <table class="layout">
                                                <tr>
                                                    <td class="selectCell">
                                                        <div class="selectTitle">
                                                            <label for="duel_select_0">
                                                                可供共享</label></div>
                                                        <select id="duel_select_0" multiple="multiple" name="duel_select_0" size="14">
                                                            <option value="">--无--</option>
                                                        </select>
                                                    </td>
                                                    <td class="zen-phs buttonCell">
                                                        <div class="text">
                                                            添加</div>
                                                        <div class="zen-mbs text">
                                                            <a href="javascript:if (!document.getElementById('duel_select_0').disabled&& !document.getElementById('duel_select_1').disabled) {duel_select_0Var.beforeMoveRight();;window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');}"
                                                                id="duel_select_0_right">
                                                                <img src="/s.gif" alt="添加" class="rightArrowIcon" title="添加" /></a></div>
                                                        <div class="text">
                                                            <a href="javascript:if (!document.getElementById('duel_select_0').disabled&& !document.getElementById('duel_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');duel_select_0Var.moveLeft();}"
                                                                id="duel_select_0_left">
                                                                <img src="/s.gif" alt="删除" class="leftArrowIcon" title="删除" /></a></div>
                                                        <div class="duelingText">
                                                            删除</div>
                                                    </td>
                                                    <td class="selectCell">
                                                        <div class="selectTitle">
                                                            <label for="duel_select_1">
                                                                共享用户</label></div>
                                                        <select id="duel_select_1" multiple="multiple" name="duel_select_1" size="14">
                                                            <option value="">--无--</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                            <script>      window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_select_0', 'duel_select_1'], 'editPage_duel_errorMsg');</script>
                                        </div>
                                    </div>
                                </div>
                                <a autocomplete="off" name="searchAnchor"></a>
                            </div>
                            <div class="pbBottomButtons">
                                <table>
                                    <tr>
                                        <td class="pbTitle">
                                            &nbsp;
                                        </td>
                                        <td class="pbButtonb">
                                            <input value=" 保存 " class="primary btn" name="save" title="保存" type="submit" /><input
                                                value=" 取消 " class="btn" name="cancel" title="取消" type="submit" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </form>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">

                            var duel_select_0Var = new SelectFilterElement("sharing_search", "R", "duel_select_0", "", "duel_select_1", 100, true, null);

                            var existingSelduel_select_0 = document.getElementById('duel_select_1');
                            //duel_select_0Var.addOptions(false, [['R', '小组：信息小组', 'R:00G90000002acYX', '信息小组', existingSelduel_select_0, ''], ['R', '小组：开发一组组', 'R:00G90000001c3rI', '开发一组组', existingSelduel_select_0, ''], ['R', '所有内部用户', 'R:00G90000002JvmL', '所有内部用户', existingSelduel_select_0, ''], ['R', '所有客户入口网站用户', 'R:00G90000001dC8o', '所有客户入口网站用户', existingSelduel_select_0, ''], ['A', '角色：CEO', 'A:00G90000002JvmM', 'ceo', existingSelduel_select_0, ''], ['A', '角色：CFO', 'A:00G90000002Jvma', 'cfo', existingSelduel_select_0, ''], ['A', '角色：COO', 'A:00G90000002Jvmu', 'coo', existingSelduel_select_0, ''], ['A', '角色：Channel Sales Team', 'A:00G90000002Jvmg', 'channel sales team', existingSelduel_select_0, ''], ['A', '角色：Customer Support, International', 'A:00G90000002Jvmo', 'customer support, international', existingSelduel_select_0, ''], ['A', '角色：Customer Support, North America', 'A:00G90000002Jvme', 'customer support, north america', existingSelduel_select_0, ''], ['A', '角色：Director, Channel Sales', 'A:00G90000002JvmY', 'director, channel sales', existingSelduel_select_0, ''], ['A', '角色：Director, Direct Sales', 'A:00G90000002JvmS', 'director, direct sales', existingSelduel_select_0, ''], ['A', '角色：Eastern Sales Team', 'A:00G90000002Jvmm', 'eastern sales team', existingSelduel_select_0, ''], ['A', '角色：Installation & Repair Services', 'A:00G90000002Jvmk', 'installation & repair services', existingSelduel_select_0, ''], ['A', '角色：Marketing Team', 'A:00G90000002Jvmi', 'marketing team', existingSelduel_select_0, ''], ['A', '角色：SVP, Customer Service & Support', 'A:00G90000002JvmW', 'svp, customer service & support', existingSelduel_select_0, ''], ['A', '角色：SVP, Human Resources', 'A:00G90000002Jvms', 'svp, human resources', existingSelduel_select_0, ''], ['A', '角色：SVP, Sales & Marketing', 'A:00G90000002JvmO', 'svp, sales & marketing', existingSelduel_select_0, ''], ['A', '角色：VP, International Sales', 'A:00G90000002Jvmq', 'vp, international sales', existingSelduel_select_0, ''], ['A', '角色：VP, Marketing', 'A:00G90000002JvmU', 'vp, marketing', existingSelduel_select_0, ''], ['A', '角色：VP, North American Sales', 'A:00G90000002JvmQ', 'vp, north american sales', existingSelduel_select_0, ''], ['A', '角色：Western Sales Team', 'A:00G90000002Jvmc', 'western sales team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：CEO', 'D:00G90000002JvmN', 'ceo', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：CFO', 'D:00G90000002Jvmb', 'cfo', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：COO', 'D:00G90000002Jvmv', 'coo', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Channel Sales Team', 'D:00G90000002Jvmh', 'channel sales team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Customer Support, International', 'D:00G90000002Jvmp', 'customer support, international', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Customer Support, North America', 'D:00G90000002Jvmf', 'customer support, north america', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Director, Channel Sales', 'D:00G90000002JvmZ', 'director, channel sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Director, Direct Sales', 'D:00G90000002JvmT', 'director, direct sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Eastern Sales Team', 'D:00G90000002Jvmn', 'eastern sales team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Installation & Repair Services', 'D:00G90000002Jvml', 'installation & repair services', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Marketing Team', 'D:00G90000002Jvmj', 'marketing team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Customer Service & Support', 'D:00G90000002JvmX', 'svp, customer service & support', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Human Resources', 'D:00G90000002Jvmt', 'svp, human resources', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Sales & Marketing', 'D:00G90000002JvmP', 'svp, sales & marketing', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：VP, International Sales', 'D:00G90000002Jvmr', 'vp, international sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：VP, Marketing', 'D:00G90000002JvmV', 'vp, marketing', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：VP, North American Sales', 'D:00G90000002JvmR', 'vp, north american sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Western Sales Team', 'D:00G90000002Jvmd', 'western sales team', existingSelduel_select_0, ''], ['I', '角色和内部下属：CEO', 'I:00G90000001dC8z', 'ceo', existingSelduel_select_0, ''], ['I', '角色和内部下属：CFO', 'I:00G90000001dC96', 'cfo', existingSelduel_select_0, ''], ['I', '角色和内部下属：COO', 'I:00G90000001dC8s', 'coo', existingSelduel_select_0, ''], ['I', '角色和内部下属：Channel Sales Team', 'I:00G90000001dC93', 'channel sales team', existingSelduel_select_0, ''], ['I', '角色和内部下属：Customer Support, International', 'I:00G90000001dC8v', 'customer support, international', existingSelduel_select_0, ''], ['I', '角色和内部下属：Customer Support, North America', 'I:00G90000001dC8r', 'customer support, north america', existingSelduel_select_0, ''], ['I', '角色和内部下属：Director, Channel Sales', 'I:00G90000001dC8y', 'director, channel sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：Director, Direct Sales', 'I:00G90000001dC92', 'director, direct sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：Eastern Sales Team', 'I:00G90000001dC95', 'eastern sales team', existingSelduel_select_0, ''], ['I', '角色和内部下属：Installation & Repair Services', 'I:00G90000001dC8u', 'installation & repair services', existingSelduel_select_0, ''], ['I', '角色和内部下属：Marketing Team', 'I:00G90000001dC8w', 'marketing team', existingSelduel_select_0, ''], ['I', '角色和内部下属：SVP, Customer Service & Support', 'I:00G90000001dC90', 'svp, customer service & support', existingSelduel_select_0, ''], ['I', '角色和内部下属：SVP, Human Resources', 'I:00G90000001dC8t', 'svp, human resources', existingSelduel_select_0, ''], ['I', '角色和内部下属：SVP, Sales & Marketing', 'I:00G90000001dC94', 'svp, sales & marketing', existingSelduel_select_0, ''], ['I', '角色和内部下属：VP, International Sales', 'I:00G90000001dC8x', 'vp, international sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：VP, Marketing', 'I:00G90000001dC8q', 'vp, marketing', existingSelduel_select_0, ''], ['I', '角色和内部下属：VP, North American Sales', 'I:00G90000001dC8p', 'vp, north american sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：Western Sales Team', 'I:00G90000001dC91', 'western sales team', existingSelduel_select_0, '']]);
                            duel_select_0Var.addOptions(false, [<%=AvaliableOptions%>]);
                            if (existingSelduel_select_0.options.length == 0) {
                                existingSelduel_select_0.options[0] = new Option('--无--', '');
                            }

                        </script>
                        <script type="text/javascript">                            var type2ops = new Array();
                            type2ops['Text'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['MultiLineText'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['HtmlMultiLineText'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['SimpleNamespace'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['Phone'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['Fax'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['Email'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['Url'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['Content'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['SfdcEncryptedText'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['EncryptedText'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['AutoNumber'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['CurrencyCode'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['StringPlusClob'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['HtmlStringPlusClob'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['InetAddress'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['AddressState'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['AddressCountry'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['Boolean'] = ['e', 'n'];
                            type2ops['Currency'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['Integer'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['Double'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['Percent'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['DateTime'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['TimeOnly'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['DateOnly'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['Birthday'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['DueDate'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                            type2ops['EntityId'] = ['e', 'n', 's'];
                            type2ops['RecordType'] = ['e', 'n'];
                            type2ops['Division'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['DataCategoryGroupReference'] = ['e', 'n'];
                            type2ops['EnumOrId'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['StaticEnum'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['DynamicEnum'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['MultiEnum'] = ['e', 'n', 'u', 'x'];
                            type2ops['TextEnum'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['BitVector'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            type2ops['Address'] = ['w', 'y'];
                            type2ops['Location'] = ['w', 'y'];
                            type2ops['ExternalId'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
                            var value2ops = new Array();
                            value2ops['Topics'] = ['u', 'x'];
                            var val2type = new Array(); val2type['CASES.CASE_NUMBER'] = 'AutoNumber'; val2type['ACCOUNT.NAME'] = 'Switchable_PersonName'; val2type['ACCOUNT.SITE'] = 'Text'; val2type['NAME'] = 'PersonName'; val2type['CONTACT.FIRST_NAME'] = 'Text'; val2type['CONTACT.LAST_NAME'] = 'Text'; val2type['CONTACT.ACCOUNT'] = 'Switchable_PersonName'; val2type['CASES.SUBJECT'] = 'Text'; val2type['CASES.STATUS'] = 'DynamicEnum'; val2type['CASES.PRIORITY'] = 'DynamicEnum'; val2type['CASES.TYPE'] = 'DynamicEnum'; val2type['CASES.ORIGIN'] = 'DynamicEnum'; val2type['CASES.NAME'] = 'Text'; val2type['CASES.EMAIL'] = 'Email'; val2type['CASES.COMPANY'] = 'Text'; val2type['CASES.REASON'] = 'DynamicEnum'; val2type['PARENT.CASE_NUMBER'] = 'AutoNumber'; val2type['CASES.CLOSED'] = 'Boolean'; val2type['CASES.ESCALATION_STATE'] = 'Boolean'; val2type['CASES.CREATED_DATE'] = 'DateTime'; val2type['CASES.CREATED_DATE_DATE_ONLY'] = 'DateTime'; val2type['CASES.LAST_UPDATE'] = 'DateTime'; val2type['CASES.LAST_UPDATE_DATE_ONLY'] = 'DateTime'; val2type['CASES.CLOSED_DATE'] = 'DateTime'; val2type['CORE.USERS.FIRST_NAME'] = 'Text'; val2type['CORE.USERS.LAST_NAME'] = 'Text'; val2type['CORE.USERS.ALIAS'] = 'Text'; val2type['OWNER_NAME'] = 'PersonName'; val2type['CREATEDBY_USER.ALIAS'] = 'Text'; val2type['UPDATEDBY_USER.ALIAS'] = 'Text'; val2type['CASES.CSS_EDITED'] = 'Boolean'; val2type['CASES.NEW_DATA'] = 'Boolean'; val2type['00N9000000CFoa1'] = 'Text'; val2type['00N9000000CFoa2'] = 'DynamicEnum'; val2type['00N9000000CFoa3'] = 'DynamicEnum'; val2type['00N9000000CFoa4'] = 'DynamicEnum'; val2type['ASSET.NAME'] = 'Text'; val2type['ASSET.SERIAL_NUMBER'] = 'Text'; val2type['ASSET.INSTALL_DATE'] = 'DateOnly'; val2type['Topics'] = 'Text';
                            var oppLabels = new Array(); oppLabels['e'] = '等于'; oppLabels['n'] = '不等于'; oppLabels['s'] = '起始字符'; oppLabels['c'] = '包含'; oppLabels['k'] = '不包含'; oppLabels['l'] = '小于'; oppLabels['g'] = '大于'; oppLabels['m'] = '小于或等于'; oppLabels['h'] = '大于或等于'; oppLabels['u'] = '包括'; oppLabels['x'] = '不包括'; oppLabels['w'] = '在范围内'; var allOperators = ['e', 'n', 's', 'c', 'k', 'l', 'g', 'm', 'h', 'u', 'x', 'w'];
                            var noneLabel; function updateOperator(sel, opSelName, lookupName) { var selObj = document.getElementById(opSelName); if (selObj.offsetWidth > 0) { selObj.style.width = selObj.offsetWidth + 'px'; } if (noneLabel == null && selObj.options[0].value.length == 0) noneLabel = selObj.options[0].text; var ops = null; var val = sel.options[sel.selectedIndex]; if (val) ops = type2ops[val2type[val.value]]; if (val.value in value2ops) ops = value2ops[val.value]; if (ops == null) ops = allOperators; var currSelected = selObj.options[selObj.selectedIndex]; selObj.length = 0; var off = 0; if (noneLabel != null) { off = 1; selObj.options[0] = new Option(noneLabel, ''); if (currSelected.value == '') { selObj.options[0].selected = true; } } for (var i = 0; i < ops.length; i++) { var label = oppLabels[ops[i]]; if (label == null) continue; var option = new Option(oppLabels[ops[i]], ops[i]); selObj.options[i + off] = option; if (currSelected != null && currSelected.value == option.value) { option.selected = true; } } if (lookupName) { if (val.value == 'Case.BusinessHours' || val.value != 'MEMBER_STATUS' && val.value != 'CAMPAIGN_MEMBER.STATUS' && val.value != 'Lead.CampaignMemberStatus' && val2type[val.value] == 'StaticEnum' || val2type[val.value] == 'DynamicEnum' || val2type[val.value] == 'EnumOrId' || val2type[val.value] == 'Division' || val2type[val.value] == 'RecordType' || val2type[val.value] == 'Boolean') document.getElementById(lookupName).style.display = ''; else document.getElementById(lookupName).style.display = 'none'; } }
                            function selectNotNone(opSelName) { var selObj = document.getElementById(opSelName); if (selObj.selectedIndex == 0) selObj.selectedIndex = 1; }
                            function initializeOperator(selName, colName, lookupName) { var obj = document.getElementById(colName); if (obj) { obj = document.getElementById(selName); if (obj != null) { updateOperator(obj, colName, lookupName); } } }
                            function onLoadCriteria() { initializeOperator('fcol1', 'fop1', 'flkp1'); initializeOperator('fcol2', 'fop2', 'flkp2'); initializeOperator('fcol3', 'fop3', 'flkp3'); initializeOperator('fcol4', 'fop4', 'flkp4'); initializeOperator('fcol5', 'fop5', 'flkp5'); initializeOperator('fcol6', 'fop6', 'flkp6'); initializeOperator('fcol7', 'fop7', 'flkp7'); initializeOperator('fcol8', 'fop8', 'flkp8'); initializeOperator('fcol9', 'fop9', 'flkp9'); initializeOperator('fcol10', 'fop10', 'flkp10'); }
                        </script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { onLoadCriteria(); if ((typeof duel_select_0Var != 'undefined') && (typeof duel_select_0Var.init != 'undefined')) { duel_select_0Var.init(); }; Sfdc.Dom.hideByDisplay('duel'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fui%2Flist%2FFilterEditPage%3Fftype%3Dt%26retURL%3D%252F500%26cancelURL%3D%252F500%252Fo&isAjaxRequest=1&renderMode=RETRO&nocache=1432257229062'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <div class="bPageFooter noTableFooter">
            <div>
                <span class="brandQuaternaryFgr">Copyright © 2000-2015 .com, inc. 公司版权所有。保留所有权利。</span>&nbsp;|&nbsp;<a
                    href="http://www..com/company/privacy.jsp" class="brandQuaternaryFgr"
                    target="_blank" title="隐私声明 （新窗口）">隐私声明</a>&nbsp;|&nbsp;<a href="http://www..com/company/security.jsp"
                        class="brandQuaternaryFgr" target="_blank" title="安全声明 （新窗口）">安全声明</a>&nbsp;|&nbsp;<a
                            href="http://www..com/company/msa.jsp" class="brandQuaternaryFgr" target="_blank"
                            title="使用条款 （新窗口）">使用条款</a>&nbsp;|&nbsp;<a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                class="brandQuaternaryFgr" title="508 符合性 （新窗口）">508 符合性</a></div>
        </div>
        <div>
        </div>
    </div>
    
</body>
</html>
<!-- page generation time: 137ms -->
