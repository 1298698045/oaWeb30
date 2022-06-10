<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>短信发送明细 - 短信管理 ~  - 协同办公系统</title>
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
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/css/chatter.css" rel="stylesheet" type="text/css" />
    <link href="/css/form.css" rel="stylesheet" />



    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        .missionleft-head li {
            margin-left: 20px;
        }

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
            border-bottom: 0 !important;
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

        .mission-header {
            background-color: #fafafa;
            margin-top: 0;
            padding-top: 20px;
            box-sizing: border-box;
            height: 145px;
            border-radius: 4px;
        }

        .mission-header-leftlogo div {
            top: 20px;
        }

        .head-bottbo {
            margin-top: 0px;
            border-bottom: 0;
            background-color: transparent;
            border: 0;
            height: 15px;
        }

        .mission {
            margin-top: 0px;
            background-color: transparent;
        }

        #bodyCell, .bodyDiv {
            background-color: transparent !important;
            box-shadow: none;
        }

        .mission-mi {
            background-color: transparent;
        }

        .contract-message {
            height: 70px;
            margin-top: 10px;
            overflow: hidden;
            background-color: white;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
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

        .popup-mask {
            left: -10px;
            width: 110%;
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

            .edit-btn button {
                border: 0;
                width: 9%;
                min-width: 70px;
                height: 32px;
                line-height: 32px;
                background: none;
                background-color: #dddddd;
                border-radius: 4px;
                outline: none;
                font-size: 12px;
                margin-right: 1.5%;
                cursor: pointer;
            }

                .edit-btn button:hover {
                    background-color: #108af9;
                    color: #fff;
                }

                .edit-btn button:last-child {
                    margin-right: 0px;
                }

        .miss-bianji5 {
            display: none;
            top: 110px;
            left: 280px;
            z-index: 600;
            width: 160px;
            height: 200px;
            color: #333;
        }

            .miss-bianji5 div {
                color: #333;
            }

        .popup-mask {
            position: fixed;
        }

        .popup {
            position: fixed;
        }

        .popup-foot > div {
            width: 65px;
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

        .popup-foot .add {
            float: left;
            margin-left: 20px;
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

        #popup-contpay .save-again {
            width: 130px !important;
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

        #popup-liuyanchange .popup-body {
            height: 250px;
            padding: 20px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .popup {
            padding: 0;
        }

        #popup-sortchange {
            padding: 0;
            width: 50%;
        }

            #popup-sortchange .popup-body {
                height: 300px;
                padding: 20px;
                box-sizing: border-box;
                font-size: 14px;
                background-color: white;
            }

            #popup-sortchange .body-main {
                margin-top: 5px;
                height: 30px;
                line-height: 30px;
                border: 1px solid #dcdcdc;
                border-radius: 4px;
                font-size: 14px;
                color: #333;
                text-indent: 10px;
                background: url(/img/cal/20.PNG) no-repeat right 10px center;
                background-size: 14px;
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
        }

        .missionleft-body .related {
            height: auto;
        }

        #popup-liuyanchange input {
            height: 25px;
            border: 1px solid #ececec;
            width: 90%;
            margin-left: 15px;
            border-radius: 4px;
        }

        #popup-liuyanchange {
            width: 50%;
        }

            #popup-liuyanchange textarea {
                width: 90%;
                height: 100px;
                margin-top: 20px;
                margin-left: 20px;
            }

            #popup-liuyanchange .popup-body span {
                float: left;
                margin-top: 20px;
            }

            #popup-liuyanchange .check {
                width: 14px;
                margin-top: 5px;
                position: relative;
                top: 7px;
            }

        .missionmession-body .main {
            line-height: 30px;
        }

        .mission-left {
            border-radius: 4px;
        }

        .mission-right {
            border-radius: 4px;
        }

        .mission-header2 {
            border-radius: 4px;
            margin-top: 10px;
        }

        #bodyCell {
            background: #71b2c6;
        }

        body {
            padding-bottom: 20px;
            height: auto;
        }

        .related-item-head {
            padding-bottom: 5px;
        }

        .related-item-body li div {
            width: 117px;
        }

        .mission-right {
            height: auto !important;
        }

        .related .miss-bianji2 {
            right: 25px;
        }

        .mission-left {
            position: relative;
        }

        .related .sanjiao {
            float: right;
            margin-right: 10px;
        }

        .mission-header-leftlogo {
            width: auto !important;
            max-width: 70%;
        }

            .mission-header-leftlogo p {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

        .head-btn {
            height: 32px;
            line-height: 32px;
            color: #108af9;
            border: 1px solid #dedede;
            padding: 0 15px;
            margin-right: 10px;
            border-radius: 4px;
        }

            .head-btn:hover {
                background-color: #f4f2f2 !important;
            }

        .missionleft-body > div {
            height: auto;
        }

        .mission-header2 .bianji {
            border: 1px solid #dedede;
        }

        .mission-header2 .mission-header-right > div p {
            border: 1px solid #dedede;
            border-right: 0;
        }

        .mission-header2 .mission-header-right .select {
            border: 1px solid #dedede;
        }

        .mission-header2 .select img {
            left: 6px;
            top: 10px;
        }

        .mission-header2 .end {
            border: 1px solid #dedede;
        }

        .popup-mask {
            background: url(/img/bgOverlayDialogBackground.png) \9;
            background-color: transparent \9;
        }

        .buttonbtn.shuaxin {
            background: none;
        }

            .buttonbtn.shuaxin img {
                position: absolute;
                margin-top: 7px;
                margin-left: -7px;
            }

        .missionleft-head ul {
            border-bottom: 1px solid #dedede;
        }

        #iframe {
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: none;
            height: 620px;
            border: 0;
        }
    </style>
    <style>
    </style>
    <link href="/css/workshift.css" rel="stylesheet" type="text/css" />
    <link href="/css/file.css" rel="stylesheet" />

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <!--<script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>-->
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <!--<script src="/jslibrary/sfdc/ManyWhoActivity.js"></script>-->
    <script src="/jslibrary/sfdc/EmployeePicker.js"></script>
    <script>    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'WorkShift';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/Calendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1458071680000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1458071680000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <script src="/js/entityDetail.js" type="text/javascript"></script>
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/header.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif eventTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <div class="delete-mask"></div>
    <div class="popup-mask"></div>
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
                        <div class="genggai-div2">
                            <div class="popup-show">编辑留言</div>
                        </div>
                        <div class="mission-header mission-header2">
                            <div class="mission-header-leftlogo">
                                <p class="logo">
                                    <img src="/img/images/message.png" alt="" />
                                </p>
                                <div>短信发送详细</div>
                                <p id="Subject"></p>
                            </div>
                            <div class="mission-header-right"><!--
                                <div class="end popup-show">
                                    <img src="/img/cal/23.check_2(12x12).png" />
                                    <span>提交审批</span>
                                </div>     -->                         
                            </div>
                            <div class="clear"></div>
                            <div class="contract-message">
                                <ul class="contract-message-head">
                                    <li>合同编号</li>
                                    <li>创建人</li>
                                    <li>合同开始时间</li>
                                    <li>合同结束时间</li>
                                    <li>合同期限</li>
                                    <li>合同状态</li>
                                </ul>
                                <ul>
                                    <li>2018564-004</li>
                                    <li class="blue">张丽萍</li>
                                    <li>2019-7-4</li>
                                    <li>2020-7-4</li>
                                    <li>1</li>
                                    <li>执行中</li>
                                </ul>
                            </div>
                        </div>
                        <div class="head-bottbo"></div>

                        <div class="mission">
                            <div class="mission-left">
                                <div class="missionleft-head">
                                    <ul>
                                        <li class="first active">发送列表</li>
                                        <li class="">详细信息</li>
                                    </ul>
                                </div>
                                <div class="missionleft-body">
                                    <div id="oasmslogdetail" class="active">
                                        <div id="datagrid"></div>
                                    </div>
                                    <div id="layoutview"></div>
                                </div>
                            </div>
                            <div class="mission-mi">
                            </div>

                        </div>
                        <script src="/js/cal/mission2.js"></script>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <iframe frameborder="0" src="" id="iframe"></iframe>
    <script>
        var obj = {
            ObjectTypeCode: 20026
        }
        $('#datagrid').height($(window).height() - 395)
        $(".file-preview-edit").click(function () {
            $(".edit-btn").show()
            $(this).parents(".file-preview").find("iframe").prop("src", $(this).attr("EditLinkUrl"))
            $(this).parents(".file-preview").find("iframe").height("82%")
        })
        $(".edit-btn button").eq(0).click(function () {
            var that = this
            $(".miss-bianji5").show()
            $(".miss-bianji5 div").each(function () {
                $(this).click(function () {
                    $(that).html($(this).html())
                    $(".miss-bianji5").hide()
                })
            })
        })
        var columnsArray = []
        columnsArray.push({
                field: 'name',
                title: '姓名',
                sortable: true
        })
        
        columnsArray.push({
            field: 'mobile',
            title: '手机号码',
            sortable: true
        })
        columnsArray.push({
            field: 'message',
            title: '短信内容',
            sortable: true
        })
        var id = getQueryString('id')
        $('#datagrid').datagrid({
            columns: [columnsArray],
            fitCloumns: true,
            idField: "LIST_RECORD_ID",
            singleSelect: false,
            checkOnSelect: true,
            method: 'POST',
            pagination: true,
            rownumbers: true,
            url: '/apps/CommandProcessor.ashx?cmd=oa.sms.log.detail',
            striped: false,
            pageSize: 15,
            pageList: [10, 15, 20, 25, 30, 50, 100],
            queryParams: {
                id:id
            },
            onLoadSuccess: function () {
                $('#datagrid').datagrid('resize')
            }
        });
    </script>
    <script type="text/javascript">
        
     
        $(".mission-mi").height($(".mission-left").outerHeight())
        $(".mission-right").height($(".mission-left").outerHeight())

        $(".missionleft-head li").click(function () {
            $(".mission-mi").height($(".mission-left").outerHeight())
            $(".mission-right").height($(".mission-left").outerHeight())
        })
        $('.popup-foot div').not('.add').click(function () {
            $('.popup-mask').hide()
            $('.popup').hide()
        })
        $('.selectlistcheck li').not('.newfileclass').click(function () {
            $(this).parents('.selectbuttonbtn').find('span').html($(this).html())
        })
        $('.newfileclass').click(function () {
            $('.selectlist').hide()
            $('#iframe').attr('src', '/alert/cntrt/new_fileclass.html');
            $('#changeDiv').show();
            $('#iframe').show();
            return false
        })
        $('.add-contractdetail').click(function () {
            var pid = getQueryString('id')
            var pname = $('.logo').next().next().html()
            $('.selectlist').hide()
            $('#iframe').attr('src', '/alert/cntrt/new_ContractDetail_ie8.html?pid=' + pid + '&pname=' + pname);
            $('.popup-mask').show()
            $('#iframe').show();
        })
        $('.head-btn').eq(0).click(function () {
            var pid = getQueryString('id')
            var pname = $('.logo').next().next().html()
            $('#iframe').attr('src', '/alert/cntrt/contractend_ie8.html?pid=' + pid + '&pname=' + pname).height(620).css('margin-top', '-300px');
            $('#iframe').show();
            $('.popup-mask').show()
            //$('#changeDiv').show();
        })
        $('.head-btn').eq(1).click(function () {
            var pid = getQueryString('id')
            var pname = $('.logo').next().next().html()
            $('#iframe').attr('src', '/alert/cntrt/contractrenew_ie8.html?pid=' + pid + '&pname=' + pname).height(620).css('margin-top', '-300px');;
            $('#iframe').show();
            $('.popup-mask').show()
        })
        $('.head-btn').eq(2).click(function () {
            var pid = getQueryString('id')
            var pname = $('.logo').next().next().html()
            $('#iframe').attr('src', '/alert/cntrt/changeOwningUser.html?').height(480).css('margin-top', '-250px');
            $('#iframe').show();
            $('.popup-mask').show()
        })
        var metid = getQueryString('id')
        $('#frmWfForm').load(function () {
            var height = $('#frmWfForm').contents().find("body").height();
            $('#frmWfForm').height(height + 20)
        })
        $('.missionleft-head li').eq(1).click(function () {
            var height = $('#frmWfForm').contents().find("body").height();

            $('#frmWfForm').height(height + 20)
        })
        $('#zhenwen').load(function () {
            var height = $('#zhenwen').contents().find("body").height() + 20;
            $('#zhenwen').height(height)
        })
        $(document).ready(function () {
            var height = $('#zhenwen').contents().find("body").height() + 20;
            $('#zhenwen').height(height)
        })
        $('.mission-header-right .select').click(function () {
            $('.genggai-div2').show()
            return false
        })
        $(document).click(function () {
            $('.genggai-div2').hide()
        })
    </script>
    <script src="/template/js/indexjs.js"></script>
    <script src="/js/getchatter.js"></script>
    <script src="/layouteditor/layout_view.js"></script>
    <script src="/js/alert.js"></script>
    <link href="/layouteditor/layout_main.css" rel="stylesheet" />
    <script>
        $('.bianji').off()
        $('.bianji').click(function () {
            $('.popup-mask').show();
            $('#iframe').show();
            $('#iframe').attr('src', '/layouteditor/add_layout_ie8.html?entityName=Contract&id=' + getQueryString('id') + '&objectTypeCode=1010').height(620).css('margin-top', '-310px')
        })
        $('.shanchu').off()
        $('.shanchu').click(function () {
            $('.popup-mask').show()
            $('.delete-shur').show()
        })
        $('.popup-exit').click(function () {
            $('.popup-mask').hide()
            $('.delete-shur').hide()
        })
        $('.delete-shur-foot div').eq(1).click(function () {
            $('.popup-mask').hide()
            $('.delete-shur').hide()
        })

    </script>
</body>
</html>
