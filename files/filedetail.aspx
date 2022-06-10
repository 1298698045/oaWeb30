<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="filedetail.aspx.cs" Inherits="Supermore.files.filedetail" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>文件详情 -  ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
        <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
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
     <script src="/jslibrary/sfdc/Security.js"></script>
    <link rel="stylesheet" href="/css/cal/card.css">
    <link rel="stylesheet" href="/css/cal/allmission.css">
    <link rel="stylesheet" href="/css/cal/newmission.css">
    <link rel="stylesheet" href="/css/cal/ca.css">
    <link rel="stylesheet" href="/css/cal/mission.css">
    <link rel="stylesheet" href="/css/cntrt/cntrt.css">
    <link rel="stylesheet" href="/css/view.css">
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <script src="/js/entityDetail.js" type="text/javascript"></script>
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />

    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        .recurrenceFrequency {
            margin: 0;
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

        .caozuo {
            margin-right: 20px;
        }

        .genggai-div2 {
            right: 20px;
        }

        .othermession {
            height: 120px;
        }

        .mission-header {
            background-color: #fafafa;
            margin-top: 0;
            padding-top: 20px;
            box-sizing: border-box;
            height: 155px;
        }

        .mission-header-leftlogo div {
            top: 20px;
        }

        .head-bottbo {
            margin-top: -9px;
            border-bottom: 0;
        }

        .mission {
            margin-top: 0px;
        }

        .contract-message {
            height: 80px;
            margin-top: 10px;
            overflow: hidden;
            background-color: white;
        }

            .contract-message ul {
                height: 20px;
            }

                .contract-message ul li {
                    float: left;
                    width: 150px;
                    font-size: 12px;
                }

        .contract-message-head {
            margin-top: 20px;
        }

        .popup-mask {
            left: -10px;
            width: 110%;
        }

        .missionmession {
            height: 200px;
        }

        .missionright-head span {
            font-weight: 500;
        }

        .missionright-body {
            border: 0;
        }

        .file-body {
            border: 1px solid #e4e8eb;
            padding: 20px;
            height: 140px;
            box-sizing: border-box;
        }

            .file-body > div {
                background-color: #f2f2f2;
                float: left;
                height: 100px;
                width: 47.5%;
                padding: 10px;
                box-sizing: border-box;
                border-radius: 4px;
            }

        .file-download {
            margin-left: 5%;
        }

        .file-readnumber, .file-downloadnumber {
            display: block;
            font-size: 50px;
            color: #3399ff;
        }

        .genggai-div3 {
            top: 200px;
        }
       .zhenwen #iframe3{
            display:block;
            position:static;
            height:500px;
            border:0;
            width:100%;
        }
        .preview{
            position:absolute;
            top:15px;
            left:73%;
            border:1px solid #e4e8eb;
            height:30px;
            width:40px;
            border-radius:4px;
            background-color:white;
            opacity:0.5
        }
        .zhenwen{
            position:relative;
        }
        .preview img{
            width:14px;
            height:14px;
            margin-left:13px;
            margin-top:9px;
            cursor:pointer;
        }
        .delete-shur{
            top:50%;
            margin-top:-100px;
            position:fixed;
        }
        .delete-mask{
            position:fixed;
        }  
        .rightdiv2{
            margin-top:10px;
            padding-left:0;
            padding-right:0;
            padding-bottom:10px;
        }
    .rightdiv2 .missionright-body3{
        padding-bottom:10px;

    }
    .rightdiv2 ul{
        border-top:1px solid #dedede;
        border-bottom:1px solid #dedede;
    }
    .rightdiv2 li{
        width:50%;
        border:none;
        float:left;
        margin:0;
        box-sizing:border-box;
        padding-left:10px;
        height:60px;
    }
    .missionright-head p {
        margin-right:15px;
    }
    .missionright-head{
        margin-top:0;
    }
    .missionright-foot{
        text-align:center;
        color:#3399ff;
        cursor:pointer;
    }
    .missionright-head span{
        font-size:14px;
        font-weight:700;
    }
    .stlectbtn{
        display:inline-block;
        height:16px;
        width:16px;
        background:url('/img/cal/20.png') no-repeat center;
        background-size:10px;
        border:1px solid #dedede;
        border-radius:4px;
        float:right;
        cursor:pointer;
    }
    .mission-left{
        min-height:500px;
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
        height: 620px;
        border: 0;
    }
    .popup-mask{
        background: url(/img/bgOverlayDialogBackground.png);
        background-color: transparent;
        position: fixed;
            left: -10px;
    width: 110%;
    height:100%;
    }
    </style>
