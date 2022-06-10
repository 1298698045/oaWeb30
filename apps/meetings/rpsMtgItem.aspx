<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rpsMtgItem.aspx.cs" Inherits="WebClient.apps.meetings.rpsMtgItem" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议议题: 反馈议题 <%=PageTitle%>~ </title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/rlHovers.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterCore.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterExtended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/DedupeCSS.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .recurrenceFrequency
        {
            margin: 0;
        }
    </style>
    <style type="text/css">
        .bPageBlock .detailList .recurrenceTable td
        {
            vertical-align: middle;
            padding: 10px;
        }
    </style>
    <style type="text/css">
        .calendarTable th.timeCol
        {
            padding-right: .3em;
        }
    </style>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/ManyWhoActivity.js"></script>
    <script>    window.sfdcPage = new DetailPage("00U9000000z2Kjv");
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-M-d", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1",  "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1495827578000", "today": "2017-6-7 上午10:57", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Event';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/rlHovers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/DedupeCSS.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/Calendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1493343760000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1493343760000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif eventTab  event detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
       <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
<div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
             <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td id="sidebarCell" class=" sidebarCell sidebarCollapsible sidebarCollapsed"><a class="handlebarContainer zen" href="javascript:void(0);" id="handlebarContainer" title="单击打开侧栏 [Alt+S]"><span class="zen-assistiveText">单击以打开侧栏</span><span class="indicator" id="pinIndicator"></span><span class="indicator" id="pinIndicator2"></span><span class="pinBox" id="handle">&nbsp;</span></a><div class="collapsible sidebar" id="sidebarDiv">
                       <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </div>
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/img/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" title="内容在此开始" /></a><div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img src="/img/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><h1 class="pageType">会议议题<span class="titleSeparatingColon">:</span></h1>
                                        <h2 class="pageDescription">test1</h2>
                                        <div class="blank">&nbsp;</div>
                                    </div>
                                    <div class="links"></div>
                                </div>
                              
                                <div class="ptBreadcrumb"></div>
                            </div>
                        <script type="text/javascript">
                        </script>
                        <form action="/00W/detail" id="responseForm" method="post" name="responseForm" onsubmit="if (window.ffInAlert) { return false; }">
                            <input type="hidden" name="_CONFIRMATIONTOKEN" id="_CONFIRMATIONTOKEN" value="" /><div class="RLPanelShadow" id="RLPanelShadow">
                                <div class="rls_top">
                                    <div class="rls_tl"></div>
                                    <div class="rls_tr"></div>
                                </div>
                                <div class="rls_l"></div>
                                <div class="rls_r"></div>
                                <div class="RLPanel" id="RLPanel" onblur="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onfocus="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onmouseout="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onmouseover="sfdcPage.getRelatedListPanel('RLPanel').showRL()">
                                    <iframe frameborder="0" id="RLPanelFrame" name="RLPanelFrame" src="/emptyHtmlDoc.html" title="隐藏框架 - 忽略"></iframe>
                                </div>
                                <div class="rls_bottom">
                                    <div class="rls_bl"></div>
                                    <div class="rls_br"></div>
                                </div>
                            </div>
                            <div class="listHoverLinks"><span class="invisibleMinHeight">|</span></div>
                            <script>try { sfdcPage.registerRelatedListPanel('RLPanel', false); } catch (e) { }</script>
                            <input type="hidden" name="id" id="id" value="<%=Request["id"]%>" />
                            <div class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette" id="ep">
                                <div class="pbHeader">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">议题提交信息</h2>
                                            </td>
                                            <td class="pbButton" id="topButtonRow">
                                                <input value=" 提交议题 " class="btn" name="accept" title="提交议题" type="submit" onclick=" this.form.action = '/00W/detail/d?accept=1&_CONFIRMATIONTOKEN=&common.udd.actions.ActionsUtilORIG_URI=%2F00U9000000z2Kjv%2Fd'" />
                                                <input value=" 接受参加 " class="btn" name="acceptjoin" title="接受参加" type="submit"  onclick=" this.form.action = '/00W/detail/d?accept=1&_CONFIRMATIONTOKEN=&common.udd.actions.ActionsUtilORIG_URI=%2F00U9000000z2Kjv%2Fd'" /> 
                                                <input value=" 拒绝参加 " class="btn" name="decline" title="拒绝参加" type="submit"  onclick=" this.form.action = '/00W/detail/d?decline=1&_CONFIRMATIONTOKEN=&common.udd.actions.ActionsUtilORIG_URI=%2F00U9000000z2Kjv%2Fd'" /> 
                                                <!--<input value=" 取消 " class="btn" name="cancel" title="取消" type="button" onclick="                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 navigateToUrl('/home/home.jsp', 'DETAIL', 'cancel');" />
                                                <input value="添加到 Outlook" class="btn" name="vcal" title="添加到 Outlook" type="button" onclick="                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 navigateToUrl('/servlet/servlet.OutlookEvent?rnd=1496804272665&amp;id=00U9000000z2Kjv&amp;_CONFIRMATIONTOKEN=VmpFPSxNakF4Tnkwd05pMHhNRlF3TWpvMU56bzFNaTQyTmpWYSxibzk5UnpsNUg3b1JtcThOU25ZRFFLLE0yRmhPR05t&amp;common.udd.actions.ActionsUtilORIG_URI=%2Fservlet%2Fservlet.OutlookEvent', 'DETAIL', 'vcal');" />--></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbBody">
                                    <div class="pbError" id="errorDiv_ep" style="display: none">错误：无效数据。<br />
                                        请查看下列所有错误消息以纠正数据。</div>
                                    <div class="pbSubsection"><!--
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol">被分配人</td>
                                                <td class="dataCol col02"><a href="/00590000003y68m">璞</a></td>
                                                <td class="labelCol">位置</td>
                                                <td class="dataCol">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">主题</td>
                                                <td class="dataCol col02">test1</td>
                                                <td class="labelCol">开始</td>
                                                <td class="dataCol">2015-10-24 上午10:00&nbsp;&nbsp;&nbsp;&nbsp;<a href="/00U/c?md0=2015&amp;md3=297&amp;cal_lkid=00590000003y68m">检查可用性</a></td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">名称</td>
                                                <td class="dataCol col02">&nbsp;</td>
                                                <td class="labelCol">结束</td>
                                                <td class="dataCol">2015-10-24 上午11:00</td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">电话</td>
                                                <td class="dataCol col02">&nbsp;</td>
                                                <td class="labelCol">全天事件</td>
                                                <td class="dataCol">
                                                    <img src="/img/checkbox_unchecked.gif" alt="未选取的" width="21" height="16" class="checkImg" id="evt15_chkbox" title="未选取的" /></td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">电子邮件</td>
                                                <td class="dataCol col02">&nbsp;</td>
                                                <td class="labelCol empty">&nbsp;</td>
                                                <td class="dataCol empty">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">相关项</td>
                                                <td class="dataCol col02">&nbsp;</td>
                                                <td class="labelCol empty">&nbsp;</td>
                                                <td class="dataCol empty">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">创建人</td>
                                                <td class="dataCol col02"><a href="/0059000000390Wh">liu jack</a>, 2015-10-24 上午9:26</td>
                                                <td class="last labelCol">上次修改人</td>
                                                <td class="last dataCol"><a href="/0059000000390Wh">liu jack</a>, 2015-10-24 上午10:17</td>
                                            </tr>
                                            <tr>
                                                <td class="last labelCol">内容</td>
                                                <td class="last data2Col" colspan="3">&nbsp;</td>
                                            </tr>
                                        </table>-->
                                        <%=FormHTML%>
                                    </div>
                                    <div class="brandTertiaryBrd pbSubheader tertiaryPalette" id="head_1_ep">
                                        <h3>输入议题<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr class="last detailRow">
                                                <td colspan='4'>
                                                    <div class="textCounterOuter eventResponse">
                                                        <div class="textCounterMiddle">
                                                            <div class="textCounter" id="response_counter">2551 剩余</div>
                                                        </div>
                                                    </div>
                                                    <textarea cols="100" rows="12" id="response" maxlength="2550" name="response" onchange="handleTextAreaElementChangeWithByteCheck('response', 2550, 0, '剩余', '超出极限', false);" onclick="handleTextAreaElementChangeWithByteCheck('response', 2550, 0, '剩余', '超出极限', false);" onkeydown="handleTextAreaElementChangeWithByteCheck('response', 2550, 0, '剩余', '超出极限', false);" onkeyup="handleTextAreaElementChangeWithByteCheck('response', 2550, 0, '剩余', '超出极限', false);" onmousedown="handleTextAreaElementChangeWithByteCheck('response', 2550, 0, '剩余', '超出极限', false);" title="输入议题" type="text" wrap="soft"></textarea></td>
                                            </tr>
                                        </table>
                                    </div>
                                   
                                </div>
                                <div class="pbBottomButtons">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;</td>
                                            <td class="pbButtonb" id="bottomButtonRow">
                                                <input value=" 提交议题 " class="btn" name="accept" title="提交议题" type="submit" onclick="this.form.action = '/00W/detail/d?accept=1&_CONFIRMATIONTOKEN=&common.udd.actions.ActionsUtilORIG_URI=%2F00U9000000z2Kjv%2Fd'" />
                                                <input value=" 接受参加 " class="btn" name="acceptjoin" title="接受参加" type="submit"  onclick=" this.form.action = '/00W/detail/d?accept=1&_CONFIRMATIONTOKEN=&common.udd.actions.ActionsUtilORIG_URI=%2F00U9000000z2Kjv%2Fd'" /> 
                                                <input value=" 拒绝参加 " class="btn" name="decline" title="拒绝参加" type="submit"  onclick=" this.form.action = '/00W/detail/d?decline=1&_CONFIRMATIONTOKEN=&common.udd.actions.ActionsUtilORIG_URI=%2F00U9000000z2Kjv%2Fd'" /> 
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg"></div>
                                </div>
                            </div>
                            <!-- Begin RelatedListElement -->
                            <div class="bRelatedList first" id="00U9000000z2Kjv_RelatedEventAttendeeAccept" style="display:none">
                                <a name="00U9000000z2Kjv_RelatedEventAttendeeAccept_target"></a>
                                <!-- Begin ListElement -->

                                <!-- motif: Event -->

                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/img/s.gif" alt="" class="relatedListIcon" title="" /><h3 id="00U9000000z2Kjv_RelatedEventAttendeeAccept_title">已接受</h3>
                                                    </td>
                                                    <td class="pbButton"><a href="mailto:69839499@qq.com%3B?subject=test1"></a></td>
                                                    <td class="pbHelp">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="00U9000000z2Kjv_RelatedEventAttendeeAccept_body">
                                            <table class="list" border="0" cellspacing="0" cellpadding="0">
                                                <tr class="headerRow">
                                                    <th scope="col" class=" zen-deemphasize">姓名</th>
                                                    <th scope="col" class=" zen-deemphasize">类型</th>
                                                    <th scope="col" class=" zen-deemphasize">留言</th>
                                                </tr>

                                                <!-- ListRow -->
                                                <tr class=" dataRow even last first" onblur="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}" onmouseover="if (window.hiOn){hiOn(this);}">
                                                    <th scope="row" class=" dataCell  "><a href="/005900000039oIN">liu lan</a></th>
                                                    <td class=" dataCell  ">用户</td>
                                                    <td class=" dataCell  ">ok11</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav"></div>
                                <script>try { sfdcPage.registerRelatedList('00U9000000z2Kjv_RelatedEventAttendeeAccept', '1', '已接受', false, '/00U9000000z2Kjv', 'relatedListId=RelatedEventAttendeeAccept&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedEventAttendeeAccept'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                            <!-- End RelatedListElement -->

                            <!-- Begin RelatedListElement -->
                            <div class="bRelatedList" id="00U9000000z2Kjv_RelatedEventAttendeeNotDecided"  style="display:none">
                                <a name="00U9000000z2Kjv_RelatedEventAttendeeNotDecided_target"></a>
                                <!-- Begin ListElement -->

                                <!-- motif: Event -->

                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/img/s.gif" alt="" class="relatedListIcon" title="" /><h3 id="00U9000000z2Kjv_RelatedEventAttendeeNotDecided_title">尚未响应</h3>
                                                    </td>
                                                    <td class="pbButton">&nbsp;</td>
                                                    <td class="pbHelp">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="00U9000000z2Kjv_RelatedEventAttendeeNotDecided_body">
                                            <table class="list" border="0" cellspacing="0" cellpadding="0">
                                                <tr class="headerRow">
                                                    <th scope="col" class="noRowsHeader">所有出席者均已回复</th>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav"></div>
                                <script>try { sfdcPage.registerRelatedList('00U9000000z2Kjv_RelatedEventAttendeeNotDecided', '0', '尚未响应', false, '/00U9000000z2Kjv', 'relatedListId=RelatedEventAttendeeNotDecided&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedEventAttendeeNotDecided'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                            <!-- End RelatedListElement -->

                            <!-- Begin RelatedListElement -->
                            <div class="bRelatedList" id="00U9000000z2Kjv_RelatedEventAttendeeDecline">
                                <a name="00U9000000z2Kjv_RelatedEventAttendeeDecline_target"></a>
                                <!-- Begin ListElement -->

                                <!-- motif: Event -->

                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/img/s.gif" alt="" class="relatedListIcon" title="" /><h3 id="00U9000000z2Kjv_RelatedEventAttendeeDecline_title">已拒绝</h3>
                                                    </td>
                                                    <td class="pbButton">&nbsp;</td>
                                                    <td class="pbHelp">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="00U9000000z2Kjv_RelatedEventAttendeeDecline_body">
                                            <table class="list" border="0" cellspacing="0" cellpadding="0">
                                                <tr class="headerRow">
                                                    <th scope="col" class="noRowsHeader">没有出席者拒绝</th>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav"></div>
                                <script>try { sfdcPage.registerRelatedList('00U9000000z2Kjv_RelatedEventAttendeeDecline', '0', '已拒绝', false, '/00U9000000z2Kjv', 'relatedListId=RelatedEventAttendeeDecline&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedEventAttendeeDecline'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                            <!-- End RelatedListElement -->
                            <%=RelatedNoteListHTML%>
                            <!-- Begin RelatedListElement -->
                            <div class="bRelatedList" id="00U9000000z2Kjv_RelatedActivityAttachmentList">
                                <a name="00U9000000z2Kjv_RelatedActivityAttachmentList_target"></a>
                                <!-- Begin ListElement -->

                                <!-- motif: Event -->

                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/img/s.gif" alt="" class="relatedListIcon" title="" /><h3 id="00U9000000z2Kjv_RelatedActivityAttachmentList_title">附件</h3>
                                                    </td>
                                                    <td class="pbButton">&nbsp;</td>
                                                    <td class="pbHelp">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="00U9000000z2Kjv_RelatedActivityAttachmentList_body">
                                            <table class="list" border="0" cellspacing="0" cellpadding="0">
                                                <tr class="headerRow">
                                                    <th scope="col" class="noRowsHeader">没有可显示的记录</th>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav"></div>
                                <script>try { sfdcPage.registerRelatedList('00U9000000z2Kjv_RelatedActivityAttachmentList', '0', '附件', false, '/00U9000000z2Kjv', 'relatedListId=RelatedActivityAttachmentList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedActivityAttachmentList'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                            <!-- End RelatedListElement --><!--
                            <div class="fewerMore">
                                <div class="backToTop"><a href="#skiplink" title="返回顶部">
                                    <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                                每一相关列表总是显示<a href="/00U9000000z2Kjv?rowsperlist=10">更少<img src="/img/s.gif" alt="显示较少信息" class="fewerArrow" title="显示较少信息" /></a> /  <a href="/00U9000000z2Kjv?rowsperlist=20">
                                    <img src="/img/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a>  项记录</div>-->
                        </form>
                       <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() { handleTextAreaElementChangeWithByteCheck('response', 255, 0, '剩余', '超出极限', false); SfdcApp.TopicsFeed.setupHandlers('topicContainer00U9000000z2Kjv'); ActivityFunction.adjustEventReminderOptions(false, 'evt15', false, 'IsRecurrence', 'reminder_dt_time'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([1458776700000, 1458805500000], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U9000000z2Kjv&isAjaxRequest=1&renderMode=RETRO&nocache=1496804272652'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tnkwd05pMHhNRlF3TWpvMU56bzFNaTQyTmpsYSxRTmhSVUNNMGJOT3BldnFzRXJyUTN1LE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
</body>
</html>
<!-- page generation time: 301ms -->

