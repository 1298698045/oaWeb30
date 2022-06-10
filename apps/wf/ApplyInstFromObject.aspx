<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyInstFromObject.aspx.cs" Inherits="WebClient.apps.wf.ApplyInstFromObject" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程事务: 启动流程 ~ .com - Professional Edition</title>
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/elements.css">
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/common.css" rel="stylesheet"
        type="text/css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/dCustom0.css" rel="stylesheet"
        type="text/css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-09-25 下午3:21", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-MM-dd ah:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
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
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/Business.js"></script>
</head>
<body class="hasMotif Custom18Tab massAddCampaignMemberWiz MassAddCampaignMembersSelectCampaignStage sfdcBody brandQuaternaryBgr"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
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
                                                <img title="启动流程" class="pageTitleIcon" alt="启动流程" src="/s.gif" /><h1 class="pageType noSecondHeader">
                                                    事务管理：启动流程</h1>
                                                <div class="blank">
                                                    &nbsp;</div>
                                            </div>
                                            <div class="links"><!--
                                                <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds('', false, false);">
                                                    <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif" /></a>--></div>
                                        </div>
                                        <div class="ptBreadcrumb">
                                        </div>
                                    </div>
                            <br />
                            <script type="text/javascript">
                                function refreshProcessPage(val) {
                                    getAllWfProcess(fillCategory, val);
                                }
                                function selectProcess(ele) {
                                    var name = jQuery(ele).attr("processname");
                                    var curUser = jQuery("#curentUser").val();
                                    jQuery("#instanceName").val(name + " " + curUser);
                                }
                                function fillCategory(data) {
                                    var html = "";
                                    for (var i = 0; i < data.length; i++) {
                                        var item = data[i];
                                        if ((i % 2) == 0)
                                            html += "<tr class=\" dataRow even\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";
                                        else
                                            html += "<tr class=\" dataRow odd\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";


                                        html += "<td class=\" dataCell  \" scope=\"row\">";
                                        html += " <a title=\"预览 （新窗口）\" class=\"actionLink\" href=\"javascript:openPopupFocus('/apps/flowdesigner/editors/monitor2.aspx?schemeId=" + item.id + "', 'monitor', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false)\">预览</a></td>";

                                        html += " <td class=\"dataCell\">";
                                        html += "<input name=\"pr_template_id\" id=\"pr_template_idc" + item.id + "\" type=\"radio\" checked=\"\" value=\"" + item.id + "\" processname=\"" + item.name + "\" onclick='selectProcess(this)'><label for=\"pr_template_id" + item.id + "\">";
                                        html += item.name + "</label></td>";

                                        //html += " <td class=\"dataCell\"></td>";
                                        html += " <td class=\"dataCell\"></td>";
                                        html += "</tr>";
                                    }
                                    jQuery("#bodyList").html(html);
                                }
                            </script>
                            <form onsubmit="if (window.ffInAlert) { return false; } if (this.submitted) { return false; } this.submitted = true;"
                            name="stageForm" method="POST" id="stageForm" action="ApplyInstFromObject.aspx">
                            <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <input type="hidden" value="1" id="currentStage" name="currentStage" />
                            <!--<input type="hidden" value="C" id="ftype" name="ftype" />
                            <input type="hidden" value="" id="id_fcf" name="id_fcf" />-->
                            <input type="hidden" value="false" id="msl_selectAll" name="msl_selectAll" />
                            <input type="hidden" value="7" id="msl_totalRowCount" name="msl_totalRowCount" />
                            <input type="hidden" value="" id="msl_totalRowCountFilter" name="msl_totalRowCountFilter" />
                            <input type="hidden" value="250" id="recipient_limit" name="recipient_limit" />
                            <input type="hidden" value="" id="selectedIds" name="selectedIds" />
                            <input type="hidden" value="<%=UserName%>" id="curentUser" name="curentUser" />
                            <div class="bWizardBlock tertiaryPalette">
                                <div class="pbWizardTitle tertiaryPalette brandTertiaryBgr">
                                    <div class="ptRightTitle">
                                        第 1 步，共 2 步
                                    </div>
                                    <h2>
                                        步骤 1. 选择流程模版
                                    </h2>
                                </div>
                                <div class="pbBody">
                                    <div class="pbWizardHeader">
                                        <div style="white-space: nowrap" class="pbTopButtons">
                                            <!--<input type="submit" title="上一页" name="goPrevious" class="btn" value=" 上一页 ">&nbsp;-->
                                            <input type="submit" title="下一页" name="goNext" class="btn" value=" 下一步 " /><!--<input
                                                type="submit" title="取消" name="cancel" class="btnCancel" value=" 取消 " />-->
                                        </div>
                                    </div>
                                    <div class="pbJumpTo">
                                    </div>
                                    <div class="pbDescription ">
                                        请选择要使用的流程模版。要创建新模板，必须退出过程，然后在"工作流"部分创建新模板。
                                    </div>
                                    <div class="pbWizardBody">
                                        <input type="hidden" value="MassMailFilter" name="setupid" id="setupid_templateSelector">
                                        <input id="queryid" value="71DADB04-2D30-48B0-AAB3-E0FDF996AAA9" type="hidden" />
                                        <div>
                                            <div class="pbSubsection">
                                                <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                                    <tbody>
                                                        <tr>
                                                            <td class="labelCol requiredInput">
                                                                <label for="macmw_campaignName">
                                                                    <span class="requiredMark">*</span>对象：</label>
                                                            </td>
                                                            <td colspan="3">
                                                                 <input id="objectId1" name="objectId1" value="<%=ObjectId%>" type="hidden" />
                                                              <b style="font-size:14px;">  <%=ObjectName%></b>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td style="height: 10px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="labelCol requiredInput">
                                                                <label for="macmw_campaignName">
                                                                    <span class="requiredMark">*</span>标题：</label>
                                                            </td>
                                                            <td class="data2Col">
                                                                <div class="requiredInput">
                                                                    <div class="requiredBlock">
                                                                    </div>
                                                                    <input type="text" name="instanceName" id="instanceName"  value="" style="width: 400px;height:20px;" />
                                                                </div>
                                                            </td>
                                                            <td class="labelCol requiredInput">
                                                                <label for="macmw_memberStatusEnum">
                                                                    <span class="requiredMark">*</span>办理时限：</label>
                                                            </td>
                                                            <td class="data2Col">
                                                                <div class="requiredInput">
                                                                    <div class="requiredBlock">
                                                                    </div>
                                                                    <input type="text" value="3" name="instanceDeadline" id="instanceDeadline" style="width: 50px;height:20px;" />天
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="labelCol requiredInput"  style="height: 10px"><!--<span class="requiredMark">*</span>身份选择-->
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="labelCol requiredInput">
                                                                <label for="deptId">
                                                                    <span class="requiredMark">*</span>部门：</label>
                                                            </td>
                                                            <td class="data2Col" colspan="3">
                                                                <%=BusinessUnitIdControlHtml%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                        <td class="labelCol requiredInput">
                                                                <label for="macmw_campaignName">
                                                                    <span class="requiredMark">*</span>级别：</label>
                                                            </td>
                                                            <td class="data2Col">
                                                                <div class="requiredInput">
                                                                    <div class="requiredBlock">
                                                                    </div>
                                                                    <select name="priority" id="priority">
                                                                        <option value="0">普通</option>
                                                                          <option value="1">晋急</option>
                                                                          <option value="2">加急</option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                            </tr>
                                                        <tr>
                                                            <td style="height: 10px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="labelCol last">
                                                                <label for="macmw_campaignName">
                                                                    描述：</label>
                                                            </td>
                                                            <td class="data2Col last" colspan="3">
                                                                <div class="requiredInput">
                                                                    <div class="requiredBlock">
                                                                    </div>
                                                                    <textarea rows="3" cols="50" id="desc" name="desc"></textarea>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="bFilterView"><!--
                                            <span class="bFilter">
                                                <label style="text-align: left; font-weight: bold; padding-right: .69em;" for="fcf_templateSelector">
                                                    <span class="requiredMark">*</span>流程分类</label><span class="fBody"><select onchange="refreshProcessPage(this.value)"
                                                        name="fcf" id="fcf_templateSelector" style="height:25px; font-size:14px;">
                                                        <option value="">所有分类</option>                                                      
                                                        <%=WFCategory%>
                                                    </select></span><span class="fFooter"><a href="/121/o">创建流程模板</a></span></span>--></div>
                                        <!-- Begin ListElement -->
                                        <!-- motif: Contact -->
                                        <!-- WrappingClass -->
                                        <div class="listRelatedObject contactBlock">
                                            <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                                <div class="pbHeader">
                                                </div>
                                                <div class="pbBody" id="gridContainer">
                                                    <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                            <thead>
                                                            <tr class="headerRow">
                                                                <th class=" zen-deemphasize" scope="col">
                                                                    预览
                                                                </th>
                                                                <th class=" zen-deemphasize" scope="col">
                                                                    模版名称
                                                                </th>
                                                                <th class=" zen-deemphasize" scope="col">
                                                                    类型
                                                                </th><!--
                                                                <th class=" zen-deemphasize" scope="col">
                                                                    描述
                                                                </th>-->
                                                            </tr></thead>
                                                            <tbody id="bodyList">
                                                             <%=BodyText%>
                                                            <!-- ListRow -->
                                                            </tbody>
                                                            <!--
                                                            <tr onmouseover="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}"
                                                                onfocus="if (window.hiOn){hiOn(this);}" onblur="if (window.hiOff){hiOff(this);}"
                                                                class="dataRow even first">
                                                                <th class=" dataCell  " scope="row">
                                                                    <a title="预览 （新窗口）" href="javascript:openPopupFocus%28%27%2F00X90000001lGV5%2Fs%3FTemplateType%3D0%26ids%3D00X90000001lGV5%26id%3D00X90000001lGV5%26previewMode%3D1%26retURL%3D%252Fui%252Fmassmail%252FMassMailStageManager%27%2C%20%27_blank%27%2C%20620%2C%20430%2C%20%27width%3D620%2Cheight%3D430%2Cresizable%3Dyes%2Ctoolbar%3Dyes%2Cstatus%3Dyes%2Cscrollbars%3Dyes%2Cmenubar%3Dyes%2Cdirectories%3Dyes%2Clocation%3Dno%2Cdependant%3Dno%27%2C%20false%2C%20true%29%3B">
                                                                        预览</a>
                                                                </th>
                                                                <td class=" dataCell  ">
                                                                    <input type="radio" value="00X90000001lGV5" name="mm_template_id" id="mm_template_id00X90000001lGV5"
                                                                        checked="checked"><label for="mm_template_id00X90000001lGV5">Contact: Follow Up (SAMPLE)</label><script> document.getElementById("mm_template_id00X90000001lGV5").checked = true;</script>
                                                                </td>
                                                                <td class=" dataCell  ">
                                                                    文本
                                                                </td>
                                                                <td class=" dataCell  ">
                                                                    Follow up on meeting
                                                                </td>
                                                            </tr>                                                                                                                       
                                                            <tr onmouseover="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}"
                                                                onfocus="if (window.hiOn){hiOn(this);}" onblur="if (window.hiOff){hiOff(this);}"
                                                                class=" dataRow even last">
                                                                <th class=" dataCell  " scope="row">
                                                                    <a title="预览 （新窗口）" href="javascript:openPopupFocus%28%27%2F00X90000001lGVC%2Fs%3FTemplateType%3D0%26ids%3D00X90000001lGVC%26id%3D00X90000001lGVC%26previewMode%3D1%26retURL%3D%252Fui%252Fmassmail%252FMassMailStageManager%27%2C%20%27_blank%27%2C%20620%2C%20430%2C%20%27width%3D620%2Cheight%3D430%2Cresizable%3Dyes%2Ctoolbar%3Dyes%2Cstatus%3Dyes%2Cscrollbars%3Dyes%2Cmenubar%3Dyes%2Cdirectories%3Dyes%2Clocation%3Dno%2Cdependant%3Dno%27%2C%20false%2C%20true%29%3B">
                                                                        预览</a>
                                                                </th>
                                                                <td class=" dataCell  ">
                                                                    <input type="radio" value="00X90000001lGVC" name="mm_template_id" id="mm_template_id00X90000001lGVC"><label
                                                                        for="mm_template_id00X90000001lGVC">SUPPORT: Self-Service Reset Password (SAMPLE)</label>
                                                                </td>
                                                                <td class=" dataCell  ">
                                                                    文本
                                                                </td>
                                                                <td class=" dataCell  ">
                                                                    Notification of new password when Self-Service password is reset
                                                                </td>
                                                            </tr>
                                                            -->
                                                         
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
                                        <!-- End ListElement -->
                                        <input type="hidden" value="" name="goRefresh" id="goRefresh" />
                                    </div>
                                    <div class="pbWizardFooter">
                                        <div class="pbBottomButtons">
                                            <!--<input type="submit" title="上一页" name="goPrevious" class="btn" value=" 上一页 ">&nbsp;-->
                                            <input type="submit" title="下一页" name="goNext" class="btn" value=" 下一步 "><!--<input type="submit"
                                                title="取消" name="cancel" class="btnCancel" value=" 取消 " />-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <script type="text/javascript">
                                /*
                                Load data
                                */
                                jQuery(document).ready(function () {
                                    //var queryid = jQuery("#queryid").val();
                                    //itemGrid = new entityGrid(jQuery('#gridContainer'), queryid);
                                    //itemGrid.orderField = "__UpdatedOn";
                                    //itemGrid.orderDirection = "desc";
                                    //itemGrid.queryCondition = "";
                                    //itemGrid.getTotalRecords();
                                    //itemGrid.loadData();
                                });

                            </script>
                            <!-- Body events -->
                            <script type="text/javascript">
                                function bodyOnLoad() {
                                    setFocusOnLoad();
                                    if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                    // if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, true); };
                                    if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };;
                                    //if (this.loadChatFrameJs) loadChatFrameJs(); 
                                    //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                    //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    //SfdcApp.MruHovers.global_data.url = 'retURL=%2Fui%2Fmasest=1&amp;renderMode=RETRO&amp;nocache=1411636986890';
                                    if (document.getElementById('sidebarDiv')) {
                                        Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                    };
                                    // if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                                }
                                function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                                function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                            <!-- End page content -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script type="text/javascript" src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script type="text/javascript" src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>


