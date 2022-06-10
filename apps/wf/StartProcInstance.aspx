<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartProcInstance.aspx.cs"
    Inherits="WebClient.apps.wf.StartProcInstance" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程事务：提交事务 ~ .com - Professional Edition</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <!--
    <link href="/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css" rel="stylesheet"
        type="text/css" />-->
    <link href="/sCSS/31/sprites/Theme3/zh/base/Campaign.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />    
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css" rel="stylesheet"
        type="text/css" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
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
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/apps/flowdesigner/editors/js/workflow.js"></script>
    <script>        window.sfdcPage = new EditPage("70190000000WFpH");
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411677186000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-28 下午4:25", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif Custom18Tab  editPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
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
                                            <img src="/s.gif" alt="提交事务流转" class="pageTitleIcon" title="提交事务流转" /><h1 class="pageType noSecondHeader">
                                                提交事务流转：<%=ProcInstanceName%></h1>
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
                        </script>
                        <script type="text/javascript" src="/static/js/picklist.js"></script>
                        <!--
                        javascript:saveAllSelected([ document.editPage.duel_sharedto_select_0, document.editPage.duel_sharedto_select_1 ], [ document.editPage.duel_sharedto0, document.editPage.duel_sharedto1 ], ',', '\\', '--无--');
                        saveAllSelected([ document.editPage.duel_reports_select_0, document.editPage.duel_reports_select_1 ], [ document.editPage.duel_reports0, document.editPage.duel_reports1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }
                       -->
                        <script type="text/javascript">
                            jQuery(document).ready(function () {
                                initNextStepInfo();
                            });
                            function initNextStepInfo()
                            {
                                var procId = jQuery("#processId").val();
                                var procInstanceId = jQuery("#procInstanceId").val();
                                var stepId = "";
                                var ruleLogId = jQuery("#RuleLogId").val();
                                var nextActivity = jQuery("#nextActivity").val();
                                if (nextActivity != "" && nextActivity != null) {
                                    stepId = nextActivity.substr(37, 36);
                                    getStepPossibleParticipantors(procId, stepId, procInstanceId, ruleLogId,fillUsers);
                                }
                                else
                                {
                                    //最后一步
                                    document.getElementById("btnSaveTop").value = " 提交完成 ";
                                    document.getElementById("btnSaveBottom").value = " 提交完成 ";
                                }
                                var currentStepId = jQuery("#fromStepId").val();
                                getWFStepRights(procId, currentStepId, setStepRight);
                            }
                            /*
                            选择跳转或者回退执行步骤
                            */
                            function stepChange(nextActivity,mix) {
                                var procId = jQuery("#processId").val();
                                //var stepId = "";
                                //var nextActivity = jQuery("#nextActivity").val();
                                //stepId = nextActivity.substr(37, 36);
                                var elSel = document.getElementById('duel_reports_select_0');
                                removeSelectOption(elSel);
                                elSel = document.getElementById('duel_reports_select_1');
                                removeSelectOption(elSel);
                                //alert(nextActivity);
                                //debugger;
                                var ruleLogId = jQuery("#RuleLogId").val();
                                var procInstanceId = jQuery("#procInstanceId").val();
                                if (nextActivity != "" && nextActivity != null) {
                                    if (mix) {
                                        var stepId = nextActivity.substr(37, 36);
                                        getStepPossibleParticipantors(procId, stepId, procInstanceId, ruleLogId,fillUsers);
                                    }
                                    else {//var stepId = nextActivity.substr(37, 36);
                                        getStepPossibleParticipantors(procId, nextActivity, procInstanceId,ruleLogId, fillUsers);
                                    }
                                }
                            } //
                            function removeSelectOption(elSel) {
                                //var elSel = document.getElementById('selectX');
                                var i;
                                for (i = elSel.length - 1; i >= 0; i--) {
                                     elSel.remove(i);                                     
                                }
                            }
                            //移除选项是空的
                            function removeSelectEmptyOptions(elSel) {
                                //var elSel = document.getElementById('selectX');
                                var i;
                                for (i = elSel.length - 1; i >= 0; i--) {
                                   // elSel.option[i].val;
                                }
                            }
                            function clearPeoples()
                            {
                                var elSel = document.getElementById('duel_reports_select_0');
                                removeSelectOption(elSel);
                                elSel = document.getElementById('duel_reports_select_1');
                                removeSelectOption(elSel);
                            }
                            function setStepRight(data)
                            {
                                if (data != null) {
                                    //2_4_8_16退回权限_终止权限_跳转权限_撤销回到发起人
                                    //instActionNext instActionJump instActionBack instActionTerminate instActionCancel
                                    var flowRights = data.flowRight.split('_');
                                    if (flowRights[0] == "0")
                                        jQuery("#instActionBack").attr("disabled", "disabled");
                                    // document.getElementById("procPriv_2").checked = true;
                                    if (flowRights[1] == "0")
                                        jQuery("#instActionTerminate").attr("disabled", "disabled");
                                    // document.getElementById("procPriv_4").checked = true;
                                    if (flowRights[2] == "0")
                                        jQuery("#instActionJump").attr("disabled", "disabled");
                                    //document.getElementById("procPriv_8").checked = true;
                                    if (flowRights[3] == "0") //退回到发起人
                                        jQuery("#instActionBackStart").attr("disabled", "disabled");

                                    //if (flowRights[3] == "0")
                                    //    jQuery("#instActionCancel").attr("disabled", "disabled");
                                    //document.getElementById("procPriv_16").checked = true;
                                    
                                    if (flowRights[4]) {
                                        if (flowRights[4] == "0")
                                            jQuery("#instActionFinish").attr("disabled", "disabled");
                                    }
                                    else {
                                        jQuery("#instActionFinish").attr("disabled", "disabled");
                                    }
                                    if (flowRights.length >= 6) {
                                        if (flowRights[5] != "1")  //show addPeople Button                                            
                                            $("#addPeople").hide();
                                    }
                                }
                            }
                            var dule111 = document.getElementById("duel_reports_select_0");
                            function fillUsers(data) {
                                var sC = 0;
                                var aC = 0;
                                //debugger;
                                var length = data.participators.length;
                                if (data.Deadline != "0")
                                    jQuery("#cpn11").val(data.Deadline);
                                for (var c = 0; c < length; c++) {
                                    var item = data.participators[c];
                                    //duel_reports_select_0
                                    //dule111.options[c] = new Option(item.userName, item.userId);
                                    if (item.selected) {
                                        //document.getElementById("duel_reports_select_1").options[sC] = new Option(item.userName, item.userId);                                        
                                        jQuery("#duel_reports_select_1").append('<option value="' + item.userId + '"  selected=\"selected\">' + item.userName + ' ' + item.BusinessUnitIdName + '</option>');
                                        sC++;
                                    }
                                    else {
                                        //document.getElementById("duel_reports_select_0").options[aC] = new Option(item.userName, item.userId);
                                        jQuery("#duel_reports_select_0").append('<option value="' + item.userId + '"  selected=\"selected\">' + item.userName + ' ' + item.BusinessUnitIdName + '</option>');
                                        aC++;
                                    }
                                }
                            }
                            function adjustInstanceAction(a) {
                                var b = "njtbf";
                                if (a == "n")//选下一步时候，自动刷新
                                {
                                    clearPeoples();
                                    initNextStepInfo();//
                                    jQuery("#participatorContainer").show();
                                }
                                if (a == "b" || a == "f" || a == "p")//获取退回步骤的执行人
                                {                                    
                                    if (a == "b")//指定节点
                                    {
                                        jQuery("#participatorContainer").show();
                                        var procId = jQuery("#processId").val();
                                        var procInstanceId = jQuery("#procInstanceId").val();
                                        var currStepId = jQuery("#fromStepId").val();
                                        //load activity
                                        if (document.getElementById("backActivity1").options.length <= 0)
                                            getPreviousSteps(procId, procInstanceId, currStepId, renderBackSteps);
                                    }
                                    else
                                        jQuery("#participatorContainer").hide();
                                }
                                if (a == "j")//跳转重新加载办理人员
                                {
                                    clearPeoples();
                                    jQuery("#participatorContainer").show();
                                    var procId = jQuery("#processId").val();
                                    var procInstanceId = jQuery("#procInstanceId").val();

                                    if (document.getElementById("jumpActivity1").options.length <= 0)
                                        getAllSteps(procId, procInstanceId, renderJumpSteps);
                                    //document.getElementById("jumpActivity_lkid").value = "";
                                    //document.getElementById("jumpActivity").value = "";
                                   
                                }
                                //debugger;
                                for (i = 0; i < b.length; i++)
                                    b.charAt(i) == a.charAt(0) ? document.getElementById(b.charAt(i)).style.display = "" : document.getElementById(b.charAt(i)).style.display = "none";
                            }
                            function renderJumpSteps(data)
                            {
                                if (data) {
                                    //debugger;
                                    document.getElementById("jumpActivity1").options.add(new Option('--请选择--',''));
                                    for (var i = 0; i < data.length; i++) {
                                        var item = data[i];
                                        //var userId = ids[c1].substring(2);
                                        document.getElementById("jumpActivity1").options.add(new Option(item.text, item.id));

                                    }
                                }
                            }
                            function renderBackSteps(data) {
                                if (data) {
                                    //debugger;
                                    document.getElementById("backActivity1").options.add(new Option('--请选择--', ''));
                                    for (var i = 0; i < data.length; i++) {
                                        var item = data[i];
                                        //var userId = ids[c1].substring(2);
                                        document.getElementById("backActivity1").options.add(new Option(item.text, item.id));
                                    }
                                }
                            }
                            function validateForm() {
                                //if (document.getElementById("saveAction").value == "1")
                                //    return 
                                if (document.getElementById("instActionNext").checked == true) {
                                   // debugger;
                                    var nextC = document.getElementById("nextActivity");
                                    if (nextC.options.length >= 1)
                                    {
                                        //document.getElementById("duel_reports_select_1").options
                                        var peoples = document.getElementById("duel_reports_select_1");
                                        if (peoples.options.length == 0) {
                                            alert("执行人必须选择！");
                                            return false;
                                        }
                                        else {

                                        }
                                    }
                                }
                                if (document.getElementById("instActionJump").checked == true) {
                                    var jumpActId = document.getElementById("jumpActivity1").value;
                                    //document.getElementById("jumpActivity_lkid").value
                                    if (jumpActId == "") {
                                        alert("跳转节点节点必须选择！");
                                        return false;
                                    }
                                    //执行人必须选择
                                }
                                if (document.getElementById("instActionBack").checked == true) {
                                    var backActivity = document.getElementById("backActivity1").value;
                                    //document.getElementById("backActivity_lkid").value
                                    if (backActivity == "") {
                                        alert("退回节点必须选择！");
                                        return false;
                                    }
                                }
                                if (document.getElementById("isZhihui").checked) {

                                    if (document.getElementById("zhihuiMember_lkid").value == "") {
                                        alert("请选择知会人！");
                                        return false;
                                    }
                                    if (document.getElementById("zhihuiInfo").value == "") {
                                        alert("请输入知会消息！");
                                        return false;
                                    }
                                }
                                document.getElementById("saveAction").value = "1";
                                //window.sfdcPage.disableSaveButtons();
                                return true;

                            }
                            function cancelSubmit()
                            {
                                var ruleLogId = document.getElementById("RuleLogId").value;
                                window.location.href = "/a0M/e?id=" + ruleLogId + "&retURL=%2fa0M%2fo";
                            }
                            //function(a){var b=ActivityUi.ALL_SUBGROUP_DIVS;for(i=0;i<b.length;i++)b.charAt(i)==a.charAt(0)?document.getElementById(b.charAt(i)).style.display="":document.getElementById(b.charAt(i)).style.display="none"};
                        </script>
                        <script type="text/javascript">
                            function toggleZhihui() {
                                if (document.getElementById("isZhihui").checked == true)
                                // document.getElementById("zhihuiContainer").style.visibility = "visible";
                                //document.getElementById("zhihuiContainer").style = "display:block";
                                    jQuery("#zhihuiContainer").show();
                                else
                                    jQuery("#zhihuiContainer").hide();
                                //document.getElementById("zhihuiContainer").style = "display:none";
                                // document.getElementById("zhihuiContainer").style.visibility = "hidden";
                            }
                        </script>
                        <form action="StartProcInstance.aspx" id="editPage" method="post" name="editPage"
                        onsubmit="saveAllSelected([ document.editPage.duel_reports_select_0, document.editPage.duel_reports_select_1 ], [ document.editPage.duel_reports0, document.editPage.duel_reports1 ], ',', '\\', '--无--');if (!validateForm()) {return false;} if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }">
                        <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                        <input type="hidden" name="nextStepId" id="nextStepId" value="<%=ToStepId%>" />
                        <input type="hidden" name="fromStepId" id="fromStepId" value="<%=FromStepId%>" />
                        <input type="hidden" name="transitionId" id="transitionId" value="<%=RuleId%>" />
                        <input type="hidden" name="processId" id="processId" value="<%=ProcessId%>" />
                         <input type="hidden" name="procInstanceId" id="procInstanceId" value="<%=ProcessInstanceId%>" />
                         <input type="hidden" name="isFinal" id="isFinal" value="" />
                         <input type="hidden" name="isInitial" id="isInitial" value="" />
                        <input type="hidden" name="cancelURL" id="cancelURL" value="" />
                        <input type="hidden" name="save_new_url" id="save_new_url" value="" />
                        <input id="duel_reports0" type="hidden" value="" name="duel_reports0" />
                        <input id="duel_reports1" type="hidden" value="" name="duel_reports1" />
                        <input hidden="saveAction" name="saveAction" id="saveAction" value="" />
                        <div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette" id="ep">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">
                                                提交事务到下一步</h2>
                                        </td>
                                        <td class="pbButton" id="topButtonRow">
                                            <input value=" 提交到下一环节 " class="btn" title="提交到下一环节" id="btnSaveTop" name="save" style="height:25px;"  type="submit" onclick="return validateForm();" />
                                            <!--<input value=" 调整 " class="btn" title="调整下面某一环节" name="save_new" type="button" />-->
                                            <input value=" 取消提交 " class="btn" title="取消提交" name="cancel" type="button" style="height:25px;" onclick="cancelSubmit()" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div class="pbError" id="errorDiv_ep" style="display: none">
                                    错误：无效数据。<br />
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div class="pbSubheader brandTertiaryBgr first tertiaryPalette" id="head_1_ep">
                                    <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                        <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                            class="requiredText"> = 必填信息</span></span></span><h3>
                                                当前节点信息<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="labelCol requiredInput">
                                                <label for="cpn1">
                                                    <span class="requiredMark">*</span>当前步骤名称</label>
                                            </td>
                                            <td class="dataCol col02">
                                                <%=FromStepName%>
                                                <!--
                                                <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div>
                                                    <input id="cpn1" maxlength="80" name="cpn1" size="20" tabindex="1" type="text" value="" /></div>-->
                                            </td>
                                            <td class="labelCol">
                                                <label>
                                                    流程定义</label>
                                            </td>
                                            <td class="dataCol"><%=ProcessName%>
                                                <a href="/apps/flowdesigner/editors/Monitor2.aspx?t=121&schemeId=<%=ProcessId%>" target="_blank">
                                                    </a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_2_ep">
                                    <h3>
                                        办理动作<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                        <tbody>
                                            <tr class="last detailRow">
                                                <td colspan="4">
                                                    <div style="" id="recpat">
                                                        <table width="100%">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="labelCol">
                                                                        <label>
                                                                            流转操作</label>
                                                                    </td>
                                                                    <td>
                                                                        <table class="recurrenceTable" width="100%" style="margin:0px; padding:0px;">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td nowrap="nowrap" align="left" style="margin:0px; padding:0px;">
                                                                                        <div>
                                                                                                <input type="radio" value="n" onclick="adjustInstanceAction('n');" name="instAction"
                                                                                                    id="instActionNext" checked="checked" /><label for="rectypeftd">提交下一节点，请选择</label><script
                                                                                                        type="text/javascript">   document.getElementById("instActionNext").checked = true;</script></div>
                                                                                         <div style="margin: 5px; padding-left: 10px;" id="n" class="periodElementGroup">                                                                                           
                                                                                            <div>
                                                                                                下级节点
                                                                                                <select id="nextActivity" name="nextActivity" onchange="stepChange(this.value,true)" style="height:25px;">
                                                                                                    <%=PossibleActivities%>
                                                                                                </select></div>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                     <td nowrap="nowrap" align="left" style="margin:0px; padding:0px;"><%if(!IsInitial){ %><div>
                                                                                                <input type="radio" value="p" onclick="adjustInstanceAction('p');" name="instAction"
                                                                                                    id="instActionBackPre" /><label for="rectypeftm">退回上一环节</label></div><%} %></td>

                                                                                </tr>
                                                                                <tr>
                                                                                     <td nowrap="nowrap" align="left" style="margin:0px; padding:0px;"><%if(!IsInitial){ %><div>
                                                                                                <input type="radio" value="s" onclick="adjustInstanceAction('s');" name="instAction"
                                                                                                    id="instActionBackStart" /><label for="rectypeftm">退回发起人</label></div><%} %></td>

                                                                                </tr>
                                                                                <tr>
                                                                                    <td nowrap="nowrap" align="left" style="margin:0px; padding:0px;">  <div>
                                                                                                <input type="radio" value="b" onclick="adjustInstanceAction('b');" name="instAction"
                                                                                                    id="instActionBack" /><label for="rectypeftm">退回指定节点</label></div>
                                                                                          <div style="display: none;margin: 5px; padding-left: 10px;" id="b"  class="periodElementGroup">
                                                                                           <div>
                                                                                                退回节点
                                                                                                <select id="backActivity1" name="backActivity" style="height:25px;">
                                                                                                 </select><!--
                                                                                                <input id="backActivity_lkid" type="hidden" value="" name="backActivity_lkid" />

<span class="lookupInput"><input type="text" tabindex="2" size="20"  name="backActivity" maxlength="255" id="backActivity"><a title="下级节点 查找（新窗口）" tabindex="2" onclick="setLastMousePosition(event)" id="a1" href="javascript:openLookup('/apps/wf/WfStepPicker.aspx?processid=<%=ProcessId%>&currentactivity=<%=FromStepId%>&lknm=backActivity')"><img title="节点选中 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="下级节点 查找（新窗口）" src="/s.gif"></a></span>-->
                                                                                             </div>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                     <td nowrap="nowrap" align="left" style="margin:0px; padding:0px;"><div>
                                                                                                <input type="radio" value="j" onclick="adjustInstanceAction('j');" name="instAction"
                                                                                                    id="instActionJump" /><label for="rectypeftw">跳转</label></div>
                                                                                          <div style="display: none;" id="j" class="periodElementGroup">                                                                                            
                                                                                            <div>
                                                                                                跳转节点
                                                                                                <select id="jumpActivity1" name="jumpActivity" onchange="stepChange(this.value)" style="height:25px;">
                                                                                                </select><!--
                                                                                                <input id="jumpActivity_lkid" type="hidden" value="" name="jumpActivity_lkid" />
<span class="lookupInput"><input type="text" tabindex="2" size="20"  name="jumpActivity" maxlength="255" id="jumpActivity"><a title="下级节点 查找（新窗口）" tabindex="2" onclick="setLastMousePosition(event)" id="acc3_lkwgt" href="javascript:openLookup('/apps/wf/WfStepPicker.aspx?processid=<%=ProcessId%>&currentactivity=<%=ProcessId%>&lknm=jumpActivity',400)"><img title="节点选中 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="下级节点 查找（新窗口）" src="/s.gif"></a></span>-->
                                                                                             </div>
                                                                                        </div>
                                                                                    </td>

                                                                                </tr>
                                                                                <tr style="height:18px; margin:0px;">
                                                                                    <td nowrap="nowrap" align="left" style="margin:0px; padding:0px;">
                                                                                        <div>
                                                                                            <div>
                                                                                                <input type="radio" value="f" onclick="adjustInstanceAction('f');" name="instAction" 
                                                                                                    id="instActionFinish" /><label for="rectypeftm">直接结束</label></div>
                                                                                            <div style="display: none;" id="f" class="periodElementGroup">
                                                                                            <div>
                                                                                            </div>
                                                                                            <div>
                                                                                            </div>
                                                                                        </div>
                                                                                            <!--<div>
                                                                                                <input type="radio" value="t" onclick="adjustInstanceAction('m');" name="instAction" 
                                                                                                    id="instActionTerminate" /><label for="rectypeftm">终止</label></div>
                                                                                            <div style="display:none">
                                                                                                <input type="radio" value="c" onclick="adjustInstanceAction('c');" name="instAction"
                                                                                                    id="instActionCancel" /><label for="rectypeftm">撤销回起草人</label></div>
                                                                                            <div>
                                                                                                <input type="radio" value="fty" onclick="ActivityFunction.adjustRecurrenceFrequency('y');"
                                                                                                    name="instAction" id="instActionTerminate" /><label for="rectypefty">知会</label></div>-->
                                                                                        </div>
                                                                                         <div style="display: none;" id="t" class="periodElementGroup">
                                                                                            <div>
                                                                                            </div>
                                                                                            <div>终止
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>                                                                                    
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr id="participatorContainer" style="">
                                                                    <td class="labelCol">
                                                                        <label for="cpn11">
                                                                            办理人员</label>
                                                                    </td>
                                                                    <td colspan="3" class="data2Col">
                                                                        <div id="duel_reports" class="duelingListBox">
                                                                            <div style="display: none" id="editPage_duel_reports_errorMsg" class="errorMsg">
                                                                                &nbsp;</div>
                                                                            <table class="layout">
                                                                                <tbody>
                                                                                    <tr valign="top">
                                                                                        <td class="selectCell">
                                                                                            <div class="selectTitle">
                                                                                                <label for="duel_reports_select_0">
                                                                                                    <!--
                                                                                                        javascript:openLookup('/_ui/common/data/PeopleOnlyPicker.aspx?lkfm=editPage&lknm=&lktp=&showuserOnly=1' ,760,'1','&lksrch=')
                                                                                                    -->
                                                                                                    <a href="#">可选的办理人员</a></label></div>
                                                                                            <select size="14" name="duel_reports_select_0" multiple="multiple" id="duel_reports_select_0" style="height:226px; display:block;min-width:180px;"  ondblclick="selectItems()">
                                                                                            </select>
                                                                                              <script>
                                                                                                  function selectItems() {
                                                                                                      if (!document.getElementById('duel_reports_select_0').disabled && !document.getElementById('duel_reports_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_reports_select_0, document.editPage.duel_reports_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_reports_errorMsg');}
                                                                                                  }
                                                                                                  function removeItems() {
                                                                                                      if (!document.getElementById('duel_reports_select_0').disabled && !document.getElementById('duel_reports_select_1').disabled) { window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_reports_select_1, document.editPage.duel_reports_select_0, '--无--', [], [], '--无--', false, null, 'editPage_duel_reports_errorMsg'); }
                                                                                                  }
                                                                                        </script>
                                                                                        </td>
                                                                                        <td class="zen-phs buttonCell">
                                                                                            <div class="text">
                                                                                                添加</div>
                                                                                            <div class="zen-mbs text">
                                                                                                <a id="duel_reports_select_0_right" href="javascript:if (!document.getElementById('duel_reports_select_0').disabled&amp;&amp; !document.getElementById('duel_reports_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_reports_select_0, document.editPage.duel_reports_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_reports_errorMsg');}">
                                                                                                    <img title="添加" class="rightArrowIcon" alt="添加" src="/s.gif"></a></div>
                                                                                            <div class="text">
                                                                                                <a id="duel_reports_select_0_left" href="javascript:if (!document.getElementById('duel_reports_select_0').disabled&amp;&amp; !document.getElementById('duel_reports_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_reports_select_1, document.editPage.duel_reports_select_0,'--无--', [],  [] ,'--无--',false,null,'editPage_duel_reports_errorMsg');}">
                                                                                                    <img title="删除" class="leftArrowIcon" alt="删除" src="/s.gif"></a></div>
                                                                                            <div class="duelingText">
                                                                                                删除</div>
                                                                                        </td>
                                                                                        <td class="selectCell">
                                                                                            <div class="selectTitle">
                                                                                                <label for="duel_reports_select_1">
                                                                                                    已选的办理人员</label></div>
                                                                                            <select size="14" name="duel_reports_select_1" multiple="multiple" id="duel_reports_select_1" style="height:226px;min-width:180px;"  ondblclick="removeItems()">
                                                                                                <!--<option value="">--无--</option>-->
                                                                                            </select>                                                                                            
                                                                                        </td>
                                                                                        <td valign="top" class="selectCell">
                                                                                            <!--<a onclick="">清除已选人员</a>-->
                                                                                            <div id="addPeople" style="display:block">
                                                                                            <a href="javascript:openLookup('/_ui/common/data/PeopleOnlyPicker.aspx?lkfm=editPage&lknm=&lktp=&showuserOnly=0' ,760,'1','&lksrch=')"><img src="/img/cal/addNew_on.gif" alt="加办理人员" title="加办理人员" />添加办理人员</a>
                                                                                                </div>
                                                                                            <div style="height:100px"></div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <script>     window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_reports_select_0', 'duel_reports_select_1'], 'editPage_duel_reports_errorMsg');</script>
                                                                            <script type="text/javascript">
                                                                                function peopleLookupPick(a, b, c, d, e, f, g, k) {
                                                                                    if (b == "zhihuiMember_lkid") {
                                                                                        /*
                                                                                        var ids = e.split(',');
                                                                                        //var names = f.split(',');
                                                                                        var userIds = "";
                                                                                        for (var c1 = 0; c1 < ids.length; c1++) {
                                                                                            if (c1 > 0)
                                                                                                userIds += ",";
                                                                                            var userId = ids[c1].substring(2);
                                                                                            userIds += userId;                                                                                                                                                                                 
                                                                                        }
                                                                                        document.getElementById(b).value = userIds;//id
                                                                                        document.getElementById(c).value = f;//name
                                                                                        */
                                                                                        document.getElementById(b).value = e;//id
                                                                                        document.getElementById(c).value = f;//name
                                                                                    }
                                                                                    else {
                                                                                        // debugger;
                                                                                        var ids = e.split(',');
                                                                                        var names = f.split(',');
                                                                                        // var sC = document.getElementById("duel_reports_select_1").options.length;
                                                                                        for (var c1 = 0; c1 < ids.length; c1++) {
                                                                                            var userId = ids[c1].substring(2);
                                                                                            document.getElementById("duel_reports_select_1").options.add(new Option(names[c1], userId));
                                                                                            //sC++;                                                                                       
                                                                                        }
                                                                                    }//
                                                                                }
                                                                            </script>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="labelCol">
                                                                        <label for="cpn9">
                                                                            办理时限</label>
                                                                    </td>
                                                                    <td class="dataCol">
                                                                        <input id="cpn11" name="cpn11" size="10" readonly="readonly" tabindex="10" type="text" value="<%=NextDeadline%>" />天
                                                                    </td>
                                                                    <td class="labelCol">
                                                                    </td>
                                                                    <td class="dataCol">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                   
                                </div>
                               <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_5_ep">
                                    <h3>
                                        知会或传阅<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                     <table cellspacing="0" cellpadding="0" border="0" class="detailList" width="100%">
                                        <tr class="detailRow">
                                            <td>
                                                <div>
                                                    <input id="isZhihui" name="isZhihui" onclick="toggleZhihui();" type="checkbox" value="1" /><label
                                                        for="IsRecurrence">知会或传阅相关人员</label><div class="hiddenWarning" id="DisabledRecurrenceMsgDiv">
                                                            （您不能创建重复性事件，包括超过 24 小时长的搜索项）</div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="last detailRow">
                                            <td>
                                                <div style="display: none" id="zhihuiContainer" class="pbSubsection">
                                                    <table width="100%" class="detailList">
                                                        <tbody>
                                                            <tr>
                                                                <td class="labelCol">
                                                                    <label>
                                                                        知会或传阅</label>
                                                                </td>
                                                                  <td class="data2Col">
                                                                    <input type="checkbox" id="zhihuiChannel" name="zhihuiChannel1" value="1" checked />系统消息
                                                                    <input type="checkbox" id="zhihuiChannel2" name="zhihuiChannel" value="2" />手机短信
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol">                                                                    
                                                                    <label>知会或传阅人员
                                                                    </label>
                                                                </td>
                                                                <!--<td class="data2Col"><textarea wrap="soft" type="text" title="抄送到" rows="6" name="zhihuiMember" maxlength="2000" id="zhihuiMember" cols="70"></textarea>&nbsp;<a title="抄送到 查找（新窗口）" onclick="setLastMousePosition(event)" id="p24_lkwgt" href="javascript:%20openPopup%28%27%2F_ui%2Fcore%2Femail%2Fauthor%2FEmailCCBccLookup%27%2C%20%27CCBCCLookup%27%2C%20420%2C%20490%2C%20%27width%3D420%2Cheight%3D490%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cdirectories%3Dno%2Cmenubar%3Dno%2Cresizable%3Dyes%2Cscrollable%3Dno%27%2C%20true%29%3B"><img title="抄送到 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="抄送到 查找（新窗口）" src="/s.gif"></a></td>-->
                                                                 <td class="data2Col">
                                                                    <input type="hidden" id="zhihuiMember_lkid" name="zhihuiMember_lkid" />
                                                                    <input type="hidden" value="" id="zhihuiMember_lktp" name="zhihuiMember_lktp" />
                                                                    <input type="hidden" value="" id="zhihuiMember_lkold" name="zhihuiMember_lkold" />
                                                                    <input type="hidden" value="1" id="zhihuiMember_lspf" name="zhihuiMember_lspf" />
                                                                    <input type="hidden" value="0" id="zhihuiMember_lspfsub" name="zhihuiMember_lspfsub" />
                                                                    <input type="hidden" value="0" id="zhihuiMember_mod" name="zhihuiMember_mod" /><span
                                                                        class="lookupInput">
                                                                       <input type="text"  style="width:420px;" id="zhihuiMember" name="zhihuiMember" />
                                                                        <a href="javascript:openLookup('/_ui/common/data/PeopleOnlyPicker.aspx?lkfm=editPage&lknm=zhihuiMember&group=1&lktp=' + getElementByIdCS('zhihuiMember_lktp').value,680,'1','&lksrch=' + escapeUTF(getElementByIdCS('zhihuiMember').value.substring(0, 80)))"
                                                                            tabindex="3" title="查找（知会人员） （新窗口）">
                                                                            <img src="/s.gif" alt="查找（知会人员） （新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                                                                onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                                                onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                title="查找（知会人员） （新窗口）" /></a> </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol">
                                                                    <label>
                                                                        知会或传阅提醒信息</label>
                                                                </td>
                                                                <td class="data2Col">
                                                                    <textarea cols="75" id="zhihuiInfo" maxlength="32000" name="zhihuiInfo" onchange="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                                        onclick="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                                        onkeydown="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                                        onkeyup="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                                        onmousedown="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                                        rows="6" tabindex="8" type="text" wrap="soft"><%=NotifyReadMessage%></textarea>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_3_ep">
                                    <h3>
                                        提醒下一步办理人员<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table cellspacing="0" cellpadding="0" border="0" class="detailList" width="100%">
                                        <tr>
                                            <td class="labelCol">
                                                <label for="cpn4">
                                                    通知方式</label>
                                            </td>
                                            <td class="dataCol col02">
                                                <input type="checkbox" id="notifyType1" name="notifyType1" checked="checked" />系统消息
                                                <input type="checkbox" id="notifyType2" name="notifyType2"  />手机短信
                                            </td>
                                            <td class="labelCol empty">
                                                                    </td>
                                                                    <td class="dataCol empty">
                                                                    </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol last">
                                                <label for="notifyMsg">
                                                    消息内容</label>
                                            </td>
                                            <td class="dataCol col02 last">
                                                <textarea cols="75" id="notifyMsg" maxlength="32000" name="notifyMsg" onchange="handleTextAreaElementChangeWithByteCheck('notifyMsg', 500, 0, '剩余', '超出极限');"
                                                    onclick="handleTextAreaElementChangeWithByteCheck('notifyMsg', 500, 0, '剩余', '超出极限');"
                                                    onkeydown="handleTextAreaElementChangeWithByteCheck('notifyMsg', 500, 0, '剩余', '超出极限');"
                                                    onkeyup="handleTextAreaElementChangeWithByteCheck('notifyMsg', 500, 0, '剩余', '超出极限');"
                                                    onmousedown="handleTextAreaElementChangeWithByteCheck('notifyMsg', 500, 0, '剩余', '超出极限');"
                                                    rows="6" tabindex="8" type="text" wrap="soft"><%=NotifyMessage%></textarea>
                                            </td>
                                            <td class="labelCol last empty">
                                                                    </td>
                                                                    <td class="dataCol last empty">
                                                                    </td>
                                        </tr>
                                      
                                    </table>
                                </div>
                                <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_4_ep">
                                    <h3>
                                        留言<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table cellspacing="0" cellpadding="0" border="0" class="detailList" width="100%">
                                           <tr>
                                           <td class="labelCol last" >
                                                <label for="notifyMsg">
                                                    留言内容</label>
                                            </td>
                                            <td class="data2Col last">
                                                <textarea cols="75" id="memo" maxlength="32000" name="memo" onchange="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                    onclick="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                    onkeydown="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                    onkeyup="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                    onmousedown="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                                    rows="6" tabindex="9" type="text" wrap="soft"></textarea>
                                            </td> <td class="labelCol last empty">
                                                                    </td>
                                                                    <td class="dataCol last empty">
                                                                    </td>
                                        </tr>                                
                                    </table>
                                </div>
                            </div>
                            <div class="pbBottomButtons">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;
                                        </td>
                                        <td class="pbButtonb" id="bottomButtonRow">
                                            <input value=" 提交到下一环节 " class="btn" title="提交到下一环节" id="btnSaveBottom" style="height:25px;" name="save" type="submit" onclick="return validateForm();" />
                                            <!--<input value=" 保存并新建 " class="btn" name="save_new" tabindex="15" title="保存并新建" type="submit" />-->
                                            <input value=" 取消提交 " class="btn" name="cancel" tabindex="16" title="取消提交" type="button" style="height:25px;" onclick="cancelSubmit()" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script>                        //    if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "save_new", "cancel"]); }</script>
                        <input type="hidden" id="sysMod" name="sysMod" value="148aaa2fb68" />
                        </form>
                        <script>                            picklist.initAll()</script>
                        <script>
                            window.sfdcPage.appendToOnloadQueue(function () {
                                // DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Campaign&setupid=CampaignFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Campaign&retURL=%2F70190000000WFpH%2Fe%3FretURL%3D%252F70190000000WFpH&setupid=CampaignFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Campaign", "newUrl": "/01I/e?retURL=%2F70190000000WFpH%2Fe%3FretURL%3D%252F70190000000WFpH&setupid=Campaign", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F70190000000WFpH%2Fe%3FretURL%3D%252F70190000000WFpH&tableEnumOrId=Campaign&setupid=CampaignValidations", "newUrl": "/03d/e?retURL=%2F70190000000WFpH&TableEnumOrId=Campaign&Active=1&setupid=CampaignValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017Abi/e?retURL=%2F70190000000WFpH%2Fe%3FretURL%3D%252F70190000000WFpH&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑布局", "hoverText": "自定义此页面布局", "url": "/layouteditor/layoutEditor.apexp?type=Campaign&lid=00h9000000QXrw1&retURL=%2F70190000000WFpH%2Fe%3FretURL%3D%252F70190000000WFpH&setupid=CampaignLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                // new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Fsection%253DDev_Tools%2526target%253Ddev_quick_access_menu.htm%2526loc%253Dhelp%2526language%253Dzh_CN%2526release%253D190.18.15%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2F70190000000WFpH%2Fe%3FretURL%3D%252F70190000000WFpH");
                            });</script>
                        <!-- Body events -->
                        <script type="text/javascript">
                            function lookupPickActivity(a,b,c,d,val,text) {
                                //document.getElementById('jumpActivity_lkid').value = val;
                                //document.getElementById('jumpActivity').value = text;
                               
                                document.getElementById(b).value = val;
                                document.getElementById(c).value = text;
                                stepChange(val);
                                
                            }
                            function bodyOnLoad() {
                                //new ForeignKeyInputElement("Parent", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "701" });
                                handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');
                                setFocusOnLoad();
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                                if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };
                                //Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs();
                                //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                 new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                 new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                //SfdcApp.MruHovers.global_data.url = 'retURL=%2F70190000000WFpH%2Fe%3FretURL%3D%252F70190000000WFpH&isAjaxRequest=1&renderMode=RETRO&nocache=1411892719561';
                                if (document.getElementById('sidebarDiv')) {
                                    Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                };
                                //if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "03ESnnZQ=="; };
                                //getWfInstanceAndInitAndNext(renderForm);
                            }
                            function renderForm(data) {
                                // jQuery("#cpn1").val(data.initialActivity.name);
                                //{"name":"请假单2","initialActivity":{"name":"申请请假单","code":50000000008},"nextActivity":{"name":"直接主管审批","code":50000000007,"participantor":{"participantorTypeCode":0,"mSelectType":0,"mValue":"","jSelectType":0,"jPeopleType":0,"jValue":"0"}}}
                                jQuery("#cpn1").val(data.initialActivity.name);
                                jQuery("#cpn10").val(data.nextActivity.name);
                                //主要参与人
                                jQuery("#act1_lkid").val(data.nextActivity.participantor.mValue);
                                jQuery("#nextStepId").val(data.nextActivity.id);
                                jQuery("#fromStepId").val(data.initialActivity.id);
                                jQuery("#transitionId").val(data.transitionId);

                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }
                        </script>
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
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2013">
                                            2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
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
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js" type="text/javascript"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js" type="text/javascript"></script>
</body>
</html>
<!-- page generation time: 51ms -->
