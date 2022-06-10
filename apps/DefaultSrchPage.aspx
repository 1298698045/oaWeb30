<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultSrchPage.aspx.cs" Inherits="WebClient.apps.DefaultSrchPage" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title><%=PageTitle%>: 主页</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/SelectionSearchPage.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/LineItem.js"></script>
    <script src="/jslibrary/sfdc/source/SearchOnly.js"></script>
    <script src="/jslibrary/sfdc/EntityCustomSearchPage.js"></script>
    <script>        window.sfdcPage = new EditPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-MM-dd HH:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
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
    <script>        window.sfdcPage = new EntityCustomSearchPage();</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //      ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.202.191.14', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F01t%2Fo');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif <%=TabCss%>  overviewPage sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
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
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="<%=PageTitle%>" class="pageTitleIcon" title="<%=PageTitle%>" /><h1 class="pageType"><%=PageTitle%><span class="titleSeparatingColon">:</span></h1>
                                            <h2 class="pageDescription">主页</h2>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links">
                                            <!--
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                class="configLinks zen-deemphasize" title="了解详细信息！ （新窗口）">了解详细信息！</a> | <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                    title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                        class="helpIcon" /></a>-->
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                       <!-- <div class="bOverviewSearch">
                        </div>-->
                        <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
                        <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
                        <script src="/static/111213/js/picklist.js"></script>
                         <script src="/js/searchFilterField.js"></script>
                        <script src="/apps/CommandProcessor.ashx?cmd=picklist&e=<%=TypeCode%>&amp;h=%2BoZDvGnbcaPTq%2BeM%2FeiE6ka%2BQxvs%2BYMIg0fvSWH0Ibo%3D&amp;v=1412752376000&amp;layout=00h9000000RbNyf&amp;mo=EDITLOAD&amp;esc=HTML&amp;l=zh_CN&amp;pr=1.25&amp;t=0"></script>
                        <form action="/_ui/entity/search/EntitySearchResults" id="editPage" method="post"    name="editPage" onsubmit="if (window.ffInAlert) { return false; }">
                            <input type="hidden" value="0" id="isSaveAs" name="isSaveAs">
                            <input id="lookup" type="hidden" value="" name="lookup">                            
                            <input type="hidden" value="<%=DisplayFields%>" id="displayFields" name="displayFields"  />     
                            <input type="hidden" value="<%=TypeCode%>" id="objectTypeCode" name="objectTypeCode"  />  
                            <!--<div class="pricebookentryBlock"><div class="bPageBlock brandSecondaryBrd"> </div></div>
                            -->
                            <div class="pbHeader" id="lineItemView_searchHeader" style="width:90%">
                                <table border="0" cellpadding="0" cellspacing="0" >
                                    <!--<tr><td class="pbTitle"><img height="1" width="1" title="" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3><span class="searchFirstCell">查找产品</span></h3></td><td class="pbButton">&nbsp;</td><td class="pbHelp"><span class="searchCustomization"><div id="comboButtonPricebookEntry" class="menuButton"><div id="comboButtonPricebookEntryButton" class="menuButtonButton"><span tabindex="0" id="comboButtonPricebookEntryLabel" class="menuButtonLabel">自定义...</span></div><div id="comboButtonPricebookEntryMenu" class="menuButtonMenu"><a class="menuButtonMenuLink firstMenuItem" href="/p/setup/layout/ListLayoutEdit?retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&amp;LayoutType=SearchResult&amp;LayoutEntity=PricebookEntry&amp;fromCustomizeButton=1&amp;setupid=PricebookEntrySearchLayouts">用于所有用户的列</a></div></div><script>new MenuButton('comboButtonPricebookEntry', false);</script></span><script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            window.sfdcPage.addCloser('PricebookEntry');</script>&nbsp;</td></tr>-->
                                    <tr>
                                        <td colspan="3">
                                            <div class="searchFilterFieldsHolder searchFilterFieldsHolderFirst" id="field_name_PricebookEntry" style="margin: 0px;">
                                                <table class="searchFilterFields" style="width:100%">
                                                    <tr valign="top">
                                                        <td class="keywordElement" style="width: 5%">
                                                            <span class="inputTitle">名称</span><br />
                                                            <input id="search" maxlength="255" name="search" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)"
                                                                size="20" title="搜索" type="text" value="" /><br />
                                                            &nbsp;
                                                        </td>
                                                        <td><!--
                                                            <table>
                                                                <tr>
                                                                    <td><span class="inputTitle">部门：</span></td>
                                                                    <td  class="dataCol col02">
                                                                        <input type="hidden" searchcolumn="true" datafield="DeptId" dataope="eq" name="parent_lkid" id="parent_lkid" value=""><input type="hidden" name="parent_lkold" id="parent_lkold" value=""><input type="hidden" name="parent_lktp" id="parent_lktp" value="10"><input type="hidden" name="parent_lspf" id="parent_lspf" value="1"><input type="hidden" name="parent_lspfsub" id="parent_lspfsub" value="0"><input type="hidden" name="parent_mod" id="parent_mod" value="1"><span class="lookupInput"><input type="text" id="parent" maxlength="255" name="parent" onchange="getElementByIdCS('parent_lkid').value='';getElementByIdCS('parent_mod').value='1';" size="20" tabindex="4" value=""><a href="javascript:openLookup('/_ui/common/data/DeptPicker.aspx?lkfm=editPage&amp;lknm=parent&amp;lktp=' + getElementByIdCS('parent_lktp').value,670,'1','&amp;lksrch=' + escapeUTF(getElementByIdCS('parent').value.substring(0, 80)))" id="parent_lkwgt" onclick="setLastMousePosition(event)" tabindex="4" title="上级部门 查找（新窗口）"><img src="/s.gif" alt="上级部门 查找（新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" title="上级部门 查找（新窗口）"></a></span></td>
                                                                    <td><span class="inputTitle">月份：</span></td>
                                                                    <td>
                                                                        <input type="text" searchcolumn="true" datafield="AttendMonth" dataope="eq" id="srccol_startMonth" name="srccol_startMonth" value="<%=DateTime.Now.ToString("yyyy-MM")%>" style="width: 80px;" /></td>
                                                                   <td><span class="inputTitle">结束时间：</span></td>
                                                                        <td><input type="text" searchColumn="true" datafield="AttendDate" dataope="le" id="srccol_endDate" name="endDate" onfocus="DatePicker.pickDate(false, 'srccol_endDate', false);"  style="width:100px;" /></td>
                                                                </tr>
                                                            </table>
                                                            <span class="inputTitle">按字段筛选条件</span>-->
                                                             <%=SearchFilterHTML%>  
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" colspan="2">
                                                            <div class="searchFilterButtons productButtons">
                                                                <input value=" 搜索 " class="btn" id="save_filter_PricebookEntry" name="saveButton" onclick="window.sfdcPage.filterResults(null, '/_ui/busop/orderitem/SelectSearch?srtOrd=1&addTo=80190000000PJyk&offset=0', '/_ui/busop/orderitem/SelectSearch?srtOrd=1&isNFltr=1&addTo=80190000000PJyk&offset=0&relatedListId=PricebookEntry', 'noh=1', 'PricebookEntry', 5); return false" title="搜索" type="button" /><input type="button" title="另存为" onclick="    document.getElementById('isSaveAs').value = '1'; return exportDownload();" name="save" class="btn" value=" 导出另存为 " data-uidsfdc="6" />
                                                                <!--<input type="button" value=" 月末统计 " title="月末统计" name="stat" class="btn" onclick="    statMonthAttend(null, document.getElementById('srccol_startMonth').value)" />-->
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>

                                    </tr>
                                </table>
                            </div>
                            </form>
                            <!--<script src="/static/111213/js/picklist.js"></script>-->
                            <script>
                                <%=InitJson%>                           
                            </script>
                            <div class="individualPalette listViewportWrapper" id="lineItemView_wrapper">
                                <div class="listViewport opportunityBlock" id="lineItemView_listViewport">
                                    <form action="" id="lineItemView_actionForm" method="POST" name="lineItemView_actionForm"
                                        onsubmit="return ListViewport.instances['lineItemView'].verify('请至少选择一行')">
                                        <input type="hidden" id="lineItemView_pageState" name="lineItemView_pageState" value="" /><input
                                            type="hidden" id="lineItemView_rolodexState" name="lineItemView_rolodexState"
                                            value="" /><div class="topNav primaryPalette" id="lineItemView_topNav" style="display: none">
                                                <div class="controls">
                                                    <h2 class="title"></h2>
                                                    <span class="divisionLabel" id="lineItemView_divisionLabel"></span>
                                                    <div class="topNavTab" id="lineItemView_topNavTab">
                                                    </div>
                                                    <div class="clearingBox">
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="subNav" id="lineItemView_subNav">
                                            <div class="linkBar brandSecondaryBrd">
                                                <div class="listButtons" id="lineItemView_listButtons">
                                                </div>
                                                <div class="clearFilter" id="lineItemView_clearFilter">
                                                </div>
                                                <div class="rolodex" id="lineItemView_rolodex" style="visibility: hidden">
                                                    <a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A0%7D%29"
                                                        class="listItem"><span class="listItemPad">A</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A1%7D%29"
                                                            class="listItem"><span class="listItemPad">B</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A2%7D%29"
                                                                class="listItem"><span class="listItemPad">C</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A3%7D%29"
                                                                    class="listItem"><span class="listItemPad">D</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A4%7D%29"
                                                                        class="listItem"><span class="listItemPad">E</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A5%7D%29"
                                                                            class="listItem"><span class="listItemPad">F</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A6%7D%29"
                                                                                class="listItem"><span class="listItemPad">G</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A7%7D%29"
                                                                                    class="listItem"><span class="listItemPad">H</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A8%7D%29"
                                                                                        class="listItem"><span class="listItemPad">I</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A9%7D%29"
                                                                                            class="listItem"><span class="listItemPad">J</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A10%7D%29"
                                                                                                class="listItem"><span class="listItemPad">K</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A11%7D%29"
                                                                                                    class="listItem"><span class="listItemPad">L</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A12%7D%29"
                                                                                                        class="listItem"><span class="listItemPad">M</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A13%7D%29"
                                                                                                            class="listItem"><span class="listItemPad">N</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A14%7D%29"
                                                                                                                class="listItem"><span class="listItemPad">O</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A15%7D%29"
                                                                                                                    class="listItem"><span class="listItemPad">P</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A16%7D%29"
                                                                                                                        class="listItem"><span class="listItemPad">Q</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A17%7D%29"
                                                                                                                            class="listItem"><span class="listItemPad">R</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A18%7D%29"
                                                                                                                                class="listItem"><span class="listItemPad">S</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A19%7D%29"
                                                                                                                                    class="listItem"><span class="listItemPad">T</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A20%7D%29"
                                                                                                                                        class="listItem"><span class="listItemPad">U</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A21%7D%29"
                                                                                                                                            class="listItem"><span class="listItemPad">V</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A22%7D%29"
                                                                                                                                                class="listItem"><span class="listItemPad">W</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A23%7D%29"
                                                                                                                                                    class="listItem"><span class="listItemPad">X</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A24%7D%29"
                                                                                                                                                        class="listItem"><span class="listItemPad">Y</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A25%7D%29"
                                                                                                                                                            class="listItem"><span class="listItemPad">Z</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:26})"
                                                                                                                                                                class="listItem"><span class="listItemPad">其他</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:-1})"
                                                                                                                                                                    class="listItem listItemLast"><span class="listItemPad">全部</span></a>
                                                </div>
                                                <div class="clearingBox">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="listBody" id="lineItemView_listBody">
                                            <div class="exception" id="lineItemView_exception">
                                            </div>
                                        </div>
                                        <div class="offPageIds" id="lineItemView_offPageIds">
                                        </div>
                                    </form>
                                    <div class="bottomNav" id="lineItemView_bottomNav">
                                        正在加载...
                                    </div>
                                </div>
                                <div class="feedContainer" id="lineItemView_feedContainer" style="display: none">
                                    <div class="feedBody" id="lineItemView_feedBody">
                                    </div>
                                </div>
                            </div>
                            <!-- Body events -->
                            <br />
                            <br />
                            <br />
                            <table class="toolsContent" id="toolsContent"  style="display: none">
                                <tr>
                                    <td>
                                        <div class="toolsContentLeft">
                                            <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                <h3 class="lbHeader">查询考勤统计报表</h3>
                                                <div class="lbBody">
                                                    <ul>
                                                        <li><a href="/apps/hr/rptsAttd.aspx?t=a0Q&amp;t=title1&amp;c=OW&amp;c=AN&amp;c=SU&amp;c=CDT&amp;c=AGE&amp;c=CO&amp;c=CF&amp;details=yes&retURL=/a0Q/o">月考勤汇总统计(按部门）</a></li>
                                                        <li><span><a href="/apps/hr/MyAttendList.aspx?t=a0Q">个人考勤查询</a></span></li>
                                                    </ul>
                                                </div>
                                                <!--
                                            <div class="lbBody">
                                                <div class="mainLink">
                                                   
                                                    <a href="/00O/o?entityType=00O">转至报表</a>&nbsp;&#187;
                                                </div>
                                            </div>-->
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="toolsContentRight">
                                            <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                <h3 class="lbHeader">维护</h3>
                                                <div class="lbBody">
                                                    <ul>
                                                        <li><span><a href="/apps/hr/MyAttendList.aspx?t=a0Q">个人考勤查询</a></span></li>
                                                        <!--<li><span><a href="/setup/own/massdelete.jsp?ftype=Product2">
                                                        批量删除产品</a></span></li>-->
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                              <script type="text/javascript" >
                                  function encodeForSearch(a) {
                                      return window.encodeURIComponent ? encodeURIComponent(a) : escape(a);
                                  }
                                  function getFilterCondition() {
                                      var f = 5;
                                      var b = "";
                                       
                                      jQuery("input[searchColumn^='true']").each(function (index, value) {
                                          var fullId = jQuery(this).attr("id");
                                          //debugger;
                                          //var fieldName = fullId.substr(7);
                                          c = jQuery(this).attr("datafield");//column name 
                                          g = jQuery(this).attr("dataope");//operator
                                          h = jQuery(this).val();          //value

                                          function encodeForSearch(a) {
                                              return window.encodeURIComponent ? encodeURIComponent(a) : escape(a);
                                          }

                                          "" != c && "" != g && (b = b + "\n" + encodeForSearch(c), b = b + "\t" + encodeForSearch(g), b = b + "\t" + h)
                                          //"" != c && "" != g && (b = b + "\n" + encodeForSearch(c), b = b + "\t" + encodeForSearch(g), b = b + "\t" + h)
                                      });
                                      // debugger;
                                      jQuery("select[searchColumn^='true']").each(function (index, value) {
                                          var fullId = jQuery(this).attr("id");

                                          //var fieldName = fullId.substr(7);
                                          c = jQuery(this).attr("datafield");//column name 
                                          g = jQuery(this).attr("dataope");//operator
                                          h = jQuery(this).val();          //value

                                          "" != c && "" != g && (b = b + "\n" + encodeForSearch(c), b = b + "\t" + encodeForSearch(g), b = b + "\t" + h)
                                      });
                                    
                                      return b;
                                  }
                                  function exportDownload() {
                                      var b = getFilterCondition();
                                      if (b == "") return false;

                                      //saveAllSelected([document.editPage.colselector_select_0, document.editPage.colselector_select_1], [document.editPage.colselector0, document.editPage.colselector1], ',', '\\', '--无--');
                                      var displayfields = document.getElementById("displayFields").value;
                                      var objectTypeCode = document.getElementById("objectTypeCode").value;
                                      var name = "Exp1";
                                      if (displayfields == "") {
                                          alert("导出字段必须选择");
                                          return false;
                                      }
                                      if (name == "") {
                                          alert("导出名称必须输入");
                                          return false;
                                      }
                                      var n = "/apps/ExportDownload.aspx?objecttypecode=" + objectTypeCode + "&name=" + name + "&filterQuery=" + encodeForSearch(b) + "&fields=" + displayfields;

                                      window.open(n); /*
                                m = {
                                    timeStamp: Date.now(),
                                    filterQuery: b
                                };
                                Sfdc.Ajax.post(n, queryResponseResult, {
                                    data: m,
                                    failure: queryFailure
                                });
                                */
                                      return false;
                                  }
                                  function queryFailure(a, b)
                                  { }
                                  function queryResponseResult(a, b) {
                                      //a response text
                                      //b response object 
                                      //debugger;
                                      //queryResult
                                      jQuery("#queryResult").html(a);
                                      jQuery("#queryResult").show();
                                  }

                                  function encodeForSearch(a) {
                                      return window.encodeURIComponent ? encodeURIComponent(a) : escape(a)
                                  };
                        </script>
                            <script>                            window.sfdcPage.appendToOnloadQueue(function () {
                                // DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Product2&setupid=Product2Fields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Product2&retURL=%2F01t%2Fo&setupid=Product2Fields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Products", "newUrl": "/01I/e?retURL=%2F01t%2Fo&setupid=Products", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看记录类型", "hoverText": "查看和管理此对象的记录类型", "newLinkHover": "为此对象添加记录类型", "url": "/ui/setup/rectype/RecordTypes?type=Product2&setupid=Product2Records", "newUrl": "/setup/ui/recordTypeWizard.jsp?type=Product2&retURL=%2F01t%2Fo&setupid=Product2Records", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F01t%2Fo&tableEnumOrId=Product2&setupid=Product2Validations", "newUrl": "/03d/e?retURL=%2F01t%2Fo&TableEnumOrId=Product2&Active=1&setupid=Product2Validations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=Product2&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=Product2&et=QUICK_CREATE&retURL=%2F01t%2Fo&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3K/e?retURL=%2F01t%2Fo&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑列", "hoverText": "自定义此列表中的列", "url": "/p/setup/layout/ListLayoutEdit?LayoutEntity=Product2&retURL=%2F01t%2Fo&LayoutType=KeyList&setupid=Product2SearchLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                //  new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Fsection%253DDev_Tools%2526target%253Ddev_quick_access_menu.htm%2526loc%253Dhelp%2526language%253Dzh_CN%2526release%253D194.20.3%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2F01t%2Fo");
                            });</script>
                            <!-- Body events -->
                            <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F01t%2Fo&isAjaxRequest=1&renderMode=RETRO&nocache=1431916974167'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                            <!-- End page content -->
                            <div id="datePicker" class="datePicker">
                                <div class="dateBar">
                                    <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();" onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
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
                                    </select>
                                </div>
                                <div class="calBody">
                                    <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                                        <tbody>
                                            <tr>
                                                <th scope="col" class="dayOfWeek">星期日</th>
                                                <th scope="col" class="dayOfWeek">星期一</th>
                                                <th scope="col" class="dayOfWeek">星期二</th>
                                                <th scope="col" class="dayOfWeek">星期三</th>
                                                <th scope="col" class="dayOfWeek">星期四</th>
                                                <th scope="col" class="dayOfWeek">星期五</th>
                                                <th scope="col" class="dayOfWeek">星期六</th>
                                            </tr>
                                            <tr id="calRow1" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow2" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow3" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow4" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow5" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                            <tr id="calRow6" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="buttonBar"><a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday" href="javascript:%20void%280%29%3B">今天</a></div>
                                </div>
                            </div>
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
<!-- page generation time: 126ms -->

