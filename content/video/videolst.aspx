<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="videolst.aspx.cs" Inherits="Supermore.content.video.videolst" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <title>视频 ：视频管理</title>
    <script src="/static/111213/js/perf/stub.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/zh_CN.js" type="text/javascript"></script>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/setup.css"
        rel="stylesheet" type="text/css" />
    <link href="/content/video/videothumb.css" rel="stylesheet" />
    <link href="/content/video/icon.css" rel="stylesheet" />
    <link rel="stylesheet" href="/content/video/zxf_page.css">
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script type="text/javascript">        window.sfdcPage = new ApexDetailPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1427926072000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-4-7 下午9:47", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/Business.js"></script>
    <script type="text/javascript" src="/jslibrary/sfdc/Security.js"></script>
    <script type="text/javascript" src="./zxf_page.js"></script>
    <style type="text/css">
        .checkbox {
            display: inline-block;
        }

        .item_ul {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: auto;
        }

        .item_li {
            margin: 0;
            padding: 5px;
            border-bottom: 1px solid #ccc;
        }

        .btnd {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .btn-primary {
            color: #fff;
            background-color: #337ab7;
            border-color: #2e6da4;
        }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div
        id="contentWrapper">
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
                    <td id="bodyCell" class="oRight"><a name="skiplink">
                        <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img title="" class="pageTitleIcon" alt="" src="/s.gif"><h1 class="pageType">视频管理<span class="titleSeparatingColon">:</span></h1>
                                    <h2 class="pageDescription"></h2>
                                    <div class="blank">&nbsp;</div>
                                </div>
                                <div class="links"></div>
                            </div>
                            <div class="ptBreadcrumb"></div>
                        </div>
                        <!--内容-->
                        <div class="content">
                            <div class="cont" style="display: flex;">
                                <div style="width: 20%; border: 1px solid #ccc; margin-right: 20px; position: relative;">
                                    <ul class="item_ul">
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                        <li class="item_li">123</li>
                                    </ul>
                                </div>
                                <div>
                                   <input type="button" class="btnd btn-primary" value="上传视频" />
                                    <div class="menu">
                                        <div class="mod_sear_list">
                                            <h3>频道：</h3>
                                            <ul class="mod_category_item pindao">
                                                <li>
                                                    <a href="#">电视剧</a>
                                                </li>
                                                <li class="selected">
                                                    <a href="#">电影</a>
                                                </li>
                                                <li>
                                                    <a href="#">综艺</a>
                                                </li>
                                                <li>
                                                    <a href="#">动漫</a>
                                                </li>
                                                <li>
                                                    <a href="#">纪录片</a>
                                                </li>
                                                <li>
                                                    <a href="#">游戏</a>
                                                </li>
                                                <li>
                                                    <a href="#">资讯</a>
                                                </li>
                                                <li>
                                                    <a href="#">娱乐</a>
                                                </li>
                                                <li>
                                                    <a href="#">财经</a>
                                                </li>
                                                <li>
                                                    <a href="#">网络电影</a>
                                                </li>
                                                <li>
                                                    <a href="#">片花</a>
                                                </li>
                                                <li>
                                                    <a href="#">音乐</a>
                                                </li>
                                                <li>
                                                    <a href="#">军事</a>
                                                </li>
                                                <li>
                                                    <a href="#">教育</a>
                                                </li>
                                                <li>
                                                    <a href="#">体育</a>
                                                </li>
                                                <li>
                                                    <a href="#">儿童</a>
                                                </li>
                                                <li>
                                                    <a href="#">旅游</a>
                                                </li>
                                                <li>
                                                    <a href="#">时尚</a>
                                                </li>
                                                <li>
                                                    <a href="#">生活</a>
                                                </li>
                                                <li>
                                                    <a href="#">汽车</a>
                                                </li>
                                                <li>
                                                    <a href="#">搞笑</a>
                                                </li>
                                                <li>
                                                    <a href="#">广告</a>
                                                </li>
                                                <li>
                                                    <a href="#">原创</a>
                                                </li>
                                                <li>
                                                    <a href="#">母婴</a>
                                                </li>
                                                <li>
                                                    <a href="#">科技</a>
                                                </li>
                                                <li>
                                                    <a href="#">脱口秀</a>
                                                </li>
                                                <li>
                                                    <a href="#">健康</a>
                                                </li>
                                                <li class="close-mod_btn">
                                                    <a href="javascript:;">
                                                        <span class="vm-inline">收起</span>
                                                        <i class="iconfont icon-shangjiantou"></i>

                                                    </a>
                                                </li>
                                            </ul>
                                            <div class="openBtn">
                                                <a class="openBtn-txt" href="javascript:;">
                                                    <span class="vm-inline">更多</span>
                                                    <i class="iconfont icon-xiajiantou"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="mod_sear_list">
                                            <h3>资费：</h3>
                                            <ul class="mod_category_item money">
                                                <li class="selected">
                                                    <a href="#">全部</a>
                                                </li>
                                                <li>
                                                    <a href="#">免费</a>
                                                </li>
                                                <li>
                                                    <a href="#">付费</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="mod_sear_list  mod_sear_list_open">
                                            <h3>地区：</h3>
                                            <ul class="mod_category_item area">
                                                <li class="selected">
                                                    <a href="#">全部</a>
                                                </li>
                                                <li>
                                                    <a href="#">华语</a>
                                                </li>
                                                <li>
                                                    <a href="#">美国</a>
                                                </li>
                                                <li>
                                                    <a href="#">欧洲</a>
                                                </li>
                                                <li>
                                                    <a href="#">韩国</a>
                                                </li>
                                                <li>
                                                    <a href="#">日本</a>
                                                </li>
                                                <li>
                                                    <a href="#">泰国</a>
                                                </li>
                                                <li>
                                                    <a href="#">印度</a>
                                                </li>
                                                <li>
                                                    <a href="#">其它</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="mod_sear_list">
                                            <h3>类型：</h3>
                                            <ul class="mod_category_item what">
                                                <li class="selected">
                                                    <a href="#">全部</a>
                                                </li>
                                                <li>
                                                    <a href="#">喜剧</a>
                                                </li>
                                                <li>
                                                    <a href="#">爱情</a>
                                                </li>
                                                <li>
                                                    <a href="#">动作</a>
                                                </li>
                                                <li>
                                                    <a href="#">枪战</a>
                                                </li>
                                                <li>
                                                    <a href="#">犯罪</a>
                                                </li>
                                                <li>
                                                    <a href="#">惊悚</a>
                                                </li>
                                                <li>
                                                    <a href="#">恐怖</a>
                                                </li>
                                            </ul>
                                            
                                        </div>
                                        <div class="mod_sear_list  mod_sear_list_open">
                                            <h3>规格：</h3>
                                            <ul class="mod_category_item any">
                                                <li class="selected">
                                                    <a href="#">全部</a>
                                                </li>
                                                <li>
                                                    <a href="#">巨制</a>
                                                </li>
                                                <li>
                                                    <a href="#">院线</a>
                                                </li>
                                                <li>
                                                    <a href="#">独播</a>
                                                </li>
                                                <li>
                                                    <a href="#">网络大电影</a>
                                                </li>
                                                <li>
                                                    <a href="#">经典</a>
                                                </li>
                                                <li>
                                                    <a href="#">电影节目</a>
                                                </li>
                                                <li>
                                                    <a href="#">4K</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="mod_sear_list ">
                                            <h3>年份</h3>
                                            <ul class="mod_category_item year">
                                                <li class="selected">
                                                    <a href="#">全部</a>
                                                </li>
                                                <li>
                                                    <a href="#">2019</a>
                                                </li>
                                                <li>
                                                    <a href="#">2018</a>
                                                </li>
                                                <li>
                                                    <a href="#">2017</a>
                                                </li>
                                                <li>
                                                    <a href="#">2016-2011</a>
                                                </li>
                                                <li>
                                                    <a href="#">2010-2000</a>
                                                </li>
                                                <li>
                                                    <a href="#">90年代</a>
                                                </li>
                                                <li>
                                                    <a href="#">80年代</a>
                                                </li>
                                                <li>
                                                    <a href="#">更早</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="mod_sear_list  borNone  mod_sear_linkTag" style="padding: 5px 15px 5px 85px;">
                                            <h3>您还可以搜索：</h3>
                                            <ul class="mod_category_item">
                                                <li>
                                                    <a title="盗墓" href="#">盗墓</a>
                                                </li>
                                                <li>
                                                    <a title="吴京" href="#">吴京</a>
                                                </li>
                                                <li>
                                                    <a title="李连杰" href="#">李连杰</a>
                                                </li>
                                                <li>
                                                    <a title="林正英" href="#">林正英</a>
                                                </li>
                                                <li>
                                                    <a title="周星驰" href="#">周星驰</a>
                                                </li>
                                                <li>
                                                    <a title="周润发" href="#">周润发</a>
                                                </li>
                                                <li>
                                                    <a title="成龙" href="#">成龙</a>
                                                </li>
                                                <li>
                                                    <a title="鬼片" href="#">鬼片</a>
                                                </li>
                                                <li>
                                                    <a title="复仇者联盟" href="#">复仇者联盟</a>
                                                </li>
                                                <li>
                                                    <a title="变形金刚" href="#">变形金刚</a>
                                                </li>
                                                <li>
                                                    <a title="刘德华" href="#">刘德华</a>
                                                </li>
                                                <li>
                                                    <a title="丧尸" href="#">丧尸</a>
                                                </li>
                                                <li>
                                                    <a title="漫威" href="#">漫威</a>
                                                </li>
                                                <li>
                                                    <a title="甄子丹" href="#">甄子丹</a>
                                                </li>
                                                <li>
                                                    <a title="钢铁侠" href="#">钢铁侠</a>
                                                </li>
                                                <li>
                                                    <a title="洪金宝" href="#">洪金宝</a>
                                                </li>
                                                <li>
                                                    <a title="霍比特人" href="#">霍比特人</a>
                                                </li>
                                                <li>
                                                    <a title="沈腾" href="#">沈腾</a>
                                                </li>
                                                <li>
                                                    <a title="杰森斯坦森" href="#">杰森斯坦森</a>
                                                </li>
                                                <li>
                                                    <a title="灾难片" href="#">灾难片</a>
                                                </li>
                                                <li class="close-mod_btn">
                                                    <a href="javascript:;" j-delegate="action">
                                                        <span class="vm-inline">收起</span>
                                                        <i class="iconfont icon-shangjiantou"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                            <div class="openBtn">
                                                <a title="更多" class="openBtn-txt" href="javascript:;" j-delegate="action">
                                                    <span class="vm-inline">更多</span>
                                                    <i class="iconfont icon-xiajiantou"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb15 clearfix">
                                        <div class="sort-result-container">
                                            <div class="sort-result-l">
                                                <div class="sort-result-l  border-n fl mt5">
                                                    <span class="vm-inline c-999">排序：</span>
                                                    <a class="checkBox-item ml5">
                                                        <span class="search-checkBox">
                                                            <i class="search-checkBox-inner"></i>
                                                        </span>
                                                        <span class="vm-inline">综合排序</span>
                                                    </a>
                                                    <a class="checkBox-item selected ml5">
                                                        <span class="search-checkBox">
                                                            <i class="search-checkBox-inner"></i>
                                                        </span>
                                                        <span class="vm-inline">热门</span>
                                                    </a>
                                                    <a class="checkBox-item ml5">
                                                        <span class="search-checkBox">
                                                            <i class="search-checkBox-inner"></i>
                                                        </span>
                                                        <span class="vm-inline">更新时间</span>
                                                    </a>
                                                    <a class="checkBox-item ml5">
                                                        <span class="search-checkBox">
                                                            <i class="search-checkBox-inner"></i>
                                                        </span>
                                                        <span class="vm-inline">评分</span>
                                                    </a>
                                                </div>
                                                <div class="sort-result-r fr mt5 list-popularizeAdv">
                                                    <a class="checkBox-item selected ml5">
                                                        <span class="search-checkBox">
                                                            <i class="search-checkBox-inner"></i>
                                                        </span>
                                                        <span class="vm-inline">xxx</span>
                                                    </a>
                                                    <a class="checkBox-item ml5">
                                                        <span class="search-checkBox">
                                                            <i class="search-checkBox-inner"></i>
                                                        </span>
                                                        <span class="vm-inline">全网</span>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="wrapper-cols">
                                        <div class="wrapper-piclist">
                                            <ul class="site-piclist site-piclist-180236 site-piclist-auto">
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a title="新喜剧之王" href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" rseat="dsjp7" alt="新喜剧之王" title="新喜剧之王"
                                                                src="./image/xijuzhiwang.jpg">
                                                            <p class="viedo_lt " data-search-pay="ico">
                                                                <span class="icon-member-box">
                                                                    <img src="./image/fufei.png"></span>
                                                            </p>
                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo">01:31:00
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a title="新喜剧之王" href="#">新喜剧之王</a>
                                                            </p>
                                                            <span class="score">
                                                                <strong class="num">7</strong>.6</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="王宝强">王宝强
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="鄂靖文">鄂靖文
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="张全蛋">张全蛋
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" rseat="dsjp7" alt="“大”人物" title="“大”人物"
                                                                src="./image/darenwu.jpg">
                                                            <p class="viedo_lt " data-search-pay="ico">
                                                                <span class="icon-member-box">
                                                                    <img src="./image/vip.png">
                                                                </span>
                                                            </p>
                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo">01:47:00
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a title="“大”人物" href="#">“大”人物</a>
                                                            </p>
                                                            <span class="score"><strong class="num">8</strong>.6</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="王千源">王千源
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="包贝尔">包贝尔
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="王迅">王迅
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="梅婷">梅婷
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="王砚辉">王砚辉
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="高捷">高捷
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="刘天佐">刘天佐
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" alt="海王" title="海王" src="./image/haiwang.jpg">


                                                            <p class="viedo_lt ">
                                                                <span class="icon-member-box">
                                                                    <img src="./image/juan.png"></span>
                                                            </p>

                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo">02:23:00
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a href="#">海王</a>
                                                            </p>
                                                            <span class="score"><strong class="num">8</strong>.6</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="杰森·莫玛">杰森·莫玛
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="艾梅柏·希尔德">艾梅柏·希尔德
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="妮可·基德曼">妮可·基德曼
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" rseat="dsjp7" alt="倔强萝卜" title="倔强萝卜"
                                                                src="./image/luobo.jpg">


                                                            <p class="viedo_lt " data-search-pay="ico">
                                                                <span class="icon-member-box">
                                                                    <img src="./image/vip.png"></span>
                                                            </p>

                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo">01:32:00
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a href="#">倔强萝卜</a>
                                                            </p>
                                                            <span class="score"><strong class="num">8</strong>.4</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="黄渤">黄渤
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="黄奕">黄奕
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="杜海涛">杜海涛
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="马书良">马书良
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="黄小蕾">黄小蕾
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" rseat="dsjp7" alt="降魔武僧" title="降魔武僧"
                                                                src="./image/wuseng.jpg">

                                                            <p class="video_dj " data-search-pay="ico" data-qidanadd-ele="definition"></p>


                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo"></span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a href="#">降魔武僧</a>
                                                            </p>
                                                            <span class="score"><strong class="num">6</strong>.5</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="李欣泽">李欣泽
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="陈弈名">陈弈名
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="张佳琳">张佳琳
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="籍翀">籍翀
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" rseat="dsjp7" alt="白蛇：缘起" title="白蛇：缘起"
                                                                src="./image/baishe.jpg">


                                                            <p class="viedo_lt " data-search-pay="ico">
                                                                <span class="icon-member-box">
                                                                    <img src="./image/vip.png"></span>
                                                            </p>

                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo">01:39:00
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a href="#">白蛇：缘起</a>
                                                            </p>
                                                            <span class="score"><strong class="num">8</strong>.9</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="杨天翔">杨天翔
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="张喆">张喆
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="张遥函">张遥函
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" alt="海王" title="海王" src="./image/haiwang.jpg">


                                                            <p class="viedo_lt ">
                                                                <span class="icon-member-box">
                                                                    <img src="./image/juan.png"></span>
                                                            </p>

                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo">02:23:00
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a href="#">海王</a>
                                                            </p>
                                                            <span class="score"><strong class="num">8</strong>.6</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="杰森·莫玛">杰森·莫玛
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="艾梅柏·希尔德">艾梅柏·希尔德
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="妮可·基德曼">妮可·基德曼
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="site-piclist_pic">
                                                        <a title="新喜剧之王" href="#" class="site-piclist_pic_link">
                                                            <img width="180" height="236" rseat="dsjp7" alt="新喜剧之王" title="新喜剧之王"
                                                                src="./image/xijuzhiwang.jpg">
                                                            <p class="viedo_lt " data-search-pay="ico">
                                                                <span class="icon-member-box">
                                                                    <img src="./image/fufei.png"></span>
                                                            </p>
                                                            <div class="wrapper-listTitle">
                                                                <div class="mod-listTitle">
                                                                    <p class="viedo_rb">
                                                                        <span class="icon-vInfo">01:31:00
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="site-piclist_info">
                                                        <div class="mod-listTitle_left">
                                                            <p class="site-piclist_info_title  movie-tit ">
                                                                <a title="新喜剧之王" href="#">新喜剧之王</a>
                                                            </p>
                                                            <span class="score">
                                                                <strong class="num">7</strong>.6</span>

                                                        </div>
                                                        <div class="role_info">
                                                            <span>主演:</span>
                                                            <span>
                                                                <a href="#" title="王宝强">王宝强
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="鄂靖文">鄂靖文
                                                                </a>
                                                            </span>
                                                            <span>
                                                                <a href="#" title="张全蛋">张全蛋
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="zxf_pagediv"></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <script type="text/javascript">
                            $('.openBtn').click(function () {
                                $(this).hide();
                                $(this).parent('div').addClass('mod_sear_list_open');
                            })
                            $('.close-mod_btn').click(function () {
                                $('.openBtn').show();
                                $(this).parent('ul').parent('div').removeClass('mod_sear_list_open');
                            })
                            $('.checkBox-item').click(function () {
                                $('.search-checkBox-inner').removeClass('checkbox');
                                $(this).children("span").children('i').toggleClass('checkbox');
                            })
                            //翻页
                            $(".zxf_pagediv").createPage({
                                pageNum: 20,
                                current: 6,
                                backfun: function (e) {
                                    //console.log(e);//回调
                                }
                            });
                            $('.site-piclist li').click(function () {
                                var src = $(this).children('.site-piclist_pic').children('a').children('img').attr('src');
                                var name = $(this).children('.site-piclist_info').children('div').children('p').children('a').html();
                                location.href = "./video.html" + '?img=' + src + '&name=' + encodeURI(name);
                            })
                            $('.btnd').click(function () {
                                location.href = "./Upload.aspx";
                            })
                            $('.pindao li').click(function () {
                                $('.pindao li').removeClass('selected');
                                $(this).addClass('selected');
                            })
                            $('.money li').click(function () {
                                $('.money li').removeClass('selected');
                                $(this).addClass('selected');
                            })
                            $('.area li').click(function () {
                                $('.area li').removeClass('selected');
                                $(this).addClass('selected');
                            })
                            $('.what li').click(function () {
                                $('.what li').removeClass('selected');
                                $(this).addClass('selected');
                            })
                            $('.any li').click(function () {
                                $('.any li').removeClass('selected');
                                $(this).addClass('selected');
                            })
                            $('.year li').click(function () {
                                $('.year li').removeClass('selected');
                                $(this).addClass('selected');
                            })
                        </script>
                        <!--END内容-->
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() { if ((typeof duel_select_0Var != 'undefined') && (typeof duel_select_0Var.init != 'undefined')) { duel_select_0Var.init(); }; if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4Tmkwd01TMHdNMVF3Tnpvek1UbzBPUzR3TXpWYSxUR2JJaE4yQVFZSXpXMEQyR1dDVmZqLFpXTmhaVEU1'); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd01TMHdNMVF3Tnpvek1UbzBPUzR3TnpWYSw0TTllaTg1R3NCaGpqM2tYN1Jid3hhLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
<!-- page generation time: 124ms -->
