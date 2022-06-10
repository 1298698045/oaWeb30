<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcStepFieldPriv.aspx.cs"
    Inherits="WebClient.apps.wf.ProcStepFieldPriv" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>设置流程步骤权限：<%=ProcessName%> ~ .com - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/rlHovers.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/Campaign.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <!-- <script src="/jslibrary/sfdc/Chatter.js"></script>-->
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
      <script src="/js/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
      <script src="/js/jqueryui/1.8.17/jquery-ui.min.js" type="text/javascript"></script>
    <script>        window.sfdcPage = new DetailPage("70190000000WJru");
        UserContext.initialize({ "networkId": "", "labelLastModified": "1415122952000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-11-8 下午10:29", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Campaign';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/rlHovers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1412230112000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif campaignTab  detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form id="sessiontimeout" method="post" name="sessiontimeout" onsubmit="if (window.ffInAlert) { return false; }">
        <input type="hidden" name="continueButton" id="continueButton" value="继续工作" /><input
            type="hidden" name="doNotTimeoutLocation" id="doNotTimeoutLocation" value="/page/timeoutrefresh.aspx" /><input
                type="hidden" name="doTimeoutLocation" id="doTimeoutLocation" value="https://login..com/?ec=301&amp;startURL=%2Fpage%2Ftimeoutrefresh.jsp&amp;stbdtimeout=1" /><input
                    type="hidden" name="logoutButton" id="logoutButton" value="退出" /><input type="hidden"
                        name="timeoutText" id="timeoutText" value="由于安全原因，您的 Salesforce 会话即将超时。<br><br>您希望作何选择？" />
    </form>
    <script>        var secondsLeftValue = 7175, secondsPopupValue = 7145, lastPageActivityTime = (new Date).getTime(), forceLogout = true; function startSessionTimer() { schedulePopup(7175, 7145) } function schedulePopup(a, b) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); forceLogout && null != redirectUniqueId && clearTimeout(redirectUniqueId); if (forceLogout) { redirectUniqueId = setTimeout(logout, 1E3 * a); } timeoutUniqueId = setTimeout(alertTimeout, 1E3 * b) } function logout() { (forceLogout && "function" == typeof getRTimeout) ? getRTimeout() : doLogout() } function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; redirectUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsLeftValue, secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function updateRedirectTimeouts(a) { "undefined" != typeof a && (secondsLeftValue = a); null != redirectUniqueId && clearTimeout(redirectUniqueId); redirectUniqueId = setTimeout(logout, 1E3 * (secondsLeftValue)); } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    <a href="#skiplink" class="navSkipLink zen-skipLink zen-assistiveText">跳到主内容</a><div
        id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="市场活动" class="pageTitleIcon" title="市场活动" /><h1 class="pageType noSecondHeader">流程：<%=ProcessName%></h1>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links">
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                        &nbsp;«&nbsp;<a href="ProcessDetail.aspx?id=<%=ProcessId%>&t=121">返回流程：<%=ProcessName%></a>
                                    </div>
                                </div>
                      
                        <script type="text/javascript">
                            var fieldRights = "";
                            function getStepRight() {
                                var procId = jQuery("#procid").val();
                                var stepId = jQuery("#stepid").val();
                                var url = "/WFPageProcessor.ashx?cmd=getsteppri";
                                jQuery.ajax({
                                    async: true,
                                    cache: false,
                                    dataType: "json",
                                    data: {
                                        processId: procId,
                                        stepId: stepId,
                                        _random: Math.random()
                                    },
                                    error: function (request, textStatus, errorThrown) {
                                        //debugger;
                                        errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                                        //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
                                    },
                                    success: function (data, textStatus) {
                                        //debugger;
                                        // alert("保存成功");
                                        //renderCallback(data);
                                        if (data != null) {
                                            var flowRights = data.flowRight.split('_');
                                            if (flowRights[0] == "1")
                                                document.getElementById("procPriv_2").checked = true;
                                            if (flowRights[1] == "1")
                                                document.getElementById("procPriv_4").checked = true;

                                            if (flowRights[2] == "1")
                                                document.getElementById("procPriv_8").checked = true;
                                            if (flowRights[3] == "1")
                                                document.getElementById("procPriv_16").checked = true;
                                            //结束
                                            if (flowRights[4] == "1")
                                                document.getElementById("procPriv_32").checked = true;
                                            //可手动加办理人	
                                            if (flowRights.length >= 6) {
                                                if (flowRights[5] == "1")
                                                    document.getElementById("procPriv_64").checked = true;
                                                else
                                                    document.getElementById("procPriv_64").checked = false;
                                            }

                                            if (flowRights.length >= 7) {
                                                //加签
                                                if (flowRights[6] == "1")
                                                    document.getElementById("procPriv_128").checked = true;
                                                else
                                                    document.getElementById("procPriv_128").checked = false;
                                            }

                                            jQuery("#docRight1").val(data.docRights1);
                                            jQuery("#docRight2").val(data.docRights2);
                                            fieldRights = data.fieldRight;
                                            for (var f in data.fieldRight) {
                                                //debugger;
                                                //alert(f);
                                                var fV = data.fieldRight[f];
                                                //pri_RequestLeave:Approve2
                                                if (fV) {
                                                    /*
                                                    var fEle = document.getElementById("pri_" + f);
                                                    for (var i = 0; i < fEle.options.length; i++) {
                                                    var option = fEle.options[i];
                                                    if (option.value == fV)
                                                    option.selected = true;
                                                    }
                                                    */
                                                    var checkControl = document.getElementById("pri_" + f + "_" + fV)
                                                    if (checkControl)
                                                        checkControl.checked = true;
                                                    //jQuery("#pri_" + f).val(fV);
                                                    //var fName = "#pri_" + f + "\"";
                                                    //var o = jQuery(fName).filter(function () {
                                                    //    return $(this).attr('value') == fV;
                                                    //});
                                                    //debugger;
                                                    //o.attr('selected', true);
                                                }
                                            }
                                            //table right
                                            for (var t in data.tableRight) {
                                                var tR = data.tableRight[t];
                                                //debugger;
                                                //tablepri_GPHSKHDJBZB1
                                                //var pri1 = "tablepri_" + t + "_" + tR;
                                                var pri1 = "tablepri_" + t;
                                                var checkControl = document.getElementById(pri1);
                                                if (checkControl && tR == 1)
                                                    checkControl.checked = true;
                                            }
                                        }
                                    },
                                    type: "POST",
                                    url: url
                                });
                            }
                        </script>
                        <script type="text/javascript">
                            function setBatchRight(r) {
                                //jQuery("input[tag='" + r + "']")
                                //debugger;
                                var tag = "hide";
                                if (r == "2")
                                    tag = "hide";
                                if (r == "4")
                                    tag = "read";
                                if (r == "8")
                                    tag = "write";
                                if (r == "16")
                                    tag = "default";
                                if (r == "32")
                                    tag = "defaultupdate";

                                jQuery("input[tag='" + tag + "']").each(function (index, value) {
                                    //var fullId = jQuery(this).attr("id");

                                    //var fieldName = fullId.substr(7);
                                    jQuery(this).attr("checked", true);//column name 
                                    //g = jQuery(this).attr("dataope");   //operator
                                    //h = jQuery(this).val();             //value


                                });
                                /*
                                for (var f in fieldRights) {
                                    var fEle = document.getElementById("pri_" + f);
                                    for (var i = 0; i < fEle.options.length; i++) {
                                        var option = fEle.options[i];
                                        if (option.value == r)
                                            option.selected = true;
                                    }
                                }*/
                            }
                            function savePri() {
                                var flowRights = ""
                                var procPriv = document.getElementById("procPriv_2").checked;
                                flowRights += (procPriv) ? "1" : "0";
                                procPriv = document.getElementById("procPriv_4").checked;
                                flowRights += "_";
                                flowRights += (procPriv) ? "1" : "0";
                                procPriv = document.getElementById("procPriv_8").checked;
                                flowRights += "_";
                                flowRights += (procPriv) ? "1" : "0";
                                procPriv = document.getElementById("procPriv_16").checked;
                                flowRights += "_";
                                flowRights += (procPriv) ? "1" : "0";

                                procPriv = document.getElementById("procPriv_32").checked;
                                flowRights += "_";
                                flowRights += (procPriv) ? "1" : "0";
                                //给下一步加办理人
                                procPriv = document.getElementById("procPriv_64").checked;
                                flowRights += "_";
                                flowRights += (procPriv) ? "1" : "0";

                                //加签
                                procPriv = document.getElementById("procPriv_128").checked;
                                flowRights += "_";
                                flowRights += (procPriv) ? "1" : "0";

                                //alert(flowRights);
                                //debugger;
                                var docRight1 = jQuery("#docRight1").val();
                                var docRight2 = jQuery("#docRight2").val();
                                //\"fieldRight\":
                                var fieldRight = "{";
                                //docRight1
                                // procPriv = document.getElementById("procPriv_16").checked;
                                //jQuery("select[id^='pri']").each(function (index, Ele) {
                                jQuery("input[id^='pri']:checked").each(function (index, Ele) {
                                    var oname = jQuery(Ele).attr("name");
                                    var fname = oname.substr(4);
                                    var v = jQuery(Ele).val();

                                    if (index > 0)
                                        fieldRight += ",";
                                    fieldRight += "\"" + fname + "\":" + v

                                });
                                fieldRight += "}";

                                //字表权限
                                var tableRight = "{";
                                //docRight1
                                // procPriv = document.getElementById("procPriv_16").checked;
                                //jQuery("select[id^='pri']").each(function (index, Ele) {
                                jQuery("input[id^='tablepri_']").each(function (index, Ele) {
                                    var oname = jQuery(Ele).attr("name");
                                    var fname = oname.substr(9);
                                    var pri = jQuery(Ele).val();
                                    if (index > 0)
                                        tableRight += ",";
                                    var isChecked = jQuery(this).attr("checked");
                                    var chcked = "0";
                                    if (isChecked)
                                        chcked = "1";
                                    //tableRight += "\"" + fname + "_" + pri + "\":\"" + chcked + "\"";
                                    tableRight += "\"" + fname + "_" + pri + "\":" + chcked;

                                });
                                tableRight += "}";
                                // alert(fieldRight);
                                //return;
                                var procId = jQuery("#procid").val();
                                var stepId = jQuery("#stepid").val();
                                //pri_ApplyEmp
                                var url = "/WFPageProcessor.ashx?cmd=savesteppri";
                                jQuery.ajax({
                                    async: true,
                                    cache: false,
                                    dataType: "json",
                                    data: {
                                        processId: procId,
                                        stepId: stepId,
                                        flowRights: flowRights,
                                        docRight1: docRight1,
                                        docRight2: docRight2,
                                        fieldRight: fieldRight,
                                        tableRight: tableRight
                                    },
                                    error: function (request, textStatus, errorThrown) { errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]); },
                                    success: function (data, textStatus) {
                                        // debugger;
                                        //alert("保存成功");
                                        //renderCallback(data);
                                        jQuery("#errorDiv_ep").html("保存成功");
                                        getStepRight();
                                    },
                                    type: "POST",
                                    url: url
                                });
                            }
                        </script>
                       
                        <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage" method="POST"
                            id="editPage">
                             <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <!--<div class="bRelatedList">
                            <div class="hotListElement">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">-->
                            <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                <div class="pbHeader">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td class="pbTitle">
                                                    <img width="12" height="1" style="margin-right: 0.25em;" title="" class="minWidth"
                                                        alt="" src="/s.gif" />&nbsp;<h3>步骤：<%=StepName%></h3>
                                                </td>
                                                <td class="pbButton">
                                                    <input type="button" title="保存设置" onclick="savePri();" name="new" class="btn" value=" 保存设置 " style="height: 25px;" />
                                                </td>
                                                <td class="pbHelp"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pbBody">
                                    <div class="pbError" id="errorDiv_ep"></div>
                                    <div id="head_1_ep" class="brandTertiaryBgr pbSubheader tertiaryPalette">
                                        <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                            <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                class="requiredText"> = 必填信息</span></span></span><h3>流程处理权限<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                            <tbody>
                                                <tr>
                                                    <td class="labelCol">退回权限
                                                    </td>
                                                    <td class="dataCol col02">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" value="2" title="退回权限" name="procPriv_2" id="procPriv_2" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="labelCol">终止权限
                                                    </td>
                                                    <td class="dataCol">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" value="4" title="终止权限" name="procPriv_4" id="procPriv_4" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelCol">跳转权限
                                                    </td>
                                                    <td class="dataCol col02">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" value="8" title="跳转权限" name="procPriv_8" id="procPriv_8" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="labelCol">退回到发起人
                                                    </td>
                                                    <td class="dataCol">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" value="16" title="退回到发起人" name="procPriv_16" id="procPriv_16" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="labelCol">结束流程
                                                    </td>
                                                    <td class="dataCol col02">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" value="32" title="结束流程" name="procPriv_32" id="procPriv_32" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="labelCol">可手动加办理人
                                                    </td>
                                                    <td class="dataCol">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" value="64" title="可手动加办理人" name="procPriv_64" id="procPriv_64" checked />
                                                                    </td>
                                                                     <td>允许审批环节，给下一环节的审批额外增加办理人员</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="labelCol"></td>
                                                    <td class="dataCol col02">
                                                        <!-- <table class="connectedAppTable">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="checkbox" value="1" title="/Chatter for Android 可见" name="tabSet_visible___0H4900000008p8Z"
                                                                                id="tabSet_visible___0H4900000008p8Z">
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>-->
                                                    </td>
                                                    <td class="last labelCol">加签
                                                    </td>
                                                    <td class="last dataCol">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" value="128" title="加签，允许审批节点办理人员，增加本节点审批人" name="procPriv_128" id="procPriv_128" />
                                                                    </td>
                                                                    <td>允许审批环节的办理人员，增加本节点审批人</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <!--
                                                    <tr>
                                                        <td class="last labelCol">
                                                            for iOS
                                                        </td>
                                                        <td class="dataCol col02 last">
                                                            <table class="connectedAppTable">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="checkbox" value="1" title=" for iOS 可见" name="tabSet_visible___0H4900000008p8b"
                                                                                id="tabSet_visible___0H4900000008p8b">
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="empty labelCol last">
                                                            &nbsp;
                                                        </td>
                                                        <td class="empty dataCol last">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="head_2_ep" class="brandTertiaryBgr pbSubheader tertiaryPalette">
                                        <h3>正文附件权限<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                            <tbody>
                                                <tr>
                                                    <td class="labelCol">正文权限
                                                    </td>
                                                    <td class="dataCol col02">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <select id="docRight1" name="docRight1">
                                                                            <option value="2">不可见</option>
                                                                            <option value="4">只读</option>
                                                                            <option value="8" selected>读/写</option>
                                                                            <option value="16">读/写/留痕迹</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="labelCol">附件权限
                                                    </td>
                                                    <td class="dataCol">
                                                        <table class="connectedAppTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <select id="docRight2" name="docRight2">
                                                                            <option value="2">不可见</option>
                                                                            <option value="4">只读</option>
                                                                            <option value="8" selected>读/写</option>
                                                                            <option value="16">读/写/删除</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="head_4_ep" class="brandTertiaryBgr pbSubheader tertiaryPalette">
                                        <h3>字段访问权限<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table cellspacing="0" cellpadding="0" border="0" class="list">
                                            <tbody>
                                                <tr class="headerRow">
                                                    <th class=" zen-deemphasize" scope="col">字段级安全性
                                                    </th>
                                                    <th class="booleanColumn zen-deemphasize" scope="col">
                                                        <!--
                                                            <input type="checkbox" value="1" title="可见" onclick="handleSelectAllNoneCheckboxClick(this, ['d00e90000001jAUXAA2','d00e90000001txhUAAQ','d00e90000001txhTAAQ','d00e90000001txhVAAQ','d00e90000001jAUgAAM','d00e90000001jAUlAAM','d00e90000001jAUeAAM','d00e90000001jAUbAAM','d00e90000001jAUhAAM','d00e90000001jAUjAAM','d00e90000001jAUiAAM','d00e90000001jAUcAAM','d00e90000001jAUZAA2','d00e90000001jAUVAA2','d00e90000001txhYAAQ','d00e90000001txhXAAQ','d00e90000001txhRAAQ','d00e90000001txhWAAQ','d00e90000001txhOAAQ','d00e90000001txhSAAQ']);handleProfileClick(this,'000000000000000');handleSelectAllNoneCheckboxClick(document.getElementById('r000000000000000'), ['r00e90000001jAUXAA2','r00e90000001txhUAAQ','r00e90000001txhTAAQ','r00e90000001txhVAAQ','r00e90000001jAUgAAM','r00e90000001jAUlAAM','r00e90000001jAUeAAM','r00e90000001jAUbAAM','r00e90000001jAUhAAM','r00e90000001jAUjAAM','r00e90000001jAUiAAM','r00e90000001jAUcAAM','r00e90000001jAUZAA2','r00e90000001jAUVAA2','r00e90000001txhYAAQ','r00e90000001txhXAAQ','r00e90000001txhRAAQ','r00e90000001txhWAAQ','r00e90000001txhOAAQ','r00e90000001txhSAAQ']);"
                                                                name="d000000000000000" id="d000000000000000">可见-->
                                                        权限<select id='setFieldRight' name='setFieldRight' onchange="setBatchRight(this.value)">
                                                            <option value=''>选择</option>
                                                            <option value='2'>不可见</option>
                                                            <option value='4'>只读</option>
                                                            <option value='8'>读写</option>
                                                            <option value='16'>显示默认值且不可修改</option>
                                                            <option value='32'>显示默认值且可修改</option>
                                                        </select>
                                                    </th>
                                                </tr>
                                                <%=CustomFields%>
                                                <!--
                                                    <tr onmouseover="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}"
                                                        onfocus="if (window.hiOn){hiOn(this);}" onblur="if (window.hiOff){hiOff(this);}"
                                                        class="dataRow even first">
                                                        <th class=" dataCell  " scope="row">
                                                            Cross Org Data Proxy User
                                                        </th>
                                                        <td class=" dataCell  booleanColumn">
                                                            <input type="checkbox" value="1" title="Cross Org Data Proxy User, 可见" onclick="handleProfileClick(this,'00e90000001jAUXAA2')"
                                                                name="d00e90000001jAUXAA2" id="d00e90000001jAUXAA2" checked="checked">
                                                        </td>
                                                        <td class=" dataCell  booleanColumn">
                                                            <input type="checkbox" value="1" title="Cross Org Data Proxy User, 只读" onclick="handleReadonlyClick(this,'00e90000001jAUXAA2')"
                                                                name="r00e90000001jAUXAA2" id="r00e90000001jAUXAA2">
                                                        </td>
                                                    </tr> -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--
                                        <div class="pShowMore">
                                            <a shouldstayinownframe="true" href="/setup/set_preference.aspx?retURL=%2F00Q%2Fo&amp;preference.value=10">
                                                显示 10 项</a></div>-->
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg">
                                    </div>
                                </div>
                            </div>
                            <!-- </div>
                            </div>
                            <div class="listElementBottomNav">
                            </div>
                        </div>-->
                        </form>
                        <!--<script src="/static/js/picklist.js"></script>-->
                        <script>                            // new InlineEditData({ "entityId": "70190000000WJru", "sysMod": "1492b552628", "fields": [{ "state": "NONE", "fieldId": "cpn15", "fieldType": "ENTITYID", "initialValue": ["liu jack", "0059000000390Wh"] }, { "state": "EDIT", "required": false, "fieldId": "cpn10", "fieldType": "CURRENCY" }, { "state": "READONLY", "required": true, "fieldId": "cpn21", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn8", "fieldType": "CURRENCY" }, { "state": "READONLY", "required": true, "fieldId": "cpn19", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "NONE", "fieldId": "Parent", "fieldType": "ENTITYID", "initialValue": ["", "000000000000000"] }, { "state": "READONLY", "required": true, "fieldId": "cpn24", "fieldType": "CURRENCY", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn6", "hasTime": false, "fieldType": "DATEONLY" }, { "state": "READONLY", "required": true, "fieldId": "cpn17", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "READONLY", "required": true, "fieldId": "cpn22", "fieldType": "INTEGER", "initialValue": "0" }, { "fieldType": "DYNAMICENUM", "picklistId": "25", "initialValue": ["Planned", "Planned"], "state": "EDIT", "fieldId": "cpn3", "required": false }, { "state": "EDIT", "required": false, "fieldId": "cpn16", "fieldType": "BOOLEAN", "initialValue": false }, { "state": "READONLY", "required": true, "fieldId": "cpn20", "fieldType": "INTEGER", "initialValue": "0" }, { "fieldType": "DYNAMICENUM", "picklistId": "24", "initialValue": ["Conference", "Conference"], "state": "EDIT", "fieldId": "cpn2", "required": false }, { "state": "EDIT", "required": false, "fieldId": "cpn11", "fieldType": "PERCENT", "initialValue": "0.00" }, { "state": "READONLY", "required": true, "fieldId": "cpn18", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "maxLength": 80, "required": true, "fieldId": "cpn1", "fieldType": "TEXT", "initialValue": "双十一" }, { "state": "EDIT", "required": false, "fieldId": "cpn9", "fieldType": "CURRENCY" }, { "state": "EDIT", "maxLength": 32000, "required": false, "fieldId": "cpn4", "fieldType": "STRINGPLUSCLOB", "initialValue": "" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "required": true, "useNewLookups": false }, { "state": "EDIT", "required": false, "fieldId": "cpn13", "fieldType": "DOUBLE", "initialValue": "0" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "required": true, "useNewLookups": false }, { "state": "READONLY", "required": true, "fieldId": "cpn23", "fieldType": "CURRENCY", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn5", "hasTime": false, "fieldType": "DATEONLY"}], "_CONFIRMATIONTOKEN": "7.C8NS9emKrYBHQuMvsa6tfKZVFxLfaEWywk_Xq0Ki_mW5uWq.bnD_P.8w3xkZZAoDYkei809llV1_3o.pC9wmmE.Pv1e9aXqzWJCHDiKnyd6deY7LTz6oPCPKsNik0ktZh.bImFuvUQlUASPzaxwS2hzBI=", "editable": true, "dynamicData": "/servlet/servlet.picklist?e=Campaign&h=iEeHeQtjS83kuX6210Yv8KziTG1YvnkgT8pX1h36QRQ%3D&v=1412752376000&layout=00h9000000RbNyc&ile=1&mo=READ&esc=HTML&l=zh_CN&pr=1.25&t=0" });</script>
                        <script>                            //   if (window.sfdcPage) sfdcPage.registerMessage('desc_stats_updates');</script>
                        <script>
                            window.sfdcPage.appendToOnloadQueue(function () {
                                //DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Campaign&setupid=CampaignFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Campaign&retURL=%2F70190000000WJru&setupid=CampaignFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Campaign", "newUrl": "/01I/e?retURL=%2F70190000000WJru&setupid=Campaign", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F70190000000WJru&tableEnumOrId=Campaign&setupid=CampaignValidations", "newUrl": "/03d/e?retURL=%2F70190000000WJru&TableEnumOrId=Campaign&Active=1&setupid=CampaignValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=Campaign&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=Campaign&et=QUICK_CREATE&retURL=%2F70190000000WJru&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3M/e?retURL=%2F70190000000WJru&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑布局", "hoverText": "自定义此页面布局", "url": "/layouteditor/layoutEditor.apexp?type=Campaign&lid=00h9000000RbNyc&retURL=%2F70190000000WJru&setupid=CampaignLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                //new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2F70190000000WJru");
                            });
                        </script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() {
                                //        SfdcApp.TopicsFeed.setupHandlers('topicContainer70190000000WJru'); 
                                setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; getStepRight(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F70190000000WJru&isAjaxRequest=1&renderMode=RETRO&nocache=1415456991337'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "s8nEW415Cw8I19wQQUw_sk8k86wNPm5BenE2jyVfHwdDRfJWmpLdhSxhKZmyIfakj5H9Ze9.oPU.uf1sd0Re0SLj3BsWsQgOttdcOwpvHetKaXYxmfec9g1t4E.x3am.AeOP2gv4JIq6qN7o.ndSeYg9PAD3XK8g_mkfJnfwQmOMneR226zki7NIGgALgOOrgFa4Yg=="; };
                            } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>   
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
</body>
</html>
<!-- page generation time: 395ms -->
