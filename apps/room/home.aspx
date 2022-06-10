<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议室预约 -  报表~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <%--  <link rel="stylesheet" href="/css/cal/mission.css" type="text/css" />
    <link rel="stylesheet" href="/css/cal/newmission.css" type="text/css" />--%>
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    

    <script src="/echart/echart.js"></script>
    <script src="/js/laydate/laydate.js"></script>
    <style type="text/css">
        #gridContainer {
            width: calc(100% - 239px);
            margin-top: 0px;
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

        #bodyCell {
            padding:0 0 6px 0;
        }

        body {
            /* height: 100%;
            overflow: hidden;*/
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
    </style>
    <style type="text/css">
        /*#bodyCell {
            padding: 0;
        }*/

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

        .cont-head-message li {
            float:left;
            width:18%;
            box-sizing:border-box;
            border:1px solid #dedede;
            border-radius:4px;
            margin-left:0;
            padding:10px;
            margin:1%;
            font-size:14px;
        }
        .head-message-amount, .head-message-money {
            margin-top:10px;
        }
        .head-message-amount span, .head-message-money span{
            font-size:16px;
            margin-left:5px;

        }
        .head-message-title {
            font-weight:700;
            font-size:16px;
        }
        .cont-head-message {
            margin-top:10px;
            border-radius:4px;
            box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.3);
        }
        .bodyDiv {
            background-color:transparent;
            box-shadow:none;
        }
        .cont-head-message {
            background-color:white;
        }
        .cont-item {
            padding:15px;
            border-radius:4px;
            margin-top:10px;
            background-color:white;
            width:49.5%;
            box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.3);
            box-sizing:border-box;
            float:left;
            height:440px;
        }
        .cont-item-head {
            font-size:16px;
            color:#333;
            font-weight:700;
        }
        .cont-item-body table {
            border-collapse:collapse;
            border:1px solid #dedede;
            width:100%;
            margin-top:15px;
        }
        .cont-item-body td, .cont-item-body th {
            padding:8px 10px;
            border-top:1px solid #dedede;
            border-bottom:1px solid #dedede;
        }
        .cont-item-body th {
            background-color:#f2f2f2;
        }
        .tab_header_right {
            float:right;
        }
        .tab_header_right div {
            border: 1px solid #dddbda;
            border-radius: 4px;
            behavior: url(/home/ie-css3.htc);
            position: relative;
            z-index: 2;
            float: left;
            height: 28px;
            width: 28px;
            margin-left: 10px;
            background-color: white;
            cursor:pointer;
        }
        .tab_header_right img {
            width: 14px;
            height: 14px;
            position: absolute;
            left: 7px;
            top: 7px;
        }
        .cont-item.right {
            float:right;
        }
        .clear {
            clear:both;
        }
        .cont-item-body tr:hover {
            background-color:#f2f2f2;
        }
        .cont-item{
            width:100%;
        }
        .cont-head-message li{
            min-height:100px;
        }
        .roomcheck{
            background-color:white;
            margin-top:10px;
            border-radius:4px;
            padding:10px;
        }
        .roomcheck li{
            float:left;
            padding:5px 10px;
            border:1px solid #dedede;
            border-radius:4px;
            cursor:pointer;
            margin-top:4px;
        }
        .roomcheck-right{
            padding-bottom:4px;
        }
        .roomcheck li.active{
            background-color:#ecf5ff;
            color:#409eff;
            border-color: #b3d8ff;
        }
        .roomcheck li:hover{
            color: #fff;
            background-color: #409eff;
            border-color: #409eff;
        }
        .roomcheck>div:first-child{
            width:100%;
            border-top:1px solid #dedede;
            border-radius:4px 4px 0 0;
        }
        .roomcheck>div{
            width:100%;
            border:1px solid #dedede;
            border-top:0;
        }
        .roomcheck>div:last-child{
            border-radius:0 0 4px 4px;
        }
        .roomcheck-left{
            width:15%;
            background-color:#f2f2f2;
            padding:10px;
            float:left;
            box-sizing:border-box;
            height:100%;

        }
        .roomcheck-right{
            width:85%;
            box-sizing:border-box;
            float:left;

        }
        .layui-input{
            width:100px;
            height: 26px;
            line-height: 1.3;
            line-height: 38px\9;
            border-width: 1px;
            border-style: solid;
            background-color: #fff;
            border-radius: 2px;
            border-color: #e6e6e6;
            text-indent:15px;
            margin-top:4px;
            margin-left:10px;
        }
        .miss-header{
            background-color:white;
            border-radius:0 0 4px 4px;
        }
        .calander .selectlist{
            right:15px;
        }
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
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/easyui/js/EasyUtils.js"></script>
  <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
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
                        <div class="miss-header">
        <div class="header-left-logo">
            <img src="/template/hearder/logo.png">
        </div>
        <div class="header-left-title2">
            <p class="header-left-title-name">会议室预约</p>
        </div>
        
        <div class="header-right-buttonbtn">
           <div class="buttonbtn calander selectbuttonbtn">
                <div class="selectlist selectlistcheck">
                    <ul class="daytype-chook">
                        <li>日历</li>
                        <li>我的预约</li>
                        <li class="active">报表</li>
                    </ul>
                </div>
            </div>
            
        </div>
    </div>
                        <div style="width:80%">
                        <div class="cont-head-message">
                            <ul>
                                
                                <li>
                                    <div class="head-message-title">
                                        <span>会议室预约次数</span>
                                    </div>
                                    <div class="head-message-amount">总预约次数：<span class="PaidQuantity" id="ResTotalNum">25</span></div>
                                    <div class="head-message-money">我的预约次数:<span class="PaidAmount" id="MyResNum">200005</span></div>
                                </li>
                                <li>
                                    <div class="head-message-title">
                                        <span>会议室数量</span>
                                    </div>
                                    <div class="head-message-amount ">会议室数量：<span class="TotalQuantity" id="OrgNum">25</span></div>
                           
                                </li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <div class="roomcheck">
                            <div>
                                 <div class="roomcheck-left">
                                    时间范围
                                 </div>
                                 <div class="roomcheck-right">
                                     <span style="margin-left:15px;">请选择年份</span>
                                    <input value="2020" class="layui-input" id="timechook" />
                                 </div>
                                <div class="clear">
                                </div> 
                            </div>
                            <div>
                            <div class="roomcheck-left">
                                会议室
                            </div>
                            <div class="roomcheck-right">
                               <ul>
                               </ul>
                               
                            </div>
                                <div class="clear">
                                </div> 
                            </div>
                            <div id="main"style="width: 100%;height:400px;padding-top:10px;">

                            </div>
                        </div>
                            
                        <div>
                        <div class="cont-item">
                            <div class="cont-item-head">
                                会议室预约次数统计
                                <div class="tab_header_right">
                                <div>
                                    <img src="/img/cal/refresh.png" alt="">
                                </div>
                                <div>
                                    <img src="/img/images/8.new_window(16x16).png" alt="">
                                </div>
                            </div>
                            </div>
                            <div class="cont-item-body">
                                <table>
                                    <tr>
                                        <th>会议室</th>
                                        <th>一月</th>
                                        <th>二月</th>
                                        <th>三月</th>
                                        <th>四月</th>
                                        <th>五月</th>
                                        <th>六月</th>
                                        <th>七月</th>
                                        <th>八月</th>
                                        <th>九月</th>
                                        <th>十月</th>
                                        <th>十一月</th>
                                        <th>十二月</th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                            <div class="clear"></div>

                        </div>
                            
                       
                            </div>
                        <script>
                            var myChart = echarts.init(document.getElementById('main'));

                            var linedata = {
                                year: '2020',
                                type: "2",
                                ids:''
                            }
                            var lineoption = ''
                            laydate.render({
                                elem: '#timechook'
                                 , type: 'year',
                                 change: function (val) {
                                     window.linedata.year=val
                                    getdata()
                                }
                            })
                            ajaxMethodGetData('resource.type.list',{type:2}, function (data) {
                                
                                for (var i = 0; i < data.data.length; i++) {
                                    var res = data.data[i]
                                    $('.roomcheck-right ul').append('<li class="active"roomid="' + res.Id + '">' + res.Name + '</li>')
                                    $('.roomcheck-left').eq(1).height($('.roomcheck-left').eq(1).parent().height())
                                }
                                $('.roomcheck-right ul').append('<li>清除选择</li>')

                                $('.roomcheck-right ul li').not($('.roomcheck-right ul li:last')).click(function () {
                                    $(this).toggleClass('active')
                                    window.linedata.ids = []
                                    $('.roomcheck-right ul li.active').each(function () {
                                        window.linedata.ids.push($(this).attr('roomid'))
                                    })
                                    window.linedata.ids = window.linedata.ids.join(',')
                                    getdata()
                                })
                                $('.roomcheck-right ul li:last').click(function () {
                                    $(this).parent().find('li').removeClass('active')
                                    window.linedata.ids = 'null'
                                    getdata()
                                })

                            })
                            getdata()
                            function getdata() {
                                ajaxMethodGetData('resource.room.stat', linedata, function (data) {
                                    window.lineoption = data.data
                                    for (var i = 0; i < window.lineoption.seriesData.length; i++) {
                                        window.lineoption.seriesData[i].type='line'
                                    }
                                    $('#MyResNum').html(data.MyResNum)
                                    $('#OrgNum').html(data.OrgNum)
                                    $('#ResTotalNum').html(data.ResTotalNum)
                                })

                                var option = {
                                    title: {
                                        text: '会议室预约次数统计'
                                    },
                                    tooltip: {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        data: window.lineoption.lineData
                                    },
                                    grid: {
                                        left: '3%',
                                        right: '4%',
                                        bottom: '3%',
                                        containLabel: true
                                    },
                                    toolbox: {
                                        feature: {
                                            saveAsImage: {}
                                        }
                                    },
                                    xAxis: {
                                        type: 'category',
                                        boundaryGap: false,
                                        data: window.lineoption.xData
                                    },
                                    yAxis: {
                                        type: 'value'
                                    },
                                    series: window.lineoption.seriesData
                                };
                                myChart.setOption(option);
                                $('.cont-item-body tbody tr').not($('.cont-item-body tbody tr:first')).remove()
                                for (var i = 0; i < window.lineoption.seriesData.length; i++) {
                                    var res = window.lineoption.seriesData[i]
                                    var html = '<tr><td>' + res.name + '</td>'
                                    for (var j = 0; j < res.data.length; j++) {
                                        html +='<td>' + res.data[j] + '</td>'
                                    }
                                    html += '</tr>'
                                    $('.cont-item-body tbody').append(html)
                                }
                            }

                            $('.daytype-chook li').eq(0).click(function () {
                                window.location.href = '/025/c?rType=2'
                            })
                            $('.daytype-chook li').eq(1).click(function () {
                                window.location.href = '/apps/room/reservationlst.aspx?entityType=025&t=025'
                            })
                            

                            
                        </script>






























                       
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() {
    //resizeDesigner();
    setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U%2Fc%3FcType%3D2%26md2%3D13%26md0%3D2016&isAjaxRequest=1&renderMode=RETRO&nocache=1458613543622'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
    if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
} function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>


                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
    </div>   
        <script src="/template/js/indexjs.js"></script>

</body>
</html>
<!-- page generation time: 203ms -->

