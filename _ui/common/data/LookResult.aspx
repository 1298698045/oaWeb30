<%@ Page Language="C#" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title></title>
    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/SearchOnly.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1415916830000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-11-21 上午10:24", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <link href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/elements.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/common.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.202.191.9', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcommon%2Fdata%2FLookupResultsFrame%3F_CONFIRMATIONTOKEN%3D74tklwJ1kpbiYkV_VMefjRpQMnNNXsNw7DZcPc4N32mDwN1iWtYerm5o4LluLbzzZC6lszXR2Vlqlnt8GHJxmAXEY8nJh.25XzeADpHcoCAdtgYsEBGJryRJ0PAm0jAcNcqYN9cN_jwY0AL8GXMMUXMlu3tQtgYHrU0xkr8Ff48GGP1yr16mA5IiiiRPNoqUN7V_TQ%253D%253D%26igdp%3D0%26lkenhmd%3DSEARCH_NAME%26lkfm%3DeditPage%26lknm%3Dcon4%26lksrch%3DEdge%2BCommunications%26lktp%3D001%262%3DEdge%2BCommunications%26country%3D%26zip%3D%26state%3D%26city%3D%26street%3D%2610%3D%2611%3D%2612%3D%26cancel%3D%2B%25E5%258F%2596%25E6%25B6%2588%2B');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif lookupTab  LookupResultsFrame" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form action="/_ui/common/data/LookupResultsFrame" id="new" method="GET" name="new"
    onsubmit="if (window.ffInAlert) { return false; }">
    <input type="hidden" name="lkenhmd" id="lkenhmd" value="SEARCH_NAME" />
    <input type="hidden" name="lkfm" id="lkfm" value="<%=Request["lkfm"]%>" />
    <input type="hidden" name="lknm" id="lknm" value="<%=Request["lknm"]%>" />
    <input type="hidden" name="lktp" id="lktp" value="<%=Request["lktp"]%>" />
    <input type="hidden" name="lksrch" id="lksrch" value="<%=Request["lksrch"]%>" />            
    <div class="lookup">
        <div class="clearResults">
            &lt;
            <script>                function clearSearch() { parent.searchFrame.document.theForm.lksrch.value = ''; var loc = window.location.toString(); var qs = QueryString.createQueryString(loc); qs.add('lksrch', ''); window.location = QueryString.getURI(loc) + qs.toString(); }</script>
            <a href="javascript:clearSearch%28%29%3B">清除搜索结果</a></div>
        <div class="srch">
            搜索结果</div>
        <!-- Begin ListElement -->
        <!-- motif: Lookup -->
        <!-- WrappingClass -->
        <div class="listRelatedObject lookupBlock">
            <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                <div class="pbHeader">
                </div>
                <div class="pbBody">
                    <cc1:LookupListBlock runat="server" ID="LookupListBlock1" />
                    <!--
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th scope="col" class=" zen-deemphasize">
                                                    客户名
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    客户站点
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    客户所有人别名
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    类型
                                                </th>
                                            </tr>
                                            <tr class="dataRow even last first">
                                                <th scope="row">
                                                    <a href="#" class=" dataCell " onclick="top.window.opener.lookupPick('editPage','con4_lkid','con4','','00190000015a7I3','Edge Communications','null','')">
                                                        Edge Communications</a>
                                                </th>
                                                <td class=" dataCell  ">
                                                    &nbsp;
                                                </td>
                                                <td class=" dataCell  ">
                                                    liu
                                                </td>
                                                <td class=" dataCell  ">
                                                    Customer - Direct
                                                </td>
                                            </tr>
                                        </table>-->
                </div>
                <div class="pbFooter secondaryPalette">
                    <div class="bg">
                    </div>
                </div>
            </div>
        </div>
        <div class="listElementBottomNav">
        </div>
        <!-- End ListElement -->
       <!-- <div class="footer">
            &copy; 2000-2015 .com, inc. 公司版权所有。 本公司保留所有权利。</div>-->
    </div>
    </form>
    <!-- Body events -->
    <script type="text/javascript">        function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { } function bodyOnUnload() { }</script>
</body>
</html>
