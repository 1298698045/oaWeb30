<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebClient.apps.wf._default" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>工作流定义: 主页 ~ .com - Professional Edition</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/Campaign.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/XslGrid.js"></script>
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-21 下午3:21", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif campaignTab  overviewPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="outer">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                            <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                        </td>
                        <td id="bodyCell" class="oRight">
                            <!-- Start page content -->
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                                        <div class="ptBody">
                                            <div class="content">
                                                <img title="工作流" class="pageTitleIcon" alt="工作流" src="/s.gif"><h1 class="pageType">
                                                    工作流<span class="titleSeparatingColon">:</span></h1>
                                                <h2 class="pageDescription">
                                                    主页</h2>
                                                <div class="blank">
                                                    &nbsp;</div>
                                            </div>
                                            <div class="links">
                                                <a title="了解详细信息！ （新窗口）" class="configLinks zen-deemphasize" href="#">了解详细信息！</a>
                                                | <a title="此页面的帮助 （新窗口）" href="#"><span class="helpLink">此页面的帮助</span><img class="helpIcon"
                                                    alt="" src="/s.gif"></a></div>
                                        </div>
                                        <div class="ptBreadcrumb">
                                        </div>
                                    </div>
                            <div class="filterOverview">
                                <form onsubmit="if (window.ffInAlert) { return false; }" name="filter_element" method="GET"
                                id="filter_element" action="/121/filter">
                                <div class="bFilterView">
                                    <span class="bFilter">
                                        <label style="text-align: left; font-weight: bold; padding-right: .69em;" for="fcf">
                                            <span class="requiredMark">*</span>视图：</label><span class="fBody"><select title="视图："
                                                onchange="javascript:this.form.submit();" name="fcf" id="fcf"><!--<option selected="selected"
                                                    value="00B90000008KS9g">全部已启用市场活动</option>
                                                <option value="00B90000008KSA0">我的已启用市场活动</option>-->
                                                <%=Fcfs%>
                                            </select>
                                                <input type="button" title="转至！" onclick="javascript:this.form.submit();" name="go"
                                                    class="btn" value=" 转至！ "></span><!--<span class="fFooter"><a href="/ui/list/FilterEditPage?id=00B90000008KS9g&amp;retURL=%2F701&amp;cancelURL=%2F701%2Fo">编辑</a>
                                                        | <a href="/ui/list/FilterEditPage?ftype=0&amp;retURL=%2F701&amp;cancelURL=%2F701%2Fo">
                                                            新建视图</a></span>--></span></div>
                                </form>
                            </div>
                            <!-- Begin RelatedListElement -->
                            <div class="bRelatedList">
                                <!-- Begin ListElement -->
                                <!-- motif: Campaign -->
                                <!-- WrappingClass -->
                                <div class="hotListElement">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="hotlist" method="GET"
                                            id="hotlist" action="/121/o">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img width="12" height="1" style="margin-right: 0.25em;" title="" class="minWidth"
                                                                alt="" src="/s.gif" />&nbsp;<h3>
                                                                    最近工作流</h3>
                                                        </td>
                                                        <td class="pbButton">
                                                            <input type="button" title="新建" onclick="navigateToUrl('/apps/wf/createWF.aspx?t=121&retURL=/121/o',null,'new');"
                                                                name="new" class="btn" value=" 新建 " />
                                                        </td>
                                                        <td class="pbHelp">
                                                            <select title="显示所选内容" onchange="submit();" name="hotlist_mode" id="hotlist_mode">
                                                                <option selected="selected" value="1">最近创建</option>
                                                                <option value="2">最近修改</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </form>
                                        </div>
                                        <div class="pbBody" id="gridContainer">
                                            <!--
                                            <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                <tbody>
                                                    <tr class="headerRow">
                                                        <th class="noRowsHeader" scope="col">
                                                            无最近记录。单击“转至”或从下拉列表中选择视图来显示记录。
                                                        </th>
                                                    </tr>
                                                </tbody>
                                            </table>-->
                                            <%=BodyText %>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav">
                                </div>
                                <!-- End ListElement -->
                            </div>
                            <!-- End RelatedListElement -->
                            <table id="toolsContent" class="toolsContent">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="toolsContentLeft">
                                                <!--
                                                <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                    <h3 class="lbHeader">
                                                        报表</h3>
                                                    <div class="lbBody">
                                                        <ul>
                                                            <li><a href="/00O?rt=28&amp;retURL=%2F00Q%2Fo&amp;scope=user&amp;sdate=2014-12-14&amp;s=AM&amp;c=CD&amp;c=LS&amp;c=FN&amp;c=LN&amp;c=LU&amp;c=CA&amp;c=CND&amp;c=SU&amp;c=OW&amp;c=OP&amp;c=OA&amp;c=CLD&amp;c=OO&amp;details=yes">
                                                                潜在客户有效期</a></li><li><a href="/00O?rt=20&amp;retURL=%2F00Q%2Fo&amp;function=c&amp;date=d&amp;break0=LEAD_SOURCE&amp;new_break=LEAD_SOURCE&amp;pivot=STATUS&amp;scope=user&amp;colDt=CREATED_DATE&amp;sdate=2014-12-14&amp;hidden=STREET_LINE1&amp;hidden=STREET_LINE2&amp;hidden=STREET_LINE3&amp;hidden=ANNUAL_REVENUE.CONVERT&amp;t=title_LeadsBySourceReport&amp;details=no&amp;format=t">
                                                                    潜在客户（按来源）</a></li><li><a href="/00O?rt=21&amp;retURL=%2F00Q%2Fo&amp;pc0=EMAIL_BOUNCED_REASON&amp;pn0=ne&amp;pv0=&amp;sort=EM&amp;c=FN&amp;c=LN&amp;c=CO&amp;c=EM&amp;c=OW&amp;c=EMAIL_BOUNCED_REASON&amp;c=EMAIL_BOUNCED_DATE&amp;details=yes">
                                                                        已退回的潜在客户</a></li></ul>
                                                    </div>
                                                    <div class="lbBody">
                                                        <div class="mainLink">
                                                            <a href="/00O/o?entityType=00O">转至报表</a>&nbsp;»</div>
                                                    </div>
                                                </div>-->
                                                <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                    <h3 class="lbHeader">
                                                        相关</h3>
                                                    <div class="lbBody">
                                                        <ul>
                                                            <li><span><a href="/setup/custent/CustomObjectsPage.aspx?setupid=CustomObjects&retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevTools">
                                                                对象定义</a></span></li><li><span><a href="/category/datacategoryList.aspx?retURL=%2F121%2Fo&setupid=CustomObjects&dataCategory=121">
                                                                    流程分类</a></span></li><li>
                                                                        <!--
                                                                    <span><a href="/p/own/BulkTransfer?retURL=%2F00Q%2Fo&amp;ent=Lead">转移潜在客户</a></span></li><li>
                                                                        <span><a href="/ui/massmail/MassMailStageManager?setupid=MassMailFilter&amp;mm_type=Lead&amp;wizardRetUrl=%2F00Q%2Fo">
                                                                            批量发送电子邮件潜在客户</a></span></li><li><span><a href="/ui/campaign/MassAddCampaignMembersWizard?macmw_type=Lead&amp;macmw_mode=Add&amp;wizardRetUrl=%2F00Q%2Fo">
                                                                                将潜在客户批量添加至市场活动</a></span></li>-->
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="toolsContentRight">
                                                <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                    <h3 class="lbHeader">
                                                        流程设置</h3>
                                                    <div class="lbBody">
                                                        <ul>
                                                            <li><span><a href="/apps/wf/UserSignatureList.aspx?t=121">
                                                                签名</a> </span></li>
                                                            <li><span><a href="/apps/files/Templatelist.aspx?setupid=WfDocumentTemplate">
                                                                模板（正文、套红）</a> </span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <script type="text/javascript">
                                window.sfdcPage.appendToOnloadQueue(function () {
                                    //DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Campaign&amp;setupid=CampaignFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Campaign&amp;retURL=%2F701%2Fo&amp;setupid=CampaignFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Campaign", "newUrl": "/01I/e?retURL=%2F701%2Fo&amp;setupid=Campaign", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F701%2Fo&amp;tableEnumOrId=Campaign&amp;setupid=CampaignValidations", "newUrl": "/03d/e?retURL=%2F701%2Fo&amp;TableEnumOrId=Campaign&amp;Active=1&amp;setupid=CampaignValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017Abi/e?retURL=%2F701%2Fo&amp;setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑列", "hoverText": "自定义此列表中的列", "url": "/p/setup/layout/ListLayoutEdit?LayoutEntity=Campaign&amp;retURL=%2F701%2Fo&amp;LayoutType=KeyList&amp;setupid=CampaignSearchLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                    //new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Fsection%253DDev_Tools%2526target%253Ddev_quick_access_menu.htm%2526loc%253Dhelp%2526language%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&amp;amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&amp;retURL=%2F701%2Fo");
                                });
                            </script>
                            <!-- Body events -->
                            <script type="text/javascript">
                                function bodyOnLoad() {
                                    if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                    //if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                                    if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };
                                    //if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                    //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    //SfdcApp.MruHovers.global_data.url = 'retURL=%2F701%2Fo&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1411284110767';
                                    if (document.getElementById('sidebarDiv')) {
                                        Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                    };
                                    //if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                                }
                                function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                                function bodyOnFocus() { closePopupOnBodyFocus(); }
                                function bodyOnUnload() { }
                            </script>
                            <!-- End page content -->
                            <input name="queryid" id="queryid" value="0531EACB-8701-4398-A16F-4C0A6F7CDD3C" type="hidden" />
                            <script type="text/javascript">
                                /*
                                Load data
                                */
                                /*
                                jQuery(document).ready(function () {
                                var queryid = jQuery("#queryid").val();
                                itemGrid = new entityGrid(jQuery('#gridContainer'), queryid);
                                itemGrid.orderField = "ModifiedOn";
                                itemGrid.orderDirection = "desc";
                                itemGrid.queryCondition = "";
                                itemGrid.getTotalRecords();
                                itemGrid.loadData();
                                });
                                */
                            </script>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>
