<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catelist.aspx.cs" Inherits="Supermore.content.catelist" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title>栏目</title>
    <script src="/static/js/perf/stub.js"></script>
    <cc1:PageTitle ID="PageTitle2" ResourceKey="Home" runat="server" />
    <cc1:StyleAdapter runat="server" ID="StyleAdapter1" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/homeCalendar.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/dashboard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/dashboardViewCommon.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/ChatterFiles.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/OnboardingSplash.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/WalkthroughCoreUI.css">
    <link href="/css/catelist.css" rel="stylesheet" />
    <link href="/css/contentsrc_result.css" rel="stylesheet" />
    <link href="/css/dashboard_icon.css" rel="stylesheet" />
    <link href="/css/new/swiper.min.css" rel="stylesheet" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/js/swiper.min.js"></script>

    <!-- <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DashboardViewTableHome.js"></script>
    <script src="/jslibrary/sfdc/HomeCalendar.js"></script>
    <script src="/jslibrary/sfdc/Scheduling.js"></script>-->
    <%----%>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410364524000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": false }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": false }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-MM-dd HH:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>
        /*try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/homeCalendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/dashboard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/dashboardViewCommon.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/OnboardingSplash.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }
        */
    </script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/jq.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/js/DashboardViewHome.js"></script>
    <link href="/content/video/zxf_page.css" rel="stylesheet" />
    <script src="/content/video/zxf_page.js"></script>
    <style>
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
        .view_tbody_title .active {
            color:#108AF9;
        }
        .result_right{
            overflow-y:auto;
        }
        li.result_left_ul_item_ul_item,li.result_left_ul_item_ul_item_ul_item{
            padding: 5px 10px 0px 20px !important;
        }
        .result_left_ul_item_ul_item:hover{
            background:none
        }
        .result_left_ul_item_a{
            padding: 11px 0px 11px 15px !important;
        }
        .result_left_ul_item_active{
            padding: 11px 0px 11px 11px !important;
        }
        .is-important{
           color: #dc1111 !important;
       }
    </style>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.198', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=/home/home.jsp');</script>

    <script src="/survey/js/tools.js"></script>
    <script src="/content/newslist.js?ver=100"></script>
