<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoteAttach.aspx.cs" Inherits="WebClient.attach.NoteAttach" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>附加文件到 联系人 liu jack ~ - Developer Edition</title>
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
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1418697584000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-12-29 下午6:11", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Contact';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //   ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.202.191.6', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fp%2Fattach%2FNoteAttach%3Fpid%3D0039000001HgjaT%26parentname%3Dliu%2Bjack%26retURL%3D%252F0039000001HgjaT');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif contactTab  NoteAttach sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
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
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed" id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="联系人" class="pageTitleIcon" title="联系人" /><h1 class="pageType noSecondHeader">
                                                附加文件到 联系人 <%=Request["parentname"]%></h1>
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
                             <script type="text/javascript">
                                 var totalsizeOfUploadFiles = 0;
                                 function getFileSizeandName(input) {
                                     var select = jQuery('#fileList');
                                     var html = "";
                                     for (var i = 0; i < input.files.length; i++) {
                                         var filesizeInBytes = input.files[i].size;
                                         var filesizeInMB = (filesizeInBytes / (1024 * 1024)).toFixed(2);
                                         var filename = input.files[i].name;
                                         //alert("File name is : "+filename+" || size : "+filesizeInMB+" MB || size : "+filesizeInBytes+" Bytes");
                                         html += "<li>文件名：<a style='color:blue;'>" + filename + "</a> 大小：" + filesizeInMB + "M</li>";
                                         
                                     }
                                     select.html(html);
                                 }

                                 function CloseAndRefresh() {
                                     opener.location.reload(true);
                                     self.close();
                                 }
</script>
                        <form action="/attach/NoteAttach.aspx" enctype="multipart/form-data" id="editPage"
                        method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; }">
                        <input  type="hidden" name="cancelURL" id="cancelURL" value="/0039000001HgjaT" /><input type="hidden"
                                name="pid" id="pid" value="<%=Request["pid"]%>" /><input type="hidden" name="retURL"
                                    id="retURL" value="<%=Request["retURL"]%>" />
                                    <input type="hidden"   name="parentname" id="parentname" value="<%=Request["parentname"]%>" />
                                    <input type="hidden" name="save_new_url" id="save_new_url"
                                        value="/p/attach/NoteAttach?retURL=%2F0039000001HgjaT&amp;pid=0039000001HgjaT&amp;parentname=liu+jack" /><div
                                            class="genericPageBlockTable">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <strong>1.</strong>
                                                    </td>
                                                    <td>
                                                        <strong>选择文件</strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        输入文件路径或单击“浏览”按钮查找文件。
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td style="padding-bottom: 1em">
                                                        <input id="file" name="file[]" size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" multiple="multiple"  onchange="getFileSizeandName(this);"/>
                                                        <br />
                        <div id="fileListContainer">
                            已选文件：<br />
                            <ul id="fileList">

                            </ul>
                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <strong>2.</strong>
                                                    </td>
                                                    <td>
                                                        <strong>单击“附加文件”按钮。</strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        重复步骤 1 和步骤 2 的操作，附加多个文件。
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        （上载完毕后，文档信息将显示在下方。 )
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <input value=" 上传文件 " class="btn" name="Attach" onclick="javascript:setLastMousePosition(event); window.openPopup('/widg/uploadwaiting.aspx', 'uploadWaiting', 400, 130, 'width=400,height=130,resizable=no,toolbar=no,status=no,scrollbars=no,menubar=no,directories=no,location=no,dependant=no', true);"
                                                            title="上传文件 （新窗口）" type="submit" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                        </form>
                        <form id="editPage_1" name="editPage" enctype="multipart/form-data" action="/attach/NoteAttach.aspx"
                        method="post" onsubmit="if (window.ffInAlert) { return false; }">
                        <input
                            type="hidden" name="cancelURL" id="done_cancelURL" value="/0039000001HgjaT" /><input
                                type="hidden" name="pid" id="done_pid" value="<%=Request["pid"]%>" /><input type="hidden"
                                    name="retURL" id="done_retURL" value="/0039000001HgjaT" /><input type="hidden" name="save_new_url"
                                        id="done_save_new_url" value="/p/attach/NoteAttach?retURL=%2F0039000001HgjaT&amp;pid=0039000001HgjaT&amp;parentname=liu+jack" /><table
                                            class="fileUploadTableBottom">
                                            <tr>
                                                <td>
                                                    <strong>3.</strong>
                                                </td>
                                                <td>
                                                    <strong>单击&quot;完成&quot;按钮返回上一页。</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    （这将取消正在进行的上载过程。 )
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <input value=" 完成 " class="btn" name="cancel" title="完成" type="submit" />
                                                </td>
                                            </tr>
                                        </table>
                        </form>
                        &nbsp;
                        <div id="ep" class="bPageBlock brandSecondaryBrd secondaryPalette">
                            <div class="pbHeader pbHeaderEmpty">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="pbTitle">
                                                <img width="12" height="1" style="margin-right: 0.25em;" title="" class="minWidth"
                                                    alt="" src="/s.gif" /><h2 class="mainTitle">
                                                    </h2>
                                            </td>
                                            <td id="topButtonRow" class="pbButton">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div style="display: none" id="errorDiv_ep" class="pbError">
                                    错误：无效数据。<br/>
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div id="head_1_ep" class="pbSubheader brandTertiaryBrd brandTertiaryBgr first tertiaryPalette">
                                    <h3>
                                        已上载下列文件<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                        <tbody>
                                            <tr>
                                                <td class="labelCol">
                                                    文件名
                                                </td>
                                                <td colspan="3" class="data2Col">
                                                    feedback.txt
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="last labelCol">
                                                    大小
                                                </td>
                                                <td colspan="3" class="last data2Col">
                                                    10KB
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fp%2Fattach%2FNoteAttach%3Fpid%3D0039000001HgjaT%26parentname%3Dliu%2Bjack%26retURL%3D%252F0039000001HgjaT&isAjaxRequest=1&renderMode=RETRO&nocache=1419847881062'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "yo94HEKkvuS0Soql9dS7_LQMFnJACmNq1cksR06.KDuIABq9N0DlALeTcaiLYAK3oTb4UOkQbchfqk6BwMjI9Uy9DD1KyqZfGi1BuuILYBMw1r.tvgeuyZJ8P12hjVu8rVqmPNoBfmEA9JAP4SOl.hbM_B2u9GaLgnN7_t8FR6FsuiMFbv_iLh2mLXGUjNSoPkyxiA=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { window.closePopup(); }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <!--
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1419855079000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>    
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1418325280000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1418332602000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
</body>
</html>
<!-- page generation time: 1962ms -->
