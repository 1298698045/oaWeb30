<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>通讯录 - 协同办公系统 ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />

    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
    </style>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>

    <script>    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="/jslibrary/sfdc/hr.js"></script>

    <link href="/template/css/search.css" rel="stylesheet" />

    <link href="/element/element.css" rel="stylesheet" />
    <script type="text/javascript" src="/element/vue.js"></script>
    <script type="text/javascript" src="/element/element.js"></script>

    <link href="/hr/peopleOutdashboar.css" rel="stylesheet" />
    <link href="/emailiframe/emails.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />

    <link href="/template/css/header.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/search.css" rel="stylesheet" type="text/css" />
    <style>
        .el-tree {
            height: calc(100% - 107px);
            overflow: auto;
        }

        .card-photo img {
            width: 70px;
            height: 70px;
        }

        .miss-header {
            margin-top: 10px;
            border-radius: 4px 4px 0 0;
            background-color: #f3f2f2;
            padding: 15px 15px;
        }

        .bodyDiv {
            border-top: 1px solid #dedede !important;
        }

        .el-select-dropdown__item {
            margin-left: 0;
        }

        .bottom-btn .el-checkbox {
            float: none !important;
        }

        .list-item .el-checkbox {
            margin-top: 12px;
        }

        #iframe {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 999;
            height: 100%;
            display:none;
        }

        .el-menu-item {
            position: relative;
        }

            .el-menu-item .editbtn {
                display: none;
                float: right;
                position: absolute;
                right: 10px;
                top: 0;
            }

            .el-menu-item:hover .editbtn {
                display: block;
            }

        .list-item {
            cursor: pointer;
        }

            .list-item.active {
                background-color: #e3effd;
            }

        .list-item-main-tonglan {
            height: calc(100% - 120px);
        }

        .list-item-main-bianji {
            height: calc(100% - 165px);
        }

        .email-file li {
            position: relative;
        }

        .email-main-head-rightbtn i {
            margin-left: 10px;
        }

        .el-menu-item.is-active {
            background-color: #ecf5ff;
        }

        .file-left img {
            width: 30px;
            height: 30px;
        }

        .bodyDiv {
            background-color: transparent;
            box-shadow: none;
        }

        .peopleout {
            background-color: white;
            border-radius: 0px 0px 4px 4px;
            box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.3);
        }

        .centre-head .el-input__inner {
            height: 32px;
            width: calc(100% - 20px);
        }

        .centre-head .el-input__icon {
            line-height: 32px;
        }

        .centre-head .el-date-editor .el-input__inner {
            width: 135px;
        }

        .centre-head {
            display: flex;
        }

        .outcode .search-select {
            border: 0;
            text-align: center;
            background-color: #f9f9fa;
            margin-left: 35%;
        }

        .outcode .selectlist {
            margin-left: 35%;
        }

        .outcode {
            position: relative;
            width: 100%;
            background-color: #f9f9fa;
            margin: 0;
        }

        html, body, #vueapp, .el-container, .el-aside, #contentWrapper {
            height: 100%;
        }

        .peopleout {
            height: 100%;
        }

        .el-popover {
            z-index: 100 !important;
        }

        .buttonbtn.shuaxin {
            background: none !important;
            background-color: white !important;
        }

            .buttonbtn.shuaxin img {
                position: absolute;
                margin-top: 7px;
                margin-left: -7px;
            }

        .contact-item {
            height: 30px;
            line-height: 30px;
            padding-left: 10px;
        }

            .contact-item.active {
                background-color: #F5F7FA;
                border-left: 4px solid #108af9;
            }

            .contact-item:hover {
                background-color: #F5F7FA;
                cursor: pointer;
            }

        .left-typechoose {
            width: 240px;
            float: left;
            height: 100%;
            box-sizing: border-box;
            border-right: 1px solid #dedede;
        }

        .right-content {
            margin-left: 240px;
            height: 100%;
        }

        .my-contact {
            border-bottom: 1px solid #dedede;
        }

        .dept-contact-item {
            width: 50%;
            float: left;
            height: 35px;
            line-height: 35px;
            text-align: center;
            font-size: 14px;
            cursor: pointer;
            box-sizing: border-box;
        }

            .dept-contact-item.active {
                border-bottom: 3px solid #108af9;
            }

        .dept-contact {
            border-bottom: 1px solid #dedede;
            height: 35px;
        }

        #depttree, #grouplist {
            overflow: auto;
        }

        .card-item {
            width: 25%;
            float: left;
            padding: 10px;
            box-sizing: border-box;
        }

            .card-item > div {
                border: 1px solid #dedede;
                border-radius: 4px;
                box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.1);
                padding: 10px;
                height: 195px;
                box-sizing: border-box;
            }

        .card-photo {
            background-color: #3399ff;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            line-height: 70px;
            text-align: center;
            color: white;
            float: left;
        }

        .card-title {
            margin-left: 85px;
            margin-top: 5px;
        }

        .card-name {
            color: #0070d2;
            font-size: 14px;
            font-weight: 700;
            line-height: 24px;
        }

        .card-dept {
            color: #080707;
            line-height: 18px;
        }

        .card-status {
            color: #999999;
            line-height: 18px;
        }

        .card-item-photo {
            border-bottom: 1px solid #dedede;
            padding: 10px 0 5px 0;
            clear: both;
        }

        .photo-title, .email-title {
            color: #666;
            line-height: 20px;
        }

        .photo-body {
            color: #333;
            line-height: 20px;
            font-weight: 700;
        }

        .peoplecard, .peoplelist {
            position: relative;
            height: 100%;
        }

        .peoplecard-data {
            height: 100%;
            overflow: auto;
            padding-bottom: 30px;
            box-sizing: border-box;
        }

        .nodata {
            text-align: center;
            position: absolute;
            width: 100%;
            top: 50%;
            margin-top: -50px;
            font-size: 18px;
            color: #333;
            font-weight: 700;
        }

        .datagrid-wrap.panel-body.panel-body-noheader {
            border: 0;
        }

        .miss-header {
            min-height: 0 !important;
        }

        .pagepagination {
            display: none;
            margin-top:-35px;
            background-color:white;
            position:relative;
            height:33px;
            line-height:33px;
        }
        .pagepagination .pagination{
            padding:0;
        }
        .usertype{
            height:50px;
            line-height:50px;
            font-size:14px;
            border-bottom:1px solid #dedede;
        }
        .usertype>div{
            float:left;
            width:50%;
            text-align:center;
            cursor:pointer;
        }
        .usertype>div.active{
            color:#108def;
        }
        .editimg{
            width:14px;
            height:14px;
            float:right;
            margin-right:10px;
            margin-top:8px;
            display:none;
        }
        .contact-item:hover .editimg{
            display:block;
        }
        .popup-mask {
            position: fixed;

            background:url(/img/bgOverlayDialogBackground.png);
            background-color:transparent;
            display:none;
            height:100%;
            width:100%;
            top:0;
            left:0;
            z-index:100;
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
        .cardedit img{
            height:14px;
            width:14px;
            cursor:pointer;
            margin-right:10px;
            float:left;
            margin-top:1px;
        }
        .cardedit{
            float:right;
            margin-top:-20px;
        }
        .cardedit{
            display:none;
        }
        .card-item:hover .cardedit{
            display:block;
        }
        .card-item {
            position:relative;
        }
        .cardedit{
            border:1px solid #dedede;
            border-radius:4px;
            box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.1);
            padding: 5px 0;
            position:absolute;
            background-color:white;
            right:0;
        }
        .cardedit>div{
            padding:5px 20px 5px 10px;
            cursor:pointer;
        }
        .cardedit>div:hover{
            background-color:#f2f2f2;
        }
        .moreeditbtn{
            float:right;
            font-size:20px;
            margin-top:-20px;
        }
    </style>
    <script src="/js/jquery/jquery.fileDownload.js"></script>
    <link rel="stylesheet" href="/easyui/themes/bootstrap/easyui.css" type="text/css" />
    <link rel="stylesheet" href="/easyui/themes/icon.css" type="text/css" />
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper" style="vertical-align: middle">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="miss-header">
            <div class="header-left-logo">
                <img src="/img/images/message.png">
            </div>
            <div class="header-left-title2">
                <p class="header-left-title-name">通讯录</p>
            </div>

            <div style="" class="header-right-buttonbtn search-cont">
                <div class="buttonbtn-group">
                    <div class="buttonbtn newbtn" onclick="importExcel()">导入</div>
                    <div class="buttonbtn" id="printe">导出</div>
                    <div class="buttonbtn newbtn" onclick="tempExcel()">下载模板</div>
                </div>
                <div class="buttonbtn-group">
                    <div class="buttonbtn newbtn" onclick="add()">新建</div>
                    <div class="buttonbtn newbtn" onclick="adds()">批量新建</div>
                </div>
                <div class="buttonbtn buttonbtnsousuo">
                    <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext">
                </div>
                <div class="buttonbtn shituu selectbuttonbtn" title="显示为 看板">
                    <img src="/img/cal/20.kanban_1(14x14).png" class="img1 posi">
                    <img src="/img/cal/20.PNG" class="img2">
                    <div class="selectlist" style="display: none;">
                        <span class="card-table-div1">显示为</span>
                        <ul class="card-table" style="display: block;">
                            <li class="card-table-div2 ">表
                                     <img src="/img/cal/checkedgrey.png" class="img2">
                                <img src="/img/cal/20.table_1(14x14).png" class="img1">
                            </li>
                            <li class="card-table-div3 active">看板
                                     <img src="/img/cal/checkedgrey.png" class="img2">
                                <img src="/img/cal/20.kanban_1(14x14).png" class="img1">
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="buttonbtn shuaxin">
                    <img src="/img/cal/refresh.png" style="width: 15px; height: 15px;" />
                </div>
                <div class="buttonbtn shaixuan ban" title="此筛选器不可用"></div>
            </div>
            <div class="clear"></div>

        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="peopleout">
                <div class="left-typechoose">
                    <div class="usertype">
                        <div id="unitcontactlist">单位联系人</div>
                        <div id="mycontactlist"class="active">个人联系人</div>
                    </div>
                    <div class="my-contact">
                        <%--<div class="contact-item active">最近联系人</div>--%>
                        <div class="contact-item active">所有联系人</div>
                        <%--<div class="contact-item">个人联系人</div>--%>
                    </div>
                    <div class="dept-body">
                        <div style="padding:5px;">
                            <span>我的小组</span>
                            <img onclick="addgroup()" style="width:14px;float:right;margin-right:15px;cursor:pointer;" src="/img/cal/add.png"/>
                        </div>
                        <div id="grouplist">
                        </div>
                    </div>
                </div>
                <div class="right-content">
                    <div class="peoplelist" style="display: none;">
                        <div id="datagrid"></div>
                        <%--<div class="nodata">暂时没有数据</div>--%>
                    </div>
                    <div class="peoplecard">
                        <div class="nodata">暂时没有数据</div>
                        <div class="peoplecard-data"></div>
                    </div>
                    <div class="pagepagination">
                            <div id="pp" class="easyui-pagination" style="background: #efefef; border-top: 1px solid #ccc;">
                            </div>
                            <script>
                                $('#pp').pagination({
                                    total: 2000,
                                    pageSize: 20,
                                    onSelectPage: function (pageNumber, pageSize) {
                                        if ($('.contact-item.active').length > 0) {
                                            var contactGroupId = $('.contact-item.active').attr('groupId')
                                            getmycontactdata(contactGroupId)
                                        } else {
                                            getmycontactdata()
                                        }
                                    }
                                });

                            </script>
                        </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function bodyOnLoad() {
                setFocusOnLoad();
                if (typeof (startSessionTimer) != 'undefined') {
                    startSessionTimer();
                };
                if (typeof (ActivityReminder) != 'undefined') {
                    ActivityReminder.initialize([], false, false);
                };
                if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) {
                    sfdcPage.executeOnloadQueue();
                };
                Sfdc.Cookie.deleteCookie('setupopen');;
                if (this.loadChatFrameJs) loadChatFrameJs();
                new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {},
                false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {},
                true, 3, 100);
                new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U%2Fc%3FcType%3D2%26md2%3D13%26md0%3D2016&isAjaxRequest=1&renderMode=RETRO&nocache=1458613543622';
                if (document.getElementById('sidebarDiv')) {
                    Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                };
                if (window.PreferenceBits) {
                    window.PreferenceBits.prototype.csrfToken = "";
                };
                $('.x-tree-node>div').click(function () {
                    console.log($(this).attr('ext:tree-node-id'))
                })
            }
            function bodyOnBeforeUnload() {
                if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) {
                    sfdcPage.executeOnBeforeUnloadQueue();
                };
            }
            function bodyOnFocus() {
                closePopupOnBodyFocus();
            }
            function bodyOnUnload() { }



        </script>
    </div>
    <iframe frameborder="0" id="iframe" src=""></iframe>
    <div class="popup-mask"></div>
    <script src="/js/alert.js"></script>
    <script>
        $('.bodyDiv').height($(window).height() - 200)
        $(window).resize(function () {
            $('.bodyDiv').height($(window).height() - 200)
        })
    </script>

    <script>
        Date.prototype.format = function (format) {
            var o = {
                "M+": this.getMonth() + 1, //month
                "d+": this.getDate(),    //day
                "h+": this.getHours(),   //hour
                "m+": this.getMinutes(), //minute
                "s+": this.getSeconds(), //second
                "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
                "S": this.getMilliseconds() //millisecond
            }
            if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
            (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o) if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1,
                RegExp.$1.length == 1 ? o[k] :
                ("00" + o[k]).substr(("" + o[k]).length));
            return format;
        }
    </script>
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>
    <script>

        var screenHeight = $(window).height();

        $('#grouplist').height(screenHeight - 310);

        function importExcel() {
            var url = "/alert/ImportExcel.aspx?ObjectType=MyContact&type=MyContact";
            if ($('.contact-item.active').length > 0) {
                url += '&contactGroupName=' + $('.contact-item.active').text()
                url += '&contactGroupId=' + $('.contact-item.active').attr('groupid')
            }
            showDialog(url, "batchArrangeshift", "导入Excel", 400, 300);
            return false;
        }


        function tempExcel() {
            var url = '/apps/CommandProcessor.ashx?c=1&cmd=oa.excel.download.temp&ObjectType=MyContact';
            $.fileDownload(url, {
                httpMethod: 'post',
                successCallback: function (html, url) {
                    alert("下载成功！");

                },
                failCallback: function (html, url) {
                    alert("下载失败！");
                }
            });
        }
        //导出
        $('#printe').click(function () {
            var search = $('#srchText').val()
            var groupId = $('.contact-item.active').attr('groupId')
            if (groupId == "" || typeof (groupId) == "undefined") {
                alert("请先选择小组,再导出!");
            }
            else {
                window.open('/apps/CommandProcessor.ashx?cmd=contact.group.export&search=' + search + '&contactGroupId=' + groupId)
            }           
        })

        $('.contact-item').click(function () {
            $('.contact-item').removeClass('active')
            $('.tree-node-selected').removeClass('tree-node-selected')
            $(this).addClass('active')
        })
        $('.dept-contact-item').click(function () {
            $(this).addClass('active')
            $(this).siblings().removeClass('active')
            $('.dept-body>div').hide()
            $('.dept-body>div').eq($(this).index()).show()
        })
        getgroup()
        function getgroup() {
            ajaxMethodGetData('contact.group.search', { search: '' }, function (data) {
                $('#grouplist .contact-item').remove()
                if (data.rows) {
                    for (var i = 0; i < data.rows.length; i++) {
                        $('#grouplist').append('<div class="contact-item" groupId="' + data.rows[i].contactGroupId + '">' + data.rows[i].name
                            + '<img class="deletegroup editimg" src="/img/cal/delete.png">'
                            + '<img class="editgroup editimg" src="/img/cal/edit.png"></div>')
                    }
                    $('#grouplist .contact-item').click(function () {
                        $('.contact-item').removeClass('active')
                        $('.tree-node-selected').removeClass('tree-node-selected')
                        $(this).addClass('active')
                        var groupId = $(this).attr('groupId')
                        getmycontactdata(groupId)
                    })
                }
                editbtn()

            })
        }
        getmycontactdata()
        function getmycontactdata(id,search) {
            $('.pagepagination').show()
            var d = {
                pageNumber: 1, pageSize: 20
            }
            if ($('.contact-item.active').length>0) {
                d.contactGroupId = $('.contact-item.active').attr('groupid')
            }
            var srchText = $('#srchText').val()
            if (srchText) {
                d.search = srchText
            }
            ajaxMethodGetData('contact.my.search',d, function (data) {
                $('#pp').pagination({
                    total: data.total
                });
                createdpeople(data.rows)
            })
        }
        

        $('.contact-item').eq(0).click(function () {
            getmycontactdata()
        })

        
        function formatOper(val, row, index) {
            var html = "";
            var rowId = row["Id"];
            html += '<a style=\"color:#015ba7;font-size:13px;\" onclick=editview("' + rowId + '")>编辑</a>';
            html += "&nbsp;|&nbsp; <a title=\"\" style=\"color:#015ba7;font-size:13px;\" onclick=\" DeletePeopleFromProfile('" + row.Id + "','" + row.ProfileId + "');\" href='#'>删除</a>";
            html += "&nbsp;|&nbsp; <a title=\"\" style=\"color:#015ba7;font-size:13px;\" onclick=\" addpeoplegroup('" + row.Id + "','" + row.FullName + "');\" href='#'>添加组</a>";
            html += "&nbsp;|&nbsp; <a title=\"\" style=\"color:#015ba7;font-size:13px;\" onclick=\" deletepeoplegroup('" + row.Id + "','" + row.ProfileId + "');\" href='#'>移出组</a>";
            html += "</div>"
            return html;
        }

        function createdpeople(data) {
            $('.card-item').remove()
            if (data.length == 0) {
                $('.nodata').show()
            } else {
                $('.nodata').hide()
            }
            for (var i = 0; i < data.length; i++) {
                if (data[i].BusinessUnitIdName) {
                    var BusinessUnitIdName = data[i].BusinessUnitIdName
                } else {
                    var BusinessUnitIdName = data[i].businessunitidname
                    data[i].BusinessUnitIdName = BusinessUnitIdName
                }
                if (!BusinessUnitIdName) {
                    var BusinessUnitIdName = ''
                    data[i].BusinessUnitIdName = BusinessUnitIdName
                }

                if (data[i].PhotoUrl) {
                    var PhotoUrl = data[i].PhotoUrl
                } else {
                    var PhotoUrl = data[i].photourl
                }

                if (!PhotoUrl || PhotoUrl == '') {
                    PhotoUrl = '/img/cal/1.png'
                }

                if (data[i].fullName) {
                    var fullName = data[i].fullName
                } else {
                    var fullName = data[i].fullname
                    data[i].fullName = fullName
                }
                if (!fullName) {
                    var fullName = data[i].FullName
                    data[i].fullName = fullName
                }
                if (!fullName) {
                    var fullName = ''
                    data[i].fullName = fullName
                }

                if (data[i].MobilePhone) {
                    var MobilePhone = data[i].MobilePhone
                } else {
                    var MobilePhone = data[i].mobilephone
                    data[i].MobilePhone = MobilePhone
                }
                if (!MobilePhone) {
                    var MobilePhone = ''
                    data[i].MobilePhone = MobilePhone

                }

                if (data[i].EmailAddress) {
                    var EmailAddress = data[i].EmailAddress
                } else {
                    var EmailAddress = data[i].EmailAddress
                    data[i].EmailAddress = EmailAddress

                }
                if (!EmailAddress) {
                    var EmailAddress = ''
                    data[i].EmailAddress = EmailAddress

                }

                if (data[i].EmployeeId) {
                    var EmployeeId = data[i].EmployeeId
                } else {
                    var EmployeeId = data[i].employeeid
                    data[i].EmployeeId = EmployeeId
                }
                if (!EmployeeId) {
                    var EmployeeId = ''
                    data[i].EmployeeId = EmployeeId
                }
                var Id = data[i].Id

                $('.peoplecard-data').append('<div class="card-item"><div>'
                   + '<div class="card-item-head">'
                   + '<div class="card-photo">'
                    + '<span style="font-size: 16px;">'
                    + '<img src="' + PhotoUrl + '"></span></div><div class="card-title"><div class="card-name">' + fullName + '</div>'
                    +'<span class="moreeditbtn">···</span>'
                    + '<div employeeid="' + Id + '" class="cardedit">'
                    + '<div class="cardeditbtn">'
                    + '<img title="编辑"  src="/img/cal/edit.png"/>'
                    + '编辑</div>'
                    + '<div class="carddeletebtn">'
                    + '<img title="删除"  src="/img/cal/delete.png"/>'
                    + '删除</div>'
                    + '<div onclick=addpeoplegroup("' + Id + '","' + data[i].FullName + '")>'
                    + '<img title="添加组"  class="" src="/img/cal/add1.png"/>'
                    + '添加组</div>'
                    + '<div onclick=deletepeoplegroup("' + Id + '")>'
                    + '<img title="移出组"  class="" src="/img/cal/closegray.png"/>'
                    + '移出组</div>'
                    
                    +'</div>'
                    + '<div class="card-dept">' + BusinessUnitIdName + '</div>'
                    + '<div class="card-status">' + EmployeeId + '</div></div></div><div class="card-item-photo">'
                    + '<div class="photo-title">手机号码</div><div class="photo-body">' + MobilePhone + '</div></div>'
                    + '<div class="card-item-email"><div class="email-title">电子邮件</div> '
                    + '<div class="email-content">' + EmailAddress + '</div></div></div></div>')
                var columnsArray = [
                    {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return formatOper(value, row, index, self.entityType);
                        }
                    },
                    {
                        field: 'fullName',
                        title: '姓名',
                        sortable: true
                    },
                    {
                        field: 'BusinessUnitIdName',
                        title: '部门',
                        sortable: true
                    },
                    {
                        field: 'EmployeeId',
                        title: '工号',
                        sortable: true
                    },
                     {
                         field: 'MobilePhone',
                         title: '手机号码',
                         sortable: true
                     },
                      {
                          field: 'EmailAddress',
                          title: '电子邮件',
                          sortable: true
                      },
                ]
            }
            $('.cardeditbtn').click(function () {
                var id = $(this).parent().attr('employeeid')
                $('.popup-mask').show()
                $('#iframe').show().attr('src', '/layouteditor/add_layout_ie8.html?entityName=Contact&id=' + id).height(620).css('margin-top', '-300px');
            })
            $('.carddeletebtn').click(function () {
                var id = $(this).parent().attr('employeeid')
                $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=2').show().height(280).css('margin-top', '-140px')
                $('.popup-mask').show()
            })
            $('.peoplelist').html('<div id="datagrid"></div><div style="display:none" class="nodata"></div>')
            $('#datagrid').height(screenHeight - 200)
            if (data.length == 0) {

            } else {
                $('#datagrid').datagrid({
                    columns: [columnsArray],
                    fitCloumns: true,
                    idField: "LIST_RECORD_ID",
                    singleSelect: false,
                    checkOnSelect: true,
                    method: 'POST',
                    rownumbers: true,
                    data: data,
                    striped: false,
                })
            }
        }

        $('#srchText').change(function () {
            var search = $(this).val()
            if ($('.contact-item.active').length > 0) {
                var contactGroupId = $('.contact-item.active').attr('groupId')
                getmycontactdata(contactGroupId,search)
            } else {
                getmycontactdata('',search)
            }
        })
        $('.shuaxin').click(function () {
            window.location.reload()
        })
        $('.card-table-div2').click(function () {
            $('.peoplecard').hide()
            $('.peoplelist').show()
            $('#datagrid').datagrid('resize')
        })
        $('.card-table-div3').click(function () {
            $('.peoplecard').show()
            $('.peoplelist').hide()
        })
        $('#unitcontactlist').click(function () {
            window.location.href = '/C00/o'
        })
        function add() {
            $('.popup-mask').show()
            $('#iframe').show().attr('src', '/layouteditor/add_layout_ie8.html?entityName=Contact').height(620).css('margin-top', '-300px');
        }
        function adds() {
            $('.popup-mask').show()
            $('#iframe').show().attr('src', '/alert/personalcntc/addpersonalcntcs.html').height(620).css('margin-top', '-300px');
        }
        function addgroup() {
            $('.popup-mask').show()
            $('#iframe').show().attr('src', '/layouteditor/add_layout_ie8.html?entityName=ContactGroup').height(620).css('margin-top', '-300px');
        }
        function editbtn() {
            $('.deletegroup').click(function () {
                var id = $(this).parent().attr('groupid')
                $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=7021').show().height(280).css('margin-top', '-140px')
                $('.popup-mask').show()
                return false
            })
            $('.editgroup').click(function () {
                var id = $(this).parent().attr('groupid')
                $('.popup-mask').show()
                $('#iframe').show().attr('src', '/layouteditor/add_layout_ie8.html?entityName=ContactGroup&id=' + id).height(620).css('margin-top', '-300px');
                return false
            })
        }
        
        function editview(id) {
            $('.popup-mask').show()
            $('#iframe').show().attr('src', '/layouteditor/add_layout_ie8.html?entityName=Contact&id=' + id).height(620).css('margin-top', '-300px');
        }
        function DeletePeopleFromProfile(id) {
            $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=2').show().height(280).css('margin-top', '-140px')
            $('.popup-mask').show()
        }
        function deletenewdata(objTypeCode) {
            if (objTypeCode == 2) {
                if ($('.contact-item.active').length > 0) {
                    var contactGroupId = $('.contact-item.active').attr('groupId')
                    getmycontactdata(contactGroupId)
                } else {
                    getmycontactdata()
                }
            } else {
                getgroup()
            }
        }
        function newdata() {
            getmycontactdata()
            getgroup()
        }
        function addpeoplegroup(id, name) {
            $('#iframe').attr('src', '/alert/personalcntc/addpeoplegroup.html?id=' + id+'&name='+name).show().height(620).css('margin-top', '-300px')
            $('.popup-mask').show()
        }
        function deletepeoplegroup(contactId) {
            var contactGroupId = $('.contact-item.active').attr('groupid')
            if (confirm('是否要将人员移出该组')) {
                var d = {
                    contactGroupId: contactGroupId,
                    contactId: contactId,
                }
                ajaxMethodGetData('contact.group.membership.delete',d, function (data) {
                    if (data.status == 1) {
                        success2('移出成功')
                        parent.getmycontactdata()

                    } else {
                        error('移出失败')
                    }
                })
            }
            
        }
    </script>
</body>
</html>
<!-- page generation time: 203ms -->


