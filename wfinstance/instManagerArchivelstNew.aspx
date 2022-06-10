<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>收发文归档 - 流程管理 ~  - Developer Edition</title>
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
    <link rel="stylesheet" href="/css/themes/lightning/alerts.css" />
    <style type="text/css">
        .recurrenceFrequency {
            margin: 0;
        }

        #gridContainer {
            width: calc(100% - 239px);
            margin-top: -1px;
            margin-left: -1px;
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

        ul li {
            margin-left: 0;
        }

        .datagrid-header, .datagrid-td-rownumber {
            background: #F3F2F2 !important;
            filter: none !important;
        }

        .miss-header {
            min-height: 0 !important;
        }
    </style>
    <style>
    </style>
    <link href="/css/workshift.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script src="/js/workflowinstance.js"></script>
    <script type="text/javascript">
        function loadNew() {
            if (!commonUtils.isBrowserSupported()) {
                window.location = "/apps/wf/MyApplyList.aspx?t=122&amp;src=2";
            }
        }
        loadNew();
    </script>
    <script>    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
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

        .miss-header {
            border-bottom: 1px solid #ccc;
        }

        .header-right-buttonbtn .shuaxin {
            margin-left: 10px !important;
        }
        #createdby,#DeptId{
            border: 1px solid #dddbda;
            width: 100px;
            height: 30px;
            line-height: 30px;
            margin-left: 2px;
            text-indent: 5px;
            border-radius:4px;
        }
    </style>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif contactTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
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
                        <%--<div class="bPageTitle">
                            <div class="ptBody">
                                <div class="links"></div>
                            </div>
                        </div>--%>
                        <div id="bodyWrapper">
                            <!-- <div class="pulldown-menu-contstatus" style="display:none;">
                                <div>列表视图</div>
                                <li class="active">
                                    <img src="/img/cal/23.check_1(14x14).png" /><span>我的合同</span></li>
                                <li>
                                    <img src="/img/cal/23.check_1(14x14).png" /><span>我的执行中的合同</span></li>
                                <li>
                                    <img src="/img/cal/23.check_1(14x14).png" /><span>我的已过期的合同</span></li>
                                <li>
                                    <img src="/img/cal/23.check_1(14x14).png" /><span>我的审批中的合同</span></li>
                                <li>
                                    <img src="/img/cal/23.check_1(14x14).png" /><span>我的草稿合同</span></li>
                                <li>
                                    <img src="/img/cal/23.check_1(14x14).png" /><span>最近查看</span></li>
                            </div>-->
                            <div class="miss-header">
                                <div class="header-left-logo">
                                    <img src="/template/hearder/logo.png" />
                                </div>
                                <div class="header-left-title">
                                    <p class="header-left-title-name">事务管理</p>
                                    <p class="header-left-title-listname selectinput"><span>所有</span><img src="/img/cal/20.png" alt="" /></p>
                                    <div class="selectlist selectlistcheck">
                                        <ul>
                                        </ul>
                                    </div>
                                </div>
                                <%--<div class="header-right-buttonbtn">
                                    <div class="buttonbtn-group">
                                        <div class="buttonbtn"><a href="/a0V/e?retURL=%2fa0V%2f/o">新建</a></div>
                                    </div>
                                </div>--%>
                            
                                <div class="header-right-buttonbtn">
                                    <div class="buttonbtn buttonbtnsousuo">
                                        <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="GridInstancesearch()" />
                                    </div>
                                    <div style="border: 1px solid #dddbda; height: 30px;line-height:30px;">
                                        <select style="height: 30px;line-height:25px;" id="StateCode" name="StateCode" onchange="GridInstancesearch()">
                                            <option value="">全部状态</option>
                                            <option value="0">草稿</option>
                                            <option value="1" selected>流转中</option>
                                            <option value="3">已完成</option>
                                            <option value="5">已退回</option>
                                        </select>
                                    </div>
                                    <div>
                                      创建人：<input type="hidden" value="" id="createdby_lkid" name="createdby_lkid" searchcolumn="true" datafield="createdby" dataope="eq">
                                        <input type="hidden" value="" id="createdby_lkold" name="createdby_lkold"><input type="hidden" value="8" id="createdby_lktp" name="createdby_lktp">
                                        <input type="hidden" value="" id="createdby_lspf" name="createdby_lspf"><input type="hidden" value="1" id="createdby_lspfsub" name="createdby_lspfsub">
                                        <input type="hidden" value="" id="createdby_mod" name="createdby_mod">
                                        <input type="text" value="" tabindex="4" size="10" 
                                         onchange="getElementByIdCS('createdby_lkid').value='';getElementByIdCS('createdby_mod').value='1';" 
                                         name="createdby" maxlength="255" id="createdby">
                                    </div>
                                    <div>
                                      部门：<input name="DeptId_lkid" id="DeptId_lkid" type="hidden" searchcolumn="true" datafield="BusinessUnitId" dataope="eq">
                                        <input name="DeptId_lkold" id="DeptId_lkold" type="hidden"><input name="DeptId_lktp" id="DeptId_lktp" type="hidden" value="10">
                                        <input name="DeptId_lspf" id="DeptId_lspf" type="hidden" value="1">
                                        <input name="DeptId_lspfsub" id="DeptId_lspfsub" type="hidden" value="0">
                                        <input name="DeptId_mod" id="DeptId_mod" type="hidden" value="1">
                                        <input name="DeptId" 
                                            tabindex="3" 
                                            id="DeptId"
                                            onchange="getElementByIdCS('DeptId_lkid').value='';getElementByIdCS('DeptId_mod').value='1';" 
                                            type="text" size="20" maxlength="255">
                                    </div>
                                    <div class="search-group search-groupposition"
                                        name="StartTime"
                                        type="time"
                                        text="时间">
                                    </div>
                                    <div class="search-group search-groupposition"
                                        name="EndTime"
                                        type="time"
                                        text="至">
                                    </div>
                                    <div class="buttonbtn-group">
                                        <div class="buttonbtn" onclick="GridInstancesearch()"><a href="javascript:void(0)">搜索</a></div>
                                    </div>
                                    <script>


                                        function GridInstancesearch() {
                                            var CreatedBy = $(".search-group[name='CreatedBy']").attr('search');
                                            var BusinessUnitId = $(".search-group[name='BusinessUnitId']").attr('search');
                                            var StartTime = $(".search-group[name='StartTime']").find('input').val();
                                            var EndTime = $(".search-group[name='EndTime']").find('input').val();

                                            var queryPara = "";
                                            //var ProcessId = $('#leftTree').tree('getSelected').id;
                                            //if (ProcessId && ProcessId != '') {
                                            // queryPara += "ProcessId\teq\t" + ProcessId;
                                            //}
                                            if (CreatedBy && CreatedBy != '') {
                                                queryPara += "\nCreatedBy\teq\t" + CreatedBy;
                                            }
                                            if (BusinessUnitId && BusinessUnitId != '') {
                                                queryPara += "\nBusinessUnitId\teq\t" + BusinessUnitId;
                                            }
                                            if (StartTime && StartTime != '') {
                                                queryPara += "\nCreatedOn\tge\t" + StartTime;
                                            }
                                            if (EndTime && EndTime != '') {
                                                queryPara += "\nCreatedOn\tle\t" + EndTime;
                                            }
                                            var stateCode = document.getElementById("StateCode").value;
                                            if (stateCode && stateCode != '') {
                                                queryPara += "\nStateCode\teq\t" + stateCode;
                                            }
                                            var search = document.getElementById("srchText").value;
                                            if (search && search != '') {
                                                queryPara += "\nName\tcontains\t" + search;
                                            }
                                            bindGrid(queryPara, "");

                                        }
                                    </script>
                                    <script type="text/javascript">
                                        function processList(action) {
                                            //this.form.action = '/p/lead/LeadMassAction?retURL=%2F00Q%3Ffcf%3D00B90000008ViBm&from=&_CONFIRMATIONTOKEN=VmpFPSxNakF4T1Mwd055MHhPRlF3TWpveU5Eb3lOaTQzT0RKYSxEVXg5WmltdDZRb1hGQ0RQZTYyYUhiLFpEWTVNell5&common.udd.actions.ActionsUtilORIG_URI=%2Fp%2Flead%2FLeadMassAction';
                                            //alert("11");
                                            var ids = "";
                                            var idNames = "";
                                            var selectCount = 0;
                                            var ids = [];
                                            var rows = $('#datagrid').datagrid('getSelections');

                                            for (var i = 0; i < rows.length; i++) {
                                                ids.push(rows[i].ProcessInstanceId);
                                                selectCount++;
                                            }

                                            var strIds = ids.join(',');
                                            //alert(strIds);
                                            if (selectCount <= 0) {
                                                alert("请至少选择一行！");
                                                return;
                                            }
                                            //alert(empIds);
                                            var rootUrl = "/WFPageProcessor.ashx";
                                            var method = "";
                                            if (action == "0") //收回
                                            {
                                                method = "wf.instance.cancel";
                                            }
                                            if (action == "3") //结束
                                            {
                                                method = "wf.instance.end";
                                            }
                                            if (action == "100") //传阅
                                            {
                                                forwardProcess(ids);
                                                return;
                                            }
                                            var url = rootUrl + "?cmd=" + method;
                                            //url += "&ids=" + empIds;
                                            jQuery.ajax({
                                                async: false, cache: false, dataType: "json",
                                                data: { ids: strIds },
                                                error: function (request, textStatus, errorThrown) {
                                                    // errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                                                },
                                                success: function (data, textStatus) {
                                                    //if (callback)
                                                    // {   callback(data);
                                                    //ListViewport.instances['lineItemView'].refreshList();
                                                    if (action == "0" || action == "2") {

                                                    }
                                                    alert("操作成功！");
                                                    bindGrid("", "");
                                                },
                                                type: "POST",
                                                url: url
                                            });
                                        }
                                    </script>

                                    <div class="buttonbtn viewlist selectbuttonbtn">
                                        <div class="selectlist">
                                            <span>列表控制视图</span>
                                            <ul>
                                                <li id="menuitem">新建</li>
                                                <li id="print">导出</li>
                                                <li id="copy">复制</li>
                                                <li id="New_name">重命名</li>
                                                <li id="share">共享设置</li>
                                                <li id="shaixuan">显示列表筛选器</li>
                                                <li id="Show_zi">选择要显示的字段</li>
                                                <li id="delete">删除</li>
                                                <%--<li id="Li6">Kanban设置</li>--%>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="buttonbtn shaixuan ban"></div>
                                    <div class="buttonbtn shuaxin neww"></div>
                                </div>

                                <div class="clear"></div>
                            </div>

                            <div class="table-body">
                                <div class="objectManagerLeftNav" style="padding-top: 0; height: 100%; padding-bottom: 0;">
                                    <div id="treePanel" class="easyui-panel" title="流程" style="padding: 5px; width: 240px; min-height: 0!important; height: calc(100% - 49px)!important; min-height: 200px;">
                                        <ul class="easyui-tree" id="leftTree" style="display: block; height: 100%; min-height: 300px;">
                                            <li></li>
                                        </ul>
                                    </div>
                                    <div id="gridContainer">
                                        <table id="datagrid" class="easyui-datagrid" style="height: 100%;" data-options="fitColumns:true,singleSelect:true,autoWidth:true,pagination:true,rownumbers: true,toolbar: '#tb'">
                                            <tr>
                                                <%-- <th data-options="field:'Name',sortable:true" >实例名称</th>
                                                <th data-options="field:'ProcessIdName',sortable:true" >流程名称</th>
                                                <th data-options="field:'CreatedByName',sortable:true" >发起人</th>
                                                <th data-options="field:'CreatedOn',sortable:true" >发起日期</th>
                                                <th data-options="field:'BusinessUnitIdName',sortable:true">发起人部门</th>
                                                <th data-options="field:'StateCodeName',formatter:formatStatus">状态</th>
                                                <th data-options="field:'AttendMonth'" rowspan="2">月份</th>
                                                <th data-options="field:'ModifiedOn'" rowspan="2">上一次修改时间</th>   --%>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="clear"></div>
                                    <div id="tb" style="height: auto">
                                        <!--<a href="javascript:void()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">催办</a>-->

                                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="submitArchives()">归档</a>
                                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="cancelArchives()">取消归档</a>
                                        <a href="javascript:processList(100)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">传阅</a>
                                        <a href="javascript:processList(3)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">结束</a>
                                        <a href="javascript:processList(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="deleterows()">收回</a>
                                        <!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-toExcel',plain:true" onclick="exportExcel()">导出</a>                                            
                                            <a href="void()" class="easyui-linkbutton" data-options="iconCls:'icon-toExcel',plain:true" >导入</a>-->
                                    </div>
                                </div>
                                <script>
                                    /*绑定部门评估数据*/
                                    function bindGrid(Query, search) {
                                        var url = "";
                                        var Name = ""
                                        var fcols = new Array();
                                        //debugger;
                                        var filterQuery = "";
                                        if (Query && Query != '') {
                                            filterQuery = Query
                                        }
                                        var col = {
                                            field: "Action", title: "操作",
                                            formatter: function (value, row, index) {
                                                return formatOper(value, row, index);
                                            }
                                        };
                                        fcols.push({
                                            field: "", title: '', checkbox: true
                                        })
                                        fcols.push(col);
                                        fcols.push({ field: "Name", title: '标题' });
                                        fcols.push({ field: "ProcessIdName", title: '流程名称', sortable: true });
                                        fcols.push({ field: "StateCodeName", title: '流程状态', sortable: true, formatter: formatStatus });
                                        fcols.push({ field: "CreatedByName", title: '发起人', sortable: true });
                                        fcols.push({ field: "CurrentStepName", title: '当前步骤', sortable: false });
                                        fcols.push({ field: "CreatedOn", title: '发起时间', sortable: true });
                                        fcols.push({ field: "BusinessUnitIdName", title: '发起人部门', sortable: true });

                                        fcols.push({ field: "IsArchivedName", title: '是否归档', sortable: true });
                                        fcols.push({ field: "ArchivedOn", title: '归档时间', sortable: true });

                                        //被考评部门
                                        url = "/apps/CommandProcessor.ashx?cmd=entity.grid.search";
                                        if (!search)
                                            search = "";
                                        $('#datagrid').datagrid({
                                            url: url,
                                            method: 'get',
                                            queryParams: {
                                                entityType: "WFProcessInstances",
                                                filterQuery: filterQuery,
                                                sort: "CreatedOn",
                                                order: "desc"
                                            },
                                            columns: [fcols],
                                            //frozenColumns: [fcols],
                                            idField: "ProcessInstanceId",
                                            fit: true,
                                            checkOnSelect: true,
                                            striped: false,
                                            idField: "num",
                                            pageNumber: 1,
                                            pagination: true,
                                            rownumbers: true,
                                            pageSize: 15,
                                            singleSelect: false,
                                            onLoadSuccess: function (data) {

                                            }
                                        });
                                    }

                                </script>
                                <script type="text/javascript">
                                    var treeNode = null;
                                    var card = '';
                                    $(document).ready(function () {

                                        webContext.entityType = "122";
                                        entityType = "122";
                                        try {
                                            treeNode = new treeLoader("leftTree", "processtree", treeItemClick);
                                            treeNode.init();
                                        }
                                        catch (e) {

                                        }
                                        var screenHeight = getClientHeight();
                                        $("#treePanel").height(screenHeight - 111 - 100 - 58);
                                        $("#gridContainer").height(screenHeight - 111 - 100);

                                        var treeHeight = getClientHeight();
                                        treeHeight = treeHeight - 111 - 37 - 75 - 12;
                                        //jQuery("#gridContainer").height(treeHeight);
                                        GridInstancesearch();
                                        //bindGrid();

                                    });
                                    function treeItemClick(node) {
                                        //alert(node.id);
                                        //treeNode.loadNodeItems("employee.card.search", "categoryid=" + node.id, renderCards);
                                        //debugger;
                                        var extSrch = "ProcessId\teq\t" + node.id;
                                        bindGrid(extSrch);
                                    }
                                    function filterQuery() {
                                        var extSrch = "Name\teq\t" + document.getElementById("StateCode").value;
                                        bindGrid(extSrch)
                                    }
                                    function openWindow(url, title) {
                                        window.open(url, title, 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
                                    }
                                    function formatOper_old(val, row, index, entityType) {
                                        var rowId = row["ProcessInstanceId"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
                                        //var urlApprove = "/a0M/e?id=" + rowId;
                                        var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/122/detail?id=' + rowId + '">查看</a>&nbsp;';
                                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:openWindow('/apps/wf/WFFormPrint.aspx?InstanceId=" + rowId + "','_contract')\" >打印</a>&nbsp;";
                                        //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?type=1010&delID=" + rowId + "&retURL=\">删除</a>";
                                        //var state = row["StateCode"];
                                        //alert(state);
                                        //if (state == "1" || state == "5") {
                                        //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:jumpProcess('" + rowId + "')\" >跳转</a>&nbsp;";
                                        //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:insertProcess('" + rowId + "')\" >加签</a>&nbsp;";
                                        //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:transferAgentProcess('" + rowId + "')\" >委派</a>&nbsp;";
                                        //}
                                        //if (state == "3")
                                        //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:insertProcess('" + rowId + "')\" >加签</a>&nbsp;";



                                        return html;
                                    }

                                    function formatOper(val, row, index, entityType) {
                                        var rowId = row["ProcessInstanceId"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
                                        var urlApprove = "/a0M/e?id=" + rowId;
                                        var IsArchived = row["IsArchived"];
                                        var html = "";

                                        if (IsArchived == 'True') {
                                            html += "<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"cancelArchive('" + rowId + "')\"  >取消归档</a>&nbsp;";
                                        }
                                        else {
                                            html += "<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"submitArchive('" + rowId + "')\"  >归档</a>&nbsp;";
                                        }
                                        html += '&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/122/detail?id=' + rowId + '">查看</a>&nbsp;';
                                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:openWindow('/apps/wf/WFFormPrint.aspx?InstanceId=" + rowId + "','_contract')\" >打印</a>&nbsp;";

                                        return html;
                                    }


                                    function formatStatus(val, row, index) {
                                        var value = row["StateCodeName"];
                                        if (value == "流转中") {
                                            return "<span style='color:red;font-weight:bold;'>" + value + "</span>";
                                        }
                                        if (value == "已完成") {
                                            return "<span style='color:blue'>" + value + "</span>";
                                        }
                                        if (value == "草稿") {
                                            return "<span style='color:grey'>" + value + "</span>";
                                        }
                                        if (value == "已退回" || value == "退回") {
                                            return "<span style='color:#8F3A44;font-weight:bold;'>" + value + "</span>";
                                        }
                                    }

                                    function archiveDialog() {

                                        var rows = $('#datagrid').datagrid('getSelections')
                                        if (rows.length == 0) {
                                            alert("请选择记录！");
                                            return
                                        }

                                        var Ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            Ids.push(rows[i].LIST_RECORD_ID)
                                        }
                                        Ids = Ids.join(',');
                                        console.log(Ids);
                                        var ObjectTypeCode = "100109";
                                        var Url = "/wfinstance/archive2.aspx?Ids=" + Ids + "&ObjectTypeCode=" + ObjectTypeCode;
                                        showDialog(Url, "archiveDialog", "重命名", 500, 200);
                                        return false;
                                    }

                                    

                                    function showRecDetail(t, id) {
                                        var Url = "/wfinstance/UserLogin.aspx?t=" + t + "&id=" + id;
                                        showDialog(Url, "UserLogin", "用户登录", 500, 200);
                                    }

                                    function renameDialog(Id, Name) {
                                        var ObjectTypeCode = "100109";
                                        var Url = "/wfinstance/rename.aspx?Id=" + Id + "&Name=" + Name + "&ObjectTypeCode=" + ObjectTypeCode
                                        showDialog(Url, "archiveDialog", "重命名", 500, 200);
                                        return false;
                                    }

                                    function submitArchives() {

                                        var rows = $('#datagrid').datagrid('getSelections')
                                        if (rows.length == 0) {
                                            alert("请选择记录！");
                                            return
                                        }

                                        var Ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            Ids.push(rows[i].ProcessInstanceId)
                                        }
                                        Ids = Ids.join(',');

                                        var entityType = "WFProcessInstance";
                                        if (Ids.length > 0) {
                                            if (confirm('您是否确认归档?')) {
                                                var data = {
                                                    Ids: Ids,
                                                    EntityType: entityType
                                                }
                                                ajaxMethodGetData('workflow.archive', data, function (data) {
                                                    GridInstancesearch();
                                                })
                                            }
                                        } else {
                                            alert('请先选中行!')
                                        }
                                        return false;
                                    }

                                    function submitArchive(Ids) {
                                        var entityType = "WFProcessInstance";
                                        if (confirm('您是否确认归档?')) {
                                            var data = {
                                                Ids: Ids,
                                                EntityType: entityType
                                            }
                                            ajaxMethodGetData('workflow.archive', data, function (data) {
                                                GridInstancesearch();
                                            })
                                        }
                                        return false;
                                    }

                                    function cancelArchive(Ids) {
                                        var entityType = "WFProcessInstance";
                                        if (confirm('您是否确认取消归档?')) {
                                            var data = {
                                                Ids: Ids,
                                                EntityType: entityType
                                            }
                                            ajaxMethodGetData('workflow.archive.cancel', data, function (data) {
                                                GridInstancesearch();
                                            })
                                        }
                                        return false;
                                    }

                                    function cancelArchives() {
                                        var rows = $('#datagrid').datagrid('getSelections')
                                        if (rows.length == 0) {
                                            alert("请选择记录！");
                                            return
                                        }

                                        var Ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            Ids.push(rows[i].ProcessInstanceId)
                                        }
                                        Ids = Ids.join(',');
                                        var entityType = "WFProcessInstance";
                                        if (Ids.length > 0) {
                                            if (confirm('您是否确认取消归档?')) {
                                                var data = {
                                                    Ids: Ids,
                                                    EntityType: entityType
                                                }
                                                ajaxMethodGetData('workflow.archive.cancel', data, function (data) {
                                                    GridInstancesearch();
                                                })
                                            }
                                        } else {
                                            alert('请先选中行!')
                                        }
                                    }

                                </script>

                            </div>
                        </div>
                        <script type="text/javascript">
                            //CampaignMember_onLoadCriteria();
                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fui%2Fcampaign%2FCampaignManageMembersExistingTab%3FcampaignId%3D70190000000uODU&isAjaxRequest=1&renderMode=RETRO&nocache=1426131057337'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }
                        </script>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="changeDiv">
        <iframe id="iframe" src=""></iframe>
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
                //console.log($(e.tager))
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
            $("iframe").remove()
            $(".objectManagerLeftNav").prepend('<iframe src="/component/shaixuanqi.html" style="width:370px;height:100%;position:absolute;top:0;right:0;border:0;z-index:200;"></iframe>')
            $(this).find("img").prop("src", "/img/cal/22.filterList_3(14x14).png")
            var width = $(".datagrid-wrap").width()
            $(".datagrid-wrap").width(width - 360)
            $("#gridContainer").width(width - 360)
            $(".datagrid-body").css("overflow", "auto")
            $(".datagrid-body").width(width - 390)
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

    </script>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />
    <link href="/template/css/shaixuan.css" rel="stylesheet" />
    <script type="text/javascript" src="/element/vue.js"></script>
    <script type="text/javascript" src="/element/element.js"></script>
    <link href="/element/element.css" rel="stylesheet" />
    <script src="/js/laydate/laydate.js"></script>
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>
    <script src="/template/js/filter.js"></script>
    <script>
        $('#createdby').off()
        $('#createdby').click(function () {
            var iHeight = 600
            var iWidth = 1000
            var iTop = ($(window).height() - iHeight) / 2;
            //获得窗口的水平位置 
            var iLeft = ($(window).width() - iWidth) / 2;
            window.open('/_ui/common/data/UserLookResult.aspx?lkfm=editPage&lknm=createdby&lktp=' + getElementByIdCS('createdby_lktp').value,900,'1','&lksrch=' + escapeUTF(encodeURIComponent(getElementByIdCS('createdby').value.substring(0, 80))), 'new', 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no');
        })
        $('#DeptId').off()
        $('#DeptId').click(function () {
            var iHeight = 600
            var iWidth = 1000
            var iTop = ($(window).height() - iHeight) / 2;
            //获得窗口的水平位置 
            var iLeft = ($(window).width() - iWidth) / 2;
            window.open('/_ui/common/data/DeptLookResult.aspx?lkfm=editPage&lknm=DeptId&lktp=' + getElementByIdCS('DeptId_lktp').value, 900, '1', '&lksrch=' + escapeUTF(getElementByIdCS('DeptId').value.substring(0, 80)), 'new', 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no');
        })
    </script>
</body>
</html>
