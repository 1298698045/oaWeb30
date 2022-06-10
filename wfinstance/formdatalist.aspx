<%@ Page Language="C#"%>

<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>流程 : 表单数据 ~ 高效协同</title>
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
        #gridContainer{
            width:calc(100% - 240px);
            margin:-13px 0 0 -1px;
        }
        body{
            overflow:hidden;
        }
        
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

    <script type="text/javascript">
        function loadNew() {
            if (!commonUtils.isBrowserSupported() || commonUtils.IS_IE8 || commonUtils.IS_IE7) {
                window.location = "/apps/hr/EmpSrch.aspx?t=a0V";
            }
        }
        //loadNew();
    </script>
    <style>
        .miss-header {
            border-bottom: 1px solid #ccc;
        }
        .header-right-buttonbtn .shuaxin {
            margin-left: 10px !important;
        }
        .objectManagerLeftNav > div {
            float: left;
        }
        .pointereventsnone{
            pointer-events:none;
            opacity:0.5;
        }
        #contentmessage{
            text-align:center;
            height:100%;
            width:100%;
            padding-left:240px;
            box-sizing:border-box;
            position:absolute;
            font-size:22px;
            color:#333;
        }
        .panel.panel-htop{
            position:relative;
            z-index:10;
        }
    </style>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />
    <link href="/layui/layui/css/layui.css" rel="stylesheet" />
    <link href="/js/filter/filter_ie8.css" rel="stylesheet" />
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif contactTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <div id="contentWrapper" style="vertical-align:middle">
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
                            <div class="miss-header pointereventsnone">
                                <div class="header-left-logo">
                                    <img src="/template/hearder/logo.png" />
                                </div>
                                <div class="header-left-title">
                                    <p class="header-left-title-name">表单数据</p>
                                    <p class="header-left-title-listname selectinput"><span>我的表单数据</span><img src="/img/cal/20.png" alt="" /></p>
                                    <div class="selectlist selectlistcheck">
                                        <ul>
                                        </ul>
                                    </div>
                                </div>
                                <div class="header-right-buttonbtn">
                                    <%--<div class="buttonbtn-group">
                                        <div class="buttonbtn"><a href="/a0V/e?retURL=%2fa0V%2f/o">新建</a></div>
                                    </div>--%>
                                </div>
                                <div class="header-right-buttonbtn">
                                    <div class="buttonbtn buttonbtnsousuo">
                                        <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="GridInstance.search()" />
                                    </div>

                                    <div class="buttonbtn viewlist selectbuttonbtn">
                                <img class="viewlistimg" src="/img/cal/settings_1.png" alt="" />
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
                                <img src="/img/cal/refresh.png" alt="" />
                            </div>


                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="table-body">
                                <div class="objectManagerLeftNav" style="padding-top: 0; height: 100%; padding-bottom: 0;">
                                    <div id="treePanel" class="easyui-panel" title="流程分类" style="padding: 5px; width: 240px; min-height: 0!important; height: calc(100% - 49px)!important; min-height: 200px;">
                                        <ul class="easyui-tree" id="leftTree" style="display: block; height: 100%; min-height: 300px;">
                                            <li></li>
                                        </ul>
                                    </div>
                                    <div id="gridContainer"></div>
                                    <div id="contentmessage">请先选择流程</div>
                                    <div class="clear"></div>
                                </div>
                                <script type="text/javascript">
                                    var treeEntityType = ''
                                    var treeNode = null;
                                    var card = '';

                                    function dataformatter(data) {
                                        if (!data.processId) {
                                            for (var i = 0; i < data.Processes.length; i++) {
                                                dataformatter(data.Processes[i])
                                            }
                                            data.children = data.Processes
                                            if (data.children.length > 0) {
                                                data.state = "closed";
                                            }
                                            data.id = data.folderId
                                        } else {
                                            data.id = data.processId
                                            data.EntityType = data.EntityType
                                        }
                                    }
                                    $('#treePanel').tree({
                                            url: '/apps/CommandProcessor.ashx?c=1&cmd=process.search',
                                            loadFilter: function(data){
                                                if (data.d){
                                                    return data.d;
                                                } else {
                                                    for (var i = 0; i < data.processLists.length; i++) {
                                                        dataformatter(data.processLists[i])
                                                    }
                                                }
                                                return data.processLists;
                                            },
                                            formatter: function (node) {
                                                return node.name
                                            },
                                            onClick: function (node) {
                                                if (node.EntityType) {
                                                    $('#contentmessage').hide()
                                                    $('.pointereventsnone').removeClass('pointereventsnone')
                                                    treeEntityType = node.EntityType
                                                    listView.getMetadataInitialLoad('');
                                                    GridInstance.init("gridContainer",'', '');
                                                    getFilterList('')
                                                }
                                            }
                                        })
                                        var screenHeight = getClientHeight();
                                        $("#treePanel").height(screenHeight - 220);
                                        $('#contentmessage').height(screenHeight - 220).css('line-height', screenHeight -220+'px');
                                    
                                    function openWindow(url, title) {
                                        window.open(url, title, 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
                                    }
                                    function formatOper(val, row, index, entityType) {
                                        var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
                                        var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/122/detail?id=' + rowId + '">查看</a>&nbsp;';
                                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:openWindow('/apps/wf/WFFormPrint.aspx?InstanceId=" + rowId + "','_contract')\" >打印</a>&nbsp;";
                                        return html;
                                    }
                                    var listView
                                    jQuery(document).ready(function () {
                                        listView = new listViewManager();
                                        
                                        //listView.getMetadataInitialLoad('');
                                        var treeHeight = getClientHeight(); treeHeight = treeHeight - 111 - 37 - 80;
                                        var w = getClientWidth(); var clientHeight = getClientHeight();
                                        $("#gridContainer").height(treeHeight - 280);
                                        var gd = getQueryString("gd");
                                        //GridInstance.init("gridContainer", '', '');
                                        entityType = '';
                                    })
                                </script>
                            </div>
                        </div>
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
            $(this).find("img").prop("src", "/img/cal/filterList_3.png")
            var width = $(".datagrid-wrap").width()
            $(".datagrid-wrap").width(width - 360)
            $("#gridContainer").width(width - 360)
            $(".datagrid-body").css("overflow", "auto")
            $(".datagrid-body").width(width - 390)
        })
        function closeIFramesx() {
            $('iframe').remove();
            $(".ppp").find("img").prop("src", "/img/cal/filterList_2.png")
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
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>

    <iframe id="iframe" src=""></iframe>
    <div class="popup-mask"></div>

    <script src="/layui/layui/layui.js"></script>
    <script src="/js/filter/filter_ie8.js"></script>
</body>
</html>