</head>
<!--hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr
        hasMotif homeTab homepage ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr
        -->
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr"
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
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="" style="background: #F4F7FC;">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell" style="padding-left: 0; position: relative;">
                            <span id="LeftQuickMenu1" style="position: absolute; display: block; width: 100%; height: 100%; top: 10px;"><a title="单击关闭侧栏 [Alt+S]" id="handlebarContainer" href="javascript:void(0);" class="zen handlebarContainer">
                                <span class="zen-assistiveText">单击以关闭侧栏</span><span id="pinIndicator"
                                    class="indicator"></span><span id="pinIndicator2" class="indicator"></span><span id="handle" class="pinBox">&nbsp;</span></a>
                                <div id="sidebarDiv" class="collapsible sidebar" style="width: 100%;">
                                    <ul>
                                        <li class="sidebar_item sidebar_active">
                                            <span><i class="iconfont icon-geren"></i></span>
                                            <span class="sidebar_title">个人门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-yiliaohangyedeICON-"></i></span>
                                            <span class="sidebar_title">医院门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">领导门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">部门门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">科室门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">医生门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">护士门户</span>
                                        </li>
                                    </ul>
                                </div>
                            </span>
                        </td>
                        <td id="bodyCell" class="oRight" style="background: #fff;">
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <script type="text/javascript">
                                function onLoadSelector() { /* CustomReportSelector.java injects a call to nonexistent onLoadSelector see Bug W-1599971 */ }
                            </script>


                            <%--content start--%>

                            <div class="result_left">
                                <h2 class="result_left_h2">栏目</h2>
                                <ul class="result_left_ul">
                                </ul>
                            </div>
                            <div class="result_right">
                                <div style="padding: 20px 60px;">
                                    <p class="view_title">
                                        <span class="view_index"><a href="/home/home.aspx">首页</a>&nbsp;/&nbsp;</span>
                                        <span class="view_index"></span>
                                    </p>
                                    <div class="view_search">
                                        <div class="view_search_first">
                                            <div class="view_search_first_search">
                                                 <input type="hidden" value="<%=Request["contentTypeCode"]%>" id="contentTypeCode" name="contentTypeCode">
                                                <table id="first">
                                                    <tr>
                                                        <td>标题:</td>
                                                        <td>
                                                           <input id="title_filter" type="text" class="view_search_first_search_first_input" placeholder="请输入搜索关键词" />
                                                        </td>
                                                         <td style="text-align:right;">发布日期:从</td>
                                                        <td>
                                                            <input autocomplete="off"  type="text" tabindex="4" size="10" name="srch_StartDate" id="srch_StartDate" value="" onblur="if(!isDate(this.value)) { this.value=''; }"  class="view_search_first_search_first_input"
                                                                onfocus="DatePicker.pickDate(false, 'srch_StartDate', false);" searchcolumn="true" datafield="srch_StartDate" dataope="eq" data-uidsfdc="33"> 
                                                        </td>
                                                        <td>至</td>
                                                        <td> <input autocomplete="off"  type="text" tabindex="4" size="10" name="srch_EndDate" id="srch_EndDate" value="" onblur="if(!isDate(this.value)) { this.value=''; }"  class="view_search_first_search_first_input"
                                                                onfocus="DatePicker.pickDate(false, 'srch_EndDate', false);" searchcolumn="true" datafield="srch_EndDate" dataope="eq" data-uidsfdc="33">
                                                     </td>
                                                    </tr>
                                                </table>
                                                <div class="catalist_input">
                                                    <div class="view_search_first_search_first">
                                                        
                                                        <span>发布部门:</span>
                                                        <input type="hidden" value="" id="businessUnit_lkid" name="businessUnit_lkid">
                                                        <input type="hidden" value="" id="businessUnit_lkold" name="businessUnit_lkold">
                                                        <input type="hidden" value="" id="businessUnit_lktp" name="businessUnit_lktp">
                                                        <input type="hidden" value="" id="businessUnit_lspf" name="businessUnit_lspf">
                                                        <input type="hidden" value="" id="businessUnit_lspfsub" name="businessUnit_lspfsub">
                                                        <input type="hidden" value="" id="businessUnit_mod" name="businessUnit_mod">
                                                        <span class="lookupInput">
                                                            <input readonly="readonly" class="view_search_first_search_first_input view_search_second_search_first_input" type="text" value="" tabindex="4" onchange="getElementByIdCS('businessUnit_lkid').value='';getElementByIdCS('businessUnit_mod').value='1';" name="businessUnit" id="businessUnit">
                                                            <a title="部门 查找（新窗口）" tabindex="4" onclick="setLastMousePosition(event)" id="businessUnit_lkwgt" href="javascript:openLookup('/_ui/common/data/DeptPicker.aspx?lkfm=editPage&amp;lknm=businessUnit&amp;lktp=' + getElementByIdCS('businessUnit_lktp').value,670,'1','&amp;lksrch=' + escapeUTF(getElementByIdCS('businessUnit').value.substring(0, 80)))">
                                                                <img title="部门 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="部门 查找（新窗口）" src="/s.gif"></a>
                                                        </span>

                                                    </div>
                                                    <div class="view_search_first_search_second">
                                                        <span>发布人:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                        <input id="auto_filter" type="type" class="view_search_first_search_second_input view_search_second_search_first_input" placeholder="请输入" />
                                                    </div>
                                                </div>
                                                <div class="cancel" style="float: right; width: 20%; margin-top: 5px;">
                                                    <div class="view_search_first_button">
                                                        <button onclick="FilterListData(1,20,true);" class="view_search_first_button_btn check">查询</button>
                                                        <button onclick="ResetFilter();" class="view_search_first_button_btn news">重置</button>
                                                    </div>
                                                    <div class="view_search_first_up">
                                                        <span class="view_search_first_up_span">展开</span>
                                                        <i class="iconfont icon-xiajiantou view_search_first_up_i"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="clear"></div>
                                        </div>
                                        <div class="view_search_second">
                                            <div class="view_search_first_search">
                                            </div>
                                            <%--<div class="view_search_first_button">
                                                <button class="view_search_first_button_btn check">查询</button>
                                                <button class="view_search_first_button_btn news">重置</button>
                                            </div>
                                            <div class="view_search_first_up">
                                                <span>收起</span>
                                                <i class="iconfont icon--shangjiantou"></i>
                                            </div>--%>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                    <div class="view_num">
                                        <i class="iconfont icon-gantanhao"></i>
                                        <%-- <span>为你更新了</span>
                                        <span class="number">10条,</span>--%>
                                        <span>总计</span>
                                        <span class="numbers"></span>
                                        <span>条</span>
                                    </div>
                                    <table class="view_table">
                                        <thead class="view_thead">
                                            <tr>
                                                <th>标题</th>
                                                <th>日期</th>
                                                <th>栏目</th>
                                                <th>发布部门</th>
                                                <th>发布人</th>
                                            </tr>
                                        </thead>
                                        <tbody class="view_tbody">
                                        </tbody>
                                    </table>
                                    <div class="zxf_pagediv"></div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <%--content end--%>
                            <script type="text/javascript">

                                $('.view_search_first_up_span').click(function () {
                                    if ($(this).html() == '展开') {
                                        $('.catalist_input').show();
                                        $(this).next('i').removeClass('icon--xiajiantou');
                                        $(this).next('i').addClass('icon--shangjiantou');
                                        $(this).html('收起');
                                    }
                                    else {
                                        $('.catalist_input').hide();
                                        $(this).next('i').addClass('icon--xiajiantou');
                                        $(this).next('i').removeClass('icon--shangjiantou');
                                        $(this).html('展开');
                                    }
                                })


                                $('.result_left_ul_item').mouseover(function () {
                                    if ($(this).index() == 0) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/new_dynamic_a.png');
                                        $(this).children('a').children('.result_left_ul_item_a_span').css('color', 'rgb(16, 138, 249)');
                                    }
                                    else if ($(this).index() == 1) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/announcement_a.png');
                                    }
                                    else if ($(this).index() == 2) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Document_system_a.png');
                                    }
                                    else if ($(this).index() == 3) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Open_government_a.png');
                                    }
                                    else if ($(this).index() == 4) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Open_party_a.png');
                                    }
                                    else if ($(this).index() == 5) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Academic_a.png');
                                    }
                                    else if ($(this).index() == 6) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Download_a.png');
                                    }
                                    else if ($(this).index() == 7) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Learning_a.png');
                                    }
                                }).mouseout(function () {
                                    if ($(this).index() == 0) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/new_dynamic_a.png');
                                        $(this).children('a').children('.result_left_ul_item_a_span').css('color', 'rgb(16, 138, 249)');
                                    }
                                    else if ($(this).index() == 1) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/announcement.png');
                                    }
                                    else if ($(this).index() == 2) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Document_system.png');
                                    }
                                    else if ($(this).index() == 3) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Open_government.png');
                                    }
                                    else if ($(this).index() == 4) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Open_party.png');
                                    }
                                    else if ($(this).index() == 5) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Academic.png');
                                    }
                                    else if ($(this).index() == 6) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Download.png');
                                    }
                                    else if ($(this).index() == 7) {
                                        $(this).children('a').children('.result_left_ul_item_a_img').children('img').attr('src', '/img/Learning.png');
                                    }
                                })
                            </script>


                            <!-- Body events -->
                            <script type="text/javascript">
                                function bodyOnLoad() {
                                    /*
                                    new ForeignKeyInputElement("evt1__09D90000002A1hg", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "005" });
                                    new ForeignKeyInputElement("evt3__09D90000002A1hg", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" });
                                    new ForeignKeyInputElement("evt2__09D90000002A1hg", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" });
                                    new ForeignKeyInputElement("opp4__09D90000002A1he", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "001" });
                                    new ForeignKeyInputElement("tsk3__09D90000002A1hd", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" });
                                    new ForeignKeyInputElement("tsk2__09D90000002A1hd", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" });
                                    new ForeignKeyInputElement("con4__09D90000002A1hc", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "001" });
                                    new ForeignKeyInputElement("tsk3__09D90000002A1hb", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" });
                                    new ForeignKeyInputElement("tsk2__09D90000002A1hb", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" });
                                    new ForeignKeyInputElement("tsk1__09D90000002A1hb", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "005" });
                                    */
                                    if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                    if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                                    if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };
                                    Sfdc.Cookie.deleteCookie('setupopen'); Sfdc.Cookie.deleteCookie('roleopen');;

                                    if (this.loadChatFrameJs) loadChatFrameJs();
                                    SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                    new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    SfdcApp.MruHovers.global_data.url = 'retURL=/home/home.aspx&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1410773133280';

                                    if (document.getElementById('sidebarDiv')) {
                                        Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                    };

                                    getUnreadEmailQty(updateUnreadEmailQty)
                                    /*
                                    SfdcApp.Recommend.create({ id: 'recs_widget', ctor: 'RecommendationGrid' });                                    
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk2__09D90000002A1hb", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk3__09D90000002A1hb", {});
                                    handleTextAreaElementChangeWithByteCheck('tsk6__09D90000002A1hd', 32000, 0, '剩余', '超出极限');
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk2__09D90000002A1hd", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk3__09D90000002A1hd", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("evt2__09D90000002A1hg", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("evt3__09D90000002A1hg", {});
                                    handleTextAreaElementChangeWithByteCheck('acc20__09D90000002A1hh', 32000, 0, '剩余', '超出极限');
                                    if (window.PreferenceBits)
                                    { window.PreferenceBits.prototype.csrfToken = ""; };
                                    */
                                }
                                function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                                function bodyOnFocus() { closePopupOnBodyFocus(); }
                                function bodyOnUnload() { }
                                function updateUnreadEmailQty(data) {
                                    jQuery("#unreadMails").html("（" + data.unread + "）");
                                }
                            </script>

                            <div class="datePicker" id="datePicker">
                                <div class="dateBar">
                                    <img src="/img/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();" onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker" name="calMonthPicker" title="月"><option value="0">一月</option>
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
                                    </select><img src="/img/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';" onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';" title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                    </select>
                                </div>
                                <div class="calBody">
                                    <table class="calDays" border="1" cellpadding="0" cellspacing="0" id="datePickerCalendar">
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
                            <script>
                                function initDatePicker() {
                                    var date = new Date();
                                    var curYear = date.getFullYear();
                                    var startYear = curYear - 70;
                                    var endYear = curYear + 3;
                                    var eleSelect = document.getElementById("calYearPicker");
                                    //debugger;
                                    for (var y = startYear; y <= endYear; y++) {
                                        var opt = new Option(y, y);
                                        if (y == curYear) {
                                            opt.selected = true;
                                        }
                                        eleSelect.options.add(opt);
                                    }
                                }
                            </script>
                            <!-- End page content -->
                            <script> initDatePicker();</script>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%--<cc1:PageFooter ID="PageFooter1" runat="server" />--%>
        <%--<div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>--%>
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>

    <div id="folderId" style="display: none;"></div>
    <div id="totalCount" style="display: none;"></div>
    <div id="totalPages" style="display: none;"></div>
    <script>
        $('.result_right').height($(window).height() - 130)
    </script>

</body>
</html>
