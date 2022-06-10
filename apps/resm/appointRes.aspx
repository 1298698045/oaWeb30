<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointRes.aspx.cs" Inherits="WebClient.apps.resm.appointRes" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>资源预约：新建预约 ~ </title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DedupeCSS.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ManyWhoStyles.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/Calendar.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
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
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/ManyWhoActivity.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
     <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
     <script src="/js/Business.js"></script>
    <script>        window.sfdcPage = new EditPage(null);
        UserContext.initialize({ "networkId": "", "labelLastModified": "1435077876000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd tth:m")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Event';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/DedupeCSS.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/Calendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1427810574000/sfdc/Security.js"></script>
    <script>        //   ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.202.191.2', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00U%2Fe%3FretURL%3D%252Fhome%252Fhome.jsp');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif eventTab  editPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
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
                    <td id="sidebarCell" class=" sidebarCell sidebarCollapsible sidebarCollapsed">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><h1 class="pageType noSecondHeader">
                                                资源预约：新建预约</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links"><!--
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a>--></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <script type="text/javascript">
                            function updateOpener(addnl, mode) {
                                document.editPage.hdnaddn.value = addnl;
                                document.editPage.hdnrefr.value = mode;
                                document.editPage.submit();
                            }
                            function removeInvitee(id) {
                                updateOpener(id, '1', []);
                            }
                            function ivwh(elemId, otherElemId) {
                                var id = document.getElementById(elemId).value; if (otherElemId != null && (id == '' || id == '000000000000000')) { id = document.getElementById(otherElemId).value; } if (id != null && id != '' && id != '000000000000000') {
                                    updateOpener(id, '0', []);
                                }
                            };
                            var isValid = true;
                            function isFreeResource()
                            {
                                //var valId = document.getElementById("id");
                                //if (valId) return;
                                var res = document.getElementById("orgResources").value;
                                var isFree = true;

                                var meetingText = document.getElementById("id");
                                var meetingId = "";
                                //
                                if (meetingText) {
                                    meetingId = meetingText.value;
                                }

                                var str1 = document.getElementById("StartDateTime").value + " " + document.getElementById("StartDateTime_time").value;
                                var str2 = document.getElementById("EndDateTime").value + " " + document.getElementById("EndDateTime_time").value;

                                if (!compareTime(str1, str2)) {
                                    alert("结束时间必须大于起止时间！");
                                    return false;

                                }

                                //de
                                checkResourceFree(res, str1, str2, meetingId, vFree);
                                //checkResourceFree(res, str1, str2, meetingId, vFree);
                               // if (!isFree) return false;
                            }
                            function vFree(data) {

                                if (!data.isFree) {
                                    jQuery("#errorDiv_ep").show();
                                    jQuery("#errorDiv_ep").html(data.msg);
                                    alert(data.msg);
                                    isFree = false;
                                    isValid = false;
                                }
                                else {
                                    jQuery("#errorDiv_ep").hide();
                                    isValid = true;
                                }

                            }
                            function validateForm() {
                                if (document.getElementById("cancelAction").value == 1)
                                    return true;
                                var subject = document.getElementById("evt5").value;
                                if (subject == "") {
                                    alert("“主题”必填！");
                                    return false;
                                }
                                var roomId = document.getElementById("orgResources").value;
                                if (roomId == "") {
                                    alert("“资源”必选！");
                                    return false;
                                }
                                var time1 = document.getElementById("StartDateTime_time").value;
                                var time2 = document.getElementById("EndDateTime_time").value;
                                if (time1 == "" || time2 == "") {
                                    alert("“开始	结束”必填！");
                                    return false;
                                }
                                var str1 = document.getElementById("StartDateTime").value + " " + time1 + ":00";
                                var str2 = document.getElementById("StartDateEnd").value + " " + time2 + ":00";
                                //debugger;
                                if (!compareTime(str1, str2)) {
                                    alert("结束时间必须大于起止时间！");
                                    return false;
                                }
                                if (!isValid)
                                    return false;
                                return true;
                            }
                            function doCancelAction()
                            {
                                document.getElementById("cancelAction").value = 1;
                            }
                        </script>
                        <script src="/static/111213/js/spch.js"></script>
                        <form action="/025/e" id="editPage" method="post" name="editPage" onsubmit="if ($('#TelePhone').val()=='') { alert('联系电话必填'); return false; };if (window.ffInAlert) { return false; } if (!validateForm()) { return false; } if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }">
                        <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <input type="hidden" id="cancelAction" name="cancelAction" />
                        <div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette" id="ep">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">
                                                预约编辑</h2>
                                        </td>
                                        <td class="pbButton" id="topButtonRow">
                                            <%if(ShowButton) { %>
                                            <input value=" 保存预约 " class="btn" title="保存预约" name="save" type="submit" />
                                            <input value=" 取消 " class="btn" title="取消" name="cancel" type="submit" onclick="doCancelAction()" />
                                            <%} %>
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
                                        <tr class="last detailRow">
                                            <td colspan='4'>
                                                <div id="attWarning" style="display: none;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <img src="/img/alert.gif" alt="报警&quot;" width="24" height="24" title="报警&quot;" />
                                                            </td>
                                                            <td>
                                                                只有在您保存事件后才保存为此事件上载的附件。
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_1_ep">
                                    <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                        <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                            class="requiredText"> = 必填信息</span></span></span><h3>
                                                预约详细信息<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="labelCol requiredInput">
                                                <label for="evt1_top">
                                                    <span class="assistiveText">*</span>预约人</label>
                                            </td>
                                            <td class="dataCol col02">
                                                <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                                    <div id="evt1_top" name="evt1_top" style="white-space: nowrap">
                                                        用户<input type="hidden" name="evt1_lkid" id="evt1_lkid" value="<%=OwningUser%>" />
                                                        <input   type="hidden" name="evt1_lkold" id="evt1_lkold" value="<%=OwningUserName%>"/>
                                                        <input type="hidden"  name="evt1_lktp" id="evt1_lktp" value="8" />
                                                        <input type="hidden"  name="evt1_lspf" id="evt1_lspf" value="0" />
                                                        <input type="hidden" name="evt1_lspfsub" id="evt1_lspfsub" value="0" />
                                                        <input type="hidden" name="evt1_mod" id="evt1_mod" value="0" />
                                                        <input type="hidden" id="evt1_onpk" name="evt1_onpk" value="document.editPage.focusThisFieldOnLoad.value='evt1';setTimeout('document.editPage.submit()', 50);" />
                                                        <span  class="lookupInput"><input id="evt1" maxlength="255" name="evt1" onchange="getElementByIdCS('evt1_lkid').value='';getElementByIdCS('evt1_mod').value='1';document.editPage.focusThisFieldOnLoad.value='evt1';"
                                                                                    size="20" tabindex="1" title="预约人" type="text" value="<%=OwningUserName%>" /><a href="javascript:%20openLookup%28%27%2F_ui%2Fcommon%2Fdata%2FLookupPage%3Flkfm%3DeditPage%26lknm%3Devt1%26lktp%3D%27%20%2B%20getElementByIdCS%28%27evt1_lktp%27%29.value%2C670%2C%271%27%2C%27%26lksrch%3D%27%20%2B%20escapeUTF%28getElementByIdCS%28%27evt1%27%29.value.substring%280%2C%2080%29%29%29"
                                                                                        id="evt1_lkwgt" onclick="setLastMousePosition(event)" secid="evt1_mlbtn" tabindex="1"
                                                                                        title="预约人 查找（新窗口）"><img src="/s.gif" alt="预约人 查找（新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                                                                            onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                                                            onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                            title="预约人 查找（新窗口）" /></a></span></div>
                                                </div>
                                            </td>
                                            <td class="labelCol requiredInput">
                                                <label for="evt12">
                                                    资源</label>
                                            </td>
                                            <td class="dataCol">
                                                <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                                <select id="orgResources" name="orgResources" onchange="isFreeResource();" tabindex="2"> <%=OrgResources%></select>
                                               
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol requiredInput">
                                                <label for="evt5">
                                                    <span class="assistiveText">*</span>主题</label>
                                            </td>
                                            <td class="dataCol col02">
                                                <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                                    <script type="text/javascript">
                                                        var cb_evt5 = new Array();
                                                        cb_evt5[0] = '会议';
                                                        cb_evt5[1] = '参观';
                                                        cb_evt5[2] = '检查';
                                                        cb_evt5[3] = '培训';
                                                        cb_evt5[4] = '其他';
                                                    </script>
                                                    <input id="evt5" maxlength="255" name="evt5" size="20" tabindex="3" type="text" value="<%=Subject%>" /><a
                                                        href="javascript:openPopupFocus%28%27%2Fwidg%2Fcombobox.aspx%3Fform%3DeditPage%26field%3Devt5%26display%3D1%26cnt%3D5%27%2C%20%27_blank%27%2C%20270%2C%20200%2C%20%27width%3D270%2Cheight%3D200%2Cresizable%3Dyes%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cscrollbars%3Dyes%2Cmenubar%3Dno%2Cdirectories%3Dno%2Clocation%3Dno%2Cdependant%3Dyes%27%2C%20true%2C%20true%29%3B"
                                                        onclick="setLastMousePosition(event)" size="20" tabindex="2" title="组合框 （新窗口）"><img
                                                            src="/s.gif" alt="主题 组合框 （新窗口）" class="comboboxIcon" onblur="this.className = 'comboboxIcon';"
                                                            onfocus="this.className = 'comboboxIconOn';" onmouseout="this.className = 'comboboxIcon';this.className = 'comboboxIcon';"
                                                            onmouseover="this.className = 'comboboxIconOn';this.className = 'comboboxIconOn';"
                                                            title="主题 组合框 （新窗口）" /></a></div>
                                            </td>
                                            <td class="labelCol requiredInput">
                                                <label for="StartDateTime">
                                                    <span class="assistiveText">*</span>开始</label>
                                            </td>
                                            <td class="dataCol">
                                                <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                                    <span class="dateInput dateOnlyInput">
                                                        <input id="StartDateTime" name="StartDateTime" onchange="ActivityFunction.updateDates(&#39;StartDateTime&#39;, [&quot;reminder_dt&quot;,&quot;RecurrenceStartDateTime&quot;,&quot;EndDateTime&quot;], true);ActivityFunction.updateCalendar([&quot;evt1_top&quot;,&quot;evt1_lkid&quot;,&quot;StartDateTime&quot;,&quot;EndDateTime&quot;,&quot;evt15&quot;,&quot;hh&quot;,&quot;mi&quot;,&quot;IsRecurrence&quot;,&quot;RecurrenceStartDateTime&quot;,&quot;RecurrenceEndDateOnly&quot;,&quot;rectype&quot;,&quot;recd&quot;,&quot;recm&quot;,&quot;recy&quot;,&quot;invtee&quot;]);ActivityFunction.saveStartTime(&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;);ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                            onfocus="DatePicker.pickDate(true, 'StartDateTime', false);" size="10" tabindex="8"
                                                            type="text" value="<%=ScheduledStart%>" /><span class="timeInput"><input autocomplete="off"
                                                                id="StartDateTime_time" name="StartDateTime_time" onchange="ActivityFunction.updateEndTime(&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;, &#39;EndDateTime&#39;, &#39;EndDateTime_time&#39;);ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                                onfocus="ActivityFunction.saveStartTime(&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;);ActivityFunction.showTimePicker(&#39;StartDateTime_time&#39;)"
                                                                size="8" tabindex="9" type="text" value="<%=ScheduledStartTime%>" onblur="isFreeResource()" />
                                                                <span class="dateFormat">[&nbsp;<a href="#" onclick="var inputField = getElementByIdCS('StartDateTime_time');if (inputField && !inputField.disabled && inputField.value != '<%=ScheduledStartTime%>') { inputField.value = '<%=ScheduledStartTime%>'; if (inputField.onchange) {inputField.onchange();}}return false;"><%=ScheduledStartTime%></a>&nbsp;]</span></span></span></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol   last">
                                                <label for="StartDateTime">
                                                    <span class="assistiveText">*</span>审批状态</label>
                                            </td>
                                            <td class="dataCol col02  last">
                                                 <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                               <select id="approveStatus" name="approveStatus" tabindex="6"> 
                                                   <%=ApproveStatus%>
                                               </select>                                               
                                                </div>
                                            </td>
                                            <td class="labelCol requiredInput  last">
                                                <label for="EndDateTime">
                                                    <span class="assistiveText">*</span>结束</label>
                                            </td>
                                            <td class="dataCol last">
                                                <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                                    <span class="dateInput dateOnlyInput">
                                                        <input id="EndDateTime" name="EndDateTime" onchange="ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                            onfocus="DatePicker.pickDate(true, 'EndDateTime', false);" size="10" tabindex="10"
                                                            type="text" value="<%=ScheduledEnd%>" /><span class="timeInput"><input autocomplete="off"
                                                                id="EndDateTime_time" name="EndDateTime_time" onchange="ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                                onfocus="ActivityFunction.showTimePicker(&#39;EndDateTime_time&#39;)" size="8"
                                                                tabindex="11" type="text" value="<%=ScheduledEndTime%>" onblur="isFreeResource()"/>
                                                                <span class="dateFormat">[&nbsp;<a href="#" onclick="var inputField = getElementByIdCS('EndDateTime_time');if (inputField && !inputField.disabled && inputField.value != '<%=DateNowTime%>') { inputField.value = '<%=DateNowTime%>'; if (inputField.onchange) {inputField.onchange();}}return false;"><%=DateNowTime%></a>&nbsp;]</span></span></span></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol requiredInput  last">
                                                <label for="EndDateTime">
                                                    <span class="assistiveText">*</span>配备物品</label>
                                            </td>
                                            <td class="dataCol col02  last">
                                                 <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                                     <%=Attaches%>                                     
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol requiredInput  last">
                                                <label for="EndDateTime">
                                                    <span class="assistiveText">*</span>联系电话</label>
                                            </td>
                                            <td class="dataCol col02  last">                                                
                                                <input id="TelePhone" maxlength="255" name="TelePhone" size="20" tabindex="11" type="text" value="<%=TelePhone%>" />                                
                                            </td>
                                            <td class="labelCol requiredInput  last">
                                                <label for="EndDateTime">
                                                    <span class="assistiveText">*</span>参会人数</label>
                                            </td>
                                            <td class="dataCol col02  last">                                                
                                                <input id="PeopleQty" maxlength="255" name="PeopleQty" size="20" tabindex="12" type="text" value="<%=PeopleQty%>" />                                
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_2_ep">
                                    <h3>
                                        备注信息<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="last labelCol">
                                                <label for="evt6">
                                                    内容</label><div class="textCounterOuter">
                                                        <div class="textCounterMiddle">
                                                            <div class="textCounter" id="evt6_counter">
                                                                32000 剩余</div>
                                                        </div>
                                                    </div>
                                            </td>
                                            <td class="last data2Col" colspan="3">
                                                <textarea cols="75" id="evt6" maxlength="32000" name="evt6" onchange="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                    onclick="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                    onkeydown="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                    onkeyup="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                    onmousedown="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                    rows="6" tabindex="13" type="text" wrap="soft"><%=Description%></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_3_ep">
                                    <h3>
                                        通知<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                  <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                               <td class="labelCol   last">
                                                <label for="StartDateTime">
                                                    <span class="assistiveText">*</span>通知</label>
                                            </td>
                                            <td class="last data2Col" colspan="3">                                                 
                                               短信通知管理员<input type="checkbox" id="notifySms" name="notifySms"  />                                            
                                                 
                                            </td>
                                            </tr>
                                        </table>
                                     
                            </div>
                            <div class="pbBottomButtons">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;
                                        </td>
                                        <td class="pbButtonb" id="bottomButtonRow">  <%if(ShowButton) { %>
                                            <input value=" 保存预约 " class="btn" name="save" tabindex="14" title="保存预约" type="submit"  />
                                            
                                            <input value=" 取消 " class="btn" name="cancel" tabindex="17" title="取消" type="submit" /><% }%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script>                            if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "savenewtask", "savenewevent", "cancel"]); }</script>
                        <!-- Begin RelatedListElement -->
                        <div style="position: relative; width: 100%; display:none;">
                            <div class="bodyBold" style="position: absolute; bottom: 0px">
                                选择被邀请人
                            </div>
                            <div class="bodyBold" style="text-align: right">
                            </div>
                        </div>
                        
                        <input type="hidden" id="editEventCalendar_manyWId" name="editEventCalendar_manyWId"
                            value="" /><input type="hidden" id="editEventCalendar_manyWName" name="editEventCalendar_manyWName"
                                value="[]" /><input type="hidden" id="editEventCalendar_manyWTitle" name="editEventCalendar_manyWTitle"
                                    value="[]" /><input type="hidden" id="editEventCalendar_manyWCompany" name="editEventCalendar_manyWCompany"
                                        value="[]" /><input type="hidden" id="editEventCalendar_manyWOwner" name="editEventCalendar_manyWOwner"
                                            value="[]" />
                        <!-- ===xyzCALENDARzyx=== -->
                        <span id="editEventCalendar" class="brandSecondaryBrd" style="display:none">
                            <div class="calendarHeader">
                                
                                <input value=" 选择 " class="extra btn" id="addInviteesButton" name="new" onclick="addInvitees(event)"
                                    title="选择" type="button" /><div class="legend">
                                        <div class="busy">
                                            &nbsp;</div>
                                        <span>繁忙</span><div class="outOfOffice">
                                            &nbsp;</div>
                                        <span>不在办公室</span></div>
                                <div class="clear">
                                </div>
                                <div class="dateDiv">
                                    星期六, 2015年6月27日</div>
                            </div>
                            <div class="pbBody">
                                <div class="multiuserCalendar dayView">
                                    <table class="calendarTable" border="0" cellspacing="0" cellpadding="0">
                                        <tr class="emptyRow">
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr class="headerRow">
                                            <th class="cbCol" scope="col">
                                                操作
                                            </th>
                                            <th class="nameCol" id="nameCol" scope="col">
                                                邀请
                                            </th>
                                            <th class="typeCol" scope="col">
                                                类型
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                上午6:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                上午7:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                上午8:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                上午9:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                上午10:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                上午11:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午12:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午1:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午2:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午3:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午4:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午5:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午6:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午7:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午8:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午9:00
                                            </th>
                                            <th class="timeCol" colspan="2" scope="col">
                                                下午10:00
                                            </th>
                                            <th class="timeCol last" colspan="2" scope="col">
                                                下午11:00
                                            </th>
                                        </tr>
                                        <tr class="even">
                                            <td class="cbCol">
                                                &nbsp;
                                            </td>
                                            <th class="nameCol" scope="row">
                                                liu jack
                                            </th>
                                            <td class="typeCol">
                                                用户
                                            </td>
                                            <td class="mins first" colspan="36">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <script>                                if (window.Hover) { setTimeout(Hover.disableHovers, 7084000) }</script>
                            <input type="hidden" id="invtee0" name="invtee" value="000000000000000" /><input
                                type="hidden" id="hdnrefr" name="hdnrefr" value="0" /><input type="hidden" id="hdnaddn"
                                    name="hdnaddn" value="" /></span>
                        <!-- ===xyzCALENDARzyx=== -->
                        </form>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { new ForeignKeyInputElement("evt3", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" }); new Sfdc.Activity.ManyWhoForeignKeyInputElement("evt2", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" }); new ForeignKeyInputElement("evt1", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "005" });  handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限'); LookupAutoCompleteInputElement.registerSupportedEntities("evt1", {}); LookupAutoCompleteInputElement.registerSupportedEntities("evt2", {});  LookupAutoCompleteInputElement.registerSupportedEntities("evt3", {}); ActivityFunction.saveStartTime('StartDateTime', 'StartDateTime_time'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };  if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U%2Fe%3FretURL%3D%252Fhome%252Fhome.jsp&isAjaxRequest=1&renderMode=RETRO&nocache=1435377247865'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd055MHlOVlF3TXpvMU5Eb3dOeTQ0TnpKYSxpaXBwLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();"
                                    onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                    onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker"
                                        name="calMonthPicker" title="月"><option value="0">一月</option>
                                        <option value="1">二月</option>
                                        <option value="2">三月</option>
                                        <option value="3">四月</option>
                                        <option value="4">五月</option>
                                        <option value="5">六月</option>
                                        <option value="6">七月</option>
                                        <option value="7">八月</option>
                                        <option value="8">九月</option>
                                        <option value="9">十月</option>
                                        <option value="10">十一月</option>
                                        <option value="11">十二月</option>
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';"
                                        onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';"
                                        onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';"
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2014">
                                            2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                        </select></div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">
                                            星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">
                                        今天</a></div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div><!--
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1435384331000, "host": "", "oid": "00D90000000yvHG", "server": "", "act": "u" };</script>
    <script>        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1427810574000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script>        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1427810574000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>-->
</body>
</html>
<!-- page generation time: 306ms -->
