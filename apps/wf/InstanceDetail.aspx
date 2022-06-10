<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanceDetail.aspx.cs"
    Inherits="WebClient.apps.wf.InstanceDetail" %>
<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=1300px">
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/icon/iconfont.css" />
    
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/detail.css">
    <link rel="stylesheet" href="/utils/index.min.css">
    <link href="/layouteditor/layout_main.css" rel="stylesheet" />
    <title>列表详情</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <script src="/js/html2pdf/html2pdf.bundle.min.js" type="text/javascript"></script>
    <script src="/js/component.js" type="text/javascript"></script>
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
    
    <script type="text/javascript" src="/js/workflowinstance.js"></script>
<script type="text/javascript" src="/js/layoutlist/ProcessPageConfig.js"></script>
        <script src="/apps/flowdesigner/editors/js/Workflow.js" type="text/javascript"></script>
    <%--<script src="/jslibrary/sfdc/main_source.js"></script>--%>
    
    <link href="/template/css/indexStyle.css" rel="stylesheet"  type="text/css"/>
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/common.css">
    <style type="text/css">
    .file-preview-download{
        display:none;
    }
    .overlay_panel .mw_container {
    background-color: #efefef;
    border: 1px solid #7f7f7f;
    margin: auto;
    padding: 20px;
    width: 90%;
    }
    .step
    {
        font-size:14px;
        text-align:left;
    }
    #Div1 {
    border-top: 3px solid #319431;
}
    .success{
        z-index:99999;
    }
    #messageboard{
        box-sizing:border-box;
        padding:10px;
        width:100%;
    }
    #ifrmAttaches1{
        overflow-y:scroll;
    }
    .Attachesmain{
        padding: 10px 10px 10px 12px;
    }
    #ifrmAttaches1 img{
        width:34px;height:36px; float:left;
    }
    .Attachesname{
        margin-left:43px; margin-bottom:5px;
        width: 80%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .Attachesbtn{
        margin-left:43px;
    }
    .Attachesbtn a{
        margin-right:5px;
        text-decoration:none;
        color:#015ba7;
    }
    #filecontent{
        padding:0;
    }
    .missionright-body .div1 .name span{
        color:#000;
        white-space: normal;
        display:inline-block;
        word-break: break-all;
    }
    .actionLink img{
        width: 8px;
        position: relative;
        top: 12px;
    }
</style>
    <style>
.missionright-file-type.shituu {
    width:150px !important;
}
.missionright-body {
    border-top:1px solid #dedede;
}
.missionright-head {
    padding-bottom:10px !important;
}
.missionright-head>span, .missionright-head>p {
    margin-top:3px;
    display:inline-block;
}
#btnUploadfile {
    margin-top:0;
}
.missionright-head:after {
    display:block;
    content:"";
    clear:both;
}
#downfile-all {
    margin-top:0 !important;
    margin-left:10px !important;
}
.shuaxin {
    background:none;
}
.sanjiao {
    width:20px !important;
    height:20px !important;
    line-height: 20px ;
    padding:0 !important;
    margin-top:5px;
    overflow:visible !important;
    position: relative;
    float:right;
    border-radius:4px;
    text-align: center;
}
.sanjiao .iconfont{
    font-size: 12px !important;
}
.missionright-body li.div1 {
    float:left;
    margin-top:5px;
    margin-left:10px;
}
.missionright-body li {
    padding:10px 5px;
}
.selectlist {
    width:100%;
    left:0;
}
.file-preview-head-right {
    float:right !important;
}
.file-preview-type img {
    margin-top:0;
}
.file-preview-head-right img {
    margin-top:0;
}
.section {
    display:none;
    background-color:white;
}
.clear {
    clear:both;
}
.section.active {
    display:block;
}
#ef_taolun1 {
    width:100%;
    height:500px;
}
.layui-table-view {
    background-color:white;
}
.head-right a {
    color:white;
}
.editbox a {
    cursor:pointer;
}
.missionright-body3 ul li .div1 {
    width:70%;
}
.missionright-body3 ul li .name {
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    font-size: 14px;
}
.missionright-body3 ul li > img {
    width:40px;
    height:40px;
    float:left;
}
.missionright-body3 ul li {
    background:none;
}
.missionright-body li .div1 {
    margin-left:50px;
    float:none;
}
.file-preview {
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    display:none;
    z-index:300;
}
.file-preview-mask {
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background-color:#000;
    opacity:0.8;
}
.file-preview-type img {
    height:32px;
    width:32px;
    margin-left:10px;
    margin-top:12px;
}
.file-preview-name {
    margin-left:15px;
}
.file-preview-head {
    position:relative;
    z-index:301;
    height:60px;
    background-color:#000;
    color:white;
    line-height:60px;
}
.file-preview-head>div {
    float:left;
}
.file-preview-head.file-preview-head-right {
    float:right;
}
.file-preview-head-right img {
    margin-top:20px;
    margin-right:20px;
    cursor:pointer;
}
.file-preview-head-left>div {
    float:left;
}
.file-preview-head-middle {
    margin-left:25%;
}
.file-preview-head-middle > div {
    float:left;
    overflow:hidden;
    height:36px;
    width:80px;
    margin-top:12px;
    line-height:36px;
    border-radius:4px;
    cursor:pointer;
}
.file-preview-head-middle > div:hover {
    background-color:#383838;
}
.file-preview-head-middle img {
    margin-top:8px;
    float:left;
    margin-left:15px;
    margin-right:5px;
}
.file-preview iframe {
    height:92% !important;
    background-color:#ffffff;
    width:98%;
    position:absolute;
    z-index:10;
    left:1%;
    bottom:0;
    border:0;
}
.popup #newmission.missmessage-body .title>span {
    width:100px;
}
.popup #newmission.missmessage-body .email>span {
    width:100px;
}
.popup #newmission.pinput1 {
    margin-left:0px;
}
.miss-bianji2 {
    height:100px
}
.morefile {
    display:block;
    float:right;
}
.missionright-body3 .sanjiao img {
    margin-left:4px;
    margin-top:4px;
    width:12px;
    height:12px;
}

