<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>短信发送记录查询</title>
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
        #tb {
            border:0;
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

        #gridContainer {
            width: 100%;
        }

        .inputdate, #Button1 {
            border: 1px solid #e6e6e6 !important;
            border-radius: 4px;
            text-indent: 5px;
        }

        #Button1 {
            margin-right: 10px;
            width: 150px;
            height: 32px;
            cursor: pointer;
            text-align: left;
        }

        .sousuo-tishi {
            top: 45px;
            left: 570px;
        }

        .sousuo-tishi1 {
            top: 30px;
            left: 590px;
        }

        .StateCodename {
            float: left;
            margin-top: 8px;
            margin-right: 3px;
        }

        .select {
            display: none;
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

                .select div:hover {
                    background-color: #f5f5f5;
                }

        .mission-hearder-right > div {
            float: left;
        }

        .mission-hearder-right div select {
            width: auto;
            min-width: 50px;
            border-radius: 4px;
            margin-left: 0;
            float: none;
            margin-right: 5px;
        }

        .mission-hearder-right > p {
            margin-left: 5px;
            margin-top: 3px;
        }

        .sousuo input {
            line-height: 30px;
            height: 30px;
            text-indent: 5px;
            width: 100%;
        }

        .mission-hearder-right .query {
            cursor: pointer;
            width: auto;
            padding: 0 10px;
        }

        .mission-hearder-right .sousuo {
            width: 100px;
        }

        .bPageTitle {
            float: left;
            width: 20%;
        }

        #bodyWrapper {
            float: right;
            width: 80%;
        }

            #bodyWrapper::after {
                content: '';
                clear: both;
            }

        .mission-header1 {
            height: 50px;
            border-bottom:0;
        }

        #gridContainer {
            margin-top: 0;
        }

            #gridContainer > div {
                float: left;
            }

            #gridContainer div.panel:last-of-type {
                margin-left: 5px;
                margin-right: 5px;
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
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "auraDomain": "", "dateTimeFormat": "yyyy-MM-dd HH:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "timeFormat": "HH:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <%--<link rel="shortcut icon" href="https://ap1..com/favicon.ico" />--%>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <%--<script type="text/javascript" src="/easyui/jquery.min.js"></script>--%>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/easyui/datagrid-export.js"></script>
    <style>
        .objectManagerLeftNav > div {
            float: left;
        }

        .datagrid-row-selected {
            background: rgb(242, 242, 242);
            color: #fff;
        }
        #bodyCell {
            height:auto;
        }
    </style>
    <script src="/js/jquery/jquery.fileDownload.js"></script>
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
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                           <%-- <img src="/s.gif" alt="短信发送记录查询" class="pageTitleIcon" title="短信发送记录查询" /><h1 class="pageType">短信发送记录查询<span class="titleSeparatingColon">:</span></h1>
                                            <h2 class="pageDescription">主页</h2>--%>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links"></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div id="bodyWrapper">
                            <div class="mission-header mission-header1">
                                <div class="mission-hearder-right">
                                    <div class="clear"></div>
                                    <div>
                                       发送日期 从:<input class="easyui-datebox" id="beginDate" style="width:120px" />至<input class="easyui-datebox" id="endDate" style="width:120px" />
                                       发送人:<input class="easyui-textbox" id="srchName" style="width:100px">
                                       手机号:<input class="easyui-textbox" id="srchMobile" style="width:100px">
                                    </div>

                                    
                                    <p class="query">
                                        查询
                                    </p>
                                    <p class="sousuo">
                                        <input type="text" placeholder="搜索关键字..." id="srchText" name="srchText" class="searchtext"    />
                                    </p>
                                    <div class="sousuo-tishi1"></div>
                                    <div class="sousuo-tishi">部门名称</div>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div style="">
                            <div class="objectManagerLeftNav" style="padding-top: 0; height: 100%; padding-bottom: 0;"></div>
                            <div id="gridContainer" style="overflow-y: auto;"></div>
                            <div width="100%">
                                <div>
                                    <div style="width:100%;float:left;">
                                        <div id="tb" style="height: auto">
                                          
                                           <%-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-toExcel',plain:true" onclick="exportExcel()">导出</a>--%>
                                            
                                        </div>
                                        <div id="gridContainerLeft" style="height:100%;" data-options="">
                                            <table id="dg" class="easyui-datagrid" style="width:100%;height:100%;"
                                                data-options="singleSelect: true,toolbar: '#tb', showFooter: true,	rownumbers: true,onClickRow:onClickRow,onEndEdit:onEndEdit">
                                                <thead>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>

                            <div class="clear"></div>


                            <script type="text/javascript">
                                var height = $(window).height()-190
                                $('#dg').height(height)
                                $('#employeegrid').height(height)

                                var editIndex = undefined;
                                function endEditing() {
                                    if (editIndex == undefined) { return true }
                                    if ($('#dg').datagrid('validateRow', editIndex)) {
                                        $('#dg').datagrid('endEdit', editIndex);
                                        editIndex = undefined;
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }

                                function onClickCell(index, field) {
                                   // alert(index);
                                    if (editIndex != index) {
                                        if (endEditing()) {
                                            $('#dg').datagrid('selectRow', index)
                                                    .datagrid('beginEdit', index);
                                            var ed = $('#dg').datagrid('getEditor', { index: index, field: field });
                                            if (ed) {
                                                ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                                            }
                                            editIndex = index;
                                        } else {
                                            setTimeout(function () {
                                                $('#dg').datagrid('selectRow', editIndex);
                                            }, 0);
                                        }
                                    }
                                }
                                function onEndEdit(index, row) {
                                    var ed = $(this).datagrid('getEditor', {
                                        index: index,
                                        field: 'ValueId'
                                    });
                                }
                                
                                function append() {
                                    if (endEditing()) {
                                        $('#dg').datagrid('appendRow', { status: 'P' });
                                        editIndex = $('#dg').datagrid('getRows').length - 1;
                                        $('#dg').datagrid('selectRow', editIndex)
                                                .datagrid('beginEdit', editIndex);
                                    }
                                }
                                function getChanges() {
                                    var rows = $('#dg').datagrid('getChanges');
                                    alert(rows.length + ' rows are changed!');
                                }
                            </script>
                        </div>

                        <!-- End page content -->
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
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <input id="ObjectTypeCode" type="hidden" value="600001" name="ObjectTypeCode" />
    <input id="IsUser" type="hidden" value="true" name="IsUser" />
    <script type="text/javascript">

        var editIndex = undefined;
        var editRow = undefined;
        var datagrid;
        var fromeditBtn = false;
        var index = 0
        var fieldList;
        $(function () {
            GetGirdData();
            $('.query').bind('click', GetGirdData);

        });


        function GetDeptGridData() {
            var objectTypeCode = $('#ObjectTypeCode').val();
            var yearNumber = $('#YearSelector').val();
            var monthNumber = $('#MonthSelector').val();
            var search = $('#srchText').val();
            var StatusCode = $('#StatusCode').val();
            var IsUser = $('#IsUser').val();
            if (Number(StatusCode) == -1)
                StatusCode = '';

            var url = "/apps/CommandProcessor.ashx?cmd=bonus.inex.import.list" + "&timeStamp=" + new Date().getTime();
            var gdata;

            jQuery.ajax({
                url: url,
                type: "post",
                async: false,
                cache: false,
                dataType: "json",
                data: getQueryParams(),
                success: function (data) {
                    gdata = data;
                }
            });

            return gdata;

        }

        function getParam(paramName) {
            paramValue = "", isFound = !1;
            if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
                arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
                while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
            }
            return paramValue == "" && (paramValue = null), paramValue
        }

        function getQueryParams() {
           
            var beginDate = $('#beginDate').datebox('getValue');
            var endDate = $('#endDate').combobox('getValue');
            var name = $('#srchName').textbox('getValue');
            var mobile = $('#srchMobile').textbox('getValue');
            
            var search = $('#srchText').val();
            var queryParams = {
                beginDate: beginDate,
                endDate: endDate,
                name: name,
                mobile: mobile,
                search: search
            }

            return queryParams;
        }

        function GetGirdData() {

            var beginDate = $('#beginDate').datebox('getValue');
            var endDate = $('#endDate').datebox('getValue');

            if (beginDate > endDate) {
                alert("选择的日期错误!");
                return false;
            }

            var pagination = true;

            var cols = [];
            cols.push({ field: "Name", title: '姓名' });
            cols.push({ field: "Mobile", title: '手机号码' });
            cols.push({ field: "Message", title: '消息内容' });
            cols.push({ field: "MsgType", title: '消息类型' });
            cols.push({ field: "MsgCount", title: '短信条数' });

            cols.push({ field: "CreatedByName", title: '发送人' });
            cols.push({ field: "CreatedOnStr", title: '发送时间' });

            cols.push({ field: "ModifiedByName", title: '更新人' });
            cols.push({ field: "ModifiedOnStr", title: '更新时间' });

            var url = "/apps/CommandProcessor.ashx?cmd=oa.sms.log.list" + "&timeStamp=" + new Date().getTime();
            datagrid = $('#dg').datagrid({
                url: url,
                method: 'post',
                queryParams: getQueryParams(),
                columns: [cols],
                fit: false,
                fitColumns: false,
                autoWidth: false,
                pagination: pagination,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                pageSize: 20,
                pageList: [20, 50, 100, 500, 1000],
                onLoadSuccess: function (data) {
                    $('#dg').datagrid('selectRow', index);

                    //var Title = ""
                    //if (data.rows.length > 0) {
                    //    Title = data.rows[index].Name + "-"
                    //    if (data.rows[index].ItemDeptName != null && data.rows[index].ItemDeptName != '') {
                    //        Title += data.rows[index].ItemDeptName + "-"
                    //    }
                    //}

                }
                , onDblClickRow: function (rowIndex, rowData) {
                    //双击开启编辑行
                    //if (rowData.StatusCode != "3") {
                    //    if (editRow != undefined) {
                    //        $('#dg').datagrid("endEdit", editRow);
                    //    }
                    //    $('#dg').datagrid("beginEdit", rowIndex);
                    //    editRow = rowIndex;
                    //    editIndex = rowIndex;
                    //}
                },
                onClickRow: function (rowIndex, row) {
                    //index = rowIndex
                    //$('#dg').datagrid("unselectAll");
                    //$('#dg').datagrid('selectRow', rowIndex);
                },
            });
        }


        function getFieldValues(valueId, row, index, fieldIndex) {
            var value = '';
            var fieldValues = row.FieldValues.split(';');
            console.log('fieldIndex:' + fieldIndex)
            console.log('fieldValues:' + fieldValues)
            if (fieldValues.length > 0 && fieldValues.length >= (fieldIndex - 1)) {
                value = fieldValues[fieldIndex];
                console.log('value:' + value)
            }
            return value;
        }

        function CreateYearOptions() {
            var currentYear = new Date().getFullYear();
            var startYear = 2008;

            var sel = $('<select id="YearSelector" >').appendTo('#YearOptions');
            var sel2 = $('<select id="YearSelector2" >').appendTo('#YearOptions2');

            for (var i = startYear; i <= currentYear; i++) {
                if (i == currentYear) {
                    sel.prepend($("<option selected = 'selected'>").attr('value', i).text(i));
                    sel2.prepend($("<option selected = 'selected'>").attr('value', i).text(i));
                }
                else {
                    sel.prepend($("<option>").attr('value', i).text(i));
                    sel2.prepend($("<option>").attr('value', i).text(i));
                }
            }

            return currentYear;
        }

        function CreateMonthOptions() {

            var currentMonth = new Date().getMonth();
            currentMonth = currentMonth + 1;
            var start = 1;

            var sel = $('<select id="MonthSelector"  >').appendTo('#MonthOptions');
            var sel2 = $('<select id="MonthSelector2"  >').appendTo('#MonthOptions2');
            for (var i = 12; i >= start; i--) {
                if (i == currentMonth) {
                    sel.prepend($("<option selected = 'selected'>").attr('value', i).text(i));
                    sel2.prepend($("<option selected = 'selected'>").attr('value', i).text(i));
                }
                else {
                    sel.prepend($("<option>").attr('value', i).text(i));
                    sel2.prepend($("<option>").attr('value', i).text(i));
                }
            }
            return currentMonth;
        }

        /*datagrid*/
        function removeit() {
            if (editRow != undefined) {
                $('#dg').datagrid('endEdit', editRow);
                editRow = undefined;
            }
            var row = $('#dg').datagrid('getSelected');
            row.IsDelete = 1;
            var rowIndex = $("#dg").datagrid("getRowIndex", row);
            $('#dg').datagrid('deleteRow', rowIndex);
        }

        function onClickRow(index) {

        }


        function reject() {
            $('#dg').datagrid('rejectChanges');
            editIndex = undefined;
        }

        function formatOper(val, row, index, entityType) {

            if (row.StatusCode != "3" && row.valueId != null) {
                var action = "<a style=\"color:#015ba7;font-size:13px;\" onclick=\"edititRow('" + index + "')\">修改</a>";
            }
            return action;
        }

        function removeitRow(index) {
            $('#dg').datagrid('deleteRow', index);
            var rows = $('#dg').datagrid("getRows");
            $('#dg').datagrid("loadData", rows);
        }

        function edititRow(index) {
            fromeditBtn = true;
            $('#dg').datagrid('endEdit', editIndex);
            $('#dg').datagrid("beginEdit", index);
            editRow = rowIndex;
            editIndex = index;

        }

        

        $(function () {
            var screenHeight = getClientHeight();
            screenHeight = screenHeight - 111 - 80;
            //alert(screenHeight);
            $('#gridContainerLeft').height(screenHeight+10);
            $('#gridContainerRight').height(screenHeight);
            $('#dg').height(screenHeight - 10);
        });

        $.extend($.fn.datagrid.methods, {
            statistics: function (jq) {

                //$('.datagrid-ftable .datagrid-row').html('<td>dd</td>');
                //return;

                //所有的列
                var opt = $(jq).datagrid('options').columns;
                //所有的行
                var rows = $(jq).datagrid("getRows");

                var footer = new Array();
                footer['sum'] = "";
                footer['max'] = "";

                for (var i = 0; i < opt[0].length; i++) {
                    var s = opt[0][i].max;
                    //console.info(s);
                    if (opt[0][i].heji) {
                        footer['sum'] = footer['sum'] + '"' + opt[0][i].field + '":"' + eval(opt[0][i].heji) + '"' + ',';
                    }

                    if (opt[0][i].max) {
                        footer['max'] = footer['max'] + '"' + opt[0][i].field + '":"' + eval(opt[0][i].max) + '"' + ',';
                    }
                }

                var footerObj = new Array();
                var obj1 = {};
                var obj2 = {};

                if (footer['sum'] != "") {
                    //var tmp = '{' + footer['sum'].substring(0, footer['sum'].length - 1) + "}";
                    // obj = eval('(' + tmp + ')');

                    if (obj1[opt[0][4].field] == undefined) {
                        //footer['sum'] += '"' + opt[0][4].field + '":';
                        obj1 = eval('({' + footer['sum'] + '})');
                    }
                }

                if (footer['max'] != "") {
                    //var tmp = '{' + footer['max'].substring(0, footer['max'].length - 1) + "}";
                    // obj = eval('(' + tmp + ')');
                    if (obj2[opt[0][4].field] == undefined) {
                        //footer['max'] += '"' + opt[0][4].field + '":';
                        obj2 = eval('({' + footer['max'] + '})');
                    }
                }
                footerObj.push($.extend(obj1, obj2));

                if (footerObj.length > 0) {
                    $(jq).datagrid('reloadFooter', footerObj);
                }

                function sum(filed, title) {
                    var sumNum = 0;
                    for (var i = 0; i < rows.length; i++) {
                        if (isNaN(Number(rows[i][filed])))
                            continue;
                        sumNum += Number(rows[i][filed]);
                    }
                    return title + sumNum.toFixed(2);
                }

                function avg(filed) {
                    var sumNum = 0;
                    for (var i = 0; i < rows.length; i++) {
                        if (isNaN(Number(rows[i][filed])))
                            continue;
                        sumNum += Number(rows[i][filed]);
                    }
                    return (sumNum / rows.length).toFixed(2);
                }

                function max(filed, title) {
                    var max = 0;
                    for (var i = 0; i < rows.length; i++) {
                        if (i == 0) {
                            if (isNaN(Number(rows[i][filed])))
                                continue;
                            max = Number(rows[i][filed]);
                        } else {
                            if (isNaN(Number(rows[i][filed])))
                                continue;
                            max = Math.max(max, Number(rows[i][filed]));
                        }
                    }
                    return title + max;
                }

                function min(filed) {
                    var min = 0;
                    for (var i = 0; i < rows.length; i++) {
                        if (i == 0) {
                            if (isNaN(Number(rows[i][filed])))
                                continue;
                            min = Number(rows[i][filed]);
                        } else {
                            if (isNaN(Number(rows[i][filed])))
                                continue;
                            min = Math.min(min, Number(rows[i][filed]));
                        }
                    }
                    return min;
                }
            }
        });

        //添加
        function addrows() {
            var url = "/sal/bonus/SelectDeptEmp2.aspx";
            showDialog(url, "batchArrangeshift", "人员选择", 750, 485);
            return false;
        }

        function SetField() {
            //var yearNumber = $('#YearSelector2').val();
            //var monthNumber = $('#MonthSelector2').val();
            var objectTypeCode = $('#ObjectTypeCode').val();
            
            var url = "/sal/CustomFieldSet.aspx?objectTypeCode=" + objectTypeCode;
            showDialog(url, "batchArrangeshift", "自定义字段设置", 600, 600);
            return false;
        }

        function AddSelectedEmps(empIds) {
            console.log(empIds)
            empIds = empIds.split(',')
            var json = []
            for (var i = 0; i < empIds.length; i++) {
                var data = {
                    empId: empIds[i].split('&')[0],
                    deptid: empIds[i].split('&')[1]
                }
                json.push(data)
            }
            var YearNumber = $('#YearSelector').val()
            var MonthNumber = $('#MonthSelector').val()
            var data = {
                YearNumber: YearNumber,
                MonthNumber: MonthNumber,
                EmployeeIds: json,
            }
            data = JSON.stringify(data)
            ajaxMethodPOSTData('bonus.dept.adds', data, function (data) {
                $('#dg').datagrid('reload')
            })
        }

        //保存
        function savedeptbonuslst() {
            var YearNumber = $('#YearSelector').val();
            var MonthNumber = $('#MonthSelector').val();
            $('#dg').datagrid('endEdit', editIndex);
            var data = $('#dg').datagrid('getData')
            for (var i = 0; i < data.rows.length; i++) {
                var fieldValues = '';
                if (fieldList != null && fieldList.length > 0) {
                    for (var j = 0; j < fieldList.length; j++) {
                        if (j > 0) {
                            fieldValues += ",";
                        }
                        var fieldName = "Field_" + j;
                        fieldValues += data.rows[i][fieldName]

                    }
                }

                console.log(fieldValues);
                data.rows[i].FieldValues = fieldValues;

            }

            rows = JSON.stringify(data.rows)
            var url = 'bonus.dept.batchupdate&YearNumber=' + YearNumber + "&MonthNumber=" + MonthNumber;
            ajaxMethodPOSTData(url, rows, function (data) {
                $('#dg').datagrid('reload')
            })
        }

        //分发
        function deptbatchstatus(status) {
            $('#dg').datagrid('endEdit', editIndex);
            var rows = $('#dg').datagrid('getChecked');
            var YearNumber = $('#YearSelector').val();
            var MonthNumber = $('#MonthSelector').val();
            var ValueIds = [];
            for (var i = 0; i < rows.length; i++) {
                ValueIds.push(rows[i].ValueId);
            }
            ValueIds = ValueIds.join(',')
            var data = {
                YearNumber: YearNumber,
                MonthNumber: MonthNumber,
                ValueIds: ValueIds,
                Status: status
            }

            console.log("ValueIds:" + ValueIds);
            var type = ''
            if (status == 1) {
                type = '分发'
            } else if (status == 3) {
                type = '封存'
            } else if (status == 2) {
                type = '解封'
            }
            if (ValueIds.length > 0) {
                if (confirm('您是否确认【' + type + "】?")) {
                    ajaxMethodPOSTData('bonus.dept.batchstatus' + "&timeStamp=" + new Date().getTime(), data, function (data) {
                        $('#dg').datagrid('reload');
                    })
                }
            } else {
                //alert('请先选中行!')
                if (confirm('您未勾选！是否确认【全部' + type + "】?")) {
                    ajaxMethodPOSTData('bonus.dept.batchstatus' + "&timeStamp=" + new Date().getTime(), data, function (data) {
                        $('#dg').datagrid('reload');
                    })
                }
            }
        }
        //删除
        function deleterows() {
            var yearNumber = $('#YearSelector').val();
            var monthNumber = $('#MonthSelector').val();
            var objectTypeCode = $('#ObjectTypeCode').val();

            var data = {
                yearNumber: yearNumber,
                monthNumber: monthNumber,
                objectTypeCode: objectTypeCode
            }

            if (confirm('您是否确认【' + yearNumber + '年' + monthNumber + '月数据全部删除】?')) {
                ajaxMethodPOSTData('bonus.inex.import.deletes', data, function (data) {
                    $('#dg').datagrid('reload')
                })
            }
        }

        function exportExcel() {
            var YearNumber = $('#YearSelector').val();
            var MonthNumber = $('#MonthSelector').val();
            var yearNumber2 = $('#YearSelector2').val();
            var monthNumber2 = $('#MonthSelector2').val();
            var search = $('#srchText').val();
          
            var objectTypeCode = $('#ObjectTypeCode').val();
            var IsUser = $('#IsUser').val();

            var url = '/apps/CommandProcessor.ashx?c=1&cmd=bonus.employee.excel&yearNumber=' + YearNumber + '&monthNumber=' + MonthNumber;
            url += '&yearNumber2=' + yearNumber2;
            url += '&monthNumber2=' + monthNumber2;
            url += '&objectTypeCode=' + objectTypeCode;
            url += '&search=' + search;
            url += '&isUser=' + IsUser;

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

        function exportExcel2() {

            var YearNumber = $('#YearSelector').val();
            var MonthNumber = $('#MonthSelector').val();
            var filename = YearNumber + '年' + MonthNumber + '月科室收支.xls';
          

            var result = $('#dg').datagrid('toExcel', {
                filename: filename,
                worksheet: filename
            });
        }


        function reloadEmpGrid() {
            $('#dg').datagrid('reload');
        }

        function uploadExcel() {
            var ObjectTypeCode = $('#ObjectTypeCode').val();
            var url = "/sal/uploadMonthExcel.aspx";
            url += "?ObjectTypeCode=" + ObjectTypeCode;

            showDialog(url, "batchArrangeshift", "导入Excel", 600, 500);
            return false;
        }

    </script>

</body>
</html>
