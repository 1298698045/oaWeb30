<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cntccard.aspx.cs" Inherits="Supermore.cntc.cntccard" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>通讯录 - 人力资源 ~  - Developer Edition</title>
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
            height:calc(100% - 107px);
            overflow:auto;
        }
        .card-photo img {
            width:70px;
            height:70px;
        }
        .miss-header{
            margin-top:10px;
            border-radius:4px 4px 0 0;
            background-color:#f3f2f2;
            padding:15px 15px;
        }
        .bodyDiv{
            border-top:1px solid #dedede !important;
        }
        .el-select-dropdown__item{
            margin-left:0;
        }
        .bottom-btn .el-checkbox{
            float:none !important;
        }
        .list-item .el-checkbox{
            margin-top:12px;
        }
        #iframe {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 999;
            height: 100%;
        }
        .el-menu-item{
            position:relative;
        }
        .el-menu-item .editbtn{
            display:none;
            float:right;
            position:absolute;
            right:10px;
            top:0;
        }
        .el-menu-item:hover .editbtn{
            display:block;
        }
        .list-item{
            cursor:pointer;
        }
        .list-item.active{
            background-color:#e3effd;
        }
        
        .list-item-main-tonglan{
            height:calc(100% - 120px)
        }
        .list-item-main-bianji{
            height:calc(100% - 165px)
        }
        .email-file li{
            position:relative;
        }
        .email-main-head-rightbtn i{
            margin-left:10px;
        }
        .el-menu-item.is-active{
            background-color:#ecf5ff;
        }
        .file-left img{
            width:30px;
            height:30px;
        }
        .bodyDiv {
            background-color:transparent;
            box-shadow:none;
        }
        .peopleout{
            background-color:white;
            border-radius:0px 0px 4px 4px;
            box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.3);
        }
        #vueapp {
        }
        .centre-head .el-input__inner{
            height:32px;
            width:calc(100% - 20px);
        }
        .centre-head .el-input__icon{
            line-height:32px;
        }
        .centre-head .el-date-editor .el-input__inner{
            width:135px;
        }
        .centre-head {
            display:flex;
        }
        .outcode .search-select {
            border:0;
            text-align:center;
            background-color:#f9f9fa;
            margin-left:35%;
        }
        .outcode .selectlist{
            margin-left:35%;


        }
        .outcode{
            position:relative;
            width:100%;
            background-color:#f9f9fa;
            margin:0;
        }
        html, body, #vueapp, .el-container, .el-aside,#contentWrapper{
            height: 100%;
        }
        .peopleout{
            height:100%;
        }
        .bodyDiv.brdPalette.brandPrimaryBrd {
            height: calc(100% - 210px);
        }
        .el-main{
            border-radius:0 0 4px 0 ;
        }
        .email-list{
            float:left;
            height: calc(100% - 95px);
            width:100%;
        }
        .list-item{
            margin-left:0;
        }
        .el-collapse-item__header{
            padding-left:26px;
            border-top:1px solid #EBEEF5;
            height:30px;
            line-height:30px;
            font-size:14px;
            background-color:#fafafa;
            position:relative;
        }
        .el-collapse-item__header.is-active{
            border-bottom:1px solid #EBEEF5;
        }
        .el-collapse-item__content{
            padding-bottom:0;
        }
        .el-collapse{
            border:0;
        }
        .el-collapse-item__wrap{
            border:0;
        }
        .el-collapse-item__arrow{
            position:absolute;
            left:9px;
        }
        .list-item-main{
            width:320px;
        }
        .sanlan, .tonglan{
            z-index:10;
        }
        .peopleoutlist-head{
            height:50px;
            line-height:50px;
            color:#333;
            font-size:12px;
            font-weight:700;
            background-color:#f9f9fa;
            padding-left:15px;
        }
        .peopleoutlist-head>div{
            float:left;
        }
        .email-main-body{
            padding:0;
        }
        .peopleoutlist-body>div{
            line-height:50px;
            color:#333;
            font-size:12px;
            padding-left:15px;
        }
        .peopleoutlist-body>div>div{
            float:left;
        }
        .email-main-head-rightbtn{
            padding:0;
        }
        .email-main-head-rightbtn i {
            margin-left: 0px; 
        }
        .email-main-head{
            padding:0 13px;
        }
        .el-input-number.is-controls-right .el-input__inner{
            padding:0 0 0 10px;
            text-align:left;
        }
        .el-input-number.el-input-number--mini.is-controls-right>span{
            width:15px;
            height:15px;
            line-height:15px !important;
        }
        .el-input-number.el-input-number--mini.is-controls-right>span i{
            margin-top:2px;
        }
        .el-input--mini .el-input__inner {
            height: 32px;
            line-height: 32px;
        }
        .email-main-head-rightbtn>div{
            margin-right:10px;
        }
        .el-tree-node.is-current.is-focusable{
            background-color:#e1f1fe;
            border-left:4px solid #108af9;
        }
        .search-input {
            border: 1px solid #dddbda;
            border-radius: 4px;
            width: 150px;
            background-color: white;
        }
        .search-cont>div{
            float:left;
            margin-left:10px;
        }
        .card-table {
            box-shadow: none;
            position: static;
            border: 0;
            height: auto;
        }
        .dept-tabs{
            float:left;
            width:48%;
            text-align:center;
            padding:13px 0;
            cursor:pointer;
            margin:0 1%;
        }
        .dept-tabs:hover{
            border-bottom:3px solid #108af9;
        }
        .dept-tabs.active{
            border-bottom:3px solid #108af9;
        }
        .caed-main{
            display:flex;
            flex-wrap:wrap;
            align-content: flex-start;
        }
        .card-item{
            width:calc(25% - 10px);
            border:1px solid #dedede;
            border-radius:4px;
            box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.1);
            height:auto;
            padding:10px;
            margin:5px;
        }
        .el-main{
            background-color:white;
        }
        .has-gutter th{
            background-color:#f9f9fa;
        }
        .caed-main {
            padding:10px;
        }
        .card-photo{
            background-color:#3399ff;
            width:70px;
            height:70px;
            border-radius:50%;
            line-height:70px;
            text-align:center;
            color:white;
            float:left;
        }
        .card-dept{
            width:100%;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        .card-title{
            float:left;
            width:calc(100% - 85px);
            margin-left:15px;
            margin-top:5px;
        }
        .card-item-photo{
            clear:both;
        }
         .card-name{
             color:#0070d2;
             font-size:14px;
             font-weight:700;
             line-height:24px;
         }
         .card-dept{
             color:#080707;
             line-height:18px;

          }
         .card-status{
             color:#999999;
             line-height:18px;
         }
         .card-item-photo{
             border-bottom:1px solid #dedede;
             padding:10px 0 5px 0 ;
         }
         .card-item-email{
             padding:5px 0;
         }
         .photo-title,.email-title{
             color:#666;
             line-height:20px;
         }
         .photo-body{
             color:#333;
             line-height:20px;
             font-weight:700;
         }
         .email-content{
             color:#0070d2;
             line-height:20px;
         }
         .card-item{
             height:195px;
             box-sizing:border-box;
         }
         .card-item{
             position:relative;
         }
         .card-btn{
             height:18px;
             width:18px;
             position:absolute;
             right:10px;
             top:10px;
             border:1px solid #dedede;
             border-radius:4px;
             cursor:pointer;
             padding:0;
         }
         .peopletype{
             line-height:30px;
             padding-left:10px;
             cursor:pointer;
         }
         .peopletype:hover{
             background-color:#F5F7FA;
         }
         .peopletype.active{
             background-color:#F5F7FA;
             border-left:4px solid #108af9
         }
         .el-popover{
             min-width:80px;
             text-align:left;
             padding:0;
         }
         .edit-list{
             padding:5px 10px;
         }
         .edit-list:hover{
             background-color:#f2f2f2;
             cursor:pointer;
         }
         .el-popover{
             z-index:100 !important;
         }
    </style>
    <script src="/js/jquery/jquery.fileDownload.js"></script>
  
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
                        <div class="buttonbtn newbtn" onclick="tempExcel()">下载模板</div>
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
                                     <img src="/img/cal/23.check_2(16x16).png" class="img2">
                                     <img src="/img/cal/20.table_1(14x14).png" class="img1">
                                 </li>
                                 <li class="card-table-div3 active">看板
                                     <img src="/img/cal/23.check_2(16x16).png" class="img2">
                                     <img src="/img/cal/20.kanban_1(14x14).png" class="img1">
                                 </li>
                             </ul>
                         </div>    
                     </div>
                     <div class="buttonbtn shuaxin"></div>
                     <div class="buttonbtn shaixuan ban" title="此筛选器不可用"></div>
                 </div>
                 <div class="clear"></div>

             </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="peopleout">
                <div id="vueapp">
                    <el-container>
                        <el-aside style="width:200px;height:100%;border-right:1px solid #dedede">
                            <div style="border-bottom:1px solid #dedede;">
                                <div @click="getpeople(1)" class="peopletype":class='{"active":getpeopletype==1}'>最近联系人</div>
                                <div @click="getpeople(2)" class="peopletype":class='{"active":getpeopletype==2}'>所有联系人</div>
                                <div @click="getpeople(3)" class="peopletype":class='{"active":getpeopletype==3}'>个人联系人</div>
                                <div class="clear"></div>
                            </div>
                            <div style="border-bottom:1px solid #dedede;">
                                <div @click="checkdept(1)" class="dept-tabs":class='{"active":chookdept==1}'>部门</div>
                                <div @click="checkdept(2)" class="dept-tabs":class='{"active":chookdept==2}'>小组</div>
                                <div class="clear"></div>
                            </div>
                             <el-tree
                              v-show="chookdept==1"
                              :data="data"
                              :props="defaultProps"
                              node-key="id"
                                ref="depttree"
                              @node-click="treeclick">
                              <span class="custom-tree-node" slot-scope="{ node,data }">
                                <img v-if="data.Chidren.length!=0" src="/img/images/floader.png" alt="" style="height:12px;"/>
                                <img v-if="data.Chidren.length==0" src="/img/images/floaderpeople.png" alt="" style="height:12px;"/>
                                <span>{{node.label}}</span>
                              </span>
                            </el-tree>
                            <el-tree v-show="chookdept==2" 
                                :data="groupdata" 
                                :props="defaultProps" 
                                node-key="id"
                                ref="grouptree"
                                @node-click="groupclick">
                            </el-tree>

                        </el-aside>
                        <el-main>
                            <div v-show="peoplelist.length==0"
                                style="text-align:center;position:relative;top:50%;font-size:20px;">暂没有数据</div>
                               <div style="height:100%;" v-show="peoplelist.length!=0">
                                   <div v-show="listtype=='card'" style="height:100%;" class="caed-main">
                                        <div class="card-item" v-for="item in peoplelist">
                                            <div class="card-item-head">
                                                <div class="card-photo">
                                                    <span v-if="item.PhotoUrl==''">{{item.fullName}}</span>
                                                    <span v-if="item.PhotoUrl!=''" style="font-size:16px;"><img :src="item.PhotoUrl"/></span>
                                                </div>
                                                <div class="card-title">
                                                    <div class="card-name">{{item.fullName}}</div>
                                                    <div class="card-dept">{{item.BusinessUnitIdName}}</div>
                                                    <div class="card-status">{{item.EmployeeId}}</div>
                                                </div>
                                            </div>
                                            <div class="card-item-photo">
                                                <div class="photo-title">手机号码</div>
                                                <div class="photo-body">{{item.MobilePhone}}</div>
                                            </div>
                                            <div class="card-item-email">
                                                <div class="email-title">电子邮件</div>
                                                <div class="email-content">{{item.InternalEMailAddress}}</div>
                                            </div>
                                            <%--<el-popover
                                                  placement="bottom"
                                                  width="50"
                                                  trigger="click">
                                                  <div>
                                                     <div class="edit-list" @click="peopleview(item.systemUserId)">详情</div>
                                                     <div class="edit-list" @click="peopleedit(item.systemUserId)">编辑</div>
                                                     <div class="edit-list" @click="peopledelete(item.systemUserId)">删除</div>
                                                  </div>
                                                  <el-button slot="reference" class="el-icon-caret-bottom card-btn"></el-button>
                                                </el-popover>--%>
                                        </div>
                                   </div>
                                   <div v-show="listtype=='list'" class="" style="height:100%;">
                                          <el-table
                                            :data="peoplelist"
                                            height="100%"
                                            style="width: 100%">
                                              <el-table-column
                                              type="selection"
                                              width="55">
                                            </el-table-column>
                                              <el-table-column width="100"label="">
                                                  <template slot-scope="scope">
                                                    <img style="width:40px;" :src="scope.row.PhotoUrl"></img>
                                                  </template>
                                                </el-table-column>
                                            <el-table-column
                                                sortable
                                              prop="fullName"
                                              label="姓名"
                                              width="180">
                                            </el-table-column>
                                            <el-table-column
                                              prop="BusinessUnitIdName"
                                              label="部门"
                                              width="180">
                                            </el-table-column>
                                              <el-table-column
                                              prop="JobTitle"
                                              label="职务"
                                              width="180">
                                            </el-table-column>
                                              <el-table-column
                                              prop="EmployeeId"
                                                  sortable
                                              label="工号"
                                              width="180">
                                            </el-table-column>
                                            <el-table-column
                                              prop="MobilePhone"
                                              label="手机号码">
                                            </el-table-column>
                                              <el-table-column
                                              prop="EMailAddress"
                                              label="电子邮件">
                                            </el-table-column>
                                              <el-table-column
                                              prop="createdOn"
                                                  sortable
                                              label="创建时间">
                                            </el-table-column>
                                              <el-table-column width="50"label="操作">
                                                  <template slot-scope="scope">
                                                      <el-popover
                                                      placement="bottom"
                                                      width="50"
                                                      trigger="click">
                                                      <div>
                                                         <div class="edit-list" @click="peopleview(scope.row.systemUserId)">详情</div>
                                                         <div class="edit-list" @click="peopleedit(scope.row.systemUserId)">编辑</div>
                                                         <div class="edit-list" @click="peopledelete(scope.row.systemUserId)">删除</div>
                                                      </div>
                                                      <el-button slot="reference" class="el-icon-caret-bottom card-btn"></el-button>
                                                    </el-popover>
                                                  </template>
                                                </el-table-column>
                                          </el-table>
                                   </div>
                            </div>
                       </el-main>
                    </el-container>
                </div>
            </div>
        </div>
    </div>   
    <div id="changeDiv">
        <iframe id="iframe" src="#"></iframe>
    </div>

     <script type = "text/javascript" >
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
        var vm = new Vue({
            el: '#vueapp',
            data: {
                chookdept: 1,
                getpeopletype: 1,
                listtype:'card',
                peoplelist:[],
                defaultProps: {
                    children: 'Chidren',
                    label: 'Name',
                    id: 'BusinessUnitId'
                
                },

            },
            created: function () {
                this.getpeople(1)
                this.getorganization()
                this.getgroup()
            },
            methods: {
                getorganization: function () {
                    var that = this
                    ajaxMethodGetData('sys.organization.tree', null, function (data) {
                        var data = data.listData
                        that.data = data
                    })
                },
                //获取部门下数据
                getpeoplelist: function (id) {
                    var that = this
                    ajaxMethodGetData('sys.user.search', { businessUnitId: id }, function (data) {
                        that.peoplelist=data.listData
                    })
                    this.getpeopletype = 0
                },
                //部门
                treeclick: function (data) {
                    this.$refs.grouptree.setCurrentKey(null)
                    this.getpeoplelist(data.BusinessUnitId)
                },
                checkdept: function (type) {
                    this.chookdept = type
                },
                //小组
                getgroup: function () {
                    var that = this
                    ajaxMethodGetData('sys.group.search', null, function (data) {
                        var data = data.listData
                        that.groupdata = data
                    })

                },
                groupclick: function (val) {
                    this.$refs.depttree.setCurrentKey(null)
                    var that = this
                    ajaxMethodGetData('sys.group.member.search', { groupId: val.GroupId }, function (data) {
                        that.peoplelist = data.listData
                    })
                    this.getpeopletype = 0

                },
                getpeople: function (type) {
                    var that = this
                    this.getpeopletype = type
                    if (this.$refs.depttree) {
                        this.$refs.depttree.setCurrentKey(null)
                        this.$refs.grouptree.setCurrentKey(null)
                    }
                    if (type == 1) {
                        ajaxMethodGetData('user.latestuse.getlist', null, function (data) {
                            that.peoplelist = []
                            for (var i = 0; i < data.listData.length; i++) {
                                var res = data.listData[i]
                                that.peoplelist.push({
                                    fullName: res.FullName,
                                    BusinessUnitIdName: res.BusinessUnitIdName,
                                    EmployeeId: res.EmployeeId,
                                    PhotoUrl: res.PhotoUrl,
                                    MobilePhone: res.MobilePhone,
                                    InternalEMailAddress: res.InternalEMailAddress,
                                })
                            }
                        })

                    } else if (type == 2) {
                        ajaxMethodGetData('sys.user.search', null, function (data) {
                            that.peoplelist = []
                            for (var i = 0; i < data.listData.length; i++) {
                                var res = data.listData[i]
                                that.peoplelist.push({
                                    fullName: res.FullName,
                                    BusinessUnitIdName: res.BusinessUnitIdName,
                                    EmployeeId: res.EmployeeId,
                                    PhotoUrl: res.PhotoUrl,
                                    MobilePhone: res.MobilePhone,
                                    InternalEMailAddress: res.InternalEMailAddress,
                                })
                            }
                        })
                    } else if (type == 3) {
                        ajaxMethodGetData('contact.owner.getlist', null, function (data) {
                            that.peoplelist = []
                            for (var i = 0; i < data.length; i++) {
                                var res = data[i]
                                that.peoplelist.push({
                                    fullName: res.fullname,
                                    BusinessUnitIdName: res.department,
                                    EmployeeId: '',
                                    PhotoUrl: res.PhotoUrl,
                                    MobilePhone: res.mobilephone,
                                    InternalEMailAddress: res.emailaddress1,
                                })
                            }
                        })
                    }
                    
                },
                peopleedit: function (id) {

                },
                peopleview: function (id) {

                },
                peopledelete: function (id) {
                    $('#changeDiv').show()
                    $('#iframe').attr('src','/alert/delete.html?id='+id).show()
                },
            }
        })
        

    </script>
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>
    <script>
        //搜索
        $('#srchText').keyup(function (event) {
            if (event.keyCode == '13') {
                d = {
                    search: $(this).val()
                }
                ajaxMethodGetData('sys.user.search', d, callback)
                function callback(data) {
                    vm.peoplelist = data.listData
                }
            }
        })
        $('.card-table-div2').click(function () {
            vm.listtype='list'
        })
        
        $('.card-table-div3').click(function () {
            vm.listtype = 'card'
        })
        $(document).ready(function () {
            
        })

        function importExcel() {
            var url = "/alert/ImportExcel.aspx?ObjectType=MyContact";
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

    </script>
</body>
</html>
<!-- page generation time: 203ms -->