.missionright-file-type > div {
    /*float:left;*/
}
.missionright-file-type .img2 {
    width:12px;
    height:12px;
    float:right;
}
.file-type-title {
    line-height:30px;
}
/*.missionright-file-type .shituu {
    width:70% !important;
    margin-left:10px;
    color:#333;
    line-height:20px;
    margin-right:10px;
    position:relative;
}*/
.missionright-file-type .shuaxin {
    float:right;
}
.missionright-body3 .div1 {
    float:left;
    margin-top:3px;
}
.selectlist li {
    border:0;
}
.fileclass-head {
    cursor:pointer;
    height:32px;
    line-height:32px;
    /*font-weight:700;*/
    color:#4e5969;
    padding-left:30px;
    border-radius:4px;
    margin:5px 0;
    background:url("/img/images/rightArrow.png") no-repeat left 10px center;
    background-size:12px;
    background-color:#f3f2f2;
    font-size: 13px !important;
}
.fileclass-head.active {
    background:url("/img/images/Open.png") no-repeat left 10px center;
    background-size:12px;
    background-color:#f3f2f2;
}
.sanjiao {
    /*position:static;*/
    cursor:pointer;
}
.related-item-body .sanjiao {
    float:right !important;
    margin-right:15px;
}
.related-item-body .sanjiao img {
    margin-left:3px;
    margin-top:3px;
}
.miss-bianji2 {
    left:auto;
    top:auto;
    right:20px;
    margin-top:-6px;
    height:auto;
}
.mission-left {
    overflow-y:visible;
}
.missionright-file-type span>.deletefileclass {
    display:none;
}
.buttonbtn {
    border:1px solid #dddbda;
    border-radius:4px;
    background-color:white;
    padding:0 15px;
    line-height:30px;
    height:32px;
    font-size:12px;
    cursor:pointer;
    box-sizing:border-box;
}
.missionright-body3 ul li.div1 {
    width:70%;
}
.missionright-body li.div1 {
    margin-left:20px;
}
.mission.div1 {
    float:left;
    margin-top:5px;
}
.missionright-head .headicon {
    background-color:#a0522d;
    display:inline-block;
    position: relative;
    top: 4px;
    width:20px;
    height:20px;
    float:left;
    margin-right:10px;
}
.morefile {
    display:block;
    float:right;
}
.missionright-body ul {
    margin-top:5px;
}
.missionright-body.div1.name span {
    color:#108af9;
    cursor:pointer;
}
.missionright-body3 {
    padding-bottom:8px;
}
.missionright-body {
    border:1px solid #5050501a;
    border-top:3px solid #b0adab;
    border-radius:2px;
}
.missionright-body li.div1 {
    margin-left:60px;
}
.mission.div1 {
    float:left;
    margin-top:5px;
}
.mission.delete {
    width:30px;
    height:30px;
    margin-top:5px;
    border:1px solid #5050501a;
    float:right;
    background:url(/img/cal/13.PNG) no-repeat center center;
    background-size:17px;
    border-radius:4px;
}
.mission.upfile {
    display:none;
    width:160px;
    height:32px;
    line-height:32px;
    color:#108af9;
    border-radius:4px;
    font-size:12px;
    text-align:center;
    margin:auto;
    cursor:pointer;
}
.missionright-head {
    padding-bottom:10px;
    margin-top:0;
    color:#333333;
    /*padding-left:10px;
    padding-right:10px;*/
}
.shituu .img2 {
    width:10px;
    height:10px;
    margin-left:5px;
    margin-top:5px;
}
.shituu {
    padding:5px 7px;
}
.miss-bianji div:hover {
    background-color:#f5f5f5;
    color: #165dff;
    cursor:pointer;
}
.miss-bianji div {
    height:36px;
    line-height:36px;
    margin:5px 0;
    color:#4e5969;
    font-size: 14px;
}
.miss-bianji {
    width:100px;
    background-color:white;
    box-shadow:0px 0px 10px 2px rgb(56 56 56 / 20%);
    border-radius:4px;
    overflow:hidden;
    position:absolute;
    z-index:10;
    border:1px solid #dedede;
}
.selectlist.selectlistcheck li {
    position:relative;
}
.missionright-body3 ul li {
    background:none;
}
.selectlistcheck li {
    padding-left:40px;
}
.selectlist li {
    padding-left:15px;
    padding-right:20px;
}
.selectlist li {
    border:0;
}

    </style>
    <style>
                            .efpPanelSelect.efpsTopTabs.efpViewSelect {
                                width:100%;
                                margin-top:10px;
                                margin-bottom:3px;
                                border-top:none;
                                border-bottom:1px solid #dbdfe0;
                                border-left:1px solid #dbdfe0;
                                border-right:none;
                                float:left
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect>.optionContainer>li {
                                margin:0;
                                padding:0;
                                border-left:none;
                                border-right:1px solid #e6e6e6;
                                border-top:1px solid #e6e6e6;
                                background:none;
                                float:left
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect a {
                                display:block;
                                position:relative;
                                margin-bottom:-1px;
                                text-decoration:none;
                                background:#f6f6f6;
                                color:#4a4f56;
                                padding:9px 20px;
                                border-bottom:1px solid #dbdfe0
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect a:hover {
                                background-color:#f0f0f0
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect a.selected {
                                border-bottom:1px solid #fff;
                                margin-bottom:-2px;
                                background-color:#fff
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect
                            {
                                border-color: -moz-use-text-color -moz-use-text-color #dbdfe0 #dbdfe0;
                                border-style: none none solid solid;
                                border-width: medium medium 1px 1px;
                                float: left;
                                margin-bottom: 3px;
                                margin-top: 10px;
                                width: 100%;
                            }
                            .efpPanelSelect.efpViewSelect ul
                            {
                                list-style: outside none none;
                                margin: 0;
                                padding: 0;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect > .optionContainer > li
                            {
                                background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
                                border-left: medium none;
                                border-right: 1px solid #e6e6e6;
                                border-top: 1px solid #e6e6e6;
                                float: left;
                                margin: 0;
                                padding: 0;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect a
                            {
                                background: none repeat scroll 0 0 #f6f6f6;
                                border-bottom: 1px solid #dbdfe0;
                                color: #4a4f56;
                                display: block;
                                margin-bottom: -1px;
                                padding: 9px 20px;
                                position: relative;
                                text-decoration: none;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect a.selected
                            {
                                background-color: #fff;
                                border-bottom: 1px solid #fff;
                                margin-bottom: -2px;
                                
                            }
                            .eflDetails.efpViewSelectPanel.eflDetailsTopTabs .helpElement
                            {
                                /*top: 58px;
    position: absolute;*/
                                right: 0;
                                text-align: right;
                                margin-bottom: 0;
                            }
                            .eflDetails .efObjectDetails
                            {
                                background-color: white;
                                float: left;
                                min-width: 757px;
                                width: 100%;
                            }
                            #ef_taolun iframe {
                                border:0;
                                width:100%;
                            }
                            #changeDiv {
                                width: 100%;
                                height: 100%;
                                position: fixed;
                                top: 0px;
                                left: 0px;
                                z-index: 999;
                                display:none;

                            }
                            #iframe {
                                position: fixed;
                                width: 100%;
                                top: 0;
                                left: 0;
                                z-index: 999;
                                height: 100%;
                            }
                            #Div1 {
                                background-color:#f8f8f8;
                            }
                            #Div1>.pbBody{
                                margin:0 5px;
                                border:1px solid #dedede;
                                background-color:white;
                            }
                            #Div1 .WordSection1{
                                border-right:1px solid #dedede;
                            }
                            .pbHeader table td{
                                height:50px;
                                line-height:50px;
                            }
                            .efpPanelSelect.efpsTopTabs.efpViewSelect {
                                margin-bottom:0;
                            }
                            #Div1 .printerIcon {
                                background:none;
                                width:14px !important;
                                height:14px !important;
                                margin:0 5px;

                            }
                            #Div1 .uploadArrow {
                                width:14px !important;
                                height:14px !important;
                                margin:0 5px;
                            }
                            #Div1 .pbHeader td > a {
                                margin:0 10px;
                            }
                            #top2ButtonRow > input {
                                margin:0 10px;
                            }
                            .bPageBlock .pbTitle {
                                width:auto;
                            }
                            .outer td.oRight{
                                padding-bottom:0;
                            }
                             .popup-mask {
                                z-index: 100;
                                background-color: #000;
                                opacity: 0.4;
                                height: 100%;
                                width: 100%;
                                display: none;
                                position: fixed;
                                background:url(/img/bgOverlayDialogBackground.png) \9;
                                background-color:transparent \9;
                                top: 0;
                                left:0;
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
                                height:620px;
                                border:0;
                            }
                             #filecontent{
                                 overflow:auto;
                                 box-sizing:border-box;
                             }
                             #relatedInstances{
                                 padding:10px;
                                 overflow:auto;
                                 box-sizing:border-box;
                             }
                             #relatedInstances li{
                                 height: auto !important;
                                 font-size: 15px !important;
                                 line-height:15px !important;
                                 margin:0;
                                 padding-left:10px;
                                 padding-right:10px;
                             }
                             #relatedInstances li a{
                                 text-decoration:none !important;
                                 color:#015ba7;
                                 white-space: normal;
                                 display: inline-block;
                                 word-break: break-all;
                                 max-width: 90%;
                             }
                             #relatedInstances li .miaoshu{
                                 font-size: 13px !important;
                                 color: #999;
                                 margin-top: 6px;
                             }
                             .missionright-head{
                                 padding-bottom:10px;

                             }
                             a{
                                 text-decoration:none !important;
                             }
                             .missionright-body ul{
                                 /*overflow: auto;*/
                                 margin-top:0!important;
                             }
                             .missionright-body{
                                 border: 1px solid #dedede !important;
                                 border-top: 3px solid #b0adab !important;
                             }
                             #relatedInstances .missionright-body ul{
                                 max-height:530px;
                             }
                             /*#filecontent .missionright-body ul{
                                 max-height:555px;
                             }*/
                             #filecontent{
                                 padding-top:0;
                                 padding-bottom:10px;
                             }
                             #filecontent .missionright-body{
                                 
                             }
                             #messageboard{
                                 padding-top:0;
                             }
                             #messageboard .missionright-body ul{
                                 max-height:320px;
                             }
                             #relatedInstances{
                                 display:inline-block;
                                 width:100%;
                                 position:relative;
                                 float:none;
                                 overflow: visible;
                             }
                             #filecontent{
                                 display:inline-block;
                                 width:100%;
                                 position:relative;
                                 float:none;
                                 /*overflow: visible;*/
                                 overflow: auto;
                                 border-radius: 4px;
                             }
                             #messageboard{
                                 display:inline-block;
                                 width:100%;
                                 position:relative;
                                 float:none;
                                 overflow: visible;
                             }
                        </style>
                        <style>
                             .comment1 {
                                    /*padding-right: 14px;*/
                                    padding-left: 8px;
                                    /*padding-bottom: 10px;*/
                                }
                                .mission{
                                    margin:0;
                                    min-width:99%;
                                }
                                .mission .comment1 li{
                                    border-bottom: 1px solid #dedede; 
                                    position: relative;
                                    margin-top: 10px;
                                    padding: 5px 0px;
                                    width:97%;
                                    margin-bottom: 10px;
                                    line-height:20px;
                                    background:none;
                                }
                                .mission .comment1 li .messageboardimg{
                                    display:inline-block;
                                    width:35px;
                                    height:35px;
                                    background-color: #fff;
                                    position: absolute;
                                    top: 8px;
                                    left: 9px;
                                }
                                .comment1>ul{
                                    margin-top:10px;
                                }
                                .writecomment{
                                    min-width: 100%;
                                }
                                .mission .comment1 li .miaoshu{
                                    position: relative;
                                    top: 0px;
                                    right: 4px;
                                }
                                .mission .comment1 li p
                                {
                                    margin-left: 55px;
                                    height: auto;
                                }
                                .title1{
                                    color:#000;
                                    word-break: break-all;
                                }
                                .mission .comment li .name{
                                    padding-right:5px;
                                    color:#015ba7;
                                    white-space: normal;
                                    display: inline-block;
                                    word-break: break-all;
                                }
                                .missionright-head{
                                    margin-top: 0 !important;
                                    padding-bottom:8px !important;
                                    height:26px;
                                }
                                .actionLink{
                                    float: right;
                                    margin-right: 10px;
                                }
                                .outer td{
                                    vertical-align: top;
                                }
                                
                                .mission .comment1 li .miaoshu{
                                    color: #999 !important;
                                }
                                .missionright-body3 ul li{
                                    height:auto;
                                }
                                .norellist li{
                                    height:auto;
                                    min-height:38px;
                                }
                                .morefile {
                                    display: inline-block !important;
                                }
                        </style>
    <style>
        @import url('/utils/index.min.css')
    </style>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif contactTab  overviewPage sfdcBody brandQuaternaryBgr   ext-gecko ext-gecko3" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <div class="pageWrapper" id="app">
        <div class="header">
            <div class="leftBox">
                <div class="title">流程事务：02 差旅费报销审批单202004 项目管理部 余海</div>
                <div class="tabContainer notBorder">
                    <div class="tabList">
                        <div class="tab active" currentTab="tab1">
                            <div class="tabHover">
                                <span class="tabText">
                                    表单信息
                                </span>
                            </div>
                        </div>
                        <div class="tab" currentTab="tab2">
                            <div class="tabHover">
                                <span class="tabText">
                                    正文信息
                                </span>
                            </div>
                        </div>
                        <div class="tab" currentTab="tab3">
                            <div class="tabHover">
                                <span class="tabText">
                                    流程图
                                </span>
                            </div>
                        </div>
                        <div class="tab" currentTab="tab4">
                            <div class="tabHover">
                                <span class="tabText">
                                    相关事务与附件信息
                                </span>
                            </div>
                        </div>
                        <div class="tab" currentTab="tab5">
                            <div class="tabHover">
                                <span class="tabText">
                                    流转信息
                                </span>
                            </div>
                        </div>
                        <div class="tab" currentTab="tab6">
                            <div class="tabHover">
                                <span class="tabText">
                                    阅读记录
                                </span>
                            </div>
                        </div>
                        <div class="tab" currentTab="tab7">
                            <div class="tabHover">
                                <span class="tabText">
                                    讨论
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="tabs">
                    <div class="tab active">
                        <span>
                            表单信息
                        </span>
                    </div>
                    <div class="tab">
                        <span>
                            正文信息
                        </span>
                    </div>
                    <div class="tab">
                        <span>
                            相关事务与附件信息
                        </span>
                    </div>
                    <div class="tab">
                        <span>
                            流转信息
                        </span>
                    </div>
                    <div class="tab">
                        <span>
                            流转信息
                        </span>
                    </div>
                    <div class="tab">
                        <span>
                            流转信息
                        </span>
                    </div>
                    <div class="tab">
                        <span>
                            讨论
                        </span>
                    </div>
                </div> -->
            </div>
            <div class="rightBtns">
                <button class="btn primary" onclick="saveFormData(0)">保存表单</button>
                <button class="btn primary" onclick="submitNextStep(1)">提交流程</button>
                <button class="btn primary" onclick="circulateOthers()">传阅他人</button>
                <button class="btn primary" name="addStepParticipator" title="加签" onclick="addStepParticipator()">加签</button>
                <button class="btn primary" name="reminderRelated" title="催办" onclick="reminderRelated()">催办</button>
                <button class="btn primary" onclick="entrustOther()">委托</button>
                <%--<button class="btn primary"  onclick="ProcessopenchangeDiv(' + "'/apps/wf/InstanceTranAgent.aspx?InstanceId=" + rowId + "&RuleLogId" + WFRuleLogId + "&InstanceIdName=" + InstanceIdName + "&ExecutorIdentityName=" + ExecutorIdentityName + "'" + ')">委托</button>--%>
                <button class="btn" onclick="rejectProcess()">审批拒绝</button>
                <button class="btn" onclick="finishInstance()">结束流程</button>
                <div class="moreBox">
                    <div class="more">
                        <i class="iconfont icon-xinjian"></i>
                        <div class="dropMenuWapper">
                            <div class="dropMenu">
                                <div class="dropMenuItem">
                                    <a title="正文 （新窗口）" style="text-decoration:none; vertical-align:middle;width:100%;"
                                    name="uploadView" target="_blank" href="<%=viewLink %>"><span class="name helpLink">正文</span></a>
                                </div>
                                <div class="dropMenuItem">
                                    <%--<span class="name">
                                        打印审批单
                                    </span>--%>
                                    <a title="可打印视图 （新窗口）" style="text-decoration:none; vertical-align:middle;width:100%;"
                                     name="printView" href="javascript:printWin('/apps/wf/WFFormPrint.aspx?InstanceId=<%=InstanceId%>')"><span class="name helpLink">打印审批单</span></a>
                                </div>
                                <div class="dropMenuItem">
                                  <%--  <span class="name">
                                        PDF
                                    </span>--%>
                                    <a title="" style="text-decoration:none; vertical-align:middle;width:100%;"
                                       name="printView" href="javascript:printWin1();">
                                       <span class="name helpLink">PDF</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="moreModal">
                            <div class="item">
                                正文
                            </div>
                            <div class="item">
                                打印审批单
                            </div>
                            <div class="item">
                                PDF
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="center">
            <div class="container containerForm">
                <input type="hidden" name="_processId" id="_processId" value="<%=ProcessId%>" />
                <input type="hidden" name="splitType" id="splitType" value="<%=StepSplitType%>" />
                <input type="hidden" name="ruleLogId" id="ruleLogId" value="<%=RuleLogId%>" />
                <input type="hidden" name="instanceId" id="instanceId" value="<%=InstanceId%>" />
                <input type="hidden" name="fromActivityId" id="fromActivityId" value="<%=FromActivityId%>" />
                <input type="hidden" name="stepId" id="stepId" value="<%=StepId%>" />
                <input type="hidden" name="currentStepName" id="currentStepName" value="<%=CurrentStepName%>" />
                <input type="hidden" name="InstanceStatusCode" id="InstanceStatusCode" value="<%=InstanceState%>" />
                <input type="hidden" name="EntityObjectType" id="EntityObjectType" value="<%=EntityObjectType%>" />
                <input type="hidden" name="dealAction" id="dealAction" value="1" />
                <input type="hidden" name="_processId" id="_processId" value="<%=ProcessId%>" />
                <div class="tableBox">
                    <iframe width="100%" height="480" frameborder="0"  id="iWFForm" src="/apps/wf/WfFormEdit.aspx?InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>&isPreview=<%=IsFormView%>"></iframe>
                </div>
                <div class="rightAside">
                    <%--<div id="relatedInstances"></div>--%>
                    <div class="panel panelRelevant">
                        <div class="row">
                            <p class="title">相关事务</p>
                            <p class="btnText btnTextPrimary">
                                添加关联
                            </p>
                        </div>
                        <div class="relevantList">
                            <div class="relevantItem" v-for="(item,index) in relationList" :key="index">
                                <div class="relevantTitle">{{item.ProcessIdName}}</div>
                                <div class="relevantTimerInfo">
                                    {{item.CreatedOn}} {{item.CreatedByName}}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="filecontent"></div>
                    <%--<div class="panel">
                        <div class="row">
                            <p class="title">相关事务</p>
                            <p class="btnText btnTextPrimary">
                                添加关联
                            </p>
                        </div>
                    </div>--%>
                    <%--<div class="panel upload">
                        <div class="row">
                            <p class="title">相关事务 <span class="num">（7）</span></p>
                            <p class="btnText btnTextPrimary">
                                上传文件
                            </p>
                        </div>
                        <div class="uploadForm">
                            <div class="select">
                                <p class="val">全部分类</p>
                                <p class="arrowIcon">
                                    <i class="iconfont icon-xiala"></i>
                                </p>
                                <div class="dropMenuWapper selectModal">
                                    <div class="dropMenu">
                                        <div class="dropMenuItem" v-for="item in categoryList">
                                            <span class="name">
                                                {{item.Name}}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="iconBox">
                                <i class="iconfont icon-jichushezhi"></i>
                            </span>
                            <span class="iconBox">
                                <i class="iconfont icon-jichushezhi"></i>
                            </span>
                        </div>
                        <div class="fileList">
                            <div class="fileItem">
                                <div class="lImg">
                                    <img src="/static/images/02.3.1.Pdf.png" alt="">
                                </div>
                                <div class="fileInfo">
                                    <div class="name rowEllipsis">1. 滴滴电子发票</div>
                                    <div class="operation">
                                        <span class="text">查看</span>  ·
                                        <span class="text">下载</span>
                                    </div>
                                    <div class="size">
                                        <span class="time">15:21</span> ・ 40.18k
                                    </div>
                                </div>
                                <div class="iconBox more">
                                    <i class="iconfont icon-xiala"></i>
                                    <div class="dropMenuWapper uploadDrop">
                                        <div class="dropMenu">
                                            <div class="dropMenuItem">
                                                <span class="name">
                                                    正文
                                                </span>
                                            </div>
                                            <div class="dropMenuItem">
                                                <span class="name">
                                                    打印审批单
                                                </span>
                                            </div>
                                            <div class="dropMenuItem">
                                                <span class="name">
                                                    PDF
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="fileItem">
                                <div class="lImg">
                                    <img src="/static/images/02.3.1.PPT.png" alt="">
                                </div>
                                <div class="fileInfo">
                                    <div class="name rowEllipsis">1. 滴滴电子发票</div>
                                    <div class="operation">
                                        <span class="text">查看</span> ·
                                        <span class="text">下载</span>
                                    </div>
                                    <div class="size">
                                        <span class="time">15:21</span> ・ 40.18k
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
            <div class="container"></div>
            <div class="container">
                <iframe width="100%" height="450" frameborder="0" src="/apps/flowdesigner/editors/monitor2.aspx?schemeId=<%=ProcessId %>&amp;InstanceId=<%=InstanceId%>" id="ifrmflowMonitor"></iframe>
            </div>
            <!-- 相关事务与附件信息 -->
            <div class="container relevantEnclosure">
                <div class="relevantWrap">
                    <div class="panelWrap">
                        <div class="panelHead">
                            <div class="leftTitle">
                                关联事务
                            </div>
                            <div class="rightBtn">
                                <button class="btn primary">添加关联</button>
                            </div>
                        </div>
                        <div class="panelBody">
                            <!-- panelTableWrap 表格 -->
                            <div class="panelTableWrap">
                                <el-table class-name="table" ref="multipleTable" :data="relationList" tooltip-effect="dark" style="width: 100%"
                                          @selection-change="handleSelectionChange">
                                    <el-table-column type="selection" width="55">
                                    </el-table-column>
                                    <el-table-column label="关联事务">
                                        <template slot-scope="scope">
                                            {{ scope.row.ProcessIdName }}
                                        </template>
                                    </el-table-column>
                                    <el-table-column prop="CreatedOn" label="关联时间">
                                        <template slot-scope="scope">
                                            {{ scope.row.CreatedOn }}
                                        </template>
                                    </el-table-column>
                                    <el-table-column label="操作">
                                        <template slot-scope="scope">
                                            <button @click="handleClickPreview(scope.row)" type="text" class="btnText btnTextPrimary">查看</button>
                                            <button class="btnText btnTextPrimary">删除</button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </div>
                        </div>
                    </div>
                    <div class="panelWrap">
                        <div class="panelHead">
                            <div class="leftTitle">
                                备注和附件
                            </div>
                            <div class="rightBtn">
                                <button class="btn primary">添加附件</button>
                            </div>
                        </div>
                        <div class="panelBody">
                            <!-- panelTableWrap 表格 -->
                            <div class="panelTableWrap">
                                <el-table class-name="table" ref="multipleTable" :data="tableFiles" tooltip-effect="dark"
                                    style="width: 100%" @selection-change="selectRemarksChange">
                                    <el-table-column type="selection" width="55">
                                    </el-table-column>
                                    <el-table-column prop="FileExtension" label="类型">
                                        <template slot-scope="scope">{{ scope.row.FileExtension }}</template>
                                    </el-table-column>
                                    <el-table-column prop="Name" label="标题">
                                        <template slot-scope="scope">{{ scope.row.Name }}</template>
                                    </el-table-column>
                                    <el-table-column prop="CreatedOn" label="关联时间">
                                         <template slot-scope="scope">{{ scope.row.CreatedOn }}</template>
                                    </el-table-column>
                                    <el-table-column prop="createdByName" label="创建人">
                                        <template slot-scope="scope">{{ scope.row.createdByName || '' }}</template>
                                    </el-table-column>
                                    <el-table-column label="操作">
                                        <template slot-scope="scope">
                                            <button class="btnText btnTextDefault">编辑</button>
                                            <button @click="handleClickPreview(scope.row)" type="text"
                                                class="btnText btnTextPrimary">查看</button>
                                            <button class="btnText btnTextPrimary">删除</button>
                                            <button class="btnText btnTextPrimary" @click="handleDownloadUrl(scope.row.DownloadLinkUrl,scope.row.Name)">下载</button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 流转信息 -->
            <div class="container">
                <div class="panelWrap">
                    <div class="panelHead">
                        <div class="leftTitle">
                            详细信息
                        </div>
                        <div class="rightBtn">
                            <button class="btn">催办</button>
                        </div>
                    </div>
                    <div class="panelBody">
                        <!-- panelFlexBoxInfoWrap 信息展示 -->
                        <div class="panelFlexBoxInfoWrap">
                            <%--<div id="layoutview"></div>--%>
                            <%=ResultHTML%>
                           <%-- <div class="panelFlexBoxInfo">
                                <div class="rowInfo">
                                    <div class="label">
                                        督办:
                                    </div>
                                    <div class="value">
                                        02 差旅费报销审批单202004 项目管理部 余海
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        标题:
                                    </div>
                                    <div class="value">
                                        02 差旅费报销审批单202004 项目管理部 余海
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        流程分类:
                                    </div>
                                    <div class="value">
                                        公司
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        状态:
                                    </div>
                                    <div class="value">
                                        流转中
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        办理期限:
                                    </div>
                                    <div class="value">
                                        3
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        催办次数:
                                    </div>
                                    <div class="value">
                                        02 差旅费报销审批单202004 项目管理部 余海
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        优先级别:
                                    </div>
                                    <div class="value">
                                        紧急
                                    </div>
                                </div>
                            </div>
                            <div class="panelFlexBoxInfo">
                                <div class="rowInfo">
                                    <div class="label">
                                        督办提醒时间:
                                    </div>
                                    <div class="value rowEllipsis">
                                        02 差旅费报销审批单202004 项目管理部 余海
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        发起部门:
                                    </div>
                                    <div class="value rowEllipsis">
                                        项目管理部
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        流程名称:
                                    </div>
                                    <div class="value rowEllipsis">
                                        02 差旅费报销审批单
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        当前步骤:
                                    </div>
                                    <div class="value rowEllipsis">
                                        票据审核 财务部
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        逾期时间:
                                    </div>
                                    <div class="value rowEllipsis">
                                        2022-05-13
                                    </div>
                                </div>
                                <div class="rowInfo">
                                    <div class="label">
                                        附件数量:
                                    </div>
                                    <div class="value rowEllipsis">
                                        7
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="panelWrap">
                    <div class="panelHead">
                        <div class="leftTitle">
                            流转信息
                        </div>
                    </div>
                    <div class="panelBody">
                        <!-- panelTableWrap 表格 -->
                        <div class="panelTableWrap">
                            <el-table :data="rulelogList" style="width: 100%">
                                <el-table-column prop="FromActivityName" label="来源环节">
                                </el-table-column>
                                <el-table-column prop="ToActivityName" label="办理环节">
                                </el-table-column>
                                <el-table-column prop="ToIdentityName" label="应办人">
                                </el-table-column>
                                <el-table-column prop="ToIdentityName" label="实办人">
                                </el-table-column>
                                <el-table-column prop="SourceType" label="来源类型">
                                </el-table-column>
                                <el-table-column prop="CreatedByName" label="提交人">
                                </el-table-column>
                                <el-table-column prop="CreatedOn" label="分配时间">
                                </el-table-column>
                                <el-table-column prop="ModifiedOn" label="结束时间">
                                </el-table-column>
                                <el-table-column prop="TimeCost" label="办理时长">
                                </el-table-column>
                                <el-table-column prop="Deadline" label="期限">
                                </el-table-column>
                                <el-table-column prop="RuleLogStateCodeName" label="办理结果">
                                </el-table-column>
                                <el-table-column prop="Description" label="留言">
                                </el-table-column>
                            </el-table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 阅读记录 -->
            <div class="container">
                <div class="panelWrap">
                    <div class="panelHead">
                        <div class="leftTitle">
                            传阅记录
                        </div>
                    </div>
                    <div class="panelBody">
                        <!-- panelTableWrap 表格 -->
                        <div class="panelTableWrap">
                            <el-table :data="circulationRecord" style="width: 100%">
                                <el-table-column prop="start" label="序号">
                                </el-table-column>
                                <el-table-column prop="name" label="传阅人">
                                </el-table-column>
                                <el-table-column prop="address" label="传阅时间">
                                </el-table-column>
                                <el-table-column prop="address" label="IP地址">
                                </el-table-column>
                                <el-table-column prop="address" label="浏览器名称与版本">
                                </el-table-column>
                            </el-table>
                        </div>
                    </div>
                </div>
                <div class="panelWrap">
                    <div class="panelHead">
                        <div class="leftTitle">
                            浏览记录
                        </div>
                    </div>
                    <div class="panelBody">
                        <!-- panelTableWrap 表格 -->
                        <div class="panelTableWrap">
                            <el-table :data="readLogList" style="width: 100%">
                                <el-table-column prop="RowNumber" label="序号">
                                </el-table-column>
                                <el-table-column prop="OsName" label="传阅人">
                                </el-table-column>
                                <el-table-column prop="CreatedOn" label="传阅时间">
                                </el-table-column>
                                <el-table-column prop="IPAddr" label="IP地址">
                                </el-table-column>
                                <el-table-column prop="BrowserName" label="浏览器名称与版本">
                                </el-table-column>
                            </el-table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 讨论 -->
            <div class="container">
                <div class="panelWrap">
                    <div class="panelHead">
                        <div class="leftTitle">
                            传阅记录
                        </div>
                    </div>
                    <!-- 公共面板评论 -->
                    <!-- <div class="panelBody">
                        <div class="panelCommentWrap">
                            <div class="commentBox">
                                <div class="leftAvatar">
                                    <i class="iconfont icon-morentouxiang"></i>
                                </div>
                                <div class="rightTextare">
                                    <textarea placeholder-class="placeholder" placeholder="说点什么吧..." name="" id="" cols="30" rows="10"></textarea>
                                </div>
                            </div>
                            <div class="optionalWrap">
                                <button class="btn">取消</button>
                                <button class="btn primary">讨论</button>
                            </div>
                            <div class="commentList">
                                <div class="commentItemBox">
                                    <div class="leftAvatar">
                                        <i class="iconfont icon-morentouxiang"></i>
                                    </div>
                                    <div class="rightComment">
                                        <div class="commentName">张某某</div>
                                        <div class="commentContent">麻烦尽快审批。</div>
                                        <div class="commentTime">2022-05-03 17:42:43</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <Comment />
                </div>
            </div>
        </div>
    </div>
    <script src="/layouteditor/layout_view.js"></script>
    <script src="/js/alert.js"></script>
    <link href="/layouteditor/layout_main.css" rel="stylesheet" />
