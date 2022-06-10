<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>消息设置 - 个人设置  - 流程管理</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/css/mission-header.css">
    <link rel="stylesheet" href="/css/cal/mission.css">
    <link rel="stylesheet" href="/css/cntrt/cntrt.css">
    <link rel="stylesheet" href="/css/cal/newmission.css">
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/SelectionSearchPage.css" rel="stylesheet" type="text/css" />
    <link href="/css/extended.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .recurrenceFrequency {
            margin: 0;
        }
        .query:hover {
            background-color:#f2f2f2;
        }
        #gridContainer {
            width: calc(100% - 239px);
            margin-top: -13px;
        }

        div.panel-header {
            margin-top: -1px;
            background: #F2F2F2 !important;
        }

        .pagination table {
            float: right!important;
        }

        .pagination td {
            vertical-align: middle;
        }

        .clear {
            clear: both;
        }

        #bodyCell {
            height: 1000px;
        }

        body {
            height: 100%;
            overflow: hidden;
        }

        #treePanel {
            padding-bottom: 20px!important;
        }

        .datagrid-header {
            background: #F2F2F2 !important;
        }

        a {
            text-decoration: none;
            transition: color .1s linear;
            cursor: pointer;
        }

            a:hover {
                text-decoration: none !important;
            }

        .objectManagerLeftNav {
            position: relative;
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

        .logo {
            background: none !important;
        }

            .logo img {
                height: 30px;
                width: 30px;
            }

        #bodyWrapper .newmissq a {
            color: #108af9;
        }

        #bodyWrapper .newmissq:hover {
            background-color: #f4f2f2;
        }

        .cont-status-check img {
            height: 15px;
            width: 15px;
            margin-left: 15px;
            cursor: pointer;
        }

        .cont-status-check {
            cursor: pointer;
        }

        .pulldown-menu-contstatus {
            padding-top: 10px;
            width: 380px;
            background-color: white;
            box-shadow: 0px 0px 10px 2px rgba(56, 56, 56, 0.2);
            border-radius: 4px;
            overflow: hidden;
            position: absolute;
            left: 70px;
            top: 75px;
            z-index: 10;
            color: #333;
            font-size: 14px;
            display: none;
        }

            .pulldown-menu-contstatus > div {
                margin-left: 20px;
            }

            .pulldown-menu-contstatus > li img {
                width: 14px;
                height: 14px;
                margin-right: 20px;
                visibility: hidden;
            }

            .pulldown-menu-contstatus > li.active img {
                visibility: visible;
            }

            .pulldown-menu-contstatus > li {
                padding-left: 20px;
                height: 42px;
                line-height: 42px;
                margin-top: 5px;
                cursor: pointer;
            }

                .pulldown-menu-contstatus > li:hover {
                    background-color: #f2f2f2;
                }

        .mission-header {
            overflow: visible;
        }

        #gridContainer {
            width: 100%;
        }

        .inputdate, #Button1 {
            border: 1px solid #e6e6e6 !important;
            border-radius: 4px;
            text-indent: 5px;
        }

        #Button1 {
            margin-right: 10px;
            width: 150px;
            height: 32px;
            cursor: pointer;
            text-align: left;
        }

        .sousuo-tishi {
            top: 45px;
            left: 570px;
        }

        .sousuo-tishi1 {
            top: 30px;
            left: 590px;
        }

        .StateCodename {
            float: left;
            margin-top: 8px;
            margin-right: 3px;
        }

        .select {
            display: none;
            position: absolute;
            left: 40px;
            top: 40px;
            background-color: white;
            border-radius: 7px;
            padding: 10px 0 10px 0;
            width: 150px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

            .select div {
                height: 30px;
                line-height: 30px !important;
                padding-left: 30px;
                margin-left: 0;
                cursor: pointer;
                position: relative;
            }

                .select div:hover {
                    background-color: #f5f5f5;
                }

        .mission-hearder-right > div {
            float: left;
        }

        .mission-hearder-right div select {
            width: auto;
            min-width: 50px;
            border-radius: 4px;
            margin-left: 0;
            float: none;
            margin-right: 5px;
        }

        .mission-hearder-right > p {
            margin-left: 5px;
            margin-top: 3px;
        }

        .sousuo input {
            line-height: 30px;
            height: 30px;
            text-indent: 5px;
            width: 100%;
        }

        .mission-hearder-right .query {
            cursor: pointer;
            width: auto;
            padding: 0 10px;
        }

        .mission-hearder-right .sousuo {
            width: 100px;
        }

        .bPageTitle {
            float: left;
            width: 20%;
        }

        #bodyWrapper {
            float: right;
            width: 80%;
        }

            #bodyWrapper::after {
                content: '';
                clear: both;
            }

        .mission-header1 {
            height: 50px;
        }

        #gridContainer {
            margin-top: 0;
        }

            #gridContainer > div {
                float: left;
            }

            #gridContainer div.panel:last-of-type {
                margin-left: 5px;
                margin-right: 5px;
            }

        .mission-header1 {
            border-bottom: 0;
            margin-top:0;
        }
    </style>

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <script>    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "auraDomain": "", "dateTimeFormat": "yyyy-MM-dd HH:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "timeFormat": "HH:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script type="text/javascript">
        function loadNew() {
            if (!commonUtils.isBrowserSupported()) {
                window.location = "/wfinstance/instlst.aspx?gridid=mydraftinstances&t=a0M";
            }
        }
        //loadNew();
    </script>
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <style>
        .objectManagerLeftNav > div {
            float: left;
        }
        .datagrid-row-selected {
            background: rgb(242, 242, 242);
            color: #fff;
        }
        .subNav-tab {
            margin-left:20px;
        }
        #content{
            margin:20px 50px;
            margin-top:10px;
            clear:both;
        }
        .item-left{
            float:left;
            width:100px;
        }
        .item-right{
            float:left;
            border-left:1px solid #dedede;
        }
        .content-item{
            overflow:hidden;
            height:30px;
            line-height:30px;
            border-bottom:1px solid #dedede;
        }
        .content-item:hover{
            background-color:#f2f2f2;
        }
        .item-right input{
            position:relative;
            top:2px;
            margin-right:5px;
            margin-left:20px;
        }
        .item-left{
            text-align:center;
        }
        .title-content{
            line-height:30px;
            margin-left:50px;
            font-size:14px;
            float:left;
            padding:0 10px;
            border-bottom:3px solid #108def;
            cursor:pointer;
        }
        .title-content:hover{
            background-color:#f2f2f2;
        }
        #content{
            overflow:auto;
        }
    </style>
    <script src="commentliblst.js"></script>

