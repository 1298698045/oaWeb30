<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcessDetail.aspx.cs"
    Inherits="WebClient.apps.wf.ProcessDetail" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程定义： <%=ProcessName%> ~ 高效协同</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
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
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/Business.js"></script>
     <script src="/js/workflowinstance.js"></script>
    <script>        window.sfdcPage = new DetailPage("70190000000WJru");
        UserContext.initialize({ "networkId": "", "labelLastModified": "1415122952000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-11-8 下午10:29", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Process';</script>
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
    <script src="/jslibrary/sfdc/Security.js"></script>
    <style>
        .popup-mask {
            position: fixed;
            background: url(/img/bgOverlayDialogBackground.png);
            background-color: transparent;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            z-index: 100;
        }
        body #iframe {
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 80%;
            left: 10%;
            top: 50%;
            margin-top: -310px;
            border-radius: 7px;
            display: none;
            height: 620px;
            border: 0;
        }
    </style>
    <link href="/template/css/indexStyle.css" rel="stylesheet" type="text/css" />
    <script src="../../js/CommonUtils.js"></script>
    <script type="text/javascript">
        function deleteprocess()
        {
            var processId=getQueryString('id');
            if (confirm('确定要删除吗？')) {
                ajaxMethodGetData('process.delete', { ProcessId: processId}, function (data) {
                    if (data.status == "1") {
                        alert("删除成功!");
                        window.location.href="/121/o";
                    }
                    else
                    {
                        alert(data.message);
                        window.location.reload();
                    }
                })
            }
        }
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2])); return null;
        }
        function linkObject()
        {
            //navigateToUrl('/setup/custent/ViewObject.aspx?setupid=CustomObjects&id=<%=EntityObjectId%>&retURL=%2F70190000000WJru','DETAIL','objDef');
            window.open('/setup/custent/ViewObject.aspx?setupid=CustomObjects&id=<%=EntityObjectId%>&retURL=%2F70190000000WJru',"ObjectView","")
        }
    </script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif campaignTab  detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div
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
                                            <!--
                                            <a href="/setup/ui/uiconfigrelatedlistsedit.aspx?retURL=%2F70190000000WJru&amp;id=Campaign"
                                                class="configLinks">自定义页面</a> | <a href="/layouteditor/layoutEditor.apexp?type=Campaign&amp;lid=00h9000000RbNyc&amp;retURL=%2F70190000000WJru"
                                                    class="configLinks">编辑布局</a> | <a href="javascript:printWin(%27/70190000000WJru/p?retURL=%2F70190000000WJru%27)"
                                                        class="configLinks" title="可打印视图 （新窗口）">可打印视图</a> | <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                            title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                                class="helpIcon" /></a>-->
                                        </div>
                                    </div>
                                    <div class="topics metadata" id="section_header" style="display: none">
                                        <script>                                            //                            chatter.getToolbox().setToken('');</script>
                                        <div class="topicsOnRecordPage">
                                            <div class="topics " id="topicContainer70190000000WJru" data-entityid="70190000000WJru"
                                                data-referrer="RECORD_PAGE" data-iswidget="true">
                                                <div class="view topic-widgetWithInfoBubble">
                                                    <a href="javascript: void(0);" class="editLink">单击添加主题</a> &nbsp;
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
                                                                            <a title="了解更多（新窗口）" href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);">了解更多</a>
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
                                        &nbsp;«&nbsp;<a href="/121/o">返回流程列表</a>
                                    </div>
                                </div>
                        <div class="RLPanelShadow" id="RLPanelShadow">
                            <div class="rls_top">
                                <div class="rls_tl"></div>
                                <div class="rls_tr"></div>
                            </div>
                            <div class="rls_l"></div>
                            <div class="rls_r"></div>
                            <div class="RLPanel" id="RLPanel" onblur="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onfocus="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onmouseout="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onmouseover="sfdcPage.getRelatedListPanel('RLPanel').showRL()">
                                <iframe frameborder="0" id="RLPanelFrame" name="RLPanelFrame" src="/emptyHtmlDoc.html" title="隐藏框架 - 忽略"></iframe>
                            </div>
                            <div class="rls_bottom">
                                <div class="rls_bl"></div>
                                <div class="rls_br"></div>
                            </div>
                        </div>
                        <div class="listHoverLinks"><span class="invisibleMinHeight">|</span></div>
                        <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               try { sfdcPage.registerRelatedListPanel('RLPanel', false); } catch (e) { }</script>
                        <div class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette" id="ep">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">流程详细信息</h2>
                                        </td>
                                        <td class="pbButton" id="topButtonRow">
                                            <input value=" 保存 " class="btn" title="保存" style="display: none;" name="inlineEditSave"
                                                onclick="sfdcPage.save();" type="button" />
                                            <input value=" 取消 " class="btn" title="取消" style="display: none;" name="inlineEditCancel"
                                                onclick="sfdcPage.revert();" type="button" />
                                            <input value=" 编辑 " class="btn" title="编辑" name="edit" onclick="navigateToUrl('/apps/wf/createWF.aspx?t=121&id=<%=ProcessId%>    ','DETAIL','edit');"
                                                type="button" />
                                            <%--<input value=" 删除 " class="btn" title="删除" name="del" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?delID=<%=ProcessId%>&amp;type=121&amp;retURL=%2F121%2Fo&failRetURL=%2F121%2Fo','DETAIL','del');"
                                                type="button" />--%>
                                            <input value=" 删除 " class="btn" title="删除" name="del" onclick="deleteprocess()" type="button" />
                                            <!--
                                            <input value=" 复制 " class="btn" title="复制" name="clone" onclick="navigateToUrl('/apps/wf/createWF.aspx?t=121&id=<%=ProcessId%>&clone=1&amp;retURL=%2F70190000000WJru','DETAIL','clone');"
                                                type="button" />-->
                                            <div class="menuButton" id="managedetail">
                                                <div class="menuButtonButton" id="managedetailButton"><span class="menuButtonLabel" id="managedetailLabel" tabindex="0">管理流程</span></div>
                                                <div class="menuButtonMenu" id="managedetailMenu"><a href="#" class="menuButtonMenuLink firstMenuItem" onclick="return publishWFProcess('<%=ProcessId%>',1);">发布流程</a><a href="#" onclick="javascript:return publishWFProcess('<%=ProcessId%>',0);" class="menuButtonMenuLink">停用流程</a></div>
                                            </div>
                                            <script>    new MenuButton('managedetail', false);</script>
                                            <input value=" 流程设计 " class="btn" title="流程设计" name="wfdesign" onclick="navigateToUrl('/apps/flowdesigner/editors/WFlowDesigner.aspx?id=<%=ProcessId%>','DETAIL','wfdesign');"
                                                type="button" />
                                            <input value=" 对象定义 " class="btn" title="对象定义" name="objDef" onclick="linkObject()"
                                                type="button" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div class="pbError" id="errorDiv_ep" style="display: none">
                                    错误：无效数据。<br />
                                    请查看下列所有错误消息以纠正数据。
                                </div>
                                <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="labelCol">流程所有人
                                            </td>
                                            <td class="dataCol col02" id="cpn15_ilecell">
                                                <%=CreatedByName%>
                                            </td>
                                            <td class="labelCol"></td>
                                            <td class="dataCol inlineEditLock">
                                                <div id="cpn17_ileinner">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol">流程名称
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite"
                                                tabindex="0">
                                                <div id="cpn1_ileinner">
                                                    <%=ProcessName%>
                                                </div>
                                            </td>
                                            <td class="labelCol">流程分类
                                            </td>
                                            <td class="dataCol inlineEditLock">
                                                <div id="cpn18_ileinner">
                                                    <%=FolderName%>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol">状态
                                            </td>
                                            <td class="dataCol col02 inlineEditWrite"
                                                tabindex="0">
                                                <div id="cpn3_ileinner">
                                                    <%=StateCodeName%>
                                                </div>
                                            </td>
                                            <td class="labelCol">关联对象                                             
                                            </td>
                                            <td class="dataCol inlineEditLock"><%=EntityObjectName%>                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol">创建人
                                            </td>
                                            <td class="dataCol col02 inlineEditLock">
                                                <div id="CreatedBy_ileinner">
                                                    <a href="#"><%=CreatedByName%></a>, <%=CreatedOn%>
                                                </div>
                                            </td>
                                            <td class="last labelCol">上次修改人
                                            </td>
                                            <td class="last dataCol inlineEditLock">
                                                <div id="LastModifiedBy_ileinner">
                                                    <a href="#"><%=ModifiedByName%></a>, <%=ModifiedOn%>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelCol">描述
                                            </td>
                                            <td class="data2Col inlineEditWrite" colspan="3"
                                                tabindex="0">
                                                <div id="cpn4_ileinner">
                                                    <%=Description%>
                                                    &nbsp;
                                                </div>
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
                                            <input value=" 编辑 " class="btn" title="编辑" name="edit" onclick="navigateToUrl('/apps/wf/createWF.aspx?t=121&id=<%=ProcessId%>    ','DETAIL','edit');"
                                                type="button" />
                                            <input value=" 删除 " class="btn" title="删除" name="del" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?delID=<%=ProcessId%>&amp;type=121&amp;retURL=%2F121%2Fo&failRetURL=%2F121%2Fo','DETAIL','del');"    type="button" />
                                            <div class="menuButton" id="managedetailbottom">
                                                <div class="menuButtonButton" id="managedetailbottomButton"><span class="menuButtonLabel" id="managedetailbottomLabel" tabindex="0">管理流程</span></div>
                                                <div class="menuButtonMenu" id="managedetailbottomMenu"><a href="#" class="menuButtonMenuLink firstMenuItem" onclick="return publishWFProcess('<%=ProcessId%>',1);">发布流程</a><a href="#" onclick="javascript:return publishWFProcess('<%=ProcessId%>',0);" class="menuButtonMenuLink">停用流程</a></div>
                                            </div>
                                            <script>    new MenuButton('managedetailbottom', false);</script>
                                            
                                            <!--                                             
                                            <input value=" 复制 " class="btn" title="复制" name="clone" onclick="navigateToUrl('/apps/wf/createWF.aspx?t=121&id=<%=ProcessId%>&clone=1&amp;retURL=%2F70190000000WJru','DETAIL','clone');"
                                                type="button" />
                                            <div class="menuButton" id="managedetailCopy"><div class="menuButtonButton" id="managedetailCopyButton"><span class="menuButtonLabel" id="managedetailCopyLabel" tabindex="0">管理成员</span></div><div class="menuButtonMenu" id="managedetailCopyMenu"><a href="/ui/campaign/CampaignManageMembersAddTab?campaignId=70190000000WJru" class="firstMenuItem menuButtonMenuLink">添加成员 – 搜索</a><a href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000WJru&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27); "  class="menuButtonMenuLink">添加成员 – 导入文件</a><a href="/ui/campaign/CampaignManageMembersExistingTab?campaignId=70190000000WJru"  class="menuButtonMenuLink">编辑成员 – 搜索</a><a href="javascript:openwizard(%27/setup/wiz/wizard.jsp?wizardUrl=%2Fcamp%2Fcampaignimport.jsp%3Fid%3D70190000000WJru&amp;wizardPageTitle=ImportWizardTitle%27, %27campaignImport%27, %271%27);"  class="menuButtonMenuLink">更新和添加成员 – 导入文件</a></div>
                                            </div>
                                            <script>    new MenuButton('managedetailCopy', false);</script>
                                            <input value=" 高级设置 " class="btn" title="高级设置" name="adv" onclick="navigateToUrl('/camp/campaignmemberstatusdetail.aspx?retURL=%2F70190000000WJru&amp;id=70190000000WJru','DETAIL','adv');"
                                                type="button" />-->
                                            <input value=" 流程设计 " class="btn" title="流程设计" name="wfdesign" onclick="navigateToUrl('/apps/flowdesigner/editors/WFlowDesigner.aspx?id=<%=ProcessId%>    ','DETAIL','wfdesign');"
                                                type="button" />
                                            <input value=" 对象定义 " class="btn" title="对象定义" name="objDef" onclick="navigateToUrl('/setup/custent/ViewObject.aspx?setupid=CustomObjects&id=<%=EntityObjectId%>    &retURL=%2F70190000000WJru','DETAIL','objDef');"
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
                        <input type="hidden" name="processId" id="processId" value="<%=Request["id"]%>" />
                        <script src="/static/js/picklist.js"></script>
                        <script>                            //   new InlineEditData({ "entityId": "70190000000WJru", "sysMod": "1492b552628", "fields": [{ "state": "NONE", "fieldId": "cpn15", "fieldType": "ENTITYID", "initialValue": ["liu jack", "0059000000390Wh"] }, { "state": "EDIT", "required": false, "fieldId": "cpn10", "fieldType": "CURRENCY" }, { "state": "READONLY", "required": true, "fieldId": "cpn21", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn8", "fieldType": "CURRENCY" }, { "state": "READONLY", "required": true, "fieldId": "cpn19", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "NONE", "fieldId": "Parent", "fieldType": "ENTITYID", "initialValue": ["", "000000000000000"] }, { "state": "READONLY", "required": true, "fieldId": "cpn24", "fieldType": "CURRENCY", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn6", "hasTime": false, "fieldType": "DATEONLY" }, { "state": "READONLY", "required": true, "fieldId": "cpn17", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "READONLY", "required": true, "fieldId": "cpn22", "fieldType": "INTEGER", "initialValue": "0" }, { "fieldType": "DYNAMICENUM", "picklistId": "25", "initialValue": ["Planned", "Planned"], "state": "EDIT", "fieldId": "cpn3", "required": false }, { "state": "EDIT", "required": false, "fieldId": "cpn16", "fieldType": "BOOLEAN", "initialValue": false }, { "state": "READONLY", "required": true, "fieldId": "cpn20", "fieldType": "INTEGER", "initialValue": "0" }, { "fieldType": "DYNAMICENUM", "picklistId": "24", "initialValue": ["Conference", "Conference"], "state": "EDIT", "fieldId": "cpn2", "required": false }, { "state": "EDIT", "required": false, "fieldId": "cpn11", "fieldType": "PERCENT", "initialValue": "0.00" }, { "state": "READONLY", "required": true, "fieldId": "cpn18", "fieldType": "INTEGER", "initialValue": "0" }, { "state": "EDIT", "maxLength": 80, "required": true, "fieldId": "cpn1", "fieldType": "TEXT", "initialValue": "双十一" }, { "state": "EDIT", "required": false, "fieldId": "cpn9", "fieldType": "CURRENCY" }, { "state": "EDIT", "maxLength": 32000, "required": false, "fieldId": "cpn4", "fieldType": "STRINGPLUSCLOB", "initialValue": "" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "required": true, "useNewLookups": false }, { "state": "EDIT", "required": false, "fieldId": "cpn13", "fieldType": "DOUBLE", "initialValue": "0" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "required": true, "useNewLookups": false }, { "state": "READONLY", "required": true, "fieldId": "cpn23", "fieldType": "CURRENCY", "initialValue": "0" }, { "state": "EDIT", "required": false, "fieldId": "cpn5", "hasTime": false, "fieldType": "DATEONLY"}], "_CONFIRMATIONTOKEN": "7.C8NS9emKrYBHQuMvsa6tfKZVFxLfaEWywk_Xq0Ki_mW5uWq.bnD_P.8w3xkZZAoDYkei809llV1_3o.pC9wmmE.Pv1e9aXqzWJCHDiKnyd6deY7LTz6oPCPKsNik0ktZh.bImFuvUQlUASPzaxwS2hzBI=", "editable": true, "dynamicData": "/servlet/servlet.picklist?e=Campaign&h=iEeHeQtjS83kuX6210Yv8KziTG1YvnkgT8pX1h36QRQ%3D&v=1412752376000&layout=00h9000000RbNyc&ile=1&mo=READ&esc=HTML&l=zh_CN&pr=1.25&t=0" });</script>
                        <!-- Begin RelatedListElement -->
                        <div class="first bRelatedList" id="70190000000WJru_RelatedCampaignHierarchyList">
                            <a name="70190000000WJru_RelatedCampaignHierarchyList_target"></a>
                            <!-- Begin ListElement -->
                            <!-- motif: Campaign -->
                            <!-- WrappingClass -->
                            <div class="listRelatedObject campaignBlock">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="pbTitle">
                                                    <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/s.gif"
                                                        alt="" class="relatedListIcon" title="" /><h3 id="70190000000WJru_RelatedCampaignHierarchyList_title">流程步骤</h3>
                                                </td>
                                                <td class="pbButton">&nbsp;
                                                </td>
                                                <td class="pbHelp">
                                                    <span class="help" title="流程步骤 帮助 （新窗口）"><a href="javascript:openPopupFocusEscapePounds('', 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                        class="linkCol"><span class="linkSpan">流程步骤帮助</span>
                                                        <img src="/s.gif" alt="流程步骤 帮助 （新窗口）" class="helpIcon" title="流程步骤 帮助 （新窗口）" /></a></span>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="pbBody" id="70190000000WJru_RelatedCampaignHierarchyList_body">
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th scope="col" class=" zen-deemphasize">操作
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">流程步骤
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">步骤代码
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">办理时限
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">办理人员
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">权限
                                                </th>
                                            </tr>
                                            <!-- ListRow -->
                                            <!--
                                            <tr class="parentRow dataRow even last first" onblur="if (window.hiOff){hiOff(this);}"
                                                onfocus="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}"
                                                onmouseover="if (window.hiOn){hiOn(this);}">
                                                <th scope="row" class=" dataCell  ">
                                                    <a href="/70190000000WJru">双十一</a>
                                                </th>
                                            </tr>-->
                                            <%=BodyText %>
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
                            <script>                                try { sfdcPage.registerRelatedList('70190000000WJru_RelatedCampaignHierarchyList', '1', ' 流程步骤', false, '/70190000000WJru', 'relatedListId=RelatedCampaignHierarchyList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedCampaignHierarchyList'); } catch (e) { }</script>
                            <!-- End ListElement -->
                        </div>
                        <!-- BEGIN ListElement -->
                        <div id="70190000000uODU_RelatedCampaignMemberList" class="bRelatedList">
                            <a name="70190000000uODU_RelatedCampaignMemberList_target"></a>
                            <!-- Begin ListElement -->

                            <!-- motif: Campaign -->
                            <script type="text/javascript">
                                var dialogs = {};
                                function showCustomDialog(url, dialogName, dialogTitle, height, width) {
                                    var c = b = null;
                                    c = dialogName; // "notifyInstance";
                                    //debugger;
                                    b = url;
                                    var dialog = null;
                                    //var dialog = new CollaborationAccessibleDialog(c, '催办', b, 450, 530);
                                    if (!dialogs[c]) {
                                        dialog = new NonaccessibleDialog(c, dialogTitle, b, height, width); //CollaborationAccessibleDialog
                                        dialogs[c] = dialog;
                                    }
                                    else {
                                        dialog = dialogs[c];
                                        dialog.url = b;
                                    }
                                    dialog.display();
                                }
                                function showParticipantor(procId,stepId,stepCode)
                                {
                                    $('#iframe').show().attr('src','/_ui/common/data/wflowPeoplePicker.html?ProcessId='+procId+'&StepId='+stepId+'&StepCode='+stepCode)
                                    $('.popup-mask').show()
                                }
                                function previewParticipantor(procId,stepId,stepCode)
                                {
                                    $('#iframe').show().attr('src','/wfbuilder/stepParticipantorlst.aspx?ProcessId='+procId+'&StepId='+stepId+'&StepCode='+stepCode)
                                    $('.popup-mask').show()
                                }
                                function showCondition(ruleId,procId,ruleCode)
                                {
                                    //showCustomDialog("/apps/wf/ProcRuleCondition.aspx?ruleid="+ruleId+"&processId="+procId,"showCondition","设置条件",500,780);
                                    $('.popup-mask').show()
                                    $('#iframe').show().attr('src','/alert/wf/ProcRuleCondition.html?ProcessId='+procId+'&RuleCode='+ruleCode+'&RuleId='+ruleId)
                                }
                            </script>
                            <!-- WrappingClass -->
                            <div class="listRelatedObject campaignmemberBlock">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3 id="70190000000uODU_RelatedCampaignMemberList_title">流程规则</h3>
                                                    </td>
                                                    <td class="pbButton">                                                        
                                                    </td>
                                                    <td class="pbHelp"><!--<span title="市场活动成员 帮助 （新窗口）" class="help"><a class="linkCol" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"><span class="linkSpan">市场活动成员帮助</span>
                                                        <img title="市场活动成员 帮助 （新窗口）" class="helpIcon" alt="市场活动成员 帮助 （新窗口）" src="/s.gif"></a></span>--></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="70190000000uODU_RelatedCampaignMemberList_body" class="pbBody">
                                        <table cellspacing="0" cellpadding="0" border="0" class="list">
                                            <tbody>
                                                <tr class="headerRow">
                                                    <th scope="col" class="actionColumn">操作</th>
                                                    <th class=" zen-deemphasize" scope="col">规则名称</th>
                                                    <th class=" zen-deemphasize" scope="col">规则</th>
                                                    <th class=" zen-deemphasize" scope="col">规则状态</th>                                                   
                                                </tr>    
                                                <%=RuleHTML%>                                         
                                                <!--
                                                <tr onmouseover="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}" onblur="if (window.hiOff){hiOff(this);}" class="dataRow odd last">
                                                    <td class="actionColumn"><a title="编辑 - 记录 2 - 潜在客户" class="actionLink" href="/00v9000000Ms7FE/e?retURL=%2F70190000000uODU">编辑</a>&nbsp;|&nbsp;<a title="删除 - 记录 2 - 潜在客户" onclick="return window.confirm('是否确定？');" class="actionLink" href="/setup/own/deleteredirect.jsp?delID=00v9000000Ms7FE&amp;retURL=%2F70190000000uODU&amp;_CONFIRMATIONTOKEN=VmpFPSxNakF4TlMweE1TMHhObFF3TXpvek1EbzFNeTQxTWpaYSxFdnVpMmJMY3BpdnZtSkpuN1NXcmdnLE9HUTBaVGt4">删除</a></td>
                                                    <th class=" dataCell  " scope="row"><a href="/00Q9000000WCMKF">潜在客户</a></th>
                                                    <td class=" dataCell  ">Sent</td>
                                                    <td class=" dataCell  "><a href="/00v9000000Ms7FE">Andy</a></td>
                                                    <td class=" dataCell  "><a href="/00v9000000Ms7FE">Young</a></td>
                                                    <td class=" dataCell  ">SVP, Operations</td>
                                                    <td class=" dataCell  ">Dickenson plc</td>
                                                </tr>-->
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <script>try { sfdcPage.registerRelatedList('70190000000uODU_RelatedCampaignMemberList', '2', '流程规则', false, '/70190000000uODU', 'relatedListId=RelatedCampaignMemberList&amp;hideDL=1&amp;noh=1&amp;keepPref=1',false,false, true, 'RelatedCampaignMemberList');} catch(e) {}</script>
                            
                            
                            <!-- End ListElement -->
                        </div>
                        <!-- End ListElement -->

                           <div id="addMemberContainer" style="display:block">
                                <table>
                                    <tr>
                                        <td nowrap="nowrap">
                                           
                                                             <select id="select3" class=" hidden" multiple="multiple" name="select3[]">
                                                             </select></td> <td>
                                                             <input type="button" value="共享添加" onclick="addMembers()" class="btn" /> 
                                                                 
                                            
                                         
                                           
                                            <script type="text/javascript">
                                                function addMembers() {
                                                    var objType = jQuery("#sharing_search").val();//类型
                                                    var entityId = jQuery("#processId").val();
                                                    var obj = jQuery("#select3").val();
                                                    //alert(obj);
                                                    addInstanceAccess(entityId, objType, obj, 32, function A1() {
                                                        window.location.reload();
                                                    });
                                                    //select3
                                                }
                                                function switchType(val)
                                                {
                                                    $("#select3").fcbkcomplete.json_url = "/apps/CommandProcessor.ashx?cmd=email.user.searchusers&objectType=" + val;
                                                    //alert($("#select3").fcbkcomplete.json_url);
                                                }
                                                $(document).ready(function () {
                                                    $("#select3").fcbkcomplete({
                                                        //$("#select3").fcbkcomplete({
                                                        json_url: "/apps/CommandProcessor.ashx?cmd=email.user.searchusers&objectType=",// + document.getElementById("sharing_search").value,
                                                        complete_text: "请录入 用户姓名，用户名，角色名，小组名，科室名称...",
                                                        addontab: true,
                                                        maxitems: 8,
                                                        height: 8,
                                                        cache: true
                                                    });
                                                });

                                                var folderId = jQuery("#processId").val();

                                                if (folderId) {
                                                    //alert(folderId);
                                                    jQuery("#RelatedActivityMemberList").show();
                                                    jQuery("#addMemberContainer").show();
                                                    //document.getElementById("RelatedActivityAttachmentList").style.display = "none";
                                                }
                                            </script>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div id="RelatedActivityMemberList" class="bRelatedList last" style="display: block">
                                <a name="RelatedActivityAttachmentList_target"></a>
                                <!-- Begin ListElement -->
                                <link class="user" href="/CSS/email.css" rel="stylesheet" type="text/css" />
                                <script src="/js/jquery/jquery.fcbkcomplete.js" type="text/javascript"></script>
                                <!-- motif: Event -->
                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img width="12" height="1" title="" style="margin-right: 0.25em;" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3 id="RelatedMemberList_title">流程数据管理权限</h3>
                                                        </td>
                                                        <td class="pbButton">
                                                           
                                                        </td>
                                                        <td class="pbHelp">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="RelatedActivityAttachmentList_body" class="pbBody">
                                            <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                <tbody>
                                                    <!--
                                                    <tr class="headerRow">
                                                        <th class="noRowsHeader" scope="col">没有可显示的记录</th>
                                                    </tr>-->
                                                    <tr class="headerRow">
                                                        <th class="actionColumn" scope="col">操作</th>
                                                        <th scope="col" class=" zen-deemphasize">类型</th>
                                                        <th scope="col" class=" zen-deemphasize">名称</th>
                                                        <th scope="col" class=" zen-deemphasize">权限<div id="sharingPermissionsHelpText" class="mouseOverInfoOuter" onfocus="addMouseOver(this)" onmouseover="addMouseOver(this)">
                                                            <img class="infoIcon" src="/s.gif" alt="" title="">
                                                            <div class="mouseOverInfo" style="display: none; opacity: -0.2; left: 16px; bottom: -25px;">
                                                            </div>
                                                        </th>
                                                    </tr>
                                                    <%=MembersHTML%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav"></div>
                                <script>                                    //try { sfdcPage.registerRelatedList('RelatedActivityAttachmentList', '0', '管理与查看人员', false, '/00U/e?retURL=%2Fhome%2Fhome.jsp', 'retURL=%2Fhome%2Fhome.jsp&amp;relatedListId=RelatedActivityAttachmentList&amp;hideDL=1&amp;noh=1&amp;keepPref=1', false, false, true, 'RelatedActivityAttachmentList'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>

                        <!-- End RelatedListElement -->
                        <script>                   
                            window.sfdcPage.appendToOnloadQueue(function () {
                                //DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Campaign&setupid=CampaignFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Campaign&retURL=%2F70190000000WJru&setupid=CampaignFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Campaign", "newUrl": "/01I/e?retURL=%2F70190000000WJru&setupid=Campaign", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F70190000000WJru&tableEnumOrId=Campaign&setupid=CampaignValidations", "newUrl": "/03d/e?retURL=%2F70190000000WJru&TableEnumOrId=Campaign&Active=1&setupid=CampaignValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=Campaign&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=Campaign&et=QUICK_CREATE&retURL=%2F70190000000WJru&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3M/e?retURL=%2F70190000000WJru&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑布局", "hoverText": "自定义此页面布局", "url": "/layouteditor/layoutEditor.apexp?type=Campaign&lid=00h9000000RbNyc&retURL=%2F70190000000WJru&setupid=CampaignLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                //new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2F70190000000WJru");
                            });</script>
                        <!-- Body events -->
                        <script type="text/javascript">                       
                            function bodyOnLoad() {
                                //SfdcApp.TopicsFeed.setupHandlers('topicContainer70190000000WJru'); 
                                setFocusOnLoad();
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                //if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([1415281500000, 1415367900000], false, false); };
                                if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };
                                //if (this.loadChatFrameJs) loadChatFrameJs();
                                //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                //SfdcApp.MruHovers.global_data.url = 'retURL=%2F70190000000WJru&isAjaxRequest=1&renderMode=RETRO&nocache=1415456991337';
                                if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
                                if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                        </select>
                            </div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">今天</a>
                                </div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <div class="popup-mask"></div>
    <iframe id="iframe" frameborder="0"></iframe>
    <!--<script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1415464166000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>-->
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
    <script src="/js/alert.js"></script>
    <!--<script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
</body>
</html>
<!-- page generation time: 395ms -->