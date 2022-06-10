<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="overviewContents.aspx.cs"
    Inherits="WebClient.apps.scontent.overviewContents" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <title>信息中心：信息浏览 ~ - Developer Edition</title>
    <script src="/static/111213/js/perf/stub.js" type="text/javascript"></script>
    <script src="/jslibrary/1424969980000/sfdc/SfdcCore.js" type="text/javascript"></script>
    <script src="/EXT/ext-3.3.3/ext.js" type="text/javascript"></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/zh_CN.js" type="text/javascript"></script>
    <link href="/css/newsHome.css" rel="stylesheet" type="text/css" />
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css"
        rel="stylesheet" type="text/css" />
    <!--
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/setup.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css"
        rel="stylesheet" type="text/css" />
    -->
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-5-19 上午8:57", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Dashboard';</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/swiper2.1.min.js"></script>
    <script src="/js/jq.js"></script>
     <script src="/js/Business.js"></script>
    <script type="text/javascript">        
        //新闻动画
        /*
        var mySwiper = new Swiper('.swiper-container', {
            direction: 'vertical',
            loop: true,
            simulateTouch: false,
            // 如果需要分页器
            pagination: '.swiper-pagination',
            paginationClickable: true,
            autoplay: 4000,
            speed: 1000,
        })
        */
    </script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif homeTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outerNoSidebar" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="noSidebarCell">
                        <!-- Start page content table -->
                        <a name="skiplink">
                            <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif"></a>
                        <script type="text/javascript">
                            function onLoadSelector() { /* CustomReportSelector.java injects a call to nonexistent onLoadSelector see Bug W-1599971 */ }
                        </script>
                        <div class="bPageTitle" style=" margin-left:20px;">
                            <div class="ptBody"> 
                                <div class="content"><!--
                                   信息浏览 >> 处室之窗 <h1 class="pageType"><span class="titleSeparatingColon"></span></h1>
                                    <h2 class="pageDescription">
                                       单位信息</h2>--><div class="layout_location" id="nowLocation"><span class="nowLocation_ico"><img src="/img/nav-personal.png"></span><span class="nowLocation_content"><a style="color: rgb(136, 136, 136);"><%=PageTitle%></a></span></div>
                                    <div class="blank">
                                        &nbsp;</div>
                                </div> 
                                
                               <div class="links">
                                    <a title="编辑页面内容与布局" class="configLinks zen-deemphasize" href="/sites/pageblockList.aspx?isDept=0&pageId=<%=Request["pageId"]%>&t=<%=Request["t"]%>">
                                        编辑布局</a><!-- | <a title="此页面的帮助 （新窗口）" href="/090/o">
                                            <span class="helpLink">信息发布</span><img class="helpIcon" alt="" src="/s.gif"></a>--></div>
                            </div>
                            <div class="ptBreadcrumb">
                            </div>
                        </div>
                        <div class="clearingBox">
                            &nbsp;</div>
                        <div class="main CntWarp">
                            <!--
                            <div class="seachWarp">
                                <div class="bOverviewSearch" style="float: right; vertical-align: top">
                                    输入用来查找的关键字。<div class="pbSearch">
                                        <div class="pbSearch">
                                            <form onsubmit="if (window.ffInAlert) { return false; }if(this.search){this.search.blur();}"
                                            name="srch" method="GET" id="srch" action="/ui/product/Search">
                                            <input type="hidden" value="C" name="searchtype" id="searchtype"><input type="text"
                                                title="输入搜索关键字" size="30" name="search" maxlength="1000" id="srch_Input" class="searchTextBox"><input
                                                    type="submit" title="查找" name="go" class="btn" value=" 查找 "></form>
                                        </div>
                                    </div>
                                </div>
                            </div>--><!--
                            <div class="hBlock">
                                <div class="hBCnt">
                                    <div class="option">
                                        <div class="optRight">
                                            <a href="#">更多>></a>
                                        </div>
                                        <div class="optT">
                                            <ul>
                                                <li class="cur">行业动态</li>
                                            </ul>
                                        </div>
                                    </div>                                   
                                    <div class="optCnt">
                                        <ul>
                                            <li class="selted">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hBTable">
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">十大青年奖被伊利集团董事长获得</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="https://www.baidu.com/" target="_blank" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">伊利集团董事长获得十大青年</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">集团董事长获得十大青年奖</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </li>
                                        </ul>
                                    </div>
                                </div>                              
                            </div>-->
                            <!--end hBlock -->
                            <!--
                            <div class="hBlock">
                                <div class="hBCnt">
                                    <div class="option">
                                        <div class="optT">
                                            <ul>
                                                <li class="cur">图片新闻</li>
                                            </ul>
                                        </div>
                                    </div>                                 
                                    <div class="optCnt">
                                        <div class="swiper-container">
                                            <div class="swiper-wrapper">
                                                <div class="swiper-slide">
                                                    <a href="#" target="_blank">
                                                        <img src="/SysFiles/images/1.jpg" width="" height="" alt="">
                                                        <div class="swiperTitle">
                                                            流行撞地球</div>
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" target="_blank">
                                                        <img src="/SysFiles/images/2.jpg" width="" height="" alt="">
                                                        <div class="swiperTitle">
                                                            流行撞地球</div>
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" target="_blank">
                                                        <img src="/SysFiles/images/3.jpg" width="" height="" alt="">
                                                        <div class="swiperTitle">
                                                            流行撞地球</div>
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" target="_blank">
                                                        <img src="/SysFiles/images/4.jpg" width="" height="" alt="">
                                                        <div class="swiperTitle">
                                                            流行撞地球</div>
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" target="_blank">
                                                        <img src="/SysFiles/images/5.jpg" width="" height="" alt="" />
                                                        <div class="swiperTitle">
                                                            流行撞地球</div>
                                                    </a>
                                                </div>
                                            </div>                                      
                                            <div class="swiper-pagination">
                                            </div>
                                        </div>
                                    </div>
                                </div>                            
                            </div>-->
                            <%=HTMLResult%>
                            <%-- <!--end hBlock -->
                            <div class="hBlock">
                                <div class="hBCnt">
                                    <div class="option">
                                        <div class="optRight">
                                            <a href="#">更多>></a>
                                        </div>
                                        <div class="optT">
                                            <ul>
                                                <li class="cur">行业动态</li>
                                                <li>行业故事</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--end option -->
                                    <div class="optCnt">
                                        <ul>
                                            <li class="selted">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hBTable">
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">十大青年奖被伊利集团董事长获得</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">伊利集团董事长获得十大青年</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">集团董事长获得十大青年奖</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </li>
                                            <li>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hBTable">
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">伊利集团董事长获得十大青年</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">集团董事长获得十大青年奖</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">十大青年奖被伊利集团董事长获得</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--end hBCnt -->
                            </div>
                            <!--end hBlock -->
                            <div class="hBlock">
                                <div class="hBCnt">
                                    <div class="option">
                                        <div class="optRight">
                                            <a href="#">更多>></a>
                                        </div>
                                        <div class="optT">
                                            <ul>
                                                <li class="cur">行业动态</li>
                                                <li>行业故事</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--end option -->
                                    <div class="optCnt">
                                        <ul>
                                            <li class="selted">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hBTable">
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">十大青年奖被伊利集团董事长获得</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">伊利集团董事长获得十大青年</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">集团董事长获得十大青年奖</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </li>
                                            <li>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hBTable">
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">伊利集团董事长获得十大青年</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">集团董事长获得十大青年奖</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">十大青年奖被伊利集团董事长获得</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--end hBCnt -->
                            </div>
                            <!--end hBlock -->
                            <div class="hBlock">
                                <div class="hBCnt">
                                    <div class="option">
                                        <div class="optRight">
                                            <a href="#">更多>></a>
                                        </div>
                                        <div class="optT">
                                            <ul>
                                                <li class="cur">行业动态</li>
                                                <li>行业故事</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--end option -->
                                    <div class="optCnt">
                                        <ul>
                                            <li class="selted">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hBTable">
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">十大青年奖被伊利集团董事长获得</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">伊利集团董事长获得十大青年</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">集团董事长获得十大青年奖</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </li>
                                            <li>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hBTable">
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">伊利集团董事长获得十大青年</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">集团董事长获得十大青年奖</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">获得十大青年奖的是伊利集团董事长</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30">
                                                            <a href="#">十大青年奖被伊利集团董事长获得</a>
                                                        </td>
                                                        <td width="80" align="center">
                                                            2015-5-13
                                                        </td>
                                                        <td width="73" align="center">
                                                            <a href="#" target="_new" class="bLink">行业新闻</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--end hBCnt -->
                            </div>
                            <!--end hBlock -->--%>
                        </div>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, '6rWmQTO2j2da5DapiWpv__oEVZuFQlOXgED2.bXTiGKheHofWbYrmI.wXCsk1q8J27plXn3vccFhBp2JVdoLK7PsSuieCquJifbLenK7v8nKu8slVFoRNP2aKkQdtxbE_CNPSwMAhfNhIx05gxk4Amz8nGGLyeCvRpeHNjF7iyFINq7c'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); ; if (this.loadChatFrameJs) loadChatFrameJs(); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "PbqUU_UmB_v9rTUDjHfEFcgHyHoEP0QKIriKENl64iUXLx7TbCamcJ4WZnr_NB5iIOZVHe82PTx1QACxJq1UsZV2kKQFt.reEy20fNgd5bNmGm3ZItH4kshWc5_ZBHMicRXUyDar_TZMSWY8dqjc6zob4ledI3ynmuTYkQyW560HDuC7EGvX7_R8uxJNykuCccAUfQ=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
<!-- page generation time: 483ms -->
