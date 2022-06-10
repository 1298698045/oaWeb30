﻿<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>请示报告 - 公文管理 ~  - 高效协同</title>
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
            margin-top: -13px;
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
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
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
  <script>
      if (!commonUtils.isBrowserSupported()) {
          window.location = "/apps/DefaultSrchPage.aspx?t=A08&amp;src=1";
      }
    </script>
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
        .miss-header {
            padding:10px 15px !important;
        }
        #bodyCell {
            padding: 10px !important;
            padding-top:0 !important;
        }
        .header-left-logo, .header-left-title {
            position:relative;
            top:15px;
        }
        body ul,body li{
            margin-left:0;
        }
         #DeptId {
    border: 1px solid #dddbda;
    width: 100px;
    height: 30px;
    line-height: 30px;
    margin-left: 2px;
    text-indent: 5px;
    border-radius: 4px;
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
                                    <p class="header-left-title-name">请示报告</p>
                                    <p class="header-left-title-listname selectinput"><span>请示</span><img src="/img/cal/20.png" alt="" /></p>
                                    <div class="selectlist selectlistcheck">
                                        <ul>
                                        </ul>
                                    </div>
                                </div>
                                <div class="header-right-buttonbtn">
                                    <div class="buttonbtn-group">
                                        <div class="buttonbtn"><a href="javascript:void(0)" onclick="archiveDialogs()" >批量归档</a></div>
                                        <%--<div class="buttonbtn"><a href="/apps/wf/applyInstance.aspx?entityType=20019&t=A09&retURL=%2FA09%2Fo">发起收文</a></div>--%>
                                    </div>
                                </div>
                                <div class="clear"></div>
                                <div class="header-right-buttonbtn">
                                    <div class="buttonbtn buttonbtnsousuo">
                                        <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="GridInstance.search()" />
                                    </div>
                                    <span style="float:left; height: 30px;line-height:30px;margin-left:5px;">
                                        是否归档：
                                    </span>
                                    <div style="border: 1px solid #dddbda; height: 30px;line-height:30px;">
                                        <select style="height: 30px;line-height:25px;" id="IsArchived" name="IsArchived" onchange="doSearch()">
                                            <option value="">全部</option>
                                            <option value="0">否</option>
                                            <option value="1" >是</option>
                                        </select>
                                    </div>
                                    
                                    <div style="border: 1px solid #dddbda; height: 30px;line-height:30px;">
                                        <select style="height: 30px;line-height:25px;" id="timetype" name="timetype" onchange="doSearch()">
                                            <option value="1">创建时间</option>
                                            <option value="2" >归档时间</option>
                                        </select>
                                    </div>
                                    <div style="margin-left:0;" class="search-group search-groupposition"
                                         name="StartTime"
                                         id="StartTime"
                                         type="time"
                                         text="">
                                    </div>
                                     <div class="search-group search-groupposition"
                                         name="EndTime"
                                         id="EndTime"
                                         type="time"
                                         text="至">
                                    </div>
                                    <div class="buttonbtn-group">
                                        <div class="buttonbtn" onclick="doSearch()">搜索</div>
                                    </div>
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
                             <script type="text/javascript" >
                                 function doSearch(search)
                                 {
                                     //var filterQuery = "\nDocInNo\tcontains\t" + $("DocInNo").value;
                                     //filterQuery += "\nDocInDate\tge\t" + $("DocInDate1").value;
                                     //filterQuery += "\nDocInDate\tle\t" + $("DocInDate2").value;
                                     //var StartTime = $(".search-group[name='StartTime']").find('input').val();
                                     //var EndTime = $(".search-group[name='EndTime']").find('input').val();
                                     var StartTime = $('#StartTime').val()
                                     var EndTime = $('#EndTime').val()
                                     var filterQuery = "";
                                     if (search != undefined && search != "")
                                         filterQuery = search;
                                     //var docInNo = $(".search-group[name='DocInNo']").find('input').val();

                                     var docInNo = $("#ReportNumber input").val();
                                     if (docInNo && docInNo != '') {                                        
                                         filterQuery += "\nReportNumber\tcontains\t" + docInNo;
                                     }

                                     var srchText = $("#srchText").val();
                                     if (srchText && srchText != '') {
                                         filterQuery += "\nName\tcontains\t" + srchText;
                                     }
                                     var treeNode = $('#leftTree').tree('getSelected');
                                     if (treeNode != null) {
                                         if (search == undefined || search == "") {
                                             var businessUnitId = treeNode.id;
                                             if (businessUnitId && businessUnitId != '') {
                                                 filterQuery += "\nOwningBusinessUnit\teq\t" + businessUnitId;
                                             }//end
                                         }//end
                                     }

                                     var timetype = $('#timetype').val()

                                     if (StartTime && StartTime != '') {
                                         if (timetype == 1) {
                                             filterQuery += "\nCreatedOn\tge\t" + StartTime;
                                         } else if (timetype == 2) {
                                             filterQuery += "\nArchivedOn\tge\t" + StartTime;
                                         }
                                     }
                                     if (EndTime && EndTime != '') {
                                         if (timetype == 1) {
                                             filterQuery += "\nCreatedOn\tle\t" + EndTime;
                                         } else if (timetype == 2) {
                                             filterQuery += "\nArchivedOn\tle\t" + EndTime;
                                         }
                                     }
                                     var IsArchived = $("#IsArchived").val();
                                     if (IsArchived && IsArchived != '') {
                                         filterQuery += "\nIsArchived\teq\t" + IsArchived;
                                     }
                                     GridInstance.search(filterQuery);
                                 }
                             </script>
    
                            <%--<div class="mission-header mission-header1">
                                <div class="mission-header-leftlogo">
                                    <p class="logo">
                                        <img src="/img/cal/hetongguanli.png" alt="" />
                                    </p>
                                    <div>合同管理</div>
                                    <p class="cont-status-check"><span>我的合同</span><img src="/img/cal/20.png" /></p>
                                </div>
                                <div class="mission-hearder-message">
                                </div>
                                <div class="mission-hearder-right">
                                    <p class="newmissq"><a href="/800/e?retURL=%2f800%2f/o">新建合同</a></p>
                                    <div class="clear"></div>
                                     <div style="display:inline-block;">
                                        <div style="display:inline-block;float:left;">
                                            <select id="StateCode" name="StateCode" onchange="filterQuery('StateCode')" style="width:auto;">                                                
                                                <option value="">全部</option>
                                                <option value="0">草稿</option>
                                                <option value="2">执行中</option>
                                                <option value="3">暂停</option>
                                                <option value="4">已取消</option>
                                                <option value="5">已过期</option>
                                            </select>                                           
                                        </div>
                                        <p class="sousuo">                                         
                                            <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="GridInstance.search()" />
                                        </p>
                                        <div class="sousuo-tishi1"></div>
                                        <div class="sousuo-tishi">合同名称。使用筛选器。或改为对这些字段进行排序</div>
                                        
                                        <p class="neww" title="刷新">
                                            <img src="../img/cal/refresh.png" class="img1" style="width: 14px; height: 14px; margin-left: 8px; margin-top: 8px;">
                                        </p>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="table-body">
                                <div class="objectManagerLeftNav" style="padding-top: 0; height: 100%; padding-bottom: 0;">
                                    <div id="treePanel" class="easyui-panel" title="种类" style="padding: 5px; width: 240px; min-height: 0!important; height: calc(100% - 49px)!important; min-height: 200px;">
                                        <ul class="easyui-tree" id="leftTree" style="display: block; height: 100%; min-height: 300px;">
                                            <li></li>
                                        </ul>
                                    </div>
                                    <div id="gridContainer"></div>
                                    <div class="clear"></div>
                                </div>
                                <script type="text/javascript">
                                    var treeNode = null;
                                    var card = '';
                                    $(document).ready(function () {
                                        treeNode = new treeLoader("leftTree", "organizationtree", treeItemClick);
                                        treeNode.init();
                                        //var grid = new listGrid("datagrid", "P01");
                                        //grid.init();
                                        var screenHeight = getClientHeight();
                                        $("#treePanel").height(screenHeight - 111 - 100 - 70);
                                    });
                                    function treeItemClick(node) {
                                        //alert(node.id);
                                        //treeNode.loadNodeItems("employee.card.search", "categoryid=" + node.id, renderCards);
                                        //var extSrch = "DocumentTypeCode\teq\t" + node.text;
                                        var treenode = $('#leftTree').tree('getData', node.target)
                                        var ids = treeNode.getchildrendata(treenode)
                                        var extSrch = "OwningBusinessUnit\tin\t" + ids;
                                       // GridInstance.search(extSrch)
                                        doSearch(extSrch);
                                    }
                                    function filterQuery() {
                                        var extSrch = "StateCode\teq\t" + document.getElementById("StateCode").value;
                                        GridInstance.search(extSrch)
                                    }
                                    function openWindow(url, title) {
                                        window.open(url, title, 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
                                    }
                                    function formatOper(val, row, index, entityType) {
                                        var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
                                        var urlApprove = "/a0M/e?id=" + rowId;
                                        var name = row["Name"];
                                        name = name.substring(name.indexOf('>') + 1, name.lastIndexOf('<'));
                                        //console.log(rowId);
                                        //console.log(row);
                                        var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/' + entityType + '/detail?id=' + rowId + '">查看</a>&nbsp;';
                                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/apps/RecDetail.aspx?t=A08&id=" + rowId + "\"  >修改</a>&nbsp;";
                                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"renameDialog('" + rowId + "','" + name + "')\" >重命名</a>&nbsp;";
                                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:archiveDialog('" + rowId + "')\" >归档</a>&nbsp;";
                                        //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?type=1010&delID=" + rowId + "&retURL=\">删除</a>";
                                        return html;
                                    }

                                    function renameDialog(Id,Name) {
                                        var ObjectTypeCode = "100119";
                                        var Url = "/wfinstance/rename.aspx?Id=" + Id + "&Name=" + Name + "&ObjectTypeCode=" + ObjectTypeCode
                                        showDialog(Url, "archiveDialog", "重命名", 500, 200);
                                        return false;
                                    }

                                    function archiveDialog(id) {

                                        //var rows = $('#datagrid').datagrid('getSelections')
                                        //if (rows.length == 0) {
                                        //    alert("请选择记录！");
                                        //    return
                                        //}
                                        //var Ids = []
                                        //for (var i = 0; i < rows.length; i++) {
                                        //    Ids.push(rows[i].LIST_RECORD_ID)
                                        //}
                                        //Ids = Ids.join(',');
                                        ////console.log(Ids);
                                        //var ObjectTypeCode = "100119";
                                        //var Url = "/wfinstance/archive2.aspx?Ids=" + Ids + "&ObjectTypeCode=" + ObjectTypeCode
                                        //showDialog(Url, "archiveDialog", "归档", 500, 200);
                                        //return false;
                                        var objectTypeCode = "100119";
                                        var url = "/wfinstance/archive2.aspx?Ids=" + id + "&ObjectTypeCode=" + objectTypeCode;
                                        showDialog(url, "archiveDialog", "归档", 500, 200);
                                        return false;
                                    }
                                    var archive2ids = ''
                                    var archive2ObjectTypeCode = '100119';
                                    function archiveDialogs() {

                                        var rows = $('#datagrid').datagrid('getSelections')
                                        if (rows.length == 0) {
                                            alert("请选择记录！");
                                            return;
                                        }
                                        var strIds = "";
                                        var Ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            Ids.push(rows[i].LIST_RECORD_ID);
                                            //strIds + rows[i].LIST_RECORD_ID;
                                        }
                                        Ids = Ids.join(',');
                                        archive2ids = Ids;
                                        //console.log(Ids);
                                        var ObjectTypeCode = "100119";
                                        var Url = "/wfinstance/archive2.aspx?ObjectTypeCode=" + ObjectTypeCode + "&Ids=" + archive2ids;
                                        showDialog(Url, "archiveDialog", "归档", 500, 200);
                                        return false;
                                        //var ObjectTypeCode = "100119";
                                        //var Url = "/wfinstance/archive2.aspx?Ids=" + id + "&ObjectTypeCode=" + ObjectTypeCode
                                        //showDialog(Url, "archiveDialog", "归档", 500, 200);
                                        //return false;
                                    }
                                </script>                                 
                                <ctl:EasyGridListInit ID="EasyGridListInit1" runat="server" />
                            </div>
                        </div>
                        <script type="text/javascript">function bodyOnLoad() {
                            //resizeDesigner();
                            setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U%2Fc%3FcType%3D2%26md2%3D13%26md0%3D2016&isAjaxRequest=1&renderMode=RETRO&nocache=1458613543622'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
                            if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                        } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>


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
        $('#search').click(function () {
            var srchText = $('#srchText').val()
            var Number = $('#Number input').val()
            var StartTime = $('#StartTime').val()
            var EndTime = $('#EndTime').val()
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
