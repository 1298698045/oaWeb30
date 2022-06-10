<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanceDetail.aspx.cs"
    Inherits="WebClient.apps.wf.InstanceDetail" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程事务：<%=InstanceName %>   流程管理  ~ 高效协同</title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/rlHovers.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/chatterCore.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/chatterExtended.css" rel="stylesheet"  type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ChatterFiles.css" rel="stylesheet" type="text/css" />
    <!--<link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Campaign.css" rel="stylesheet" type="text/css" />-->
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet"   type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    <!--<link href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css" rel="stylesheet"    type="text/css" />-->
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <!--<script src="/jslibrary/sfdc/source/UserProfile.js"></script>-->
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script>        window.sfdcPage = new DetailPage("70190000000WFpH");
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411496412000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-26 下午2:13", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/rlHovers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1409951412000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/baswfinstance.related.getliste/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
     <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/apps/flowdesigner/editors/js/Workflow.js" type="text/javascript"></script>
    <script src="/js/Workflowinstance.js" type="text/javascript"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <script>        ///      ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.173', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F70190000000WFpH');</script>
<style>.overlay_panel .mw_container {
    background-color: #efefef;
    border: 1px solid #7f7f7f;
    margin: auto;
    padding: 20px;
    width: 90%;
}
.step
{
    font-size:14px;
    text-align:left;
}
    #Div1 {
    border-top: 3px solid #319431;
}
</style>

