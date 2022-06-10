<%@ Page Language="C#" AutoEventWireup="true"  %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <meta name=renderer  content=webkit>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=640,minimum-scale=0.5,maximum-scale=1.0,user-scalable=no, initial-scale=1.0" />
    <script>var obj = { ObjectTypeCode: 100201 }</script>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>内容 - 内容详细 ~ 知识管理 - 高效协同</title>
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
    <link href="/wangEditor/wangEditor.css" rel="stylesheet" />
    
    <link href="/css/form.css" rel="stylesheet" />
    <link href="/css/setform.css" rel="stylesheet" />

    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        .recurrenceFrequency {
            margin: 0;
        }
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
            min-height:10px !important;
        }
        .missionleft-head li {
            margin-left:20px;
        }
        .people {
            padding:10px;
            margin:0;
        }
        .search-cont {
            margin-bottom:10px;
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
        .morebtn {
            background:none !important;
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
            background-size:12px;
        }
        .task-item-btn img{
            width: 12px;
            height: 12px;
            position: absolute;
            left: 2px;
            top: 2px;
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
        .commentsearch {
            float:none;
            height:50px;
        }
        .commentsearch .search-input{
            width:300px;
        }
        .mission .comment li {
            border-bottom:0;
        }
        .mission .comment .name {
            float:none;
        }
        .old-fl .selectlist{
            min-width: 100px;
            margin-top: 22px;
        }
        .old-fl .selectlist li{
            padding-left: 15px;
            color: #108af9;
        }
        body #iframe,#editcontent{
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: none;
            height:620px;
            border:0;
        }
        .popup-mask {
            position:fixed;
            background: url(/img/bgOverlayDialogBackground.png) \9;
            background-color: transparent \9;
        }
        .buttonbtn.shuaxin {
            background:none;
            
        }
        .buttonbtn.shuaxin img{
            position:absolute;
            margin-top:7px;
            margin-left:-7px;
        }
        .buttonbtn.shituu.selectbuttonbtn>span>.deletefileclass{
            display:none;
        }
        /*.fileclass-head{
            display:none;
        }*/
        /*.missionright-file-type{
            display:none;
        }*/
        .missionright-body li{
            padding: 8px 0 8px 0;
            color: #999;
            padding-left:10px;
            padding-right:10px;
        }
        .missionright-body3 ul li .name {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: pointer;
            color: #015ba7;
            margin-bottom: 2px;
        }

        .mission .comment1 li .miaoshu{
            color: #999 !important;
        }
        .missionright-body3 ul li{
            height:auto;
            display: inline-block;
            width:95%;
            width: -webkit-fill-available;
        }
        .norellist li{
            height:auto;
            min-height:38px;
        }
        .missionright-body3 ul li:hover{
            background:#f3f2f2;
        }
        .missionright-body .div1 .name span {
            color: #333 !important;
            white-space: normal;
            display: inline-block;
            word-break: break-all;
            color: #108af9;
            cursor: pointer;
            font-size: 14px;
        }
        .missionright-body3 ul li a,.missionright-body3 ul li .name{
            color: #108af9;
            cursor: pointer;
            font-size: 14px;
        }
        .missionright-body3 ul li .div1{
            margin-top:0;
            font-size: 14px;
        }
        .missionright-head p{
            margin-right: 8px;
        }
        .missionright-head .filehead,#filecount{
            font-size:14px;
        }
    </style>
    <link href="/css/workshift.css" rel="stylesheet" type="text/css" />
    <link href="/css/file.css" rel="stylesheet"/>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>

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
    <script src="/js/polyfill.js" type="text/javascript"></script>
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        function loadNew()
        {
            if (!commonUtils.isBrowserSupported() || commonUtils.IS_IE8 || commonUtils.IS_IE7)
            {
                var id = getQueryString("id");
                window.location="/apps/scontent/NewsView.aspx?t=090&id="+id;
            }
        }
        //loadNew();
    </script>    
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif eventTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
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
                                <img src="/img/images/message.png">
                            </div>
                            <div class="header-left-title2">
                                <p class="header-left-title-name">会议管理</p>
                            </div>
        
                            <div class="header-right-buttonbtn">
                                <%--<div class="buttonbtn finishbtn">
                                    <div>标记结束</div>
                                </div>--%>
                                <div class="buttonbtn megfabu" id="fabu">
                                    <div>发布</div>
                                </div>
                                <div class="buttonbtn preview">
                                    <div>预览</div>
                                </div>
                                <div class="buttonbtn megtixing">
                                    <div>提醒</div>
                                </div>

                                <div class="buttonbtn-group">
                                    <div class="buttonbtn megedit">编辑</div>
                                    <div class="buttonbtn mtg-delete">删除</div>
                                    <div class="buttonbtn changestatus">更改状态</div>
                                </div>
                                <div class="buttonbtn-group">
                                    <div class="buttonbtn addpeople">
                                        <div>邀请查看者</div>
                                    </div>
                                    <div class="buttonbtn addallpeople">
                                        <div>邀请所有人</div>
                                    </div>
                                    <div class="buttonbtn selectbuttonbtn morebtn">
                                        <img src="/img/cal/20.png" style="width:14px;height:14px;position:absolute;margin-top:7px;margin-left:-7px;" alt="" />
                                        <div class="selectlist" style="display: none;">
                                            <ul>
                                                <li class="mask">备注</li>
                                                <li class="addclass">添加分类</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="clear"></div>

                        </div>
                        <div class="contract-message">
                            <ul class="contract-message-head">
                                <li>栏目</li>
                                <li>类型</li>
                                <li>关键字</li>
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
                                        <li class="first active">内容</li>
                                        <li>详细信息</li>
                                        <li>人员</li>
                                        <li>评论</li>
                                        <li>隶属栏目</li>
                                        <li>相关</li>
                                    </ul>
                                </div>
                                <div class="missionleft-body">
                                    <div class="zhenwen active">
                                        <div class="header-right-buttonbtn">
                                                <div class="buttonbtn summaryedit">
                                                    <div>编辑</div>
                                                </div>
                                            </div>
                                        <div class="clear"></div>
                                        <div class="summary">
                                            <div id="tinymce" class="mce-content-body "></div>
                                        </div>
                                    </div>
                                    <div id="layoutview" class=""></div>
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
                                                <div class="search-name">状态:</div>
                                                <div class="search-select selectinput">
                                                    <span >全部</span>
                                                    <img src="/img/cal/20.png" alt="" />
                                                </div>
                                                <div class="selectlist selectlistcheck">
                                                    <ul>
                                                        <li search='' class="active"><img src="/img/cal/23.check_2(16x16).png" /><span>全部</span></li>
                                                        <li search='1'><img src="/img/cal/23.check_2(16x16).png" /><span>已阅读</span></li>
                                                        <li search="0"><img src="/img/cal/23.check_2(16x16).png" /><span>未阅读</span></li>
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
                                                <div class="buttonbtn" onclick="peopleexport()">导出</div>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                     
                                        <div class="people-body">
                                            <div id="peopleContainer" style="min-height:300px;"></div>
                                        </div>
                                    </div>

                                    </div>
                                    <div class="comment">
                                       <li style="margin-top: -10px; height: 66px;" class="writecomment">
                                          <div class="textarea" style="height: 44px; width: 80%;">
                                          <textarea style="height: 30px; width: 90%;"></textarea>
                                          </div>      
                                          <p id="comment-btn" style="display: block;">评论</p>                                                                                                
                                       </li>
                                        <div class="search-group commentsearch" 
                                                name="name" 
                                                type="text" 
                                                text="搜索">
                                        </div>
                                        <ul>
                                            <li class="comment-main">
                                                <div class="deleteup">
                                                    <div class="deleteup-delete">
                                                         <span>删除</span>
                                                         <span class="border"></span>
                                                    </div>
                                                    <div class="deleteup-up"> 
                                                         <span>123</span>
                                                         <img src="/img/cal/18.赞(18x18)_1.png\" />     
                                                   </div>
                                                </div>
                                                <p class="name">人员1</p>
                                                <p class="jieshao">123123</p>
                                                <p class="miaoshu">信息中心<span></span>&nbsp;&nbsp;&nbsp;
                                                    <span>2019-12-26</span>
                                                </p>
                                            </li>
                                        </ul>

                                    </div>
                                    <div class="old-fl">
                                        <div class="miss-header" style="background-color:white;min-width:0;margin:0;padding:10px;">
                                            <div class="header-left-logo">
                                                <img src="/template/hearder/logo.png">
                                            </div>
                                            <div class="header-left-title2">
                                                <p class="header-left-title-name">隶属分类(<span id="categoryListNum">0</span>)</p>
                                            </div>
        
                                            <div class="header-right-buttonbtn">
                                                <div class="buttonbtn addclass">
                                                    <div>新建</div>
                                                </div>

                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="task-body">
                                            <div class="task-item">
                                                <div class="task-item-head">
                                                    <span><a href="#"></a></span>
                                                </div>
                                                <div class="buttonbtn selectbuttonbtn task-item-btn">
                                                    <div class="selectlist" style="display: none;">
                                                        <ul>
                                                            <li class="megti-delete" onclick="">删除</li>
                                                        </ul></div></div><div class="task-item-body">
                                                            <div><span>分类:</span><span></span></div><div>
                                                                <span>创建人:</span><span></span></div><div>
                                                                    <span>创建时间:</span><span></span></div></div></div>
                                        </div>
                                    </div>
                                    <div id="layout_related"></div>

                            </div>
                                <script src="/layouteditor/layout_view.js"></script>
                                <link href="/layouteditor/layout_main.css" rel="stylesheet" />
                            </div>

                            <div class="mission-right">
                                <div class="missionright-body missionright-body3">
                                    <div class="missionright-head">
                                        <p></p>
                                        <span class="filehead">附件</span>
                                        <span id="filecount">(0)</span>
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
                                        <div class="buttonbtn shuaxin">
                                            <img src="/img/cal/refresh.png" style="width:15px;height:15px;"/>

                                        </div>
                                    </div>
                                    <ul class="norellist">
                                    </ul>
                                    <div class="upfile">
                                        <p>查看全部</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script src="/js/entityDetail.js"></script>
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
                    <img src="/img/filetype/Image.png">
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
        <iframe src=""  onload="shareIframeImg(this)" style="height: 89%;"></iframe>
    </div>
    <div id="editcontent">
        <div class=""style="display: block;"><div class="popup-exit close"></div><div class="popup-head">编辑记要</div><div class="modal-header"></div><div class="popup-body "><form method="post"><div id="editor"style="height:380px;"></div></form></div><div class="popup-foot"><div class="popup-foot-shur save-checking">确定</div><div class="close">取消</div></div></div>
    </div>
    <iframe src=""id="iframe"></iframe>
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>
    <script src="/js/alert.js"></script>
    <script src="/wangEditor/wangEditor2.min.js"></script>
