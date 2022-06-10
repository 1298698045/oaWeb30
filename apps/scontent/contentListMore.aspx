<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contentListMore.aspx.cs"
    Inherits="WebClient.apps.scontent.contentListMore" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>内容：更多 ~ </title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet"
        type="text/css" />
    <!--
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/AssociationQueue.css"
        rel="stylesheet" type="text/css" />-->
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/HelpBubble.css" rel="stylesheet"
        type="text/css" />
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
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script>        window.sfdcPage = new EditableListPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1421084164000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": true }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-MM-dd HH:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Home';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/EXT/ext-3.3.3/resources/css/ext-all-notheme.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/ExtCSS-SFDC.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/AssociationQueue.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        // ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '111.161.17.22', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F6AC%3Fsrc%3D8');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif homeTab  listPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
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
                    <td id="sidebarCell" class=" sidebarCell sidebarCollapsible sidebarCollapsed">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><!--<h1 class="pageType noSecondHeader">
                                                ：</h1>-->
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links"><!--
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" />--></a>
                                        </div>
                                    </div>
                                    <div class="queueHeader">
                                        <h3>更多</h3>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <script type="text/javascript">
                        </script>
                        <div class="bOverviewSearch">
                            输入查询日期、关键字。<div class="pbSearch">
                                <div class="pbSearch" style="font-size:14px;">
                                    <form onsubmit="if (window.ffInAlert) { return false; }" name="srch" method="GET" id="srch" action="/apps/scontent/contentListMore.aspx?t=home">
                                        <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="hiddenFields" />
                                         <table>
                                            <tr>
                                                <td>                                           
                                    日期：从<input type="text" value="" style="height:20px;" id="srch_StartDate" name="srch_StartDate" onfocus="DatePicker.pickDate(false, 'srch_StartDate', false);" size="12" tabindex="7">
                                    至 <input type="text" value="" style="height:20px;" id="srch_EndDate" name="srch_EndDate" onfocus="DatePicker.pickDate(false, 'srch_EndDate', false);" size="12" tabindex="8"></td>
                                     <td nowrap="nowrap">  科室：
                                        <input value="" id="businessunitid_lkid" name="businessunitid_lkid" type="hidden"><input value="" id="businessunitid_lkold" name="businessunitid_lkold" type="hidden"><input value="10" id="businessunitid_lktp" name="businessunitid_lktp" type="hidden"><input value="1" id="businessunitid_lspf" name="businessunitid_lspf" type="hidden"><input value="0" id="businessunitid_lspfsub" name="businessunitid_lspfsub" type="hidden"><input value="1" id="businessunitid_mod" name="businessunitid_mod" type="hidden"><span class="lookupInput"><input value="" tabindex="4" size="10" onchange="getElementByIdCS('businessunitid_lkid').value='';getElementByIdCS('businessunitid_mod').value='1';" name="businessunitid" maxlength="255" id="businessunitid" type="text"><a title="分支部门 查找（新窗口）" tabindex="4" onclick="setLastMousePosition(event)" id="businessunitid_lkwgt" href="javascript:openLookup('/_ui/common/data/DeptPicker.aspx?lkfm=editPage&amp;lknm=businessunitid&amp;lktp=' + getElementByIdCS('businessunitid_lktp').value,670,'1','&amp;lksrch=' + escapeUTF(getElementByIdCS('businessunitid').value.substring(0, 80)))"><img title="分支部门 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="分支部门 查找（新窗口）" src="/s.gif"></a></span>
                                       </td>
                                     <td>  栏目：  <cc1:FolderSelector runat="server" id="folderPicker" /></td>
                                     <td>  标题关键字：<input type="text" title="输入标题(关键字)" style="height:20px;" size="30" name="srch_Title" maxlength="1000" id="srch_Title" class="searchTextBox"><input type="submit" title="查找" name="searchBtn" class="btn" value=" 查找 "></td>
                                                 </tr>
                                        </table>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Begin ListElement -->
                        <!-- motif: Home -->
                        <!-- WrappingClass -->
                        <div class="bRelatedList">
                            <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                <form action="" autocomplete="off" id="actionForm" method="POST" name="actionForm"
                                    onsubmit="if (window.ffInAlert) { return false; }">
                                    <div class="pbHeader" style="display:none">

                                        <table id="headerTable" role="presentation">
                                            <tr class="queueButtonTR">
                                                <td>
                                                    <ul class="queueButtonPanelList" role="presentation">
                                                        <li class="pbTitle">
                                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;</li>
                                                        <li
                                                            class="queueButtonLI">
                                                            <div class="headerButtonDiv">
                                                                <div class="listHeader">
                                                                    <table>
                                                                        <tr>
                                                                            <td>栏目：</td>
                                                                            <td></td>
                                                                            <td>标题：</td>
                                                                            <td></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="listHeader" id="massAssociationButtonDiv">
                                                                <input value=" 查询 " class="btn" name="massAssociate" onclick=""
                                                                    title="查询" type="button" />
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="pbBody">
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th scope="col" class=" actionColumn"></th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    <a href="#" title="主题 - 单击此处按升序排序">标题</a>
                                                </th>
                                                <th scope="col" class=" DateElement zen-deemphasize">
                                                    <a href="#" title="日期 - 已按升序排序">日期<img src="/s.gif" alt="按升序排序" class="sortAsc" title="按升序排序" /></a>
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    <a href="#" title="发布部门 - 单击此处按升序排序">栏目</a>
                                                </th>
                                                 <th scope="col" class=" zen-deemphasize">
                                                    <a href="#" title="发布部门 - 单击此处按升序排序">发布部门</a>
                                                </th>
                                                <th scope="col" class=" zen-deemphasize">
                                                    <a href="#" title="发布人 - 单击此处按升序排序">发布人</a>
                                                </th>
                                            </tr>
                                            <!--
                                        <tr class="noRows">
                                            <td colspan="7">
                                                没有可显示的记录。
                                            </td>
                                        </tr>-->
                                            <%=GridBody%>
                                        </table>
                                        <div class="pShowMore" style="float:right">
                                            <a shouldstayinownframe="true" href="<%=PrePageUrl%>"><<上一页</a>
                                            <a shouldstayinownframe="true" href="<%=NextPageUrl%>">下一页>></a>
                                        </div>
                                        <!--
                                    <div class="pbInnerFooter">
                                        <table role="presentation">
                                            <tr>
                                                <td>
                                                    <ul class="queueButtonPanelList" role="presentation">
                                                        <li class="pbTitle">
                                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;</li><li
                                                                class="queueButtonLI">
                                                                <div class="footerButtonDiv">
                                                                    <div class="listHeader">
                                                                        <span>
                                                                            <input value=" 保存 " class="btn" name="save" onclick="this.form.action = '/6AC?src=11'"
                                                                                title="保存" type="submit" /></span> <span>
                                                                                    <input value=" 取消 " class="btn" name="cancel" onclick="navigateToUrl('/6AC?src=11','LIST_VIEW','cancel');"
                                                                                        title="取消" type="button" /></span>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    -->
                                    </div>
                                </form>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="listElementBottomNav">
                        </div>
                        <script>                            try { ListElement.createListElement('actionForm'); } catch (e) { }</script>
                        <!-- End ListElement -->
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMwd055MHlORlF3TVRvMU9UbzBPQzR6TWpkYSxaV2IyLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F6AC%3Fsrc%3D8&isAjaxRequest=1&renderMode=RETRO&nocache=1435283988351'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd055MHlORlF3TVRvMU9UbzBPQzR6TlROYSxXOFhhLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
<!-- page generation time: 102ms -->
