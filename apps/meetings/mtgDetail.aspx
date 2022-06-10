<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mtgDetail.aspx.cs" Inherits="Supermore.apps.meetings.mtgDetail" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script>var obj = { ObjectTypeCode: 5000 }</script>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议管理 - 会议详细 ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/css/cal/card.css">
    <link rel="stylesheet" href="/css/cal/allmission.css">
    <link rel="stylesheet" href="/css/cal/newmission.css">
    <link rel="stylesheet" href="/css/cal/ca.css">
    <link rel="stylesheet" href="/css/cal/mission.css">
    <link rel="stylesheet" href="/css/cntrt/cntrt.css">
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />
    
    <link href="/css/form.css" rel="stylesheet" />
    <link href="/css/setform.css" rel="stylesheet" />

    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        .recurrenceFrequency {
            margin: 0;
        }
    </style>
    <style type="text/css">
        .bPageBlock .detailList .recurrenceTable td {
            vertical-align: middle;
            padding: 10px;
        }

        #bodyCell {
            padding: 0;
        }

        .bodyDiv {
            padding: 0;
        }

        .sidebarCell {
            padding: 0;
        }

        .caozuo {
            margin-right: 20px;
        }

        .genggai-div2 {
            right: 20px;
        }

        .othermession {
            height: 120px;
        }


        .mission-header-leftlogo div {
            top: 20px;
        }
        .head-bottbo {
            margin-top: 0px;
            border-bottom: 0;
            background-color:#158bb1;
            border:0;
            height:15px;
        }

        .mission {
            margin-top: 0px;
            background-color:#158bb1;
        }
        .mission-mi {
            background-image: linear-gradient(#158bb1, #127595);
        }
        .contract-message {
            height: 70px;
            overflow: hidden;
            background-color: white;
            border-bottom-left-radius:4px;
            border-bottom-right-radius:4px;
        }

            .contract-message ul {
                height: 20px;
            }

                .contract-message ul li {
                    float: left;
                    width: 150px;
                    font-size: 12px;
                }

        .contract-message-head {
            margin-top: 20px;
        }

        .edit-btn {
            position: absolute;
            top: 60px;
            z-index: 400;
            width: 64%;
            left: 13%;
            background-color: white;
            padding: 10px 5%;
            box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            display: none;
        }

        .related-item-body {
            max-width: 100%;
            width: 100%;
            overflow-x: auto;
        }

            .related-item-body ul {
                border-bottom: 1px solid #dddbda;
            }

        .lookall {
            border-top: 0;
        }


        .related-item {
            margin-top: 15px;
        }

        input[type="date"] {
            width: 130px !important;
        }

        .save-again {
            width: 70px !important;
        }

        .sanjiao {
            width: 20px !important;
            height: 20px !important;
            padding: 0 !important;
            margin-top: 5px;
            overflow: visible !important;
        }

        .related .miss-bianji {
            display: none;
        }

        .related .red {
            float: left;
            margin-right: 5px;
        }

        .form-element {
            width: 100%;
        }

        .contract-message li {
            height: 20px;
        }

        .mission-left {
            overflow-y: auto;
            height: 100%;
        }

        #zhenwen {
            width: 100%;
            border: 0;
            height: 100%;
        }

        .missionleft-body .related {
            height: auto;
        }
       
        .missionmession-body .main {
            line-height:30px;
        }
        .mission-left {
            border-radius:4px;
        }
        .mission-right {
            border-radius:4px;
            
        }
        #bodyCell {
            background:#71b2c6;
        }
        body {
            padding-bottom:20px;
            height:auto;
        }
        .related-item-head {
            padding-bottom:5px;
        }
        .miss-header {
            background-color:#f3f2f2;
            border-radius:4px 4px 0 0;
            margin-top:10px;
        }
        .missionleft-head li {
            margin-left:5px;
        }
        .people {
            padding:10px;
            margin:0;
        }
        .people-body {
            margin-top:10px;
        }
        .panel-body {
            box-sizing:border-box;
        }
        .missionleft-body > div {
            height:auto;
        }
        .mission > div {
            height:auto;
            box-shadow:0px 2px 3px 0px rgba(0, 0, 0, 0.3);
        }
        .mission .mission-mi {
            height:100%;
        }
        .mission-right {
            margin-left:1%;
        }
        .mission {
            background-color:transparent;
            margin-top:12px;
            padding-bottom:10px;
        }
        #bodyCell {
            background-color:transparent;
        }
        .bodyDiv {
            background-color:transparent;
            box-shadow:none;            
        }
        .mission .comment li {
            margin-left:0;
        }
        .missionright-file-type .selectlist {
            margin-top:5px;
            margin-left:-8px;
            width:21% !important;

        }
        .morebtn .selectlist li {
            padding-left:15px;
        }
        .missionright-file-type .shituu {
            position:static !important;
        }
        .missionright-body3 {
            padding-bottom:20px;
        }
        .mission-right {
            padding-bottom:20px;
        }
        .task .miss-header,.megti .miss-header {
                min-height: 50px;
        }
        .task,.megti {
            border:1px solid #dedede;
            border-top:3px solid #b0adab;
            border-radius:4px;
        }
        .task-item {
            width:50%;
            float:left;
            padding:10px;
            box-sizing:border-box;
            position:relative;
        }
        .task-foot {
            border-top:1px solid #dedede;
            height:40px;
            line-height:40px;
            text-align:center;
            color:#108af9;
            cursor:pointer;
        }
        .task a,.megti a {
            color:#108af9;
            
        }
        .task-item-body {
            line-height:20px;
            color:#333;
            font-size:14px;
        }
        .task-item-btn {
            width:18px !important;
            height:18px !important;
            padding:0 !important;
            border:1px solid #dedede;
            border-radius:4px;
            cursor:pointer;
            position:absolute;
            right:10px;
            top:15px;
            background:url('/img/cal/20.png') no-repeat center;
            background-size:12px;
        }
        .task .selectlist,.megti .selectlist {
            min-width:100px;
            margin-top:22px;
        }
        .task .selectlist li,.megti .selectlist li{
            padding-left:15px;
            color:#108af9;
        }
        .task-item-head {
            width:90%;
        }
        .related-item-body li>div {
            width: 117px;
        }
        .related-item-body .miss-bianji {
            right:auto;
            margin-top:8px;
        }
        .summary {
            padding:20px;
        }
        .missionmession {
            height:auto;
        }
        
    </style>
    <style>
    </style>
    <link href="/css/workshift.css" rel="stylesheet" type="text/css" />
    <link href="/css/chatter.css" rel="stylesheet" type="text/css" />
    <link href="/css/file.css" rel="stylesheet"/>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.fileDownload.js"></script>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <script src="/jslibrary/sfdc/EmployeePicker.js"></script>
    <script>    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'WorkShift';</script>

    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <script src="/js/entityDetail.js" type="text/javascript"></script>
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/header.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />

    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
   <script type="text/javascript">
        function loadNew() {
            if (!commonUtils.isBrowserSupported()) {
                window.location = "/apps/meetings/mtgView.aspx?t=025&id=" + getQueryString("id");
            }
        }
        //loadNew();
    </script>
    
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif eventTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
     <input id="UserId" type="hidden" value="<%=Supermore.WebContext.UserId%>" name="UserId" /> 
     
    <div id="contentWrapper" style="vertical-align: middle">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                <tr>
                    <td class="oRight" id="bodyCell">
                       
                        <div class="miss-header">
                            <div class="header-left-logo">
                                <img src="/template/hearder/logo.png">
                            </div>
                            <div class="header-left-title2">
                                <p class="header-left-title-name">会议管理</p>
                            </div>
        
                            <div class="header-right-buttonbtn">

                                <div class="buttonbtn releasebtn">
                                    <div>发布</div>
                                </div>

                                <div class="buttonbtn finishbtn">
                                    <div>标记结束</div>
                                </div>
                                <div class="buttonbtn megtixing">
                                    <div>提醒</div>
                                </div>
                                <div class="buttonbtn-group">
                                    <div class="buttonbtn megedit">编辑</div>
                                    <div class="buttonbtn mtg-delete">删除</div>
                                    <div class="buttonbtn mtg-status">更改状态</div>
                                </div>
                                <div class="buttonbtn-group">
                                    <div class="buttonbtn addpeople">
                                        <div>邀请参会者</div>
                                    </div>
                                    <div class="buttonbtn " id="btnInviteMeetingItem" >
                                        <div>邀请填写议题</div>
                                    </div>
                                    <div class="buttonbtn selectbuttonbtn morebtn">
                                        <div class="selectlist" style="display: none;">
                                            <ul>
                                                <li class="megitem">添加议题</li>
                                                <li class="megcal">添加任务</li>
                                                <li class="mask">备注</li>
                                                <li class="people-in">签到二维码</li>
                                                <li class="people-out">签退二维码</li>
                                                <li class="printpeople1">打印 参会人员</li>
                                                <li class="printpeople2">打印 未参会人员</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="contract-message">
                            <ul class="contract-message-head">
                                <li>位置</li>
                                <li>开始时间</li>
                                <li>结束时间</li>
                                <li>状态</li>
                            </ul>
                            <ul>
                                <li>11</li>
                                <li>2019/9/1 0:00:00</li>
                                <li>2020/8/31 0:00:00</li>
                                <li>未开始</li>
                            </ul>
                        </div>

                        <div class="mission">
                            <div class="mission-left">
                                <div class="missionleft-head">
                                    <ul>
                                        <li class="first active">会议纪要</li>
                                        <li>议题</li>
                                        <li>详细信息</li>
                                        <li>参会人员</li>
                                        <li>讨论</li>
                                        <li>任务</li>
                                        <li>相关</li>
                                       <%-- <li>投票</li>--%>
                                    </ul>
                                </div>
                                <div class="missionleft-body">
                                    <div class="zhenwen active">
                                        <div class="header-right-buttonbtn">
                                                <div class="buttonbtn summaryedit">
                                                    <div>编辑</div>
                                                </div>
                                              <%--  <div class="buttonbtn">
                                                    <div>导出</div>
                                                </div>--%>
                                            </div>
                                        <div class="clear"></div>
                                        <div class="summary">
                                            <div id="tinymce" class="mce-content-body "></div>
                                        </div>
                                    </div>
                                    <div class="megti">
                                        <div class="miss-header" style="background-color:white;min-width:0;margin:0;padding:10px;">
                                            <div class="header-left-logo">
                                                <img src="/template/hearder/logo.png">
                                            </div>
                                            <div class="header-left-title2">
                                                <p class="header-left-title-name">任务<span>(1)</span></p>
                                            </div>
        
                                            <div class="header-right-buttonbtn">
                                                <div class="buttonbtn megitem">
                                                    <div>新建</div>
                                                </div>
                                              <%--  <div class="buttonbtn">
                                                    <div>导出</div>
                                                </div>--%>

                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="task-body">
                                            
                                            <div class="clear"></div>

                                        </div>
                                        <div class="task-foot">
                                            查看全部
                                        </div>
                                       
                                    
                                    </div>
                                    <div class="xiangxinmession ">
                                        <div class="missionmession">
                                            <div class="missionmession-head">
                                                <span>会议信息</span>

                                            </div>
                                            <div class="missionmession-body">
                                                <div>
                                                    <p class="name"><span>合同名称</span></p>
                                                    <p class="main">
                                                        <span class="Name"></span>
                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />

                                                </div>
                                                <div class="div-margin">
                                                    <p class="name"><span>开始时间</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="line-height: 30px" class="ScheduledStart"></span>
                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div>
                                                    <p class="name"><span>地点</span></p>
                                                    <p class="main"><span style="line-height: 30px;"class="Location"></span></p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div class="div-margin">
                                                    <p class="name"><span>结束时间</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="line-height: 30px" class="ScheduledEnd"></span>
                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div>
                                                    <p class="name"><span>会议室</span></p>
                                                    <p class="main"><span style="line-height: 30px;"class="RoomId"></span></p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div class="div-margin">
                                                    <p class="name"><span>类型</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="line-height: 30px" class="MeetingType"></span>
                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div>
                                                    <p class="name"><span>状态</span></p>
                                                    <p class="main"><span style="line-height: 30px;"class="StatusCode"></span></p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div class="div-margin">
                                                    <p class="name"><span>科室</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="line-height: 30px" class="OwningBusinessUnit"></span>
                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div>
                                                    <p class="name"><span>会议内容</span></p>
                                                    <p class="main"><span style="line-height: 30px;"class="MeetingContent"></span></p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                            <div class="clear" style="height:0;width:0;"></div>

                                            </div>

                                        </div>
                                        <div class="">
                                            <div class="missionmession-head">
                                                <span>人员信息</span>
                                            </div>
                                            <div class="missionmession-body">
                                                <div>
                                                    <p class="name user"><span>召集人</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="margin-left: 20px" class="blue OwningUser"></span>

                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div class="rightdiv">
                                                    <p class="name user"><span>主持人</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="margin-left: 20px"class="blue HostName"></span>
                                                    </p>
                                                </div>
                                                <div>
                                                    <p class="name"><span>会议纪要填写人</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="margin-left: 20px" class="blue MeetingMgrId"></span>

                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div class="rightdiv">
                                                    <p class="name user"><span>联系人</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="margin-left: 20px"class="blue ContactUser"></span>
                                                    </p>
                                                </div>
                                                <div class="clear"style="height:0;width:0;"></div>
                                            </div>
                                        </div>
                                        <div class="systemmession">
                                            <div class="missionmession-head">
                                                <span>系统信息</span>
                                            </div>
                                            <div class="missionmession-body systemmession-body">
                                                <div>
                                                    <p class="name user"><span>创建人</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="line-height: 30px;" class="blue CreatedBy">张丽萍</span>
                                                        <span style="margin-left: 20px" class="CreatedOn"></span>

                                                    </p>
                                                    <img src="/img/cal/12.edit_1(14x14).png" />
                                                </div>
                                                <div class="rightdiv">
                                                    <p class="name user"><span>上次修改人</span></p>
                                                    <p class="main" style="margin-left: 10px">
                                                        <span style="line-height: 30px;" class="blue ModifiedBy"></span>
                                                        <span style="margin-left: 20px" class="ModifiedOn"></span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auditing-form">
                                        <div class="">
                                       <div style="" class="search-cont header-right-buttonbtn">
                                            <div class="search-group" 
                                                name="name" 
                                                type="text" 
                                                text="姓名">
                                            </div>
                                           <div class="search-group" 
                                                name="status"
                                                type="select">
                                                <div class="search-name">接受状态:</div>
                                                <div class="search-select selectinput">
                                                    <span >全部</span>
                                                    <img src="/img/cal/20.png" alt="" />
                                                </div>
                                                <div class="selectlist selectlistcheck">
                                                    <ul>
                                                        <li search='-1'><img src="/img/cal/23.check_2(16x16).png" /><span>全部</span></li>
                                                        <li search="0"><img src="/img/cal/23.check_2(16x16).png" /><span>未接受</span></li>
                                                        <li search="1"><img src="/img/cal/23.check_2(16x16).png" /><span>已接受</span></li>
                                                        <li search="2"><img src="/img/cal/23.check_2(16x16).png" /><span>拒绝</span></li>
                                                    </ul>
                                               </div>
                                            </div>
                                           <div class="search-group" 
                                                name="checkinStatus"
                                                type="select">
                                                <div class="search-name">签到状态:</div>
                                                <div class="search-select selectinput">
                                                    <span >全部</span>
                                                    <img src="/img/cal/20.png" alt="" />
                                                </div>
                                                <div class="selectlist selectlistcheck">
                                                    <ul>
                                                        <li search='-1'><img src="/img/cal/23.check_2(16x16).png" /><span>全部</span></li>
                                                        <li search="1"><img src="/img/cal/23.check_2(16x16).png" /><span>未签到</span></li>
                                                        <li search="2"><img src="/img/cal/23.check_2(16x16).png" /><span>已签到</span></li>
                                                     </ul>
                                               </div>
                                            </div>
                                           <div class="search-group search-groupposition" 
                                                name="deptIds" 
                                                type="search" 
                                                text="部门" 
                                                data-object="10">
                                            </div>
                                           <div class="buttonbtn-group">
                                                <div class="buttonbtn searchpeople">搜索</div>
                                            </div>
                                           <div class="buttonbtn-group addplays addpeople">
                                                <div class="buttonbtn">邀请参与人</div>
                                            </div>
                                           <div class="buttonbtn-group">
                                                <div class="buttonbtn" onclick="exportPeopleExcel()">导出</div>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                     
                                        <div class="people-body">
                                            <div id="peopleContainer" style="min-height:300px;"></div>
                                        </div>
                                    </div>

                                    </div>
                                    <div class="comment" style="position:relative;">
                                        
