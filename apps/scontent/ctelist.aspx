<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ctelist.aspx.cs" Inherits="WebClient.apps.scontent.ctelist" %>

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
    <link href="/css/hotnews.css" rel="stylesheet" type="text/css" />
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
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
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-5-19 上午8:57", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
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
                        <div class="bPageTitle" style="margin-left: 20px;">
                            <div class="ptBody">
                                <div class="content">
                                    <!--
                                   信息浏览 >> 处室之窗 <h1 class="pageType"><span class="titleSeparatingColon"></span></h1>
                                    <h2 class="pageDescription">
                                       单位信息</h2><div class="layout_location" id="nowLocation"><span class="nowLocation_ico"><img src="/img/nav-personal.png"></span><span class="nowLocation_content"><a style="color: rgb(136, 136, 136);"><%=PageTitle%></a></span></div>
                                    <div class="blank">
                                        &nbsp;</div>-->
                                </div>
                                <div class="links">
                                    <!-- <a title="编辑页面内容与布局" class="configLinks zen-deemphasize" href="/sites/pageblockList.aspx?isDept=0&pageId=<%=Request["pageId"]%>&t=<%=Request["t"]%>">
                                        编辑布局</a> | -->
                                    <a title="此页面的帮助 （新窗口）" href="/090/o">
                                        <span class="helpLink">信息发布</span><img class="helpIcon" alt="" src="/s.gif"></a>
                                </div>
                            </div>
                            <div class="ptBreadcrumb">
                            </div>
                        </div>
                        <div class="clearingBox">
                            &nbsp;
                        </div>
                        <style>
                          .right-iframe-img {
    background-color: #f4f5f6;
    display: block;
    margin-bottom: 16px;
    padding: 20px;
}
.right-iframe-img a {
    display: inline-block;
}
.right-iframe-img .wrap {
    display: block;
}
.right-iframe-img img {
    width: 100%;
}
.right-iframe-img h4 {
    color: #222;
    font-size: 18px;
    padding: 12px 0 18px;
}
.right-iframe-img .y-box {
    font-size: 12px;
}
.right-iframe-img .avatar {
    background-color: #2a90d7;
    border-radius: 50%;
    color: #fff;
    padding: 2px;
}
.right-iframe-img .source, .right-iframe-img .comment {
    color: #999;
}
.right-iframe-img .label {
    color: #2a90d7;
}

                        </style>
                        <div class="y-wrap">
                            <div class="y-box container">
                                <div class="y-left index-channel">
                                    <div class="wchannel">
                                        <a class="logo" href="/">
                                            <img src="//s3.pstatp.com/toutiao/resource/ntoutiao_web/static/image/logo_201f80d.png" alt="">
                                        </a>
                                        <ul>                                            
                                            <!--<li onclick=""><a class="wchannel-item active" href="#" target="" ga_event="channel_recommand_click"><span>推荐</span> </a></li>-->
                                            <%=Categories%>
                                        </ul>
                                    </div>
                                </div>
                                <div class="y-left index-content">
                                    <div riot-tag="subchannel" id="subchannel" class="subchannel">
                                        <ul name="subchannel" style="width: 660px;" ga_event="subchannel_click" class="sub-list ">
                                            <li class="sub-item sub-selected"><a href="#">全部</a> </li>
                                           <!-- <li class="sub-item "><a href="#">最近</a> </li>
                                            <li class="sub-item "><a href="#">热点</a> </li>
                                            <li class="sub-item "><a href="/ch/anti_corruption/"></a></li>-->
                                            <!--riot placeholder-->
                                        </ul>
                                    </div>
                                    <div riot-tag="feedBox">
                                        <div class="feedBox" name="feedBox">
                                            <div riot-tag="wcommonFeed" category="news_society" abtype="0">
                                                <div class="wcommonFeed">
                                                    <div riot-tag="msgAlert" mwidth="660" mtop="500" category="news_society">
                                                        <div class="msgAlert msgAlert-hidden">
                                                            <div style="background-color: #fff; height: 1px;"></div>
                                                        </div>
                                                    </div>
                                                    <ul>
                                                        <%=HTMLResult%>
                                                        <!--
                                                        <li class="item    " ga_event="article_item_click" ad_id="" qihu_ad_id="" ad_track="" group_id="6436721144404902145"><span id="ad_extra" style="display: none;"></span>
                                                            <div class="item-inner y-box">
                                                                <div class="normal rbox ">
                                                                    <div class="rbox-inner">
                                                                        <div class="title-box" ga_event="article_title_click"><a class="link title" target="_blank" href="/group/6436721144404902145/">如何看待清华拟录取并资助“带母上学求住宿”残疾考生？ </a></div>
                                                                        <div class="y-box footer">
                                                                            <div class="y-left">
                                                                                <div class="y-left"><a target="_blank" class="lbtn media-avatar avatar-bg-0" href="/search/?keyword=头条问答" ga_event="article_avatar_click">头</a> <a class="lbtn source" target="_blank" href="/search/?keyword=头条问答" ga_event="article_name_click">&nbsp;头条问答&nbsp;⋅</a> </div>
                                                                                <span class="lbtn">&nbsp;刚刚</span>
                                                                            </div>
                                                                            <div class="y-right"><span class="dislike" data-groupid="6436721144404902145" ga_event="article_dislike_click">不感兴趣 <i class="y-icon icon-dislikenewfeed"></i></span></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="lbox" ga_event="article_img_click">
                                                                    <a class="img-wrap" target="_blank" href="/group/6436721144404902145/">
                                                                        <img alt="" src="http://p9..com/list/190x124/2c6500015d44592ffd3c">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                      -->
                                                        <li class="item    " ga_event="refresh_item_click" ad_id="" qihu_ad_id="" ad_track="" group_id=""><span id="Span7" style="display: none;"></span>
                                                            <div class="list-refresh-msg"><span>看到这里</span> &nbsp;点击加载更多&nbsp;<i class="y-icon icon-refreshfeed"></i> </div>
                                                        </li>
                                                        <!--riot placeholder-->
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="y-right index-modules">
                                    <div id="module-place"></div>
                                    <div class="module-inner" id="module-inner">
                                        <div riot-tag="wsearch" style="margin-bottom: 16px;">
                                            <div name="searchBox" class="wsearch">
                                                <form name="searchForm" action="/search/" method="get" target="_blank">
                                                    <div name="inputbox" class="y-box input-group" style="border-color: rgb(232, 232, 232);">
                                                        <input class="y-left input-text" name="keyword" autocomplete="off" ga_event="mh_search" placeholder="请输入关键字" type="text">
                                                        <div class="y-right btn-submit">
                                                            <button type="submit" href="javascript:;"><i class="y-icon icon-search" ga_event="mh_search"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="layer ">
                                                    <ul ga_event="mh_search">
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-1">1</i>  <span class="search-txt">搭帐篷排队抢名额</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-2">2</i>  <span class="search-txt">全新勒索病毒爆发</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-3">3</i>  <span class="search-txt">保罗交易至火箭</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-4">4</i>  <span class="search-txt">蔡依林穿泳衣上街</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-5">5</i>  <span class="search-txt">12岁高考620分</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-6">6</i>  <span class="search-txt">何炅节目现场发飙</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-7">7</i>  <span class="search-txt">租房客遭遇被网贷</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-8">8</i>  <span class="search-txt">田华一家4口患癌</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-9">9</i>  <span class="search-txt">奶茶妹妹海滩新照</span> </a></li>
                                                        <li class="search-item"><a href="javascript:;"><i class="search-no search-no-10">10</i>  <span class="search-txt">货车起火西瓜烧焦</span> </a></li>
                                                        <!--riot placeholder-->
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <a class="ext-banner" href="https://ext.se.360.cn/webstore/detail/afepefboigddnojlhkpjhhlmgbnnfooe" target="_blank">
                                            <img src="//s3.pstatp.com/site/tt_mfsroot/pc_img/webkit_banner.png" alt="">
                                        </a>

                                        <a href="#" class="y-box report" target="_blank">
                                            <div class="y-left img-holder">
                                                <img src="//s3a.pstatp.com/toutiao/resource/ntoutiao_web/static/image/other/report_logo_15cc24e.png" alt="">
                                            </div>
                                            <div class="y-left info">
                                                <p class="title">链接1111</p>
                                                <p class="tel">1111：1111</p>
                                            </div>
                                        </a>

                                        <div class="right-top-1 right-iframe-img right-img" name="home_right*top_1_zy" ad-cursor="1" ad_name="h_300*250_zy_4" done="1" show="1">
                                            <div class="pic-wrap">
                                                <a class="wrap" aid="62252913739" href="#" target="_blank">
                                                    <img src="//p9.pstatp.com/origin/287c0000198672b0b64e" alt="">
                                                </a>
                                                <a class="wrap" href="#" target="_blank">
                                                    <h4>XXXX，系统~</h4>
                                                </a>
                                                <div class="y-box">
                                                    <a href="#" target="_blank" class="source">中付.</a>
                                                    <a href="#" target="_blank" class="label">&nbsp;&nbsp;广告</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="height: 366px; overflow: hidden;">
                                            <div id="m-hotNews">
                                                <div riot-tag="hotNews" class="hotNews module" ga_event="click_hot_news">
                                                    <div class="module-head news-head">热点文章 </div>
                                                    <ul class="news-content">
                                                        <!--
                                                        <li class="news-list"><a target="_blank" class="news-link" href="/group/6436651627532255489/">
                                                            <div class="module-pic news-pic">
                                                                <img src=""></div>
                                                            <div class="news-inner">
                                                                <p class="module-title">官方报道了055下水，都是万吨级，怎么还叫驱逐舰，这算是巡洋舰了吧？</p>
                                                            </div>
                                                        </a></li>
                                                        -->
                                                        <!--riot placeholder-->
                                                    </ul>
                                                </div>                                               
                                            </div>
                                        </div>
                                    
                                        <div riot-tag="adTab"></div>
                                        <div riot-tag="whotvideo" class="whotvideo module" ga_event="click_video_recommend" style="display:none">
                                            <div class="module-head video-head"><a href="#" target="_blank">热门视频</a> </div>
                                            <ul class="video-list">
                                                <li class="video-item"><a target="_blank" href="">
                                                    <dl>
                                                        <dt class="module-pic">
                                                            <img alt="" src="">
                                                            <i class="hot-tag video-tag"><span>05:47</span></i> </dt>
                                                        <dd>
                                                            <div class="cell">
                                                                <h4>，XXXXXXXXXXXXXXXXXXXXXXXX？</h4>
                                                                <p><span>4.5万次播放&nbsp;</span> <span>⋅&nbsp;1评论</span> </p>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                </a></li>
                                                <!--riot placeholder-->
                                            </ul>
                                        </div>
                                       
                                        <div riot-tag="whotpicture" class="whotpicture module" ga_event="click_pictures_recommend" style="display:none">
                                            <div class="module-head picture-head"><a href="/news_image/" target="_blank">精彩图片</a> </div>
                                            <ul class="y-box picture-list">
                                                <li class="y-left picture-item"><a target="_blank" href="/group/6436877781442855170/">
                                                    <div class="module-pic picture-img">
                                                        <img alt="" src="">
                                                        <i class="hot-tag"><span>21图</span></i> </div>
                                                    <p>齐白石的一天是怎样度过的？</p>
                                                </a></li>
                                                <li class="y-left picture-item"><a target="_blank" href="/group/6436881155857973506/">
                                                    <div class="module-pic picture-img">
                                                        <img alt="" src=" ">
                                                        <i class="hot-tag"><span>10图</span></i> </div>
                                                    <p>逆天了，澳洲70岁女子，颜如40岁，身材依旧火辣</p>
                                                </a></li>
                                                <li class="y-left picture-item"><a target="_blank" href="/group/6413326796711919873/">
                                                    <div class="module-pic picture-img">
                                                        <img alt="" src=" ">
                                                        <i class="hot-tag"><span>9图</span></i> </div>
                                                    <p>司机停车太随意，造成拥堵一个多小时未见人</p>
                                                </a></li>
                                                <li class="y-left picture-item"><a target="_blank" href="/group/6436883498552410370/">
                                                    <div class="module-pic picture-img">
                                                        <img alt="" src=" ">
                                                        <i class="hot-tag"><span>7图</span></i> </div>
                                                    <p>奇葩的方法，防止作弊</p>
                                                </a></li>
                                                <li class="y-left picture-item"><a target="_blank" href="/group/6436883854467891457/">
                                                    <div class="module-pic picture-img">
                                                        <img alt="" src=" ">
                                                        <i class="hot-tag"><span>9图</span></i> </div>
                                                    <p>主人不在家，狗狗帮着照顾猫咪，这一幕真的太有爱了</p>
                                                </a></li>
                                                <li class="y-left picture-item"><a target="_blank" href="/group/6429059656294859265/">
                                                    <div class="module-pic picture-img">
                                                        <img alt="" src=" ">
                                                        <i class="hot-tag"><span>6图</span></i> </div>
                                                    <p>国外一架波音737竟“降落”湖南衡阳一菜地</p>
                                                </a></li>
                                                <!--riot placeholder-->
                                            </ul>
                                        </div>
                                        <div class="more-items module" ga_event="click_friend_link" style="display:none">
                                            <div class="module-head more-items-head">更多</div>
                                            <div class="more-items-content">
                                                <ul>
                                                    <li class="item">
                                                        <a href="/about/" rel="nofollow"></a>
                                                    </li>
                                                    <li class="item">
                                                        <a href="/join/" rel="nofollow">加入头条</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="friendLink module" ga_event="click_friend_link">
                                            <div class="module-head link-head">友情链接</div>
                                            <div class="link-content" id="friendLink">
                                                <ul>
                                                    <%=HTMLQuickLink%>
                                                    <li class="item"><a target="_blank" href="http://www.phxinfo.com.cn/">凤凰世纪</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="company" style="display:none">
                                            
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, '6rWmQTO2j2da5DapiWpv__oEVZuFQlOXgED2.bXTiGKheHofWbYrmI.wXCsk1q8J27plXn3vccFhBp2JVdoLK7PsSuieCquJifbLenK7v8nKu8slVFoRNP2aKkQdtxbE_CNPSwMAhfNhIx05gxk4Amz8nGGLyeCvRpeHNjF7iyFINq7c'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");; if (this.loadChatFrameJs) loadChatFrameJs(); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "PbqUU_UmB_v9rTUDjHfEFcgHyHoEP0QKIriKENl64iUXLx7TbCamcJ4WZnr_NB5iIOZVHe82PTx1QACxJq1UsZV2kKQFt.reEy20fNgd5bNmGm3ZItH4kshWc5_ZBHMicRXUyDar_TZMSWY8dqjc6zob4ledI3ynmuTYkQyW560HDuC7EGvX7_R8uxJNykuCccAUfQ=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
