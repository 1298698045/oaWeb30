<%@ Page Language="C#" AutoEventWireup="true"  %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议参会人员 - 会议管理 ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/css/mission-header.css">
    <link rel="stylesheet" href="/css/cal/mission.css">
    <link rel="stylesheet" href="/css/cntrt/cntrt.css">
    <link rel="stylesheet" href="/css/cal/newmission.css">
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        .recurrenceFrequency {
            margin: 0;
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
            .objectManagerLeftNav{
                position:relative;
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
        .cont-status-check img{
            height:15px;
            width:15px;
            margin-left:15px;
            cursor:pointer;
        }
        .cont-status-check {
            cursor:pointer;
            
        }
        
.pulldown-menu-contstatus {
    padding-top:10px;
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
    font-size:14px;
    display:none;
}
.pulldown-menu-contstatus>div{
    margin-left:20px;
}
.pulldown-menu-contstatus>li img{
    width:14px;
    height:14px;
    margin-right:20px;
    visibility:hidden;
}
.pulldown-menu-contstatus>li.active img{
    visibility:visible;
}
.pulldown-menu-contstatus>li{
    padding-left: 20px;
    height: 42px;
    line-height: 42px;
    margin-top: 5px;
    cursor:pointer;
}
.pulldown-menu-contstatus>li:hover{
    background-color:#f2f2f2;
}
.mission-header{
    overflow:visible
}
        
        #gridContainer {
            width:100%;
        }
        .inputdate,#Button1{
            border:1px solid #e6e6e6 !important;
            border-radius:4px;
            text-indent:5px;
        }
        #Button1 {
            margin-right:10px;
            width:150px;
            height:32px;
            cursor:pointer;
            text-align:left;
        }
        .sousuo-tishi {
            top:45px;
            left:570px;
        }
        .sousuo-tishi1 {
            top:30px;
            left:590px;
        }
        .StateCodename {
            float:left;
            margin-top:8px;
            margin-right:3px;
        }
        .select {
            display:none;
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
        .select div:hover{
            background-color:#f5f5f5
        }
    </style>
    <style>
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
    </style>
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
                <tr>

                    <td class="oRight" id="bodyCell">
                        <div class="bPageTitle">
                            <div class="ptBody">
                                <div class="links"></div>
                            </div>
                        </div>
                        <div id="bodyWrapper">
                            <div class="pulldown-menu-contstatus">
                                        <div>列表视图</div>
                                        <li class="active"><img src="/img/cal/23.check_1(14x14).png" /><span>会议参会人员</span></li>
                                        <li><img src="/img/cal/23.check_1(14x14).png" /><span>我的执行中的合同</span></li>
                                        <li><img src="/img/cal/23.check_1(14x14).png" /><span>我的已过期的合同</span></li>
                                        <li><img src="/img/cal/23.check_1(14x14).png" /><span>我的审批中的合同</span></li>
                                        <li><img src="/img/cal/23.check_1(14x14).png" /><span>我的草稿合同</span></li>
                                        <li><img src="/img/cal/23.check_1(14x14).png" /><span>最近查看</span></li>
                                    </div>  
                            <div class="mission-header mission-header1">
                                <div class="mission-header-leftlogo">
                                    <p class="logo">
                                        <img src="/img/cal/hetongguanli.png" alt="" />
                                    </p>
                                    <div>会议室预约记录</div>
                                        <!--<p class="cont-status-check"><span>到期合同</span><img src="/img/cal/20.png"  /></p>       -->                                                              
                                </div>

                                <div class="mission-hearder-message">
                                    <p>25个项目 · 已在5 分钟前更新</p>
                                </div>

                                <div class="mission-hearder-right">
                                    <!--<p class="newmissq"><a href="/800/e?retURL=%2f800%2f/o">新建合同</a></p>-->
                                    <div class="clear"></div>
                                    <div>
                                   
                                    <span style="float:left;"><span class="StateCodename">响应状态：</span>
                                        <!--<input id="Button1" style="border:solid rgb(71,71,71) 1px;height:30px;" type="button" value="请选择状态">
                                        <input onchange="Search();" id="srt_StateCode" name="srt_StateCode" style="border:solid rgb(71,71,71) 1px;height:30px;" type="hidden" searchcolumn="true" datafield="StatusCode" dataope="eq">-->
                                        <select name="StatusCode" id="StatusCode" searchcolumn="true" datafield="StatusCode" dataope="eq" style="width:70px;">
                                             <option value="">所有</option>
                                            <option value="0">未响应</option>
                                            <option value="1">已接受</option>
                                            <option value="2">已拒绝</option>
                                        </select>
                                    </span><!--
                                    <div class="select">
                                         <div statuscode="0">未响应</div>
                                         <div statuscode="1">已接受</div>
                                         <div statuscode="2">已拒绝</div>                                       
                                    </div>-->
                                     <span style="float:left;">参会人：
                                        
                                            <input type="hidden" value="" id="InviteeId_lkid" name="InviteeId_lkid" searchcolumn="true" datafield="InviteeId" dataope="eq"><input type="hidden" value="" id="InviteeId_lkold" name="InviteeId_lkold"><input type="hidden" value="8" id="InviteeId_lktp" name="InviteeId_lktp"><input type="hidden" value="1" id="InviteeId_lspf" name="InviteeId_lspf"><input type="hidden" value="0" id="InviteeId_lspfsub" name="InviteeId_lspfsub"><input type="hidden" value="1" id="InviteeId_mod" name="InviteeId_mod"><span class="lookupInput"><input type="text" value="" tabindex="4" size="10" onchange="getElementByIdCS('InviteeId_lkid').value='';getElementByIdCS('InviteeId_mod').value='1';" name="InviteeId" maxlength="255" id="InviteeId" class="inputdate" style="border:solid rgb(71,71,71) 1px;height:30px;"><a title="参会人 查找（新窗口）" tabindex="4" onclick="setLastMousePosition(event)" id="ManagerId1_lkwgt" href="javascript:openLookup('/_ui/common/data/LookupPage?lkfm=editPage&amp;lknm=InviteeId&amp;lktp=' + getElementByIdCS('InviteeId_lktp').value,670,'1','&amp;lksrch=' + escapeUTF(encodeURIComponent(getElementByIdCS('InviteeId').value.substring(0, 80))))"><img title="第一排班员 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="第一排班员 查找（新窗口）" src="/s.gif"></a></span>

                                    </span>
                                    <span style="float:left;">会议名称：
                                        <input type="hidden" value="" id="MeetingId_lkid" name="MeetingId_lkid" searchcolumn="true" datafield="MeetingId" dataope="eq" ><input type="hidden" value="" id="MeetingId_lkold" name="MeetingId_lkold"><input type="hidden" value="5000" id="MeetingId_lktp" name="MeetingId_lktp"><input type="hidden" value="1" id="MeetingId_lspf" name="MeetingId_lspf"><input type="hidden" value="0" id="MeetingId_lspfsub" name="MeetingId_lspfsub"><input type="hidden" value="1" id="MeetingId_mod" name="MeetingId_mod"><span class="lookupInput"><input type="text" value="" tabindex="4" size="10" onchange="getElementByIdCS('MeetingId_lkid').value='';getElementByIdCS('MeetingId_mod').value='1';" name="MeetingId" maxlength="255" id="MeetingId" class="inputdate" style="border:solid rgb(71,71,71) 1px;height:30px;"><a title="会议名称 查找（新窗口）" tabindex="4" onclick="setLastMousePosition(event)" id="MeetingId_lkwgt" href="javascript:openLookup('/_ui/common/data/LookupPage?lkfm=editPage&amp;lknm=MeetingId&amp;lktp=' + getElementByIdCS('MeetingId_lktp').value,670,'1','&amp;lksrch=' + escapeUTF(encodeURIComponent(getElementByIdCS('MeetingId').value.substring(0, 80))))"><img title="会议名称 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="会议名称 查找（新窗口）" src="/s.gif"></a></span>
                                    </span>
                                    <span style="float:left;">签到时间：
                                        <input onchange="Search();" class="inputdate" id="srt_ExpiresOn" name="srt_ExpiresOn" style="border:solid rgb(71,71,71) 1px;height:30px;" type="text" searchcolumn="true" datafield="Checkin" dataope="ge" onblur="if(!isDate(this.value)) { this.value=''; }" onfocus="DatePicker.pickDate(false, 'srt_ExpiresOn', false);"/>至
                                        <input onchange="Search();" class="inputdate" id="end_ExpiresOn" name="end_ExpiresOn" style="border:solid rgb(71,71,71) 1px;height:30px;" type="text" searchcolumn="true" datafield="Checkin" dataope="le" onblur="if(!isDate(this.value)) { this.value=''; }" onfocus="DatePicker.pickDate(false, 'end_ExpiresOn', false);"/>
                                    </span>
                                        <p class="sousuo">
                                            <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="GridInstance.search()" />
                                        </p>
                                        <div class="sousuo-tishi1"></div>
                                        <div class="sousuo-tishi">被分配人别名，到期日期、相关项和名称不可搜索。使用筛选器。或改为对这些字段进行排序</div>
                                        <!--
                                        <p class="shituu shituu2" title="显示为 看板">
                                            <img src="../img/cal/20.kanban_1(14x14).png" class="img1 posi" style="width: 14px; height: 14px; margin-left: 7px; margin-top: 5px;">
                                            <img src="../img/cal/20.PNG" class="img2">
                                        </p>-->
                                        <p class="neww" title="刷新">
                                            <img alt="刷新" src="/img/cal/refresh.png" class="img1" style="width: 14px; height: 14px; margin-left: 8px; margin-top: 8px;" />
                                        </p>
                                        <p class="ppp">
                                            <img src="/img/cal/22.filterList_2(14x14).png" alt="" onclick="GridInstance.search()">
                                        </p>
                                        <!--
                                        <p class="ppp">
                                            <img src="/img/cal/22.filterList_2(14x14).png" alt="" onclick="GridInstance.search()">
                                        </p>
                                        -->
                                        <!--
                                        <div class="card-table">
                                            <div class="card-table-div1">显示为</div>
                                            <div class="card-table-div2">
                                                表
                                                <img src="/img/cal/20.table_1(14x14).png" class="img1">
                                            </div>
                                            <div class="card-table-div3 active">
                                                看板
                           
                                                <img src="/img/cal/23.check_2(16x16).png" class="img2">

                                                <img src="/img/cal/20.kanban_1(14x14).png" class="img1">
                                            </div>
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="objectManagerLeftNav" style="padding-top: 0; height: 100%; padding-bottom: 0;">
                                   <!-- <div id="treePanel" class="easyui-panel" title="合同分类" style="padding: 5px; width: 240px; min-height: 0!important; height: calc(100% - 49px)!important; min-height: 200px;">
                                        <ul class="easyui-tree" id="categoryTree" style="display: block; height: 100%; min-height: 300px;">
                                            <li></li>
                                        </ul>
                                    </div>-->
                                    <div id="gridContainer"></div>
                                    <div class="clear"></div>
                                </div>
                                 <ctl:EasyGridListInit ID="EasyGridListInit1" runat="server" />
                                <script type="text/javascript">
                                    var treeNode = null;
                                    var card = '';
                                    $(document).ready(function () {

                                        //treeNode = new treeLoader("categoryTree", "contractcategory", treeItemClick);
                                        //treeNode.init();
                                        //var grid = new listGrid("datagrid", "P01");
                                        //grid.init();
                                        //var screenHeight = getClientHeight();
                                        $//("#treePanel").height(screenHeight - 111 - 100 - 70);
                                    });
                                    function treeItemClick() {
                                        //treeNode.loadNodeItems("employee.card.search", "categoryid=" + node.id, renderCards);
                                    }

                                    function Search() {
                                        GridInstance.search();
                                    }
                                </script>
                               
                            </div>
                        </div>
                         <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();"
                                    onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                    onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker"
                                        name="calMonthPicker" title="月"><option value="0">一月</option>
                                        <option value="1">二月</option>
                                        <option value="2">三月</option>
                                        <option value="3">四月</option>
                                        <option value="4">五月</option>
                                        <option value="5">六月</option>
                                        <option value="6">七月</option>
                                        <option value="7">八月</option>
                                        <option value="8">九月</option>
                                        <option value="9">十月</option>
                                        <option value="10">十一月</option>
                                        <option value="11">十二月</option>
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';"
                                        onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';"
                                        onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';"
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年">
                                            
                                        </select></div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">
                                            星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">
                                        今天</a></div>
                            </div>
                        </div>
                        <!-- End page content -->
                        <script> initDatePicker();</script>

                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    <script src="/js/mission-header.js"></script>
    <script src="/js/cal/mission2.js"></script>
    <script src="/js/schedule.js"></script>
    <script>
        function closeIFrame() {
            $('iframe').remove();
        }
    </script>
    <script>

        $(".cont-status-check").click(function () {
            $(".pulldown-menu-contstatus").show()
            $(document).click(function (e) {
                console.log($(e.tager))
                if ($(e.tager).parents(".pulldown-menu-contstatus").length == 0) {
                    $(".pulldown-menu-contstatus").hide()
                }
            })
            return false;
        })
        $(".pulldown-menu-contstatus>li").each(function () {
            $(this).click(function () {
                $(".cont-status-check span").text($(this).find("span").text())
                $(".pulldown-menu-contstatus>li").removeClass("active")
                $(this).addClass("active")
                $(this).parent().hide()
            })
        })
        $(".ppp").click(function () {
            //$("iframe").remove()
            //$(".objectManagerLeftNav").prepend('<iframe src="/component/shaixuanqi.html" style="width:370px;height:100%;position:absolute;top:0;right:0;border:0;z-index:200;"></iframe>')
            //$(this).find("img").prop("src", "/img/cal/22.filterList_3(14x14).png")
            //var width = $(".datagrid-wrap").width()
            //$(".datagrid-wrap").width(width - 360)
            //$("#gridContainer").width(width - 360)
            //$(".datagrid-body").css("overflow", "auto")
            //$(".datagrid-body").width(width - 390)
        })
        function closeIFramesx() {
            $('iframe').remove();
            $(".ppp").find("img").prop("src", "/img/cal/22.filterList_2(14x14).png")
            var width = $(".datagrid-wrap").width()
            $(".datagrid-wrap").width(width + 360)
            $("#gridContainer").width(width + 360)
            $(".datagrid-body").width(width + 390)

        }
        function iframeaddwidth() {
            $("iframe").width($("iframe").width() + 400)
        }
        function iframereducewidth() {
            $("iframe").width($("iframe").width() - 400)
        }

        $(document).ready(function () {
            //console.log($('#srt_ExpiresOn').val())
            var expiresOnDate = new Date();
            expiresOnDate.setMonth(expiresOnDate.getMonth() + 3);
            var date = expiresOnDate.getDate()
            if (date < 10) {
                date = "0" + date
            }
            var dateString = expiresOnDate.getFullYear() + '-' + Number(Number(expiresOnDate.getMonth()) + 1) + '-' + date;
            //$('#srt_ExpiresOn').val(dateString);
            // console.log(dateString)
            //console.log(i)
            //Search();
        });
        $("#Button1").click(function () {
            $(this).parent().next().show()
        })
        $(".select div").click(function () {
            $(this).parent().prev().find("input[type=hidden]").val($(this).attr("statuscode"))
            $(this).parent().prev().find("input[type=button]").val($(this).html())
            $(".select").hide()
        })
    </script>

   
</body>
</html>
