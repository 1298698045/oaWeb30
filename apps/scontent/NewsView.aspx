<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsView.aspx.cs" Inherits="WebClient.apps.scontent.NewsView" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>信息：<%=Title%> ~ .com - Developer Edition
    </title>
      <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/rlHovers.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterCore.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterExtended.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DedupeCSS.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/Campaign.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1428454681000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <!--<script src="/jslibrary/sfdc/main.js"></script>-->
     <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/1427926072000/zh_CN.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Chatter.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/Business.js"></script>    
 
    <script>        window.sfdcPage = new DetailPage("70190000000uODU");
        UserContext.initialize({ "networkId": "", "labelLastModified": "1427926072000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-4-8 下午3:08", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Notice';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/rlHovers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DedupeCSS.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428454681000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
      <script src="/apps/scontent/distributeContent.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.169', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F70190000000uODU');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab  detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
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
                                            <img src="/s.gif" alt="信息" class="pageTitleIcon" title="信息" /><h1 class="pageType noSecondHeader">
                                                信息：<%=Title%></h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links"><!--
                                            <a href="/setup/ui/uiconfigrelatedlistsedit.jsp?retURL=%2F70190000000uODU&amp;id=Campaign"
                                                class="configLinks">自定义页面</a> | <a href="/layouteditor/layoutEditor.apexp?type=Campaign&amp;lid=00h9000000RbNyc&amp;retURL=%2F70190000000uODU"
                                                    class="configLinks">编辑布局</a> | <a href="javascript:printWin(%27/70190000000uODU/p?retURL=%2F70190000000uODU%27)"
                                                        class="configLinks" title="可打印视图 （新窗口）">可打印视图</a> | <a href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dbasics_editing_records.htm%2526section%253DCampaigns%2526language%253Dzh_CN%2526release%253D194.15.3%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                            title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                                class="helpIcon" /></a>--></div>
                                    </div>
                                    <div class="topics metadata" id="section_header" style="display:none">
                                        <script>                                            //     chatter.getToolbox().setToken('RSKz1MyfCeJ75y3OtVCGOKSAv17fOjIdNOVCXNymWo9OCEYFpMz78i.YtE5qLgY_e14lvHQGS86nYD4_gF7oo4PVruV4tm0CnUc0UdE.Ey9sywNBVHBvUqU7xilIHcsJBY.PvN8HUv3OOKXVMmW16CraLGk=');</script>
                                        <div class="topicsOnRecordPage">
                                            <div class="topics " id="topicContainer70190000000uODU" data-entityid="70190000000uODU"
                                                data-referrer="RECORD_PAGE" data-iswidget="true">
                                                <div class="view topic-widgetWithInfoBubble">
                                                    <a href="javascript: void(0);" class="editLink">主题:</a> &nbsp; <a href="/_ui/core/chatter/topics/TopicPage?id=0TO900000004YoS&amp;ref=record_page&amp;entityId=70190000000uODU"
                                                        class="topic discreteLink"></a>
                                                    <div class="topic-infoBubbleFixAbs">
                                                        <div class="zen topic-infoBubbleFixRel">
                                                            <div class="topic-infoBubbleWrapper" data-topicwidget="TopicInfoBubble">
                                                                <a href="javascript:void(0);" title="您为什么要添加主题到记录？" class="iconParent">
                                                                    <img class="visibilityicon" src="/s.gif" alt="您为什么要添加主题到记录？" width="1" height="1">
                                                                </a>
                                                                <div class="topic-infoBubble hidden zen-callout zen-arrowLeft zen-sideNorth">
                                                                    <b class="zen-arrow"></b>
                                                                    <div class="zen-inner">
                                                                        <div class="zen-body zen-ptm zen-phm">
                                                                            <p>
                                                                                从主题页面或列表视图中添加主题到快速访问相关记录。尽管每个人都可看到主题名，但记录的可见性仍然不变。
                                                                            </p>
                                                                        </div>
                                                                        <div class="visibilityFooter">
                                                                            <a title="了解更多（新窗口）" href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);">
                                                                                了解更多</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearingBox">
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                        &nbsp;&#171&nbsp;<a href="/090/o">返回列表</a></div>
                                </div>
                        <script type="text/javascript"></script>
                        <div class="RLPanelShadow" id="RLPanelShadow"><div class="rls_top"><div class="rls_tl"></div><div class="rls_tr"></div></div><div class="rls_l"></div><div class="rls_r"></div><div class="RLPanel" id="RLPanel" onblur="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onfocus="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onmouseout="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onmouseover="sfdcPage.getRelatedListPanel('RLPanel').showRL()"><iframe  frameborder="0" id="RLPanelFrame" name="RLPanelFrame" src="/emptyHtmlDoc.html" title="隐藏框架 - 忽略"></iframe></div><div class="rls_bottom"><div class="rls_bl"></div><div class="rls_br"></div></div></div><div class="listHoverLinks"><span  class="invisibleMinHeight">|</span></div><script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              try { sfdcPage.registerRelatedListPanel('RLPanel', false); } catch (e) { }</script>
                        <div class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette" id="ep">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">
                                                信息详细信息</h2>
                                        </td>
                                        <td class="pbButton" id="topButtonRow">
                                            <input value=" 保存 " class="btn" title="保存" style="display: none;" name="inlineEditSave"
                                                onclick="sfdcPage.save();" type="button" />
                                            <input value=" 取消 " class="btn" title="取消" style="display: none;" name="inlineEditCancel"
                                                onclick="sfdcPage.revert();" type="button" />
                                            <input value=" 编辑 " class="btn" title="编辑" name="edit" onclick="navigateToUrl('/090/e?id=<%=EntityId%>&amp;retURL=%2F090%2Fdetail?id=<%=EntityId%>','DETAIL','edit');"
                                                type="button" />
                                            <input value=" 删除 " class="btn" title="删除" name="del" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?type=100202&delID=<%=EntityId%>&amp;retURL=%2F091%2Fo&amp;failRetURL=%2F70190000000uODU','DETAIL','del');"
                                                type="button" /><!--
                                            <input value=" 复制 " class="btn" title="复制" name="clone" onclick="navigateToUrl('/70190000000uODU/e?clone=1&amp;retURL=%2F70190000000uODU','DETAIL','clone');"
                                                type="button" />-->
                                             <input value=" 预览 " class="btn" title="预览" name="prev" onclick="openPopupFocusEscapePounds('<%=PreviewURL%>', 'Prev', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" 
                                                type="button" />
                                            <% if (ShowApproveButton) { %>
                                            <div class="menuButton" id="managedetail">
                                                <div class="menuButtonButton" id="managedetailButton"><span class="menuButtonLabel" id="managedetailLabel" tabindex="0">审批</span></div>
                                                <div class="menuButtonMenu" id="managedetailMenu"><a href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>',1);" class="menuButtonMenuLink firstMenuItem">审批发布</a><a href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>',2); "  class="menuButtonMenuLink">审批不发布</a></div>
                                            </div>
                                            <script>                                                new MenuButton('managedetail', false);</script>
                                            <%} %>
                                              <input value=" 邀请查看人员 " class="btn" title="邀请查看人员" name="invitee" onclick="navigateToUrl('/apps/scontent/InviteeReaders.aspx?t=090&type=100201&amp;id=<%=EntityId%>&retURL=%2F090%2Fdetail?id=<%=EntityId%>','DETAIL','invitee');"
                                                type="button" />
                                            <input value=" 消息提醒 " class="btn" title="消息提醒" name="noti" onclick="navigateToUrl('/msg/NotifyRelatedMem.aspx?t=090&type=100201&amp;id=<%=EntityId%>&retURL=%2F090%2Fdetail?id=<%=EntityId%>','DETAIL','noti');"
                                                type="button" />
                                            <input value=" 分发到下级单位 " class="btn" title="分发到下级单位" name="distribute" onclick="distributeContent('<%=EntityId%>');"
                                                type="button" />
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
                                        <tr>
                                            <td class="labelCol">
                                                发布部门
                                            </td>
                                            <td class="dataCol col02" id="cpn15_ilecell">
                                                <%=BusinessUnitName%>
                                            </td>
                                            <td class="labelCol">
                                                阅读数量总计
                                            </td>
                                            <td class="dataCol inlineEditLock" id="cpn17_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);">
                                                <div id="cpn17_ileinner">
                                                    <%=ReadCount%></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol">
                                                标题
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite" id="cpn1_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onkeypress="if (window.sfdcPage && window.sfdcPage.hasRun && event && event.keyCode==KEY_ENTER) sfdcPage.dblClickField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                tabindex="0">
                                               <%=Title%>
                                            </td>
                                            <td class="labelCol">
                                               评论数量总计
                                            </td>
                                            <td class="dataCol inlineEditLock" id="cpn19_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);">
                                                <div id="cpn19_ileinner">
                                                     <%=CommentCount%></div>
                                            </td>                                          
                                        </tr><!--
                                        <tr>
                                            <td class="labelCol">
                                                启用
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite" id="cpn16_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onkeypress="if (window.sfdcPage && window.sfdcPage.hasRun && event && event.keyCode==KEY_ENTER) sfdcPage.dblClickField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                tabindex="0">
                                                <div id="cpn16_ileinner">
                                                    <img src="/img/checkbox_checked.gif" alt="选取的" width="21" height="16" class="checkImg"
                                                        id="cpn16_chkbox" title="选取的" /></div>
                                            </td>
                                             <td class="labelCol empty">
                                                
                                            </td>
                                            <td class="dataCol empty" >
                                                
                                            </td>
                                        </tr>-->
                                        <tr>
                                            <td class="labelCol">
                                                类型
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite" id="cpn2_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onkeypress="if (window.sfdcPage && window.sfdcPage.hasRun && event && event.keyCode==KEY_ENTER) sfdcPage.dblClickField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                tabindex="0">
                                                <div id="cpn2_ileinner">
                                                    <%=FolderName%></div>
                                            </td>
                                            <td class="labelCol">
                                                点赞数量总计
                                            </td>
                                            <td class="dataCol inlineEditLock" id="cpn20_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);">
                                                <div id="cpn20_ileinner">
                                                    <%=LikeCount%></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol">
                                                状态
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite" id="cpn3_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onkeypress="if (window.sfdcPage && window.sfdcPage.hasRun && event && event.keyCode==KEY_ENTER) sfdcPage.dblClickField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                tabindex="0">
                                                <div id="cpn3_ileinner">
                                                    <%=StatusName%></div>
                                            </td>
                                             <td class="labelCol">
                                                 不点赞数量总计
                                            </td>
                                            <td class="dataCol" >
                                                 <%=DislikeQty%>
                                            </td>
                                        </tr><!--
                                        <tr>
                                            <td class="labelCol">
                                                开始日期
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite" id="cpn5_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onkeypress="if (window.sfdcPage && window.sfdcPage.hasRun && event && event.keyCode==KEY_ENTER) sfdcPage.dblClickField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                tabindex="0">
                                                <div id="cpn5_ileinner">
                                                   </div>
                                            </td>
                                           <td class="labelCol empty">
                                                
                                            </td>
                                            <td class="dataCol empty" >
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol">
                                                结束日期
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite" id="cpn6_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onkeypress="if (window.sfdcPage && window.sfdcPage.hasRun && event && event.keyCode==KEY_ENTER) sfdcPage.dblClickField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                tabindex="0">
                                                <div id="cpn6_ileinner">
                                                   </div>
                                            </td>
                                             <td class="labelCol empty">
                                                
                                            </td>
                                            <td class="dataCol empty" >
                                                
                                            </td>
                                        </tr>-->
                                       <tr>
                                            <td class="labelCol">
                                                内容
                                            </td>
                                            <td class="data2Col inlineEditWrite" colspan="3" id="cpn4_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onkeypress="if (window.sfdcPage && window.sfdcPage.hasRun && event && event.keyCode==KEY_ENTER) sfdcPage.dblClickField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                tabindex="0">
                                                <div id="cpn4_ileinner"><%=ContentBody%>
                                                    &nbsp;</div>
                                            </td>
                                        </tr>                                      
                                        <tr>
                                            <td class="labelCol">
                                                创建人
                                            </td>
                                            <td class="dataCol col02 inlineEditLock" id="CreatedBy_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);">
                                                <div id="CreatedBy_ileinner">
                                                     <a href="#"><%=CreatedByName%></a>, <%=CreatedOn%></div></div>
                                            </td>
                                            <td class="last labelCol">
                                                上次修改人
                                            </td>
                                            <td class="last dataCol inlineEditLock" id="LastModifiedBy_ilecell" onblur="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.clickField(event, this);"
                                                ondblclick="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.dblClickField(event, this);"
                                                onfocus="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);"
                                                onmouseout="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOutField(event, this);"
                                                onmouseover="if (window.sfdcPage && window.sfdcPage.hasRun) sfdcPage.mouseOverField(event, this);">
                                                <div id="LastModifiedBy_ileinner">
                                                     <a href="#"><%=ModifiedByName%></a>, <%=ModifiedOn%></div>
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
                                            <input value=" 保存 " class="btn" title="保存" style="display: none;" name="inlineEditSave"
                                                onclick="sfdcPage.save();" type="button" />
                                            <input value=" 取消 " class="btn" title="取消" style="display: none;" name="inlineEditCancel"
                                                onclick="sfdcPage.revert();" type="button" />
                                            <input value=" 编辑 " class="btn" title="编辑" name="edit" onclick="navigateToUrl('/091/e?id=<%=EntityId%>','DETAIL','edit');"
                                                type="button" />
                                            <input value=" 删除 " class="btn" title="删除" name="del" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?type=100202&delID=<%=EntityId%>&amp;retURL=%2F091%2Fo&amp;failRetURL=%2F70190000000uODU','DETAIL','del');"
                                                type="button" /><!--
                                            <input value=" 复制 " class="btn" title="复制" name="clone" onclick="navigateToUrl('/70190000000uODU/e?clone=1&amp;retURL=%2F70190000000uODU','DETAIL','clone');"
                                                type="button" />  -->
                                            <input value=" 预览 " class="btn" title="预览" name="prev" onclick="openPopupFocusEscapePounds('<%=PreviewURL%>', 'Prev', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" 
                                                type="button" />
                                            <div id="managedetailCopy" class="menuButton"><div id="managedetailCopyButton" class="menuButtonButton"><span tabindex="0" id="managedetailCopyLabel" class="menuButtonLabel">审批</span></div><div id="managedetailCopyMenu" class="menuButtonMenu"><a class="firstMenuItem menuButtonMenuLink" href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>',1);">审批发布</a><a class="menuButtonMenuLink" href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>',0);">审批不通过</a></div></div>
                                            <script>                                                new MenuButton('managedetailCopy', false);</script>
                                            <input value=" 消息提醒 " class="btn" title="消息提醒" name="noti" onclick="navigateToUrl('/msg/NotifyRelatedMem.aspx?t=091&type=100202&amp;id=<%=EntityId%>&retURL=%2F091%2Fdetail?id=<%=EntityId%>','DETAIL','noti');"
                                                type="button" />                                   
                                            <input value=" 分发到下级单位 " class="btn" title="分发到下级单位" name="distribute" onclick="distributeContent('<%=EntityId%>');"
                                                type="button" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script src="/static/111213/js/picklist.js"></script>
                        <script>                            //       new InlineEditData({ "entityId": "70190000000uODU", "sysMod": "148ee9a80c0", "fields": [{ "state": "NONE", "fieldId": "cpn15", "fieldType": "ENTITYID", "initialValue": ["liu jack", "0059000000390Wh"] }, { "state": "EDIT", "required": false, "fieldId": "cpn10", "fieldType": "CURRENCY", "initialValue": "11,400" }, { "state": "READONLY", "required": true, "fieldId": "cpn21", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn8", "fieldType": "CURRENCY", "initialValue": "3,000,000" }, { "state": "READONLY", "required": true, "fieldId": "cpn19", "fieldType": "INTEGER", "initialValue": "1" }, { "state": "NONE", "fieldId": "Parent", "fieldType": "ENTITYID", "initialValue": ["", "000000000000000"] }, { "state": "READONLY", "required": true, "fieldId": "cpn24", "fieldType": "CURRENCY", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn6", "hasTime": false, "fieldType": "DATEONLY", "initialValue": "2008-3-21" }, { "state": "READONLY", "required": true, "fieldId": "cpn17", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "READONLY", "required": true, "fieldId": "cpn22", "fieldType": "INTEGER", "initialValue": "0" }, { "fieldType": "DYNAMICENUM", "picklistId": "25", "initialValue": ["Completed", "Completed"], "state": "EDIT", "fieldId": "cpn3", "required": false }, { "state": "EDIT", "required": false, "fieldId": "cpn16", "fieldType": "BOOLEAN", "initialValue": true }, { "state": "READONLY", "required": true, "fieldId": "cpn20", "fieldType": "INTEGER", "initialValue": "0" }, { "fieldType": "DYNAMICENUM", "picklistId": "24", "initialValue": ["Webinar", "Webinar"], "state": "EDIT", "fieldId": "cpn2", "required": false }, { "state": "EDIT", "required": false, "fieldId": "cpn11", "fieldType": "PERCENT", "initialValue": "10.00" }, { "state": "READONLY", "required": true, "fieldId": "cpn18", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "maxLength": 80, "required": true, "fieldId": "cpn1", "fieldType": "TEXT", "initialValue": "GC Product Webinar - Jan 7, 2002" }, { "state": "EDIT", "required": false, "fieldId": "cpn9", "fieldType": "CURRENCY", "initialValue": "10,000" }, { "state": "EDIT", "maxLength": 32000, "required": false, "fieldId": "cpn4", "fieldType": "STRINGPLUSCLOB", "initialValue": "" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "required": true, "useNewLookups": false }, { "state": "EDIT", "required": false, "fieldId": "cpn13", "fieldType": "DOUBLE", "initialValue": "5,000" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "required": true, "useNewLookups": false }, { "state": "READONLY", "required": true, "fieldId": "cpn23", "fieldType": "CURRENCY", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn5", "hasTime": false, "fieldType": "DATEONLY", "initialValue": "2008-3-21"}], "_CONFIRMATIONTOKEN": "faeJ.W_rUe.HiNz.kh0GGErhYFjbG77nFx3uB39UjmmyTaug2Xj2JWgEwJtDC5IiDVBbWBYbqxAOjVMFg3IjwcZJDQKa6WLPcA0JwS4kp1i.GwHfWVUNH_A1ABD_39Vvr3RnvckzUaDjf2DFY1igizG.9t4=", "editable": true, "dynamicData": "/servlet/servlet.picklist?e=Campaign&h=iEeHeQtjS83kuX6210Yv8KziTG1YvnkgT8pX1h36QRQ%3D&v=1412752376000&layout=00h9000000RbNyc&ile=1&mo=READ&esc=HTML&l=zh_CN&pr=1.25&t=0" });</script>
                        <%=RelatedAttachmentListData%>
                                             
                        <!-- Begin RelatedListElement -->
                        <div class="bRelatedList" id="70190000000uODU_RelatedCampaignMemberList">
                            <a name="70190000000uODU_RelatedCampaignMemberList_target"></a>
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
                                                        alt="" class="relatedListIcon" title="" /><h3 id="70190000000uODU_RelatedCampaignMemberList_title">
                                                            已阅读成员</h3>
                                                </td>
                                                <td class="pbButton">
                                                    
                                                </td>
                                                <td class="pbHelp"><!--
                                                    <span class="help" title="已阅读成员 帮助 （新窗口）"><a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                        class="linkCol"><span class="linkSpan">已阅读成员帮助</span>
                                                        <img src="/s.gif" alt="已阅读成员 帮助 （新窗口）" class="helpIcon" title="市场活动成员 帮助 （新窗口）" /></a></span>-->
                                                     <select id="detectionValue" name="detectionValue"><option value="">--全部--</option><%=ReadDetectionOptions%></select><input value=" 搜 " class="btn" title="查询" name="srch" onclick="" type="button" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="pbBody" id="70190000000uODU_RelatedCampaignMemberList_body">
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th class="actionColumn" scope="col">
                                                    操作
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    姓名
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    邀请时间
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    阅读时间
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    回执内容
                                                </th>                                                
                                            </tr>
                                            <!-- ListRow --><!--
                                            <tr class=" dataRow even last first" onblur="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}"
                                                onmouseout="if (window.hiOff){hiOff(this);}" onmouseover="if (window.hiOn){hiOn(this);}">
                                                <td class='actionColumn'>
                                                  
                                                </td>
                                                <th scope="row" class=" dataCell  ">
                                                    <a href="/0039000001AK1Nd">联系人</a>
                                                </th>
                                                <td class=" dataCell  ">
                                                    Sent
                                                </td>
                                                <td class=" dataCell  ">
                                                    <a href="/00v9000000J6JSo">Arthur</a>
                                                </td>
                                                <td class=" dataCell  ">
                                                    <a href="/00v9000000J6JSo">Song</a>
                                                </td>                                               
                                            </tr>-->
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
                            <script>                                try { sfdcPage.registerRelatedList('70190000000uODU_RelatedCampaignMemberList', '1', '已阅读成员', false, '/70190000000uODU', 'relatedListId=RelatedCampaignMemberList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedCampaignMemberList'); } catch (e) { }</script>
                            <!-- End ListElement -->
                        </div>
                        <!-- End RelatedListElement -->
                           <!-- Begin RelatedListElement -->
                        <div class="bRelatedList" id="NotReaders_RelatedReadMembersList">
                            <a name="NotReaders_RelatedReadMembersList"></a>
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
                                                            未阅读成员</h3>
                                                </td>
                                                <td class="pbButton">
                                                    
                                                </td>
                                                <td class="pbHelp">
                                                     
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="pbBody" id="Div2">
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th class="actionColumn" scope="col">
                                                    操作
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    姓名
                                                </th>  
                                                  <th scope="col" class=" zen-deemphasize">
                                                    邀请时间
                                                </th>                                                                                            
                                            </tr>                                            
                                            <%=NotReadResultHTML%>
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
                            <script>                                try { sfdcPage.registerRelatedList('NotReaders_RelatedReadMembersList', '1', '未阅读成员', false, '/70190000000uODU', 'relatedListId=RelatedReadMembersList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedReadMembersList'); } catch (e) { }</script>
                            <!-- End ListElement -->
                        </div>
                        <!-- End RelatedListElement -->
                        <!--
                        <div class="fewerMore">
                            <div class="backToTop">
                                <a href="#skiplink" title="返回顶部">
                                    <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                            每一相关列表总是显示 <a href="/70190000000uODU?rowsperlist=10">
                                <img src="/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a> 项记录</div>-->
                      
                        <script>
                            //window.sfdcPage.appendToOnloadQueue(function () {
                            //});
                         </script>
                          <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F70190000000uODU&isAjaxRequest=1&renderMode=RETRO&nocache=1428476915604'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "3qo7dyW23tXLVgm5OTfFGZ6whIIQOK6GZntG85OkpTtOCdB8UIMf32tHBF313DGXm2.PAapU1wl5ZIdC.EcHbGFhwfJPn4NXa6b3B.50o3YmHkbNmeFni6LNDgiprGQyKpXLbBpt8V5UOpt_yBvjipiHn7FOj_1mMamHpp049R..7Efy1DxcuBxz2ws3k78.z.R_FQ=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
    </div>
    <!--<script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1428484082000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>-->
    <script defer="true" src="/jslibrary/1424969980000/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/1424969980000/sfdc/Zen.js"></script><!--
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1424969980000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1425578748000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    -->
</body>
</html>
<!-- page generation time: 414ms -->