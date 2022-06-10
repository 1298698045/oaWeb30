<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addrgallery.aspx.cs" Inherits="Supermore.cntc.addrgallery" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>通讯录 ：通讯录卡片</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />

    <link type="text/css" rel="stylesheet" href="/css/lighting.css" />
    <link type="text/css" rel="stylesheet" href="/css/new/iconfont.css" />
    <link href="/content/video/zxf_page.css" rel="stylesheet" />
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
    <script src="/js/rem.js"></script>
    <script src="/content/video/zxf_page.js"></script>
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
    <script>        window.sfdcPage = new CommonLineItemSearchPage();</script>
     <script type="text/javascript" src="/js/CommonUtils.js"></script>
     <script type="text/javascript">
            function loadNew() {
                if (!commonUtils.isBrowserSupported() || commonUtils.IS_IE8 || commonUtils.IS_IE7) {
                    window.location = "/cntc/addrList.aspx?t=C00";
                }
            }
            loadNew();
    </script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '114.111.167.121', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk');</script>
    <script>

    </script>
    <style>
        .slds-nav-vertical__item, .slds-breadcrumb__item {
            margin: 0;
            padding: 0;
        }

            .slds-breadcrumb__item span {
                display: block;
                margin-top: 8px;
            }

        .SelectSearch {
            position: absolute;
            height: 100%;
            overflow: hidden;
            width: -moz-calc(100% - 20px);
            width: -webkit-calc(100% - 20px);
            width: calc(100% - 20px);
            /*width:98.5%;*/
        }

        #contentWrapper {
            height: 100%;
        }

        .bodyDivs {
            /*height:80%;*/
        }

        .outer, .bPageTitle {
            height: 100%;
        }

        .noSidebarCell {
            /*display: block;*/
            height: 100%;
        }

        a {
            text-decoration: none;
        }
        .page{
            height: 42px;
            position: absolute;
            bottom: 0;
            right: 0;
            padding: 5px 18px 5px 0;
            width: 86.5%;
            width: calc(100% - 259px);
            width: -moz-calc(100% - 259px);
            width: -webkit-calc(100% - 259px);
            background: #fff;
            border-top: 1px solid #ccc;
            text-align: center;
            line-height: 42px;
            font-size: 15px;
        }
        .centerRegiona .zxf_pagediv {
            position: absolute;
            bottom: 0;
            right: 0;
            padding: 5px 18px 5px 0;
            width: 86.5%;
            width: calc(100% - 259px);
            width: -moz-calc(100% - 259px);
            width: -webkit-calc(100% - 259px);
            background: #fff;
            border-top: 1px solid #ccc;
        }

        .bodyDivs {
            background: #fff;
            border-top: 3px solid;
        }

        .slds-breadcrumb__item .img {
            height: 30px;
            background: #F88962;
        }

        .img .head_img {
            width: 25px;
            height: 25px;
            margin-left: 2px;
            margin-top: 2px;
        }

        .slds-nav-vertical__action .span {
            display: inline-block;
            width:85px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

            .slds-nav-vertical__action span img {
                width: 15px;
                height: 16px;
            }

        .people_cancel_item .people_cancel_item_span {
            display: inline-block;
            margin-top: 11px;
        }

        .people_cancel_item_span img {
            width: 15px;
            height: 15px;
        }

        .shi {
            display: inline-block;
            margin-top: 7px;
            color: #ccc;
            font-size:12px;
        }
        .clear {
            clear:both;
        }
    </style>
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
        <div class="bodyDivs brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class="noSidebarCell" style="padding: 0;">
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" />
                        </a>
                        <div class="bPageTitle" style="padding: 0;">
                            <div class="slds-brand-band">
                                <div class="slds-template__container">
                                    <div class="lafSinglePaneWindowManager">
                                        <div class="windowViewMode-normal">
                                            <div class="forceContentFilesHomeDesktop">
                                                <div class="slds-page-header slds-has-bottom-magnet slds-page-header--fileshome" style="border-bottom: 0; border-radius: 0;">
                                                    <div class="slds-grid" style="height: 50px;">
                                                        <div class="slds-has-flexi-truncate test-fileshome-leftHeader">
                                                            <div class="slds-media slds-no-space slds-grow">
                                                                <div class="slds-media__body">
                                                                    <div>
                                                                        <ol class="slds-breadcrumb slds-list--horizontal slds-wrap">
                                                                            <li class="slds-breadcrumb__item slds-line-height--reset">
                                                                                <span class="img" style="width: 30px; float: left; margin: 0;">
                                                                                    <img src="/img/phone_talk.png" alt="Alternate Text" class="head_img" /></span>
                                                                                <span class="slds-p-right--x-small uiOutputText">通讯录
                                                                                </span>
                                                                            </li>
                                                                        </ol>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="slds-align-bottoms">
                                                            <div class="slds-col slds-no-flex slds-grid slds-align-bottom slds-shrink" style="flex-shrink: 1; flex: none;">
                                                                <div>
                                                                    <div class="search-in-list slds-m-left_large slds-is-relative">
                                                                        <div class="slds-form-element">
                                                                            <label class="slds-form-element__label slds-no-flex slds-assistive-text">搜索此列表...</label>
                                                                            <div class="slds-form-element__control slds-grow slds-input-has-icon slds-input-has-icon_left-right">
                                                                                <input type="search" placeholder="搜索联系人" class="slds-input search" style="padding-right: 0; padding-left: 1.7rem;">
                                                                                <div class="slds-input__icon">
                                                                                    <i class="iconfont icon-sousuo"></i>
                                                                                </div>
                                                                                <div class="slds-input__icon-group slds-input__icon-group_right">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="slds-no-flex slds-grid slds-align-bottom">
                                                                <div class="slds-m-left_xx-small">
                                                                    <%-- <div class="slds-dropdown-trigger">
                                                                        <button class="slds-button_icon-more select select_first" style="color: #479CB7;">
                                                                            新建联系人
                                                                                <i class="iconfont icon-arrow_right"></i>
                                                                        </button>
                                                                        <div class="slds-dropdown slds-dropdown_right toop_first">
                                                                        </div>
                                                                    </div>--%>
                                                                    <%-- <div class="slds-dropdown-trigger">
                                                                        <button class="slds-button_icon-more select select_second">
                                                                            <i class="iconfont icon-fenping-" style="margin-left: -9px; font-size: 16px;"></i>
                                                                            <i class="iconfont icon-arrow_right" style="margin-left: 9px;"></i>
                                                                        </button>
                                                                        <div class="slds-dropdown slds-dropdown_right toop_second" style="width: 8rem;">
                                                                            <ul class="dropdown__list">
                                                                                <li class="slds-dropdown__header">
                                                                                    <span class="slds-text-title--caps">显示为</span>
                                                                                </li>
                                                                                <li class="slds-dropdown__item grid lista">
                                                                                    <a href="javascript:;">
                                                                                        <span class="slds-truncate">
                                                                                            <span style="display: inline-block; float: left; width: 20px; height: 20px;">
                                                                                                <i class="iconfont icon-duihao" style="display: none;"></i>
                                                                                            </span>
                                                                                            <span style="float: left">表</span>
                                                                                            <i class="iconfont icon-detail-table"></i>
                                                                                        </span>
                                                                                    </a>
                                                                                </li>
                                                                                <li class="slds-dropdown__item grid bans">
                                                                                    <a href="javascript:;">
                                                                                        <span class="slds-truncate">
                                                                                            <span style="display: inline-block; float: left; width: 20px; height: 20px;">
                                                                                                <i class="iconfont icon-duihao"></i>
                                                                                            </span>
                                                                                            <span style="float: left">看板</span>
                                                                                            <i class="iconfont icon-fenping-" style="font-size: 12px;"></i>
                                                                                        </span>
                                                                                    </a>
                                                                                </li>
                                                                                <li class="slds-dropdown__item grid tu">
                                                                                    <a href="javascript:;">
                                                                                        <span class="slds-truncate">
                                                                                            <span style="display: inline-block; float: left; width: 20px; height: 20px;">
                                                                                                <i class="iconfont icon-duihao" style="display: none;"></i>
                                                                                            </span>
                                                                                            <span style="float: left">分屏视图</span>
                                                                                            <i class="iconfont icon-fenping-" style="font-size: 12px;"></i>
                                                                                        </span>
                                                                                    </a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>--%>
                                                                    <%--<div style="float: right;">
                                                                        <div class="slds-m-left_xx-small">
                                                                            <div class="slds-button-group">
                                                                                <div>
                                                                                    <button class="slds-button slds-button_icon-border-filled" style="width: 2rem; height: 2rem; background: #fff; border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;">
                                                                                        <i class="iconfont icon-refresh" style="font-weight: 900;"></i>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="slds-grid" style="height: 50px;">
                                                        <div class="slds-col slds-align-bottom">
                                                                <div>
                                                                    <span class="pages"></span>个人员
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                                <div class="slds-card slds-grid object-detail-page" style="border-top: 1px solid #ccc;">
                                                    <div class="slds-grid slds-container--fluid slds-grid--vertical-stretch">
                                                        <div class="slds-container--small slds-grid slds-grid--vertical-stretch">
                                                            <div class="slds-grid slds-grid--vertical slds-navigation-list--vertical objectManagerLeftNav" style="padding-top: 0;">

                                                                <h2 class="h2">联系人</h2>
                                                                <div class="slds-nav-vertical__item new slds-is-active">
                                                                    <a class="slds-nav-vertical__action" href="javascript:;" style="font-weight: 400;">
                                                                        <span>
                                                                            <img src="/img/default_log_head.gif" alt="Alternate Text" class="list_img" /></span>
                                                                        <span>最近联系(<span class="talk_num"></span>)</span>
                                                                    </a>
                                                                </div>

                                                                <div class="slds-nav-vertical__item">
                                                                    <a class="slds-nav-vertical__action" href="javascript:;" style="font-weight: 400;">
                                                                        <ul class="tab">
                                                                            <li class="tab_item tab_active">部门</li>
                                                                            <li class="tab_item">组</li>
                                                                        </ul>
                                                                    </a>
                                                                </div>
                                                                <div class="heightdiv" style="overflow: auto;height: calc(100% - 119px);height:82%;"> 
                                                                    <ul class="cont department" style="display: block;">
                                                                    </ul>
                                                                    <ul class="cont group">
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="centerRegiona">
                                                            <div class="centerRegionab">
                                                                <div class="detailsOuter allow-horizontal-form runtime_sales_activitiesTaskDetails inlineEditEnabled">
                                                                    <div class="details" style="margin: 0; border-top: 0;">
                                                                        <div style="min-height: 150px; height: 100%;" id="processList">
                                                                            <ul class="people_ul">
                                                                            </ul>

                                                                        </div>

                                                                    </div>

                                                                </div>

                                                            </div>
                                                            <%--<div class="page"></div>--%>
                                                            <%--<div class="zxf_pagediv"></div>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Body events -->
                        <script type="text/javascript">
                            $('.new').click(function () {
                                $(this).addClass('slds-is-active');
                                $('.group_list').removeClass('slds-is-active');
                                $('.second_list').removeClass('slds-is-active');
                                people();
                            })
                            $('.tab_item').click(function () {

                                $('.tab_item').removeClass('tab_active');
                                $(this).addClass('tab_active');
                                $('.cont').eq($(this).index()).show().siblings('ul').hide();
                                if ($(this).index() == 0) {
                                    $('tab_active').css('border-radius', '5px 0 0 5px');
                                } else {
                                    $('tab_active').css('border-radius', '0 5px 5px 0');
                                }
                            })
                            function BrowserType() {
                                var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串 
                                var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器 
                                var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器 
                                var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1 && !isIE; //判断是否IE的Edge浏览器 
                                var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器 
                                var isSafari = userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1; //判断是否Safari浏览器 
                                var isChrome = userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1; //判断Chrome浏览器 

                                if (isIE) {
                                    var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
                                    reIE.test(userAgent);
                                    var fIEVersion = parseFloat(RegExp["$1"]);
                                    if (fIEVersion == 7)
                                    { $('.bodyDivs').css('height', '89%'); $('.centerRegiona').css('height', '92%'); $('.objectManagerLeftNav').css('height', '98%'); return "IE7"; }
                                    else if (fIEVersion == 8)
                                    { $('.uiOutputText').css('right', '0px'); $('.bodyDivs').css('height', '89%'); $('.centerRegiona').css('height', '92%'); $('.objectManagerLeftNav').css('height', '98%'); return "IE8"; }
                                    else if (fIEVersion == 9)
                                    {  $('.bodyDivs').css('height', '89%'); $('.centerRegiona').css('height', '92%'); $('.objectManagerLeftNav').css('height', '98%'); return "IE9"; }
                                    else if (fIEVersion == 10)
                                    { $('.bodyDivs').css('height', 'calc(100% - 165px)'); return "IE10"; }
                                    else if (fIEVersion == 11)
                                    {$('.bodyDivs').css('height', 'calc(100% - 165px)'); return "IE11"; }
                                    else
                                    {  $('.bodyDivs').css('height', '89%'); $('.centerRegiona').css('height', '92%'); $('.objectManagerLeftNav').css('height', '98%'); return "0" }//IE版本过低 
                                }

                                if (isFF) { $('.bodyDivs').css('height', 'calc(100% - 165px)'); return "FF"; }
                                if (isOpera) { $('.bodyDivs').css('height', 'calc(100% - 165px)'); return "Opera"; }
                                if (isSafari) { $('.bodyDivs').css('height', 'calc(100% - 165px)'); return "Safari"; }
                                if (isChrome) { $('.bodyDivs').css('height', 'calc(100% - 165px)'); return "Chrome"; }
                                if (isEdge) {  $('.bodyDivs').css('height', 'calc(100% - 165px)'); return "Edge"; }
                            }
                            BrowserType();
                            var getExplorer = (function () {
                                var explorer = window.navigator.userAgent,
                                    compare = function (s) { return (explorer.indexOf(s) >= 0); },
                                    ie11 = (function () { return ("ActiveXObject" in window) })();
                                if (compare("MSIE") || ie11) { return 'ie'; }
                                else if (compare("Firefox") && !ie11) { return 'Firefox'; }
                                else if (compare("Chrome") && !ie11) {
                                    if (explorer.indexOf("Edge") > -1) {
                                        return 'Edge';
                                    } else {
                                        return 'Chrome';
                                    }
                                }
                                else if (compare("Opera") && !ie11) { return 'Opera'; }
                                else if (compare("Safari") && !ie11) { return 'Safari'; }

                            })()

                            if (getExplorer == 'ie') {
                                //alert('当前浏览器内核为IE内核，请使用非IE内核浏览器！');
                                $('.bodyDivs').css('height', 'calc(100% - 165px)');
                                $('.uiOutputText').css('right', '-91px');
                            }
                            if (getExplorer == 'Edge') {
                                //alert('当前浏览器为Edge，请使用非IE内核浏览器！');
                            }

                            var ment = '';
                            var html = '';
                            var stml = '';
                            var group = '';
                            //获取部门
                            function Department() {
                                jQuery.ajax({
                                    url: "/apps/CommandProcessor.ashx?cmd=sys.organization.tree",
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        ment = '';
                                        //console.log(data)
                                        $('.department').html('');
                                        for (var i = 0; i < data.listData.length; i++) {
                                            ment += '<li class="slds-nav-vertical__item second_list" id="' + data.listData[i].BusinessUnitId + '">';
                                            if (data.listData[i].Chidren.length != 0) {
                                                ment += '<a class="slds-nav-vertical__action list" href="javascript:;" style="font-weight: 400;" title="' + data.listData[i].Name + '">';

                                            } else {
                                                ment += '<a class="slds-nav-vertical__action" href="javascript:;" style="font-weight: 400;" title="' + data.listData[i].Name + '">';

                                            }
                                            ment += '<span>';
                                            ment += '<img src="/img/bumen.png" alt="Alternate Text" class="list_img" /></span>';
                                            ment += '<span class="span">' + data.listData[i].Name + '</span>' + '<span>(' + data.listData[i].PeopleQuantity + '人)</span>';
                                            ment += '</a>';
                                            
                                            var children = data.listData[i].Chidren;
                                            ment += '<ul class="tab_ul" style="display:none;">';                                          
                                            for (var j = 0; j < children.length; j++) {
                                                var childrens = children[j]
                                                ment += '<li class="slds-nav-vertical__item second_list" id="' + childrens.BusinessUnitId + '" num = "' + childrens.PeopleQuantity + '">';
                                                if (children[j].Chidren.length != 0) {
                                                    ment += '<a class="slds-nav-vertical__action list" href="javascript:;" style="font-weight: 400;" title="' + data.listData[i].Name + '">';

                                                } else {
                                                    ment += '<a class="slds-nav-vertical__action" href="javascript:;" style="font-weight: 400;" title="' + data.listData[i].Name + '">';

                                                }
                                                ment += '<span>';
                                                ment += '<img src="/img/default_log_head.gif" alt="Alternate Text" class="list_img" />';
                                                ment += '</span>';
                                                ment += '<span class="span">' + childrens.Name + '</span>' + '<span>(' + childrens.PeopleQuantity + '人)</span>';
                                                ment += '</a>';
                                                var childrenss = children[j]
                                                if(childrenss.Chidren.length!=0){
                                                    bumen(childrenss)                                              
                                                }
                                                function bumen(childrenss) {
                                                    ment += '<ul class="tab_ul" style="display:none;">';
                                                    for (var m = 0; m < childrenss.Chidren.length; m++) {
                                                        ment += '<li class="slds-nav-vertical__item second_list" id="' + childrenss.Chidren[m].BusinessUnitId + '" num = "' + childrenss.Chidren[m].PeopleQuantity + '">';
                                                        if (childrenss.Chidren[m].Chidren.length != 0) {
                                                            ment += '<a class="slds-nav-vertical__action list" href="javascript:;" style="font-weight: 400;" title="' + data.listData[i].Name + '">';

                                                        } else {
                                                            ment += '<a class="slds-nav-vertical__action" href="javascript:;" style="font-weight: 400;" title="' + data.listData[i].Name + '">';
                                                        }
                                                        ment += '<span>';
                                                        ment += '<img src="/img/default_log_head.gif" alt="Alternate Text" class="list_img" />';
                                                        ment += '</span>';
                                                        ment += '<span class="span">' + childrenss.Chidren[m].Name + '</span>' + '<span>(' + childrenss.Chidren[m].PeopleQuantity + '人)</span>';
                                                        ment += '</a>';
                                                        if(childrenss.Chidren.length!=0){
                                                            bumen(childrenss.Chidren[m])
                                                        }
                                                    }
                                                    ment += '</ul>';
                                                    ment += '</li>';                                              
                                                }
                                                ment += '</li>';
                                            }
                                            ment += '</ul>';
                                            ment += '</li>';
                                        }
                                        $('.department').html(ment);
                                        $('.list').click(function () {
                                            $(this).toggleClass('list_down');
                                            $(this).siblings('ul').toggle();
                                        })
                                       
                                    }
                                })
                            }
                            Department();
                            var groups = '';
                            $('.second_list').click(function () {

                                $('.slds-nav-vertical__item').removeClass('slds-is-active');
                                $('.second_list').removeClass('slds-is-active');
                                $(this).addClass('slds-is-active');
                                var id = $(this).attr('id');
                                var num = $(this).attr('num');
                                jQuery.ajax({
                                    url: '/apps/CommandProcessor.ashx?cmd=addresslist.user.search&pageSize=25&pageNumber=1&businessUnitId=' + id,
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        //console.log(data)
                                        if (data.listData.length > 0) {
                                            $('.people_ul').html(' ');
                                            groups = '';
                                            for (var i = 0; i < data.listData.length; i++) {
                                                groups += '<li class="people_item" id="' + data.listData[i].BusinessUnitId + '">';
                                                groups += '<div class="people_img">';
                                                groups += '<img src="' + data.listData[i].PhotoUrl + '" alt="Alternate Text" />';
                                                if (data.listData[i].WorkStatus == '' || data.listData[i].WorkStatus == 0) {
                                                    groups += ' <span class="shi">(在单位)</span>';
                                                } else {
                                                    groups += '<span class="shi">(请假)</span>';
                                                }
                                                groups += '</div>';
                                                groups += '<div class="people_text">';
                                                groups += '<div class="people_name">';
                                                groups += '<span class="people_names">' + data.listData[i].FullName + '<em style="font-size:15px;">' + data.listData[i].JobTitle + '</em></span>';
                                                groups += '<button class="people_cancel">';
                                                groups += '<i class="iconfont icon-f11"></i>';
                                                groups += '</button>';
                                                groups += '</div>';
                                                groups += '<p class="people_do">';
                                                groups += '<span class="people_united">' + data.listData[i].BusinessUnitIdName + '</span>';
                                                groups += '</p>';
                                                groups += '<p class="people_phone">' + data.listData[i].MobilePhone + '</p>';
                                                groups += '<p class="people_email">' + data.listData[i].EMailAddress + '</p>';
                                                //groups += '<ul class="people_cancel_ul">';
                                                //groups += '<li class="people_cancel_item">';
                                                //groups += '<span class="people_cancel_item_span">';
                                                //groups += '<img src="/img/email.png" class="people_cancel_item_img" alt="" />';
                                                //groups += '</span>';
                                                //groups += '<span class="people_cancel_item_text">发送邮件</span>';
                                                //groups += '</li>';
                                                //groups += '<li class="people_cancel_item">';
                                                //groups += '<span class="people_cancel_item_span">';
                                                //groups += '<img src="/img/talk.png" class="people_cancel_item_img" alt="" />';
                                                //groups += '</span>';
                                                //groups += '<span class="people_cancel_item_text">开始聊天</span>';
                                                //groups += '</li>';
                                                //groups += '</ul>';
                                                groups += '</div>';
                                                groups += '</li>';
                                            }
                                            $('.people_ul').html(groups);

                                            $('.pages').html(num);
                                        } else {
                                            $('.people_ul').html('<p style="text-align: center;font-size: 20px;">无记录</p>');
                                        }
                                    }
                                })
                                return false;
                            })

                            //获取组
                            function Group() {
                                jQuery.ajax({
                                    url: "/apps/CommandProcessor.ashx?cmd=addresslist.group.getlist",
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        html = '';
                                        $('.group').html('');
                                        for (var i = 0; i < data.listData.length; i++) {
                                            html += ' <li class="slds-nav-vertical__item group_list" id="' + data.listData[i].GroupId + '" nums = "' + data.listData[i].Quantity + '">';
                                            html += ' <a class="slds-nav-vertical__action" href="javascript:;" style="font-weight: 400;" title="' + data.listData[i].Name + '">';
                                            html += ' <span>';
                                            html += ' <img src="/img/people.png" alt="Alternate Text" class="list_img" /></span>';
                                            html += ' <span class="span">' + data.listData[i].Name + '</span>' + '<span>(' + data.listData[i].Quantity + '人)</span>';
                                            html += ' </a>';
                                            html += ' </li>';
                                        }
                                        $('.group').html(html);
                                    }
                                })
                            }
                            Group();

                            $('.group_list').click(function () {
                                $('.slds-nav-vertical__item').removeClass('slds-is-active');
                                $('.group_list').removeClass('slds-is-active');
                                $(this).addClass('slds-is-active');
                                var id = $(this).attr('id');
                                var nums = $(this).attr('nums');
                                jQuery.ajax({
                                    url: '/apps/CommandProcessor.ashx?cmd=addresslist.user.search&pageSize=25&pageNumber=1&groupid=' + id,
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        if (data.listData.length > 0) {
                                            $('.people_ul').html(' ');
                                            group = '';
                                            for (var i = 0; i < data.listData.length; i++) {
                                                group += '<li class="people_item" id="' + data.listData[i].BusinessUnitId + '">';
                                                group += '<div class="people_img">';
                                                group += '<img src="' + data.listData[i].PhotoUrl + '" alt="Alternate Text" />';
                                                if (data.listData[i].WorkStatus == '' || data.listData[i].WorkStatus == 0) {
                                                    group += '<span class="shi">(在单位)</span></span>';
                                                } else {
                                                    group += '<span class="shi">(请假)</span></span>';
                                                }
                                                group += '</div>';
                                                group += '<div class="people_text">';
                                                group += '<div class="people_name">';
                                                group += '<span class="people_names">' + data.listData[i].FullName + '<em style="font-size:15px;">' + data.listData[i].JobTitle + '</em></span>';
                                                group += '<button class="people_cancel">';
                                                group += '<i class="iconfont icon-f11"></i>';
                                                group += '</button>';
                                                group += '</div>';
                                                group += '<p class="people_do">';
                                                group += '<span class="people_united">' + data.listData[i].BusinessUnitIdName + '</span>';
                                                group += '</p>';
                                                group += '<p class="people_phone">' + data.listData[i].MobilePhone + '</p>';
                                                group += '<p class="people_email">' + data.listData[i].EMailAddress + '</p>';
                                                group += '</div>';
                                                group += '</li>';
                                            }
                                            $('.people_ul').html(group);
                                            $('.pages').html(nums);
                                        } else {
                                            $('.people_ul').html('<p style="text-align: center;font-size: 20px;">无记录</p>');
                                        }

                                    }
                                })
                            })
                            $(".list").parent().width(223)
                            //获取所有人员
                            function people() {
                                jQuery.ajax({
                                    url: '/apps/CommandProcessor.ashx?cmd=addresslist.latestuse.getlist',
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        $('.talk_num').html(data.listData.length);
                                        if (data.listData.length > 0) {
                                            $('.people_ul').html(' ');
                                            stml = '';
                                            for (var i = 0; i < data.listData.length; i++) {
                                                stml += '<li class="people_item" id="' + data.listData[i].BusinessUnitId + '">';
                                                stml += '<div class="people_img">';
                                                stml += '<img src="' + data.listData[i].PhotoUrl + '" alt="Alternate Text" />';
                                                if (data.listData[i].WorkStatus == '' || data.listData[i].WorkStatus == 0) {
                                                    stml += '<span class="shi">(在单位)</span></span>';
                                                } else {
                                                    stml += '<span class="shi">(请假)</span></span>';
                                                }
                                                stml += '</div>';
                                                stml += '<div class="people_text">';
                                                stml += '<div class="people_name">';
                                                stml += '<span class="people_names">' + data.listData[i].FullName + '<em style="font-size:15px;">' + data.listData[i].JobTitle + '</em></span>';
                                                stml += '<button class="people_cancel">';
                                                stml += '<i class="iconfont icon-f11"></i>';
                                                stml += '</button>';
                                                stml += '</div>';
                                                stml += '<p class="people_do">';
                                                stml += '<span class="people_united">' + data.listData[i].BusinessUnitIdName + '</span>';
                                                stml += '</p>';
                                                stml += '<p class="people_phone">' + data.listData[i].MobilePhone + '</p>';
                                                stml += '<p class="people_email">' + data.listData[i].EMailAddress + '</p>';
                                                stml += '</div>';
                                                stml += '</li>';
                                            }
                                            $('.people_ul').append(stml);
                                            $('.pages').html(data.listData.length);
                                        } else {
                                            $('.people_ul').html('<p style="text-align: center;font-size: 20px;">无记录</p>');
                                        }
                                    }
                                })
                            }
                            people();
                            //翻页
                           <%-- $(".zxf_pagediv").createPage({
                                pageNum: 4,
                                current: 1,
                                backfun: function (e) {
                                    //console.log(e);//回调
                                }
                            });--%>
                            $('.search').keydown(function (e) {

                                if (e.keyCode == 13) {

                                    var val = $('.search').val();
                                    var vals = encodeURIComponent(val);
                                    $.ajaxSetup({ cache: false });
                                    jQuery.support.cors = true;
                                    jQuery.ajax({
                                        url: '/apps/CommandProcessor.ashx?cmd=addresslist.user.search&search=' + vals + '&pageSize=25&pageNumber=1',
                                        type: "GET",
                                        async: false,
                                        cache: false,
                                        dataType: "json",
                                        success: function (data) {
                                            if (!data) {
                                                return;
                                                $('.people_ul').html('<p style="text-align: center;font-size: 20px;">无记录</p>');
                                            }
                                            var datas = eval(data);
                                            $('.people_ul').html(' ');
                                            search_html = '';
                                            for (var i = 0; i < datas.listData.length; i++) {
                                                search_html += '<li class="people_item" id="' + datas.listData[i].BusinessUnitId + '">';
                                                search_html += '<div class="people_img">';
                                                search_html += '<img src="' + data.listData[i].PhotoUrl + '" alt="Alternate Text" />';
                                                search_html += '</div>';
                                                search_html += '<div class="people_text">';
                                                search_html += '<div class="people_name">';
                                                search_html += '<span class="people_names">' + datas.listData[i].FullName + '<em style="font-size:15px;">' + data.listData[i].JobTitle + '</em></span>';
                                                search_html += '<button class="people_cancel">';
                                                search_html += '<i class="iconfont icon-f11"></i>';
                                                search_html += '</button>';
                                                search_html += '</div>';
                                                search_html += '<p class="people_do">';
                                                search_html += '<span class="people_united">' + datas.listData[i].BusinessUnitIdName + '</span>';
                                                search_html += '</p>';
                                                search_html += '<p class="people_phone">' + datas.listData[i].MobilePhone + '</p>';
                                                search_html += '<p class="people_email">' + datas.listData[i].EMailAddress + '</p>';
                                                //search_html += '<ul class="people_cancel_ul">';
                                                //search_html += '<li class="people_cancel_item">';
                                                //search_html += '<span class="people_cancel_item_span">';
                                                //search_html += '<img src="/img/email.png" class="people_cancel_item_img" alt="" />';
                                                //search_html += '</span>';
                                                //search_html += '<span class="people_cancel_item_text">发送邮件</span>';
                                                //search_html += '</li>';
                                                //search_html += '<li class="people_cancel_item">';
                                                //search_html += '<span class="people_cancel_item_span">';
                                                //search_html += '<img src="/img/talk.png" class="people_cancel_item_img" alt="" />';
                                                //search_html += '</span>';
                                                //search_html += '<span class="people_cancel_item_text">开始聊天</span>';
                                                //search_html += '</li>';
                                                //search_html += '</ul>';
                                                search_html += '</div>';
                                                search_html += '</li>';
                                            }
                                            $('.people_ul').html(search_html);
                                            $('.pages').html(data.listData.length);
                                        }
                                    })

                                }

                            });
                            //搜索人员
                            var search_html = '';
                            $('.search').blur(function () {
                                var val = $('.search').val();
                                var vals = encodeURIComponent(val);
                                $.ajaxSetup({ cache: false });
                                jQuery.support.cors = true;
                                jQuery.ajax({
                                    url: '/apps/CommandProcessor.ashx?cmd=addresslist.user.search&search=' + vals + '&pageSize=25&pageNumber=1',
                                    type: "GET",
                                    async: false,
                                    cache: false,
                                    dataType: "json",
                                    success: function (data) {
                                        if (!data) {
                                            return;
                                            $('.people_ul').html('<p style="text-align: center;font-size: 20px;">无记录</p>');
                                        }
                                        var datas = eval(data);
                                        $('.people_ul').html(' ');
                                        search_html = '';
                                        for (var i = 0; i < datas.listData.length; i++) {
                                            search_html += '<li class="people_item" id="' + datas.listData[i].BusinessUnitId + '">';
                                            search_html += '<div class="people_img">';
                                            search_html += '<img src="' + data.listData[i].PhotoUrl + '" alt="Alternate Text" />';
                                            search_html += '</div>';
                                            search_html += '<div class="people_text">';
                                            search_html += '<div class="people_name">';
                                            search_html += '<span class="people_names">' + datas.listData[i].FullName + '<em style="font-size:15px;">' + data.listData[i].JobTitle + '</em></span>';
                                            search_html += '<button class="people_cancel">';
                                            search_html += '<i class="iconfont icon-f11"></i>';
                                            search_html += '</button>';
                                            search_html += '</div>';
                                            search_html += '<p class="people_do">';
                                            search_html += '<span class="people_united">' + datas.listData[i].BusinessUnitIdName + '</span>';
                                            search_html += '</p>';
                                            search_html += '<p class="people_phone">' + datas.listData[i].MobilePhone + '</p>';
                                            search_html += '<p class="people_email">' + datas.listData[i].EMailAddress + '</p>';
                                            //search_html += '<ul class="people_cancel_ul">';
                                            //search_html += '<li class="people_cancel_item">';
                                            //search_html += '<span class="people_cancel_item_span">';
                                            //search_html += '<img src="/img/email.png" class="people_cancel_item_img" alt="" />';
                                            //search_html += '</span>';
                                            //search_html += '<span class="people_cancel_item_text">发送邮件</span>';
                                            //search_html += '</li>';
                                            //search_html += '<li class="people_cancel_item">';
                                            //search_html += '<span class="people_cancel_item_span">';
                                            //search_html += '<img src="/img/talk.png" class="people_cancel_item_img" alt="" />';
                                            //search_html += '</span>';
                                            //search_html += '<span class="people_cancel_item_text">开始聊天</span>';
                                            //search_html += '</li>';
                                            //search_html += '</ul>';
                                            search_html += '</div>';
                                            search_html += '</li>';
                                        }
                                        $('.people_ul').html(search_html);
                                        $('.pages').html(data.listData.length);
                                    }
                                })
                            });


                            function bodyOnLoad() {
                                setFocusOnLoad();
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
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                        </select>
                            </div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">今天</a>
                                </div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>

        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <!--<script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1437560002000, "host": "", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>
    <script>        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script>        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>-->
    <div class="clear"></div>
    <script>
        var height = $(window).height()
       // console.log(height)
        if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){  
            height = height-30
          //  console.log(height)

        }else{
            height = height-75          
          //  console.log(height)
        }
        $(".centerRegiona").height(height-180)
        $(".heightdiv").height(height-320)
    </script> 
</body>
</html>
<!-- page generation time: 187ms -->