</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif eventTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <div id="contentWrapper" style="vertical-align: middle">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="subNav" style="width: 100%; height: 35px; background-color: #fff; margin: 0px; margin-top: 10px; border-bottom: 1px dotted #E9E9E9; line-height: 23px; font-size: 13px; margin-bottom: 5px;">
                <div style="width: 100%; height: 30px;">
                    <a id="wfcreatewizard" href="/wfinstance/instanceCreate.aspx?gridid=wfcreatewizard&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">新建流程</span>
                    </a>
                    <a id="wfrulelog" href="/wfinstance/wftasklst.aspx?gridid=wfrulelog&t=a0M" class="subNav-tab ">
                        <span style="display: inline-block; width: 75px;">待办事务(<span class="stat" id="waitingTaskQty" style="color: red;">0</span>)</span>
                    </a>
                    <a id="finishedwfrulelogs" href="/wfinstance/instlst.aspx?gridid=finishedwfrulelogs&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">已办事务</span>
                    </a>
                    <a id="mycreatewfinstances" href="/wfinstance/instlst.aspx?gridid=mycreatewfinstances&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 100px;">我的发起件(<span class="stat" id="instanceQty" style="color: blue;">0</span>)</span>
                    </a>
                    <a id="cancelledWfinstances" href="/wfinstance/cancellst.aspx?gridid=cancelledWfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">退件箱(<span class="stat" id="cancelledQty" style="color:red;">0</span>)</span>
                    </a>   
                    <a id="myreadwfinstances" href="/wfinstance/fowardReadLog.aspx?gridid=myreadwfinstances&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">收到传阅(<span class="stat" id="readQty" style="color: red;">0</span>)</span>
                    </a>
                    <a id="createdreadwfinstances" href="/wfinstance/instlst.aspx?gridid=createdreadwfinstances&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 100px;">我传阅的</span>
                    </a>
                    <a id="mydraftinstances" href="/wfinstance/draftlst.aspx?gridid=mydraftinstances&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;font-weight: bold;">草稿箱(<span class="stat" id="draftQty" style="color: red;">0</span>)</span>
                    </a>
                    <a id="mycomments" href="/wfinstance/commentliblst.aspx?gridid=mycomments&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">我的审批意见</span>
                    </a>
                    <a id="wordtemplates" href="/wfinstance/DocTemplates.aspx?gridid=wordtemplates&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px; ">正文模板</span>
                    </a>
                    <a id="personalSetup" href="/wfinstance/personalSetup.aspx?gridid=personalSetup&t=a0M" class="subNav-tab subNav-tab-active">
                        <span style="display:inline-block;width:75px;">个人设置</span>
                    </a><!--
                    <a id="instancestat" href="/wfinstance/instancestatlst.aspx?gridid=instancestat&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">流程统计</span>
                    </a>   
                    <a id="dashboard" href="/wfinstance/dashboard.aspx?t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">报表</span>
                    </a>-->
                </div>
            </div>
            <div class="title-content">消息提示设置</div>
            <div style="clear:both;"></div>
            <div id="content"></div>
        </div>
    </div>
    <script type="text/javascript">
        var editIndex = undefined;
        var editRow = undefined;
        var datagrid;
        var fromeditBtn = false;
        var index = 0
        $('#content').height($(window).height() - 250)
        $(function () {

            
            //$('.query').bind('click', LoadGridData);

        });


    
      
    </script>
     <script type="text/javascript">
         ajaxMethodGetData("process.personal.settings.getlist", null, function (data) {
             for (var item in data.userSettings) {
                 console.log(data.userSettings[item])
                 for (var i = 0; i < data.userSettings[item].length; i++) {
                     var Name = data.userSettings[item][i].Name
                     console.log(Name)
                     var ValueId = data.userSettings[item][i].ValueId
                     var MessageCode = data.userSettings[item][i].MessageCode
                     var MessageTemplateId = data.userSettings[item][i].MessageTemplateId
                     var DoEmail = 'nocheck'
                     if (data.userSettings[item][i].DoEmail == 1) {
                         DoEmail = 'checked'
                     }
                     var DoSms = 'nocheck'
                     if (data.userSettings[item][i].DoSms == 1) {
                         DoSms = 'checked'
                     }
                     var DoIm = 'nocheck'
                     if (data.userSettings[item][i].DoIm == 1) {
                         DoIm = 'checked'
                     }
                     var DoApp = 'nocheck'
                     if (data.userSettings[item][i].DoApp == 1) {
                         DoApp = 'checked'
                     }
                     var RegardingObjectTypeCode = data.userSettings[item][i].RegardingObjectTypeCode
                     $('#content').append('<div RegardingObjectTypeCode="' + RegardingObjectTypeCode + '" class="content-item" ValueId="' + ValueId + '"MessageCode="' + MessageCode + '"MessageTemplateId="' + MessageTemplateId + '"><div class="item-left">' + Name + '</div><div class="item-right">'
                         + '<label><input name="DoEmail" type="checkbox" ' + DoEmail + '="' + DoEmail + '"/>邮件消息</label>'
                         + '<label><input name="DoSms" checked="checked" type="checkbox" ' + DoSms + '="' + DoSms + '"/>短信消息</label>'
                         + '<label><input name="DoIm" type="checkbox" ' + DoIm + '="' + DoIm + '"/>IM消息</label>'
                         + '<label><input name="DoApp" type="checkbox" ' + DoApp + '="' + DoApp + '"/>APP消息</label>'
                         + '</div></div>')
                 }
             }
            
            $('#content input').change(function () {
                var ValueId = $(this).parents('.content-item').attr('valueid')
                var Name = $(this).parents('.content-item').find('.item-left').html()

                var DoEmail = $(this).parents('.content-item').find('[name="DoEmail"]::checked').length
                var DoSms = $(this).parents('.content-item').find('[name="DoSms"]::checked').length
                var DoIm = $(this).parents('.content-item').find('[name="DoIm"]::checked').length
                var DoApp = $(this).parents('.content-item').find('[name="DoApp"]::checked').length

                var MessageCode = $(this).parents('.content-item').attr('MessageCode')
                var MessageTemplateId = $(this).parents('.content-item').attr('MessageTemplateId')
                var RegardingObjectTypeCode = $(this).parents('.content-item').attr('RegardingObjectTypeCode')
                ajaxMethodGetData("process.personal.settings.update", {
                    Id: ValueId,
                    DoEmail: DoEmail,
                    DoSms: DoSms,
                    DoIm: DoIm,
                    DoApp: DoApp,
                    MessageCode: MessageCode,
                    MessageTemplateId: MessageTemplateId,
                    Name: Name,
                    ObjectTypeCode: RegardingObjectTypeCode
                }, function (data) {
                    if (data.status == 1) {
                        success2('保存成功')
                    } else {
                        error(data.message)
                    }
                })
            })
         });
     </script>
    <script src="/js/alert.js"></script>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
</body>
</html>
