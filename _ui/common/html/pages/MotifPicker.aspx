<%@ Page Language="C#" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>选项卡样式选择器</title>
    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script>window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-M-d", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "ap1.lightning.force.com", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1469476454000", "today": "2016-7-27 下午4:51", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/MotifPicker.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
   <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom0.css" rel="stylesheet"        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom1.css" rel="stylesheet"        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom2.css" rel="stylesheet"        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom3.css" rel="stylesheet"        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom4.css" rel="stylesheet"        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom5.css" rel="stylesheet"        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom6.css" rel="stylesheet"        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/base/allCustom7.css" rel="stylesheet"        type="text/css" />
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>//ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.207.50.249', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcommon%2Fhtml%2Fpages%2FMotifPicker%3Fid%3Dp2');</script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif setupTab  setupTab MotifPicker" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <div class="bPageBlock secondaryPalette">
        <div class="pbHeader">
            <h2 id="fontColorIE7Fix">选项卡样式选择器</h2>
            <input value="创建自己的样式" class="btn" name="createYourOwn" onclick="navigateToUrl('/_ui/common/config/tab/CustomMotifDefinitionPage?id=p2', null, 'createYourOwn');" title="创建自己的样式" type="button" /></div>
        <div class="pbBody">
            <div class="showHideToggle"><a href="#" id="hideUsedStyle" onclick="return PickableMotifElement.hideUsedStyle();">隐藏其他选项卡所使用的样式</a><a href="#" id="showUsedStyle" onclick="return PickableMotifElement.showUsedStyle();">显示其他选项卡所使用的样式</a></div>
            <a class="motifElement Custom49Mru Custom49Tab pickableMotifElement usedMotif " id="Custom49" onclick="new PickableMotifElement('Custom49','motifElement_desc_Custom49','motifElement_icon_Custom49','Custom49','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom49" title="CD/DVD" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom49" onfocus="addMouseOver(document.getElementById('usedHover_Custom49'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom49'), this)">CD/DVD<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom49" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom49_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Import Template</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom99Mru Custom99Tab pickableMotifElement" id="Custom99" onclick="new PickableMotifElement('Custom99','motifElement_desc_Custom99','motifElement_icon_Custom99','Custom99','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom99" title="电视 CRT" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom99">CRT 电视</div>
            </a>

            <a class="motifElement Custom75Mru Custom75Tab pickableMotifElement" id="Custom75" onclick="new PickableMotifElement('Custom75','motifElement_desc_Custom75','motifElement_icon_Custom75','Custom75','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom75" title="IP 电话" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom75">IP 电话</div>
            </a>

            <a class="motifElement Custom29Mru Custom29Tab pickableMotifElement" id="Custom29" onclick="new PickableMotifElement('Custom29','motifElement_desc_Custom29','motifElement_icon_Custom29','Custom29','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom29" title="PDA" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom29">PDA</div>
            </a>

            <a class="motifElement Custom42Mru Custom42Tab pickableMotifElement usedMotif " id="Custom42" onclick="new PickableMotifElement('Custom42','motifElement_desc_Custom42','motifElement_icon_Custom42','Custom42','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom42" title="百宝箱" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom42" onfocus="addMouseOver(document.getElementById('usedHover_Custom42'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom42'), this)">百宝箱<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom42" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom42_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>物品领用</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom19Mru Custom19Tab pickableMotifElement" id="Custom19" onclick="new PickableMotifElement('Custom19','motifElement_desc_Custom19','motifElement_icon_Custom19','Custom19','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom19" title="扳手" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom19">扳手</div>
            </a>

            <a class="motifElement Custom87Mru Custom87Tab pickableMotifElement" id="Custom87" onclick="new PickableMotifElement('Custom87','motifElement_desc_Custom87','motifElement_icon_Custom87','Custom87','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom87" title="保险箱" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom87">保险箱</div>
            </a>

            <a class="motifElement Custom43Mru Custom43Tab pickableMotifElement" id="Custom43" onclick="new PickableMotifElement('Custom43','motifElement_desc_Custom43','motifElement_icon_Custom43','Custom43','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom43" title="宝石" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom43">宝石</div>
            </a>

            <a class="motifElement Custom65Mru Custom65Tab pickableMotifElement" id="Custom65" onclick="new PickableMotifElement('Custom65','motifElement_desc_Custom65','motifElement_icon_Custom65','Custom65','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom65" title="杯子" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom65">杯子</div>
            </a>

            <a class="motifElement Custom27Mru Custom27Tab pickableMotifElement" id="Custom27" onclick="new PickableMotifElement('Custom27','motifElement_desc_Custom27','motifElement_icon_Custom27','Custom27','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom27" title="笔记本电脑" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom27">笔记本电脑</div>
            </a>

            <a class="motifElement Custom18Mru Custom18Tab pickableMotifElement usedMotif " id="Custom18" onclick="new PickableMotifElement('Custom18','motifElement_desc_Custom18','motifElement_icon_Custom18','Custom18','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom18" title="表格" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom18" onfocus="addMouseOver(document.getElementById('usedHover_Custom18'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom18'), this)">表格<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom18" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom18_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Logs</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom61Mru Custom61Tab pickableMotifElement" id="Custom61" onclick="new PickableMotifElement('Custom61','motifElement_desc_Custom61','motifElement_icon_Custom61','Custom61','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom61" title="城堡" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom61">城堡</div>
            </a>

            <a class="motifElement Custom67Mru Custom67Tab pickableMotifElement" id="Custom67" onclick="new PickableMotifElement('Custom67','motifElement_desc_Custom67','motifElement_icon_Custom67','Custom67','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom67" title="齿轮" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom67">齿轮</div>
            </a>

            <a class="motifElement Custom54Mru Custom54Tab pickableMotifElement" id="Custom54" onclick="new PickableMotifElement('Custom54','motifElement_desc_Custom54','motifElement_icon_Custom54','Custom54','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom54" title="船" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom54">船</div>
            </a>

            <a class="motifElement Custom44Mru Custom44Tab pickableMotifElement" id="Custom44" onclick="new PickableMotifElement('Custom44','motifElement_desc_Custom44','motifElement_icon_Custom44','Custom44','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom44" title="锤子" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom44">锤子</div>
            </a>

            <a class="motifElement Custom17Mru Custom17Tab pickableMotifElement" id="Custom17" onclick="new PickableMotifElement('Custom17','motifElement_desc_Custom17','motifElement_icon_Custom17','Custom17','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom17" title="袋子" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom17">袋子</div>
            </a>

            <a class="motifElement Custom68Mru Custom68Tab pickableMotifElement" id="Custom68" onclick="new PickableMotifElement('Custom68','motifElement_desc_Custom68','motifElement_icon_Custom68','Custom68','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom68" title="地球仪" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom68">地球仪</div>
            </a>

            <a class="motifElement Custom78Mru Custom78Tab pickableMotifElement" id="Custom78" onclick="new PickableMotifElement('Custom78','motifElement_desc_Custom78','motifElement_icon_Custom78','Custom78','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom78" title="地图" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom78">地图</div>
            </a>

            <a class="motifElement Custom22Mru Custom22Tab pickableMotifElement" id="Custom22" onclick="new PickableMotifElement('Custom22','motifElement_desc_Custom22','motifElement_icon_Custom22','Custom22','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom22" title="电话" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom22">电话</div>
            </a>

            <a class="motifElement Custom91Mru Custom91Tab pickableMotifElement" id="Custom91" onclick="new PickableMotifElement('Custom91','motifElement_desc_Custom91','motifElement_icon_Custom91','Custom91','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom91" title="盾" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom91">盾</div>
            </a>

            <a class="motifElement Custom71Mru Custom71Tab pickableMotifElement" id="Custom71" onclick="new PickableMotifElement('Custom71','motifElement_desc_Custom71','motifElement_icon_Custom71','Custom71','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom71" title="耳机" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom71">耳机</div>
            </a>

            <a class="motifElement Custom88Mru Custom88Tab pickableMotifElement" id="Custom88" onclick="new PickableMotifElement('Custom88','motifElement_desc_Custom88','motifElement_icon_Custom88','Custom88','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom88" title="帆船" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom88">帆船</div>
            </a>

            <a class="motifElement Custom7Mru Custom7Tab pickableMotifElement" id="Custom7" onclick="new PickableMotifElement('Custom7','motifElement_desc_Custom7','motifElement_icon_Custom7','Custom7','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom7" title="方形" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom7">方形</div>
            </a>

            <a class="motifElement Custom85Mru Custom85Tab pickableMotifElement" id="Custom85" onclick="new PickableMotifElement('Custom85','motifElement_desc_Custom85','motifElement_icon_Custom85','Custom85','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom85" title="房地产标志" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom85">房地产标志</div>
            </a>

            <a class="motifElement Custom20Mru Custom20Tab pickableMotifElement usedMotif " id="Custom20" onclick="new PickableMotifElement('Custom20','motifElement_desc_Custom20','motifElement_icon_Custom20','Custom20','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom20" title="飞机" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom20" onfocus="addMouseOver(document.getElementById('usedHover_Custom20'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom20'), this)">飞机<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom20" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom20_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Tasks</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom73Mru Custom73Tab pickableMotifElement" id="Custom73" onclick="new PickableMotifElement('Custom73','motifElement_desc_Custom73','motifElement_icon_Custom73','Custom73','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom73" title="高速公路标志" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom73">高速公路标志</div>
            </a>

            <a class="motifElement Custom32Mru Custom32Tab pickableMotifElement usedMotif " id="Custom32" onclick="new PickableMotifElement('Custom32','motifElement_desc_Custom32','motifElement_icon_Custom32','Custom32','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom32" title="工厂" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom32" onfocus="addMouseOver(document.getElementById('usedHover_Custom32'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom32'), this)">工厂<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom32" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom32_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>报销单</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom93Mru Custom93Tab pickableMotifElement" id="Custom93" onclick="new PickableMotifElement('Custom93','motifElement_desc_Custom93','motifElement_icon_Custom93','Custom93','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom93" title="购物车" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom93">购物车</div>
            </a>

            <a class="motifElement Custom59Mru Custom59Tab pickableMotifElement" id="Custom59" onclick="new PickableMotifElement('Custom59','motifElement_desc_Custom59','motifElement_icon_Custom59','Custom59','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom59" title="罐" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom59">罐</div>
            </a>

            <a class="motifElement Custom13Mru Custom13Tab pickableMotifElement usedMotif " id="Custom13" onclick="new PickableMotifElement('Custom13','motifElement_desc_Custom13','motifElement_icon_Custom13','Custom13','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom13" title="盒形" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom13" onfocus="addMouseOver(document.getElementById('usedHover_Custom13'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom13'), this)">盒形<span class="timesUsed">[4]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom13" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom13_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Getting Started</li>
                        <li>Summary</li>
                        <li>Summary</li>
                        <li>View Responses</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom62Mru Custom62Tab pickableMotifElement" id="Custom62" onclick="new PickableMotifElement('Custom62','motifElement_desc_Custom62','motifElement_icon_Custom62','Custom62','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom62" title="黑板" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom62">黑板</div>
            </a>

            <a class="motifElement Custom86Mru Custom86Tab pickableMotifElement usedMotif " id="Custom86" onclick="new PickableMotifElement('Custom86','motifElement_desc_Custom86','motifElement_icon_Custom86','Custom86','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom86" title="红十字" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom86" onfocus="addMouseOver(document.getElementById('usedHover_Custom86'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom86'), this)">红十字<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom86" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom86_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Support</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom36Mru Custom36Tab pickableMotifElement" id="Custom36" onclick="new PickableMotifElement('Custom36','motifElement_desc_Custom36','motifElement_icon_Custom36','Custom36','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom36" title="火车" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom36">火车</div>
            </a>

            <a class="motifElement Custom57Mru Custom57Tab pickableMotifElement usedMotif " id="Custom57" onclick="new PickableMotifElement('Custom57','motifElement_desc_Custom57','motifElement_icon_Custom57','Custom57','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom57" title="积木" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom57" onfocus="addMouseOver(document.getElementById('usedHover_Custom57'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom57'), this)">积木<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom57" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom57_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Visual Workflow Sample Pack</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom69Mru Custom69Tab pickableMotifElement" id="Custom69" onclick="new PickableMotifElement('Custom69','motifElement_desc_Custom69','motifElement_icon_Custom69','Custom69','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom69" title="吉他" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom69">吉他</div>
            </a>

            <a class="motifElement Custom21Mru Custom21Tab pickableMotifElement usedMotif " id="Custom21" onclick="new PickableMotifElement('Custom21','motifElement_desc_Custom21','motifElement_icon_Custom21','Custom21','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom21" title="计算机" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom21" onfocus="addMouseOver(document.getElementById('usedHover_Custom21'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom21'), this)">计算机<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom21" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom21_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>DocMan</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom24Mru Custom24Tab pickableMotifElement" id="Custom24" onclick="new PickableMotifElement('Custom24','motifElement_desc_Custom24','motifElement_icon_Custom24','Custom24','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom24" title="建筑物" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom24">建筑物</div>
            </a>

            <a class="motifElement Custom48Mru Custom48Tab pickableMotifElement usedMotif " id="Custom48" onclick="new PickableMotifElement('Custom48','motifElement_desc_Custom48','motifElement_icon_Custom48','Custom48','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom48" title="奖品" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom48" onfocus="addMouseOver(document.getElementById('usedHover_Custom48'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom48'), this)">奖品<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom48" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom48_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Milestones</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom96Mru Custom96Tab pickableMotifElement" id="Custom96" onclick="new PickableMotifElement('Custom96','motifElement_desc_Custom96','motifElement_icon_Custom96','Custom96','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom96" title="街道标志" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom96">街道标志</div>
            </a>

            <a class="motifElement Custom82Mru Custom82Tab pickableMotifElement" id="Custom82" onclick="new PickableMotifElement('Custom82','motifElement_desc_Custom82','motifElement_icon_Custom82','Custom82','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom82" title="警笛" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom82">警笛</div>
            </a>

            <a class="motifElement Custom79Mru Custom79Tab pickableMotifElement" id="Custom79" onclick="new PickableMotifElement('Custom79','motifElement_desc_Custom79','motifElement_icon_Custom79','Custom79','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom79" title="卷尺" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom79">卷尺</div>
            </a>

            <a class="motifElement Custom98Mru Custom98Tab pickableMotifElement" id="Custom98" onclick="new PickableMotifElement('Custom98','motifElement_desc_Custom98','motifElement_icon_Custom98','Custom98','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom98" title="卡车" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom98">卡车</div>
            </a>

            <a class="motifElement Custom100Mru Custom100Tab pickableMotifElement" id="Custom100" onclick="new PickableMotifElement('Custom100','motifElement_desc_Custom100','motifElement_icon_Custom100','Custom100','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom100" title="宽屏电视" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom100">宽屏电视</div>
            </a>

            <a class="motifElement Custom34Mru Custom34Tab pickableMotifElement" id="Custom34" onclick="new PickableMotifElement('Custom34','motifElement_desc_Custom34','motifElement_icon_Custom34','Custom34','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom34" title="昆虫" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom34">昆虫</div>
            </a>

            <a class="motifElement Custom30Mru Custom30Tab pickableMotifElement" id="Custom30" onclick="new PickableMotifElement('Custom30','motifElement_desc_Custom30','motifElement_icon_Custom30','Custom30','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom30" title="雷达天线" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom30">雷达天线</div>
            </a>

            <a class="motifElement Custom84Mru Custom84Tab pickableMotifElement" id="Custom84" onclick="new PickableMotifElement('Custom84','motifElement_desc_Custom84','motifElement_icon_Custom84','Custom84','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom84" title="礼物" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom84">礼物</div>
            </a>

            <a class="motifElement Custom8Mru Custom8Tab pickableMotifElement" id="Custom8" onclick="new PickableMotifElement('Custom8','motifElement_desc_Custom8','motifElement_icon_Custom8','Custom8','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom8" title="菱形" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom8">菱形</div>
            </a>

            <a class="motifElement Custom53Mru Custom53Tab pickableMotifElement" id="Custom53" onclick="new PickableMotifElement('Custom53','motifElement_desc_Custom53','motifElement_icon_Custom53','Custom53','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom53" title="铃" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom53">铃</div>
            </a>

            <a class="motifElement Custom4Mru Custom4Tab pickableMotifElement" id="Custom4" onclick="new PickableMotifElement('Custom4','motifElement_desc_Custom4','motifElement_icon_Custom4','Custom4','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom4" title="六角形 " /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom4">六角形</div>
            </a>

            <a class="motifElement Custom92Mru Custom92Tab pickableMotifElement" id="Custom92" onclick="new PickableMotifElement('Custom92','motifElement_desc_Custom92','motifElement_icon_Custom92','Custom92','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom92" title="轮船" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom92">轮船</div>
            </a>

            <a class="motifElement Custom50Mru Custom50Tab pickableMotifElement" id="Custom50" onclick="new PickableMotifElement('Custom50','motifElement_desc_Custom50','motifElement_icon_Custom50','Custom50','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom50" title="马戏篷" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom50">马戏篷</div>
            </a>

            <a class="motifElement Custom35Mru Custom35Tab pickableMotifElement" id="Custom35" onclick="new PickableMotifElement('Custom35','motifElement_desc_Custom35','motifElement_icon_Custom35','Custom35','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom35" title="麦克风" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom35">麦克风</div>
            </a>

            <a class="motifElement Custom95Mru Custom95Tab pickableMotifElement usedMotif " id="Custom95" onclick="new PickableMotifElement('Custom95','motifElement_desc_Custom95','motifElement_icon_Custom95','Custom95','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom95" title="秒表" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom95" onfocus="addMouseOver(document.getElementById('usedHover_Custom95'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom95'), this)">秒表<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom95" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom95_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Times</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom80Mru Custom80Tab pickableMotifElement" id="Custom80" onclick="new PickableMotifElement('Custom80','motifElement_desc_Custom80','motifElement_icon_Custom80','Custom80','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom80" title="摩托车" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom80">摩托车</div>
            </a>

            <a class="motifElement Custom25Mru Custom25Tab pickableMotifElement usedMotif " id="Custom25" onclick="new PickableMotifElement('Custom25','motifElement_desc_Custom25','motifElement_icon_Custom25','Custom25','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom25" title="闹钟" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom25" onfocus="addMouseOver(document.getElementById('usedHover_Custom25'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom25'), this)">闹钟<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom25" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom25_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>考勤记录</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom45Mru Custom45Tab pickableMotifElement usedMotif " id="Custom45" onclick="new PickableMotifElement('Custom45','motifElement_desc_Custom45','motifElement_icon_Custom45','Custom45','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom45" title="票" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom45" onfocus="addMouseOver(document.getElementById('usedHover_Custom45'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom45'), this)">票<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom45" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom45_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>请假</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom51Mru Custom51Tab pickableMotifElement" id="Custom51" onclick="new PickableMotifElement('Custom51','motifElement_desc_Custom51','motifElement_icon_Custom51','Custom51','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom51" title="苹果" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom51">苹果</div>
            </a>

            <a class="motifElement Custom56Mru Custom56Tab pickableMotifElement" id="Custom56" onclick="new PickableMotifElement('Custom56','motifElement_desc_Custom56','motifElement_icon_Custom56','Custom56','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom56" title="瓶子" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom56">瓶子</div>
            </a>

            <a class="motifElement Custom47Mru Custom47Tab pickableMotifElement" id="Custom47" onclick="new PickableMotifElement('Custom47','motifElement_desc_Custom47','motifElement_icon_Custom47','Custom47','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom47" title="骑士" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom47">棋块</div>
            </a>

            <a class="motifElement Custom26Mru Custom26Tab pickableMotifElement" id="Custom26" onclick="new PickableMotifElement('Custom26','motifElement_desc_Custom26','motifElement_icon_Custom26','Custom26','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom26" title="旗帜" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom26">旗帜</div>
            </a>

            <a class="motifElement Custom31Mru Custom31Tab pickableMotifElement" id="Custom31" onclick="new PickableMotifElement('Custom31','motifElement_desc_Custom31','motifElement_icon_Custom31','Custom31','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom31" title="汽车" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom31">汽车</div>
            </a>

            <a class="motifElement Custom83Mru Custom83Tab pickableMotifElement" id="Custom83" onclick="new PickableMotifElement('Custom83','motifElement_desc_Custom83','motifElement_icon_Custom83','Custom83','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom83" title="铅笔" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom83">铅笔</div>
            </a>

            <a class="motifElement Custom37Mru Custom37Tab pickableMotifElement" id="Custom37" onclick="new PickableMotifElement('Custom37','motifElement_desc_Custom37','motifElement_icon_Custom37','Custom37','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom37" title="桥" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom37">桥</div>
            </a>

            <a class="motifElement Custom52Mru Custom52Tab pickableMotifElement" id="Custom52" onclick="new PickableMotifElement('Custom52','motifElement_desc_Custom52','motifElement_icon_Custom52','Custom52','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom52" title="球" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom52">球</div>
            </a>

            <a class="motifElement Custom74Mru Custom74Tab pickableMotifElement" id="Custom74" onclick="new PickableMotifElement('Custom74','motifElement_desc_Custom74','motifElement_icon_Custom74','Custom74','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom74" title="热气球" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom74">热气球</div>
            </a>

            <a class="motifElement Custom15Mru Custom15Tab pickableMotifElement usedMotif " id="Custom15" onclick="new PickableMotifElement('Custom15','motifElement_desc_Custom15','motifElement_icon_Custom15','Custom15','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom15" title="人员" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom15" onfocus="addMouseOver(document.getElementById('usedHover_Custom15'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom15'), this)">人员<span class="timesUsed">[2]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom15" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom15_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>员工档案</li>
                        <li>About FormAssembly.com</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom89Mru Custom89Tab pickableMotifElement" id="Custom89" onclick="new PickableMotifElement('Custom89','motifElement_desc_Custom89','motifElement_icon_Custom89','Custom89','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom89" title="萨克斯管" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom89">萨克斯管</div>
            </a>

            <a class="motifElement Custom6Mru Custom6Tab pickableMotifElement" id="Custom6" onclick="new PickableMotifElement('Custom6','motifElement_desc_Custom6','motifElement_icon_Custom6','Custom6','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom6" title="三角形" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom6">三角形</div>
            </a>

            <a class="motifElement Custom9Mru Custom9Tab pickableMotifElement" id="Custom9" onclick="new PickableMotifElement('Custom9','motifElement_desc_Custom9','motifElement_icon_Custom9','Custom9','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom9" title="闪电" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom9">闪电</div>
            </a>

            <a class="motifElement Custom2Mru Custom2Tab pickableMotifElement" id="Custom2" onclick="new PickableMotifElement('Custom2','motifElement_desc_Custom2','motifElement_icon_Custom2','Custom2','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom2" title="扇形" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom2">扇形</div>
            </a>

            <a class="motifElement Custom14Mru Custom14Tab pickableMotifElement usedMotif " id="Custom14" onclick="new PickableMotifElement('Custom14','motifElement_desc_Custom14','motifElement_icon_Custom14','Custom14','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom14" title="手" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom14" onfocus="addMouseOver(document.getElementById('usedHover_Custom14'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom14'), this)">手<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom14" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom14_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Your Account</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom28Mru Custom28Tab pickableMotifElement usedMotif " id="Custom28" onclick="new PickableMotifElement('Custom28','motifElement_desc_Custom28','motifElement_icon_Custom28','Custom28','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom28" title="手机" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom28" onfocus="addMouseOver(document.getElementById('usedHover_Custom28'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom28'), this)">手机<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom28" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom28_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>短信营销</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom70Mru Custom70Tab pickableMotifElement usedMotif " id="Custom70" onclick="new PickableMotifElement('Custom70','motifElement_desc_Custom70','motifElement_icon_Custom70','Custom70','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom70" title="手锯" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom70" onfocus="addMouseOver(document.getElementById('usedHover_Custom70'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom70'), this)">手锯<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom70" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom70_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Projects</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom58Mru Custom58Tab pickableMotifElement" id="Custom58" onclick="new PickableMotifElement('Custom58','motifElement_desc_Custom58','motifElement_icon_Custom58','Custom58','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom58" title="手杖" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom58">手杖</div>
            </a>

            <a class="motifElement Custom55Mru Custom55Tab pickableMotifElement" id="Custom55" onclick="new PickableMotifElement('Custom55','motifElement_desc_Custom55','motifElement_icon_Custom55','Custom55','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom55" title="书" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom55">书</div>
            </a>

            <a class="motifElement Custom33Mru Custom33Tab pickableMotifElement usedMotif " id="Custom33" onclick="new PickableMotifElement('Custom33','motifElement_desc_Custom33','motifElement_icon_Custom33','Custom33','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom33" title="书桌" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom33" onfocus="addMouseOver(document.getElementById('usedHover_Custom33'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom33'), this)">书桌<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom33" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom33_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Manage Web Forms</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom5Mru Custom5Tab pickableMotifElement" id="Custom5" onclick="new PickableMotifElement('Custom5','motifElement_desc_Custom5','motifElement_icon_Custom5','Custom5','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom5" title="树叶" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom5">树叶</div>
            </a>

            <a class="motifElement Custom90Mru Custom90Tab pickableMotifElement" id="Custom90" onclick="new PickableMotifElement('Custom90','motifElement_desc_Custom90','motifElement_icon_Custom90','Custom90','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom90" title="天平" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom90">天平</div>
            </a>

            <a class="motifElement Custom94Mru Custom94Tab pickableMotifElement" id="Custom94" onclick="new PickableMotifElement('Custom94','motifElement_desc_Custom94','motifElement_icon_Custom94','Custom94','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom94" title="听诊器" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom94">听诊器</div>
            </a>

            <a class="motifElement Custom39Mru Custom39Tab pickableMotifElement" id="Custom39" onclick="new PickableMotifElement('Custom39','motifElement_desc_Custom39','motifElement_icon_Custom39','Custom39','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom39" title="望远镜" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom39">望远镜</div>
            </a>

            <a class="motifElement Custom97Mru Custom97Tab pickableMotifElement" id="Custom97" onclick="new PickableMotifElement('Custom97','motifElement_desc_Custom97','motifElement_icon_Custom97','Custom97','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom97" title="温度计" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom97">温度计</div>
            </a>

            <a class="motifElement Custom38Mru Custom38Tab pickableMotifElement" id="Custom38" onclick="new PickableMotifElement('Custom38','motifElement_desc_Custom38','motifElement_icon_Custom38','Custom38','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom38" title="相机" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom38">相机</div>
            </a>

            <a class="motifElement Custom63Mru Custom63Tab pickableMotifElement" id="Custom63" onclick="new PickableMotifElement('Custom63','motifElement_desc_Custom63','motifElement_icon_Custom63','Custom63','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom63" title="芯片" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom63">芯片</div>
            </a>

            <a class="motifElement Custom1Mru Custom1Tab pickableMotifElement" id="Custom1" onclick="new PickableMotifElement('Custom1','motifElement_desc_Custom1','motifElement_icon_Custom1','Custom1','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom1" title="心形" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom1">心形</div>
            </a>

            <a class="motifElement Custom40Mru Custom40Tab pickableMotifElement" id="Custom40" onclick="new PickableMotifElement('Custom40','motifElement_desc_Custom40','motifElement_icon_Custom40','Custom40','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom40" title="信用卡" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom40">信用卡</div>
            </a>

            <a class="motifElement Custom3Mru Custom3Tab pickableMotifElement" id="Custom3" onclick="new PickableMotifElement('Custom3','motifElement_desc_Custom3','motifElement_icon_Custom3','Custom3','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom3" title="星期日" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom3">星期日</div>
            </a>

            <a class="motifElement Custom11Mru Custom11Tab pickableMotifElement" id="Custom11" onclick="new PickableMotifElement('Custom11','motifElement_desc_Custom11','motifElement_icon_Custom11','Custom11','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom11" title="星星" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom11">星星</div>
            </a>

            <a class="motifElement Custom41Mru Custom41Tab pickableMotifElement usedMotif " id="Custom41" onclick="new PickableMotifElement('Custom41','motifElement_desc_Custom41','motifElement_icon_Custom41','Custom41','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom41" title="现金" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom41" onfocus="addMouseOver(document.getElementById('usedHover_Custom41'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom41'), this)">一打现金<span class="timesUsed">[2]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom41" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom41_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Expenses</li>
                        <li>申购单</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom77Mru Custom77Tab pickableMotifElement" id="Custom77" onclick="new PickableMotifElement('Custom77','motifElement_desc_Custom77','motifElement_icon_Custom77','Custom77','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom77" title="已锁定" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom77">已锁定</div>
            </a>

            <a class="motifElement Custom81Mru Custom81Tab pickableMotifElement" id="Custom81" onclick="new PickableMotifElement('Custom81','motifElement_desc_Custom81','motifElement_icon_Custom81','Custom81','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom81" title="音符" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom81">音符</div>
            </a>

            <a class="motifElement Custom16Mru Custom16Tab pickableMotifElement" id="Custom16" onclick="new PickableMotifElement('Custom16','motifElement_desc_Custom16','motifElement_icon_Custom16','Custom16','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom16" title="银行" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom16">银行</div>
            </a>

            <a class="motifElement Custom23Mru Custom23Tab pickableMotifElement usedMotif " id="Custom23" onclick="new PickableMotifElement('Custom23','motifElement_desc_Custom23','motifElement_icon_Custom23','Custom23','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom23" title="信封" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom23" onfocus="addMouseOver(document.getElementById('usedHover_Custom23'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom23'), this)">邮件<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom23" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom23_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>VCS Smart Email Inbox</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom46Mru Custom46Tab pickableMotifElement" id="Custom46" onclick="new PickableMotifElement('Custom46','motifElement_desc_Custom46','motifElement_icon_Custom46','Custom46','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom46" title="邮票" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom46">邮资</div>
            </a>

            <a class="motifElement Custom60Mru Custom60Tab pickableMotifElement" id="Custom60" onclick="new PickableMotifElement('Custom60','motifElement_desc_Custom60','motifElement_icon_Custom60','Custom60','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom60" title="雨伞" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom60">雨伞</div>
            </a>

            <a class="motifElement Custom12Mru Custom12Tab pickableMotifElement" id="Custom12" onclick="new PickableMotifElement('Custom12','motifElement_desc_Custom12','motifElement_icon_Custom12','Custom12','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom12" title="圆形" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom12">圆形</div>
            </a>

            <a class="motifElement Custom76Mru Custom76Tab pickableMotifElement" id="Custom76" onclick="new PickableMotifElement('Custom76','motifElement_desc_Custom76','motifElement_icon_Custom76','Custom76','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom76" title="钥匙" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom76">钥匙</div>
            </a>

            <a class="motifElement Custom10Mru Custom10Tab pickableMotifElement usedMotif " id="Custom10" onclick="new PickableMotifElement('Custom10','motifElement_desc_Custom10','motifElement_icon_Custom10','Custom10','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom10" title="月亮" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom10" onfocus="addMouseOver(document.getElementById('usedHover_Custom10'), this)" onmouseover="addMouseOver(document.getElementById('usedHover_Custom10'), this)">月亮<span class="timesUsed">[1]</span></div>
            </a>
            <div class="mouseOverInfoOuter" id="usedHover_Custom10" tabindex="0">
                <div class="mouseOverInfo" id="usedHover_Custom10_inner" style="display: none;">
                    该样式用于下述选项卡：<ul>
                        <li>Calendar</li>
                    </ul>
                </div>
            </div>
            <a class="motifElement Custom72Mru Custom72Tab pickableMotifElement" id="Custom72" onclick="new PickableMotifElement('Custom72','motifElement_desc_Custom72','motifElement_icon_Custom72','Custom72','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom72" title="直升飞机" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom72">直升飞机</div>
            </a>

            <a class="motifElement Custom64Mru Custom64Tab pickableMotifElement" id="Custom64" onclick="new PickableMotifElement('Custom64','motifElement_desc_Custom64','motifElement_icon_Custom64','Custom64','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom64" title="指南针" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom64">指南针</div>
            </a>

            <a class="motifElement Custom66Mru Custom66Tab pickableMotifElement" id="Custom66" onclick="new PickableMotifElement('Custom66','motifElement_desc_Custom66','motifElement_icon_Custom66','Custom66','p2').motifElement.onclick();"><span class="iconChoice">
                <img src="/s.gif" alt="null" class="mruIcon" id="motifElement_icon_Custom66" title="骰子" /></span><div class="colorChoice primaryPalette" id="motifElement_desc_Custom66">骰子</div>
            </a>
            <div class="clearingBox"></div>
        </div>
        <div class="pbBottomButtons">&nbsp;</div>
        <div class="pbFooter secondaryPalette">
            <div class="bg"></div>
        </div>
    </div>


    <!-- Body events -->
    <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; window.resizeTo(790, 500); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd055MHpNRlF3T0RvMU1UbzBOQzR5TkRkYSxkVDdHUGZXdkdDVnhvY2x3c0xaemkzLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { } function bodyOnUnload() { }</script>
</body>
</html>
