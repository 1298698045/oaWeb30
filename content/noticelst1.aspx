<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=1300px" />
    <title>通知管理</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/layui/layui/css/layui.css" rel="stylesheet" />
   <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <script src="/jslibrary/sfdc/EmployeePicker.js"></script>
    <script>
        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/easyui/themes/bootstrap/easyui.css" type="text/css" />
    <link rel="stylesheet" href="/easyui/themes/icon.css" type="text/css" />
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    
    <link rel="stylesheet" href="/js/layoutlist/layoutlist.css" />
    <link rel="stylesheet" href="/template/css/indexStyle.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/common.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/icon/iconfont.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layout.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layoutAside.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/home.css" />
    <link rel="stylesheet" href="/css/myInstancelist.css" />
    <style>
        .center {
            margin-top: 75px;
            height: 100%;
        }
        .rightWrapper{
            margin-left:0px;
            padding:0 10px;
        }
    </style>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif contactTab  overviewPage sfdcBody brandQuaternaryBgr   ext-gecko ext-gecko3" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
       <div class="pageWraper">
        <uc1:MainNav ID="MainNav1" runat="server" />
        <div class="center">
            <div class="layoutContent">
                <div class="rightWrapper">
                    <div class="layoutContainer">
                        <div id="contentWrapper" style="vertical-align: middle">
        
                            <div class="bodyDiv brdPalette brandPrimaryBrd">
                                <div class="left-content">
                                    <div class="treesearch">
                                        <input type="text" name="treesearch" value="" placeholder="请输入" />
                                        <div class="searchIcon">
                                            <i class="iconfont icon-sousuo"></i>
                                        </div>
                                    </div>
                                    <div id="treePanel" class="easyui-panel" style="padding: 5px; width: 240px; min-height: 0!important; min-height: 200px;">
                                        <ul class="easyui-tree" id="LeftTree" style="display: block;">
                                            <li></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="main-content">
                                    <div class="left-show-btn">
                                        <i class="iconfont icon-xiala"></i>
                                    </div>
                                    <div class="left-hide-btn">
                                        <i class="iconfont icon-xiala" style="transform: rotate(270deg);"></i>
                                    </div>
                                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                                      <ul class="layui-tab-title">
                                      </ul>
                                    </div>
                                    <div class="search-content">
                                        <form class="layui-form" action="">
                                        </form>
                                    </div>
                                    <div class="statistics-content">
                    
                                    </div>
                                    <div class="gridcontent">
                                        <div id="datagrid"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="footInfo">
                        北京凤凰世纪科技有限公司技术支持
                        本机IP:119.80.173.160
                    </div>
                </div>
            </div>
        </div>

    </div>
    <iframe id="iframe" frameborder="0" src="/alert/wf/approval.html"></iframe>
    <div class="popup-mask"></div>
    <script type="text/javascript" src="/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="/template/js/search.js"></script>
    <script type="text/javascript" src="/template/js/indexjs.js"></script>
    <script src="/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="/layui/layui/layui.js"></script>
    <script type="text/javascript" src="/js/request.js"></script>
    <script type="text/javascript" src="/js/head.js"></script>
    <script type="text/javascript" src="/js/formcomponents.js"></script>
    <script type="text/javascript" src="/js/layoutlist/ContentPageConfig.js"></script>
    <script type="text/javascript" src="/js/layoutlist/treelistlayout.main.js"></script>
    <script src="/easyui/datagrid-export.js"></script>
    <script src="/js/alert.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
     
        var entityname = 'noticelst';
        if (getQueryString('name') && getQueryString('name') != 'undefined') {
            entityname = getQueryString('name')
        }
        layui.use(['element', 'form'], function () {
            mylayout = new createdlayout(entityname)
            mylayout.layoutelement = layui.element;
            mylayout.layoutform = layui.form;
            mylayout.init()
        });
        $(document).ready(function () {
            $('.topTabMenuItem').eq(0).removeClass('active');
        })
    </script>
</body>
</html>