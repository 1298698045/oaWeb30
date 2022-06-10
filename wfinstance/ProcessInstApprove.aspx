<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcessInstApprove.aspx.cs" Inherits="WebClient.wfinstance.ProcessInstApprove" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>流程相关查看</title>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />

    <link href="/layui/layui/css/layui.css" rel="stylesheet" />
    <link href="/css/cntrt/cntrt.css" rel="stylesheet" />
    <link href="/css/cal/mission.css" rel="stylesheet" />
    <link href="/css/cal/card.css" rel="stylesheet" />
    <link href="/css/file.css" rel="stylesheet" />
    <link href="/layouteditor/layout_main.css" rel="stylesheet" />

    <style>
        body {
            font-size:14px;
            color:#333;
        }
        * {
            margin:0;
            padding:0;
        }
        .clear {
            clear:both;
        }
        .head {
            position:fixed;
            top:0; 
            width:100%;
            padding:15px 5px 0 20px;
            border-bottom:1px solid #dedede;
            background-color:white;
            z-index:10;
        }
        .head-img img {
            width:45px;
        }
        .left {
            float:left;
        }
        .right {
            float:right;
        }
        .head-title {
            margin-left:8px;
        }
        .head-nav {
            margin-top:5px;
        }
        .head-navitem {
            margin-right:30px;
            font-size:12px;
            color:#555;
            padding:8px;
            cursor:pointer;
        }
        .head-navitem.active{
            color:#67aff7;
            border-bottom:2px solid #2db7f5;
        }
        .head-navitem:hover{
            color:#67aff7;
        }
        .head-right {
            margin-right:30px;
            margin-top:15px;
        }
        .post,.save{
            color: #fff;
            background-color: #2db7f5;
            border-color: #2db7f5;
            padding:6px 15px;
            border-radius:4px;
            margin-right:10px;
            cursor:pointer;
            width:auto;
        }
        .body {
            background-color:#f3f2f2;
            padding:30px;
            margin-top:70px;
        }
        .body-item {
            border-radius:8px;
            background-color:white;
        }
        .body-item-title {
            font-size:20px;
            text-align:center;
            line-height:40px;
            padding:10px;
            color:#465885;
        }
        .body-item-title-name {
            font-size:24px;
            line-height:50px;
        }
        .message-form {
            color:#344265;
        }
        .body-item-head {
            border-bottom:1px solid #dedede;
            line-height:50px;
            padding:0 40px;
        }
        .form-item {
            padding:0 2%;
            margin-top:10px;
            display:flex;
        }
        .form-item-title {
            width:150px;
            line-height:30px;
            color:#465885;
        }
        .form-item-contert {
            line-height:30px;
            width:calc(100% - 152px);
        }
        .body-item-body {
            padding-bottom:50px;
            padding-top:10px;
            
        }
        .searchimg {
            position: absolute;
            width: 14px;
            height: 14px;
            right: 8px;
            top: 8px;
            cursor: pointer;
        }
        .form-item-contert input,.form-item-contert select {
            width:100%;
            border:0;
            outline:none;
            height:28px;
            line-height:28px;
            font-size:12px;
            color:#333;
            border:1px solid #d7dff2;

        }
        .body-item-head {
            color: #344265;
        }
        .body-item-nav {
            border-bottom:1px solid #dedede;
        }
        .body-item-nav-item {
            float:left;
            padding:5px;
            margin:0.5px;
            background-color:#f2f2f2;
            position:relative;
            top:2px;
            cursor:pointer;
        }
        .body-item-nav div:first-child {
            margin-left:0;
        }
        .body-item-nav-item.active{
            border:1px solid #dedede;
            border-radius:2px;
            border-top:2px solid #2db7f5;
            border-bottom:0;
            background-color:white;
        }
        .body-table {
            padding:5px 40px 40px 40px;
        }
        .form-textarea {
            margin-top:40px;
        }
        .form-textarea .title{
            color:#465885;
            line-height:90px;
            width:10%;
        }
        .form-textarea textarea {
            height:90px;
            width:89%;
        }
        .file {
            margin-top:50px;
        }
        .file .title{
            color:#465885;
            line-height:30px;
            width:10%;
        }
        .updatabtn {
            border:1px solid #dedede;
            border-radius:2px;
            cursor:pointer;
            padding:5px 10px;
        }
        .updatabtn:hover{
            border-color:#2db7f5;
        }
        .table-main {
            margin-top:50px;
        }
        .red{
            color:red;
        }
        .body-right .body-item{
            padding:10px;
            padding-left:0;
            box-sizing:border-box;
        }
        .upfile{
            display:none;
        }
        .icon-duihao img{
            margin-top:0 !important;
        }
        #layout_related{
            width:100%;
        }
        .related-item-body .sanjiao img {
            position:absolute;
        }
    </style>
    <script src="/js/jquery/1.12.4.jquery.min.js"></script>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />
    <script src="/js/CommonUtils.js"></script>
    <script src="/js/laydate/laydate.js"></script>
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>





    <link href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/elements.css" rel="stylesheet" />
    <script src="/static/js/perf/stub.js"></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script>        window.sfdcPage = new DetailPage("70190000000WFpH");
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411496412000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-26 下午2:13", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
     </script>
    <style>
        .datagrid-cell, .datagrid-cell-group, .datagrid-header-rownumber, .datagrid-cell-rownumber {
            height:50px;
        }
        .datagrid-cell-rownumber {
            line-height:50px;
        }
        .search-select.selectinput {
            width:100%;
        }
        .search-input img {
            top:10px;
        }
        .search-lookup {
            z-index:10000;
        }
        .search-lookup{
            width:auto;
            margin-left:-2px;
            margin-top:2px;
        }
        .search-lookup li{
            padding-right:30px;
            white-space:nowrap;
        }
        .selectlist {
            display: none;
            margin-top: 3px;
            margin-left: 0px;
            position: absolute;
            border: 1px solid #dddbda;
            box-shadow: 0px 0px 6px 0px rgba(0, 0, 0, 0.16);
            background-color: #fff;
            padding: 5px 0;
            border-radius: 4px;
            z-index: 1000;
            width:auto;
        }
        .selectlist img{
            width:16px;
            margin-top:2px;
        }
        .selectlist li.active img{
            /*display:block;
            position:absolute;
            margin-left:-25px;
            margin-top:8px*/
        }
        .selectlist li.active{
            /*background:none !important;*/
        }
        .selectlistcheck li {
            padding:0 10px 0 40px !important;
            
        }
        .selectlist li.active:hover{
            /*background-color:#f2f2f2 !important;*/
        }
        .search-group {
            width:90%;
            margin-left:5% !important;
        }
        .search-group .search-input {
            width:100% !important;
        }
        .search-select.selectinput {
            padding:0;
            width:auto;
            padding-right:5px;
        }
        .search-select.selectinput span{
            margin-left:5px;
        }
        .search-select.selectinput img{
            position:static;
        }
        .datagrid-header, .datagrid-td-rownumber {
            background:no-repeat;
            background-color:#F2F2F2;
            filter:none;
        }
        .itemcol{
            flex:1;
            margin:0 50px;
        }
        .layui-input-block{
            margin-left:0;
        }
        .searchselect .layui-edge{
            display:none;
        }
        .popup-mask {
            position: fixed;
            left: -10px;
            width: 110%;
            top: 0;
            z-index: 100;
            background-color: #000;
            opacity: 0.4;
            height: 100%;
            width: 100%;
            display: none;
        }
        #iframe {
            display:none;
            height: 620px;
            margin-top: -310px;
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            height: 620px;
            border: 0;
        }
        .body-left{
            width:70%;
            float:left;
        }
        .body-right{
            float:left;
            width:29%;
            margin-left:1%;
        }
        .body::after{
            content:'';
            display:block;
            clear:both;
        }
        .missionright-file-type .shituu{
            width:150px !important;
        }
        .missionright-body{
            border-top:1px solid #dedede;
        }
        .missionright-head{
            padding-bottom:10px !important;
        }
        .missionright-head>span,.missionright-head>p{
            margin-top:5px;
            display:inline-block;
        }
        #btnUploadfile{
            margin-top:0;
        }
        .missionright-head:after{
            display:block;
            content:'';
            clear:both;
        }
        #downfile-all{
            margin-top:0 !important;
            margin-left:10px !important;
        }
        .shuaxin{
            background:none;
        }
        .sanjiao {
            width: 20px !important;
            height: 20px !important;
            padding: 0 !important;
            margin-top: 5px;
            overflow: visible !important;
            position:static;
            float: right;
            border: 1px solid #e4e8eb;
            border-radius: 4px;
        }
        .missionright-body li .div1{
            float: left;
            margin-top: 5px;
            margin-left:10px;
        }
        .missionright-body li{
            padding:10px 5px;
        }
        .selectlist{
            width:100%;
            left:0;
        }
        .file-preview-type img{
            margin-top:0;
        }
        .file-preview-head-right img{
            margin-top:0;
        }
        .section{
            display:none;
            background-color:white;
        }
        .clear{
            clear:both;
        }
        .section.active{
            display:block;
        }
        #ef_taolun1{
            width:100%;
            height:500px;
        }
        .layui-table-view{
            background-color:white;
        }
        .head-right a{
            color:white;
        }
        .editbox a{
            cursor:pointer;
        }
        .noevent{
            pointer-events:none;
        }
        .event{
            pointer-events:all;
        }
        #iWFForm{
            min-height:400px;
        }
        .close{
            display:none;
            position:fixed;
            top:15px;
            right:20px;
            color:#666;
            font-size:30px;
            cursor:pointer;
            z-index:10;
        }
        .relatedcontent{
            border: 1px solid #dedede;
            border-top: 3px solid #b0adab;
            border-radius: 2px;
        }
        .relatedcontent .layui-form.layui-border-box.layui-table-view{
            border-width:0;
            margin:0;
        }
        .relatedcontent .layui-table-view .layui-table{
            width:100%;
        }
        .relatedcontent .missionright-head{
            padding-bottom:15px !important;
        }
        .cannotedit{
            display:none !important;
        }
        .related-item {
            margin-top: 15px;
        }
        .related-item-body li div {
            width: 117px;
        }
        .related-item-head {
    padding-bottom: 5px;
}
        .lookall{
            border-top:0;
        }
    </style>