</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif Custom18Tab  detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
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
                <tr><!--
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                       
                    </td>-->
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="流程事务" class="pageTitleIcon" title="流程事务" /><h1 class="pageType noSecondHeader" style="max-width:500px;word-break:break-all" >
                                                流程事务：<%=InstanceName%></h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <!--
                                            <a href="/setup/ui/uiconfigrelatedlistsedit.aspx?retURL=%2F70190000000WFpH&amp;id=Campaign"
                                                class="configLinks">自定义页面</a> | <a href="/layouteditor/layoutEditor.aspx?type=Campaign&amp;lid=00h9000000QXrw1&amp;retURL=%2F70190000000WFpH"
                                                    class="configLinks">编辑布局</a> | 
                                            <a href="javascript:printWin(%27/70190000000WFpH/p?retURL=%2F70190000000WFpH%27)"
                                                class="configLinks" title="可打印视图 （新窗口）">可打印视图</a> | <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                    title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                        class="helpIcon" /></a>--></div>
                                    </div>
                                    <!--<div class="ptBreadcrumb">&nbsp;«&nbsp;<a href="/02T?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DHome&amp;setupid=HomePageLayouts">返回列表：自定义主页</a></div>-->
                                    <div class="ptBreadcrumb">
                                        &nbsp;&#171&nbsp;<a href="<%=RetURL%>">返回列表</a></div>
                                </div>
                        <style>
                            .efpPanelSelect.efpsTopTabs.efpViewSelect{width:100%;margin-top:10px;margin-bottom:3px;border-top:none;border-bottom:1px solid #dbdfe0;border-left:1px solid #dbdfe0;border-right:none;float:left}.efpPanelSelect.efpsTopTabs.efpViewSelect>.optionContainer>li{margin:0;padding:0;border-left:none;border-right:1px solid #e6e6e6;border-top:1px solid #e6e6e6;background:none;float:left}.efpPanelSelect.efpsTopTabs.efpViewSelect a{display:block;position:relative;margin-bottom:-1px;text-decoration:none;background:#f6f6f6;color:#4a4f56;padding:9px 20px;border-bottom:1px solid #dbdfe0}.efpPanelSelect.efpsTopTabs.efpViewSelect a:hover{background-color:#f0f0f0}.efpPanelSelect.efpsTopTabs.efpViewSelect a.selected{border-bottom:1px solid #fff;margin-bottom:-2px;background-color:#fff}
                            .efpPanelSelect.efpsTopTabs.efpViewSelect
                            {
                                border-color: -moz-use-text-color -moz-use-text-color #dbdfe0 #dbdfe0;
                                border-style: none none solid solid;
                                border-width: medium medium 1px 1px;
                                float: left;
                                margin-bottom: 3px;
                                margin-top: 10px;
                                width: 100%;
                            }
                            .efpPanelSelect.efpViewSelect ul
                            {
                                list-style: outside none none;
                                margin: 0;
                                padding: 0;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect > .optionContainer > li
                            {
                                background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
                                border-left: medium none;
                                border-right: 1px solid #e6e6e6;
                                border-top: 1px solid #e6e6e6;
                                float: left;
                                margin: 0;
                                padding: 0;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect a
                            {
                                background: none repeat scroll 0 0 #f6f6f6;
                                border-bottom: 1px solid #dbdfe0;
                                color: #4a4f56;
                                display: block;
                                margin-bottom: -1px;
                                padding: 9px 20px;
                                position: relative;
                                text-decoration: none;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect a.selected
                            {
                                background-color: #fff;
                                border-bottom: 1px solid #fff;
                                margin-bottom: -2px;
                                
                            }
                            .eflDetails.efpViewSelectPanel.eflDetailsTopTabs .helpElement
                            {
                                /*top: 58px;
    position: absolute;*/
                                right: 0;
                                text-align: right;
                                margin-bottom: 0;
                            }
                            .eflDetails .efObjectDetails
                            {
                                background-color: white;
                                float: left;
                                min-width: 757px;
                                width: 100%;
                            }
                            #ef_taolun iframe {
                                border:0;
                                width:100%;
                            }
                            #changeDiv {
                                width: 100%;
                                height: 100%;
                                position: fixed;
                                top: 0px;
                                left: 0px;
                                z-index: 999;
                                display:none;

                            }
                            #iframe {
                                position: fixed;
                                width: 100%;
                                top: 0;
                                left: 0;
                                z-index: 999;
                                height: 100%;
                            }
                            #Div1 {
                                background-color:#f8f8f8;
                            }
                            #Div1>.pbBody{
                                margin:0 5px;
                                border:1px solid #dedede;
                                background-color:white;
                            }
                            #Div1 .WordSection1{
                                border-right:1px solid #dedede;
                            }
                            .pbHeader table td{
                                height:50px;
                                line-height:50px;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect {
                                margin-bottom:0;
                            }
                            #Div1 .printerIcon {
                                background:none;
                                width:14px !important;
                                height:14px !important;
                                margin:0 5px;

                            }
                            #Div1 .uploadArrow {
                                width:14px !important;
                                height:14px !important;
                                margin:0 5px;
                            }
                            #Div1 .pbHeader td > a {
                                margin:0 10px;
                            }
                            #top2ButtonRow > input {
                                margin:0 10px;
                            }
                            .bPageBlock .pbTitle {
                                width:auto;
                            }
                            .outer td.oRight{
                                padding-bottom:0;
                            }
                             .popup-mask {
                                z-index: 100;
                                background-color: #000;
                                opacity: 0.4;
                                height: 100%;
                                width: 100%;
                                display: none;
                                position: fixed;
                                background:url(/img/bgOverlayDialogBackground.png) \9;
                                background-color:transparent \9;
                                top: 0;
                                left:0;
                            }
                            #iframe {
                                position: fixed;
                                z-index: 101;
                                background-color: white;
                                width: 60%;
                                left: 20%;
                                top: 50%;
                                margin-top: -300px;
                                border-radius: 7px;
                                display: none;
                                height:620px;
                                border:0;
                            }
                        </style>
                        <iframe src="" id="iframe" style="display:none;"></iframe>
                        <div class="popup-mask"></div>
                        <div class="efpPanelSelect efpsTopTabs efpViewSelect efpDetailsView" id="efpViews_5009000000lRqdV">
                            <ul class="optionContainer">
                                <li class="hover"><a onclick="selectOptionByName('efpViews_5009000000lRqdV', 'DetailsView')"
                                    class="optionItem efpDetailsView selected" id="efpViews_5009000000lRqdV_option1"
                                    href="javascript:void(0)"><span class="iconContainer">
                                        <img class="icon ic_pubType " src="/s.gif">
                                        <span class="iconFont"></span></span><span class="optionLabel">表单信息</span> <span
                                            class="selectArrow"></span></a></li>
                                 <%--<li class=""><a onclick="selectOptionByName('efpViews_5009000000lRqdV', 'MainBody')"
                                    class="optionItem efpDetailsView" id="efpViews_MainBody_option1"
                                    href="javascript:void(0)"><span class="iconContainer">
                                        <img class="icon ic_pubType " src="/s.gif">
                                        <span class="iconFont"></span></span><span class="optionLabel">正文信息</span> <span
                                            class="selectArrow"></span></a></li>--%>
                                <li class=""><a onclick="selectOptionByName('efpViews_5009000000lRqdV', 'WFTransitionstu')"
                                    class="optionItem efpDetailsView" id="efpViews_ReaderInfos_option6"
                                    href="javascript:void(0)"><span class="iconContainer">
                                        <img class="icon ic_pubType " src="/s.gif">
                                        <span class="iconFont"></span></span><span class="optionLabel">流程图</span> <span
                                            class="selectArrow"></span></a></li>
                                  <li class=""><a onclick="selectOptionByName('efpViews_5009000000lRqdV', 'AttachFiles')"
                                    class="optionItem efpDetailsView" id="efpViews_AttachFiles_option1"
                                    href="javascript:void(0)"><span class="iconContainer">
                                        <img class="icon ic_pubType " src="/s.gif">
                                        <span class="iconFont"></span></span><span class="optionLabel">相关事务与附件信息</span> <span
                                            class="selectArrow"></span></a></li>
                                <li class=""><a onclick="selectOptionByName('efpViews_5009000000lRqdV', 'WFTransitions')"
                                    class="optionItem efpFeedView" id="efpViews_5009000000lRqdV_option0" href="javascript:void(0)">
                                    <span class="iconContainer">
                                        <img class="icon ic_pubType " src="/s.gif">
                                        <span class="iconFont"></span></span><span class="optionLabel">流转信息</span> <span class="selectArrow">
                                        </span></a></li>
                                <li class=""><a onclick="selectOptionByName('efpViews_5009000000lRqdV', 'ReaderInfos')"
                                    class="optionItem efpDetailsView" id="efpViews_ReaderInfos_option4" href="javascript:void(0)">
                                    <span class="iconContainer">
                                        <img class="icon ic_pubType " src="/s.gif">
                                        <span class="iconFont"></span></span><span class="optionLabel">阅读记录</span> <span class="selectArrow">
                                        </span></a></li>
                                <li class=""><a onclick="selectOptionByName('efpViews_5009000000lRqdV', 'taolun')"
                                    class="optionItem efpDetailsView" id="taolun" href="javascript:void(0)">
                                    <span class="iconContainer">
                                        <img class="icon ic_pubType " src="/s.gif">
                                        <span class="iconFont"></span></span><span class="optionLabel">讨论</span><span class="selectArrow">
                                        </span></a></li>
                                <li class="dropdownOption" style="visibility: hidden;"><a onclick="Sfdc.EntityFeed.SelectPanel.showOptionsDropdown('efpViews_5009000000lRqdV')"
                                    class="dropdownOptionItem" href="javascript:void(0)" id="ext-gen3"><span class="optionLabel">
                                        更多</span> <span class="arrowIcon">
                                            <img src="/s.gif" alt="更多" title="更多"></span> <span class="selectArrow">
                                    </span></a>
                                    <ul style="visibility: hidden;" class="dropdownContainer">
                                    </ul>
                                </li>
                            </ul>
                            <div class="clearingBox">
                            </div>
                            
                        </div>
                        <div id="efpBody_5009000000lRqdV_lowerMain" class="efpViewSelectPanel eflDetailsTopTabs eflDetails"
                            style="display: none">
                            <script type="text/javascript">                                if (window.picklist) { picklist.initAll(); }</script>
                            <script type="text/javascript"></script>
                            <div class="RLPanelShadow" id="RLPanelShadow"><div class="rls_top"><div class="rls_tl"></div><div class="rls_tr"></div></div><div class="rls_l"></div><div class="rls_r"></div><div class="RLPanel" id="RLPanel" onblur="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onfocus="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onmouseout="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onmouseover="sfdcPage.getRelatedListPanel('RLPanel').showRL()"><iframe  frameborder="0" id="RLPanelFrame" name="RLPanelFrame" src="/emptyHtmlDoc.html" title="隐藏框架 - 忽略"></iframe></div><div class="rls_bottom"><div class="rls_bl"></div><div class="rls_br"></div></div></div><div class="listHoverLinks"><span  class="invisibleMinHeight">|</span></div><script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  try { sfdcPage.registerRelatedListPanel('RLPanel', false); } catch (e) { }</script>
                            <script>                                function twistSection(twisty, sectionId) {
                                    var parentDiv = twisty;
                                    while (parentDiv.tagName != 'DIV') { parentDiv = parentDiv.parentNode; }
                                    var headerId = sectionId || (parentDiv.id.split('_'))[1];
                                    var div = parentDiv.nextSibling;
                                    var elemWasOn = false;
                                    if (div.style.display != 'none') {
                                        div.style.display = 'none';
                                        twisty.className = 'showListButton';
                                        twisty.alt = twisty.title = '显示部分 - ' + twisty.name;
                                        elemWasOn = true;
                                    } else {
                                        div.style.display = 'block';
                                        twisty.className = 'hideListButton';
                                        twisty.alt = twisty.title = '隐藏部分 - ' + twisty.name;
                                    }
                                    addTwistCookie('Twister', headerId, elemWasOn);
                                    return !elemWasOn;
                                }
                                var registeredSections = new Array();
                                function registerTwistableSection(headerId, mainTableId) {
                                    var obj = new Object();
                                    obj.headerId = headerId;
                                    obj.mainTableId = mainTableId;
                                    registeredSections[registeredSections.length] = obj;
                                }
                                function twistAllSections(on) {
                                    for (var i = 0; i < registeredSections.length; i++) {
                                        var obj = registeredSections[i];
                                        var img;
                                        img = document.getElementById('img_' + obj.headerId);
                                        if (on && 'showListButton' == img.className) {
                                            twistSection(img, obj.headerId, obj.mainTableId);
                                        } else if (!on && 'hideListButton' == img.className) {
                                            twistSection(img, obj.headerId, obj.mainTableId);
                                        }
                                    }
                                }
                                function toggleSection(headerId, on) {
                                    var sectionHead = document.getElementById('head_' + headerId + '_ep');
                                    var body = sectionHead.nextSibling;
                                    var disp = on ? 'block' : 'none';
                                    sectionHead.style.display = disp;
                                    body.style.display = disp;
                                }
                                function registerTwistableSections_ep() {
                                    registerTwistableSection('01B9000000cnlCG', 'ep');
                                    registerTwistableSection('01B9000000cnlCH', 'ep');
                                }
                                registerTwistableSections_ep();
                                
                            </script>
                            <div class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette" id="ep">
                                <div class="pbHeader">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">
                                                    详细信息</h2>
                                            </td>
                                            <td class="pbButton" id="topButtonRow">
                                                <!--
                                                <input value=" 保存 " class="btn" title="保存" style="display: none;" name="inlineEditSave"
                                                    onclick="sfdcPage.save();" type="button" />
                                                <input value=" 取消 " class="btn" title="取消" style="display: none;" name="inlineEditCancel"
                                                    onclick="sfdcPage.revert();" type="button" />
                                                <input value=" 编辑表单 " class="btn" title="编辑表单" name="edit" onclick="navigateToUrl('/apps/wf/WfApproveContainer.aspx?t=122&InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>','DETAIL','edit');"
                                                    type="button" />   
                                                    
                                                 <input value=" 启动子流程 " style="height:25px;" class="btn" title="启动子流程" name="subInstance" onclick="window.location='/apps/wf/CloneInstance.aspx?parentId=<%=InstanceId%>&t=<%=Request["t"]%>';"  type="button" />-->
                                                <%if (EditMode)
                                                  { %>                                                
                                              <!--  <input value=" 查看正文 " class="btn" title="查看正文" name="editDoc" onclick="return openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=<%=InstanceId%>&EditType=0,0&mShowType=1', 'DocView', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                    type="button" />
                                                <input value=" 提交下一步 " class="btn" title="提交下一步" name="submitNext" onclick="navigateToUrl('/apps/wf/StartProcInstance.aspx?t=122&InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>','DETAIL','clone');"
                                                    type="button" />   -->                                             
                                                <%} %>      
                                               <input value=" 催办 "  style="height:25px;" class="contactInfoLaunch btn" title="催办" name="remind" type="button" onclick="reminderRelated()" />                                          
                                                <!--
                                                <input value=" 删除 " class="btn" title="删除" name="del" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.jsp?delID=70190000000WFpH&amp;retURL=%2F701%2Fo&amp;_CONFIRMATIONTOKEN=PwrYAY9eNyzmFV1c_eaNP0JXHZymJBE1Nu7SzSKc9OfGSsNLalSvl6DXbvi6GMPLCmkX_M5sCralxX5cigHTZMsjpIhb.OCDLV63EMUmf6EA7Vsyr_ehJF5DttVum2NKh_WGH90Sa5OKOad05dOfU0vklEo%3D&amp;failRetURL=%2F70190000000WFpH','DETAIL','del');"
                                                    type="button" />                                                                                   
                                                <div class="menuButton" id="managedetail">
                                                    <div class="menuButtonButton" id="managedetailButton">
                                                        <span class="menuButtonLabel" id="managedetailLabel" tabindex="0">管理成员</span></div>
                                                    <div class="menuButtonMenu" id="managedetailMenu"><a href="/ui/campaign/CampaignManageMembersAddTab?campaignId=70190000000WFpH" class="menuButtonMenuLink firstMenuItem">添加成员 – 搜索</a><a href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000WFpH&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27); " class="menuButtonMenuLink">添加成员 – 导入文件</a><a href="/ui/campaign/CampaignManageMembersExistingTab?campaignId=70190000000WFpH" class="menuButtonMenuLink">编辑成员 – 搜索</a><a href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000WFpH&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27);" class="menuButtonMenuLink">更新和添加成员 – 导入文件</a></div>
                                                </div>
                                                <script>       new MenuButton('managedetail', false);</script>-->
                                                <script type="text/javascript">
                                                    //Sfdc.onload(function () {
                                                    //debugger;
                                                    //SfdcApp.ChatterProfileSection.init('reminderInfo', '.contactInfoLaunch ', "催办", "/apps/wf/NotifyMem.aspx?InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>", 400, 600);
                                                    //});
                                                    var dialogs = {};
                                                    function reminderRelated() {
                                                        var url = '/apps/wf/NotifyMem.aspx?InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>';
                                                        showInstanceDialog(url, 'reminderInfo', "催办", 400, 600);
                                                    }
                                                    function showInstanceDialog(url, dialogName, dialogTitle, width, height) {
                                                        var c = b = null;
                                                        c = dialogName; // "notifyInstance";
                                                        //debugger;
                                                        b = url;
                                                        var dialog = null;
                                                        //var dialog = new CollaborationAccessibleDialog(c, '催办', b, 450, 530);
                                                        if (!dialogs[c]) {
                                                            dialog = new NonaccessibleDialog(c, dialogTitle, b, width, height); //CollaborationAccessibleDialog
                                                            dialogs[c] = dialog;
                                                        }
                                                        else {
                                                            dialog = dialogs[c];
                                                            dialog.url = b;
                                                        }
                                                        dialog.display();
                                                    }
                                                </script>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbBody">
                                    <div class="pbError" id="errorDiv_ep" style="display: none">
                                        错误：无效数据。<br />
                                        请查看下列所有错误消息以纠正数据。</div>
                                    <div class="pbSubsection">
                                        <%=ResultHTML%>
                                    </div>
                                     <div class="pbSubsection">
                                         
                                     </div>
                                </div>
                                <div class="pbBottomButtons">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;
                                            </td>
                                            <td class="pbButtonb" id="bottomButtonRow">
                                              
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg">
                                    </div>
                                </div>
                            </div>
                            <!--<script src="/static/js/picklist.js"></script>-->
                            <script>                                //            new InlineEditData({ "entityId": "70190000000WFpH", "sysMod": "148aaa2fb68", "fields": [{ "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jerryliu", "005900000038QVZ"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "required": true, "useNewLookups": false }, { "state": "EDIT", "maxLength": 32000, "required": false, "fieldId": "cpn4", "fieldType": "STRINGPLUSCLOB", "initialValue": "" }, { "state": "EDIT", "required": false, "fieldId": "cpn5", "hasTime": false, "fieldType": "DATEONLY" }, { "state": "READONLY", "required": true, "fieldId": "cpn23", "fieldType": "CURRENCY", "initialValue": "0" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jerryliu", "005900000038QVZ"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "required": true, "useNewLookups": false }, { "state": "EDIT", "required": false, "fieldId": "cpn13", "fieldType": "DOUBLE", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn11", "fieldType": "PERCENT", "initialValue": "0.00" }, { "fieldType": "DYNAMICENUM", "picklistId": "24", "initialValue": ["Conference", "Conference"], "state": "EDIT", "fieldId": "cpn2", "required": false }, { "state": "READONLY", "required": true, "fieldId": "cpn20", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn9", "fieldType": "CURRENCY" }, { "state": "EDIT", "maxLength": 80, "required": true, "fieldId": "cpn1", "fieldType": "TEXT", "initialValue": "国庆活动" }, { "state": "READONLY", "required": true, "fieldId": "cpn18", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "READONLY", "required": true, "fieldId": "cpn17", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn6", "hasTime": false, "fieldType": "DATEONLY" }, { "state": "READONLY", "required": true, "fieldId": "cpn24", "fieldType": "CURRENCY", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn16", "fieldType": "BOOLEAN", "initialValue": false }, { "fieldType": "DYNAMICENUM", "picklistId": "25", "initialValue": ["Planned", "Planned"], "state": "EDIT", "fieldId": "cpn3", "required": false }, { "state": "READONLY", "required": true, "fieldId": "cpn22", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "READONLY", "required": true, "fieldId": "cpn21", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn10", "fieldType": "CURRENCY" }, { "state": "NONE", "fieldId": "cpn15", "fieldType": "ENTITYID", "initialValue": ["liu jerryliu", "005900000038QVZ"] }, { "state": "NONE", "fieldId": "Parent", "fieldType": "ENTITYID", "initialValue": ["", "000000000000000"] }, { "state": "READONLY", "required": true, "fieldId": "cpn19", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn8", "fieldType": "CURRENCY"}], "_CONFIRMATIONTOKEN": "HUSF6clTmvyVZrbZpXOwveXWarbDE_cJ_V3NBjKSWkBIvE8g9QhRlzvV6spmzJEdZ1UOhntY45OO1veP1aUbg2SRsBxXo2z1ddn10_5kHkUwDolTNPF2ZJzG4ZN0ZYY8XTbV0eJZtXuuxJgMNd_jsHhTPTg=", "editable": true, "dynamicData": "/servlet/servlet.picklist?e=Campaign&h=iEeHeQtjS83kuX6210Yv8KziTG1YvnkgT8pX1h36QRQ%3D&v=1410689799000&layout=00h9000000QXrw1&ile=1&mo=READ&esc=HTML&l=zh_CN&pr=1.25&t=0" });</script>
                           
                            <br />
                            <!-- Begin RelatedListElement -->
                            <div class="bRelatedList" id="70190000000WFpH_RelatedCampaignMemberList">
                                <a name="70190000000WFpH_RelatedCampaignMemberList_target"></a>
                                <!-- Begin ListElement -->
                                <!-- motif: Campaign -->
                                <!-- WrappingClass -->
                                <div class="listRelatedObject campaignmemberBlock">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/s.gif"
                                                            alt="" class="relatedListIcon" title="" /><h3 id="70190000000WFpH_RelatedCampaignMemberList_title">
                                                                流转信息</h3>
                                                    </td>
                                                    <td class="pbButton">
                                                    </td>
                                                    <td class="pbHelp"><!--
                                                        <span class="help" title="流转信息 帮助 （新窗口）"><a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                            class="linkCol"><span class="linkSpan">流转信息帮助</span>
                                                            <img src="/s.gif" alt="流转信息 帮助 （新窗口）" class="helpIcon" title="流转信息 帮助 （新窗口）" /></a></span>-->
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="70190000000WFpH_RelatedCampaignMemberList_body">
                                            <table class="list" border="0" cellspacing="0" cellpadding="0">
                                                <tr class="headerRow">
                                                    <th scope="col" class=" zen-deemphasize">
                                                        操作
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        来源环节
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        办理环节
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        应办人
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        实办人
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        来源类型
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        提交人
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        创建时间
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        结束时间
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        期限
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        办理结果
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        留言
                                                    </th>
                                                </tr>
                                                <%=BodyText%>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav">
                                </div>
                                <script>                                    try { sfdcPage.registerRelatedList('70190000000WFpH_RelatedCampaignMemberList', '0', '流转信息', false, '/70190000000WFpH', 'relatedListId=RelatedCampaignMemberList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedCampaignMemberList'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                            <!-- End RelatedListElement -->
                            <br />
                              
                               <!-- End RelatedListElement -->
                            <div class="fewerMore">
                                <div class="backToTop">
                                    <a href="#skiplink" title="返回顶部">
                                        <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                                <!--每一相关列表总是显示 <a href="/70190000000WFpH?rowsperlist=10">
                                    <img src="/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a> 项记录-->
                            </div>
                        </div>
                        <div id="ef_WFTransitionstu" class="efpViewSelectPanel eflDetailsTopTabs eflDetails"
                            style="display: none">
                              <div class="bRelatedList" id="Div3">
                                <a name="70190000000WFpH_RelatedCampaignMemberList_target"></a>
                                <!-- Begin ListElement -->
                                <!-- motif: Campaign -->
                                <!-- WrappingClass -->
                                <div class="listRelatedObject campaignmemberBlock">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/s.gif"
                                                            alt="" class="relatedListIcon" title="" /><h3 id="H1">
                                                                流程监控</h3>
                                                    </td>
                                                    <td class="pbButton">
                                                    </td>
                                                    <td class="pbHelp">                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="Div4">
                                            <iframe width="100%" height="450" frameborder="0" src=""  id="ifrmflowMonitor"></iframe>
                                            <input type="hidden" id="isMonitorLoad" name="isMonitorLoad" value="0" />
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav">
                                </div>
                               </div>
                               <!-- End RelatedListElement -->
                            <div class="fewerMore">
                                <div class="backToTop">
                                    <a href="#skiplink" title="返回顶部">
                                        <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                                <!--每一相关列表总是显示 <a href="/70190000000WFpH?rowsperlist=10">
                                    <img src="/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a> 项记录-->
                            </div>
                        </div>
                        <div id="ef_details_5009000000lRqdV" class="efpViewSelectPanel eflDetailsTopTabs eflDetails">
                    
                            <div class="efObjectDetails">
                                <div class="efodBody">
                                    <div>
                                        <div id="Div1" class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette">
                                            <div class="pbHeader">
                                                <table cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="pbTitle">
                                                                <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                    </h2>
                                                            </td>
                                                            <td id="top2ButtonRow" class="pbButton">
                                                               <%if (EditMode)
                                                                 { %> 
                                                                <input type="button" onclick="saveFormData(0);"  style="height:25px;"   name="edit" title="保存表单据" class="btn" value=" 保存表单 " />  
                                                                 <%if (!IsFirstActivity)
                                                                 {%>
                                                                    <input type="button"  style="height:25px;"  onclick="submitNextStep(0)" id="btnReject" name="btnReject" title="审批拒绝" class="btn" value="审批拒绝" />                                      
                                                                <%} %>                                                             
                                                                <input type="button"  style="height:25px;"  onclick="submitNextStep(1)"  name="tran" title="审批通过，提交下一步流转" class="btn" value=" 提交流转 " />        
                                                               <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                                                <%if (HasFlowFinish)
                                                                  { %>
                                                                <!--<div class="menuButton" id="tonextdetail">
                                                                 <div class="menuButtonButton" id="tonextdetailButton"><span class="menuButtonLabel" id="tonextdetailLabel" tabindex="0">其它操作</span></div>
                                                                    <div class="menuButtonMenu" id="backlastdetailMenu"><a href="#" onclick="javascript:return wfBackPreActivity();" class="menuButtonMenuLink firstMenuItem">退回上一环节</a></div>
                                                                    <div class="menuButtonMenu" id="tonextdetailMenu"><a href="#" onclick="javascript:return finishInstance();" class="menuButtonMenuLink lastMenuItem">结束事务</a></div>
                                                                </div>
                                                                <script>    new MenuButton('tonextdetail', false);</script>
                                                                -->
                                                                <input type="button"  style="height:25px;"  onclick="javascript:return finishInstance();"  name="finishTran" title="如果不用提交下一步，直接结束事务" class="btn" value=" 结束流程 " />                                                                  
                                                                <%}%>
                                                                
                                                                 <%if (!IsFirstActivity)
                                                                   {%>
                                                                <!--<input type="button"  style="height:25px;"  onclick="wfBackPreActivity()" id="backPreActivity" name="backPreActivity" title="不同意,退回上一环节" class="btn" value="不同意，退回上一环节" /> -->                
                                                                <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                                                <input type="button"  style="height:25px;"  onclick="javascript:forwardProcess(document.getElementById('instanceId').value)" id="btnforward" name="btnforward" title="传阅其他人" class="btn" value="传阅其他人" /> 
                                                                <%}
                                                                 } %>
                                                                <!--<input type="button"  style="height:25px;" onclick="return openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=<%=InstanceId%>&EditType=1,1', 'DocEdit', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                                name="clone" title="编辑正文" class="btn" value=" 编辑正文 " /> 
                                                                <input type="button"  style="height:25px;" onclick="return openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=<%=InstanceId%>&EditType=0,0', 'DocEdit', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                                name="clone" title="查看正文" class="btn" value=" 查看正文 " /> 
                                                                <input value=" 流程监控 "  style="height:25px;" class="btn" title="流程监控" name="monitor" onclick="return openPopupFocusEscapePounds('/apps/flowdesigner/editors/monitor.aspx?schemeId=<%=ProcessId%>&InstanceId=<%=InstanceId%>', 'monitor', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"   type="button" />-->
                                                            </td>
                                                            <td>
                                                                <%--<a title="正文 （新窗口）" style="text-decoration:none; vertical-align:middle;"
                                                                name="uploadView" target="_blank" href="/apps/files/DocEditor.aspx?Id=<%=InstanceId%>&fullscreen=0&EditType=<%=MainDocEditMode%>&filesource=2&OrganizationId=<%=OrganizationId%>"><img title="正文内容 （新窗口）" alt="正文内容 （新窗口）" class="uploadArrow" src="/img/images/zhengwen.png" align="absmiddle"/><span class="helpLink">正文</span></a>--%>
                                                                <a title="正文 （新窗口）" style="text-decoration:none; vertical-align:middle;"
                                                                name="uploadView" target="_blank" href="<%=viewLink %>"><img title="正文内容 （新窗口）" alt="正文内容 （新窗口）" class="uploadArrow" src="/img/images/zhengwen.png" align="absmiddle"/><span class="helpLink">正文</span></a>
                                                            <a title="可打印视图 （新窗口）" style="text-decoration:none; vertical-align:middle;"
                                                                name="printView" href="javascript:printWin('/apps/wf/WFFormPrint.aspx?InstanceId=<%=InstanceId%>')"><img title="正文 （新窗口）" class="printerIcon" alt="正文 （新窗口）" src="/img/images/print.png"  align="absmiddle"><span class="helpLink">打印</span></a>
                                                                <!--
                                                             <a title="可打印视图 （新窗口）" style="text-decoration:none; vertical-align:middle;"
                                                                name="printView" href="javascript:printWin('/apps/wf/WFFormPrint.aspx?InstanceId=<%=InstanceId%>&fileType=doc')">
                                                                 <img title="正文 （新窗口）" class="printerIcon" alt="正文 （新窗口）" src="/img/images/word.png"  align="absmiddle">
                                                                 <span class="helpLink">导出doc</span>
                                                             </a>-->

                                                           <%--  <a title="" style="text-decoration:none; vertical-align:middle;"
                                                                name="printView" href="javascript:printWin('<%=WfFormExportPdfUrl%>')">
                                                                 <img title="正文 （新窗口）" class="printerIcon" alt="正文 （新窗口）" src="/img/images/pdf.png"  align="absmiddle">
                                                                 <span class="helpLink">导出pdf</span>
                                                             </a>--%>
                                    
                                                            </td>
                                                            <td style="text-align:right;">
                                                                <div class="helpElement">
                                                                <span class="helpLinkElement"><!--<a title="编辑布局" target="_top" name="editLayout" href="/layouteditor/docLayoutEditor.aspx?setupid=CustomObjects&id=<%=FormLayoutId%>&amp;retURL=%2F5009000000lRqdV">
                                                                    <img title="编辑布局" class="editLayoutIcon" alt="编辑布局" src="/s.gif"></a>
                                                                    <a  title="此页面的帮助 （新窗口）" name="help" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"><img
                                                                                    title="此页面的帮助 （新窗口）" class="helpIcon" alt="此页面的帮助 （新窗口）" src="/s.gif"></a>-->    
                                    
                                                                    <%if (this.EditMode)
                                                                      {%>                                
                                                                    <a id="btnUploadfile" title="上传附件 （新窗口）" style="text-decoration:none; vertical-align:middle;"
                                                                        name="uploadView" href="#"><img width="20" height="20" title="上传附件 （新窗口）" alt="上传附件 （新窗口）" class="uploadArrow" src="/img/images/addfile.png" align="absmiddle"/>上传附件</a>
                                                                    <a title="关联流程 （新窗口）" style="text-decoration:none; vertical-align:middle;"
                                                                        name="uploadView" href="#" id="relateInstance"><img width="20" height="20" title="关联流程 （新窗口）" alt="关联流程 （新窗口）" class="uploadArrow" src="/img/images/guanlian.png" align="absmiddle"/>关联流程</a>
                                                                    <%} %>
                                                                    </span></div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <script class="extra" type="text/javascript">  
                                                    var dialog = OverlayDialogElement.getDialog('nextstep_picker_');
                                                    dialog.isModal = true;
                                                    dialog.width=450;// 762;
                                                    dialog.hasButtonsBar = true;
                                                    dialog.displayX = true;
                                                    dialog.allowKeyboardEsc = true;
                                                    dialog.extraClass = '';
                                                    dialog.isAbsolutePositioned = false;
                                                    dialog.refreshOnClose = false;
                                                    dialog.isMovable = true;
                                                    dialog.buttonContents = '\u003Cinput value=\" 提交 \" style=\"height:25px;\" class=\"btn\" id=\"nextstep_picker_save_btn\" name=\"saveBtn\" onclick=\"doSubmitNextDone();\" title=\"完成 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"nextstep_picker_cancel_btn\" name=\"cancelBtn\" onclick=\"dialog.cancel();\" title=\"取消 (Esc)\" type=\"button\" style=\"height:25px;\" /\u003E';
                                                    dialog.setTitle('选择并行分支步骤、执行人，提交下一步');

                                                    var doNextStep = function (event) { 
                                                        var selectedStepsPopHTML="";
                                                     
                                                        var url1="/WFPageProcessor.ashx?cmd=wfinstance.parallel.pophtml&action=1";
                                                        url1+="&instanceId="+document.getElementById("instanceId").value;
                                                        url1+="&ruleLogId="+document.getElementById("ruleLogId").value;
                                                        url1+="&currentStepId="+document.getElementById("stepId").value;
                                                        url1+="&processId="+document.getElementById("_processId").value;                                                        
                                                        jQuery.ajax({
                                                            url: url1,
                                                            cache: false,
                                                            async: false,
                                                            dataType: "html",
                                                            type: "POST",                                                           
                                                            success: function (data) {
                                                                selectedStepsPopHTML = data;
                                                            },
                                                            error: function (request, textStatus, errorThrown) {
                                                              
                                                            }
                                                        });
                                                        //alert(selectedStepsPopHTML);
                                                        //debugger;
                                                        dialog.contents = selectedStepsPopHTML;
                                                        dialog.createContent();
                                                        dialog.show();
                                                        //setLastMousePosition(event);
                                                        /* ActivityFunction.openInviteePicker(); Sfdc.Activity.PeoplePicker.invitee.onSearch();*/ 
                                                    };

                                                </script>
                                               

                                            </div>
                                            <div class="pbBody">
                                                 <input type="hidden" name="_processId" id="_processId" value="<%=ProcessId%>" />
                                                <input type="hidden" name="splitType" id="splitType" value="<%=StepSplitType%>" />
                                                <input type="hidden" name="ruleLogId" id="ruleLogId" value="<%=RuleLogId%>" />
                                                <input type="hidden" name="instanceId" id="instanceId" value="<%=InstanceId%>" />
                                                <input type="hidden" name="fromActivityId" id="fromActivityId" value="<%=FromActivityId%>" />
                                                <input type="hidden" name="stepId" id="stepId" value="<%=StepId%>" />
                                                <input type="hidden" name="InstanceStatusCode" id="InstanceStatusCode" value="<%=InstanceState%>" />
                                                 <input type="hidden" name="EntityObjectType" id="EntityObjectType" value="<%=EntityObjectType%>" />
                                                <input type="hidden" name="dealAction" id="dealAction" value="1" />
                                                <div style="display: none" id="Div2" class="pbError">
                                                    错误：无效数据。<br/>
                                                    请查看下列所有错误消息以纠正数据。</div>
                                                <div class="efdFields">
                                                    <div class="pbSubsection" style="margin-left:0px;">
                                                        <!---->                                                       
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="width:80%">
                                                                      <iframe width="100%" height="480" frameborder="0"  id="iWFForm" src="/apps/wf/WfFormEdit.aspx?InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>&isPreview=<%=IsFormView%>"></iframe>
                                                                </td>
                                                                <td style="width:20%;border-left:1px solid #dedede;">
                                                                    <script type="text/javascript">
                                                                        function refreshRelatedInstances()
                                                                        {
                                                                            var instId = document.getElementById("instanceId").value;
                                                                            getRelatedWFinstances(instId,renderRelatedInstances);
                                                                        }
                                                                        function confirmDeleteRelatedInstance(relatedInstanceid)
                                                                        {
                                                                            var state = document.getElementById("InstanceStatusCode").value;
                                                                            if(state!="0")
                                                                            {
                                                                                //alert("");
                                                                                return ;
                                                                            }
                                                                            var prpcInstanceId = document.getElementById("instanceId").value;
                                                                            //你确定要删除
                                                                            var a="你确定要删除关联事务吗？";
                                                                            if(Modal.confirm(a))
                                                                            {
                                                                                var d = {
                                                                                    processInstanceId:prpcInstanceId,
                                                                                    relatedInstanceId:relatedInstanceid,
                                                                                    id:relatedInstanceid
                                                                                };
                                                                                //ajaxMethodPostData("wfinstance.related.delete",d,getRelatedWFinstances);
                                                                                var url="/WFPageProcessor.ashx?cmd=wfinstance.related.delete";
                                                                                jQuery.ajax({
                                                                                    async: false, cache: false, dataType: "json",
                                                                                    data: d,
                                                                                    error: function (request, textStatus, errorThrown) {
                                                                                        // errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                                                                                    },
                                                                                    success: function (data, textStatus) {
                                                                                        //debugger;
                                                                                       // if (callback)
                                                                                        //     getRelatedWFinstances(data);
                                                                                        var instId = document.getElementById("instanceId").value;
                                                                                        getRelatedWFinstances(instId,renderRelatedInstances);
                                                                                    },
                                                                                    type: "GET",
                                                                                    url: url
                                                                                });
                                                                            }
                                                                        }
                                                                        function renderRelatedInstances(data)
                                                                        {
                                                                            if(!data) return;
                                                                            if(!data.listData) return;
                                                                            var state = document.getElementById("InstanceStatusCode").value;
                                                                            
                                                                            var html="<ul style='font-size:16px;'>";
                                                                            for(var i=0;i<data.listData.length;i++)
                                                                            {
                                                                                var row = data.listData[i];
                                                                                var actionDel ="";
                                                                                if(state=="0")
                                                                                {                                                                                
                                                                                    actionDel= "<a class=\"actionLink\"  onclick=\"return confirmDeleteRelatedInstance('"+row.ProcessInstanceId+"');\" href=\"#\" title=\""+row.Name+"\"><img border='0'  src=\"/img/dismiss.gif\"></a></li>";
                                                                                }
                                                                                html+="<li><a href=\"/a0M/detail?source=i&id="+row.ProcessInstanceId+"\" target=\"_blank\">"+row.Name+"</a> &nbsp;&nbsp;"+actionDel+"</li>";
                                                                            }
                                                                            html+="</ul>";
                                                                            $("#relatedInstances").html(html);
                                                                        }
                                                                    </script>
                                                                    <div id="relatedInstances">

                                                                    </div>
                                                                    <iframe width="100%" height="450" frameborder="0"   id="ifrmAttaches" src="/apps/wf/InstanceAttachList.aspx?InstanceId=<%=InstanceId%>&InstanceState=<%=InstanceState%>&ProcessId=<%=ProcessId%>&StepId=<%=StepId%>&right=<%=AttachRight%>&editType=<%=AttachEditType%>"></iframe>
                                                                    
                                                                </td>
                                                            </tr>
                                                        </table>
                                                      
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pbBottomButtons">
                                                <table cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td id="bottom2ButtonRow" class="pbButtonb" width="80%;"style="text-align:center;">
                                                                <%if (EditMode)
                                                                 { %> 
                                                                <input type="button" onclick="saveFormData(0);"  style="height:25px;"   name="edit" title="保存表单" class="btn" value=" 保存表单 " /> &nbsp;&nbsp;  
                                                                <%if (!IsFirstActivity)
                                                                 {%>
                                                                    <input type="button"  style="height:25px;"  onclick="submitNextStep(0)" id="btnRejectBottom" name="btnReject" title="审批拒绝" class="btn" value="审批拒绝" />                                      
                                                                <%} %> &nbsp;&nbsp;                                                             
                                                                <input type="button"  style="height:25px;"  onclick="submitNextStep(1);"  name="tran" title="提交流转" class="btn" value=" 提交流转 " />                                                                                                                             
                                                                  &nbsp;&nbsp;&nbsp;&nbsp;
                                                                   <%if (HasFlowFinish)
                                                                  { %>                                                               
                                                                <input type="button"  style="height:25px;"  onclick="javascript:return finishInstance();"  name="finishTran" title="如果不用提交下一步，直接结束事务" class="btn" value=" 结束流程 " />                                                                  
                                                                <%}%>

                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                 <%if (!IsFirstActivity)
                                                                   {%>
                                                                <!--<input type="button"  style="height:25px;"  onclick="wfBackPreActivity()" id="backPreActivity" name="backPreActivity" title="不同意,退回上一环节" class="btn" value="不同意，退回上一环节" /> -->                                                     
                                                                <input type="button"  style="height:25px;"  onclick="javascript:forwardProcess(document.getElementById('instanceId').value)" id="btnforwardBottom" name="btnforward" title="传阅其他人" class="btn" value="传阅其他人" /> 
                                                                <%}
                                                                  }
                                                                  %>
                                                                <!--
                                                                    if ((Modal.confirm &amp;&amp; Modal.confirm('是否确定流转吗？')) || (!Modal.confirm &amp;&amp; window.confirm('是否确定流转吗？'))) { }
                                                                    -->
                                                                <!--<input type="button"  style="height:25px;"   onclick="return openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=<%=InstanceId%>&EditType=1,1', 'DocEdit', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                                name="clone" title="编辑正文" class="btn" value=" 编辑正文 " />  
                                                                  <input type="button"  style="height:25px;"  onclick="return openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=<%=InstanceId%>&EditType=0,0', 'DocEdit', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                                name="clone" title="查看正文" class="btn" value=" 查看正文 " />                                                               
                                                                <input value=" 流程监控 "  style="height:25px;" class="btn" title="流程监控" name="monitor" onclick="return openPopupFocusEscapePounds('/apps/flowdesigner/editors/monitor.aspx?schemeId=<%=ProcessId%>&InstanceId=<%=InstanceId%>', 'monitor', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"   type="button" />-->
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="pbFooter secondaryPalette">
                                                <div class="bg">
                                                </div>
                                            </div>
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="ef_mainBody" class="efpViewSelectPanel eflDetailsTopTabs eflDetails"
                            style="display: none">
                            <input type="hidden" id="mainBodyLoad" name="mainBodyLoad" value="0" />
                            <input type="hidden" id="mainBodyUrl" name="mainBodyUrl" value="/apps/files/DocEditor.aspx?Id=<%=InstanceId%>&fullscreen=0&EditType=<%=MainDocEditMode%>&filesource=2&OrganizationId=<%=OrganizationId%>" />
                            <iframe width="100%" height="1000" frameborder="0" src=""  id="iFrameMainBody"></iframe>
                        </div>
                        <div id="ef_attach" class="efpViewSelectPanel eflDetailsTopTabs eflDetails"
                            style="display: none; margin-top:5px;">
                            <div class="bRelatedList first" id="RelatedInstanceList" style="display:block">
                                <a name="RelatedNoteList_target"></a>
                                <!-- Begin ListElement -->
                                <!-- motif: Setup -->
                                <!-- WrappingClass -->
                                <div class="listRelatedObject campaignBlock" >
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="margin-top:20px;">
                                        <div class="pbHeader">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img width="12" height="1" src="/s.gif" alt="" class="minWidth" title="" style="margin-right: 0.25em; margin-right: 0.25em;"><img src="/s.gif" alt="" class="relatedListIcon" title=""><h3>
                                                                        关联事务</h3>
                                                        </td>
                                                        <td class="pbButton">
                                                            <input type="button" value=" 关联事务 " style="height:25px;" class="btn" name="attachFile" onclick="setLastMousePosition(event);openPopup('/apps/wf/addRelatedInsts.aspx?instanceid=<%=InstanceId%>&amp;retURL=%2fapps%2fwf%2fInstanceDetail.aspx%3ft%3d122%26id%3d73a87b11-5325-4e18-8f32-49eb5210f283&amp;pid=<%=InstanceId%>&amp;type=30022', 'doc', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);" title="附加文件">
                                                        </td>
                                                        <td class="pbHelp">
                                                           
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="RelatedNoteList_body">
                                            <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                <tbody>
                                                    <!--<tr class="headerRow">
                                                    <th class="noRowsHeader" scope="col">没有可显示的记录</th></tr>-->
                                                 <tr class="headerRow">
                                                    <th scope="col" class=" zen-deemphasize">
                                                        操作
                                                    </th>
                                                    <th scope="col" class=" zen-deemphasize">
                                                        关联事务
                                                    </th>   
                                                     <th scope="col" class=" zen-deemphasize">
                                                        关联时间
                                                    </th>                                                    
                                                 </tr>
                                                    <%=RelatedInstanceHTML%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav">
                                </div>
                                <script>        try { sfdcPage.registerRelatedList('RelatedInstanceList', '', '相关事务', false, 'null', 'null', false, false, true, null); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                            <!-- Begin RelatedListElement -->
                            <%=RelatedNoteListData%>
                            <!-- End RelatedListElement -->
                        </div>
                         <div id="ef_ReaderInfos" class="efpViewSelectPanel eflDetailsTopTabs eflDetails"
                            style="display: none">
                              <a name="RelatedReaderList_target"></a>
                                <!-- Begin ListElement -->
                                <!-- motif: Setup -->
                                <!-- WrappingClass -->
                                <div class="listRelatedObject campaignBlock" >
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="margin-top:70px;">
                                        <div class="pbHeader">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img width="12" height="1" src="/s.gif" alt="" class="minWidth" title="" style="margin-right: 0.25em; margin-right: 0.25em;"><img src="/s.gif" alt="" class="relatedListIcon" title=""><h3>
                                                                        传阅记录</h3>
                                                        </td>
                                                        <td class="pbButton">
                                                           
                                                        </td>
                                                        <td class="pbHelp">
                                                           
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="RelatedReaderList_body">
                                            <%=ForwardReaderListHTML%>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                               
                              <div id="RelatedReaderLogList" class="bRelatedList last">
                                <a name="RelatedReaderLogList_target"></a>
                                <!-- Begin ListElement -->                               
                                <!-- motif: Event -->
                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img width="12" height="1" title="" style="margin-right: 0.25em;" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3 id="RelatedMemberList_title">浏览记录</h3>
                                                        </td>
                                                        <td class="pbButton">
                                                           
                                                        </td>
                                                        <td class="pbHelp">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="RelatedReaderLogList_body" class="pbBody">
                                           <table class="list" cellpadding="0" cellspacing="0">
                                               <thead>
                                                   <tr class="headerRow">
                                                       <th class=" zen-deemphasize">序号</th>
                                                       <th class=" zen-deemphasize">阅读人</th>
                                                       <th class=" zen-deemphasize">阅读时间</th>
                                                       <th class=" zen-deemphasize">IP地址</th>
                                                       <th class=" zen-deemphasize">浏览器名称与版本</th>
                                                   </tr>
                                                   <%=ReadLogListHTML%>
                                               </thead>
                                           </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav"></div>
                                <script> //try { sfdcPage.registerRelatedList('RelatedActivityAttachmentList', '0', '管理与查看人员', false, '/00U/e?retURL=%2Fhome%2Fhome.jsp', 'retURL=%2Fhome%2Fhome.jsp&amp;relatedListId=RelatedActivityAttachmentList&amp;hideDL=1&amp;noh=1&amp;keepPref=1', false, false, true, 'RelatedActivityAttachmentList'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                                <!-- End ListElement -->
                        </div>
                        <div id="ef_taolun" style="display:none;">
                            <iframe  src="/chatter/relatedchatter.html" frameborder="0"></iframe>
                        </div>
                        <script type="text/javascript">
                                    var isSaved=false;
                                    //openPopup(
                                    function submitNextStep(action)
                                    {
                                        if(action==0) //审批拒绝
                                        {
                                            document.getElementById("dealAction").value="0";
                                        }
                                        if(action==1) //审批通过
                                        {
                                            document.getElementById("dealAction").value="1";
                                        }
                                        saveFormData(action);
                                    }
                                    function notifySavedToNext()
                                    {
                                         //debugger;
                                        var splitType1 = jQuery("#splitType").val();
                                        if(splitType1=="2")//如果是并行分发
                                        {
                                            doNextStep();
                                        }
                                        else
                                        {
                                            var dealAction = jQuery("#dealAction").val();
                                            if(dealAction=="0")
                                            {
                                                rejectProcess();
                                            }
                                            else 
                                            {
                                                approvePass();
                                             //navigateToUrl('/apps/wf/StartProcInstance.aspx?t=<%=Request["t"]%>&InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>&retURL=','DETAIL','tran');
                                            }
                                        }
                                    }
                                    function saveFormData(action) {
                                        //d.frames['iWFForm'] ie,safari
                                        //
                                        var d = document;
                                        var f = d.frames ? d.frames['iWFForm'] : d.getElementById('iWFForm');
                                        var p = f.document || f.contentWindow;                               
                                        //debugger;  
                                        //var _frame = document.getElementById("iWFForm");
                                        //var contentWin = _frame.contentWindow || _frame.contentDocument;
                                        //if (contentWin.SaveFormData)
                                        //{
                                        //alert('ok');
                                        //}

                                        if (p.SaveFormData) {
                                            //alert("firefox");
                                            if (p.validateForm(action))
                                            {
                                                p.SaveFormData(action);
                                                isSaved=true;
                                            }
                                        }
                                        else
                                        {                                            
                                            if (window.frames['iWFForm'].validateForm)
                                            {
                                                if (window.frames['iWFForm'].validateForm(action))
                                                {
                                                    window.frames['iWFForm'].SaveFormData(action);
                                                    isSaved=true;
                                                }
                                            }   
                                  
                                        }
                                        return isSaved;
                                    }
                                    function _submitNextStep()
                                    {
                                                   
                                    }
                                    function rejectProcess()
                                    {
                                        //saveFormData(0);
                                        var processInstanceId= document.getElementById("instanceId").value;
                                        var proceId= document.getElementById("_processId").value;
                                        var ruleLogId= document.getElementById("ruleLogId").value;
                                        var stepId= document.getElementById("stepId").value;
                                        var url1 = "/apps/wf/ApproveReject.aspx?instanceId=" + processInstanceId+"&RuleLogId="+ruleLogId+"&ProcessId="+proceId+"&stepId="+stepId;
                                        showDialog(url1, "ApproveReject", "审批拒绝", 850, 500);
                                    }
                                    function approvePass()
                                    {
                                        //saveFormData(0);
                                        var processInstanceId= document.getElementById("instanceId").value;
                                        var proceId= document.getElementById("_processId").value;
                                        var ruleLogId= document.getElementById("ruleLogId").value;
                                        var stepId= document.getElementById("stepId").value;
                                        var url1 = "/apps/wf/ApprovePass.aspx?instanceId=" + processInstanceId+"&RuleLogId="+ruleLogId+"&ProcessId="+proceId+"&stepId="+stepId;
                                        showDialog(url1, "ApprovePass", "审批通过流转", 870, 550);
                                    }
                                    function finishInstance()
                                    {
                                        var a = '确定要结束当前事务吗？';
                                        if( Modal.confirm(a))
                                        {
                                            var intId = jQuery("#instanceId").val();
                                            var step = jQuery("#stepId").val();
                                            var log = jQuery("#ruleLogId").val();
                                            finishWF(intId,step,log,function(data) {
                                                //alert('ok');
                                                //window.location='/a0M/detail?source=l&id='+log;
                                                window.location='/a0M/o';
                                            });
                                        }
                                        return false;
                                    }
                                        function right(mainStr,lngLen) { 
                                            // alert(mainStr.length) 
                                            if (mainStr.length-lngLen>=0 && mainStr.length>=0 && mainStr.length-lngLen<=mainStr.length) { 
                                                return mainStr.substring(mainStr.length-lngLen,mainStr.length)} 
                                            else{return null} 
                                        } 
                                        function mid(mainStr,starnum,endnum){ 
                                            if (mainStr.length>=0){ 
                                                return mainStr.substr(starnum,endnum) 
                                            }else{return null} 
                                            //mainStr.length 
                                        }
                                        function refreshAttachFrame()
                                        {
                                            //document.frames("ifrmAttaches").document.location.reload(true);
                                            //document.getElementById('ifrmAttaches').contentWindow.location.reload(true);
                                            jQuery('#ifrmAttaches').attr('src', jQuery('#ifrmAttaches').attr('src'));
                                        }
                                        function wfBackPreActivity()
                                        {
                                            var a = '您确定要退回上一环节吗？';
                                            var confirm1 = Modal.confirm(a);
                                            if(!confirm1) return false;
                                                        
                                            var curStep = "";
                                            var preStep = "";
                                            var instId = document.getElementById("instanceId").value;
                                            var ruleLogId = document.getElementById("ruleLogId").value;                                   
                                            var preActivityId1 = document.getElementById("fromActivityId").value;
                                            var curActivityId1 = document.getElementById("stepId").value;

                                            var wfUrl = "/WFPageProcessor.ashx?cmd=wf.activity.backprestep";
                                            jQuery.ajax({
                                                url: wfUrl,
                                                cache: false,
                                                async: false,
                                                dataType: "json",
                                                data: {
                                                    //sessionKey:sessionKey,
                                                    ruleLogId: ruleLogId,
                                                    fromStepId: curActivityId1, //当前步骤为开始步骤
                                                    toStepId: preActivityId1,   //上一步为退回步骤
                                                    instanceId: instId//,
                                                    //memo: document.getElementById("memo").value
                                                },
                                                type: "POST",
                                                success: function (data) {
                                                    //window.location = "/rest?method=flow.waitingtasks.getlist&exitInstacelist=1&refresh=1&InstanceId=" + instId + "&refreshID=" + ruleLogId + "&sessionKey=" + sessionKey;
                                                    window.location = "/a0M/o";
                                                },
                                                error: function (request, textStatus, errorThrown) {
                                            
                                                }
                                            });
                                        }
                          </script>

                        <script>                     
                              /*
                              var dialog = OverlayDialogElement.getDialog('nextstep_picker_');
                              dialog.isModal = true;
                              dialog.width =450;// 762;
                              dialog.hasButtonsBar = true;
                              dialog.displayX = true;
                              dialog.allowKeyboardEsc = true;
                              dialog.extraClass = '';
                              dialog.isAbsolutePositioned = false;
                              dialog.refreshOnClose = false;
                              dialog.isMovable = true;
                              dialog.buttonContents = '\u003Cinput value=\" 提交 \" style=\"height:25px;\" class=\"btn\" id=\"nextstep_picker_save_btn\" name=\"saveBtn\" onclick=\"doSubmitNextDone();\" title=\"完成 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"nextstep_picker_cancel_btn\" name=\"cancelBtn\" onclick=\"dialog.cancel();\" title=\"取消 (Esc)\" type=\"button\" style=\"height:25px;\" /\u003E';
                              dialog.setTitle('选择 步骤，提交下一步');
                              */
                              //dialog.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"invitee_picker_header_label\"\u003E\u003C/div\u003E\u003Cdiv class=\"mw_container\"\u003E\u003Cdiv class=\"search_area\"\u003E\u003Clabel for=\"invitee_picker_search_prefix\"\u003E搜索\u003C/label\u003E\u003Cselect  id=\"invitee_picker_search_types\" name=\"invitee_picker_search_types\"\u003E\u003Coption value=\"myunit\"\u003E本部门用户\u003C/option\u003E\n\u003Coption value=\"all\"\u003E用户、潜在客户和联系人\u003C/option\u003E\n\u003Coption value=\"005\"\u003E用户\u003C/option\u003E\n\u003Coption value=\"00Q\"\u003E潜在客户\u003C/option\u003E\n\u003Coption value=\"003\"\u003E联系人\u003C/option\u003E\n\u003Coption value=\"023\"\u003E资源\u003C/option\u003E\n\u003C/select\u003E\u003Cdiv class=\"search_text_div\" id=\"invitee_picker_search_text_div\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"search_text_icon\" title=\"\" /\u003E\u003Cinput  class=\"search_text\" id=\"invitee_picker_search_prefix\" maxlength=\"30\" name=\"invitee_picker_search_prefix\" onkeydown=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyDown(event)\" onkeyup=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyUp(event)\" size=\"20\" type=\"text\" value=\"\" /\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"clear_text_icon\" alt=\"清除搜索词\" id=\"invitee_picker_search_clear_text_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonClick(event)\" onkeypress=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonKeyPress(event)\" tabindex=\"0\" title=\"清除搜索词\" /\u003E\u003C/div\u003E\u003Cinput value=\" 查找 \"  class=\"btn\" id=\"invitee_picker_search_btn\" name=\"invitee_picker_search_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearch();\" title=\"查找\" type=\"button\" /\u003E\u003C/div\u003E\u003Cdiv class=\"message infoM4 overlimit_results\" id=\"invitee_picker_overlimit_results_message\"\u003E\u003Ctable  class=\"messageTable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cimg src=\"/s.gif\" alt=\"信息\"  class=\"msgIcon\" title=\"信息\"/\u003E\u003C/td\u003E\u003Ctd class=\"messageCell\"\u003E\u003Cdiv class=\"messageText\"\u003E前 300 个结果显示如下。您可以精简搜索，以缩短列表。\u003C/div\u003E\u003C/td\u003E\u003C/tr\u003E\n\u003C/table\u003E\u003C/div\u003E\u003Cscript\u003Eif (window.sfdcPage) sfdcPage.registerMessage(\'invitee_picker_overlimit_results_message\');\u003C/script\u003E\u003Cdiv class=\"mw_list_area\" id=\"invitee_picker_list_area\"\u003E\u003Cdiv class=\"found_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_found_label\"\u003E可用： \u003C/div\u003E\u003Cdiv class=\"mw_list\" id=\"invitee_picker_loading_icon_div\" style=\"display: none;\"\u003E\u003Cimg src=\"/img/loading.gif\" alt=\"请稍候...\" class=\"mw_loading\" title=\"请稍候...\" /\u003E\u003Cspan class=\"mw_loading\"\u003E正在加载...\u003C/span\u003E\u003C/div\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_found_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003Cdiv class=\"add_remove\"\u003E添加\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_add_button\" name=\"add_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onAdd();\"\u003E\u003Cdiv class=\"rightArrowIcon\" title=\"添加\"\u003E\u003C/div\u003E\u003C/a\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_remove_button\" name=\"remove_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onRemove();\"\u003E\u003Cdiv class=\"leftArrowIcon\" title=\"删除\"\u003E\u003C/div\u003E\u003C/a\u003E删除\u003C/div\u003E\u003Cdiv class=\"selected_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_selected_label\"\u003E已选取： \u003C/div\u003E\u003Cdiv id=\"invitee_picker_inner_selected_div\"\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_selected_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003C/div\u003E\u003Cdiv style=\"clear: both\"\u003E\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"limit_exceeded_message\" id=\"invitee_picker_limit_exceeded_message\"\u003E\u003C/div\u003E\u003C/div\u003E\u003C/div\u003E';
                              //dialog.contents = '\u003cdiv class=\"overlay_panel\"\u003e\r\n    \u003cform name=\"editPage\" id=\"editPage\"\u003e\r\n        \u003cdiv style=\"height: 330px;\"\u003e\r\n            \u003ctable\u003e\r\n                \u003ctr style=\"vertical-align: top;\"\u003e\r\n                    \u003ctd style=\"min-width:220px;\"\u003e\r\n                        \u003cdiv style=\"float: left; overflow-y: auto; font-size: 14px;  margin-top: 5px; margin-right:5px; border-right:1px solid #7f7f7f;\"\u003e\r\n                            \u003cdiv\u003e请选择下一步：\u003c/div\u003e\r\n                            \u003cdiv class=\"step\"\u003e\r\n                                \u003cinput type=\"radio\" name=\"nextActivity\" value=\"1\" /\u003e步骤1                          \r\n                            \u003c/div\u003e\r\n                            \u003cdiv class=\"step\"\u003e\r\n                                \u003cinput type=\"radio\" name=\"nextActivity\" value=\"2\" /\u003e步骤2                          \r\n                            \u003c/div\u003e\r\n                        \u003c/div\u003e\r\n                    \u003c/td\u003e\r\n                    \u003ctd\u003e\r\n                        \u003cdiv class=\"mw_container\"\u003e\r\n                            \u003cdiv id=\"duel_reports\" class=\"duelingListBox\"\u003e\r\n                                \u003cdiv style=\"display: none\" id=\"editPage_duel_reports_errorMsg\" class=\"errorMsg\"\u003e\r\n                                    \u0026nbsp;\r\n                                \u003c/div\u003e\r\n                                \u003ctable class=\"layout\"\u003e\r\n                                    \u003ctbody\u003e\r\n                                        \u003ctr valign=\"top\"\u003e\r\n                                            \u003ctd class=\"selectCell\"\u003e\r\n                                                \u003cdiv class=\"selectTitle\"\u003e\r\n                                                    \u003clabel for=\"duel_reports_select_0\"\u003e\r\n                                                        可选的办理人员\u003c/label\u003e\r\n                                                \u003c/div\u003e\r\n                                                \u003cselect size=\"14\" name=\"duel_people_select_0\" multiple=\"multiple\" id=\"duel_people_select_0\" style=\"height: 226px; min-width: 120px; display: block;\" ondblclick=\"selectItems()\"\u003e\r\n                                                \u003c/select\u003e\r\n\r\n                                            \u003c/td\u003e\r\n                                            \u003ctd class=\"zen-phs buttonCell\"\u003e\r\n                                                \u003cdiv class=\"text\"\u003e\r\n                                                    添加\r\n                                                \u003c/div\u003e\r\n                                                \u003cdiv class=\"zen-mbs text\"\u003e\r\n                                                    \u003ca id=\"duel_reports_select_0_right\" href=\"javascript:if (!document.getElementById(\u0027duel_people_select_0\u0027).disabled\u0026amp;\u0026amp; !document.getElementById(\u0027duel_people_select_1\u0027).disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_people_select_0, document.editPage.duel_people_select_1,\u0027--无--\u0027, [], null,\u0027--无--\u0027,false,null,\u0027editPage_duel_reports_errorMsg\u0027);}\"\u003e\r\n                                                        \u003cimg title=\"添加\" class=\"rightArrowIcon\" alt=\"添加\" src=\"/s.gif\"\u003e\u003c/a\u003e\r\n                                                \u003c/div\u003e\r\n                                                \u003cdiv class=\"text\"\u003e\r\n                                                    \u003ca id=\"duel_reports_select_0_left\" href=\"javascript:if (!document.getElementById(\u0027duel_people_select_0\u0027).disabled\u0026amp;\u0026amp; !document.getElementById(\u0027duel_people_select_1\u0027).disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_people_select_1, document.editPage.duel_people_select_0,\u0027--无--\u0027, [],  [] ,\u0027--无--\u0027,false,null,\u0027editPage_duel_reports_errorMsg\u0027);}\"\u003e\r\n                                                        \u003cimg title=\"删除\" class=\"leftArrowIcon\" alt=\"删除\" src=\"/s.gif\"\u003e\u003c/a\u003e\r\n                                                \u003c/div\u003e\r\n                                                \u003cdiv class=\"duelingText\"\u003e\r\n                                                    删除\r\n                                                \u003c/div\u003e\r\n                                            \u003c/td\u003e\r\n                                            \u003ctd class=\"selectCell\"\u003e\r\n                                                \u003cdiv class=\"selectTitle\"\u003e\r\n                                                    \u003clabel for=\"duel_reports_select_1\"\u003e\r\n                                                        已选的办理人员\u003c/label\u003e\r\n                                                \u003c/div\u003e\r\n                                                \u003cselect size=\"14\" name=\"duel_people_select_1\" multiple=\"multiple\" id=\"duel_people_select_1\" style=\"height: 226px; min-width: 120px;\" ondblclick=\"removeItems()\"\u003e\r\n                                                \u003c/select\u003e\r\n                                            \u003c/td\u003e\r\n                                            \u003ctd valign=\"top\" class=\"selectCell\"\u003e\u003ca href=\"javascript:openLookup(\u0027/_ui/common/data/PeopleOnlyPicker.aspx?lkfm=editPage\u0026lknm=\u0026lktp=\u0026showuserOnly=1\u0027 ,760,\u00271\u0027,\u0027\u0026lksrch=\u0027)\"\u003e\r\n                                                \u003cimg src=\"/img/cal/addNew_on.gif\" alt=\"\" title=\"加签\" /\u003e加签\u003c/a\u003e\r\n                                                \u003cdiv style=\"height: 100px\"\u003e\u003c/div\u003e\r\n                                            \u003c/td\u003e\r\n                                        \u003c/tr\u003e\r\n                                    \u003c/tbody\u003e\r\n                                \u003c/table\u003e\r\n                            \u003c/div\u003e\r\n                        \u003c/div\u003e\r\n                    \u003c/td\u003e\r\n                \u003c/tr\u003e\r\n            \u003c/table\u003e\r\n        \u003c/div\u003e\r\n    \u003c/form\u003e\r\n\u003c/div\u003e';
                              //dialog.contents = '<%=SelectedStepsPopHTML%>';
                        </script>
                        
                        <script type="text/javascript">
                            var addActivityId = "";
                            var _blockIndex = 0;
                            function addTranParticipator(idex, activityId) {
                                _blockIndex = idex;
                                addActivityId = activityId;
                                //openLookup('/_ui/common/data/PeopleOnlyPicker.aspx?lkfm=editPage&lknm=&lktp=&showuserOnly=0', 760, '1', '&lksrch=');
                                var iWidth = 1000;
                                var iHeight = 500;
                                var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
                                var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
                                window.open('/alert/addpeople/addpeople.html', 'newwindow', 'height=' + iHeight + 'px, width=' + iWidth + 'px, top=' + iTop + ', left=' + iLeft + ', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
                            }
                            function getcheckedpeople(ids){
                                var html = ''
                                for (var i = 0; i < ids.length; i++) {
                                    var userId = ids[i].valueId;
                                    var name = ids[i].name;
                                    var BusinessUnitIdName = ids[i].BusinessUnitIdName;
                                    html += "<div style='margin-left:10px;color:#999;' class=\"item\" >";
                                    //document.getElementById("duel_reports_select_1").options.add(new Option(names[c1], userId));   
                                    html += "<input type=\"checkbox\" value=\"" + userId + "\" id=\"participator_" + addActivityId + "_" + userId + "\" name=\"participator_" + addActivityId + "\" onclick=\"selectMemeber('nextActivity" + _blockIndex + "',this)\" checked=\"checked\" ><label style='color: #999;font-size:13px;'>";
                                    html += "<span style='color:blue'>" + name + "</span> / ";
                                    html += "<span style='color:blue'>" + BusinessUnitIdName + "</span>";
                                    html += "</label>";
                                    html += "</div>";
                                }
                                $("#activityParticipators" + _blockIndex).append(html);
                            }
                            function peopleLookupPick(a, b, c, d, e, f, g, k) {
                                //debugger;
                                var ids = e.split(',');
                                var names = f.split(',');
                                var html = "";
                                for (var c1 = 0; c1 < ids.length; c1++) {
                                    var userId = ids[c1].substring(2);
                                    var name = names[c1];
                                    html += "<div style='margin-left:10px;color:#999;' class=\"item\" >";
                                    //document.getElementById("duel_reports_select_1").options.add(new Option(names[c1], userId));   
                                    html += "<input type=\"checkbox\" value=\"" + userId + "\" id=\"participator_" + addActivityId + "_" + userId + "\" name=\"participator_" + addActivityId + "\" onclick=\"selectMemeber('nextActivity" + _blockIndex + "',this)\"><label style='color: #999;font-size:13px;'>";
                                    html += "<span style='color:black'>" + name + "</span>";
                                    html += "</label>";
                                    html += "</div>";
                                }
                                $("#activityParticipators" + _blockIndex).append(html);
                                //console.log(html);
                            }
                            function selAllNextSteps(val)
                            {
                                var selValue = "";
                                var sort = 0;
                                jQuery("input[name='nextActivity']").each(function (index, value) {
                                    var isSelect = jQuery(this).attr("checked");
                                    var tran_stepId = jQuery(this).val();
                                    var ar = tran_stepId.split('_');
                                    var activityId = ar[1];
                                   
                                    if (isSelect) {
                                        jQuery(this).removeAttr("checked");
                                    }
                                    else
                                    {
                                        jQuery(this).attr("checked","checked");
                                    }
                                    // console.trace(activityId)
                                   
                                    selectActivityParticipators(!isSelect,activityId);
                                });
                                
                            }
                            function selectActivityParticipators(isSelect,activityId)
                            {
                                //debugger;
                                //alert(activityId);//participator_81ddf516-d6da-46f0-b75e-ff562941eb26
                                jQuery("input[name='participator_"+activityId+"']").each(function (index, value) {
                                    if (isSelect) 
                                    {
                                        jQuery(this).attr("checked","checked");
                                    }
                                    else
                                    {
                                        jQuery(this).removeAttr("checked");
                                    }
                                });
                            }
                            //如果勾去了，下一步，允许选人
                            function showSelActivityPeople(ele,activityId,idx)
                            {
                                if(ele.checked)
                                    jQuery("#selActivityPeople"+idx).show();
                                else
                                    jQuery("#selActivityPeople"+idx).hide();
                                //if(checked)
                                //{
                                //participator_{1}
                                jQuery("input[name^='participator_"+activityId+"']").each(function (index, value) {
                                   // var isSelect = jQuery(this).attr("checked");
                                   //if (isSelect) 
                                    if (ele.checked) 
                                    {
                                        jQuery(this).attr("checked","checked");
                                    }
                                    else
                                    {
                                        jQuery(this).removeAttr("checked");
                                    }
                                });
                                //}

                            }
                            //选择人员
                            function selectMemeber(parentId,ele)
                            {
                                if(ele.checked)
                                {
                                    //doucument.getElementById(parentId).checked=true;
                                    jQuery("#"+parentId).attr("checked","checked");
                                }
                            }
                            //弹出选人框
                            function selActivityPeople(nextStepId,idx)
                            {
                                openLookup('/_ui/common/data/PeopleOnlyPicker.aspx?lkfm=editPage&lknm=&lktp=&showuserOnly=1' ,760,'1','&lksrch=');
                            }
                        </script>
                        <script>
                            function selectItems() {
                                if (!document.getElementById('duel_people_select_0').disabled && !document.getElementById('duel_people_select_1').disabled) { window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_people_select_0, document.editPage.duel_people_select_1, '--无--', [], null, '--无--', false, null, 'editPage_duel_reports_errorMsg'); }
                            }
                            function removeItems() {
                                if (!document.getElementById('duel_people_select_0').disabled && !document.getElementById('duel_people_select_1').disabled) { window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_people_select_1, document.editPage.duel_people_select_0, '--无--', [], [], '--无--', false, null, 'editPage_duel_reports_errorMsg'); }
                            }
                         </script>
                        <script>     window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_people_select_0', 'duel_people_select_1'], 'editPage_duel_reports_errorMsg');</script>
                        
                        <!-- Body events -->
                        <script type="text/javascript">
                            function selectOptionByName(bodyId, viewTab) {
                                /*
                                document.getElementById("ef_details_5009000000lRqdV").style = "display:block;visibility:visible";
                                document.getElementById("efpBody_5009000000lRqdV_lowerMain").style = "display:none;visibility:hidden";

                                document.getElementById("efpViews_5009000000lRqdV_option0").className = "optionItem efpDetailsView";
                                document.getElementById("efpViews_5009000000lRqdV_option1").className = "optionItem efpDetailsView";
                                document.getElementById("efpViews_MainBody_option1").className = "optionItem efpDetailsView";
                                document.getElementById("efpViews_AttachFiles_option1").className = "optionItem efpDetailsView";
                                */
                                if (viewTab == "MainBody")
                                {
                                    var url = document.getElementById("mainBodyUrl").value;
                                    var w=screen.availWidth;
                                    var h=screen.availHeight-5; 
                                    window.open(url,"docWeb","width="+w+",height="+h+"top=0,left=0,location=yes,resizable=yes,scrollbars=yes,alwaysRaised=yes,status=yes",true);
                                    return;
                                }

                                jQuery("#ef_details_5009000000lRqdV").hide();
                                jQuery("#efpBody_5009000000lRqdV_lowerMain").hide();
                                jQuery("#ef_mainBody").hide();
                                jQuery("#ef_attach").hide();
                                jQuery("#ef_ReaderInfos").hide();
                                jQuery("#ef_WFTransitionstu").hide();
                                jQuery("#ef_taolun").hide();

                                jQuery("#efpViews_5009000000lRqdV_option0").removeClass("selected");//流程信息
                                jQuery("#efpViews_AttachFiles_option1").removeClass("selected");//附件
                                jQuery("#efpViews_MainBody_option1").removeClass("selected");//正文
                                jQuery("#efpViews_5009000000lRqdV_option1").removeClass("selected");//表单
                                jQuery("#efpViews_ReaderInfos_option5").removeClass("selected");//传阅
                                jQuery("#efpViews_ReaderInfos_option4").removeClass("selected");//传阅
                                jQuery("#efpViews_ReaderInfos_option6").removeClass("selected");//传阅
                                jQuery("#taolun").removeClass("selected");//讨论

                                if (viewTab == "DetailsView") {

                                    jQuery("#ef_details_5009000000lRqdV").show();
                                    //document.getElementById("ef_details_5009000000lRqdV").style = "display:block;visibility:visible";                                        
                                    //document.getElementById("efpViews_5009000000lRqdV_option1").className = "optionItem efpDetailsView selected";
                                    jQuery("#efpViews_5009000000lRqdV_option1").addClass("selected");
                                }
                                else if (viewTab == "MainBody") { //正文
                                    if (document.getElementById("mainBodyLoad").value == "0") {
                                        document.getElementById("mainBodyLoad").value = "1";
                                        document.getElementById("iFrameMainBody").src = document.getElementById("mainBodyUrl").value;                                       
                                    }
                                    jQuery("#ef_mainBody").show();
                                    //document.getElementById("efpViews_MainBody_option1").className = "optionItem efpDetailsView selected";
                                    jQuery("#efpViews_MainBody_option1").addClass("selected");
                                }
                                else if (viewTab =="AttachFiles") {
                                    jQuery("#ef_attach").show();
                                    //document.getElementById("efpViews_AttachFiles_option1").className = "optionItem efpDetailsView selected";
                                    jQuery("#efpViews_AttachFiles_option1").addClass("selected");
                                }
                                else if (viewTab =="ReaderInfos") {
                                    //传阅
                                    jQuery("#ef_ReaderInfos").show();
                                    //document.getElementById("efpViews_AttachFiles_option1").className = "optionItem efpDetailsView selected";
                                    jQuery("#efpViews_ReaderInfos_option4").addClass("selected");
                                }
                                else if (viewTab =="WFTransitionstu") {
                                    //流程图
                                    jQuery("#ef_WFTransitionstu").show();
                                    //document.getElementById("efpViews_AttachFiles_option1").className = "optionItem efpDetailsView selected";
                                    jQuery("#efpViews_ReaderInfos_option6").addClass("selected");
                                    lazyload();
                                }
                                else if (viewTab =="taolun") {
                                    console.log(123)
                                    //讨论
                                    $("#ef_taolun").show();
                                    //document.getElementById("efpViews_AttachFiles_option1").className = "optionItem efpDetailsView selected";
                                    jQuery("#taolun").addClass("selected");
                                    lazyload();
                                }
                                else {
                                    //流转信息
                                    //document.getElementById("ef_details_5009000000lRqdV").style = "display:none;visibility:hidden";
                                    //jQuery("#ef_details_5009000000lRqdV").hide();
                                    //document.getElementById("efpBody_5009000000lRqdV_lowerMain").style = "display:block;visibility:visible";                                        
                                    //document.getElementById("efpViews_5009000000lRqdV_option0").className = "optionItem efpDetailsView selected"; //tab
                                    jQuery("#efpBody_5009000000lRqdV_lowerMain").show();
                                    jQuery("#efpViews_5009000000lRqdV_option0").addClass("selected");
                                    // document.getElementById("efpViews_5009000000lRqdV_option1").className = "optionItem efpDetailsView";
                                }
                            }
                            </script>
                        
                        
                       
                        <script type="text/javascript">
                            function isIE8()
                            {
                                if  (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER' && (navigator.userAgent.indexOf('MSIE 8') >= -1 || navigator.userAgent.indexOf('MSIE 9') >= -1))
                                {
                                    return true;
                                }
                                return false;
                            }
                           
                            function lazyload()
                            {
                                if(document.getElementById("isMonitorLoad").value!="1")
                                {
                                    document.getElementById("isMonitorLoad").value="1";
                                    document.getElementById("ifrmflowMonitor").src ="/apps/flowdesigner/editors/monitor2.aspx?schemeId=<%=ProcessId%>&InstanceId=<%=InstanceId%>";
                                    //document.getElementById("ifrmflowMonitor").src ="/apps/flowdesigner/editors/monitor.aspx?schemeId=<%=ProcessId%>&InstanceId=<%=InstanceId%>";
                                }
                            }
                            function loadEntityForm()
                            {                                
                                //document.getElementById("iWFForm").src =;
                            }
                            function bodyOnLoad() {
                                //loadEntityForm();
                                //SfdcApp.TopicsFeed.setupHandlers('topicContainer70190000000WFpH');
                                var iWFFormHeight = document.getElementById('iWFForm').contentWindow.document.body.offsetHeight;
                                if(iWFFormHeight<=200)
                                {
                                    iWFFormHeight=480;
                                }
                                //else if(iWFFormHeight>document.body.clientHeight)
                                //{
                                //    iWFFormHeight = document.body.clientHeight;
                                //}
                                //alert("iWFFormHeight:"+iWFFormHeight);
                                //alert("clientHeight:"+document.body.clientHeight);
                                //alert("offsetHeight:"+document.body.offsetHeight);
                                //document.getElementById('iWFForm').height = iWFFormHeight+100;
                                
                                var iFrameID = document.getElementById('iWFForm');
                                var scrollheight = iFrameID.contentWindow.document.body.scrollHeight;
                                if(scrollheight<=200)
                                    scrollheight = 650;
                                scrollheight= scrollheight + 20;
                                iFrameID.height = scrollheight + "px";
                                /**/
                                var frmAttaches = document.getElementById('ifrmAttaches');
                                //frmAttaches.height =iWFFormHeight+100;
                                //document.getElementById('iFrameMainBody').height = document.getElementById('iFrameMainBody').contentWindow.document.body.offsetHeight;
                                
                                var instId = document.getElementById("instanceId").value;
                                getRelatedWFinstances(instId,renderRelatedInstances);

                                setFocusOnLoad();
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                //if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                                if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ;
                                //if (this.loadChatFrameJs) loadChatFrameJs();
                                //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); 
                                //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                //SfdcApp.MruHovers.global_data.url = 'retURL=%2F70190000000WFpH&isAjaxRequest=1&renderMode=RETRO&nocache=1411712025452';
                                //if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
                                //if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                                lazyload();
                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
    </div>
    <script defer="true" src="/jslibrary/sfdc/Zen.js" type="text/javascript"></script>
    <script src="/js/alert.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('#relateInstance').click(function(){
            opencenterwindow('/alert/wf/relateInstance.html?InstanceId=<%=InstanceId%>', '相关事务', 1000, 600)
        })
        $(document).ready(function(){
          //  $('#iWFForm').height($(window).height() - 380)
           // $('#ifrmAttaches').height($(window).height() - 380)
        })
        jQuery(document).ready(function () {
            $('body').append('<iframe id="iframe_display" name="iframe_display" style="display: none;"></iframe>  ')
            $("#btnUploadfile").after('<form style="display:none;" enctype="multipart/form-data" target="iframe_display" method="post" action="/apps/CommandProcessor.ashx?cmd=file.attachment.upload" id="fileform"><input id="fileinput" value="123" onchange="filechange(this)" style="display:none" type="file" name="file" multiple="multiple" class="el-upload__input">'
                + '<input type="hidden" name="pid" id="pid"/><input type="hidden" name="ObjTypeCode" id="ObjTypeCode"></form>')
            $("#btnUploadfile").click(function () {
                //setLastMousePosition(event);
                var pid = $('#instanceId').val();
                var entityCode = $('#EntityObjectType').val();
                var type = $('#EntityObjectType').val();
                var CategoryName = $('.missionright-file-type .shituu span').html()
                if(CategoryName=='全部'){
                    CategoryName=''
                }
                if (typeof FormData != 'undefined') {
                    $(this).next().find('#fileinput').trigger('click')
                } else {
                    openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName="+CategoryName+"&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
                }
            });
        });
        function filechange(that) {
            //console.log($.ajaxSettings.xhr())
            var form = $('#fileform')
            $('#pid').val($('#instanceId').val())
            $('#ObjTypeCode').val($('#EntityObjectType').val())
            if (typeof FormData != 'undefined') {
                if ($(that).val() != '') {
                    $('.popup-mask').show()
                    $('#iframe').show().attr('src', '/alert/fileupdata.html').css({
                        height: 200,
                        marginTop: '-100px'
                    })
                    var formdata = new FormData(form[0]);
                    $.ajax({
                        url: "/apps/CommandProcessor.ashx?cmd=file.attachment.upload",
                        type: "post",
                        data: formdata,
                        contentType: false,
                        processData: false,
                        mimeType: "multipart/form-data",
                        success: function (data) {
                           // console.log(data)
                            $('#ifrmAttaches').attr('src', $('#ifrmAttaches').attr('src'));
                            return false;
                        },
                        error: function (error) {
                           // console.log("error", error)
                        },
                        xhr: function () {
                            var xhr = $.ajaxSettings.xhr();
                            if (onprogress && xhr.upload) {
                                xhr.upload.addEventListener("progress", onprogress, false);
                                return xhr;
                            }
                        },
                    })
                }
            } else {
                form.submit()
            }
        }
        function onprogress(evt) {
            var loaded = evt.loaded;
            var tot = evt.total;
            var per = Math.floor(100 * loaded / tot);
            //console.log(per)
            //console.log(evt)
            $('#iframe').contents().find('.loadedsize').html((loaded / 1024 / 1024).toFixed(2) + 'M')
            $('#iframe').contents().find('.totsize').html((tot / 1024 / 1024).toFixed(2) + 'M')
            $('#iframe').contents().find('.progress-in').css('width', per + '%')
            if (per == 100) {
                $('.popup-mask').hide()
                $('#iframe').hide()
                success2('上传成功');
            }
        }
    </script>
   
</body>
</html>
<!-- page generation time: 222ms -->
