<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prtmtg.aspx.cs" Inherits="WebClient.apps.meetings.prtmtg" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议：<%=EntityName%> ~ </title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/printableView.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/CSS/cardview.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/qrcode.js"></script>
    <script type="text/javascript" src="/js/Business.js"></script>
    <script> window.sfdcPage = new PrintableViewPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1",  "dateTimeFormat": "yyyy-MM-dd HH:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1495827578000", "today": "2017-6-2 下午4:40", "timeFormat": "HH:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body class="hasMotif opportunityTab  printableView sfdcBody brandQuaternaryBgr" >
    <!-- Main Body Starts Here -->
    <center></center>
    <div class="print" style="width:790px;position: relative;top:50%;margin: 0 auto;">
        <div class="printHeader">
            <div class="printControls">
                <ul>
                    <li><a href="javascript:window.close%28%29%3B">关闭窗口</a></li>
                    <li><a href="javascript:window.print%28%29%3B">打印此页</a></li>
                </ul>
            </div><!--
            <img src="/img/sfdc_printable_logo.gif" alt="Salesforce" width="146" height="47" title="协同办公" /><div class="printHeaderBottomDiv"></div>
            <br />-->
        </div>
        <%=EntityFormBody%>
        <table cellspacing="0" width="100%">
            <tr>
                <td bgcolor="#ffffff" width="100%">&nbsp;<span style="font-size: 12pt; font-weight: bold;">&nbsp;会议议题<br>
                </span>
                    <div class="bPageBlock brandSecondaryBrd secondaryPalette" id="ep">
                        <div class="pbHeader pbHeaderEmpty">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="pbTitle">
                                        <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle"></h2>
                                    </td>
                                    <td class="pbButton" id="Td1">&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <div class="pbBody">
                            <div class="pbError" id="errorDiv_ep" style="display: none">错误：无效数据。<br />
                                请查看下列所有错误消息以纠正数据。</div>
                            <div class="pbSubsection">
                                <style>
                                    .card
                                    {
                                        width:42%;
                                    }
                                </style>
                                <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                  <!--  <tr>
                                        <td class="labelCol">客户所有人</td>
                                        <td class="dataCol col02">liu jack</td>
                                        <td class="labelCol">分级</td>
                                        <td class="dataCol">Hot</td>
                                    </tr>-->
                                     <tr>
                                       <td colspan="4" style="height:10px;">
                                           </td>
                                         </tr>
                                   <tr>
                                       <td colspan="4">
                                           <%=MeetingItemHTML%>
                                       </td>
                                   </tr>
                                </table>
                            </div>
                        </div>
                        <div class="pbFooter secondaryPalette">
                            <div class="bg"></div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div class="bHeader" style="display:none">
            <h1>&nbsp;<span style="font-size: 12pt; font-weight: bold;">&nbsp;参会人员</span></h1>
         </div>
        <!-- Begin RelatedListPrintableElement -->
        <div class="noStandardTab"  style="display:none">
            <div class="bPageBlock secondaryPalette">
                <div class="pbHeader">
                    <h2>签到人员</h2>
                </div>
                <div class="pbBody">
                    <table class="list" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <th scope="row"></th>
                            <td></td>
                        </tr>                        
                    </table>
                </div>
                <div class="pbFooter secondaryPalette">
                    <div class="bg"></div>
                </div>
            </div>
        </div>
        <!-- End RelatedListPrintableElement -->
        <div class="bPageFooter" id="bodyFooter">
            <div class="footer"></div>
        </div>
    </div>
         <!-- Body events -->
    <script type="text/javascript">//function bodyOnLoad() { SfdcApp.TopicsFeed.setupHandlers('topicContainer0069000000OZLuO'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SfdcApp.TopicsFeed.setupHandlers('topicContainer00190000015a7IA'); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tnkwd05pMHdOVlF3T0RvME1Eb3lNaTQ0T1RsYSx5TTlHNTBIOE9MWGZGeXpBa0F5Nks2LE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
</body>
</html>