</body>
<%--<script src="/utils/jquery.min.js"></script>--%>

<script type="text/javascript" src="/utils/vue.js"></script>
<script type="text/javascript" src="/utils/index.min.js"></script>
<script type="text/javascript" src="/js/mixin.js"></script>
<script type="text/javascript" src="/js/detail.js"></script>
<script type="text/javascript">
    function bodyOnLoad() {
        setFocusOnLoad();
        //jQuery("#treeRootNode").height(jQuery("#lineItemView_wrapper").height());
        if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQxTkROYSx4c3dtLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&isAjaxRequest=1&renderMode=RETRO&nocache=1437552855562'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQyT1RSYSw2cDlmLE1HVXdaalF3"; };
    }
    function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
    function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }
</script>
<script type="text/javascript">
    var isSaved = false;
    var entityFile = "";
    var that = this
    $(document).ready(function () {
        entityFile = new entityAttachment();
        entityFile.getfileurl = 'process.instance.file.getlist'
        entityFile.getfiledata = {
            InstanceId: '<%=InstanceId%>',
            InstanceState: '<%=InstanceState%>',
            right: '<%=AttachRight%>'
        }
        that.entityFile.load();
    })
    // 导出pdf
    function printWin1() {
        var element = document.getElementById('iWFForm').contentWindow.document.documentElement;
        var opt = {
            margin: 1,
            filename: '<%=InstanceName%>.pdf',
            image: { type: 'jpeg', quality: 1 },
            html2canvas: { scale: 1 },
            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
        };
        html2pdf(element, opt);
    }
    // 委托
    function entrustOther() {
        var proceId = document.getElementById("_processId").value;
        var ruleLogId = document.getElementById("ruleLogId").value;
        var stepId = document.getElementById("stepId").value;
        var url = '/apps/wf/InstanceTranAgent.aspx?InstanceId=<%=InstanceId%>&processInstanceIduleLogId=<%=RuleLogId%>';
        ProcessopenchangeDiv(url)
        //ProcessopenchangeDiv(' + "'/apps/wf/InstanceTranAgent.aspx?InstanceId=" + processInstanceId +processInstanceIduleLogId + "&InstaruleLogId=" + InstanceIdName + "&ExecutorIdentityName=" + ExecutorIdentityName + "'" + ')"
    }
    //  催办
    function reminderRelated() {
        var url = '/apps/wf/NotifyMem.aspx?InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>';
        showInstanceDialog(url, 'reminderInfo', "催办", 400, 600);
    }
    // 传阅
    function circulateOthers() {
        //var id = getQueryString('id')
        var id = document.getElementById("instanceId").value;
        var url1 = '/apps/wf/forwardProcess.aspx?ids=' + id;
        parent.showDialog(url1, "forwardProcess", "批量传阅", 860, 550);
    }
    // 审批拒绝
    function rejectProcess() {
        //saveFormData(0);
        var processInstanceId = document.getElementById("instanceId").value;
        var proceId = document.getElementById("_processId").value;
        var ruleLogId = document.getElementById("ruleLogId").value;
        var stepId = document.getElementById("stepId").value;
        var url1 = "/apps/wf/ApproveReject.aspx?instanceId=" + processInstanceId + "&RuleLogId=" + ruleLogId + "&ProcessId=" + proceId + "&stepId=" + stepId;
        showDialog(url1, "ApproveReject", "审批拒绝", 850, 500);
    }
    // 结束流程
    function finishInstance() {
        var a = '确定要结束当前事务吗？';
        if (Modal.confirm(a)) {
            var intId = jQuery("#instanceId").val();
            var step = jQuery("#stepId").val();
            var log = jQuery("#ruleLogId").val();
            finishWF(intId, step, log, function (data) {
                //alert('ok');
                //window.location='/a0M/detail?source=l&id='+log;
                window.location = '/a0M/o';
            });
        }
        return false;
    }
    // 提交流转
    function submitNextStep(action) {
        if (action == 0) //审批拒绝
        {
            document.getElementById("dealAction").value = "0";
        }
        if (action == 1) //审批通过
        {
            document.getElementById("dealAction").value = "1";
        }
        saveFormData(1);
    }
    function saveFormData(action) {
        //d.frames['iWFForm'] ie,safari
        //
        var d = document;
        var f = d.frames ? d.frames['iWFForm'] : d.getElementById('iWFForm');
        var p = f.document || f.contentWindow;
        //debugger;  
        //var _frame = document.getElementById("iWFForm");
        //var contentWin = _frame.contentWindow || _frame.contentDocument;
        //if (contentWin.SaveFormData)
        //{
        //alert('ok');
        //}
        if (action == 0) {
            success('保存成功！')
        }
        if (p.SaveFormData) {
            //alert("firefox");
            if (p.validateForm(action)) {
                p.SaveFormData(action);
                success2("保存成功！");
                isSaved = true;
            }
        }
        else {
            if (window.frames['iWFForm'].validateForm) {
                if (window.frames['iWFForm'].validateForm(action)) {
                    window.frames['iWFForm'].SaveFormData(action);
                    success2("保存成功！");
                    isSaved = true;
                }
            }

        }
        return isSaved;
    }
</script>
<script>
    $(function(){
        $('.select').click(function(e){
            e.stopPropagation();
            $(this).toggleClass('active');
            $(this).find('.selectModal').toggle();
            $(this).find('.selectModal .dropMenuItem').click(function(){
                var val = $(this).html();
                $('.select .val').html(val)
            })
        })
        $('body').click(function(){
            $('.select').removeClass('active')
            $('.select').find('.selectModal').hide();
        })
        $('.upload .more').click(function(){
            $(this).find('.dropMenuWapper').toggle();
            $(this).find('.dropMenuWapper .dropMenuItem').click(function(e){
                e.stopPropagation();
                console.log($(this),'----')
                $(this).parents('.dropMenuWapper').hide();
            })
        })
        $(".notBorder .tab").click(function () {
            $(".notBorder .tab").removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            var currentTab = $(this).attr('currentTab');
            $('.center .container').hide();
            $('.center .container').eq(index).show();
        });
        var windowHeight = $(window).height();
        var headerHeight = $('.header').height();
        var bodyHeight = windowHeight - headerHeight - 50
        $('#ifrmflowMonitor').css('height', bodyHeight+'px')
    })
</script>
</html>