<script>
        var E = window.wangEditor
        var editor = new wangEditor('editor')
        editor.create()
        getsummary()
        checkcanpublish();
        function checkcanpublish()
        {
            var d = {
                contentId: getQueryString('id')
            }
            ajaxMethodGetData2('content.detail.canpublish.check', d, function (data) {
                data = JSON.parse(data);
                console.log(data);
                if (data.status == "1")
                {
                    if (data.canPublish == false)
                    {
                        $('.megfabu').hide()
                    }
                    else if (data.canPublish == true) {
                        $('.megfabu').show()
                    }
                    else {
                        $('.megfabu').hide()
                    }
                }
            })
        }
        function getsummary() {
            var d = {
                id: getQueryString('id')
            }
            ajaxMethodGetData2('content.body.get', d, function (data) {
                $('#editor').html(data)
            })
        }
        var id = getQueryString('id')
        var objTypeCode = getQueryString('objTypeCode')

        $('#editcontent .close').click(function () {
            $('.popup-mask').hide()
            $('#iframe').hide()
            $('#editcontent').hide()
        })

        $('#editcontent .save-checking').click(function () {
            var html = $('#editor').html()
            var d = {
                contentId: getQueryString('id'),
                contentBody: html
            }
            ajaxMethodPostData('content.body.post', d, function (data) {
                success2('保存内容成功')
                $('#tinymce').html(html)
                getsummary()
                $('.popup-mask').hide()
                $('#editcontent').hide()

            })
        })
    </script>

    <script>
        /*$(document).ready(function () {
            var objectTypeCode = getQueryString('objectTypeCode');
            if (objectTypeCode == "100202")
            {
                document.getElementById("fabu").style.display = "none";
            }
        })*/
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2])); return null;
        }
    </script>

    <script>
        var metid = getQueryString('id')
        $('.missionleft-head li').eq(2).click(function () {
            $('#peopleContainer').datagrid('resize')
        })
        getpeople()
        function getpeople(search) {
            var url = "/apps/CommandProcessor.ashx?cmd=content.reader.search&contentid=" + metid
            if (search != '') {
                url+=search
            }
            $('#peopleContainer').datagrid({
                columns: [[
                    {
                        field: 'Action', title: '操作', formatter: function (value, row, inde) {
                            var html = '<a style="color:#015ba7;font-size:13px;margin-left:5px;" onclick=deletedept("' + row["ValueId"] + '"' + ',"8")>删除</a>'
                            return html
                        }
                    },
                    { field: 'BusinessUnitIdName', title: '部门', sortable: true },
                    { field: 'ReaderIdName', title: '姓名', sortable: true },
                    { field: 'StateCodeName', title: '已阅读', sortable: true },
                    { field: 'ModifiedOn', title: '阅读时间', sortable: true },
                    { field: 'IPAddr', title: 'IP', sortable: true },
                    { field: 'BrowserName', title: '浏览器', sortable: true },
                    { field: 'ReadTimes', title: '阅读次数', sortable: true },
                    { field: 'CreatedOn', title: '邀请时间', sortable: true }
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
        //人员查询searchcont
        $('.searchpeople').click(function () {
            var that =this
            searchcont(that)
            //console.log(seachdata)
            var search = []
            for (var i = 0; i < seachdata.length; i++) {
                var item = seachdata[i]
                var name = Object.keys(item)[0]
                search.push('&' + name + '=' + item[name])
            }
            search = search.join('')
            getpeople(search)
        })

        //删除
        $('.mtg-delete').click(function () {
            var id = getQueryString('id')
            $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=100201').show().height(280).css('margin-top', '-140px')
            $('.popup-mask').show()
        })
        //邀请参会者
        $('.addpeople').click(function () {
            opencenterwindow('/_ui/common/data/invite_UserLookResult.html', '', 1150, 600)

        })
        function invitepeople(ids) {
            ids = ids.join(',')
            var metid = getQueryString('id')
            var d = {
                userIds: ids,
                contentid: metid
            }
            ajaxMethodPostData('content.reader.invite', d, function (data) {
                //console.log(data)
                $('#changeDiv').hide()
                $('#iframe').hide()
                success(data.msg)
                getpeople()
            });
            
        }
        //标记结束
        $('.finishbtn').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/item_finish.html').show()
        })
        //提醒
        $('.megtixing').click(function () {
            var id = getQueryString('id')
            var objectTypeCode=getQueryString("objectTypeCode");
            $('.popup-mask').show()
            $('#iframe').attr('src', '/alert/add_tixing_ie8.html?id=' + metid + "&objectTypeCode=" + objectTypeCode).show().height(520).css('margin-top', '-260px')
        })
        //备注
        $('.mask').click(function () {
            $('.popup-mask').show()
            $('#iframe').attr('src', '/alert/remarks_ie8.html?parentId=' + metid + '&objTypeCode=' + 5000).show().height(620).css('margin-top', '-300px')
        })
        //编辑
        $('.megedit').click(function () {
            var t = $('#t').val()
            var objtypecode = $('#objectTypeCode').val()
            window.location.href = '/' + t + '/e?retURL=%2F' + t + '%2Fdetail?id=' + metid + '%26objectTypeCode=' + objtypecode + '&id=' + metid;
        })
        //更改状态
        $('.changestatus').click(function () {
            $('.popup-mask').show()
            $('#iframe').attr('src', '/alert/changestatus_ie8.html').show().height(480).css('margin-top', '-250px');
        })
        //新建议题
        $('.megitem').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingitem.html').show()
        })
        function newdata() { }
        function megitem(id) {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingitem.html?id=' + id).show()
        }
        //新建任务
        $('.megcal').click(function () {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingcal.html').show()
        })
        function megcal(id) {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/meeting/add_meetingcal.html?id=' + id).show()
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
            
            $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=20023').height(280).css('margin-top', '-140px')
            $('.popup-mask').show();
            $('#iframe').show();
        }
        function itemdelete(id, objTypeCode) {
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
        function getdata() {
            var d = {
                id: metid,
                ObjTypeCode:100201
            }
            ajaxMethodPostData('entity.detail.get', d, callback)
            function callback(data) {
                //console.log(data)
                mtgview = data.record
                var Title = mtgview.Title
                var FolderId = mtgview.FolderId.Name
                var StateCode = mtgview.StateCode
                var ContentTypeCode = mtgview.ContentTypeCode
                var KeyWords = mtgview.KeyWords
                var IsPublic = mtgview.IsPublic
                var IsImportant = mtgview.IsImportant
                var IsTop = mtgview.IsTop == '1' ? '是' : '否';
                var EndTopDate = mtgview.EndTopDate
                var StatusCode = mtgview.StatusCode
                var BusinessUnitId = mtgview.BusinessUnitId.Name
                var ReadDetectionFlag = mtgview.ReadDetectionFlag
                var ApprovedBy = mtgview.ApprovedBy
                var ApprovedOn = mtgview.ApprovedOn
                var OrganizationId = mtgview.OrganizationId.Name
                var ReadCount = mtgview.ReadCount
                var CommentCount = mtgview.CommentCount
                var DislikeQty = mtgview.DislikeQty
                //var LikeCount = mtgview.LikeCount
                var CoverDisplay = mtgview.CoverDisplay
                var AttachRightCode = mtgview.AttachRightCode
                var CreatedBy = mtgview.CreatedBy.Name
                var ModifiedBy = mtgview.ModifiedBy.Name
                var CreatedOn = mtgview.CreatedOn
                var ModifiedOn = mtgview.ModifiedOn
                if (StateCode == '0') {
                    StateCode = '草稿'
                } else if (StateCode == '1') {
                    StateCode = '审批通过'
                } else if (StateCode == '2') {
                    StateCode = '审批不通过'
                }
                $('.header-left-title-name').eq(0).html(Title)
                $('.contract-message ul').eq(1).find('li').eq(1).html(FolderId)
                $('.contract-message ul').eq(1).find('li').eq(3).html(ContentTypeCode)
                $('.contract-message ul').eq(1).find('li').eq(0).html(KeyWords)
                $('.contract-message ul').eq(1).find('li').eq(2).html(StateCode)
                $('.Title').html(Title)
                $('.FolderId').html(FolderId)
                $('.StateCode').html(StateCode)
                $('.ContentTypeCode').html(ContentTypeCode)
                $('.ModifiedOn').html(ModifiedOn)
                $('.CreatedOn').html(CreatedOn)
                $('.ModifiedBy').html(ModifiedBy)
                $('.CreatedBy').html(CreatedBy)
                $('.AttachRightCode').html(AttachRightCode)
                $('.CoverDisplay').html(CoverDisplay)
                //$('.LikeCount').html(LikeCount)
                $('.DislikeQty').html(DislikeQty)
                $('.CommentCount').html(CommentCount)
                $('.ReadCount').html(ReadCount)
                $('.OrganizationId').html(OrganizationId)
                $('.ApprovedOn').html(ApprovedOn)
                $('.ApprovedBy').html(ApprovedBy)
                $('.BusinessUnitId').html(BusinessUnitId)
                $('.EndTopDate').html(EndTopDate)
                $('.IsTop').html(IsTop)
                $('.IsImportant').html(IsImportant)
                $('.StatusCode').html(StatusCode)
                $('.IsPublic').html(IsPublic)
                $('.KeyWords').html(KeyWords)
            }
        }
        //获取内容
        getsummary()
        function getsummary() {
            var d = {
                id: metid
            }
            ajaxMethodGetData2('content.body.get', d, function (data) {
                $('#tinymce').html(data)
            })
        }
        $('.newfileclass').click(function () {
            $('.selectlist').hide()
            $('#iframe').attr('src', '/alert/file/new_fileclass.html');
            $('#changeDiv').show();
            $('#iframe').show();
            return false
        })
        //获取评论

        getcomment('')
        function getcomment(search) {

            var d = {
                contentId: getQueryString('id'),
                kw: search
            }
            ajaxMethodGetData('content.comment.search',d, function (data) {
                //console.log(data)
                $('.comment ul li').remove()
                
                for (var i = 0; i < data.rows.length; i++) {
                    var row = data.rows[i]
                    $('.comment ul').append('<li IsLike = "' + row.IsLike + '"class="comment-main" commentid="' +row.CommentId + '">'
                                                +'<div class="deleteup">'
                                                    +'<div class="deleteup-delete">'
                                                         +'<span>删除</span>'
                                                         +'<span class="border"></span>'
                                                    +'</div>'
                                                    +'<div class="deleteup-up"> '
                                                         + '<span>' + row.Likecount + '</span>'
                                                         +'<img src="/img/cal/18.赞(18x18)_1.png\">  '   
                                                   +'</div>'
                                                +'</div>'
                                                + '<p class="name">' + row.CreatedBy + '</p>'
                                                + '<p class="jieshao">' + row.Comment + '</p>'
                                                +'<p class="miaoshu"><span></span>'
                                                   + '<span>' + row.CreatedOn + '</span>'
                                                +'</p>'
                                            +'</li>')

                }
                deletecomment()
                commentlike()
            })
        }
        //评论搜索
        $('.commentsearch').keyup(function (event) {
            if (event.keyCode == "13") {
                var search = $(this).find('input').val()
                getcomment(search)
            }
        })
        //添加评论
        $('#comment-btn').click(function () {
            var comment = $('.writecomment textarea').val()
            var d = {
                contentId: getQueryString('id'),
                comment: comment,
                objectTypeCode:100201
            }
            if (comment.length > 0) {
                ajaxMethodGetData('content.comment.post', d, function (data) {
                    $('.writecomment textarea').val('')
                    success('评论成功')
                    getcomment()
                })
            }
        })
        //删除评论
        function deletecomment() {
            $('.deleteup-delete').click(function () {
                var id = $(this).parents('li').attr('CommentId')

                var d = {
                    id:id
                }
                ajaxMethodGetData2('chatter.delete', d, function (data) {
                    //console.log(data)
                    var msg = data.split('msg":"')[1]
                    var msg = msg.split('"')[0]
                    success(msg)
                    getcomment()
                })
            })
        }
        //点赞
        function commentlike() {
            $('.deleteup-up').click(function () {
                var id = $(this).parents('li').attr('CommentId')
                var IsLike = $(this).parents('li').attr('IsLike')
                if (IsLike == '0') {
                    var  likeType = 1
                } else {
                    var likeType = 0
                }
                var d = {
                    chatterId: id,
                    likeType: likeType,
                    objectTypeCode: 100201
                }
                ajaxMethodGetData('content.like.post', d, function (data) {
                    success(data.msg)
                    getcomment()
                })
            })
        }
        //数据刷新
        function deletenewdata(objTypeCode) {
            if (objTypeCode == 20023) {
                getpeople('')
            }else if(objTypeCode==100210){
                getclass()
            }
        }

        //内容编辑
        $('.summaryedit').click(function () {
            $('#editcontent').show().height(610).css('margin-top', '-320px');
            $('.popup-mask').show()
        })
        //发布
        $('.megfabu').click(function () {
            $('#iframe').attr('src', '/alert/content/publish_ie8.html?id=' + metid).show().height(480).css('margin-top', '-240px');
            $('.popup-mask').show()
        })
        //预览
        $('.preview').click(function () {
            window.open('/portal/viewArticle.aspx?id=' + metid)
        })
        //添加分类
        $('.addclass').click(function () {
            $('#iframe').attr('src', '/alert/add_class_ie8.html?').height(480).css('margin-top', '-250px');;
            $('.popup-mask').show();
            $('#iframe').show();
        })
        //获取分类
        getclass()
        function getclass() {
            var d = {
                contentId: metid
            }
            ajaxMethodGetData('content.category.list', d, function (data) {
                $('.old-fl .task-body .task-item').remove()
                $('#categoryListNum').html(data.data.length);
                for (var i = 0; i < data.data.length; i++) {
                    var res = data.data[i]
                    $('.old-fl .task-body').append('<div class="task-item">'
                                               +'<div class="task-item-head">'
                                                   +'<span><a href="#"></a></span>'
                                               +'</div>'
                                               + '<div class="buttonbtn selectbuttonbtn task-item-btn">'
                                               + '<img src="/img/cal/20.png">'
                                                   +'<div class="selectlist" style="display: none;">'
                                                       +'<ul>'
                                                           +'<li class="megti-delete" id ="'+res.ValueId+'">删除</li>'
                                                       +'</ul></div></div><div class="task-item-body">'
                                                           +'<div><span>分类:</span><span>'+res.CategoryName+'</span></div><div>'
                                                               +'<span>创建人:</span><span>'+res.CreatedBy+'</span></div><div>'
                                                                   +'<span>创建时间:</span><span>'+res.CreatedOn+'</span></div></div></div>')
                }
                $('.selectbuttonbtn').click(function(){
                    $('.selectlist').hide()
                    $(this).find('.selectlist').show()
                    return false
                })
                //分类删除
                $('.old-fl .megti-delete').click(function(){
                    var id = $(this).attr('id')
                    $('.selectlist').hide()
                    $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=100210').height(280).css('margin-top', '-140px');
                    $('.popup-mask').show()
                    $('#iframe').show();
                    return false
                })
            })
        }
        function peopleexport() {
            openWindowWithPost('/apps/CommandProcessor.ashx?cmd=content.reader.export', {
                id: getQueryString('id'),
                ObjectTypeCode: getQueryString('objectTypeCode')
            })
        }
    </script>
    <div class="popup-mask"></div>
</body>
</html>
