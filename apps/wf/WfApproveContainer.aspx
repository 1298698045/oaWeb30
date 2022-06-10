<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WfApproveContainer.aspx.cs"
    Inherits="WebClient.apps.wf.WfApproveContainer" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>事务办理：表单提交: ~ - Developer Edition</title>
    <link href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/elements.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/common.css" rel="stylesheet" type="text/css" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <!--
    <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script src="/jslibrary/sfdc/ManyWhoActivity.js"></script>-->
    <script>        window.sfdcPage = new EditPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1415312846000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-11-16 下午3:03", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Task';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/EXT/ext-3.3.3/resources/css/ext-all-notheme.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ExtCSS-SFDC.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1412235274000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1413771514000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '125.39.9.124', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00T90000018FhOy%2Fe%3FretURL%3D%252F00T90000018FhOy');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif campaignTab  editPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outerNoSidebar" width="100%" id="bodyTable" border="0" cellspacing="0"
                cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class="noSidebarCell" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><h1 class="pageType">
                                                事务<span class="titleSeparatingColon">:</span></h1>
                                            <h2 class="pageDescription">
                                                <%=InstanceName%>：<%=CurrentStepName%></h2>
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
                                <script type="text/javascript" >
                                    function printProcessForm(instanceId) {
                                        var ruleLogId = document.getElementById("RuleLogId").value;
                                        var url = "WFFormPrint.aspx?InstanceId=" + instanceId + "&RuleLogId=" + ruleLogId;
                                        window.open(url, "打印表单");
                                    }
                                </script>
                               <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                        <div id="ep" class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette">
                            <div class="pbHeader">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="pbTitle">
                                                <img width="12" height="1" style="margin-right: 0.25em;" title="" class="minWidth"
                                                    alt="" src="/s.gif"><h2 class="mainTitle">
                                                        表单详细信息</h2>
                                            </td>
                                            <td id="topButtonRow" class="pbButton"><!--
                                                <input type="button" onclick="saveFormData();" name="inlineEditSave" style="display: block;" 
                                                    title="保存" class="btn" value=" 保存 " />
                                                <input type="button" onclick="sfdcPage.revert();" name="inlineEditCancel" style="display: block;" 
                                                    title="取消" class="btn" value=" 取消 " />-->
                                                <input type="button" onclick="saveFormData();"  name="edit" title="保存" class="btn" value=" 保存表单数据 " />
                                                 <input type="button" onclick="return openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=<%=InstanceId%>&RuleLogId=<%=Request["RuleLogId"]%>', 'DocEdit', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                    name="clone" title="编辑正文" class="btn" value=" 编辑正文 " />
                                                <input type="button" onclick="if ((Modal.confirm &amp;&amp; Modal.confirm('是否确定流转吗？')) || (!Modal.confirm &amp;&amp; window.confirm('是否确定流转吗？'))) navigateToUrl('StartProcInstance.aspx?t=122&InstanceId=<%=InstanceId%>&amp;RuleLogId=<%=Request["RuleLogId"]%>','DETAIL','tran');"
                                                    name="tran" title="流程流转" class="btn" value=" 流程流转 " />
                                                <input value=" 流程监控 " class="btn" title="流程监控" name="edit" onclick="return openPopupFocusEscapePounds('/apps/flowdesigner/editors/monitor.aspx?schemeId=<%=ProcessId%>&InstanceId=<%=InstanceId%>', 'monitor', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                type="button" />
                                                <!--
                                                <div id="managedetail" class="menuButton">
                                                    <div id="managedetailButton" class="menuButtonButton"><span tabindex="0" id="managedetailLabel" class="menuButtonLabel"></span></div><div id="managedetailMenu" class="menuButtonMenu"><a class="menuButtonMenuLink firstMenuItem" href="/ui/campaign/CampaignManageMembersAddTab?campaignId=70190000000uODU">添加成员 &ndash; 搜索</a><a class="menuButtonMenuLink" href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000uODU&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27); ">添加成员  &ndash; 导入文件</a><a class="menuButtonMenuLink" href="/ui/campaign/CampaignManageMembersExistingTab?campaignId=70190000000uODU">编辑成员 &ndash; 搜索</a><a class="menuButtonMenuLink" href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000uODU&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27);">更新和添加成员  &ndash; 导入文件</a></div>
                                                </div>
                                                <script>      new MenuButton('managedetail', false);</script>-->
                                                <input type="button" onclick="printProcessForm('<%=InstanceId%>');"  name="printForm" title="打印表单" class="btn" value=" 打印表单 " />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div style="display: none" id="errorDiv_ep" class="pbError">
                                    错误：无效数据。<br/>
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div class="pbSubsection">
                                     <iframe width="100%" height="450" frameborder="0" src="WfFormEdit.aspx?instanceId=<%=Request["InstanceId"]%>&RuleLogId=<%=Request["RuleLogId"]%>"
                            id="iWFForm"></iframe>
                                </div>
                            </div>
                            <div class="pbBottomButtons">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="pbTitle">
                                                <img width="12" height="1" style="margin-right: 0.25em;" title="" class="minWidth"
                                                    alt="" src="/s.gif">&nbsp;
                                            </td>
                                            <td id="bottomButtonRow" class="pbButtonb">
                                               <!-- <input type="button" onclick="sfdcPage.save();" name="inlineEditSave" style="display: none;"
                                                    title="保存" class="btn" value=" 保存 ">
                                                <input type="button" onclick="sfdcPage.revert();" name="inlineEditCancel" style="display: none;"
                                                    title="取消" class="btn" value=" 取消 ">-->
                                                <input type="button" onclick="saveFormData();"   name="edit" title="保存" class="btn" value=" 保存表单数据 " />
                                                <input type="button" onclick="return openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=<%=InstanceId%>', 'DocEdit', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                    name="clone" title="编辑正文" class="btn" value=" 编辑正文 " />   
                                                <input type="button" onclick="if ((Modal.confirm &amp;&amp; Modal.confirm('是否确定流转吗？')) || (!Modal.confirm &amp;&amp; window.confirm('是否确定流转吗？'))) navigateToUrl('StartProcInstance.aspx?t=122&InstanceId=<%=InstanceId%>&amp;RuleLogId=<%=Request["RuleLogId"]%>','DETAIL','tran');"
                                                    name="tran" title="流程流转" class="btn" value=" 流程流转 " />
                                                <!--
                                                <input type="button" onclick="if ((Modal.confirm &amp;&amp; Modal.confirm('是否确定？')) || (!Modal.confirm &amp;&amp; window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.jsp?delID=70190000000uODU&amp;retURL=%2F701%2Fo&amp;_CONFIRMATIONTOKEN=aORRtR4OfdCZQN9lNaP0kycqq1a9QsO.6eSPZdWo5acm7bKS5JFsm_xmZDwl8xxbWSxh3ok4tItQza7DIuBk_ChWDmRpiSZPeLc0dtaGb2MnDpOn_Gh6CCKBqRWfRFTGKV6UpC7zLtgO0oojB1atcULqRs8%3D&amp;failRetURL=%2F70190000000uODU','DETAIL','del');"
                                                    name="del" title="删除" class="btn" value=" 删除 ">
                                                
                                                <div id="managedetailCopy" class="menuButton"><div id="managedetailCopyButton" class="menuButtonButton"><span tabindex="0" id="managedetailCopyLabel" class="menuButtonLabel">流转审批</span></div><div id="managedetailCopyMenu" class="menuButtonMenu"><a class="firstMenuItem menuButtonMenuLink" href="/ui/campaign/CampaignManageMembersAddTab?campaignId=70190000000uODU">添加成员 &ndash; 搜索</a><a class="menuButtonMenuLink" href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000uODU&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27); ">添加成员&ndash; 导入文件</a><a class="menuButtonMenuLink" href="/ui/campaign/CampaignManageMembersExistingTab?campaignId=70190000000uODU">编辑成员 &ndash; 搜索</a><a class="menuButtonMenuLink" href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000uODU&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27);">更新和添加成员 &ndash; 导入文件</a></div>
                                                </div>
                                                <script>  new MenuButton('managedetailCopy', false);</script>-->
                                                <input type="button" onclick="printProcessForm('<%=InstanceId%>');"  name="printForm" title="打印表单" class="btn" value=" 打印表单 " />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>                       
                        <!-- Begin RelatedListElement -->
                        <div class="first bRelatedList" id="00T90000018FhOy_RelatedActivityAttachmentList">
                            <a name="00T90000018FhOy_RelatedActivityAttachmentList_target"></a>
                            <!-- Begin ListElement -->
                            <!-- motif: Task -->
                            <!-- WrappingClass -->
                            <div class="noStandardTab">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="pbTitle">
                                                    <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/s.gif"
                                                        alt="" class="relatedListIcon" title="" /><h3 id="00T90000018FhOy_RelatedActivityAttachmentList_title">
                                                            附件</h3>
                                                </td>
                                                <td class="pbButton">
                                                    <input value=" 附加文件 " class="btn" name="attachFile" onclick="setLastMousePosition(event);openPopup('/attach/ActivityAttach.aspx?relatedListId=00T90000018FhOy_RelatedActivityAttachmentList&retURL=%2F00T90000018FhOy%2Fe%3FretURL%3D%252F00T90000018FhOy&pid=<%=InstanceId%>&type=122', 'doc', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);"
                                                        title="附加文件" type="button" />&nbsp;
                                                </td>
                                                <td class="pbHelp">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="pbBody" id="00T90000018FhOy_RelatedActivityAttachmentList_body">
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th scope="col" class="noRowsHeader">
                                                    没有可显示的记录
                                                </th>
                                            </tr>
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
                            <script>                                //             try { sfdcPage.registerRelatedList('00T90000018FhOy_RelatedActivityAttachmentList', '0', '附件', false, '/00T90000018FhOy/e?retURL=%2F00T90000018FhOy', 'retURL=%2F00T90000018FhOy&relatedListId=RelatedActivityAttachmentList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedActivityAttachmentList'); } catch (e) { }</script>
                            <!-- End ListElement -->
                        </div>
                        <!-- End RelatedListElement -->
                        <!--
                        <div class="fewerMore">
                            <div class="backToTop">
                                <a href="#skiplink" title="返回顶部">
                                    <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                            每一相关列表总是显示 <a href="/00T90000018FhOy/e?retURL=%2F00T90000018FhOy&amp;rowsperlist=10">
                                <img src="/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a> 项记录</div>-->
                        <!-- Body events -->
                        <script type="text/javascript">
                            function saveFormData() {
                               // debugger;                              
                                var d = document;
                                var f = d.frames ? d.frames['iWFForm'] : d.getElementById('iWFForm');
                                var p = f.document || f.contentWindow;
                                if (p.SaveFormData) {
                                    p.SaveFormData();
                                }
                                else {
                                    window.frames['iWFForm'].SaveFormData();
                                }
                            }
                            function bodyOnLoad() {
                               // debugger;
                                var iWFFormHeight = document.getElementById('iWFForm').contentWindow.document.body.offsetHeight;
                                document.getElementById('iWFForm').height = iWFFormHeight;
                                //alert(iWFFormHeight);
                                //new ForeignKeyInputElement("tsk3", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" });
                                //new Sfdc.Activity.ManyWhoForeignKeyInputElement("tsk2", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" });
                                //new ForeignKeyInputElement("tsk1", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "005" });
                                //ActivityFunction.initWhoWhatFields('00Q', 'tsk2', 'tsk2_lkid', 'whobtn', 'tsk2_mlktp', 'tsk3', 'tsk3_lkid', 'whtbtn', 'tsk3_mlktp', 'IsVisibleInSelfService', 'tsk1_lkid', '0059000000390Wh'); 
                                //handleTextAreaElementChangeWithByteCheck('tsk6', 32000, 0, '剩余', '超出极限');
                                //LookupAutoCompleteInputElement.registerSupportedEntities("tsk2", {}); ActivityFunction.adjwht('tsk2_mlktp');
                                //LookupAutoCompleteInputElement.registerSupportedEntities("tsk3", {});
                                //Sfdc.Activity.ManyWhoFunction.setLookupInfo('tsk2', false, null);
                                //sfdcPage.appendToOnloadQueue(function () { new Sfdc.GuidedTour({ "steps": [{ "locator": "a[id='whobtn']", "position": "b-t", "offsets": [0, 0], "width": 300, "height": 110, "useArrow": true, "arrowOffset": 100, "title": "\u003Cspan class=\"gt_new\"\u003E新！\u003C/span\u003E 共享的活动", "content": "\u003Cdiv class=\"gt_container\"\u003E使用查找图标可将 一个 个以上的联系人与任务或事件关联。\u003Cbr/\u003E\u003Cbr/\u003E\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526section%253Dhelp%2526target%253Dactivities_shared_about.htm%2526hash%253Dtopic-title%2526language%253Dzh_CN%2526release%253D192.11.2%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" title=\"了解详细信息！ （新窗口）\"\u003E了解详细信息！\u003C/a\u003E\u003C/div\u003E", "toolbarItems": [{ "xtype": "tbfill"}], "countStep": true}], "shouldShowHandler": function () { return true; }, "showLaterHandlerIntercept": function () { return true; }, "closeForeverHandlerIntercept": function () { UserContext.userPreferences.setBoolean('HideManyWhoGuidedTour', true); }, "closeIntroLabel": "不了，谢谢", "closeOutroLabel": "关闭", "showLaterLabel": "稍后显示", "startTourLabel": "开始浏览", "endTourLabel": "结束浏览", "previousLabel": "上一页", "continueLabel": "继续", "replayLabel": "重放" }).start(); }, 'Guided Tour: start'); TaskEditPage.reenableReminders('tsk12', 'IsRecurrence', 'reminder_ldt', 'reminder_ldt_time', 'reminder_dt', 'reminder_dt_time'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };
                                //Sfdc.Cookie.deleteCookie('setupopen'); ;
                                //if (this.loadChatFrameJs) loadChatFrameJs();
                                //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00T90000018FhOy%2Fe%3FretURL%3D%252F00T90000018FhOy&isAjaxRequest=1&renderMode=RETRO&nocache=1416121416227';
                                //if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
                                //if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
<!-- page generation time: 56ms -->
