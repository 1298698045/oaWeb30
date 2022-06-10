<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="queryData.aspx.cs" Inherits="WebClient.apps.queryData" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>人事档案：档案查询</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet"
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
    <script src="/jslibrary/sfdc/source/SearchOnlyExtend.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1437415694000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd tthh:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Employee';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/EXT/ext-3.3.3/resources/css/ext-all-notheme.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/ExtCSS-SFDC.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/SelectionSearchPage.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1436375594000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437271521000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        window.sfdcPage = new CommonLineItemSearchPage();//LineItemSearchPage();//</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '114.111.167.121', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif contactTab  SelectSearch  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
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
                    <td class="noSidebarCell">
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle" style=" ">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="pageType noSecondHeader"
                                                style="font-size: 14px;">
                                                人事档案</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                        </div>
                                    </div><!--
                                    <div class="ptBreadcrumb">
                                    </div>-->
                                </div>
                        <table width="100%">
                            <tr>                           
                            <td class="oRight" id="bodyCell">
                                <!-- Start page content -->
                                <a name="skiplink">
                                    <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                        title="内容在此开始" /></a>
                              
                                <form action="/_ui/busop/orderitem/MultiOrderItemEdit" id="editPage" method="post"
                                name="editPage" onsubmit="if (window.ffInAlert) { return false; }" target="">
                                    <input id="lookup" type="hidden" value="" name="lookup">
                                    <input id="objectTypeCode" type="hidden" value="30020" name="objectTypeCode">
                                <div class="pricebookentryBlock">
                                    <div class="bPageBlock brandSecondaryBrd">
                                        <div class="pbHeader" id="lineItemView_searchHeader">
                                            <table border="0" cellpadding="0" cellspacing="0" summary="人事档案"><!--
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/s.gif"
                                                            alt="" class="relatedListIcon" title="" /><h3>
                                                                <span class="searchFirstCell">查找</span></h3>
                                                    </td>
                                                    <td class="pbButton">
                                                        &nbsp;
                                                    </td>
                                                    <td class="pbHelp">
                                                        <span class="searchCustomization">
                                                            <div class="menuButton" id="comboButtonPricebookEntry">
                                                                <div class="menuButtonButton" id="comboButtonPricebookEntryButton"><span class="menuButtonLabel" id="comboButtonPricebookEntryLabel" tabindex="0">自定义...</span></div>
                                                                <div class="menuButtonMenu" id="comboButtonPricebookEntryMenu"><a href="/p/setup/layout/ListLayoutEdit?retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&amp;LayoutType=SearchResult&amp;LayoutEntity=PricebookEntry&amp;fromCustomizeButton=1&amp;setupid=PricebookEntrySearchLayouts"
                                                                        class="menuButtonMenuLink firstMenuItem">用于所有用户的列</a></div>
                                                            </div>
                                                            <script>                                                                new MenuButton('comboButtonPricebookEntry', false);</script>
                                                        </span>
                                                        <script>                                                            window.sfdcPage.addCloser('PricebookEntry');</script>
                                                        &nbsp;
                                                    </td>
                                                </tr>-->
                                                <tr>
                                                    <td colspan="3">
                                                        <div class="searchFilterFieldsHolder searchFilterFieldsHolderFirst" id="field_name_PricebookEntry">
                                                            <table class="searchFilterFields">
                                                                <tr>
                                                                    <td class="keywordElement" style="width: 5%">
                                                                        <span class="inputTitle">按姓名</span><br />
                                                                        <input id="search" maxlength="255" name="search" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)"
                                                                            size="20" title="搜索" type="text" value="" /><br />
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <span class="inputTitle">按字段筛选条件</span><br />
                                                                       <%=SearchLineHTML%>
                                                                        <script type="text/javascript">

                                                                            //var type2ops = new Array();
                                                                            //  type2ops['Boolean'] = ['e', 'n'];
                                                                            //  type2ops['Currency'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                                                                            //  type2ops['Integer'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                                                                            // type2ops['Double'] = ['e', 'n', 'l', 'g', 'm', 'h'];
                                                                            //type2ops['Percent'] = ['e', 'n', 'l', 'g', 'm', 'h'];

                                                                            //var value2ops = new Array();
                                                                            //value2ops['Topics'] = ['u', 'x'];
                                                                            //var val2type = new Array(); 
                                                                            // val2type['PRICEBOOK.NAME'] = 'Text'; val2type['PRICEBOOK.ACTIVE'] = 'Boolean'; val2type['PRODUCT.NAME'] = 'Text'; val2type['PRODUCT.CUSTOMER_PRODUCT_ID'] = 'Text'; val2type['PRODUCT2.FAMILY_ENUM'] = 'DynamicEnum'; val2type['PRODUCT.DEFAULT_PRICE'] = 'Currency'; val2type['PB_ENTRY.USE_STANDARD_PRICE'] = 'Boolean'; val2type['PRODUCT.ACTIVE'] = 'Boolean'; val2type['PRODUCT2.DESCRIPTION'] = 'MultiLineText'; val2type['PB_ENTRY.CREATED_DATE'] = 'DateTime'; val2type['PB_ENTRY.LAST_UPDATE'] = 'DateTime'; val2type['CREATEDBY_USER.ALIAS'] = 'Text'; val2type['UPDATEDBY_USER.ALIAS'] = 'Text'; val2type['PRODUCT2.ACTIVE'] = 'Boolean';
                                                                            var oppLabels = new Array(); oppLabels['eq'] = '等于'; oppLabels['neq'] = '不等于'; oppLabels['lt'] = '小于'; oppLabels['gt'] = '大于'; oppLabels['le'] = '小于或等于'; oppLabels['ge'] = '大于或等于'; oppLabels['beginswith'] = '起始字符'; oppLabels['contains'] = '包含'; oppLabels['not-like'] = '不包含'; /* oppLabels['u'] = '包括'; oppLabels['x'] = '不包括'; oppLabels['w'] = '在范围内';*/
                                                                            oppLabels['in'] = '范围'; oppLabels['not-in'] = '排除范围';
                                                                            var allOperators = ['eq', 'neq', 'lt', 'gt', 'le', 'ge', 'contains', 'not-like', 'beginswith', 'in'];
                                                                            var noneLabel;
                                                                            function updateOperator(sel, opSelName, lookupName) {
                                                                                var selObj = document.getElementById(opSelName);
                                                                                if (selObj.offsetWidth > 0) { selObj.style.width = selObj.offsetWidth + 'px'; }
                                                                                if (noneLabel == null && selObj.options[0].value.length == 0) noneLabel = selObj.options[0].text; var ops = null; var val = sel.options[sel.selectedIndex];
                                                                                if (val) ops = type2ops[val2type[val.value]];
                                                                                if (val.value in value2ops) ops = value2ops[val.value];
                                                                                if (ops == null) ops = allOperators;
                                                                                var currSelected = selObj.options[selObj.selectedIndex];
                                                                                selObj.length = 0; var off = 0;
                                                                                if (noneLabel != null) {
                                                                                    off = 1; selObj.options[0] = new Option(noneLabel, '');
                                                                                    if (currSelected.value == '') {
                                                                                        selObj.options[0].selected = true;
                                                                                    }
                                                                                }
                                                                                for (var i = 0; i < ops.length; i++) {
                                                                                    var label = oppLabels[ops[i]];
                                                                                    if (label == null) continue; var option = new Option(oppLabels[ops[i]], ops[i]);
                                                                                    selObj.options[i + off] = option;
                                                                                    if (currSelected != null && currSelected.value == option.value) { option.selected = true; }
                                                                                }
                                                                                //begin
                                                                                var idx = opSelName.substr(opSelName.length - 1, 1);
                                                                                var valControlName = 'PricebookEntryfval' + idx;
                                                                                if (val2type[sel.value] == 'Date') {
                                                                                    jQuery("#" + valControlName).attr("onfocus", "DatePicker.pickDate(false, '" + valControlName + "', false);");
                                                                                }
                                                                                else if (val2type[sel.value] == 'DateTime') {
                                                                                    jQuery("#" + valControlName).attr("onfocus", "DatePicker.pickDate(false, '" + valControlName + "', true);");
                                                                                }
                                                                                else {
                                                                                    jQuery("#" + valControlName).removeAttr("onfocus");
                                                                                }
                                                                                //end
                                                                                if (lookupName) {
                                                                                    //if (val.value == 'Case.BusinessHours' || val.value != 'MEMBER_STATUS' &&
                                                                                    //    val.value != 'CAMPAIGN_MEMBER.STATUS' && val.value != 'Lead.CampaignMemberStatus' &&
                                                                                    //    val2type[val.value] == 'StaticEnum' || val2type[val.value] == 'DynamicEnum' || val2type[val.value] == 'EnumOrId'
                                                                                    //    || val2type[val.value] == 'Division' || val2type[val.value] == 'RecordType' || val2type[val.value] == 'Boolean')
                                                                                    if (val2type[val.value] == 'StaticEnum')
                                                                                        document.getElementById(lookupName).style.display = '';
                                                                                    else document.getElementById(lookupName).style.display = 'none';
                                                                                }


                                                                            }
                                                                            function selectNotNone(opSelName) { var selObj = document.getElementById(opSelName); if (selObj.selectedIndex == 0) selObj.selectedIndex = 1; }
                                                                            function initializeOperator(selName, colName, lookupName) {
                                                                                var obj = document.getElementById(colName);
                                                                                if (obj) {
                                                                                    obj = document.getElementById(selName);
                                                                                    if (obj != null) { updateOperator(obj, colName, lookupName); }
                                                                                }
                                                                            }
                                                                            function onLoadCriteria() {
                                                                                initializeOperator('PricebookEntrycol0', 'PricebookEntryoper0', null);
                                                                                initializeOperator('PricebookEntrycol1', 'PricebookEntryoper1', null);
                                                                                initializeOperator('PricebookEntrycol2', 'PricebookEntryoper2', null);
                                                                                initializeOperator('PricebookEntrycol3', 'PricebookEntryoper3', null);
                                                                                initializeOperator('PricebookEntrycol4', 'PricebookEntryoper4', null);
                                                                            }
                                                                        </script>
                                                                        
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <div class="searchFilterButtons productButtons">
                                                                            <input value=" 搜索 " class="btn" id="save_filter_PricebookEntry" name="saveButton"
                                                                                onclick="window.sfdcPage.filterResults(null, '/_ui/busop/orderitem/SelectSearch?srtOrd=1&addTo=80190000000PJyk&offset=0', '/_ui/busop/orderitem/SelectSearch?srtOrd=1&isNFltr=1&addTo=80190000000PJyk&offset=0&relatedListId=PricebookEntry', 'noh=1', 'PricebookEntry', 5); return false"
                                                                                title="搜索" type="button" /></div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <script src="/static/111213/js/picklist.js"></script>
                                <script>
                                    /*new LineItemListViewport('lineItemView', 'PricebookEntry', { "inlineEditData": { "saveUrl": "/_ui/common/udd/object/InlineEditListSave", "massEditable": false, "editable": false }, "rolodexIndex": -1, "entityButtons": [], "buttons": [], "listButtons": [], "retURL": "/01u?rolodexIndex=-1&page=1", "capped": false, "rowsPerPage": 100, "page": 1, "hasMassActions": false, "sortState": [{ "field": "PRODUCT.NAME", "dir": "ASC"}], "printURL": "/01u?rolodexIndex=-1&page=1", "listData": { "ACTION_COLUMN": [], "PRODUCT2.FAMILY_ENUM": ["&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;"], "LIST_RECORD_ID": ["01u90000006qM5v", "01u90000006qM5o", "01u90000006qM5n", "01u90000006qM62", "01u90000006qM60", "01u90000006qM5x", "01u90000006qM5t", "01u90000006qM5u", "01u90000006qM5r", "01u90000006qM5p", "01u90000006qM61", "01u90000006qM63", "01u90000006qM5y", "01u90000006qM5w", "01u90000006qM5z", "01u90000006qM5s", "01u90000006qM5q"], "PRODUCT.NAME": ["\u003Ca href=\"/01t900000048u4G\"\u003E\u003Cspan\u003EGenWatt Diesel 1000kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u49\"\u003E\u003Cspan\u003EGenWatt Diesel 10kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u48\"\u003E\u003Cspan\u003EGenWatt Diesel 200kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4N\"\u003E\u003Cspan\u003EGenWatt Gasoline 2000kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4L\"\u003E\u003Cspan\u003EGenWatt Gasoline 300kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4I\"\u003E\u003Cspan\u003EGenWatt Gasoline 750kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4E\"\u003E\u003Cspan\u003EGenWatt Propane 100kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4F\"\u003E\u003Cspan\u003EGenWatt Propane 1500kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4C\"\u003E\u003Cspan\u003EGenWatt Propane 500kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4A\"\u003E\u003Cspan\u003EInstallation: Industrial - High\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4M\"\u003E\u003Cspan\u003EInstallation: Industrial - Low\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4O\"\u003E\u003Cspan\u003EInstallation: Industrial - Medium\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4J\"\u003E\u003Cspan\u003EInstallation: Portable\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4H\"\u003E\u003Cspan\u003ESLA: Bronze\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4K\"\u003E\u003Cspan\u003ESLA: Gold\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4D\"\u003E\u003Cspan\u003ESLA: Platinum\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4B\"\u003E\u003Cspan\u003ESLA: Silver\u003C/span\u003E\u003C/a\u003E"], "PRODUCT2.DESCRIPTION": ["&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;"], "PRODUCT.CUSTOMER_PRODUCT_ID": ["\u003Ca href=\"/01t900000048u4G\"\u003E\u003Cspan\u003EGC1060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u49\"\u003E\u003Cspan\u003EGC1020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u48\"\u003E\u003Cspan\u003EGC1040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4N\"\u003E\u003Cspan\u003EGC5060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4L\"\u003E\u003Cspan\u003EGC5020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4I\"\u003E\u003Cspan\u003EGC5040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4E\"\u003E\u003Cspan\u003EGC3020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4F\"\u003E\u003Cspan\u003EGC3060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4C\"\u003E\u003Cspan\u003EGC3040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4A\"\u003E\u003Cspan\u003EIN7080\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4M\"\u003E\u003Cspan\u003EIN7040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4O\"\u003E\u003Cspan\u003EIN7060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4J\"\u003E\u003Cspan\u003EIN7020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4H\"\u003E\u003Cspan\u003ESL9020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4K\"\u003E\u003Cspan\u003ESL9060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4D\"\u003E\u003Cspan\u003ESL9080\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4B\"\u003E\u003Cspan\u003ESL9040\u003C/span\u003E\u003C/a\u003E"], "PRODUCT.DEFAULT_PRICE": ["￥100,000.00", "￥5,000.00", "￥25,000.00", "￥150,000.00", "￥35,000.00", "￥75,000.00", "￥15,000.00", "￥120,000.00", "￥50,000.00", "￥85,000.00", "￥20,000.00", "￥50,000.00", "￥5,000.00", "￥10,000.00", "￥30,000.00", "￥40,000.00", "￥20,000.00"], "ACTION_COLUMN_LABELS": [] }, "filter": { "staticTranslation": false, "scopeEntity": "", "scope": 2, "entityType": "01u", "type": "PricebookEntry", "editable": true, "scopeEntity2": "", "bodyClass": "pricebookentryTab", "isCloneable": true, "showCheckBox": true, "isCreateNewDisplayed": true, "shownColumns": [{ "matchBlanks": false, "useRolodex": true, "fieldType": "ENTITYID", "mruAutoComplete": [], "domain": [["产品", "01t"]], "isSortable": true, "columnName": "PRODUCT.NAME", "label": "产品名称", "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "Product2", "useNewLookups": false }, { "useRolodex": true, "isSortable": true, "columnName": "PRODUCT.CUSTOMER_PRODUCT_ID", "label": "产品代码" }, { "useRolodex": false, "fieldType": "CURRENCY", "isSortable": true, "columnName": "PRODUCT.DEFAULT_PRICE", "label": "价目表价格", "fieldId": "UnitPrice" }, { "useRolodex": true, "isSortable": true, "columnName": "PRODUCT2.DESCRIPTION", "label": "产品描述" }, { "useRolodex": true, "isSortable": true, "columnName": "PRODUCT2.FAMILY_ENUM", "label": "产品系列"}], "filters": [] }, "totalRowCount": 17 }, '80190000000PJyk', '/_ui/busop/orderitem/OrderItemListServlet');*/
                                    <%=InitJson%>
                                </script>
                                <div class="individualPalette listViewportWrapper" id="lineItemView_wrapper">
                                    <div class="listViewport opportunityBlock" id="lineItemView_listViewport">
                                        <form action="" id="lineItemView_actionForm" method="POST" name="lineItemView_actionForm"
                                        onsubmit="return ListViewport.instances['lineItemView'].verify('请至少选择一行')">
                                        <input type="hidden" id="lineItemView_pageState" name="lineItemView_pageState" value="" /><input
                                            type="hidden" id="lineItemView_rolodexState" name="lineItemView_rolodexState"
                                            value="" /><div class="topNav primaryPalette" id="lineItemView_topNav" style="display:none">
                                                <div class="controls">
                                                    <h2 class="title">
                                                    </h2>
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
                                                                                                                                                                    class="listItem listItemLast"><span class="listItemPad">全部</span></a></div>
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
                                            正在加载...</div>
                                    </div>
                                    <div class="feedContainer" id="lineItemView_feedContainer" style="display: none">
                                        <div class="feedBody" id="lineItemView_feedBody">
                                        </div>
                                    </div>
                                </div>
                                <!-- Body events -->
                                <script type="text/javascript">
                                    function bodyOnLoad() {
                                        onLoadCriteria(); setFocusOnLoad();
                                        //jQuery("#treeRootNode").height(jQuery("#lineItemView_wrapper").height());
                                        if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQxTkROYSx4c3dtLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&isAjaxRequest=1&renderMode=RETRO&nocache=1437552855562'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQyT1RSYSw2cDlmLE1HVXdaalF3"; };
                                    } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
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
                       </tr> </table>
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script>        //     var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1437560002000, "host": "", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>
    <script>        //     (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script>        //     (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
</body>
</html>
<!-- page generation time: 187ms -->