</head>
 <body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif eventTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
     <div class="delete-mask">
    </div>   
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
                            <div class="genggai-div2 genggai-div4">
                                <%--<div class="popup-show">上传新版本</div>--%>
                                <div class="popup-show editfile">编辑文件详情信息</div>
                                <%--<div class="popup-show">删除</div>--%>
                            </div>
                            <div class="genggai-div2 genggai-div3">
                                <div class="popup-show">查看详情</div>
                                <div class="popup-show">下载详情</div>
                            </div>
                            <div class="mission-header mission-header2">
                                <div class="mission-header-leftlogo">
                                    <p class="logo">
                                        <img src="/img/cal/36716c23006ae55602be70724a7d35a.png" alt="" />
                                    </p>
                                    <div>文件</div>
                                    <p>技术开发(合作)合同</p>
                                </div>
                                <div class="mission-header-right">
                                    <div class="caozuo">
                                        <p class="bianji">下载</p>
                                        <%--<p class="shanchu popup-show">共享</p>
                                        <p class="genggai popup-show">公共链接</p>--%>
                                        <p class="genggai popup-show">删除</p>
                                        <p class="select">
                                            <!-- <img src="img/20.PNG"> -->
                                            <img src="/img/cal/20.png" alt="" style="left:5px;top:10px;" />
                                        </p>
                                    </div>
                                </div>
                                <div class="clear"></div>
                                <div class="contract-message">
                                    <ul class="contract-message-head">
                                        <li>大小</li>
                                        <li>文件扩展名</li>
                                        <li>所有人</li>
                                    </ul>
                                    <ul>
                                        <li>61kb</li>
                                        <li>doc</li>
                                        <li class="blue">张丽萍</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="mission">
                                <div class="mission-left">
                                    <div class="missionleft-head">
                                        <ul>
                                            <li class="first active">预览</li>
                                            <li>详细信息</li>
                                            <li class="readli">阅读记录</li>
                                            <li class="downloadli">下载记录</li>
                                        </ul>
                                    </div>
                                    <div class="missionleft-body">
                                        <div class="zhenwen active">
                                            <div class="preview">
                                                <img src="/img/images/3621.png" />
                                            </div>
                                            <iframe id="iframe3">                                                
		                                    </iframe>
                                        </div>
                                        <script>
                                            var objectTypeCode = 100100
                                        </script>
                                        <div id="layoutview" class=""></div>
                                        <script src="/layouteditor/layout_view.js?a=1"></script>
                                        <link href="/layouteditor/layout_main.css" rel="stylesheet" />
                                        <div class="read">
                                            <div class="people-body">
                                                <div id="readpeopleContainer" style="min-height:300px;"></div>
                                            </div>
                                        </div>
                                        <script>
                                            
                                            var columns= [[
                                                    //{
                                                    //    field: 'Action', title: '操作', formatter: function (value, row, inde) {
                                                    //        var html = '<a style="color:#015ba7;font-size:13px;" onclick=remarksdept("' + row["Id"] + '"' + ',"8")>备注</a>'

                                                    //        html += '<a style="color:#015ba7;font-size:13px;margin-left:5px;" onclick=deletedept("' + row["Id"] + '"' + ',"8")>删除</a>'
                                                    //        return html
                                                    //    }
                                                    //},
                                                    { field: 'UserName', title: '姓名', },
                                                    { field: 'BusinessUnitName', title: '部门', },
                                                    { field: 'IpAddr', title: 'IP地址', },
                                                    { field: 'BrowserName', title: '浏览器', },
                                                    { field: 'CreatedOn', title: '首次阅读时间', },
                                                    { field: 'ModifiedOn', title: '最后阅读时间', },
                                            ]]
                                            var id = getQueryString('id')
                                            $('#readpeopleContainer').datagrid({
                                                columns: columns,
                                                fitCloumns: true,
                                                idField: "LIST_RECORD_ID",
                                                singleSelect: false,
                                                checkOnSelect: true,
                                                method: 'POST',
                                                pagination: true,
                                                rownumbers: true,
                                                url: "/apps/CommandProcessor.ashx?cmd=file.log.search&fileId=" + id,
                                                striped: false,
                                                // 隔行变色特性s
                                                pageSize: 10,
                                                pageList: [10, 15, 20, 25, 30, 50, 100],
                                                queryParams: {
                                                    message: window.messages
                                                },
                                                //onLoadSuccess: function (data) {
                                                //    $('.file-readnumber').html(data.total)
                                                //}
                                            })
                                            
                                            
                                        </script>
                                        <div class="read">
                                            <div class="people-body">
                                                <div id="downloadpeople" style="min-height:300px;"></div>
                                            </div>
                                        </div>
                                        <script>

                                            var columns = [[
                                                    //{
                                                    //    field: 'Action', title: '操作', formatter: function (value, row, inde) {
                                                    //        var html = '<a style="color:#015ba7;font-size:13px;" onclick=remarksdept("' + row["Id"] + '"' + ',"8")>备注</a>'

                                                    //        html += '<a style="color:#015ba7;font-size:13px;margin-left:5px;" onclick=deletedept("' + row["Id"] + '"' + ',"8")>删除</a>'
                                                    //        return html
                                                    //    }
                                                    //},
                                                    { field: 'UserName', title: '姓名', },
                                                    { field: 'BusinessUnitName', title: '部门', },
                                                    { field: 'IpAddr', title: 'IP地址', },
                                                    { field: 'BrowserName', title: '浏览器', },
                                                    { field: 'DownloadTimes', title: '下载次数', },
                                                    { field: 'CreatedOn', title: '首次阅读时间', },
                                                    { field: 'ModifiedOn', title: '最后阅读时间', },
                                            ]]
                                            var id = getQueryString('id')
                                            $('#downloadpeople').datagrid({
                                                columns: columns,
                                                fitCloumns: true,
                                                idField: "LIST_RECORD_ID",
                                                singleSelect: false,
                                                checkOnSelect: true,
                                                method: 'POST',
                                                pagination: true,
                                                rownumbers: true,
                                                url: "/apps/CommandProcessor.ashx?cmd=file.log.search&download=1&fileId=" + id,
                                                striped: false,
                                                // 隔行变色特性s
                                                pageSize: 10,
                                                pageList: [10, 15, 20, 25, 30, 50, 100],
                                                queryParams: {
                                                    message: window.messages
                                                },
                                                //onLoadSuccess: function (data) {
                                                //    $('.file-downloadnumber').html(data.total)
                                                //}
                                            })


                                        </script>




                                    </div>
                                </div>
                                <div class="mission-right">
                                    <div class="missionright-body missionright-body3">
                                        <div class="missionright-head">
                                            <span>文件参与</span>
                                        </div>
                                        <div class="file-body">
                                            <div class="file-read">
                                                <span>查看</span>
                                                <span class="file-readnumber"></span>
                                            </div>
                                            <div class="file-download">
                                                <span>下载</span>
                                                <span class="file-downloadnumber"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- <div class="mission-right rightdiv2">
                                    <div class="missionright-body missionright-body3">
                                         <div class="missionright-head">
                                            <p></p>
                                            <span>共享者</span>
                                            <span>(1)</span>
                                            <div class="stlectbtn">

                                            </div>
                                        </div>
                                            <ul>
                                            <li>
                                                <img src="/img/cal/1.png">
                                                <div class="div1">
                                                    <p class="name">
                                                        <span>张丽萍</span>
                                                    </p>
                                                    <p class="jieshao">
                                                        <span class="chakan">所有人</span>
                                                    </p>
                                                </div>
                                            </li>
                                                <div class="clear"></div>
                                            </ul>
                                    </div>
                                     <div class="missionright-foot">
                                         查看全部
                                     </div>
                                </div>--%>
                                <%--<div class="mission-right rightdiv2">
                                    <div class="missionright-body missionright-body3">
                                         <div class="missionright-head">
                                            <p></p>
                                            <span>关注者</span>
                                            <span>(2)</span>
                                           <div class="stlectbtn">

                                            </div>
                                        </div>
                                            <ul>
                                            <li>
                                                <img src="/img/cal/1.png">
                                                <div class="div1">
                                                    <p class="name">
                                                        <span>张丽萍</span>
                                                    </p>
                                                    <p class="jieshao">
                                                        <span class="chakan">所有人</span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <img src="/img/cal/1.png">
                                                <div class="div1">
                                                    <p class="name">
                                                        <span>张丽萍</span>
                                                    </p>
                                                    <p class="jieshao">
                                                        <span class="chakan">所有人</span>
                                                    </p>
                                                </div>
                                            </li>
                                                <div class="clear"></div>
                                            </ul>
                                    </div>
                                     <div class="missionright-foot">
                                         查看全部
                                     </div>
                                </div>--%>
                                
                            </div>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
     <div class="delete-shur">
        <div class="popup-exit"></div>
        <div class="delete-shur-head">
            删除合同
        </div>
        <div class="delete-shur-body">
            是否确定要删除此合同?
        </div>
        <div class="delete-shur-foot">
            <div class="delete-de">删除</div>
            <div>取消</div>
        </div>
    </div>
     <div class="file-preview">
        <div class="file-preview-mask"></div>
        <div class="file-preview-head">
            <div class="file-preview-head-left">
                <div class="file-preview-type">
                    <img src="/img/filetype/doc.png"  />
                </div>
                <div class="file-preview-name">
                    <span>绍兴第二医院事业单位聘用合同书</span>
                </div>
            </div>
            <div class="file-preview-head-middle">
                <div class="file-preview-download">
                    <img src="/img/cal/679 (2).png" style="width:18px;height:18px;"  />
                    <span>下载</span>
                </div>
                <div class="file-preview-edit">
                    <img src="/img/cal/679 (1).png" style="width:18px;height:18px;"  />
                    <span>编辑</span>
                </div>
                <div class="file-preview-share">
                    <img src="/img/cal/679.png" style="width:18px;height:18px;"  />
                    <span>分享</span>
                </div>
            </div>
            <div class="file-preview-head-right">
                <img src="/img/cal/4.closeIcon(24x24).png"style="width:20px;height:20px;"  />
            </div>          
        </div>
        <iframe src='' onload="shareIframeImg(this)"id="iframe2">
		</iframe>
    </div>
        <script src="/js/CommonUtils.js" type="text/javascript"></script>
        <script src="/js/file/file.js"></script>
     <script>
         function shareIframeImg(i) {
             $('iframe2').attr('src')
            var img = $(i.contentWindow.document).find("img")
            img.width("50%")
            img.css("max-width", "50%")
            img.css("position", "absolute")
            img.css("top", '50%')
            img.css("left", '50%')
            img.css("margin-top", '-25%')
            img.css("margin-left", '-25%')
        }
        $('.missionleft-head li').eq(2).click(function () {
            $('#readpeopleContainer').datagrid('resize')
        })
        $('.missionleft-head li').eq(3).click(function () {
            $('#downloadpeople').datagrid('resize')
        })
        gettotal()
        function gettotal() {
            var fileId = getQueryString('id')
            ajaxMethodGetData('file.log.total', { fileId: fileId }, function (data) {
                $('.file-readnumber').html(data.ReadTotal)
                $('.file-downloadnumber').html(data.DownloadTotal)
            })
        }
     </script>
     <iframe src=''id="iframe"></iframe>
     <div class="popup-mask"></div>
    </body>
<script>
    

</script>
</html>
