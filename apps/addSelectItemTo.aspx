<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addSelectItemTo.aspx.cs" Inherits="WebClient.apps.addSelectItemTo" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title><%=PageTitle%>选择适用于：<%=AddToTitle%> - Developer Edition</title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/SelectionSearchPage.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/LineItem.js"></script>
    <script src="/jslibrary/sfdc/SearchOnly.js"></script>
       <script src="/jslibrary/sfdc/EntityCustomSearchPage.js"></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-MM-dd HH:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1463516018000", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "timeFormat": "HH:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Survey';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1461274792000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1461274792000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1461274792000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/EXT/ext-3.3.3/resources/css/ext-all-notheme.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1461274792000/Theme3/zh/base/ExtCSS-SFDC.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1461274792000/Theme3/zh/base/SelectionSearchPage.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1459383356000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1463541318000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1461274792000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>             window.sfdcPage = new EntityCustomSearchPage();</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>//ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.207.50.248', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fp%2Fopp%2FSelectSearch%3FaddTo%3D0069000000QASJY%26retURL%3D%252F0069000000QASJY');</script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif <%=TabCss%>  SelectSearch  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
     <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" /><div id="contentWrapper">
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
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" title="内容在此开始" /></a><div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img src="/s.gif" alt="<%=AddToTitle%> " class="pageTitleIcon" title="<%=AddToTitle%>" /><h1 class="noSecondHeader pageType"><%=PageTitle%>选择适用于：<%=AddToTitle%> </h1>
                                        <div class="blank">&nbsp;</div>
                                    </div>
                                    <div class="links"><a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);" title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt="" class="helpIcon" /></a></div>
                                </div>
                                <div class="ptBreadcrumb"></div>
                            </div>
                        <div class="bOverviewSearch">
                            <div class="view">输入关键字和筛选条件，然后单击“搜索”以开始搜索。单击“更多筛选器”以使用一个以上的筛选器。搜索结果包括与所输入关键字和筛选条件匹配的所有记录。</div>
                        </div>                        
                        <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
                        <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
                          <script src="/static/111213/js/picklist.js"></script>
                          <script src="/js/searchFilterField.js"></script>
                        <script src="/apps/CommandProcessor.ashx?cmd=picklist&e=<%=ObjectTypeCode%>&amp;h=%2BoZDvGnbcaPTq%2BeM%2FeiE6ka%2BQxvs%2BYMIg0fvSWH0Ibo%3D&amp;v=1412752376000&amp;layout=00h9000000RbNyf&amp;mo=EDITLOAD&amp;esc=HTML&amp;l=zh_CN&amp;pr=1.25&amp;t=0"></script>
                        <form action="<%=ActionURL%>" id="dispatch" method="post" name="dispatch"  onsubmit="if (window.ffInAlert) { return false; }">
                              <input type="hidden" value="<%=ObjectTypeCode%>" id="objectTypeCode" name="objectTypeCode"  />  
                            <input type="hidden" name="svyId" id="svyId" value="<%=Request["addTo"]%>" /><input type="hidden" name="retURL" id="retURL" value="/0069000000QASJY" /><input type="hidden" name="save_new_url" id="save_new_url" value="/p/opp/SelectSearch?addTo=0069000000QASJY&amp;retURL=%2F0069000000QASJY" /><div class="selectButtons">
                                <input value=" 选择 " style="height:25px;" class="btn" name="edit" onclick="return window.sfdcPage.verifyChecked(dispatch, 'ids', '请至少选择一行', '您不能选择多于 50 行。')" title="选择" type="button" />&nbsp;<input value=" 取消 " style="height:25px;" class="btn" name="cancel" onclick="    window.sfdcPage.selectionCancel(dispatch)" title="取消" type="button" /></div>
                            <div class="pricebookentryBlock">
                                <div class="bPageBlock brandSecondaryBrd">
                                    <div class="pbHeader" id="lineItemView_searchHeader">
                                        <table border="0" cellpadding="0" cellspacing="0" summary="用户等">
                                            <tr>
                                                <td class="pbTitle">
                                                    <img src="/s.gif" alt="" width="12" height="1" class="minWidth" style="margin-right: 0.25em;" title="" /><img src="/s.gif" alt="" class="relatedListIcon" title="" /><h3><span class="searchFirstCell">查找<%=PageTitle%></span></h3>
                                                </td>
                                                <td class="pbButton">&nbsp;</td>
                                                <td class="pbHelp"><!--<span class="searchCustomization">
                                                    <div class="menuButton" id="comboButtonPricebookEntry">
                                                        <div class="menuButtonButton" id="comboButtonPricebookEntryButton"><span class="menuButtonLabel" id="comboButtonPricebookEntryLabel" tabindex="0">自定义...</span></div>
                                                        <div class="menuButtonMenu" id="comboButtonPricebookEntryMenu"><a href="/p/setup/layout/ListLayoutEdit?retURL=%2Fp%2Fopp%2FSelectSearch%3FaddTo%3D0069000000QASJY%26retURL%3D%252F0069000000QASJY&amp;LayoutType=SearchResult&amp;LayoutEntity=PricebookEntry&amp;fromCustomizeButton=1&amp;setupid=PricebookEntrySearchLayouts" class="menuButtonMenuLink firstMenuItem">用于所有用户的列</a></div>
                                                    </div>
                                                    <script>new MenuButton('comboButtonPricebookEntry', false);</script>
                                                </span>
                                                    <script>window.sfdcPage.addCloser('PricebookEntry');</script>
                                                    &nbsp;--></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <div class="searchFilterFieldsHolder searchFilterFieldsHolderFirst" id="field_name_PricebookEntry">
                                                        <table class="searchFilterFields">
                                                           <tr valign="top">
                                                                <td class="keywordElement" style="width: 5%"><span class="inputTitle">按关键字</span><br />
                                                                    <input id="search" maxlength="255" name="search" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)" size="20" title="搜索" type="text" value="" /><br />
                                                                    &nbsp;</td>
                                                                <td><!--<span class="inputTitle">按字段筛选条件</span><br />-->
                                                                      <%=SearchFilterHTML%>     <!--
                                                                    <div class="searchFilterSelectionElement">
                                                                        <div>
                                                                            <select id="PricebookEntrycol0" name="PricebookEntrycol0" onchange="updateOperator(this, 'PricebookEntryoper0');" title="字段 1">
                                                                                <option value="">--无--</option>
                                                                                <option value="PRICEBOOK.NAME">价格手册名</option>
                                                                                <option value="PRICEBOOK.ACTIVE">已启用 (价格手册)</option>
                                                                                <option value="PRODUCT.NAME">产品名称</option>
                                                                                <option value="PRODUCT.CUSTOMER_PRODUCT_ID">产品代码</option>
                                                                                <option value="PRODUCT2.FAMILY_ENUM">产品系列</option>
                                                                                <option value="PRODUCT.DEFAULT_PRICE">价目表价格</option>
                                                                                <option value="PB_ENTRY.USE_STANDARD_PRICE">使用标准价格</option>
                                                                                <option value="PRODUCT.ACTIVE">已启用（价格）</option>
                                                                                <option value="PRODUCT2.DESCRIPTION">产品描述</option>
                                                                                <option value="PB_ENTRY.CREATED_DATE">创建日期</option>
                                                                                <option value="PB_ENTRY.LAST_UPDATE">上次修改日期</option>
                                                                                <option value="CREATEDBY_USER.ALIAS">创建人别名</option>
                                                                                <option value="UPDATEDBY_USER.ALIAS">上次更新人别名</option>
                                                                                <option value="PRODUCT2.ACTIVE">已启用 (产品)</option>
                                                                            </select><select id="PricebookEntryoper0" name="PricebookEntryoper0" title="运算符 1"><option value="">--无--</option>
                                                                                <option value="e">等于</option>
                                                                                <option value="n">不等于</option>
                                                                                <option value="s">起始字符</option>
                                                                                <option value="c">包含</option>
                                                                                <option value="k">不包含</option>
                                                                                <option value="l">小于</option>
                                                                                <option value="g">大于</option>
                                                                                <option value="m">小于或等于</option>
                                                                                <option value="h">大于或等于</option>
                                                                                <option value="u">包括</option>
                                                                                <option value="x">不包括</option>
                                                                                <option value="w">在范围内</option>
                                                                            </select><input id="PricebookEntryfval0" maxlength="80" name="PricebookEntryfval0" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)" size="20" title="值 1" type="text" /><span class="textBox" id="PricebookEntryandConnectorId0" style="display: none">AND</span><a href="" id="PricebookEntryshowMoreId0" onclick="toggleDisplayWithDisplayType('PricebookEntryandConnectorId0','inline');toggleDisplayWithDisplayType('PricebookEntryshowMoreId0','inline');toggleVisWithPositionAbsolute('PricebookEntryotherRows0');return false;">更多筛选器 >></a>
                                                                        </div>
                                                                        <div id="PricebookEntryotherRows0" style="visibility: hidden; position: absolute">
                                                                            <select id="PricebookEntrycol1" name="PricebookEntrycol1" onchange="updateOperator(this, 'PricebookEntryoper1');" title="字段 2">
                                                                                <option value="">--无--</option>
                                                                                <option value="PRICEBOOK.NAME">价格手册名</option>
                                                                                <option value="PRICEBOOK.ACTIVE">已启用 (价格手册)</option>
                                                                                <option value="PRODUCT.NAME">产品名称</option>
                                                                                <option value="PRODUCT.CUSTOMER_PRODUCT_ID">产品代码</option>
                                                                                <option value="PRODUCT2.FAMILY_ENUM">产品系列</option>
                                                                                <option value="PRODUCT.DEFAULT_PRICE">价目表价格</option>
                                                                                <option value="PB_ENTRY.USE_STANDARD_PRICE">使用标准价格</option>
                                                                                <option value="PRODUCT.ACTIVE">已启用（价格）</option>
                                                                                <option value="PRODUCT2.DESCRIPTION">产品描述</option>
                                                                                <option value="PB_ENTRY.CREATED_DATE">创建日期</option>
                                                                                <option value="PB_ENTRY.LAST_UPDATE">上次修改日期</option>
                                                                                <option value="CREATEDBY_USER.ALIAS">创建人别名</option>
                                                                                <option value="UPDATEDBY_USER.ALIAS">上次更新人别名</option>
                                                                                <option value="PRODUCT2.ACTIVE">已启用 (产品)</option>
                                                                            </select><select id="PricebookEntryoper1" name="PricebookEntryoper1" title="运算符 2"><option value="">--无--</option>
                                                                                <option value="e">等于</option>
                                                                                <option value="n">不等于</option>
                                                                                <option value="s">起始字符</option>
                                                                                <option value="c">包含</option>
                                                                                <option value="k">不包含</option>
                                                                                <option value="l">小于</option>
                                                                                <option value="g">大于</option>
                                                                                <option value="m">小于或等于</option>
                                                                                <option value="h">大于或等于</option>
                                                                                <option value="u">包括</option>
                                                                                <option value="x">不包括</option>
                                                                                <option value="w">在范围内</option>
                                                                            </select><input id="PricebookEntryfval1" maxlength="80" name="PricebookEntryfval1" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)" size="20" title="值 2" type="text" /><span class="textBox">AND</span><br />
                                                                            <select id="PricebookEntrycol2" name="PricebookEntrycol2" onchange="updateOperator(this, 'PricebookEntryoper2');" title="字段 3">
                                                                                <option value="">--无--</option>
                                                                                <option value="PRICEBOOK.NAME">价格手册名</option>
                                                                                <option value="PRICEBOOK.ACTIVE">已启用 (价格手册)</option>
                                                                                <option value="PRODUCT.NAME">产品名称</option>
                                                                                <option value="PRODUCT.CUSTOMER_PRODUCT_ID">产品代码</option>
                                                                                <option value="PRODUCT2.FAMILY_ENUM">产品系列</option>
                                                                                <option value="PRODUCT.DEFAULT_PRICE">价目表价格</option>
                                                                                <option value="PB_ENTRY.USE_STANDARD_PRICE">使用标准价格</option>
                                                                                <option value="PRODUCT.ACTIVE">已启用（价格）</option>
                                                                                <option value="PRODUCT2.DESCRIPTION">产品描述</option>
                                                                                <option value="PB_ENTRY.CREATED_DATE">创建日期</option>
                                                                                <option value="PB_ENTRY.LAST_UPDATE">上次修改日期</option>
                                                                                <option value="CREATEDBY_USER.ALIAS">创建人别名</option>
                                                                                <option value="UPDATEDBY_USER.ALIAS">上次更新人别名</option>
                                                                                <option value="PRODUCT2.ACTIVE">已启用 (产品)</option>
                                                                            </select><select id="PricebookEntryoper2" name="PricebookEntryoper2" title="运算符 3"><option value="">--无--</option>
                                                                                <option value="e">等于</option>
                                                                                <option value="n">不等于</option>
                                                                                <option value="s">起始字符</option>
                                                                                <option value="c">包含</option>
                                                                                <option value="k">不包含</option>
                                                                                <option value="l">小于</option>
                                                                                <option value="g">大于</option>
                                                                                <option value="m">小于或等于</option>
                                                                                <option value="h">大于或等于</option>
                                                                                <option value="u">包括</option>
                                                                                <option value="x">不包括</option>
                                                                                <option value="w">在范围内</option>
                                                                            </select><input id="PricebookEntryfval2" maxlength="80" name="PricebookEntryfval2" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)" size="20" title="值 3" type="text" /><span class="textBox">AND</span><br />
                                                                            <select id="PricebookEntrycol3" name="PricebookEntrycol3" onchange="updateOperator(this, 'PricebookEntryoper3');" title="字段 4">
                                                                                <option value="">--无--</option>
                                                                                <option value="PRICEBOOK.NAME">价格手册名</option>
                                                                                <option value="PRICEBOOK.ACTIVE">已启用 (价格手册)</option>
                                                                                <option value="PRODUCT.NAME">产品名称</option>
                                                                                <option value="PRODUCT.CUSTOMER_PRODUCT_ID">产品代码</option>
                                                                                <option value="PRODUCT2.FAMILY_ENUM">产品系列</option>
                                                                                <option value="PRODUCT.DEFAULT_PRICE">价目表价格</option>
                                                                                <option value="PB_ENTRY.USE_STANDARD_PRICE">使用标准价格</option>
                                                                                <option value="PRODUCT.ACTIVE">已启用（价格）</option>
                                                                                <option value="PRODUCT2.DESCRIPTION">产品描述</option>
                                                                                <option value="PB_ENTRY.CREATED_DATE">创建日期</option>
                                                                                <option value="PB_ENTRY.LAST_UPDATE">上次修改日期</option>
                                                                                <option value="CREATEDBY_USER.ALIAS">创建人别名</option>
                                                                                <option value="UPDATEDBY_USER.ALIAS">上次更新人别名</option>
                                                                                <option value="PRODUCT2.ACTIVE">已启用 (产品)</option>
                                                                            </select><select id="PricebookEntryoper3" name="PricebookEntryoper3" title="运算符 4"><option value="">--无--</option>
                                                                                <option value="e">等于</option>
                                                                                <option value="n">不等于</option>
                                                                                <option value="s">起始字符</option>
                                                                                <option value="c">包含</option>
                                                                                <option value="k">不包含</option>
                                                                                <option value="l">小于</option>
                                                                                <option value="g">大于</option>
                                                                                <option value="m">小于或等于</option>
                                                                                <option value="h">大于或等于</option>
                                                                                <option value="u">包括</option>
                                                                                <option value="x">不包括</option>
                                                                                <option value="w">在范围内</option>
                                                                            </select><input id="PricebookEntryfval3" maxlength="80" name="PricebookEntryfval3" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)" size="20" title="值 4" type="text" /><span class="textBox">AND</span><br />
                                                                            <select id="PricebookEntrycol4" name="PricebookEntrycol4" onchange="updateOperator(this, 'PricebookEntryoper4');" title="字段 5">
                                                                                <option value="">--无--</option>
                                                                                <option value="PRICEBOOK.NAME">价格手册名</option>
                                                                                <option value="PRICEBOOK.ACTIVE">已启用 (价格手册)</option>
                                                                                <option value="PRODUCT.NAME">产品名称</option>
                                                                                <option value="PRODUCT.CUSTOMER_PRODUCT_ID">产品代码</option>
                                                                                <option value="PRODUCT2.FAMILY_ENUM">产品系列</option>
                                                                                <option value="PRODUCT.DEFAULT_PRICE">价目表价格</option>
                                                                                <option value="PB_ENTRY.USE_STANDARD_PRICE">使用标准价格</option>
                                                                                <option value="PRODUCT.ACTIVE">已启用（价格）</option>
                                                                                <option value="PRODUCT2.DESCRIPTION">产品描述</option>
                                                                                <option value="PB_ENTRY.CREATED_DATE">创建日期</option>
                                                                                <option value="PB_ENTRY.LAST_UPDATE">上次修改日期</option>
                                                                                <option value="CREATEDBY_USER.ALIAS">创建人别名</option>
                                                                                <option value="UPDATEDBY_USER.ALIAS">上次更新人别名</option>
                                                                                <option value="PRODUCT2.ACTIVE">已启用 (产品)</option>
                                                                            </select><select id="PricebookEntryoper4" name="PricebookEntryoper4" title="运算符 5"><option value="">--无--</option>
                                                                                <option value="e">等于</option>
                                                                                <option value="n">不等于</option>
                                                                                <option value="s">起始字符</option>
                                                                                <option value="c">包含</option>
                                                                                <option value="k">不包含</option>
                                                                                <option value="l">小于</option>
                                                                                <option value="g">大于</option>
                                                                                <option value="m">小于或等于</option>
                                                                                <option value="h">大于或等于</option>
                                                                                <option value="u">包括</option>
                                                                                <option value="x">不包括</option>
                                                                                <option value="w">在范围内</option>
                                                                            </select><input id="PricebookEntryfval4" maxlength="80" name="PricebookEntryfval4" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)" size="20" title="值 5" type="text" /><a href="" onclick="toggleDisplayWithDisplayType('PricebookEntryandConnectorId0','inline');toggleDisplayWithDisplayType('PricebookEntryshowMoreId0','inline');toggleVisWithPositionAbsolute('PricebookEntryotherRows0');return false;">较少筛选器 <<</a>
                                                                        </div>
                                                                        <ul></ul>
                                                                    </div>-->
                                                                
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <div class="searchFilterButtons productButtons">
                                                                        <input value=" 搜索 " class="btn" id="save_filter_PricebookEntry" name="saveButton" onclick="window.sfdcPage.filterResults(null, '/p/opp/SelectSearch?srtOrd=1&addTo=0069000000QASJY&offset=0', '/p/opp/SelectSearch?srtOrd=1&isNFltr=1&addTo=0069000000QASJY&offset=0&relatedListId=PricebookEntry', 'noh=1', 'PricebookEntry', 5); return false" title="搜索" type="button" /></div>
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
                            <!--<script src="/static/111213/js/picklist.js"></script>-->
                            <script>//new LineItemListViewport('lineItemView', 'PricebookEntry', { "buttons": [], "retURL": "/01u?rolodexIndex=-1&page=1", "listData": { "LIST_RECORD_ID": ["01u90000006qM5v", "01u90000006qM5o", "01u90000006qM5n", "01u90000006qM62", "01u90000006qM60", "01u90000006qM5x", "01u90000006qM5t", "01u90000006qM5u", "01u90000006qM5r", "01u90000006qM5p", "01u90000006qM61", "01u90000006qM63", "01u90000006qM5y", "01u90000006qM5w", "01u90000006qM5z", "01u90000006qM5s", "01u90000006qM5q"], "ACTION_COLUMN": [], "PRODUCT.DEFAULT_PRICE": ["￥100,000.00", "￥5,000.00", "￥25,000.00", "￥150,000.00", "￥35,000.00", "￥75,000.00", "￥15,000.00", "￥120,000.00", "￥50,000.00", "￥85,000.00", "￥20,000.00", "￥50,000.00", "￥5,000.00", "￥10,000.00", "￥30,000.00", "￥40,000.00", "￥20,000.00"], "PRODUCT2.DESCRIPTION": ["&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;"], "PRODUCT.CUSTOMER_PRODUCT_ID": ["\u003Ca href=\"/01t900000048u4G\"\u003E\u003Cspan\u003EGC1060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u49\"\u003E\u003Cspan\u003EGC1020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u48\"\u003E\u003Cspan\u003EGC1040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4N\"\u003E\u003Cspan\u003EGC5060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4L\"\u003E\u003Cspan\u003EGC5020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4I\"\u003E\u003Cspan\u003EGC5040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4E\"\u003E\u003Cspan\u003EGC3020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4F\"\u003E\u003Cspan\u003EGC3060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4C\"\u003E\u003Cspan\u003EGC3040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4A\"\u003E\u003Cspan\u003EIN7080\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4M\"\u003E\u003Cspan\u003EIN7040\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4O\"\u003E\u003Cspan\u003EIN7060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4J\"\u003E\u003Cspan\u003EIN7020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4H\"\u003E\u003Cspan\u003ESL9020\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4K\"\u003E\u003Cspan\u003ESL9060\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4D\"\u003E\u003Cspan\u003ESL9080\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4B\"\u003E\u003Cspan\u003ESL9040\u003C/span\u003E\u003C/a\u003E"], "PRODUCT2.FAMILY_ENUM": ["&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;", "&nbsp;"], "ACTION_COLUMN_LABELS": [], "PRODUCT.NAME": ["\u003Ca href=\"/01t900000048u4G\"\u003E\u003Cspan\u003EGenWatt Diesel 1000kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u49\"\u003E\u003Cspan\u003EGenWatt Diesel 10kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u48\"\u003E\u003Cspan\u003EGenWatt Diesel 200kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4N\"\u003E\u003Cspan\u003EGenWatt Gasoline 2000kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4L\"\u003E\u003Cspan\u003EGenWatt Gasoline 300kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4I\"\u003E\u003Cspan\u003EGenWatt Gasoline 750kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4E\"\u003E\u003Cspan\u003EGenWatt Propane 100kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4F\"\u003E\u003Cspan\u003EGenWatt Propane 1500kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4C\"\u003E\u003Cspan\u003EGenWatt Propane 500kW\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4A\"\u003E\u003Cspan\u003EInstallation: Industrial - High\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4M\"\u003E\u003Cspan\u003EInstallation: Industrial - Low\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4O\"\u003E\u003Cspan\u003EInstallation: Industrial - Medium\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4J\"\u003E\u003Cspan\u003EInstallation: Portable\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4H\"\u003E\u003Cspan\u003ESLA: Bronze\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4K\"\u003E\u003Cspan\u003ESLA: Gold\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4D\"\u003E\u003Cspan\u003ESLA: Platinum\u003C/span\u003E\u003C/a\u003E", "\u003Ca href=\"/01t900000048u4B\"\u003E\u003Cspan\u003ESLA: Silver\u003C/span\u003E\u003C/a\u003E"] }, "capped": false, "hasMassActions": false, "entityButtons": [], "rowsPerPage": 100, "rolodexIndex": -1, "inlineEditData": { "saveUrl": "/_ui/common/udd/object/InlineEditListSave", "editable": false, "massEditable": false }, "filter": { "editable": true, "entityType": "01u", "filters": [], "type": "PricebookEntry", "staticTranslation": false, "scopeEntity2": "", "showCheckBox": true, "isCloneable": true, "isCreateNewDisplayed": true, "bodyClass": "pricebookentryTab", "scope": 2, "scopeEntity": "", "shownColumns": [{ "useRolodex": true, "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "useNewLookups": false, "isSortable": true, "label": "产品名称", "matchBlanks": false, "domain": [["产品", "01t"]], "mruAutoComplete": [], "fieldType": "ENTITYID", "columnName": "PRODUCT.NAME", "fieldId": "Product2" }, { "useRolodex": true, "isSortable": true, "label": "产品代码", "columnName": "PRODUCT.CUSTOMER_PRODUCT_ID" }, { "useRolodex": false, "isSortable": true, "label": "价目表价格", "fieldType": "CURRENCY", "columnName": "PRODUCT.DEFAULT_PRICE", "fieldId": "UnitPrice" }, { "useRolodex": true, "isSortable": true, "label": "产品描述", "columnName": "PRODUCT2.DESCRIPTION" }, { "useRolodex": true, "isSortable": true, "label": "产品系列", "columnName": "PRODUCT2.FAMILY_ENUM" }] }, "sortState": [{ "field": "PRODUCT.NAME", "dir": "ASC" }], "printURL": "/01u?rolodexIndex=-1&page=1", "totalRowCount": 17, "page": 1, "listButtons": [] }, '0069000000QASJY', '/_ui/sales/opportunity/lineitem/OppLineItemListServlet');</script>
                            <script><%=InitJson%></script>
                            <div class="individualPalette listViewportWrapper" id="lineItemView_wrapper">
                                <div class="listViewport opportunityBlock" id="lineItemView_listViewport">
                                    <form action="" id="lineItemView_actionForm" method="POST" name="lineItemView_actionForm" onsubmit="return ListViewport.instances['lineItemView'].verify('请至少选择一行')">
                                        <input type="hidden" id="lineItemView_pageState" name="lineItemView_pageState" value="" /><input type="hidden" id="lineItemView_rolodexState" name="lineItemView_rolodexState" value="" /><div class="topNav primaryPalette" id="lineItemView_topNav">
                                            <div class="controls">
                                                <h2 class="title"></h2>
                                                <span class="divisionLabel" id="lineItemView_divisionLabel"></span>
                                                <div class="topNavTab" id="lineItemView_topNavTab"></div>
                                                <div class="clearingBox"></div>
                                            </div>
                                        </div>
                                        <div class="subNav" id="lineItemView_subNav">
                                            <div class="linkBar brandSecondaryBrd">
                                                <div class="listButtons" id="lineItemView_listButtons"></div>
                                                <div class="clearFilter" id="lineItemView_clearFilter"></div>
                                                <div class="rolodex" id="lineItemView_rolodex" style="visibility: hidden"><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A0%7D%29" class="listItem"><span class="listItemPad">A</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A1%7D%29" class="listItem"><span class="listItemPad">B</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A2%7D%29" class="listItem"><span class="listItemPad">C</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A3%7D%29" class="listItem"><span class="listItemPad">D</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A4%7D%29" class="listItem"><span class="listItemPad">E</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A5%7D%29" class="listItem"><span class="listItemPad">F</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A6%7D%29" class="listItem"><span class="listItemPad">G</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A7%7D%29" class="listItem"><span class="listItemPad">H</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A8%7D%29" class="listItem"><span class="listItemPad">I</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A9%7D%29" class="listItem"><span class="listItemPad">J</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A10%7D%29" class="listItem"><span class="listItemPad">K</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A11%7D%29" class="listItem"><span class="listItemPad">L</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A12%7D%29" class="listItem"><span class="listItemPad">M</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A13%7D%29" class="listItem"><span class="listItemPad">N</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A14%7D%29" class="listItem"><span class="listItemPad">O</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A15%7D%29" class="listItem"><span class="listItemPad">P</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A16%7D%29" class="listItem"><span class="listItemPad">Q</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A17%7D%29" class="listItem"><span class="listItemPad">R</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A18%7D%29" class="listItem"><span class="listItemPad">S</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A19%7D%29" class="listItem"><span class="listItemPad">T</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A20%7D%29" class="listItem"><span class="listItemPad">U</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A21%7D%29" class="listItem"><span class="listItemPad">V</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A22%7D%29" class="listItem"><span class="listItemPad">W</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A23%7D%29" class="listItem"><span class="listItemPad">X</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A24%7D%29" class="listItem"><span class="listItemPad">Y</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A25%7D%29" class="listItem"><span class="listItemPad">Z</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:26})" class="listItem"><span class="listItemPad">其他</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:-1})" class="listItem listItemLast"><span class="listItemPad">全部</span></a></div>
                                                <div class="clearingBox"></div>
                                            </div>
                                        </div>
                                        <div class="listBody" id="lineItemView_listBody">
                                            <div class="exception" id="lineItemView_exception"></div>
                                        </div>
                                        <div class="offPageIds" id="lineItemView_offPageIds"></div>
                                    </form>
                                    <div class="bottomNav" id="lineItemView_bottomNav">正在加载...</div>
                                </div>
                                <div class="feedContainer" id="lineItemView_feedContainer" style="display: none">
                                    <div class="feedBody" id="lineItemView_feedBody"></div>
                                </div>
                            </div>
                            <!-- Body events -->
                            <!--onLoadCriteria();-->
                            <script type="text/javascript">function bodyOnLoad() {  setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fp%2Fopp%2FSelectSearch%3FaddTo%3D0069000000QASJY%26retURL%3D%252F0069000000QASJY&isAjaxRequest=1&renderMode=RETRO&nocache=1464002974221'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd05TMHlObFF4TVRveU9Ub3pOQzR5TlRaYSxheTNaMWp2a1FEWUJxeVBtbWczaDdmLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                            <div class="datePicker" id="datePicker">
                                <div class="dateBar">
                                    <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();" onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker" name="calMonthPicker" title="月"><option value="0">一月</option>
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
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';" onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';" title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                    </select>
                                </div>
                                <div class="calBody">
                                    <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                        <tr>
                                            <th class="dayOfWeek" scope="col">星期日</th>
                                            <th class="dayOfWeek" scope="col">星期一</th>
                                            <th class="dayOfWeek" scope="col">星期二</th>
                                            <th class="dayOfWeek" scope="col">星期三</th>
                                            <th class="dayOfWeek" scope="col">星期四</th>
                                            <th class="dayOfWeek" scope="col">星期五</th>
                                            <th class="dayOfWeek" scope="col">星期六</th>
                                        </tr>
                                        <tr class="calRow" id="calRow1">
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        </tr>
                                        <tr class="calRow" id="calRow2">
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        </tr>
                                        <tr class="calRow" id="calRow3">
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        </tr>
                                        <tr class="calRow" id="calRow4">
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        </tr>
                                        <tr class="calRow" id="calRow5">
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        </tr>
                                        <tr class="calRow" id="calRow6">
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                            <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <div class="buttonBar"><a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">今天</a></div>
                                </div>
                            </div>
                            <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div><!--
    <script>var SFDCSessionVars = { "uid": "0059000000390Wh", "server": "", "act": "u", "host": "", "oid": "00D90000000yvHG", "exp": 1464010152000 };</script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1452545182000/sfdc/SfdcSessionBase198.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1450392800000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>-->
</body>
</html>
<!-- page generation time: 80ms -->

