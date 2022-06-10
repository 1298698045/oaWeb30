<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="instanceCreate.aspx.cs" Inherits="WebClient.wfinstance.instanceCreate" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>创建事务: 我的事务 ~ 流程管理 - 协同办公系统</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <!--<link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css" rel="stylesheet" type="text/css" />-->
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-09-25 下午3:21", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-MM-dd ah:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/Business.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <link href="/css/extended.css" rel="stylesheet" type="text/css" />
    <style>
        #mycomments span{
            font-weight:400 !important;
        }
        .subNav a {
            margin-left:20px !important
        }
    </style>
</head>
<body class="hasMotif Custom18Tab massAddCampaignMemberWiz MassAddCampaignMembersSelectCampaignStage sfdcBody brandQuaternaryBgr"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="subNav" style="height: 25px; background-color: #fff; margin: 0px; margin-top: 10px; border-bottom: 1px dotted #E9E9E9; line-height: 23px; font-size: 13px; margin-left: 5px; margin-bottom: 5px;">
                <div style="width:100%;height:30px;">
                   <a id="wfcreatewizard" href="/wfinstance/instanceCreate.aspx?gridid=wfcreatewizard&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">新建流程</span>
                    </a>                    
                    <a id="wfrulelog" href="/wfinstance/wftasklst.aspx?gridid=wfrulelog&t=a0M" class="subNav-tab ">
                        <span style="display:inline-block;width:75px;">待办事务(<span class="stat" id="waitingTaskQty" style="color:red;">0</span>)</span>
                    </a>
                    <a id="closedwfrulelog"  href="/wfinstance/closedtasklst.aspx?gridid=closedwfrulelog&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">已办事务</span>
                    </a>                   
                    <a id="mycreatewfinstances" href="/wfinstance/instlst.aspx?gridid=mycreatewfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:100px;">我发起件(<span class="stat" id="instanceQty" style="color:blue;">0</span>)</span>
                    </a>  
                    <a id="cancelledWfinstances" href="/wfinstance/cancellst.aspx?gridid=cancelledWfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">退回/撤销(<span class="stat" id="cancelledQty" style="color:red;">0</span>)</span>
                    </a>   
                    <a id="myreadwfinstances" href="/wfinstance/fowardReadLog.aspx?gridid=myreadwfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">收到传阅(<span class="stat" id="readQty" style="color:red;">0</span>)</span>
                    </a>
                     <a id="createdreadwfinstances" href="/wfinstance/SendInstanceRead.aspx?gridid=createdreadwfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:100px;">我传阅的</span>
                    </a> 
                     <a id="mydraftinstances" href="/wfinstance/draftlst.aspx?gridid=mydraftinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">草稿箱(<span class="stat" id="draftQty" style="color:red;">0</span>)</span>
                    </a>
                     <a id="mycomments" href="/wfinstance/commentliblst.aspx?gridid=mycomments&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">常用意见</span>
                    </a><!--
                     <a id="wordtemplates" href="/wfinstance/DocTemplates.aspx?gridid=wordtemplates&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">正文模板</span>
                    </a>
                    <a id="personalSetup" href="/wfinstance/personalSetup.aspx?gridid=personalSetup&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">个人设置</span>
                    </a> 
                    <a id="instancestat" href="/wfinstance/instancestatlst.aspx?gridid=instancestat&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">流程统计</span>
                    </a>                 
                    <a id="dashboard" href="/wfinstance/dashboard.aspx?t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">报表</span>
                    </a>-->
                </div>    
            </div>
            <script type="text/javascript">
                var grid1 = getQueryString("gridid");
                jQuery("#" + grid1).addClass("subNav-tab-active");
            </script>
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <style>
                        td.oLeft {
                            /*background: transparent;*/
                            border-right: 1px solid #dce4e7 !important;
                            min-width: 219px;
                        }

                        #AutoNumber5 {
                            font-size: 14px;
                        }

                        .setupLeaf {
                            color: #0085c7;
                            background-color: #fff;
                            line-height:20px;
                        }

                        .setupV2 .setupNavtree h2.highlight a {
                            color: #0085c7;
                        }

                        .mTreeSelection {
                            width: 220px;
                            background-color: transparent;
                            font-size: 109%;
                            text-align: left;
                            padding: .80em 0 .80em .80em !important;
                        }

                        .setupNavtree h2.highlight {
                            background: #fff;
                            border-width: 0;
                            line-height: normal;
                            margin: 0;
                            padding: 0;
                        }

                        .setupNavtree h2.highlight a {
                            color: #0085c7;
                        }

                        #AutoNumber5 .setupHighlightLeaf, #AutoNumber5 .setupLeaf {
                            border: none;
                            line-height: 38px;
                            margin: 0;
                            padding: 0;
                            white-space: normal;
                            
                        }
      
                    </style>
                           <style>
                            .listbox2 {
                                width: 99%;
                                margin-bottom: 32px;
                                margin-right: 0px;
                            }

                                .listbox2 .titleitem {
                                    height: 26px;
                                    line-height: 26px;
                                    font-weight: bold;
                                    border-bottom: 2px solid #e4e4e4;
                                    font-size: 13px;
                                }

                            .titlecontent {
                                float: left;
                                color: #232323;
                            }

                            .listbox2 label {
                                font-weight: bold;
                            }

                            .centerItem {
                                height: 30px;
                                line-height: 30px;
                                border-bottom: 1px dashed #f0f0f0;
                                padding-left: 0px;
                                position: relative;
                            }

                            .centerItem:hover {
                                    background-color: rgb(255, 255, 255);
                            }

                            .fontItem {
                                float: left;
                                cursor: pointer;
                                margin: 0px;
                                position: absolute;
                            }

                            .centerItem a {
                                margin-left: 8px;
                                margin-right: 10px;
                                cursor: pointer;
                                font-size: 13px;
                                color: #015ba7;
                                text-decoration: none;
                            }

                            .boxheader {
                                border-bottom:1px solid #e4e4e4;
                                width: 100%;
                                height:35px;
                                line-height:35px;
                            }
                            
                            #AutoNumber5 .setupLeaf a {
                                display:block;
                                width:100%;
                                padding-left:15px;
                                 line-height:32px;

                            }
                            #AutoNumber5 .setupLeaf:hover {
                                background-color: rgb(243, 242, 242);
                            }
                            
                            #AutoNumber5 .setupLeaf.selected{
                                background-color: rgba(0, 112, 210, 0.1);
                                border-left:3px solid  rgba(0, 112, 210, 1.0);
                            }
                            .innerbox{
                                overflow-x: hidden;
                                overflow-y: auto;
                                /*height:200px;*/
                            }

                            /*滚动条样式*/
                            .innerbox::-webkit-scrollbar{
                                width: 4px; 
                                height: 4px;
                            }
                            .innerbox::-webkit-scrollbar-thumb {
                                border-radius: 5px;
                                -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
                                background: rgba(0,0,0,0.2);
                            }
                            .innerbox::-webkit-scrollbar-track {
                                -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
                                border-radius: 0;
                                background: rgba(0,0,0,0.1);
                            }
                            #searchInput {
                                border: 1px solid #E9E9E2;
                                padding:4px;
 
                            }
                            .middless {
                                display: block;
                                position: absolute;
                                right: 3px;
                                top: -11px;
                                width: 25px;
                                height: 25px;
                                /*background-color:#000;*/
                                text-align:center;
                               
                            }
                                .middless img {
                                    width:65%;
                                    height:65%;
                                   
                                     margin-top:4px;
                                }
                            .icon {
                                display:block;
                                width:10px;
                                height:10px;
                                background-image: url("/img/angle.png");
                                background-repeat: no-repeat;
                                background-position: 50% 50%;
                                position:absolute;
                                bottom:-2px;
                                left:35%;
                            }
                        </style>
                    <td class="oLeft1" width="219">
                        <div id="setupNavTree" class="mTreeSelection">
                            <div id="AutoNumber5">
                                <div class="parent setupNavtree">
                                    <h2 class="highlight"><a class="setupSection" href="#" id="PersonalSetup_font" name="PersonalSetup"><span class="folderIcon PersonalSetup_icon"></span><span class="folderText">流程分类</span></a></h2>
                                    <hr>
                                </div>
                                <div class="innerbox" id="processCategoryContainer">
                                    <div class="setupLeaf selected"><a href="#" id="AllCategory_font">全部</a></div>
                                 </div>
                            </div>
                        </div>
                    </td>
                    <td id="bodyCell" class="oRight">
                        <!-- Start page content -->
                        <!--
                        <a name="skiplink">
                            <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img title="流程" class="pageTitleIcon" alt="流程" src="/s.gif" /><h1 class="pageType noSecondHeader">流程：创建事务</h1>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links">
                                            <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds('', false, false);">
                                                <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif" /></a>
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <br />-->
                 
                        <div class="boxheader">
                            <div class="all" style="float:left;position:relative;color:#0085c7">
                                <span id="wftab">全部流程</span>
                                <i class="icon"></i>
                            </div>
                            <!--
                            <div class="e8_outbox" style="visibility: visible; top: 20px;">
                                <div id="rightBox" class="e8_rightBox" style=" width:100px;visibility: visible;  float:right;">
                                    <div id="tabcontentframe_box" class="_box">
                                        <span id="searchblockspan"><span class="searchInputSpan" style="position: relative;">
                                            <input id="searchInput" class="searchInput middle" name="flowTitle" value="" _searchfn="onBtnSearchClick" style="vertical-align: top; width: 85px;" type="text">
                                            <span class="middle searchImg middless"><img class="middle" src="/img/search-input.png"></span></span></span><span title="菜单" class="cornerMenu middle"></span>
                                    </div>
                                </div>
                            </div>-->
                        </div>
                        <div style="margin-left: 15px; margin-right: 5px; min-height: 150px; overflow-y: auto;" id="processList">
                        </div>
                        <script type="text/javascript">
                            function refreshProcessPage(val) {
                                getAllWfProcess(fillCategory, val);
                            }
                            function selectProcess(ele) {
                                var name = jQuery(ele).attr("processname");
                                var curUser = jQuery("#curentUser").val();
                                jQuery("#instanceName").val(name + " " + curUser);
                            }
                            function fillCategory(data) {
                                var html = "";
                                for (var i = 0; i < data.length; i++) {
                                    var item = data[i];
                                    if ((i % 2) == 0)
                                        html += "<tr class=\" dataRow even\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";
                                    else
                                        html += "<tr class=\" dataRow odd\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";


                                    html += "<td class=\" dataCell  \" scope=\"row\">";
                                    html += " <a title=\"预览 （新窗口）\" class=\"actionLink\" href=\"javascript:openPopupFocus('/apps/flowdesigner/editors/monitor2.aspx?schemeId=" + item.id + "', 'monitor', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false)\">预览</a></td>";

                                    html += " <td class=\"dataCell\">";
                                    html += "<input name=\"pr_template_id\" id=\"pr_template_idc" + item.id + "\" type=\"radio\" checked=\"\" value=\"" + item.id + "\" processname=\"" + item.name + "\" onclick='selectProcess(this)'><label for=\"pr_template_id" + item.id + "\">";
                                    html += item.name + "</label></td>";

                                    //html += " <td class=\"dataCell\"></td>";
                                    html += " <td class=\"dataCell\"></td>";
                                    html += "</tr>";
                                }
                                jQuery("#bodyList").html(html);
                            }
                            var dialogs = {};
                            function showPopupDialog(url, dialogName, dialogTitle, height, width) {
                                var c = b = null;
                                c = dialogName;// "notifyInstance";
                                //debugger;
                                b = url;
                                var dialog = null;
                                //var dialog = new CollaborationAccessibleDialog(c, '催办', b, 450, 530);
                                if (!dialogs[c]) {
                                    dialog = new NonaccessibleDialog(c, dialogTitle, b, height, width); //CollaborationAccessibleDialog
                                    dialogs[c] = dialog;
                                }
                                else {
                                    dialog = dialogs[c];
                                    dialog.url = b;
                                }
                                dialog.display();
                            }
                            
                            jQuery(".setupLeaf").click(function () {
                                jQuery(this).addClass("selected").siblings().removeClass("selected");
                            })
                            
                            

                        </script>
                        <script>
                            var dialog = OverlayDialogElement.getDialog('appinstance_popup_');
                            dialog.isModal = true;
                            dialog.width = 500;
                            dialog.hasButtonsBar = true;
                            dialog.displayX = true;
                            dialog.allowKeyboardEsc = true;
                            dialog.extraClass = '';
                            dialog.isAbsolutePositioned = false;
                            dialog.refreshOnClose = false;
                            dialog.isMovable = true;
                            dialog.buttonContents = '\u003Cinput value=\" 保存 \"  class=\"btn\" id=\"invitee_picker_save_btn\" name=\"saveBtn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onPickerDone();\" title=\"保存 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"invitee_picker_cancel_btn\" name=\"cancelBtn\" onclick=\"closeDialog();\" title=\"取消 (Esc)\" type=\"button\" /\u003E';
                            dialog.setTitle('创建事务');
                            dialog.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"appinstance_popup_header_label\"\u003E\u003C/div\u003E <table><tr><td><label style=\"font-weight: bold; font-size: 13px;\">流程：</label></td><td></td></tr><tr><td><label style=\"font-weight: bold; font-size: 13px;\">标题：</label></td><td><input style=\"width: 300px; height:25px;\" id=\"instanceName\" name=\"instanceName\" /></td></tr><tr><td><label style=\"font-weight: bold; font-size: 13px;\">办理期限：</label></td><td><input style=\"width: 80px;height:25px;\" id=\"instanceDeadline" name=\"instanceDeadline\" value=\"3\" />天数</td></tr><tr><td><label style=\"font-weight: bold; font-size: 13px;\">部门：</label></td>             <td>                    <!--dept--></td>            </tr>            <tr><td>             <label style=\"font-weight: bold; font-size: 13px;\">描述：</label></td> <td>                    <textarea name=\"desc\" id=\"desc\" rows=\"4\" cols=\"10\" style=\"width: 300px;\"></textarea></td>            </tr>        </table> \u003C/div\u003E';
                        </script>
                        <script type="text/javascript">
                            function showCreateInstanceDialog(procId, name) {
                                document.getElementById("instanceName").value = name;
                                OverlayDialogElement.getDialog('appinstance_popup_').show();
                            }
                            function closeDialog2() {
                                OverlayDialogElement.getDialog('appinstance_popup_').cancel();
                            }
                            ajaxMethodData("category.process.getlist", null, renderGrid);
                            function renderGrid(data) {
                                //debugger;
                                var html = "<table width='100%'><tr>";
                                var j = 0;
                                var col = 0;
                                var chtml = " <div class='setupLeaf selected' onclick=\"ajaxMethodData('category.process.getlist', null, renderGrid)\"><a href='/wfinstance/instanceCreate.aspx?gridid=wfcreatewizard&t=a0M' id='AllCategory_font'>全部流程</a></div>";
                                for (var i = 0; i < data.listData.length; i++) {

                                    if (col % 3 == 0) {
                                        html += "</tr><tr>";
                                    }

                                    var row = data.listData[i];
                                    
                                    if (row.pid == "") {
                                        var childhtml = renderCategoryChild(data, row.id)
                                        if (childhtml != '') {
                                            html += "<td style='white-space: nowrap;text-overflow: ellipsis;word-wrap:break-word;width:32%' align='left' valign='top'>";
                                            html += "<div class='listbox2'>"
                                            html += " <div class=\"titleitem\">";
                                            html += "<div class=\"titlecontent main0\" style=\"border-bottom:2px solid #166ca5;\"><label>" + row.name + "</label><font style=\"font-weight: 400;margin-left:5px;\" color=\"#989898\"></font></div></div>";
                                            //render child
                                            //render empty
                                            //html += "<div class='mainItem'>";
                                            //html += "<div class='centerItem' style='background-color: rgb(255, 255, 255);'></div>";                                      
                                            // html += "</div>";
                                            chtml += "<div class='setupLeaf' id=\"" + row.id + "\" onclick=\"filterProcess('" + row.id + "','" + row.name + "')\"><a href='#'>" + row.name + "</a></div>";

                                            html += childhtml;
                                            html += "</div>";

                                            html += "</td>";
                                            col++;
                                        }
                                    }
                                    

                                    j++;
                                }
                                html += "</table>";
                                jQuery("#processList").html(html);

                                jQuery("#processCategoryContainer").html(chtml);

                                var treeHeight = getClientHeight();
                                treeHeight = treeHeight - 110 - 100;
                                jQuery("#processList").height(treeHeight);

                                jQuery("#processCategoryContainer").height(treeHeight);
                            }

                            
                            $('.setupLeaf').click(function () {
                               // console.log(123123,'====')
                                $('.setupLeaf').removeClass('selected');
                                $(this).addClass('selected');
                            })
                            function renderCategoryChild(data, pid) {
                                var childlength = 0
                                var html = "<div class='mainItem'>";
                                for (var i = 0; i < data.listData.length; i++) {
                                    var row = data.listData[i];
                                    if (row.pid == pid && pid != "") {
                                        childlength++
                                        html += "<div class='centerItem' style='background-color: rgb(255, 255, 255);'><div class='fontItem'>";
                                        html += "<img name=\"esymbol\" src=\"/img/workflowTitle.png\" style=\"vertical-align: middle;\">";
                                        html += "<a href='#' onclick=\"";
                                        
                                        html += "showPopupDialog('/apps/wf/createInstancePop.aspx?t=a0M&processId=" + row.id + "&name="+encodeURIComponent(row.name)+"', 'createInstancePop', '发起事务', 320, 520);";
                                        html += " \">";
                                        html += row.name + "</a></div></div>";
                                    }
                                }
                                if (childlength == 0) {
                                    return ''
                                } else {
                                    return html += "</div>";
                                }
                            }
                            function filterProcess(cateId,cateName)
                            {
                                //console.log(cateId, cateName,'log---')
                                jQuery("#wftab").html(cateName);
                                var d = { "folderId": cateId }
                                if (cateId == '00000000-0000-0000-0000-000000000000') {
                                    ajaxMethodData("process.latestused.getlist", null, renderCategoryProcess);

                                } else {
                                    ajaxMethodData("category.process.getlist", d, renderCategoryProcess);

                                }
                            }
                            function renderCategoryProcess(data) {
                                console.log(data,'data')
                                var html = "<table width='100%'><tr><td>";
                                var j = 0;
                                var col = 0;
                                 html += "<div class='mainItem'>";
                                 for (var i = 0; i < data.listData.length; i++) {
                                     var row = data.listData[i];
                                    html += "<div class='centerItem' style='background-color: rgb(255, 255, 255);'><div class='fontItem'>";
                                    html += "<img name=\"esymbol\" src=\"/img/workflowTitle.png\" style=\"vertical-align: middle;\">";
                                    html += "<a href='#' onclick=\"";
                                    html += "showPopupDialog('/apps/wf/createInstancePop.aspx?t=a0M&processId=" + row.id + "&name=" + encodeURIComponent(row.name) + "', 'createInstancePop', '发起事务', 320, 520);";
                                    html += " \">";
                                    html += row.name + "</a></div></div>";
                                }
                                html += "</div>";
                                html += "</td></tr></table>";
                                jQuery("#processList").html(html);
                            }
                        </script>
                        <style>
                            .recentFilesPanel .entityId {
                                display: none;
                            }

                            .listBlock {
                                width: 250px;
                                list-style: outside none none;
                                margin: 0;
                                padding: 0;
                            }

                                .listBlock .vfButtonBar {
                                    background-color: transparent;
                                    border-bottom: 1px solid #d7dbde;
                                    line-height: 20px;
                                    margin: 0 0 7px;
                                    position: relative;
                                    font-size: 1.0em;
                                }

                                    .listBlock .vfButtonBar a {
                                        color: #015ba7;
                                        float: right;
                                        font-size: 1.0em;
                                        text-decoration: none;
                                    }

                                .listBlock a {
                                    color: #015ba7;
                                    text-decoration: none;
                                    word-wrap: break-word;
                                }

                            .fileTypeIcon {
                                position: relative;
                            }

                                .fileTypeIcon .sprite-doctype_image_16 {
                                    background-position: 0 -312px;
                                }

                                .fileTypeIcon img {
                                    /*background: transparent url("/sfc/images/docicons/doctype_16_sprite.png?v=188-1") no-repeat scroll 0 0;*/
                                    background: transparent url("/img/arrow_right_yellow.png") no-repeat scroll 0 0;
                                    height: 16px;
                                    width: 16px;
                                }

                            .listBlock .recentFilesItem {
                                display: inline-block;
                                overflow: hidden;
                                text-overflow: ellipsis;
                                white-space: nowrap;
                                width: 215px;
                                border-bottom: 1px dashed #f0f0f0;
                                height: 30px;
                                line-height: 30px;
                                font-size: 14px;
                            }

                                .listBlock .recentFilesItem:hover {
                                    background-color: #f0f0f0;
                                }

                            .listBlock .recentFilesItem {
                                background-color: rgb(255, 255, 255);
                            }

                                .listBlock .recentFilesItem a {
                                    text-decoration: none;
                                }

                            .itemImg {
                                margin-top: 6px;
                                vertical-align: middle;
                                /*height: 30px;
                                line-height: 30px;*/
                            }
                        </style>
                         <script type="text/javascript">
                             ajaxMethodData("wf.instance.stat", null, function (data) {
                                 $("#draftQty").html(data.draftQty);
                                 $("#waitingTaskQty").html(data.waitingTaskQty);
                                 $("#instanceQty").html(data.instanceQty);
                                 $("#readQty").html(data.readQty);
                                 $("#cancelledQty").html(data.cancelledQty);
                             });
                        </script>
                        <!-- Body events -->
                        <script type="text/javascript">
                            function bodyOnLoad() {
                                setFocusOnLoad();
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                // if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, true); };
                                if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };;
                                //if (this.loadChatFrameJs) loadChatFrameJs(); 
                                //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                //SfdcApp.MruHovers.global_data.url = 'retURL=%2Fui%2Fmasest=1&amp;renderMode=RETRO&amp;nocache=1411636986890';
                                if (document.getElementById('sidebarDiv')) {
                                    Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                };
                                // if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>

            </table>
        </div>
    </div>
    <script type="text/javascript" src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script type="text/javascript" src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>