</head>
<body>
    <input type="hidden" name="_processId" id="_processId" value="<%=ProcessId%>" />
    <input type="hidden" name="splitType" id="splitType" value="<%=StepSplitType%>" />
    <input type="hidden" name="ruleLogId" id="ruleLogId" value="<%=RuleLogId%>" />
    <input type="hidden" name="instanceId" id="instanceId" value="<%=InstanceId%>" />
    <input type="hidden" name="fromActivityId" id="fromActivityId" value="<%=FromActivityId%>" />
    <input type="hidden" name="stepId" id="stepId" value="<%=StepId%>" />
    <input type="hidden" name="InstanceStatusCode" id="InstanceStatusCode" value="<%=InstanceState%>" />
    <input type="hidden" name="EntityObjectType" id="EntityObjectType" value="<%=EntityObjectType%>" />
    <input type="hidden" name="dealAction" id="dealAction" value="1" />
    <div style="margin:0;height:1px"></div>
    <div class="head">
        <div class="head-left left">
            <div class="head-img left">
                <img src="/img/newreimbilledit.png" alt="Alternate Text" />
            </div>
            <div class="head-middle left">
                <div class="head-title">流程</div>
                <div class="head-nav">
                    <div class="left head-navitem active">表单信息</div>
                    <div class="left head-navitem">流程图</div>
                    <div class="left head-navitem">详细信息</div>
                    <div class="left head-navitem">相关事务</div>
                    <div class="left head-navitem">相关列表</div>
                    <div class="left head-navitem">流转信息</div>
                    <div class="left head-navitem">附件列表</div>
                    <div class="left head-navitem">阅读记录</div>
                    <div class="left head-navitem">讨论</div>
                </div>
            </div>
          </div>
            <div class="head-right right">
                <div class="post left">
                    <a target="_blank" href="#" id="zhengwen">表单正文</a>
                </div>
                <div class="post left">
                    <a target="_blank" href="#" id="printzhengwen">打印表单</a>
                </div>
                <%--<div class="post left">
                    <span id="guanlianshiwu">关联事务</span>
                </div>--%>
                <div class="post left">
                    <span id="guanlianliucheng">关联流程</span>
                </div>
                <div class="post left" onclick="reminderRelated()">催办
                </div>
                <div class="post left" onclick="submitNextStep(1)">提交流转
                </div>
                <div class="save left" onclick="saveFormData(0);">保存表单
                </div>
            </div>
        </div>
    <div class="body layui-form">
        <%--<div class="body-item body-item-title">
            <div class="body-item-title-name">日常费用报销</div>
        </div>--%>
        <div class="section active">
            <div class="body-left">
            <iframe id="iWFForm" width="100%" height="100%" frameborder="0" src="/apps/wf/WfFormEdit.aspx?InstanceId=d9235b64-5119-42b7-9662-e8d1ad7a268f&RuleLogId=d9235b64-5119-42b7-9662-e8d1ad7a268f&isPreview=0"></iframe>
        </div>
            <div class="body-right">
            <div class="body-item">

                <div class="relatedcontent">
                <div class="missionright-head"><img class="headicon" src="/img/cal/9.png" alt=""><span>相关事务</span></div>
            <table id="relatedlist2" lay-filter="relatedlist2"></table>

                </div>
                </div>

            <div class="body-item">
                <div id="filecontent">
                  
                </div>
            </div>
        </div>
            <div class="clear"></div>
        </div>
        <div class="section">
            <iframe id="monitoriframe" width="100%" height="450" frameborder="0" src="/apps/flowdesigner/editors/monitor2.aspx?schemeId=518b9806-e11a-4ea9-919b-56d23e8838fe&InstanceId=19483efe-7fe8-4b82-982a-a0dcfc6606ec"></iframe>
       
        </div>
        <div class="section">
            <div id="layoutview"></div>
        </div>
        <div class="section">
            <table id="relatedlist" lay-filter="relatedlist"></table>
        </div>
        <div class="section" style="padding:0 20px 20px">
            <table id="layout_related" lay-filter="relatedlist"></table>
        </div>
        <div class="section">
            <table id="ruleloglist" lay-filter="ruleloglist">
            </table>
        </div>
        <div class="section">
            <table id="filttablelist" lay-filter="filttablelist">
            </table>
        </div>
        <div class="section">
            <table id="readloglist" lay-filter="readloglist"></table>
        </div>
        <div class="section">
            <iframe id="ef_taolun1"  src="/chatter/relatedchatter.html" frameborder="0"></iframe>
        </div>

    </div>
    <div class="popup-mask"></div>
    <iframe id="iframe" frameborder="0"></iframe>
    
    <script>
        var obj = {
            ObjectTypeCode:122
        }
        function shareIframeImg(i) {
            var img = $(i.contentWindow.document).find("img")
            img.width("100%")
            img.css("max-width", "100%")
        }
    </script>
    <%--<script src="/js/entityDetail.js"></script>--%>


    
    <div class="close event">×</div>
    <script src="/layui/layui/layui.js"></script>
    <script src="/js/alert.js"></script>
    <script>
        var obj = {
            ObjectTypeCode:'<%=EntityObjectType%>'
        }
    </script>
    <script src="/js/component.js"></script>
    <script>
        var entityFile
        $(document).ready(function(){
            entityFile = new entityAttachment();
            entityFile.getfileurl = 'process.instance.file.getlist'
            entityFile.getfiledata = {
                InstanceId: '<%=InstanceId%>',
                InstanceState: '<%=InstanceState%>',
                right: '<%=AttachRight%>'
            }
            entityFile.load();
        })
        var view = getQueryString('view')
        var cannotedit  = ''
        if (view == 3) {
            cannotedit = 'cannotedit'
            $('.head-right').hide()
            $('.close').show()
            $('.close').click(function () {
                parent.$('.popup-mask').hide()
                parent.$('#iframe').hide()
            })
            $('#ef_taolun1').attr('src', '/chatter/relatedchatter.html?view=3')
        }

        var table
        layui.use('table', function () {
            table = layui.table;
        });
        
        $(document).ready(function () {
            $('#ef_taolun1').height($(window).height() - 135)
        })
        
        $('.head-navitem').click(function () {
            $('.head-navitem').removeClass('active')
            $(this).addClass('active')
            $('.section').removeClass('active')
            $('.section').eq($(this).index()).addClass('active')
            $('#monitoriframe').height($('#monitoriframe').contents().find('body').outerHeight(true))
            table.resize()
        })

        

        $(document).ready(function () {
            sfdcPage.executeOnloadQueue();
            $('#iWFForm').attr('src', '/apps/wf/WfFormEdit.aspx?InstanceId=' + $('#instanceId').val() + '&RuleLogId=' + $('#ruleLogId').val() + '&&isPreview=1')
            $('#iWFForm').load(function () {
                $('#iWFForm').height($('#iWFForm').contents().find('body').outerHeight(true))
            })
            $('#zhengwen').attr('href', '/jgfiles/samples/OpenAndSave_Word.aspx?id=' + $('#instanceId').val() + '&filesource=2&EditType=1&organizationid=' + $('#organizationid').val())
            $('#printzhengwen').attr('href', '/apps/wf/WFFormPrint.aspx?InstanceId=' + $('#instanceId').val())
           
            $('#guanlianliucheng').click(function () {
                opencenterwindow('/alert/wf/relateInstance.html?InstanceId=' + $('#instanceId').val(), '', 1000, 600)
            })
            $('#guanlianshiwu').click(function () {
                openPopup('/apps/wf/addRelatedInsts.aspx?instanceid=' + $('#instanceId').val() + '&pid='+ $('#instanceId').val()+'&type=30022', 'doc', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
            })
            getrulelog()
            getreadlog()
            getrelated()
        })
     
        

        function getrulelog() {
            ajaxMethodGetData('process.instance.rulelog.getlist', {
                processInstanceId: $('#instanceId').val(),
            }, function (data) {
                table.render({
                    elem: '#ruleloglist',
                    height: $(window).height() - 152,
                    data: data.rows,
                    cols: [[
                       //{ field: 'EmployeeNo', title: '操作', width: 80 },
                       { field: '', title: '序号', width: 60, type: 'numbers' },
                       { field: 'FromActivityName', title: '来源环节', width: 150 },
                       { field: 'ToActivityName', title: '办理环节', width: 150 },
                       { field: 'ToIdentityName', title: '应办人', width: 100 },
                       { field: 'ExecutorIdentityName', title: '实办人', width: 100 },
                       { field: 'SourceType', title: '来源类型', width: 100 },
                       { field: 'CreatedByName', title: '提交人', width: 100 },
                       { field: 'CreatedOn', title: '创建时间', width: 160 },
                       { field: '', title: '结束时间', width: 160 },
                       { field: 'Deadline', title: '期限', width: 100 },
                       { field: '', title: '办理结果', width: 100 },
                       { field: 'Description', title: '留言', width: 180 },
                    ]]
                });
            })
        }

        function getreadlog() {
            ajaxMethodGetData('process.instance.readlog.getlist', {
                processInstanceId: $('#instanceId').val(),
            }, function (data) {
                table.render({
                    elem: '#readloglist',
                    height: $(window).height() - 152,
                    data: data.rows,
                    cols: [[
                       //{ field: 'EmployeeNo', title: '操作', width: 80 },
                       { field: 'RowNumber', title: '序号', width: 60 },
                       { field: 'OsName', title: '阅读人', width: 100 },
                       { field: 'ModifiedOn', title: '阅读时间', width: 160 },
                       { field: 'IPAddr', title: 'IP地址', width: 150 },
                       { field: 'BrowserName', title: '浏览器名称与版本', width: 200 },
                    ]]
                });

            })
        }

        function getrelated() {
            var editbtnwidth = 120
            if (cannotedit == 'cannotedit') {
                editbtnwidth = 60
            }
            ajaxMethodGetData('process.instance.related.getlist', {
                processInstanceId: $('#instanceId').val(),
            }, function (data) {
                table.render({
                    elem: '#relatedlist',
                    height: $(window).height() - 152,
                    data: data.rows,
                    cols: [[ 
                       {
                           field: '', title: '操作', width: editbtnwidth, templet: function (d) {
                               console.log(d)
                               return '<div class="editbox"><a target="_blank" href="/wfinstance/ProcessInstApprove.aspx?source=i&objectTypeCode=122&id=' + d.ProcessInstanceId + '&view=' + getQueryString('view') + '">查看</a>'
                               + '<a class="'+cannotedit+'" onclick="deleterelated(\'' + d.LIST_RECORD_ID + '\')">&nbsp&nbsp|&nbsp&nbsp删除</a></div>'
                           }
                       },
                       {
                           field: 'Name', title: '关联事务', templet: function (d) {
                               return '<a target="_blank" href="/wfinstance/ProcessInstApprove.aspx?source=i&objectTypeCode=122&id=' + d.ProcessInstanceId + '&view='+getQueryString('view')+'">' + d.Name + '</a>'
                           }
                       },
                    ]]
                    
                });
                table.render({
                    elem: '#relatedlist2',
                    data: data.rows,
                    cols: [[
                       {
                           field: '', title: '操作', width: editbtnwidth, templet: function (d) {
                               return '<div class="editbox"><a target="_blank" href="/wfinstance/ProcessInstApprove.aspx?source=i&objectTypeCode=122&id=' + d.ProcessInstanceId + '&view=' + getQueryString('view') + '">查看</a>'
                               + '<a class="' + cannotedit + '" onclick="deleterelated(\'' + d.LIST_RECORD_ID + '\')">&nbsp&nbsp|&nbsp&nbsp删除</a></div>'
                           }
                       },
                       {
                           field: 'Name', title: '关联事务', templet:function(d) {
                               return '<a target="_blank" href="/wfinstance/ProcessInstApprove.aspx?source=i&objectTypeCode=122&id=' + d.ProcessInstanceId + '&view=' + getQueryString('view') + '">' + d.Name + '</a>'
                           }
                       },
                    ]]

                });
            })
        }

        function deleterelated(id) {
            layer.open({
                title: '删除',
                content: '是否确认删除关联事务',
                yes: function (index, layero) {
                    ajaxMethodGetData('process.instance.related.delete', { id: id },function() {
                        success2('删除成功')
                        getrelated()
                        layer.close(index)
                    })
                }
            })
        }
       

        var isSaved = false

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
        function reminderRelated() {
            var url = '/apps/wf/NotifyMem.aspx?InstanceId=<%=InstanceId%>&RuleLogId=<%=RuleLogId%>';
            showInstanceDialog(url, 'reminderInfo', "催办", 400, 600);
        }
        function showInstanceDialog(url, dialogName, dialogTitle, width, height) {
            var c = b = null;
            c = dialogName; // "notifyInstance";
            //debugger;
            b = url;
            var dialog = null;
            //var dialog = new CollaborationAccessibleDialog(c, '催办', b, 450, 530);
            if (!dialogs[c]) {
                dialog = new NonaccessibleDialog(c, dialogTitle, b, width, height); //CollaborationAccessibleDialog
                dialogs[c] = dialog;
            }
            else {
                dialog = dialogs[c];
                dialog.url = b;
            }
            dialog.display();
        }
        
        
    </script>
    <script src="/layouteditor/layout_view.js"></script>
    
</body>
</html>
