<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SmsLogs.aspx.cs" Inherits="WebClient.apps.mobile.SmsLogs" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>短信记录: 记录查询 ~ - Developer Edition</title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script><!--
    <script src="/jslibrary/1412954762000/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DevContextMenu.js"></script>-->
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd tth:m")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Product2';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1431481013000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script>        //      ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.202.191.14', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F01t%2Fo');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif Custom28Tab  overviewPage sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
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
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle"><div class="ptBody"><div class="content"><img title="发送记录" class="pageTitleIcon" alt="发送记录" src="/s.gif"><h1 class="pageType noSecondHeader">发送记录搜索</h1><div class="blank">&nbsp;</div></div><div class="links"><a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"><span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a></div></div><div class="ptBreadcrumb"></div></div>
                        <div class="bOverviewSearch">
                            选择查询日期、姓名。<div class="pbSearch">
                                <div class="pbSearch">
                                    <form action="/apps/mobile/SmsLogs.aspx" id="srch" method="GET" name="srch" onsubmit="if (window.ffInAlert) { return false; }if(this.search){this.search.blur();}">
                                    日期：从<input type="text" tabindex="7" size="12" onfocus="DatePicker.pickDate(false, 'srch_StartDate', false);" name="srch_StartDate" id="srch_StartDate" value="<%=DateTime.Now.AddDays(-2).ToString("yyyy-MM-dd")%>" />
                                    至 <input type="text" tabindex="8" size="12" onfocus="DatePicker.pickDate(false, 'srch_EndDate', false);" name="srch_EndDate" id="srch_EndDate" value="<%=DateTime.Now.AddDays(2).ToString("yyyy-MM-dd")%>"  />
                                    姓名：<input class="searchTextBox" id="srch_UserId" maxlength="1000" name="srch_UserId" size="10"
                                        title="输入姓名" type="text" />号码：<input class="searchTextBox" id="srch_mobile" maxlength="1000" name="srch_mobile" size="10"
                                        title="输入号码" type="text" /><input value=" 查找 " class="btn" name="go" title="查找" type="button" onclick="filterResult();"/></form>
                                </div>
                            </div>
                        </div>
                          <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script><script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
                        <script type="text/javascript" src="/js/JsonGrid.js"></script>
                          <!-- Begin RelatedListElement -->
                        <div class="bRelatedList">
                            <!-- Begin ListElement -->

                            <!-- motif: Lead -->

                            <!-- WrappingClass -->
                            <div class="hotListElement">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader"><!--
                                        <form action="/00Q/o" id="hotlist" method="GET" name="hotlist" onsubmit="if (window.ffInAlert) { return false; }">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;<h3>用户签名</h3>                                                 </td>
                                                    <td class="pbButton">
                                                        </td>
                                                    <td class="pbHelp">
                                                        <select id="hotlist_mode" name="hotlist_mode" onchange="submit();" title="显示所选内容">
                                                            <option value="2">最近创建</option>
                                                            <option value="1" selected="selected">最近修改</option>
                                                            <option value="3">最近查看</option>
                                                        </select></td>
                                                </tr>
                                            </table>
                                        </form>
                                        --> 
                                    </div>
                                    <div class="pbBody"> 
                                       
                             <form accept-charset="UTF-8" method="post" name="customTableTag" action="delete"
                                        sizset="0">
                                        <script type="text/javaScript">
                                            function checkall(field) {
                                                var ids = document.getElementsByName("selectedLists");
                                                for (var i = 0; i < ids.length; i++)
                                                    ids[i].checked = field.checked;
                                            }
                                            /*
                                            Load data
                                            */
                                            jQuery(document).ready(function () {
                                                var queryid = jQuery("#queryid").val();
                                                itemGrid = new entityGrid(jQuery('#gridContainer'), queryid);
                                                itemGrid.orderField = "-CreatedOn";
                                                itemGrid.orderDirection = "desc";
                                                itemGrid.queryCondition = "";
                                                itemGrid.renderCallback = renderGrid;
                                                //itemGrid.getTotalRecords();
                                                itemGrid.loadData(null, renderGrid);
                                            });

                                            function syncPageSize(pageSizeIndex) {
                                                var items = document.getElementsByName("size");
                                                var form = document.customTableTag;
                                                var pageSize = 25;
                                                for (var i = 0; i < items.length; i++) {
                                                    if (items[i].form == form) {
                                                        items[i].options[pageSizeIndex].selected = true;
                                                        pageSize = items[i].options[pageSizeIndex].value;
                                                    }
                                                }
                                                syncPageTo(1);
                                                //form.action = 'list';
                                                //form.submit();                                               
                                                itemGrid.setPageSize(pageSize);

                                                return false;
                                            }

                                            function syncPageTo(value) {
                                                if (isNaN(value)) value = 1;
                                                if (value < 1) value = 1;
                                                var items = document.getElementsByName("page");
                                                var form = document.customTableTag;
                                                for (var i = 0; i < items.length; i++) {
                                                    if (items[i].form == form) {
                                                        items[i].value = value;
                                                    }
                                                }
                                            }
                                            function validatePageTo() {
                                                //debugger;
                                                var items = document.getElementsByName("page");
                                                var pageNum = 1;
                                                var form = document.customTableTag;
                                                for (var i = 0; i < items.length; i++) {
                                                    if (items[i].form == form) {
                                                        var value = items[i].value;
                                                        if (isNaN(value)) {
                                                            alert("Please enter a number in the Go To Page field");
                                                            for (var j = 0; j < items.length; j++) {
                                                                items[j].value = "";
                                                            }
                                                            return false;
                                                        }
                                                        pageNum = value;
                                                    }
                                                }
                                                //form.action = 'list';
                                                itemGrid.pageNumber = pageNum;
                                                itemGrid.goPage(pageNum);
                                                return false;
                                            }
                                            function switchQuery(queryId) {
                                                itemGrid = new entityGrid(jQuery('#gridContainer'), queryId);
                                                itemGrid.orderField = "-CreatedOn";
                                                itemGrid.orderDirection = "desc";
                                                //itemGrid.getTotalRecords();
                                                itemGrid.renderCallback = renderGrid;
                                                itemGrid.loadData(null, renderGrid);
                                                jq("#queryid").val(queryId);
                                            }
                                            function filterResult() {
                                                /*
                                                var condition = "[";
                                                var j = 0;
                                                for (var i = 0; i < attributeVal.advancedParamIds.length; i++) {
                                                    var item = attributeVal.advancedParamIds[i];
                                                    var fvalue = jq("#" + item).val();
                                                    if (fvalue != "" && fvalue !== undefined) {
                                                        attributeVal.advancedParamMeta[item].value = fvalue;
                                                        if (j > 0)
                                                            condition += ",";
                                                        var f = attributeVal.advancedParamMeta[item].attribute;
                                                        var o = attributeVal.advancedParamMeta[item].operator;
                                                        var v = attributeVal.advancedParamMeta[item].value;

                                                        var v1 = "{\"attribute\":\"" + f + "\",\"operator\":\"" + o + "\",\"value\":\"" + encodeURIComponent(v) + "\"}";
                                                        condition += v1;
                                                        j++;
                                                    }
                                                }
                                                condition += "]";
                                                */
                                                var b = "";
                                                //"" != c && "" != g && (b = b + "\n" + encodeForSearch(c), b = b + "\t" + encodeForSearch(g), b = b + "\t" + h)
                                                var startDate = jQuery("#srch_StartDate").val();
                                                var endDate = jQuery("#srch_EndDate").val();
                                                if (startDate != undefined && startDate != "") {
                                                    b = "CreatedOn" + "\t" + "ge" + "\t" + startDate;
                                                }
                                                if (endDate != undefined && endDate != "") {
                                                    b =b+ "\nCreatedOn" + "\t" + "le" + "\t" + endDate;
                                                }
                                                var fullName = jQuery("#srch_UserId").val();
                                                if (fullName != undefined && fullName != "") {
                                                    b = b + "\nFullName" + "\t" + "contains" + "\t" + fullName;
                                                }
                                                var mobile = jQuery("#srch_mobile").val();
                                                if (mobile != undefined && mobile != "") {
                                                    b = b + "\nmobile" + "\t" + "contains" + "\t" + mobile;
                                                }
                                                
                                                //itemGrid.se
                                                var v = "";// document.getElementById("search").value;
                                                var condition = v;// encodeURIComponent(v);
                                                itemGrid.pageNum = 1;
                                                itemGrid.search(condition,b);
                                            }
                                        </script>
                                        <script language="javascript" type="text/javascript">
                                            function renderGrid(data) {
                                                //debugger;
                                                var html = "<table class=\"list\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
                                                html += "<tr class=\"headerRow\">";
                                                html += " <th scope=\"actionColumn\" >操作</th><th scope=\"col\" class='DateElement zen-deemphasize'>发送时间</th><th scope=\"col\" class='zen-deemphasize'>姓名</th><th scope=\"col\" class='zen-deemphasize'>手机</th><th scope=\"col\" class='zen-deemphasize'>内容</th><th scope=\"col\" class='zen-deemphasize'>条数</th>";
                                                html += " </tr>";
                                                var length = data.LIST_RECORD_ID.length;
                                                for (var i = 0; i < length; i++) {
                                                    if (i % 2 > 0)
                                                        html += "<tr class='dataRow even' onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";
                                                    else
                                                        html += "<tr class='dataRow odd' onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";

                                                    html += "<td class='  actionColumn  '></td>";
                                                    //html += "<td class='  actionColumn  '><a class=\"actionLink\" href=\"/005/e?id=" + data.LIST_RECORD_ID[i] + "\" title=\"编辑 - 记录 -\">编辑</a></td>";
                                                    html += "<td class='  dataCell  DateElement'>" + data.CreatedOn[i] + "</td>";
                                                    if(data.Name)
                                                        html += "<td class='  dataCell  DateElement'>" + data.Name[i] + "</td>";
                                                    else
                                                        html += "<td class='  dataCell  '></td>";

                                                    html += "<td class='  dataCell  DateElement'>" + data.Mobile[i] + "</td>";
                                                    //html += "<td class='  dataCell  '><img src='/apps/wf/GetUSignature.ashx?id=" + data.LIST_RECORD_ID[i] + "' height='80' width='150' border='0' /></td>";
                                                    html += "<td class='  dataCell  '>" + data.Message[i] + "</td>";
                                                    html += "<td class='  dataCell  '>" + data.MsgCount[i] + "</td>";
                                                    html += "</tr>";
                                                }
                                                html += "</table>";
                                                jQuery("#gridContainer").html(html);
                                            }
                                        </script>
                                     
                                        <input name="sort" value="listtime" type="hidden" />
                                        <input name="queryid" id="queryid" value="3D79FAEE-BF35-4E30-9585-42B95B324EEA" type="hidden" />
                                        <input name="dir" value="desc" type="hidden" />                                        
                                        <input type="hidden" name="action" id="action" />                                    
                                        <table border="0" cellspacing="0" cellpadding="2" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td class="widthspread" align="left">
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                      
                                                                    </td>
                                                                    <td nowrap>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td nowrap align="right" id="extDtPaging-top">
                                                        <input id="paging-top-firstBtn" class="firstBtn" title="第一页" alt="第一页" src="/img/icon_tp_first.gif"
                                                            type="image" />
                                                        &nbsp;
                                                        <input id="paging-top-previousBtn" class="previousBtn" title="上一页" alt="上一页" src="/img/icon_tp_last.gif"
                                                            type="image" />
                                                        <span class="txt-small" id="paging-top-pageNum">&nbsp;第 1 /共 1 页&nbsp; </span>
                                                        <input id="paging-top-nextBtn" class="nextBtn" title="下一页" alt="下一页" src="/img/icon_tp_next.gif"
                                                            type="image" />
                                                        &nbsp;
                                                        <input id="paging-top-lastBtn" class="lastBtn" title="最后一页" alt="最后一页" src="/img/icon_tp_end.gif"
                                                            type="image" />
                                                        <select onchange="syncPageSize(this.selectedIndex);" class="small-select" name="size">
                                                            <option value="10">10 条</option>
                                                            <option value="15">15 条</option>
                                                            <option value="20">20 条</option>
                                                            <option value="25" selected>25 条</option>
                                                            <option value="50">50 条</option>
                                                        </select>
                                                        &nbsp;<span class="txt-small">&nbsp;&nbsp;|&nbsp;&nbsp;页&nbsp;</span>
                                                        <input style="width: 15px" onchange="syncPageTo(this.value);" class="small-input"
                                                            name="page" maxlength="4" type="text" />&nbsp;
                                                        <input class="btn-secondary txt-small" onclick="return validatePageTo()" name="Go"
                                                            value="Go" type="button" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div id="gridContainer">
                                        </div>
                                        <table border="0" cellspacing="0" cellpadding="2" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td class="widthspread" align="left">
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td nowrap>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td nowrap align="right" id="extDtPaging-bot">
                                                        <input id="paging-bottom-firstBtn" class="firstBtn" title="第一页" alt="第一页" src="/img/icon_tp_first.gif"
                                                            type="image" />
                                                        &nbsp;
                                                        <input id="paging-bottom-previousBtn" class="previousBtn" title="上一页" alt="上一页" src="/img/icon_tp_last.gif"
                                                            type="image" />
                                                        <span class="txt-small" id="paging-bottom-pageNum">&nbsp;第1页，共1页&nbsp; </span>
                                                        <input id="paging-bottom-nextBtn" class="nextBtn" title="下一页" alt="下一页" src="/img/icon_tp_next.gif"
                                                            type="image" />
                                                        &nbsp;
                                                        <input id="paging-bottom-lastBtn" class="lastBtn" title="最后一页" alt="最后一页" src="/img/icon_tp_end.gif"
                                                            type="image" />
                                                        <select onchange="syncPageSize(this.selectedIndex);" class="small-select" name="size">
                                                            <option value="10">10 条</option>
                                                            <option value="15">15 条</option>
                                                            <option value="20">20 条</option>
                                                            <option value="25" selected>25 条</option>
                                                            <option value="50">50 条</option>
                                                        </select>
                                                        &nbsp;<span class="txt-small">&nbsp;&nbsp;|&nbsp;&nbsp;页&nbsp;</span>
                                                        <input style="width: 15px" onchange="syncPageTo(this.value);" class="small-input"
                                                            name="page" maxlength="4" type="text" />&nbsp;
                                                        <input class="btn-secondary txt-small" onclick="return validatePageTo()" name="Go"
                                                            value="Go" type="button" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </form>
                       
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <!-- End ListElement -->
                        </div>
                        <!-- End RelatedListElement -->
                        <!-- Begin RelatedListElement -->
                        <div class="bRelatedList" style="display:none">
                            <!-- Begin ListElement -->
                            <!-- motif: Product2 -->
                            <!-- WrappingClass -->
                            <div class="hotListElement">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <form action="/01t/o" id="hotlist" method="GET" name="hotlist" onsubmit="if (window.ffInAlert) { return false; }">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="pbTitle">
                                                    <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;<h3>
                                                        短信发送记录查询结果</h3>
                                                </td>
                                                <td class="pbButton">
                                                   
                                                </td>
                                                <td class="pbHelp">
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                        </form>
                                    </div>
                                    <div class="pbBody">
                                      <%=BodyText%>
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
                        <table class="toolsContent" id="toolsContent" style="display:none;">
                            <tr>
                                <td>
                                    <div class="toolsContentLeft">
                                        <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                            <h3 class="lbHeader">
                                                报表</h3>
                                            <div class="lbBodyEmpty lbBody">
                                                <ul>
                                                </ul>
                                            </div>
                                            <div class="lbBody">
                                                <div class="mainLink">
                                                    <a href="/00O/o?entityType=00O">转至报表</a>&nbsp;&#187;</div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="toolsContentRight">
                                        <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                            <h3 class="lbHeader">
                                                维护</h3>
                                            <div class="lbBody">
                                                <ul>
                                                    <li><span><a href="/01s/o">管理价格手册</a></span></li><li><span><a href="/setup/own/massdelete.jsp?ftype=Product2">
                                                        批量删除产品</a></span></li></ul>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <script>                            window.sfdcPage.appendToOnloadQueue(function () {
                                // DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Product2&setupid=Product2Fields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Product2&retURL=%2F01t%2Fo&setupid=Product2Fields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Products", "newUrl": "/01I/e?retURL=%2F01t%2Fo&setupid=Products", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看记录类型", "hoverText": "查看和管理此对象的记录类型", "newLinkHover": "为此对象添加记录类型", "url": "/ui/setup/rectype/RecordTypes?type=Product2&setupid=Product2Records", "newUrl": "/setup/ui/recordTypeWizard.jsp?type=Product2&retURL=%2F01t%2Fo&setupid=Product2Records", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F01t%2Fo&tableEnumOrId=Product2&setupid=Product2Validations", "newUrl": "/03d/e?retURL=%2F01t%2Fo&TableEnumOrId=Product2&Active=1&setupid=Product2Validations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=Product2&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=Product2&et=QUICK_CREATE&retURL=%2F01t%2Fo&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3K/e?retURL=%2F01t%2Fo&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑列", "hoverText": "自定义此列表中的列", "url": "/p/setup/layout/ListLayoutEdit?LayoutEntity=Product2&retURL=%2F01t%2Fo&LayoutType=KeyList&setupid=Product2SearchLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                //  new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Fsection%253DDev_Tools%2526target%253Ddev_quick_access_menu.htm%2526loc%253Dhelp%2526language%253Dzh_CN%2526release%253D194.20.3%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2F01t%2Fo");
                            });</script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F01t%2Fo&isAjaxRequest=1&renderMode=RETRO&nocache=1431916974167'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                        <div id="datePicker" class="datePicker"><div class="dateBar"><img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();" onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
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
</select><img title="下月" onmouseover="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';" onfocus="this.className = 'calRightOn';" onclick="DatePicker.datePicker.nextMonth();" onblur="this.className = 'calRight';" class="calRight" alt="下月" src="/s.gif"><select title="年" name="calYearPicker" id="calYearPicker"><option value="2014">2014</option>
<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
</select></div><div class="calBody"><table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays"><tbody><tr><th scope="col" class="dayOfWeek">星期日</th><th scope="col" class="dayOfWeek">星期一</th><th scope="col" class="dayOfWeek">星期二</th><th scope="col" class="dayOfWeek">星期三</th><th scope="col" class="dayOfWeek">星期四</th><th scope="col" class="dayOfWeek">星期五</th><th scope="col" class="dayOfWeek">星期六</th></tr>
<tr id="calRow1" class="calRow"><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td></tr>
<tr id="calRow2" class="calRow"><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td></tr>
<tr id="calRow3" class="calRow"><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td></tr>
<tr id="calRow4" class="calRow"><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td></tr>
<tr id="calRow5" class="calRow"><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td></tr>
<tr id="calRow6" class="calRow"><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td><td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td></tr>
</tbody></table><div class="buttonBar"><a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday" href="javascript:%20void%280%29%3B">今天</a></div></div></div>
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
<!-- page generation time: 126ms -->