<%--                                        <div class="search-group commentsearch" 
                                                name="name" 
                                                type="text" 
                                                text="搜索">
                                        </div>--%>
                                        <div style="margin-top: -10px; height: 66px;" id="writecomment" class="writecomment"><div class="textarea" style="height: 44px; width: 80%;"><textarea style="height: 30px; width: 90%;"></textarea></div><p id="comment-btn"  style="display: block;">评论</p></div>

                                        <ul>
                                            
                                        </ul>

                                    </div>
                                    <div class="task">
                                        <div class="miss-header" style="background-color:white;min-width:0;margin:0;padding:10px;">
                                            <div class="header-left-logo">
                                                <img src="/template/hearder/logo.png">
                                            </div>
                                            <div class="header-left-title2">
                                                <p class="header-left-title-name">任务<span>(1)</span></p>
                                            </div>
        
                                            <div class="header-right-buttonbtn">
                                                <div class="buttonbtn megcal">
                                                    <div>新建</div>
                                                </div>
                                               <%-- <div class="buttonbtn">
                                                    <div>导出</div>
                                                </div>--%>

                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="task-body">
                                            <div class="task-item">
                                                <div class="task-item-head">
                                                    <span><a href="#">发布医院优秀员工评选</a></span>
                                                </div>
                                                <div class="buttonbtn selectbuttonbtn task-item-btn">
                                                    <div class="selectlist" style="display: block;">
                                                        <ul>
                                                            <li class="task-edit megcal">编辑</li>
                                                            <li class="task-delete">删除</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="task-item-body">
                                                    <div><span>执行人:</span><span>张丽萍</span></div>
                                                    <div><span>实际时间:</span><span>2019-6-14 09:00</span></div>
                                                    <div><span>实际时间:</span><span>2019-6-14 09:00</span></div>
                                                </div>
                                            </div>
                                            <div class="task-item">
                                                <div class="task-item-head">
                                                    <span><a href="#">发布医院优秀员工评选</a></span>
                                                </div>
                                                <div class="task-item-btn">

                                                </div>
                                                <div class="task-item-body">
                                                    <div><span>执行人:</span><span>张丽萍</span></div>
                                                    <div><span>实际时间:</span><span>2019-6-14 09:00</span></div>
                                                    <div><span>实际时间:</span><span>2019-6-14 09:00</span></div>
                                                </div>
                                            </div>
                                            <div class="clear"></div>

                                        </div>
                                        <div class="task-foot">
                                            查看全部
                                        </div>
                                       
                                    
                                    </div>
                                <div class="related">

                                </div>
                            </div>
                            </div>

                            <div class="mission-right">
                                <div class="missionright-body missionright-body3">
                                    <div class="missionright-head">
                                        <p></p>
                                        <span>附件</span>
                                        <span>(0)</span>
                                        <span class="morefile" id="btnUploadfile">上传文件</span>
                                    </div>
                                    <div class="missionright-file-type">
                                        <div class="file-type-title">分类排序</div>
                                        <div class="buttonbtn shituu selectbuttonbtn">
                                            <span>全部</span>
                                            <img src="/img/cal/20.PNG" class="img2">
                                            <div class="selectlist selectlistcheck">
                                                <ul>
                                                    <li class="rellist">全部</li>
                                                    <li class="newfileclass rellist">新建分类</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="buttonbtn shuaxin"></div>
                                    </div>
                                    <ul class="norellist">
                                    </ul>
                                    <div class="upfile">
                                        <p>查看全部</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script src="/js/cal/mission2.js"></script>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="file-preview" style="display: none;">
        <div class="file-preview-mask"></div>
        <div class="file-preview-head">
            <div class="file-preview-head-left">
                <div class="file-preview-type">
                    <img src="http://localhost:65371/img/filetype/Image.png">
                </div>
                <div class="file-preview-name">
                    <span>00.2.Close_关闭</span>
                </div>
            </div>
            <div class="file-preview-head-middle">
                <div class="file-preview-download" src="/apps/files/fileDownload.aspx?isAttach=1&amp;id=dbb471fc-aaba-47e8-80e1-b8bad71d7c4a">
                    <img src="/img/cal/679 (2).png" style="width: 18px; height: 18px;">
                    <span>下载</span>
                </div>
                <div class="file-preview-edit" src="" style="display: none;">
                    <img src="/img/cal/679 (1).png" style="width: 18px; height: 18px;">
                    <span>编辑</span>
                </div>
                <div class="file-preview-share">
                    <img src="/img/cal/679.png" style="width: 18px; height: 18px;">
                    <span>分享</span>
                </div>
            </div>
            <div class="file-preview-head-right">
                <img src="/img/cal/4.closeIcon(24x24).png" style="width: 20px; height: 20px;">
            </div>
        </div>
        <div class="edit-head">
            <div class="edit-btn" style="display: none;">
                <button>选择模板</button>
                <button>应用模板</button>
                <button>电子盖章</button>
                <button>刷新</button>
                <button>重新载入</button>
                <button>打印</button>
                <button>另存为本地</button>
                <button>文字批注</button>
                <button>保存</button>
            </div>
            <div class="miss-bianji miss-bianji5">
                <div>劳务合同</div>
                <div>劳务派遣</div>
                <div>人事代理</div>
                <div>技术合作合同</div>
            </div>
        </div>
        <iframe src="" onload="shareIframeImg(this)" style="height: 89%;"></iframe>
    </div>
    <div id="changeDiv">
        <iframe src=""id="iframe"></iframe>
    </div>
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>

    <script>
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2])); return null;
        }
    </script>
    <script>
        var metid = getQueryString('id')
        $('.missionleft-head li').eq(3).click(function () {
            $('#peopleContainer').datagrid('resize')
        })
        $('.missionleft-head li').eq(5).click(function () {
            $('#taskContainer').datagrid('resize')
        })
        getpeople()

        function getpeople(search) {
            var url = "/apps/CommandProcessor.ashx?cmd=meeting.people.search&Meetingid=" + metid
            if(search){
                url += search
            }
            $('#peopleContainer').datagrid({
                columns: [[
                    {
                        field: 'Action', title: '操作', formatter: function (value, row, inde) {
                            var html = '<a style="color:#015ba7;font-size:13px;" onclick=remarksdept("' + row["Id"] + '"' + ',"8")>备注</a>'

                            html += '<a style="color:#015ba7;font-size:13px;margin-left:5px;" onclick=deletedept("' + row["Id"] + '"' + ',"8")>删除</a>'
                            return html
                        }
                    },
                    { field: 'OwningUserName', title: '姓名', },
                    { field: 'BusinessUnitIdName', title: '部门', },
                    { field: 'Checkin', title: '签到时间', },
                    { field: 'CheckinLocation', title: '签到地址', },
                    { field: 'Checkout', title: '签退时间', },
                    { field: 'StatusInfo', title: '接受状态', },
                    { field: 'CheckinInfo', title: '签到状态', },
                    { field: 'Description', title: '原因', }
                ]],
                fitCloumns: true,
                idField: "LIST_RECORD_ID",
                singleSelect: false,
                checkOnSelect: true,
                method: 'POST',
                pagination: true,
                rownumbers: true,
                url: url,
                striped: false,
                // 隔行变色特性s
                pageSize: 10,
                pageList: [10, 15, 20, 25, 30, 50, 100],
                queryParams: {
                    message: window.messages
                }
            })
        }
        
        function exportPeopleExcel() {

            metid = getQueryString('id')
            var url = '/apps/CommandProcessor.ashx?c=1&cmd=meeting.people.export';
            url += "&Meetingid=" + metid
            var search = []
            for (var i = 0; i < seachdata.length; i++) {
                var item = seachdata[i]
                var name = Object.keys(item)[0]
                search.push('&' + name + '=' + item[name])
            }
            search = search.join('')
            if (search) {
                url += search
            }

            $.fileDownload(url, {
                httpMethod: 'post',
                //data: getQueryParams(),
                successCallback: function (html, url) {
                    alert("下载成功！");

                },
                failCallback: function (html, url) {
                    alert("下载失败！");
                }
            });
        }
        //删除
        $('.mtg-delete').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src','/alert/delete.html').show()
        })
        //邀请参会者
        $('.addpeople').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/addpeople.html').show()
        })
        $('#btnInviteMeetingItem').click(function () {
            var metid = getQueryString('id');
            var retURL = window.location;            
            retURL = encodeURIComponent(retURL);
            window.location = "/ui/meeting/item/invitee?id=" + metid + "&retURL=" + retURL;
        })
        
        function addplays(id) {
            var metid = getQueryString('id')

            var d = {
                invitee: id,
                Meetingid: metid
            }
            ajaxMethodPostData('meeting.people.invite', d, function (data) {
                $('#changeDiv').hide()
                $('#iframe').hide()
                success('邀请参会人成功')
                $('#peopleContainer').datagrid('reload')
            });
        }
        //人员查询searchcont
        $('.searchpeople').click(function () {
            var that = this
            searchcont(that)
            console.log(seachdata)
            var search = []
            for (var i = 0; i < seachdata.length; i++) {
                var item = seachdata[i]
                var name = Object.keys(item)[0]
                search.push('&' + name + '=' + item[name])
            }
            search = search.join('')
            getpeople(search)
        })

        
        //发布
        $('.releasebtn').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/item_release.html').show()
        })

        //标记结束
        $('.finishbtn').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/item_finish.html').show()
        })
        //提醒
        $('.megtixing').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_tixing.html').show()
        })
        //备注
        $('.mask').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/remarks.html?parentId=' + metid + '&objTypeCode='+5000).show()
        })
        //编辑会议
        $('.megedit').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meeting.html?msgid=' + metid).show()
        })
        //新建议题
        $('.megitem').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingitem.html').show()
        })
        function megitem(id) {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingitem.html?id='+id).show()
        }
        //新建任务
        $('.megcal').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingcal.html').show()
        })
        function megcal(id) {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingcal.html?id='+id).show()
        }
        //打印人员
        $('.printpeople1').click(function () {
            //参加
            window.open('/apps/meetings/printMeetingPeoplelst.aspx?status=2' + '&id=' + metid, "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes")
        })
        $('.printpeople2').click(function () {
            //未参加
            window.open('/apps/meetings/printMeetingPeoplelst.aspx?status=1' + '&id=' + metid, "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes")
        })
        //签到
        $('.people-in').click(function () {
            //签到
            window.open('/00V/p?' + 'id=' + metid, "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes")
        })
        $('.people-out').click(function () {
            window.open('/00V/p?exitQcode=1' + '&id=' + metid, "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes")
        })
        //人员删除
        function deletedept(id) {
            $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&objTypeCode=5002');
            $('#changeDiv').show();
            $('#iframe').show();
        }
        function itemdelete(id,objTypeCode) {
            $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&objTypeCode=' + objTypeCode);
            $('#changeDiv').show();
            $('#iframe').show();
        }
        $('.task-delete').click(function () {
            $('#iframe').attr('src', '/alert/delete.html?id=');
            $('#changeDiv').show();
            $('#iframe').show();
        })
        //获取详情
        var mtgview = {}
        getdata()
        var CreatedUserId
        var MeetingMgrId
        function getdata() {
            var d = {
                id: metid,
                ObjTypeCode: 5000
            }
            ajaxMethodPostData('entity.detail.get', d, callback)
            function callback(data){
                console.log(data)
                mtgview = data.record
                var Name = mtgview.Name
                var Location = mtgview.Location
                var ScheduledStart = mtgview.ScheduledStart
                var ScheduledEnd = mtgview.ScheduledEnd
                var StatusCode = mtgview.StatusCode
                var MeetingType = mtgview.MeetingType
                var MeetingContent = mtgview.MeetingContent
                var ModifiedOn = mtgview.ModifiedOn
                var CreatedOn = mtgview.CreatedOn
                var RoomIdName = mtgview.RoomId.Name
                var OwningBusinessUnitName = mtgview.OwningBusinessUnit.Name
                var HostName = mtgview.HostName.Name
                var ContactUserName = mtgview.ContactUser.Name
                var MeetingMgrIdName = mtgview.MeetingMgrId.Name
                var ModifiedByName = mtgview.ModifiedBy.Name
                var CreatedBy = mtgview.CreatedBy.Name
                var OwningUser = mtgview.OwningUser.Name

                CreatedUserId = mtgview.CreatedBy.Id

                if (StatusCode == '0') {
                    StatusCode = '草稿'
                    //$('#finishbtn').html('标记发布').css('opacity', '1').off();
                    //$('#releasebtn').css('opacity', '1').off()
                } else if (StatusCode == '1') {
                    StatusCode = '已发布'
                    //$('#finishbtn').html('标记发布').css('opacity', '1').off();
                    //$('#releasebtn').css('opacity', '1').off()
                } else if (StatusCode == '2') {
                    StatusCode = '已完成'
                    $('.finishbtn').html('已结束').removeClass('finishbtn').css('opacity', '0.5').off();
                    $('.releasebtn').removeClass('releasebtn').css('opacity', '0.5').off()

                }
                else if (StatusCode == '3') {
                    StatusCode = '已取消'
                }
                if (MeetingType == '0') {
                    MeetingType = '例会'
                    console.log(111)
                } else if (StatusCode == '1') {
                    MeetingType = '学术会议'
                }
                $('.header-left-title-name').eq(0).html(Name)
                $('.contract-message ul').eq(1).find('li').eq(0).html(Location)
                $('.contract-message ul').eq(1).find('li').eq(1).html(ScheduledStart)
                $('.contract-message ul').eq(1).find('li').eq(2).html(ScheduledEnd)
                $('.contract-message ul').eq(1).find('li').eq(3).html(StatusCode)
                $('.Name').html(Name)
                $('.ScheduledStart').html(ScheduledStart)
                $('.ScheduledEnd').html(ScheduledEnd)
                $('.Location').html(Location)
                $('.RoomIdName').html(RoomIdName)
                $('.MeetingType').html(MeetingType)
                $('.StatusCode').html(StatusCode)
                $('.OwningBusinessUnit').html(OwningBusinessUnitName)
                $('.HostName').html(HostName)
                $('.MeetingContent').html(MeetingContent)
                $('.ContactUser').html(ContactUserName)
                $('.MeetingMgrId').html(MeetingMgrIdName)
                $('.ModifiedOn').html(ModifiedOn)
                $('.CreatedOn').html(CreatedOn)
                $('.CreatedBy').html(CreatedBy)
                $('.RoomId').html(RoomIdName)
                $('.OwningUser').html(OwningUser)

                //不是创建人,隐藏编辑和删除 相关按钮
                var UserId = $('#UserId').val();
                if (UserId != CreatedUserId) {
                    $('.mtg-delete').hide();
                    $('.megedit').hide();

                    $('.releasebtn').hide();
                    $('.finishbtn').hide();
                    $('.megtixing').hide();

                    $('.mtg-status').hide();
                    $('.addpeople').hide();
                    $('#btnInviteMeetingItem').hide();

                    $('.megitem').hide();
                    $('.megcal').hide();
                    $('.mask').hide();

                    $('#btnUploadfile').hide();

                    $('.selectlist').hide();
                    $('.megti-delete').hide();
                    
                    $('td[field="Action"]').hide();
                    $('.miss-bianji').hide();
                    $('.selectbuttonbtn').hide();
                    
                }

                MeetingMgrId = mtgview.MeetingMgrId.Id
                //会议纪要 summaryedit  MeetingMgrId.Id
                if (UserId != CreatedUserId && UserId != MeetingMgrId) {
                    $('.summaryedit').hide();
                }

            }
        }
        //获取记要
        getsummary()
        function getsummary() {
            var d = {
                Meetingid: metid
            }
            ajaxMethodPostData('meeting.summary.get', d, function (data) {
                $('#tinymce').html(data.data)
            })
        }
        
        //获取议题
        getitem()
        function getitem() {
            var d = {
                Meetingid: metid
            }
            ajaxMethodPostData('meeting.item.search', d, callback)
            function callback(data) {
                $('.megti .task-body .task-item').remove()
                console.log(data)
                var data = data.listData
                $('.megti .header-left-title-name').html('议题(' + data.length + ')')
                for (var i = 0; i < data.length; i++) {
                    var res = data[i]
                    var Description = res.Description
                    var OwningBusinessUnitName = res.OwningBusinessUnitName
                    var ExeResult = res.ExeResult
                    var id = res.MeetingItemId
                    $('.megti .task-body .clear').before('<div class="task-item">'
                                                + '<div class="task-item-head">'
                                                    + '<span><a href="#">' + Description + '</a></span>'
                                                + '</div>'
                                                + '<div class="buttonbtn selectbuttonbtn task-item-btn">'
                                                    + '<div class="selectlist" style="display: none;">'
                                                       + '<ul>'
                                                            + '<li class="megti-edit megti"onclick=megitem("' + id + '")>编辑</li>'
                                                            + '<li class="megti-delete" onclick=itemdelete("' + id + '","5001")>删除</li>'
                                                        + '</ul>'
                                                    + '</div>'
                                                + '</div>'
                                                + '<div class="task-item-body">'
                                                    + '<div><span>执行部门:</span><span>' + OwningBusinessUnitName + '</span></div>'
                                                    + '<div><span>执行结果:</span><span>'+ExeResult+'</span></div>'
                                                + '</div>'
                                            + '</div>')
                }
                selectbuttonbtn()
                
            }
        }
        $('.newfileclass').click(function () {
            $('.selectlist').hide()
            $('#iframe').attr('src', '/alert/cntrt/new_fileclass.html');
            $('#changeDiv').show();
            $('#iframe').show();
            return false
        })
        //获取任务
        gettask()
        function gettask() {
            var d = {
                Meetingid: metid
            }
            ajaxMethodPostData('meeting.task.search', d, callback)
            function callback(data) {
                $('.task .task-body .task-item').remove()
                console.log(data)
                var data = data.rows
                $('.task .header-left-title-name').html('任务(' + data.length + ')')
                for (var i = 0; i < data.length; i++) {
                    var res = data[i]
                    var Subject = res.Subject
                    var OwningBusinessUnitName = res.OwningBusinessUnitName
                    var ScheduledStart = res.ScheduledStart
                    var ScheduledEnd = res.ScheduledEnd
                    var id = res.ActivityId
                    var Location = res.Location
                    if (Subject == '') {
                        Subject = '任务'
                    }
                    $('.task .task-body .clear').before('<div class="task-item">'   
                                                + '<div class="task-item-head">'
                                                    + '<span><a href="#">' + Subject + '</a></span>'
                                                + '</div>'
                                                + '<div class="buttonbtn selectbuttonbtn task-item-btn">'
                                                    + '<div class="selectlist" style="display: none;">'
                                                       + '<ul>'
                                                            + '<li class="megti-edit megti"onclick=megcal("' + id + '")>编辑</li>'
                                                            + '<li class="megti-delete" onclick=itemdelete("' + id + '","4200")>删除</li>'
                                                        + '</ul>'
                                                    + '</div>'




                  + '</div>'
                                                + '<div class="task-item-body">'
                                                    + '<div><span>地点:</span><span>' + Location + '</span></div>'
                                                    + '<div><span>开始时间:</span><span>' + ScheduledStart + '</span></div>'
                                                    + '<div><span>截止时间:</span><span>' + ScheduledEnd + '</span></div>'
                                                + '</div>'
                                            + '</div>')
                }
                selectbuttonbtn()

            }
        }
        //数据刷新
        function deletenewdata(objTypeCode){
            if(objTypeCode==5001){
                getitem()
            } else if (objTypeCode == 4200) {
                gettask()
            } else if (objTypeCode == 5002) {
                getpeople()
            }
        }
        //记要编辑
        $('.summaryedit').click(function () {
            $('#iframe').attr('src', '/alert/editsummart.html');
            $('#changeDiv').show();
            $('#iframe').show();
        })
        //更改状态
        $('.mtg-status').click(function () {
            $('#iframe').attr('src', '/alert/status_edit.html?');
            $('#changeDiv').show();
            $('#iframe').show();
        })

        
        
    </script>
    <script src="/js/getchatter.js"></script>

    <script >

        btnHide();
        function btnHide() {
            //不是创建人,隐藏编辑和删除 相关按钮
            var UserId = $('#UserId').val();
            if (UserId != CreatedUserId) {
                $('.mtg-delete').hide();
                $('.megedit').hide();

                $('.releasebtn').hide();
                $('.finishbtn').hide();
                $('.megtixing').hide();

                $('.mtg-status').hide();
                $('.addpeople').hide();
                $('#btnInviteMeetingItem').hide();

                $('.megitem').hide();
                $('.megcal').hide();
                $('.mask').hide();

                $('#btnUploadfile').hide();

                $('.selectlist').hide();
                $('.megti-delete').hide();

                $('td[field="Action"]').hide();
                $('.miss-bianji').hide();
                $('.selectbuttonbtn').hide();
                $('.miss-bianji2').hide();
                $('.sanjiao').hide();

            }

            //会议纪要 summaryedit  MeetingMgrId.Id
            if (UserId != CreatedUserId && UserId != MeetingMgrId) {
                $('.summaryedit').hide();
            }
        }
    </script>
</body>
</html>
