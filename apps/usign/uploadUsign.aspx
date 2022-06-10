<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadUsign.aspx.cs" Inherits="WebClient.apps.usign.uploadUsign" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>用户签名:上传签名 </title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/DataDotComClean.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />
    <style>
         body #iframe {
            position: fixed;
            background-color: white;
            width: 100%;
            left: 0;
            top: 50%;
            border-radius: 7px;
            display: block;
            height:620px;
            border:0;
            overflow:hidden;
            z-index:9999;
            display:none;
        }
        .popup-mask {
            display:none;
            position: fixed;
            background-color:transparent;
            width:100%;
            height:100%;
            top:0;
            z-index:999;
            left:0;
            position:fixed;
            background: url(/img/bgOverlayDialogBackground.png) ;
            background-color: transparent;
        }
    </style>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "salesforceURL": "https://ap1..com", "dateFormat": "yyyy-M-d", "isS1Desktop": false, "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1449795208000", "today": "2015-12-27 上午9:52", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Campaign';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1448894026000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1450707104000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>//ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '117.79.232.220', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fp%2Fattach%2FNoteAttach%3Fpid%3D70190000000uODU%26parentname%3DGC%2BProduct%2BWebinar%2B-%2BJan%2B7%252C%2B2002%26retURL%3D%252F70190000000uODU');</script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif campaignTab  NoteAttach sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" /><div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
             <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                  <td id="sidebarCell" class=" sidebarCell sidebarCollapsible sidebarCollapsed">
                         <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" title="内容在此开始" /></a><div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img src="/s.gif" alt="上传签名" class="pageTitleIcon" title="上传签名" /><h1 class="noSecondHeader pageType">上传签名 </h1>
                                        <div class="blank">&nbsp;</div>
                                    </div>
                                    <div class="links"></div>
                                </div>
                                <div class="ptBreadcrumb"></div>
                            </div>
                        <!--
                            if (document.getElementById('file').value !== ''){ document.getElementById('Attach').disabled = true;};
                        -->
                        <form action="/apps/usign/uploadUsign.aspx" enctype="multipart/form-data" id="editPage" method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; };">
                            <input type="hidden" name="cancelURL" id="cancelURL" value="/70190000000uODU" />
                            <input type="hidden" name="pid" id="pid" value="70190000000uODU" />
                            <input type="hidden" name="retURL" id="retURL" value="/70190000000uODU" />
                            <input type="hidden" name="save_new_url" id="save_new_url" value="" />
                            <div class="genericPageBlockTable">
                                <table>
                                     <tr>
                                        <td><strong>1.</strong></td>
                                        <td><strong>选择用户</strong></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                        <input id="suser_lkid" type="hidden" value="<%=Request["id"]%>" name="suser_lkid">
                                        <input id="suser_lkold" type="hidden" value="null" name="suser_lkold">
                                        <input id="suser_lktp" type="hidden" value="8" name="suser_lktp">
                                        <input id="suser_lspf" type="hidden" value="0" name="suser_lspf">
                                        <input id="suser_lspfsub" type="hidden" value="0" name="suser_lspfsub">
                                        <input id="suser_mod" type="hidden" value="0" name="suser_mod">
                                        <span class="lookupInput">
                                            <input id="suser" type="text" tabindex="8" size="20" onchange="getElementByIdCS('suser_mod').value='1';" name="suser" maxlength="255">
                                            <%--<a id="suser_lkwgt" title="用户 查找（新窗口）" tabindex="8" onclick="setLastMousePosition(event)" href="javascript:%20openLookup%28%27%2F_ui%2Fcommon%2Fdata%2FLookupPage%3Flkfm%3DeditPage%26lknm%3Dsuser%26lktp%3D%27%20%2B%20getElementByIdCS%28%27suser_lktp%27%29.value%2C670%2C%271%27%2C%27%26lksrch%3D%27%20%2B%20escapeUTF%28getElementByIdCS%28%27suser%27%29.value.substring%280%2C%2080%29%29%29">
                                                <img class="lookupIcon" title="用户 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" alt="用户 查找（新窗口）" src="/s.gif">
                                            </a>--%>
                                            <a id="suser_lkwgt" title="用户 查找（新窗口）" tabindex="8" onclick="showmodal(event)" href="#">
                                                <img class="lookupIcon" title="用户 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" alt="用户 查找（新窗口）" src="/s.gif">
                                            </a>
                                        </span>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>2.</strong></td>
                                        <td><strong>选择签名文件</strong></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>输入文件路径或单击“浏览”按钮查找文件。</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td style="padding-bottom: 1em">
                                            <input id="file" name="file" size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" /></td>
                                    </tr>
                                    <tr>
                                        <td><strong>3.</strong></td>
                                        <td><strong>单击“上传签名”按钮。</strong></td>
                                    </tr><!--
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>重复步骤 1 和步骤 2 的操作，附加多个文件。</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>（上载完毕后，文档信息将显示在下方。 )</td>
                                    </tr>-->
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <input value=" 上传签名 " style="height:25px;" class="btn" id="Attach" name="Attach" onclick="javascript: setLastMousePosition(event); window.openPopup('/widg/uploadwaiting.aspx', 'uploadWaiting', 400, 130, 'width=400,height=130,resizable=no,toolbar=no,status=no,scrollbars=no,menubar=no,directories=no,location=no,dependant=no', true);" title="附加文件 （新窗口）" type="submit" /></td>
                                    </tr>
                                </table>
                            </div>
                        </form><!--
                        <form enctype="multipart/form-data" method="post" name="editPage" action="/p/attach/NoteAttach" id="editPage_1" onsubmit="if (window.ffInAlert) { return false; };if (document.getElementById('file').value !== ''){ document.getElementById('Attach').disabled = true;};">
                            <input type="hidden" name="_CONFIRMATIONTOKEN" id="done__CONFIRMATIONTOKEN" value="VmpFPSxNakF4TlMweE1pMHpNRlF3TVRvMU1qbzBNeTQzTWpaYSx1Q0o2NHdHZGE3Z1VyeXhsMUJYYWdfLE1UUXpOR05o" /><input type="hidden" name="cancelURL" id="done_cancelURL" value="/70190000000uODU" /><input type="hidden" name="pid" id="done_pid" value="70190000000uODU" /><input type="hidden" name="retURL" id="done_retURL" value="/70190000000uODU" /><input type="hidden" name="save_new_url" id="done_save_new_url" value="/p/attach/NoteAttach?pid=70190000000uODU&amp;parentname=GC+Product+Webinar+-+Jan+7%2C+2002&amp;retURL=%2F70190000000uODU" /><table class="fileUploadTableBottom">
                                <tr>
                                    <td><strong>3.</strong></td>
                                    <td><strong>单击&quot;完成&quot;按钮返回上一页。</strong></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>（这将取消正在进行的上载过程。 )</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input value=" 完成 " class="btn" name="cancel" title="完成" type="submit" /></td>
                                </tr>
                            </table>
                        </form>-->
                        &nbsp;
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMweE1pMHpNRlF3TVRvMU1qbzBNeTQzTlRWYSw5b3BQQVpnUmJXdU44THFTNU1XNUZmLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fp%2Fattach%2FNoteAttach%3Fpid%3D70190000000uODU%26parentname%3DGC%2BProduct%2BWebinar%2B-%2BJan%2B7%252C%2B2002%26retURL%3D%252F70190000000uODU&isAjaxRequest=1&renderMode=RETRO&nocache=1451181163774'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMweE1pMHpNRlF3TVRvMU1qbzBNeTQ1TURSYSxYbHZ2ZTZ0SjFKNjdDalRSRXVXSjh3LE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { window.closePopup(); }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
           <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script>var SFDCSessionVars = { "uid": "0059000000390Wh", "server": "", "act": "u", "host": "", "oid": "00D90000000yvHG", "exp": 1451188266000 };</script>
    <script> (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase198.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script> (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <iframe id="iframe" frameborder="0" src=""></iframe>
    <div class="popup-mask"></div>
    <script>
        function showmodal(event) {
            setLastMousePosition(event)
            $('.popup-mask').show()
            $('#iframe').attr('src', '/alert/lookupiframe.html?objtypecode=8&lknm=suser&title=选择用户&lookupName=UserName&search=undefined&readonly=undefined&filterquery=undefined').show().height(620).css({ "top": "10%", "left": "25%", "background-color": "white", "width": "50%" })
        }
    </script>
</body>
</html>
<!-- page generation time: 193ms -->

