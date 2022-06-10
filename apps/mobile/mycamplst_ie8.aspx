<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>短信管理 - 短信管理 ~  - Developer Edition</title>
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
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />


    <link href="/layui/layui/css/layui.css" rel="stylesheet" />
    <link href="/js/filter/filter_ie8.css" rel="stylesheet" />
    <style type="text/css">
        body {
    height:100%;
    overflow:hidden;
}
        .recurrenceFrequency {
            margin: 0;
        }

        #gridContainer {
            margin-top: -13px;
            margin-left: 0px;
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
        #bodyWrapper ul,#bodyWrapper li {
            margin-left:0;
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
                <tr>

                    <td class="oRight" id="bodyCell">
                       
                        <div id="bodyWrapper">
                           
                            <div class="miss-header">
                                <div class="header-left-logo">
                                    <img src="/template/hearder/logo.png" />
                                </div>
                                <div class="header-left-title">
                                    <p class="header-left-title-name">短信管理</p>
                                    <p class="header-left-title-listname selectinput"><span>我的合同</span><img src="/img/cal/20.png" alt="" /></p>
                                    <div class="selectlist selectlistcheck">
                                        <ul>
                                        </ul>
                                    </div>
                                </div>
                                <div class="header-right-buttonbtn">
                                    <div class="buttonbtn-group">
                                        <div class="buttonbtn"><a href="/apps/mobile/SmsMsgEdit.aspx?t=705&retURL=%2f705%2fo">新建发送</a></div>
                                        <div class="buttonbtn  copy"><a href="/apps/mobile/Sendtxt.aspx?t=705&retURL=%2f705%2fo">复制号码发送</a></div>
                                        <div class="buttonbtn "><a href="/apps/mobile/SmsLogsList.aspx?t=705&retURL=%2f705%2fo">记录查询</a></div>
                                    </div>
                                </div>
                                <div class="header-right-buttonbtn">
                                    <div class="buttonbtn buttonbtnsousuo">
                                        <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="GridInstance.search()" />
                                    </div>

                                    <div class="buttonbtn viewlist selectbuttonbtn">
                                        <img class="viewlistimg" src="/img/cal/19.settings_1(14x14).png" alt="" />
                                        <img class="downlist" src="/img/cal/20.png" alt="" />
                                        <div class="selectlist" style="width:160px;">
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
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="buttonbtn shaixuan ban">
                                        <img src="/img/cal/22.filterList_2(14x14).png" alt="" />
                                    </div>

                                    <div class="buttonbtn shuaxin neww">
                                        <img src="/img/cal/14.refresh_1(14x14).png" alt="" />
                                    </div>


                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="objectManagerLeftNav" style="padding-top: 0; height: 100%; padding-bottom: 0;">
                                <div id="gridContainer" style="min-height: 300px;">
                            </div>
                            <div class="clear"></div>
                        </div>
                        
                        <ctl:EasyGridListInit ID="EasyGridListInit1" runat="server" />

                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="popup-mask">
    </div>
        <iframe frameborder="0" id="iframe" src=""></iframe>

    <script src="/js/mission-header.js"></script>
    <script src="/js/cal/mission2.js"></script>
    <script src="/js/schedule.js"></script>
    <script>
        function closeIFrame() {
            $('iframe').remove();
        }
    </script>
    <script>

        function formatOper(val, row, index, entityType) {
            var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
            var a = "<a style=\"color:#015ba7;font-size:13px;\" href='/" + entityType + "/detail?id=" + rowId + "'>查看</a>";
            //a += "&nbsp;|&nbsp;<a onclick=\"setLastMousePosition(event); uploadAttach('" + rowId + "')\" style=\"color:#015ba7;font-size:13px;\" href=\"#\">上传发票</a>&nbsp;";
            return a;
        }
        function edit(id) {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/cntrt/new_invoicelst.html?id=' + id)
        }
    </script>
    
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>
    <script src="/layui/layui/layui.js"></script>

    <script src="/js/filter/filter_ie8.js"></script>
    

</body>
</html>
