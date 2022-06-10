<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Supermore.wfinstance.dashboard" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>流程管理 ： 流程运行统计报表</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/EXT/ext-3.2.2/resources/css/ext-all.css" rel="stylesheet"
        type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/Calendar.css"
        rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/content/video/zxf_page.css" />
    <link rel="stylesheet" type="text/css" href="/wfinstance/dashboard.css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>

    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-MM-dd ah:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <link rel="stylesheet" href="/css/report.css">
    <style>
        input[type=color], input[type=date], input[type=datetime-local], input[type=datetime], input[type=email], input[type=month], input[type=number], input[type=password], input[type=search], input[type=tel], input[type=text], input[type=time], input[type=url], input[type=week], select, textarea {
            width: 18%;
        }

        .overview-gap {
            clear: both;
            background-color: #ececec;
            height: 18px;
        }

        .chart {
            height: 200px;
            margin: 0px;
            padding: 0px;
        }

        h5 {
            margin-top: 30px;
            font-weight: bold;
        }

            h5:first-child {
                margin-top: 15px;
            }

        .div {
            width: 100%;
            margin: 0 auto;
        }



        .ul {
            display: flex;
            list-style: none;
        }

        .item {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 1px solid #C1DAD7;
            background: #C1DAD7;
            margin-right: 20px;
            text-align: center;
            line-height: 100px;
            color: #fff;
        }


        #table {
            margin-bottom: 15px;
        }

            #table .table-layout-09 {
                table-layout: auto;
            }

        .table {
            border-collapse: collapse;
            line-height: 1.2;
            border-top: 1px solid #dedede;
            color: #323437;
            background-color: #fff;
            width: 100%;
            font-size: 13px;
        }

        .table,
        table {
            border-spacing: 0;
        }

            .table thead {
                background-color: #f4f4f4;
            }

                .table thead td {
                    height: 44px;
                    border-bottom: 1px solid #dedede;
                    padding-top: 0;
                    padding-bottom: 0;
                }

            .table td {
                white-space: nowrap;
                font-weight: 400;
                padding-top: 3px;
                padding-bottom: 3px;
            }

        td,
        th {
            padding: 0;
        }

        .table .no-expand-col {
            padding-left: 23px;
            cursor: pointer;
            overflow: hidden;
        }


        #table .table-layout-09 .td-content {
            overflow: hidden;
            text-overflow: ellipsis;
            position: relative;
        }

        .table thead .group-title .td-content {
            text-align: left;
            text-indent: 10px;
        }

        .table thead .td-content {
            color: #5d5d61;
        }

        .table .td-content {
            line-height: 1;
            display: inline-block;
            overflow: hidden; /*超出的部分隐藏起来。*/
            white-space: nowrap; /*不显示的地方用省略号...代替*/
            text-overflow: ellipsis; /* 支持 IE */
            width: 36%;
        }


        #table .table-layout-09.table-layout-02 .number-col {
            padding-left: 0;
        }

        .table .number-col,
        .table tbody .number-col,
        .table thead .number-col {
            text-align: left;
            padding-right: 14px;
        }

        #table .table-layout-09 .url,
        #table .table-layout-09 .url .td-content,
        #table .table-layout-09 .url .td-content a {
            width: auto;
            overflow: visible;
            word-break: break-all;
            white-space: normal;
        }

        .table .table-index {
            text-indent: 0;
            text-align: left;
        }

        .table thead .group {
            border-left: 1px solid #dedede;
        }

        .table thead .group {
            border-left: 1px solid #dedede;
        }


        .table tbody .line td {
            padding-top: 8px;
            padding-bottom: 8px;
            border-bottom: 1px solid #dedede;
        }

        .block {
            position: relative;
            padding: 0;
            background: rgb(255, 255, 255);
            /*border: 1px solid rgb(221, 219, 218);*/
            border-radius: .25rem;
            background-clip: padding-box;
            /*box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.10);*/
            margin-top: 0px;
        }

        .tab_div {
            display: none;
        }

        .rpt-filter {
            position: relative;
            height: 45px;
        }

            .rpt-filter .view-type {
                width: 100%;
                height: 45px;
            }

        .l {
            float: left;
        }

        .tabs {
            border-top: 1px solid #e1e3e4;
            border-bottom: 1px solid #e1e3e4;
            background-color: #f8f8f8;
        }

        .rpt-filter .view-type ul {
            height: 45px;
        }

        .clearfix {
            display: block;
        }

        .tabs ul li.selected {
            /*bottom: -1px;*/
            border-top: 3px solid #4aa6fc;
            padding: 14px 35px;
            margin-top: -1px;
            background: #fff;
        }

        .tabs, .tabs ul li.selected, a.help {
            position: relative;
        }

            .tabs ul li {
                float: left;
                padding: 14px 35px;
                border-right: 1px solid #e1e3e4;
                cursor: pointer;
                font-size: 14px;
                line-height: 1;
                margin-left: 0;
                height: 45px;
                z-index: 888;
            }

                .tabs ul li.selected a {
                    color: #121315;
                }

                .tabs ul li a {
                    color: #323437;
                }

                .tabs ul li a, a.help {
                    display: inline-block;
                }

        .tabs {
            border-top: 1px solid #e1e3e4;
            border-bottom: 1px solid #e1e3e4;
            background-color: #f8f8f8;
        }

        .tab-tip {
            position: relative;
            top: 14px;
            margin-left: 15px;
            color: #787a7d;
        }

        .clearfix:after {
            content: "\200B";
            display: block;
            height: 0;
            clear: both;
        }

        .tab-contents, .time-span a {
            background-color: #fff;
        }

        .trend-detail .filters {
            padding: 0 20px 5px;
        }

        .filters {
            padding-bottom: 10px;
        }

        .control-bar-wrapper {
            position: relative;
            padding-top: 20px;
            padding-bottom: 15px;
            z-index: 2;
            color: #323437;
        }

        .drop-down-container {
            position: relative;
        }

        .filter {
            float: left;
            margin-right: 20px;
        }

        .drop-down-container .drop-down-label {
            padding-right: 5px;
            color: #787a7d;
        }

        .drop-down-container .drop-down-label {
            float: left;
            height: 26px;
            line-height: 26px;
        }

        .drop-down-container .drop-down-header {
            display: flex;
            zoom: 1;
            height: 24px;
            line-height: 24px;
            border: 1px solid #d9dbdc;
            border-radius: 2px;
            cursor: pointer;
            background-color: #fff;
        }

            .drop-down-container .drop-down-header .drop-down-text {
                float: left;
                padding: 0 10px;
                width: 84%;
                height: 24px;
                line-height: 24px;
            }

            .drop-down-container .drop-down-header .drop-down-texts {
                float: left;
                padding: 0 10px;
                width: 69%;
                height: 24px;
                line-height: 24px;
            }

        .ellipsis {
            display: inline-block;
            width: 100%;
            overflow: hidden;
        }

        .drop-down-container .drop-down-list ul li, .ellipsis, .engine-layer .link, .header-wrapper .top-nav .account-wrapper .account, .hm-charts-custom-legend .hm-html-legend-item, .options li a, .referer-layer .link, .selector .site-selector-options li, .title-ellipsis {
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .btn-arrow, .btn-hover .btn-arrow, .btn-selected .btn-arrow {
            display: inline-block;
            height: 23px;
            width: 24px;
            border-left: 1px solid #d9dbdc;
            border-top-right-radius: 2px;
            border-bottom-right-radius: 2px;
            background-image: url(/img/common.png);
            -background-image: url(/img/common.png);
            background-position: left -525px;
            background-repeat: no-repeat;
        }

        :root .drop-down-list {
            border: none;
        }

        .drop-down-container .drop-down-list {
            z-index: 99;
            position: absolute;
            top: 31px;
            left: 0;
            padding: 5px 0;
            max-height: 260px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #a0a2a5;
            border-radius: 2px;
            -webkit-box-shadow: 0 1px 5px rgba(0,0,0,.2);
            box-shadow: 0 1px 5px rgba(0,0,0,.2);
            background-color: #fff;
        }

        .tabs ul li.active {
            /* bottom: -1px; */
            border-top: 3px solid #4aa6fc;
            padding: 14px 35px;
            margin-top: -1px;
            background: #fff;
        }

        .selecteds {
            bottom: -1px;
            border-top: 3px solid #4aa6fc;
            padding: 14px 35px;
            margin-top: -1px;
            background: #fff;
            position: relative;
        }

        .drop-down-container .drop-down-list ul li.drop-down-query-li {
            margin: 0 10px 5px;
            border: 1px solid #dedede;
            border-radius: 2px;
        }

        .drop-down-container .drop-down-list ul li {
            margin-left: 0;
            padding: 0 10px;
            height: 26px;
            line-height: 26px;
            overflow: hidden;
            cursor: default;
        }

            .drop-down-container .drop-down-list ul li.drop-down-clickable {
                cursor: pointer;
            }

            .drop-down-container .drop-down-list ul li.drop-down-query-li .drop-down-search-btn {
                float: right;
                width: 14px;
                background-position: left -686px;
                background-repeat: no-repeat;
            }

            .drop-down-container .drop-down-list ul li .drop-down-query {
                border: 0;
                outline-style: none;
            }

        input {
            line-height: normal;
        }

        .filter .group {
            float: left;
            background-color: #fff;
            border-radius: 2px;
        }

            .filter .group li:first-child {
                margin-left: 0;
                border-top-left-radius: 2px;
                border-bottom-left-radius: 2px;
            }

            .filter .group .cur {
                position: relative;
                z-index: 1;
                border: 1px solid #4aa6fc;
                color: #fff;
            }


            .filter .group li {
                cursor: pointer;
                padding: 0 12px;
                border: 1px solid #e1e3e4;
                margin-left: -1px;
            }

            .filter .group li, .filter label {
                height: 24px;
                line-height: 24px;
                float: left;
            }


        .trend-detail .filters .filter-content-wrapper {
            height: auto;
            line-height: 0;
        }

        .filter-content-wrapper {
            height: 26px;
            line-height: 26px;
            padding-bottom: 5px;
        }

        .table-filter {
            margin-top: 20px;
        }

        .table-filter {
            padding-left: 20px;
            height: 46px;
            line-height: 46px;
            border-top: 1px solid #e1e3e4;
            background-color: #f9f9f9;
        }

        .query-item, .query-item .btn {
            margin-right: 20px;
        }

        .l {
            float: left;
        }

        .query-item span {
            color: #787a7d;
        }

        input[type=text].text, input[type=password].text {
            height: 24px;
            padding: 0;
            border: 1px solid #e1e3e4;
            border-radius: 2px;
            text-indent: 10px;
            line-height: 24px;
        }

        .query-item input {
            width: 120px;
            margin-left: 6px;
            font-size: 12px;
            margin-bottom: 0;
        }

        .query-item, .query-item .btns {
            margin-right: 20px;
        }


        .btns {
            display: inline-block;
            zoom: 1;
            padding: 6px 16px;
            border: 1px solid #d9dbdc;
            border-radius: 2px;
            text-align: center;
            line-height: 1;
            color: #323437;
            cursor: pointer;
            outline: 0;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background: #fff;
        }

        .table tbody tr .open {
            background-image: url(/img/close.png);
        }

        .expand-col {
            background-image: url(/img/expand.png);
        }

        .three_list {
            background-image: url(/img/expand.png);
        }

        .table tbody tr .opens {
            background-image: url(/img/close.png);
        }

        .table tbody tr .expand-col, .table tbody tr .three_list, .table tbody tr .open, .table tbody tr .opens {
            background-position: 9px center;
            background-repeat: no-repeat;
        }

        .filter-items {
            margin-bottom: 13px;
        }

        .drop-down-container .drop-down-list {
            z-index: 99;
            position: absolute;
            top: 31px;
            left: 0;
            padding: 5px 0;
            max-height: 260px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #a0a2a5;
            border-radius: 2px;
            -webkit-box-shadow: 0 1px 5px rgba(0,0,0,.2);
            box-shadow: 0 1px 5px rgba(0,0,0,.2);
            background-color: #fff;
        }

            .drop-down-container .drop-down-list ul li.drop-down-query-li {
                margin: 0 10px 5px;
                border: 1px solid #dedede;
                border-radius: 2px;
            }

            .drop-down-container .drop-down-list ul li {
                height: 26px;
                line-height: 26px;
                overflow: hidden;
                cursor: default;
            }

                .drop-down-container .drop-down-list ul li.drop-down-query-li .drop-down-search-btn {
                    float: right;
                    width: 14px;
                    background-position: left -686px;
                    background-repeat: no-repeat;
                }

                .drop-down-container .drop-down-list ul li .drop-down-query {
                    border: 0;
                    outline-style: none;
                }

        drop-down-container .drop-down-list ul li.drop-down-clickable {
            cursor: pointer;
        }


        .drop-down-container .drop-down-list ul li.drop-down-shortcut {
            border-top: 1px solid #f0f0f0;
            border-bottom: 1px solid #f0f0f0;
            color: #787a7d;
            background-color: #f2f4f4;
        }

        .up {
            float: right;
            margin-top: 6px;
            padding-right: 14px;
        }

        #summary {
            padding: 30px 0;
            border-top: 1px solid #f0f0f0;
            border-bottom: 1px solid #f0f0f0;
        }

        table.summary {
            border-collapse: separate;
        }

            table.summary tr td {
                text-align: left;
                border-right: 1px solid #f0f0f0;
                padding: 0 20px;
            }

                table.summary tr td span.text {
                    color: #787a7d;
                }

                    table.summary tr td span.text .help {
                        top: 1px;
                    }

        a.help {
            top: 6px;
            height: 12px;
            width: 12px;
            margin-left: 5px;
            background-repeat: no-repeat;
            background-image: url(/img/common.png);
            -background-image: url(/img/common.png);
            background-position: left -2112px;
        }

        table.summary tr td div.summary-ellipsis {
            white-space: nowrap;
        }

        table.summary tr td div.value {
            margin-top: 12px;
            font-size: 20px;
            color: #121315;
        }


        table.summary tr td.last {
            border-right: none;
        }

        .table tbody .sub-line .empty-col {
            border-bottom: 1px solid #fff;
            /*background-color: #fff;*/
        }

        .table tbody .line-first td, .table tbody .sub-line td {
            padding-top: 8px;
            padding-bottom: 8px;  
        }
        .table tbody .sub-line-last, .table tbody .tr-title,.sub-line-last {
            background-color: #f9f9f9;
        }
        .table tbody .sub-line td {
            border-bottom: 1px solid #dedede;
            /*background-color: #f9f9f9;*/
        }

        .table tbody .sub-line-last td, .table tbody .tr-title td {
            border-bottom: 1px solid #dedede;
        }

        .table .empty-col {
            width: 15px;
        }

        .table td {
            white-space: nowrap;
            font-weight: 400;
            padding-top: 3px;
            padding-bottom: 3px;
        }

        .table tbody .sub-line .no-expand-col {
            cursor: default;
            border-left: 1px solid #dedede;
            border-top: 1px solid #dedede;
            border-bottom: 1px solid #dedede;
        }

        .table tbody .sub-line .sub-title {
            text-align: left;
        }

        .table tbody .sub-line:first-child .sub-title .icon, .table-indicator .group label .checkbox, .table-indicator .group label .checkbox.checked, .table-indicator-custom-btn {
            background-image: url(/img/common.png);
            background-repeat: no-repeat;
            -background-image: url(/img/common.png);
        }

        .table tbody .sub-line:first-child .sub-title .icon {
            position: absolute;
            left: -40px;
            top: -17px;
            width: 11px;
            height: 9px;
            display: block;
            background-position: left -2050px;
        }
    </style>
    <script type="text/javascript">
        function showDay() {
            var sess = document.getElementById("sessionKey").value;
            window.location = "/rpts/monthChart.aspx?sessionKey=" + sess;
        }
        function showWeek() {
            var sess = document.getElementById("sessionKey").value;
            window.location = "/rpts/hisweekRpt.aspx?sessionKey=" + sess;
        }
        function showMonth() {
            var sess = document.getElementById("sessionKey").value;
            window.location = "/rpts/hismonthRpt.aspx?sessionKey=" + sess;
        }
    </script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/libs/echarts-all.js"></script>
    <script type="text/javascript" src="/content/video/zxf_page.js"></script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif reportTab  reportRunPage sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <div class="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outerNoSidebar" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="noSidebarCell" style="background-color: #f4f4f4;">
                        <a name="skiplink">
                            <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif">
                        </a>
                        <div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img title="报表" class="pageTitleIcon" alt="报表" src="/s.gif" /><h1 class="pageType noSecondHeader">流程管理：流程运行统计报表</h1>
                                    <div class="blank">
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="links">
                                    <!--
                                            <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds('', false, false);">
                                                <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif" /></a>-->
                                </div>
                            </div>
                            <div class="ptBreadcrumb">
                            </div>
                        </div>
                        <!--内容-->
                        <script src="/js/echarts.js"></script>
                        <div class="div">
                            <div class="rpt-filter">
                                <div id="ViewType" class="view-type l">
                                    <div class="tabs">
                                        <ul class="clearfix selected clearfixs">
                                            <li class="true selecteds">
                                                <label>
                                                    <span>部门</span>
                                                    <input class="tabToggle hide" type="radio" name="tabToggle" value="0" style="display: none;" />
                                                </label>
                                            </li>
                                            <li class="false">
                                                <label>
                                                    <span>人员</span>
                                                    <input class="tabToggle hide" type="radio" name="tabToggle" value="1" style="display: none;" />
                                                </label>
                                            </li>
                                            <li class="false">
                                                <label>
                                                    <span>流程</span>
                                                    <input class="tabToggle hide" type="radio" name="tabToggle" value="2" style="display: none;" />
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="SourceType" class="source-type l">
                                </div>
                            </div>

                            <div class="block tab_div" style="display: block;">
                                <div id="summary" class="section ">
                                    <table class="summary" style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td><span class="text">发起总数<a href="javascript:void(0);" data="pv_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis all" title="9,155"></div>
                                                </td>
                                                <td><span class="text">逾期总数<a href="javascript:void(0);" data="visitor_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis yuqi" title="1,218"></div>
                                                </td>
                                                <td><span class="text">待办总数<a href="javascript:void(0);" data="ip_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis daiban" title="1,361"></div>
                                                </td>
                                                <%-- <td><span class="text">流转中<a href="javascript:void(0);" data="bounce_ratio" class="help">&nbsp;</a></span><div class="value summary-ellipsis liuzhuan" title="22.11%">22.11%</div>
                                                </td>--%>
                                                <td class="last"><span class="text">已完结<a href="javascript:void(0);" data="avg_visit_time" class="help">&nbsp;</a></span><div class="value summary-ellipsis wanjie" title="00:10:30"></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="main" style="width: 99%; height: 400px; margin-top: 15px; margin-bottom: 30px;"></div>
                                <div class="overview-gap"></div>
                                <div class="trend-detail-filter">
                                    <div id="view-tabs" class="view-tabs">
                                        <div class="tabs clearfix">
                                            <ul class="l selected">
                                                <li class="active">
                                                    <a href="javascript:void(0);">部门明细</a>
                                                </li>
                                            </ul>
                                            <%--<div class="tab-tip l">（仅提供两周内的部门明细，最多5000条）</div>--%>
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="table-filter clearfix">
                                    <div id="visitor-query-container">
                                        <div class="query-item l">
                                            <span>关键词/搜索词</span>
                                            <input type="text" class="text first_input" id="search-key-word-value" placeholder="请输入...">
                                        </div>
                                        <%--  <div class="query-item l">
                                            <span>入口页面</span>
                                            <input type="text" class="text" id="landing-page-value" placeholder="请输入...">
                                        </div>
                                        <div class="query-item l">
                                            <span>访客标识码</span>
                                            <input type="text" class="text" id="visitor-value" placeholder="请输入...">
                                        </div>
                                        <div class="query-item l">
                                            <span>IP</span>
                                            <input type="text" class="text" id="ip-value" placeholder="请输入...">
                                        </div>--%>
                                        <div class="query-item l">
                                            <button class="btns first_btn" id="query-visitor" style="margin-top: 11px;">查询</button>
                                            <button id="cancel-visitor" style="display: none;" href="javascript:void(0);">返回</button>
                                        </div>
                                    </div>
                                </div>
                                <div id="table">
                                    <table class="table table-layout-03 table_first">
                                        <thead>
                                            <tr class="group-item" id="">
                                                <td class="empty-col" data="" id="Td1" colspan="1" rowspan="1">
                                                    <div class="td-content">&nbsp;</div>
                                                </td>
                                                <td class="no-expand-col" data="" id="Td2" colspan="1" rowspan="1">
                                                    <div class="td-content">&nbsp;</div>
                                                </td>
                                                <td class="number-col" data="" id="Td3" colspan="1" rowspan="1">
                                                    <div class="td-content">序号</div>
                                                </td>
                                                <td class=" sortable desc" data="start_time" id="start_time" colspan="" rowspan="">
                                                    <div class="td-content">部门</div>
                                                </td>
                                                <td class="" data="area" id="area" colspan="" rowspan="">
                                                    <div class="td-content">部门编码</div>
                                                </td>
                                                <td class="url sortable" data="source" id="source" colspan="" rowspan="">
                                                    <div class="td-content">逾期数量</div>
                                                </td>
                                                <td class="url" data="access_page" id="access_page" colspan="" rowspan="">
                                                    <div class="td-content">待办数量</div>
                                                </td>
                                                <td class="empty-col last" data="" id="Td4" colspan="" rowspan="">
                                                    <div class="td-content">&nbsp;</div>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="pagesize" style="opacity: 0;"></div>
                                <div class="zxf_pagediv"></div>
                            </div>
                            <div class="block tab_div">
                                <div id="summary" class="section ">
                                    <table class="summary" style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td><span class="text">发起总数<a href="javascript:void(0);" data="pv_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis all" title="9,155"></div>
                                                </td>
                                                <td><span class="text">逾期总数<a href="javascript:void(0);" data="visitor_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis yuqi" title="1,218"></div>
                                                </td>
                                                <td><span class="text">待办总数<a href="javascript:void(0);" data="ip_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis daiban" title="1,361"></div>
                                                </td>
                                                <%-- <td><span class="text">流转中<a href="javascript:void(0);" data="bounce_ratio" class="help">&nbsp;</a></span><div class="value summary-ellipsis liuzhuan" title="22.11%">22.11%</div>
                                                </td>--%>
                                                <td class="last"><span class="text">已完结<a href="javascript:void(0);" data="avg_visit_time" class="help">&nbsp;</a></span><div class="value summary-ellipsis wanjie" title="00:10:30">00:10:30</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="mains" style="width: 100%; height: 400px; margin-top: 15px; margin-bottom: 30px;"></div>
                                <div class="overview-gap"></div>
                                <div class="trend-detail-filter">
                                    <div id="Div2" class="view-tabs">
                                        <div class="tabs clearfix">
                                            <ul class="l selected">
                                                <li class="active">
                                                    <a href="javascript:void(0);">人员明细</a>
                                                </li>
                                            </ul>
                                            <%--<div class="tab-tip l">（仅提供两周内的访问明细，最多5000条）</div>--%>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="table-filter clearfix">
                                    <div id="Div13">
                                        <div class="query-item l">
                                            <span>关键词/搜索词</span>
                                            <input type="text" class="text second_input" id="Text1" placeholder="请输入...">
                                        </div>
                                        <%--  <div class="query-item l">
                                            <span>入口页面</span>
                                            <input type="text" class="text" id="Text2" placeholder="请输入...">
                                        </div>
                                        <div class="query-item l">
                                            <span>访客标识码</span>
                                            <input type="text" class="text" id="Text3" placeholder="请输入...">
                                        </div>
                                        <div class="query-item l">
                                            <span>IP</span>
                                            <input type="text" class="text" id="Text4" placeholder="请输入...">
                                        </div>--%>
                                        <div class="query-item l">
                                            <button class="btns second_btn" id="Btn2" style="margin-top: 11px;">查询</button>
                                            <button id="A3" style="display: none;" href="javascript:void(0);">返回</button>
                                        </div>
                                    </div>
                                </div>
                                <div id="table">
                                    <table class="table table-layout-03 table_second">
                                        <thead>
                                            <tr class="group-item" id="Tr1">
                                                <td class="empty-col" data="" id="Td35" colspan="1" rowspan="1">
                                                    <div class="td-content">&nbsp;</div>
                                                </td>
                                                <td class="no-expand-col" data="" id="Td36" colspan="1" rowspan="1">
                                                    <div class="td-content">&nbsp;</div>
                                                </td>
                                                <td class="number-col" data="" id="Td37" colspan="1" rowspan="1">
                                                    <div class="td-content">序号</div>
                                                </td>
                                                <td class=" sortable desc" data="start_time" id="Td39" colspan="" rowspan="">
                                                    <div class="td-content">人员</div>
                                                </td>
                                                <td class=" sortable desc" data="start_time" id="Td5" colspan="" rowspan="">
                                                    <div class="td-content">部门</div>
                                                </td>
                                                <td class="" data="area" id="Td40" colspan="" rowspan="">
                                                    <div class="td-content">逾期数量</div>
                                                </td>
                                                <td class="url sortable" data="source" id="Td41" colspan="" rowspan="">
                                                    <div class="td-content">待办数量</div>
                                                </td>
                                                <td class="empty-col last" data="" id="Td48" colspan="" rowspan="">
                                                    <div class="td-content">&nbsp;</div>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        
                                        <tfoot></tfoot>
                                    </table>
                                </div>
                                <div class="pagesizes" style="opacity: 0;"></div>
                                <div class="zxf_pagedivs"></div>
                            </div>
                            <div class="block tab_div">
                                <div id="summary" class="section ">
                                    <table class="summary" style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td><span class="text">发起总数<a href="javascript:void(0);" data="pv_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis all" title="9,155"></div>
                                                </td>
                                                <td><span class="text">逾期总数<a href="javascript:void(0);" data="visitor_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis yuqi" title="1,218"></div>
                                                </td>
                                                <td><span class="text">待办总数<a href="javascript:void(0);" data="ip_count" class="help">&nbsp;</a></span><div class="value summary-ellipsis daiban" title="1,361"></div>
                                                </td>
                                                <%-- <td><span class="text">流转中<a href="javascript:void(0);" data="bounce_ratio" class="help">&nbsp;</a></span><div class="value summary-ellipsis liuzhuan" title="22.11%">22.11%</div>
                                                </td>--%>
                                                <td class="last"><span class="text">已完结<a href="javascript:void(0);" data="avg_visit_time" class="help">&nbsp;</a></span><div class="value summary-ellipsis wanjie" title="00:10:30">00:10:30</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="maina" style="width: 100%; height: 400px; margin-top: 15px; margin-bottom: 30px;"></div>
                                <div class="overview-gap"></div>
                                <div class="trend-detail-filter">
                                    <div id="Div5" class="view-tabs">
                                        <div class="tabs clearfix">
                                            <ul class="l selected">
                                                <li class="active">
                                                    <a href="javascript:void(0);">流程明细</a>
                                                </li>
                                            </ul>
                                            <%--<div class="tab-tip l">（仅提供两周内的访问明细，最多5000条）</div>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-filter clearfix">
                                    <div id="Div23">
                                        <div class="query-item l">
                                            <span>关键词/搜索词</span>
                                            <input type="text" class="text third_input" id="Text5" placeholder="请输入...">
                                        </div>
                                        <div class="query-item l">
                                            <button class="btns third_btn" id="Btn3" style="margin-top: 11px;">查询</button>
                                            <button id="A6" style="display: none;" href="javascript:void(0);">返回</button>
                                        </div>
                                    </div>
                                </div>
                                <div id="table">
                                    <table class="table table-layout-03 table_third">
                                        <thead>
                                            <tr class="group-item" id="Tr5">
                                                <td class="no-expand-col" data="" id="Td73" colspan="1" rowspan="1">
                                                    <div class="td-content">&nbsp;</div>
                                                </td>
                                                <td class="number-col" data="" id="Td74" colspan="1" rowspan="1">
                                                    <div class="td-content">序号</div>
                                                </td>
                                                <td class=" sortable desc" data="start_time" id="Td76" colspan="" rowspan="">
                                                    <div class="td-content">流程</div>
                                                </td>
                                                <td class="" data="area" id="Td77" colspan="" rowspan="">
                                                    <div class="td-content">发起数</div>
                                                </td>
                                                <td class="" data="area" id="Td6" colspan="" rowspan="">
                                                    <div class="td-content">已完成</div>
                                                </td>
                                                <td class="" data="area" id="Td7" colspan="" rowspan="">
                                                    <div class="td-content">流转中</div>
                                                </td>
                                                <td class="" data="area" id="Td8" colspan="" rowspan="">
                                                    <div class="td-content">退回</div>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        <tfoot></tfoot>
                                    </table>
                                </div>
                                <div class="pagesizea" style="opacity: 0;"></div>
                                <div class="zxf_pagediva"></div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script type="text/javascript">function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); Reports.saveOldSummaryValueIfExists(); sfdcPage.initFloatingHeader({ "drilldown": false, "numDisplayedColumns": 7, "breaks": [], "columns": [{ "rowSpan": 1, "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27USERS.NAME%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户所有人 - 单击此处按升序排序\"><strong>客户所有人<\/strong><\/a>", "needSubHeader": false, "colSpan": 1, "setClass": "" }, { "rowSpan": 1, "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27ACCOUNT.NAME%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户名 - 单击此处按升序排序\"><strong>客户名<\/strong><\/a>", "needSubHeader": false, "colSpan": 1, "setClass": "" }, { "rowSpan": 1, "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27TYPE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"类型 - 单击此处按升序排序\"><strong>类型<\/strong><\/a>", "needSubHeader": false, "colSpan": 1, "setClass": "" }, { "rowSpan": 1, "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27RATING%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"分级 - 单击此处按升序排序\"><strong>分级<\/strong><\/a>", "needSubHeader": false, "colSpan": 1, "setClass": "" }, { "rowSpan": 1, "alignValue": "right", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27DUE_DATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"上次活动日期 - 单击此处按升序排序\"><strong>上次活动日期<\/strong><\/a>", "needSubHeader": false, "colSpan": 1, "setClass": "" }, { "rowSpan": 1, "alignValue": "right", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27LAST_UPDATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"上次修改日期 - 单击此处按升序排序\"><strong>上次修改日期<\/strong><\/a>", "needSubHeader": false, "colSpan": 1, "setClass": "" }, { "rowSpan": 1, "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27ADDRESS1_STATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"开单州/省 - 单击此处按升序排序\"><strong>开单州/省<\/strong><\/a>", "needSubHeader": false, "colSpan": 1, "setClass": "" }], "numActiveBreaks": 0, "isTopN": false, "renderTo": "floatingHeader", "reportType": "Tabular", "colHistTrendRow": [], "needSubHeader": false, "downDisplay": "full", "showDetails": true }); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
    <script>



        $(function () {

            jQuery.ajax({
                url: "/apps/CommandProcessor.ashx?cmd=workflow.counts.get",
                type: "GET",
                async: false,
                dataType: "json",
                success: function (data) {
                    var number = data.counts;
                    $('.all').html(number.AllInstance);
                    $('.yuqi').html(number.ExpiredCount);
                    $('.daiban').html(number.TaskCount);
                    $('.wanjie').html(number.FinishedCount);
                }
            })

        })
        $('.drop-down-header').click(function (e) {
            $(".drop-down-list").css("display", "none");
            $(this).next().toggle();
            window.event ? window.event.cancelBubble = true : e.stopPropagation();
        })
        $(document).click(function () {
            $(".drop-down-list").css("display", "none");
        })
        $('.clearfixs li').click(function () {
            $('.clearfixs li').removeClass('selecteds');
            $(this).addClass('selecteds');
            var i = $(this).index();
            $('.tab_div').css('display', 'none');
            $('.tab_div').eq(i).css('display', 'block');
            if (i == 0) {
                first();
            } else if (i == 1) {
                second();
            } else if (i == 2) {
                third();
            }
        })

        var first = function () {
            var myChart = echarts.init(document.getElementById('main'));
            var name = [];
            var num = [];
            var sum = [];
            var names = [];
            var nums = [];
            var sums = [];
            var html = '';
            var ID = '';
            var stml = '';
            myChart.setOption({
                title: {
                    text: '部门'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                color: ['#4AA6FC', '#C23531'],
                legend: {
                    data: ['待办', '逾期']
                },
                xAxis: {
                    data: []
                },
                yAxis: {},
                series: [
                    {
                        name: '访问量',
                        type: 'bar',
                        data: []
                    }
                ]
            })


            jQuery.ajax({
                url: "/apps/CommandProcessor.ashx?cmd=workflow.dept.notfinished.get" + '&pageNumber=' + 1 + '&pageSize=25',
                type: "GET",
                async: false,
                dataType: "json",
                success: function (data) {
                    $('.pagesize').html(data.totalPages);
                    if (data.status == 1) {
                        for (var i = 0; i < data.listData.length; i++) {
                            name.push(data.listData[i].BusinessUnitIdName);
                            num.push(data.listData[i].TaskQty);
                            sum.push(data.listData[i].ExpireQty);

                            ID = data.listData[i].BusinessUnitId;
                            html += '<tr class="line" id="' + data.listData[i].BusinessUnitId + '">';
                            html += '<td class="empty-col" data="0" id="Td5" colspan="">';
                            html += '   <div class="td-content" title="">&nbsp;</div>';
                            html += ' </td>';
                            html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                            html += '     <div class="td-content" title="">&nbsp;</div>';
                            html += ' </td>';
                            html += ' <td class="number-col" data="" id="Td6" colspan="">';
                            html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                            html += ' </td>';
                            html += '<td class="start_time" data="" id="Td8" colspan="">';
                            html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].BusinessUnitIdName + '</span></div>';
                            html += ' </td>';
                            html += '  <td class="area" data="" id="Td9" colspan="">';
                            html += '     <div class="td-content" title=""><span title="武汉">' + data.listData[i].BusinessUnitNumber + '</span></div>';
                            html += ' </td>';
                            html += ' <td class="url source" data="" id="Td10" colspan="">';
                            html += '     <div class="td-content" title=""><a href="#" target="_blank" style="color:red;">' + data.listData[i].ExpireQty + '</a></div>';
                            html += ' </td>';
                            html += ' <td class="url access_page" data="" id="Td11" colspan="">';
                            html += '     <div class="td-content" title=""><a href="#" title="#" target="_blank">' + data.listData[i].TaskQty + '</a></div>';
                            html += ' </td>';
                            html += '<td class="empty-col last" data="" id="Td17" colspan="">';
                            html += '  <div class="td-content" title="">&nbsp;</div>';
                            html += '</td>';
                            html += ' </tr>';
                            //某个部门下待办人员的信息
                            var func = function (ID, This) {
                                if (This.parent('tr').attr('data_check') == 'checkbox') {
                                    console.log('不请求')
                                } else {
                                    jQuery.ajax({
                                        url: "/apps/CommandProcessor.ashx?cmd=workflow.deptuser.notfinished.get",
                                        type: "GET",
                                        async: false,
                                        dataType: "json",
                                        data: {
                                            businessUnitId: ID
                                        },
                                        success: function (data) {
                                            if (data.status == 1) {
                                                stml = '';
                                                for (var i = 0; i < data.listData.length; i++) {
                                                    stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" style="display: none;">';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                    stml += '    <div class="td-content" title="&nbsp;">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" >';
                                                    stml += '  <div class="td-content" title=""><span class="icon"></span><a href="#" title="' + data.listData[i].FullName + '">' + data.listData[i].FullName + '</a></div>';
                                                    stml += '         </td>';
                                                    stml += '           <td colspan="" class="operate-col" id="Td226">';
                                                    stml += '               <div class="td-content" data="0" title="" layer="#Operations">';
                                                    stml += '                    &nbsp;';
                                                    stml += '                </div>';
                                                    stml += '            </td>';
                                                    stml += '              <td class="number group pv_count" data="" id="Td227" colspan="">';
                                                    stml += '                  <div class="td-content" title="" style="color:red;">' + data.listData[i].ExpireQty + '</div>';
                                                    stml += '              </td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                    stml += '    <div class="td-content" title="">' + data.listData[i].TaskQty + '</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '</tr>';
                                                }
                                                This.parent('tr').after(stml);
                                            }
                                        }
                                    });
                                }
                            }
                        }
                        if (data.listData.length > 10) {
                            for (var j = 0; j < 10; j++) {
                                names.push(name[j]);
                                nums.push(num[j]);
                                sums.push(sum[j])
                            }
                        } else if (data.listData.length > 0 || data.listData.length < 10) {
                            for (var s = 0; s < data.listData.length; s++) {
                                names.push(name[s]);
                                nums.push(num[s]);
                                sums.push(sum[s])
                            }
                        }
                        $('.table_first tbody').html(html);
                        $('.loaded').click(function () {
                            var ID = $(this).parent('tr').attr('id');
                            var This = $(this);
                            func(ID, This);
                            $(this).parent('tr').attr('data_check', 'checkbox');
                            $(this).toggleClass("open");

                            for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                    $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                }
                            }
                        })


                        myChart.setOption({
                            xAxis: {
                                data: names,
                                axisLabel: {
                                    interval: 0,
                                    rotate: 15
                                },
                            },
                            series: [
                                {
                                    name: '待办',
                                    type: 'bar',
                                    data: nums
                                },
                            {
                                name: '逾期',
                                type: 'bar',
                                data: sums
                            }
                            ]
                        });
                        var size = $('.pagesize').html();
                        $(".zxf_pagediv").createPage({
                            pageNum: size,
                            current: 1,
                            backfun: function (e) {
                                console.log($('.current').html());//回调
                                var pagenum = $('.current').html();
                                $('.table_first tbody').empty();
                                jQuery.ajax({
                                    url: "/apps/CommandProcessor.ashx?cmd=workflow.dept.notfinished.get" + '&pageNumber=' + pagenum + '&pageSize=25',
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        console.log(data.totalPages)
                                        html = '';
                                        for (var i = 0; i < data.listData.length; i++) {
                                            ID = data.listData[i].BusinessUnitId;
                                            html += '<tr class="line" id="' + data.listData[i].BusinessUnitId + '">';
                                            html += '<td class="empty-col" data="0" id="Td5" colspan="">';
                                            html += '   <div class="td-content" title="">&nbsp;</div>';
                                            html += ' </td>';
                                            html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                                            html += '     <div class="td-content" title="">&nbsp;</div>';
                                            html += ' </td>';
                                            html += ' <td class="number-col" data="" id="Td6" colspan="">';
                                            html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                                            html += ' </td>';
                                            html += '<td class="start_time" data="" id="Td8" colspan="">';
                                            html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].BusinessUnitIdName + '</span></div>';
                                            html += ' </td>';
                                            html += '  <td class="area" data="" id="Td9" colspan="">';
                                            html += '     <div class="td-content" title=""><span title="武汉">' + data.listData[i].BusinessUnitNumber + '</span></div>';
                                            html += ' </td>';
                                            html += ' <td class="url source" data="" id="Td10" colspan="">';
                                            html += '     <div class="td-content" title=""><a href="#" target="_blank" style="color:red;">' + data.listData[i].ExpireQty + '</a></div>';
                                            html += ' </td>';
                                            html += ' <td class="url access_page" data="" id="Td11" colspan="">';
                                            html += '     <div class="td-content" title=""><a href="#" title="#" target="_blank">' + data.listData[i].TaskQty + '</a></div>';
                                            html += ' </td>';
                                            html += '<td class="empty-col last" data="" id="Td17" colspan="">';
                                            html += '  <div class="td-content" title="">&nbsp;</div>';
                                            html += '</td>';
                                            html += ' </tr>';
                                            //某个部门下待办人员的信息
                                            var func = function (ID, This) {
                                                if (This.parent('tr').attr('data_check') == 'checkbox') {
                                                    console.log('不请求')
                                                } else {
                                                    jQuery.ajax({
                                                        url: "/apps/CommandProcessor.ashx?cmd=workflow.deptuser.notfinished.get",
                                                        type: "GET",
                                                        async: false,
                                                        dataType: "json",
                                                        data: {
                                                            businessUnitId: ID
                                                        },
                                                        success: function (data) {

                                                            if (data.status == 1) {
                                                                stml = '';
                                                                for (var i = 0; i < data.listData.length; i++) {
                                                                    stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" style="display: none;">';
                                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="">';
                                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                    stml += '</td>';
                                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;">';
                                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                    stml += '</td>';
                                                                    stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                                    stml += '    <div class="td-content" title="&nbsp;">&nbsp;</div>';
                                                                    stml += '</td>';
                                                                    stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" >';
                                                                    stml += '  <div class="td-content" title=""><span class="icon"></span><a href="#" title="' + data.listData[i].FullName + '">' + data.listData[i].FullName + '</a></div>';
                                                                    stml += '         </td>';
                                                                    stml += '           <td colspan="" class="operate-col" id="Td226">';
                                                                    stml += '               <div class="td-content" data="0" title="" layer="#Operations">';
                                                                    stml += '                    &nbsp;';
                                                                    stml += '                </div>';
                                                                    stml += '            </td>';
                                                                    stml += '              <td class="number group pv_count" data="" id="Td227" colspan="">';
                                                                    stml += '                  <div class="td-content" title="" style="color:red;">' + data.listData[i].ExpireQty + '</div>';
                                                                    stml += '              </td>';
                                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                    stml += '    <div class="td-content" title="">' + data.listData[i].TaskQty + '</div>';
                                                                    stml += '</td>';
                                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                    stml += '</td>';
                                                                    stml += '</tr>';
                                                                }
                                                                console.log(stml)
                                                                This.parent('tr').after(stml);
                                                            }
                                                        }
                                                    });
                                                }
                                            }
                                        }
                                        $('.table_first tbody').html(html);
                                        $('.loaded').click(function () {
                                            var ID = $(this).parent('tr').attr('id');
                                            var This = $(this);
                                            func(ID, This);
                                            $(this).parent('tr').attr('data_check', 'checkbox');
                                            $(this).toggleClass("open");

                                            for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                                if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                                    $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                                }
                                            }
                                        })
                                    }
                                })
                            }
                        });
                    }
                }
            });

        }
        var second = function () {
            var myChart = echarts.init(document.getElementById('mains'));

            var name = [];
            var num = [];
            var sum = [];
            var names = [];
            var nums = [];
            var sums = [];
            var html = '';
            var stml = '';
            var ID = '';
            myChart.setOption({
                title: {
                    text: '人员'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                color: ['#4AA6FC', '#C23531'],
                legend: {
                    data: ['待办', '逾期']
                },
                xAxis: {
                    data: []
                },
                yAxis: {},
                series: [
                    {
                        name: '访问量',
                        type: 'bar',
                        data: []
                    }
                ]
            })

            jQuery.ajax({
                url: "/apps/CommandProcessor.ashx?cmd=workflow.user.notfinished.get" + '&pageNumber=' + 1 + '&pageSize=25',
                type: "GET",
                async: false,
                dataType: "json",
                success: function (data) {
                    $('.pagesizes').html(data.totalPages);
                    if (data.status == 1) {
                        for (var i = 0; i < data.listData.length; i++) {
                            name.push(data.listData[i].FullName);
                            num.push(data.listData[i].TaskQty);
                            sum.push(data.listData[i].ExpireQty);
                            ID = data.listData[i].ExecutorIdentityId;
                            html += '<tr class="line" id="' + data.listData[i].ExecutorIdentityId + '">';
                            html += '<td class="empty-col" data="0" id="Td5" colspan="">';
                            html += '   <div class="td-content" title="">&nbsp;</div>';
                            html += ' </td>';
                            html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                            html += '     <div class="td-content" title="">&nbsp;</div>';
                            html += ' </td>';
                            html += ' <td class="number-col" data="" id="Td6" colspan="">';
                            html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                            html += ' </td>';
                            html += '<td class="start_time" data="" id="Td8" colspan="" style="width:34%;">';
                            html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].FullName + '</span></div>';
                            html += ' </td>';
                            html += '<td class="start_time" data="" id="Td8" colspan="">';
                            if (typeof data.listData[i].DeptName == undefined) {
                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">&nbsp;</span></div>';
                            } else {
                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].DeptName + '</span></div>';
                            }
                            html += ' </td>';
                            html += '  <td class="area" data="" id="Td9" colspan="">';
                            html += '     <div class="td-content" title=""><span style="color:red;">' + data.listData[i].ExpireQty + '</span></div>';
                            html += ' </td>';
                            html += ' <td class="url source" data="" id="Td10" colspan="">';
                            html += '     <div class="td-content" title=""><a href="#" target="_blank">' + data.listData[i].TaskQty + '</a></div>';
                            html += ' </td>';
                            html += '<td class="empty-col last" data="" id="Td17" colspan="">';
                            html += '  <div class="td-content" title="">&nbsp;</div>';
                            html += '</td>';
                            html += ' </tr>';
                            var func = function (ID, This) {
                                if (This.parent('tr').attr('data_check') == 'checkbox') {
                                    console.log('不请求')
                                } else {
                                    jQuery.ajax({
                                        url: "/apps/CommandProcessor.ashx?cmd=workflow.user.notfinishedlist.get",
                                        type: "GET",
                                        async: false,
                                        dataType: "json",
                                        data: {
                                            executorIdentityId: ID
                                        },
                                        success: function (data) {
                                            console.log(data)
                                            if (data.status == 1) {
                                                stml = '';
                                                for (var i = 0; i < data.listData.length; i++) {
                                                    stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" style="display: none;">';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                    stml += '    <div class="td-content" title="&nbsp;">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="">';
                                                    stml += '  <div class="td-content"  style="width:285px;"><span class="icon"></span><a href="#" title="' + data.listData[i].Name + '">' + data.listData[i].Name + '</a></div>';
                                                    stml += '</td>';
                                                    stml += '<td class="number group pv_count" data="" id="Td227" colspan="">';
                                                    stml += '   <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="number group pv_count" data="" id="Td227" colspan="">';
                                                    stml += '   <div class="td-content" title="">' + data.listData[i].ExpireQty + '</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                    stml += '   <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '          </tr>';
                                                }
                                                console.log(This)
                                                This.parent('tr').after(stml);
                                            }
                                        }
                                    });
                                }

                            }
                        }
                        $('.table_second tbody').html(html);
                        $('.loaded').click(function () {
                            var ID = $(this).parent('tr').attr('id');
                            var This = $(this);
                            func(ID, This);
                            $(this).parent('tr').attr('data_check', 'checkbox');
                            $(this).toggleClass("open");

                            for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                    $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                }
                            }
                        })


                        for (var j = 0; j < 10; j++) {
                            names.push(name[j]);
                            nums.push(num[j]);
                            sums.push(sum[j])
                        }
                        // console.log(names)
                        //console.log(nums)
                        myChart.setOption({        //加载数据图表
                            xAxis: {
                                data: names
                            },
                            series: [
                                {
                                    // 根据名字对应到相应的系列
                                    name: '待办',
                                    type: 'bar',
                                    data: nums
                                },
                            {
                                // 根据名字对应到相应的系列
                                name: '逾期',
                                type: 'bar',
                                data: sums
                            }
                            ]
                        });
                        var sizes = $('.pagesizes').html();
                        console.log(sizes)
                        $(".zxf_pagedivs").createPage({
                            pageNum: sizes,
                            current: 1,
                            backfun: function (e) {
                                console.log($('.zxf_pagedivs .current').html());//回调
                                var pagenums = $('.zxf_pagedivs .current').html();
                                $('.table_second tbody').empty();
                                jQuery.ajax({
                                    url: "/apps/CommandProcessor.ashx?cmd=workflow.user.notfinished.get" + '&pageNumber=' + pagenums + '&pageSize=25',
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        console.log(data)
                                        if (data.status == 1) {
                                            html = '';
                                            for (var i = 0; i < data.listData.length; i++) {
                                                ID = data.listData[i].ExecutorIdentityId;
                                                html += '<tr class="line" id="' + data.listData[i].ExecutorIdentityId + '">';
                                                html += '<td class="empty-col" data="0" id="Td5" colspan="">';
                                                html += '   <div class="td-content" title="">&nbsp;</div>';
                                                html += ' </td>';
                                                html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                                                html += '     <div class="td-content" title="">&nbsp;</div>';
                                                html += ' </td>';
                                                html += ' <td class="number-col" data="" id="Td6" colspan="">';
                                                html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                                                html += ' </td>';
                                                html += '<td class="start_time" data="" id="Td8" colspan="">';
                                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].FullName + '</span></div>';
                                                html += ' </td>';
                                                html += '<td class="start_time" data="" id="Td8" colspan="">';
                                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].DeptName + '</span></div>';
                                                html += ' </td>';
                                                html += '  <td class="area" data="" id="Td9" colspan="">';
                                                html += '     <div class="td-content" title=""><span style="color:red;">' + data.listData[i].ExpireQty + '</span></div>';
                                                html += ' </td>';
                                                html += ' <td class="url source" data="" id="Td10" colspan="">';
                                                html += '     <div class="td-content" title=""><a href="#" target="_blank">' + data.listData[i].TaskQty + '</a></div>';
                                                html += ' </td>';
                                                html += '<td class="empty-col last" data="" id="Td17" colspan="">';
                                                html += '  <div class="td-content" title="">&nbsp;</div>';
                                                html += '</td>';
                                                html += ' </tr>';
                                                var func = function (ID, This) {
                                                    if (This.parent('tr').attr('data_check') == 'checkbox') {
                                                        console.log('不请求')
                                                    } else {
                                                        jQuery.ajax({
                                                            url: "/apps/CommandProcessor.ashx?cmd=workflow.user.notfinishedlist.get",
                                                            type: "GET",
                                                            async: false,
                                                            dataType: "json",
                                                            data: {
                                                                executorIdentityId: ID
                                                            },
                                                            success: function (data) {
                                                                console.log(data)
                                                                if (data.status == 1) {
                                                                    stml = '';
                                                                    for (var i = 0; i < data.listData.length; i++) {
                                                                        stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" style="display: none;">';
                                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="">';
                                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;">';
                                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                                        stml += '    <div class="td-content" title="&nbsp;">&nbsp;</div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="">';
                                                                        stml += '  <div class="td-content" title=""><span class="icon"></span><a href="#" title="' + data.listData[i].InstanceName + '">' + data.listData[i].InstanceName + '</a></div>';
                                                                        stml += '         </td>';
                                                                        stml += '              <td class="number group pv_count" data="" id="Td227" colspan="">';
                                                                        stml += '                  <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '              </td>';
                                                                        stml += '              <td class="number group pv_count" data="" id="Td227" colspan="">';
                                                                        stml += '                  <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '              </td>';
                                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '</td>';
                                                                        stml += '          </tr>';
                                                                    }
                                                                    console.log(This)
                                                                    This.parent('tr').after(stml);
                                                                }
                                                            }
                                                        });
                                                    }
                                                }
                                            }
                                            $('.table_second tbody').html(html);
                                            $('.loaded').click(function () {
                                                var ID = $(this).parent('tr').attr('id');
                                                var This = $(this);
                                                func(ID, This);
                                                $(this).parent('tr').attr('data_check', 'checkbox');
                                                $(this).toggleClass("open");

                                                for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                                    if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                                        $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                                    }
                                                }
                                            })
                                        }
                                    }
                                })
                            }
                        });
                    }
                }
            });
        }
        var third = function () {
            var myChart = echarts.init(document.getElementById('maina'));

            var name = [];
            var num = [];
            var names = [];
            var nums = [];
            var html = '';
            var stml = '';
            var ID = '';
            var atml = '';
            var Number = 1;
            myChart.setOption({
                title: {
                    text: '流程'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                xAxis: {
                    data: []
                },
                yAxis: {},
                series: [
                    {
                        name: '数量',
                        type: 'bar',
                        data: []
                    }
                ]
            })


            jQuery.ajax({
                url: "/apps/CommandProcessor.ashx?cmd=workflow.process.notfinished.get" + '&pageNumber=' + 1 + '&pageSize=15',
                type: "GET",
                async: false,
                dataType: "json",
                success: function (data) {
                    if (data.status == 1) {
                        for (var i = 0; i < data.listData.length; i++) {
                            $('.pagesizea').html(data.totalPages);
                            name.push(data.listData[i].Name);
                            num.push(data.listData[i].InFlowCount);
                            ID = data.listData[i].ProcessId;
                            html += '<tr class="line" id="' + data.listData[i].ProcessId + '">';
                            html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                            html += '     <div class="td-content" title="">&nbsp;</div>';
                            html += ' </td>';
                            html += ' <td class="number-col" data="" colspan="">';
                            html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                            html += ' </td>';
                            html += '<td class="start_time" data="" colspan="">';
                            html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].Name + '</span></div>';
                            html += ' </td>';

                            html += '  <td class="area" data="" colspan="">';
                            html += '     <div class="td-content" title=""><span>' + data.listData[i].StartCount + '</span></div>';
                            html += ' </td>';

                            html += '  <td class="area" data="" colspan="">';
                            html += '     <div class="td-content" title=""><span>' + data.listData[i].FinishedCount + '</span></div>';
                            html += ' </td>';

                            html += '  <td class="area" data="" style="color:red;font-weight:bold;">';
                            html += '     <div class="td-content" title=""><span>' + data.listData[i].InFlowCount + '</span></div>';
                            html += ' </td>';

                            html += '  <td class="area" data="" colspan="">';
                            html += '     <div class="td-content" title=""><span>' + data.listData[i].BackCount + '</span></div>';
                            html += ' </td>';
                           
                            html += ' </tr>';
                            var func = function (ID, This) {
                                if (This.parent('tr').attr('data_check') == 'checkbox') {
                                    console.log('不请求')
                                } else {
                                    jQuery.ajax({
                                        url: "/apps/CommandProcessor.ashx?cmd=workflow.process.notfinishedlist.get",
                                        type: "GET",
                                        async: false,
                                        dataType: "json",
                                        data: {
                                            processId: ID
                                        },
                                        success: function (data) {
                                            console.log(data)
                                            if (data.status == 1) {
                                                stml = '';
                                                for (var i = 0; i < data.listData.length; i++) {
                                                    stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" sid="' + data.listData[i].ExecutorIdentityId + '" style="display: none;">';
                                                    stml += '<td class="no-expand-colx" data="" id="Td19" colspan="">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col three_lists" data="" id="Td19" colspan="" style="border-left:0;position:relative;">';
                                                    stml += '    <div class="td-content three_list" style="display: block;width: 100%;position: absolute;height: 100%;top: 0;"></div>';
                                                    stml += '</td>';
                                                    stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" >';
                                                    stml += '  <div class="td-content" title=""><span class="icon"></span><a href="#" title="' + data.listData[i].FullName + '">' + data.listData[i].FullName + '</a></div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                    stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                    stml += '</td>';

                                                    stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;padding-left:0;">';
                                                    stml += '    <div class="td-content" title="">' + data.listData[i].TaskQty + '</div>';
                                                    stml += '</td>';
                                                    
                                                    stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                    stml += '<div class="td-content" title="&nbsp;" style="text-align: center;">&nbsp;</div>';
                                                    stml += '</td>';
                                                    stml += '</tr>';
                                                }
                                                This.parent('tr').after(stml);
                                                var funs = function (ProcessId, ExecutorIdentityId, That) {
                                                    console.log(ProcessId)
                                                    console.log(ExecutorIdentityId)
                                                    if (That.parent('tr').attr('data_check') == 'checkbox') {
                                                        console.log('不请求')
                                                    } else {
                                                        jQuery.ajax({
                                                            url: "/apps/CommandProcessor.ashx?cmd=workflow.processuser.notfinishedlist.get" + '&ProcessId=' + ProcessId + '&ExecutorIdentityId=' + ExecutorIdentityId,
                                                            type: "GET",
                                                            async: false,
                                                            dataType: "json",
                                                            success: function (data) {
                                                                console.log(data);
                                                                atml = '';
                                                                for (var i = 0; i < data.listData.length; i++) {
                                                                    atml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last three_List" id="' + ExecutorIdentityId + '" style="display: none;">';
                                                                    atml += '<td class="no-expand-colx" data="" id="Td19" colspan="">';
                                                                    atml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                    atml += '</td>';
                                                                    atml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;position:relative;">';
                                                                    atml += '    <div class="td-content"></div>';
                                                                    atml += '</td>';
                                                                   
                                                                    atml += '<td colspan="5" class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" style="position: relative;">';
                                                                    atml += '  <div class="td-content" style="position: absolute;top: 10px;left: 3px;"><span class="icon"></span><a href="#" style="color: #000;font-weight: inherit;" title="' + data.listData[i].InstanceName + '">' + data.listData[i].InstanceName + '</a></div>';
                                                                    atml += '</td>';
                                                                    
                                                                    atml += '</tr>';
                                                                }
                                                                That.parent('tr').after(atml);
                                                            }
                                                        })
                                                    }
                                                }
                                            }
                                            $('.three_lists').click(function () {
                                                Number++;
                                                var That = $(this);
                                                var ExecutorIdentityId = $(this).parent('tr').attr('sid');

                                                funs(ID, ExecutorIdentityId, That);
                                                console.log(Number)
                                                if (Number > 1) {
                                                    $(this).parent('tr').attr('data_check', 'checkbox');
                                                    var attr = $(this).parent('tr').attr('data_check');
                                                    if (attr == 'checkbox') {

                                                    } else {

                                                        funs(ID, ExecutorIdentityId, That);
                                                    }
                                                }

                                                $(this).children('div').toggleClass('opens')
                                                for (var i = 0; i < $(this).parent('tr').siblings('.three_List').length; i++) {
                                                    if ($(this).parent('tr').attr('sid') == $(this).parent('tr').siblings('.three_List').eq(i).attr('id')) {
                                                        $(this).parent('tr').siblings('.three_List').eq(i).toggle();

                                                    } else {
                                                        //$(this).parent('tr').siblings('.sub-line').eq(i).hide();
                                                    }
                                                }
                                            })
                                        }
                                    });
                                }
                            }
                        }
                        $('.table_third tbody').html(html);
                        $('.loaded').click(function () {
                            var ID = $(this).parent('tr').attr('id');
                            var This = $(this);
                            func(ID, This);
                            $(this).parent('tr').attr('data_check', 'checkbox');
                            $(this).toggleClass("open");

                            for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                    $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                    if ($(this).is('.open')) {

                                    } else {
                                        $('.sub-line').hide();
                                        $('.sub-line').eq(i).children('td').children('div').removeClass('opens');
                                        $('.three_List').hide();
                                    }
                                }
                            }
                        })

                        for (var j = 0; j < data.listData.length; j++) {
                            names.push(name[j]);
                            nums.push(num[j]);
                        }
                        console.log(names)
                        console.log(nums)
                        myChart.setOption({        //加载数据图表
                            xAxis: {
                                data: names,
                                axisLabel: {
                                    interval: 0,
                                    rotate: 20
                                },
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '数量',
                                data: nums
                            }]
                        });
                        var sizea = $('.pagesizea').html();
                        $(".zxf_pagediva").createPage({
                            pageNum: sizea,
                            current: 1,
                            backfun: function (e) {
                                console.log($('.zxf_pagediva .current').html());//回调
                                var pagenuma = $('.zxf_pagediva .current').html();
                                $('.table_third tbody').empty();
                                jQuery.ajax({
                                    url: "/apps/CommandProcessor.ashx?cmd=workflow.process.notfinished.get" + '&pageNumber=' + pagenuma + '&pageSize=15',
                                    type: "GET",
                                    async: false,
                                    dataType: "json",
                                    success: function (data) {
                                        console.log(data)
                                        if (data.status == 1) {
                                            html = '';
                                            for (var i = 0; i < data.listData.length; i++) {
                                                $('.pagesizea').html(data.totalPages);
                                                ID = data.listData[i].ProcessId;
                                                html += '<tr class="line" id="' + data.listData[i].ProcessId + '">';
                                                html += '<td class="empty-col" data="0" id="Td5" colspan="">';
                                                html += '   <div class="td-content" title="">&nbsp;</div>';
                                                html += ' </td>';
                                                html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                                                html += '     <div class="td-content" title="">&nbsp;</div>';
                                                html += ' </td>';
                                                html += ' <td class="number-col" data="" id="Td6" colspan="">';
                                                html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                                                html += ' </td>';
                                                html += '<td class="start_time" data="" id="Td8" colspan="">';
                                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].Name + '</span></div>';
                                                html += ' </td>';
                                                html += '  <td class="area" data="" id="Td9" colspan="">';
                                                html += '     <div class="td-content" title=""><span title="武汉">' + data.listData[i].InstanceQty + '</span></div>';
                                                html += ' </td>';
                                                html += '<td class="empty-col last" data="" id="Td17" colspan="">';
                                                html += '  <div class="td-content" title="">&nbsp;</div>';
                                                html += '</td>';
                                                html += ' </tr>';
                                                var func = function (ID, This) {
                                                    if (This.parent('tr').attr('data_check') == 'checkbox') {
                                                        console.log('不请求')
                                                    } else {
                                                        jQuery.ajax({
                                                            url: "/apps/CommandProcessor.ashx?cmd=workflow.process.notfinishedlist.get",
                                                            type: "GET",
                                                            async: false,
                                                            dataType: "json",
                                                            data: {
                                                                processId: ID
                                                            },
                                                            success: function (data) {
                                                                console.log(data)
                                                                if (data.status == 1) {
                                                                    stml = '';
                                                                    for (var i = 0; i < data.listData.length; i++) {
                                                                        stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" sid="' + data.listData[i].ExecutorIdentityId + '" style="display: none;">';
                                                                        stml += '<td class="no-expand-colx" data="" id="Td19" colspan="">';
                                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="no-expand-col three_lists" data="" id="Td19" colspan="" style="border-left:0;position:relative;">';
                                                                        stml += '    <div class="td-content three_list" style="display: block;width: 100%;position: absolute;height: 100%;top: 0;"></div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                                        stml += '    <div class="td-content" style="text-align: center;" title="&nbsp;">' + (i + 1) + '</div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" >';
                                                                        stml += '  <div class="td-content" title=""><span class="icon"></span><a href="#" title="' + data.listData[i].FullName + '">' + data.listData[i].FullName + '</a></div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                        stml += '    <div class="td-content" title="">' + data.listData[i].TaskQty + '</div>';
                                                                        stml += '</td>';
                                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                        stml += '</td>';
                                                                        stml += '</tr>';
                                                                    }
                                                                    This.parent('tr').after(stml);
                                                                    var funs = function (ProcessId, ExecutorIdentityId, That) {
                                                                        console.log(ProcessId)
                                                                        console.log(ExecutorIdentityId)
                                                                        if (That.parent('tr').attr('data_check') == 'checkbox') {
                                                                            console.log('不请求')
                                                                        } else {
                                                                            jQuery.ajax({
                                                                                url: "/apps/CommandProcessor.ashx?cmd=workflow.processuser.notfinishedlist.get" + '&ProcessId=' + ProcessId + '&ExecutorIdentityId=' + ExecutorIdentityId,
                                                                                type: "GET",
                                                                                async: false,
                                                                                dataType: "json",
                                                                                success: function (data) {
                                                                                    console.log(data);
                                                                                    atml = '';
                                                                                    for (var i = 0; i < data.listData.length; i++) {
                                                                                        atml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last three_List" id="' + ExecutorIdentityId + '" style="display: none;">';
                                                                                        atml += '<td class="no-expand-colx" data="" id="Td19" colspan="">';
                                                                                        atml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                                        atml += '</td>';
                                                                                        atml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;position:relative;">';
                                                                                        atml += '    <div class="td-content"></div>';
                                                                                        atml += '</td>';
                                                                                        atml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                                                        atml += '    <div class="td-content" style="text-align: right;" title="&nbsp;">&nbsp;</div>';
                                                                                        atml += '</td>';
                                                                                        atml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" style="position: relative;">';
                                                                                        atml += '  <div class="td-content" style="position: absolute;top: 10px;left: 41px;"><span class="icon"></span><a href="#" style="color: #000;font-weight: inherit;" title="' + data.listData[i].InstanceName + '">' + data.listData[i].InstanceName + '</a></div>';
                                                                                        atml += '         </td>';
                                                                                        atml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                                        atml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                                        atml += '</td>';
                                                                                        atml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                                                        atml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                                        atml += '</td>';
                                                                                        atml += '</tr>';
                                                                                    }
                                                                                    That.parent('tr').after(atml);
                                                                                }
                                                                            })
                                                                        }

                                                                    }

                                                                }
                                                                $('.three_lists').click(function () {
                                                                    Numbers++;
                                                                    var That = $(this);
                                                                    var ExecutorIdentityId = $(this).parent('tr').attr('sid');
                                                                    funs(ID, ExecutorIdentityId, That);
                                                                    console.log(Numbers)
                                                                    if (Numbers > 1) {
                                                                        $(this).parent('tr').attr('data_check', 'checkbox');
                                                                        var attr = $(this).parent('tr').attr('data_check');
                                                                        if (attr == 'checkbox') {

                                                                        } else {
                                                                            funs(ID, ExecutorIdentityId, That);
                                                                        }
                                                                    }

                                                                    $(this).children('div').toggleClass('opens')
                                                                    for (var i = 0; i < $(this).parent('tr').siblings('.three_List').length; i++) {
                                                                        if ($(this).parent('tr').attr('sid') == $(this).parent('tr').siblings('.three_List').eq(i).attr('id')) {
                                                                            $(this).parent('tr').siblings('.three_List').eq(i).toggle();
                                                                        } else {
                                                                            //$(this).parent('tr').siblings('.sub-line').eq(i).hide();
                                                                        }
                                                                    }
                                                                })
                                                            }
                                                        });
                                                    }
                                                }
                                            }
                                            $('.table_third tbody').html(html);
                                            $('.loaded').click(function () {
                                                var ID = $(this).parent('tr').attr('id');
                                                var This = $(this);
                                                func(ID, This);
                                                $(this).parent('tr').attr('data_check', 'checkbox');
                                                $(this).toggleClass("open");
                                                for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                                    if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                                        $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                                        if ($(this).is('.open')) {

                                                        } else {
                                                            $('.sub-line').hide();
                                                            $('.sub-line').eq(i).children('td').children('div').removeClass('opens');
                                                            $('.three_List').hide();
                                                        }
                                                    }
                                                }
                                            })
                                        }
                                    }
                                })
                            }
                        });
                    }
                }
            });
        }
        first();


        var ID = '';
        var html = '';
        var stml = '';

        //禁止搜索和允许搜索
        $('.first_input').blur(function () {
            var val = $('.first_input').val();
            localStorage.clear('inputs')
            function saveCookie(cookieName, cookieValue, cookieDates) {
                var d = new Date();
                d.setDate(d.getDate() + cookieDates);
                document.cookie = cookieName + "=" + cookieValue + ";expires=" + d.toGMTString();
            }
            saveCookie('inputs', val, '1');
        })

        var times = 1;
        $('.first_input').focus(function () {
            times++;
            console.log(times);
            if (times > 2) {
                var val = $('.first_input').val();
                function getCookie(cookieName) {
                    var cookieStr = unescape(document.cookie);
                    var arr = cookieStr.split("; ");
                    var cookieValue = "";
                    for (var i = 0; i < arr.length; i++) {
                        var temp = arr[i].split("=");
                        if (temp[0] == cookieName) {
                            cookieValue = temp[1];
                            break;
                        }
                    }
                    return cookieValue
                }
                console.log(val)
                console.log(getCookie('inputs'))
                if (getCookie('inputs') == val) {
                    console.log('不可以搜索')
                    $('#query-visitor').attr("disabled", "disabled");
                    $('.first_input').live('input propertychange', function () {
                        if ($(this).val()) {
                            console.log('可以搜索')
                            $('#query-visitor').removeAttr("disabled");
                        }
                    })

                } else {
                }
            }
        })


        $('.second_input').blur(function () {
            var val = $('.second_input').val();
            localStorage.clear('input_second')
            function saveCookie(cookieName, cookieValue, cookieDates) {
                var d = new Date();
                d.setDate(d.getDate() + cookieDates);
                document.cookie = cookieName + "=" + cookieValue + ";expires=" + d.toGMTString();
            }
            saveCookie('input_second', val, '1');
        })

        var time_second = 1;
        $('.second_input').focus(function () {
            time_second++;
            console.log(time_second);
            if (time_second > 2) {
                var val = $('.second_input').val();
                function getCookie(cookieName) {
                    var cookieStr = unescape(document.cookie);
                    var arr = cookieStr.split("; ");
                    var cookieValue = "";
                    for (var i = 0; i < arr.length; i++) {
                        var temp = arr[i].split("=");
                        if (temp[0] == cookieName) {
                            cookieValue = temp[1];
                            break;
                        }
                    }
                    return cookieValue
                }
                console.log(val)
                console.log(getCookie('input_second'))
                if (getCookie('input_second') == val) {
                    console.log('不可以搜索')
                    $('#Btn2').attr("disabled", "disabled");
                    $('.second_input').live('input propertychange', function () {
                        if ($(this).val()) {
                            console.log('可以搜索')
                            $('#Btn2').removeAttr("disabled");
                        }
                    })

                } else {
                }
            }
        })


        $('.third_input').blur(function () {
            var val = $('.third_input').val();
            localStorage.clear('input_third')
            function saveCookie(cookieName, cookieValue, cookieDates) {
                var d = new Date();
                d.setDate(d.getDate() + cookieDates);
                document.cookie = cookieName + "=" + cookieValue + ";expires=" + d.toGMTString();
            }
            saveCookie('input_third', val, '1');
        })

        var time_third = 1;
        $('.third_input').focus(function () {
            time_third++;
            console.log(time_third);
            if (time_second > 2) {
                var val = $('.third_input').val();
                function getCookie(cookieName) {
                    var cookieStr = unescape(document.cookie);
                    var arr = cookieStr.split("; ");
                    var cookieValue = "";
                    for (var i = 0; i < arr.length; i++) {
                        var temp = arr[i].split("=");
                        if (temp[0] == cookieName) {
                            cookieValue = temp[1];
                            break;
                        }
                    }
                    return cookieValue
                }
                console.log(val)
                console.log(getCookie('input_third'))
                if (getCookie('input_third') == val) {
                    console.log('不可以搜索')
                    $('#Btn3').attr("disabled", "disabled");
                    $('.third_input').live('input propertychange', function () {
                        if ($(this).val()) {
                            console.log('可以搜索')
                            $('#Btn3').removeAttr("disabled");
                        }
                    })

                } else {
                }
            }
        })


        var length = '';
        var Numbers = 1;
        //搜索查询
        $('.first_btn').click(function () {
            var val = $('.first_input').val();
            if (getCookie('inputs') == val) {
                jQuery.ajax({
                    url: "/apps/CommandProcessor.ashx?cmd=workflow.search.get" + '&key=' + val + '&searchType=' + 1 + '&pageNumber=0&pageSize=25',
                    type: "GET",
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        $('.table_first tbody').html(' ');
                        if (data.listData.length > 0) {
                            html = '';
                            for (var i = 0; i < data.listData.length; i++) {
                                ID = data.listData[i].BusinessUnitId;
                                html += '<tr class="line" id="' + data.listData[i].BusinessUnitId + '">';
                                html += '<td class="empty-col" data="0" id="Td5" colspan="">';
                                html += '   <div class="td-content" title="">&nbsp;</div>';
                                html += ' </td>';
                                html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                                html += '     <div class="td-content" title="">&nbsp;</div>';
                                html += ' </td>';
                                html += ' <td class="number-col" data="" id="Td6" colspan="">';
                                html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                                html += ' </td>';
                                html += '<td class="start_time" data="" id="Td8" colspan="">';
                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].BusinessUnitIdName + '</span></div>';
                                html += ' </td>';
                                html += '  <td class="area" data="" id="Td9" colspan="">';
                                html += '     <div class="td-content" title=""><span title="武汉">' + data.listData[i].BusinessUnitNumber + '</span></div>';
                                html += ' </td>';
                                html += ' <td class="url source" data="" id="Td10" colspan="">';
                                html += '     <div class="td-content" title=""><a href="#" target="_blank" style="color:red;">' + data.listData[i].ExpireQty + '</a></div>';
                                html += ' </td>';
                                html += ' <td class="url access_page" data="" id="Td11" colspan="">';
                                html += '     <div class="td-content" title=""><a href="#" title="#" target="_blank">' + data.listData[i].TaskQty + '</a></div>';
                                html += ' </td>';
                                html += '<td class="empty-col last" data="" id="Td17" colspan="">';
                                html += '  <div class="td-content" title="">&nbsp;</div>';
                                html += '</td>';
                                html += ' </tr>';
                                //某个部门下待办人员的信息
                                var func = function (ID, This) {
                                    if (This.parent('tr').attr('data_check') == 'checkbox') {
                                        console.log('不请求')
                                    } else {
                                        jQuery.ajax({
                                            url: "/apps/CommandProcessor.ashx?cmd=workflow.deptuser.notfinished.get",
                                            type: "GET",
                                            async: false,
                                            dataType: "json",
                                            data: {
                                                businessUnitId: ID
                                            },
                                            success: function (data) {
                                                console.log(data);
                                                if (data.status == 1) {
                                                    stml = '';
                                                    for (var i = 0; i < data.listData.length; i++) {
                                                        stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" style="display: none;">';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                        stml += '    <div class="td-content" title="&nbsp;">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" >';
                                                        stml += '  <div class="td-content"><span class="icon"></span><a href="#" title="' + data.listData[i].FullName + '">' + data.listData[i].FullName + '</a></div>';
                                                        stml += '         </td>';
                                                        stml += '           <td colspan="" class="operate-col" id="Td226">';
                                                        stml += '               <div class="td-content" data="0" title="" layer="#Operations">';
                                                        stml += '                    &nbsp;';
                                                        stml += '                </div>';
                                                        stml += '            </td>';
                                                        stml += '              <td class="number group pv_count" data="" id="Td227" colspan="">';
                                                        stml += '                  <div class="td-content" title="" style="color:red;">' + data.listData[i].ExpireQty + '</div>';
                                                        stml += '              </td>';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                        stml += '    <div class="td-content" title="">' + data.listData[i].TaskQty + '</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '          </tr>';
                                                    }

                                                    This.parent('tr').after(stml);

                                                    //for (var i = 0; i < $('.sub-line').length; i++) {
                                                    //    var jid = $('.sub-line').eq(i).attr('id');
                                                    //    if (jid != ID) {
                                                    //        console.log(ID)
                                                    //        $('.sub-line').eq(i).remove('.sub-line')
                                                    //    }
                                                    //}

                                                }
                                            }
                                        });
                                    }

                                }
                            }
                            $('.table_first tbody').html(html);
                            $('.zxf_pagediv').hide()
                            $('.loaded').click(function () {
                                var ID = $(this).parent('tr').attr('id');
                                var This = $(this);
                                func(ID, This);
                                $(this).parent('tr').attr('data_check', 'checkbox');
                                var attr = $(this).parent('tr').attr('data_check');
                                if (attr == 'checkbox') {

                                } else {
                                    func(ID, This);
                                }
                                $(this).toggleClass("open");
                                for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                    if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                        $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                    } else {
                                        //$(this).parent('tr').siblings('.sub-line').eq(i).hide();
                                    }
                                }
                            })

                        } else {
                            alert('没有这个部门哦');
                            $('.first_input').val('');
                        }
                    }
                })
                localStorage.clear('inputs')
            } else {
            }
        })
        $('.second_btn').click(function () {
            var val = $('.second_input').val();
            if (getCookie('input_second') == val) {
                jQuery.ajax({
                    url: "/apps/CommandProcessor.ashx?cmd=workflow.search.get" + '&key=' + val + '&searchType=' + 2 + '&pageNumber=0&pageSize=25',
                    type: "GET",
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        $('.pagesizes').html(data.totalPages);
                        
                        if (data.status == 1) {
                            html = '';
                            $('.table_second tbody').html('');
                            for (var i = 0; i < data.listData.length; i++) {
                                ID = data.listData[i].ExecutorIdentityId;
                                html += '<tr class="line" id="' + data.listData[i].ExecutorIdentityId + '">';
                                html += '<td class="empty-col" data="0" id="Td5" colspan="">';
                                html += '   <div class="td-content" title="">&nbsp;</div>';
                                html += ' </td>';
                                html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                                html += '     <div class="td-content" title="">&nbsp;</div>';
                                html += ' </td>';
                                html += ' <td class="number-col" data="" id="Td6" colspan="">';
                                html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                                html += ' </td>';
                                html += '<td class="start_time" data="" id="Td8" colspan="" style="width:34%;">';
                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].FullName + '</span></div>';
                                html += ' </td>';
                                html += '<td class="start_time" data="" id="Td8" colspan="">';
                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].DeptName + '</span></div>';
                                html += ' </td>';
                                html += '  <td class="area" data="" id="Td9" colspan="">';
                                html += '     <div class="td-content" title=""><span style="color:red;">' + data.listData[i].ExpireQty + '</span></div>';
                                html += ' </td>';
                                html += ' <td class="url source" data="" id="Td10" colspan="">';
                                html += '     <div class="td-content" title=""><a href="#" target="_blank">' + data.listData[i].TaskQty + '</a></div>';
                                html += ' </td>';
                                html += '<td class="empty-col last" data="" id="Td17" colspan="">';
                                html += '  <div class="td-content" title="">&nbsp;</div>';
                                html += '</td>';
                                html += ' </tr>';
                                var func = function (ID, This) {
                                    if (This.parent('tr').attr('data_check') == 'checkbox') {
                                        console.log('不请求')
                                    } else {
                                        jQuery.ajax({
                                            url: "/apps/CommandProcessor.ashx?cmd=workflow.user.notfinishedlist.get",
                                            type: "GET",
                                            async: false,
                                            dataType: "json",
                                            data: {
                                                executorIdentityId: ID
                                            },
                                            success: function (data) {
                                                console.log(data)
                                                if (data.status == 1) {
                                                    stml = '';
                                                    for (var i = 0; i < data.listData.length; i++) {
                                                        stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" style="display: none;">';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                        stml += '    <div class="td-content" title="&nbsp;">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="">';
                                                        stml += '  <div class="td-content"  style="width:285px;"><span class="icon"></span><a href="#" title="' + data.listData[i].Name + '">' + data.listData[i].Name + '</a></div>';
                                                        stml += '</td>';
                                                        stml += '<td class="number group pv_count" data="" id="Td227" colspan="">';
                                                        stml += '   <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="number group pv_count" data="" id="Td227" colspan="">';
                                                        stml += '   <div class="td-content" title="">' + data.listData[i].ExpireQty + '</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                        stml += '   <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '          </tr>';
                                                    }
                                                    console.log(This)
                                                    This.parent('tr').after(stml);
                                                }
                                            }
                                        });
                                    }

                                }
                            }
                            $('.table_second tbody').html(html);
                            $('.loaded').click(function () {
                                var ID = $(this).parent('tr').attr('id');
                                var This = $(this);
                                func(ID, This);
                                $(this).parent('tr').attr('data_check', 'checkbox');
                                $(this).toggleClass("open");

                                for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                    if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                        $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                    }
                                }
                            })

                            var sizes = $('.pagesizes').html();
                            console.log(sizes)
                        }
                    }
                })
                localStorage.clear('input_second')
            }

        })
        $('.third_btn').click(function () {
            var val = $('.third_input').val();
            console.log(val)
            if (getCookie('input_third') == val) {
                jQuery.ajax({
                    url: "/apps/CommandProcessor.ashx?cmd=workflow.search.get" + '&key=' + val + '&searchType=' + 3 + '&pageNumber=0&pageSize=10',
                    type: "GET",
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        $('.zxf_pagediva').hide()
                        console.log(data)
                        $('.table_third tbody').html('');
                        if (data.listData.length > 0) {
                            html = '';
                            for (var i = 0; i < data.listData.length; i++) {
                                $('.pagesizea').html(data.totalPages);
                                ID = data.listData[i].ProcessId;
                                html += '<tr class="line" id="' + data.listData[i].ProcessId + '">';

                                html += ' <td class="expand-col loaded" data="0" id="expand_table-tr_0" colspan="">';
                                html += '     <div class="td-content" title="">&nbsp;</div>';
                                html += ' </td>';
                                html += ' <td class="number-col" data="" id="Td6" colspan="">';
                                html += '     <div class="td-content" title="1">' + (i + 1) + '</div>';
                                html += ' </td>';

                                html += '<td class="start_time" data="" id="Td8" colspan="">';
                                html += '<div class="td-content" title=""><span title="2019/03/05&nbsp;13:39:07">' + data.listData[i].Name + '</span></div>';
                                html += ' </td>';

                                html += '  <td class="area" data="" colspan="">';
                                html += '     <div class="td-content" title=""><span>' + data.listData[i].StartCount + '</span></div>';
                                html += ' </td>';

                                html += '  <td class="area" data="" colspan="">';
                                html += '     <div class="td-content" title=""><span>' + data.listData[i].FinishedCount + '</span></div>';
                                html += ' </td>';

                                html += '  <td class="area" data="" style="color:red;font-weight:bold;">';
                                html += '     <div class="td-content" title=""><span>' + data.listData[i].InFlowCount + '</span></div>';
                                html += ' </td>';

                                html += '  <td class="area" data="" colspan="">';
                                html += '     <div class="td-content" title=""><span>' + data.listData[i].BackCount + '</span></div>';
                                html += ' </td>';

                               
                                html += ' </tr>';
                                var func = function (ID, This) {
                                    if (This.parent('tr').attr('data_check') == 'checkbox') {
                                        console.log('不请求')
                                    } else {
                                        jQuery.ajax({
                                            url: "/apps/CommandProcessor.ashx?cmd=workflow.process.notfinishedlist.get",
                                            type: "GET",
                                            async: false,
                                            dataType: "json",
                                            data: {
                                                processId: ID
                                            },
                                            success: function (data) {
                                                console.log(data)
                                                if (data.status == 1) {
                                                    stml = '';
                                                    for (var i = 0; i < data.listData.length; i++) {
                                                        stml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last" id="' + ID + '" sid="' + data.listData[i].ExecutorIdentityId + '" style="display: none;">';
                                                        stml += '<td class="no-expand-colx" data="" id="Td19" colspan="">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="no-expand-col three_lists" data="" id="Td19" colspan="" style="border-left:0;position:relative;">';
                                                        stml += '    <div class="td-content three_list" style="display: block;width: 100%;position: absolute;height: 100%;top: 0;"></div>';
                                                        stml += '</td>';

                                                        stml += '<td class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" >';
                                                        stml += '  <div class="td-content" title=""><span class="icon"></span><a href="#" title="' + data.listData[i].FullName + '">' + data.listData[i].FullName + '</a></div>';
                                                        stml += '</td>';

                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';
                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;">';
                                                        stml += '    <div class="td-content" title="">&nbsp;</div>';
                                                        stml += '</td>';

                                                        stml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left: 0;padding-left:0;">';
                                                        stml += '    <div class="td-content" title="">' + data.listData[i].TaskQty + '</div>';
                                                        stml += '</td>';

                                                        stml += '<td class="number-col" data="" id="Td20" colspan="">';
                                                        stml += '<div class="td-content" title="&nbsp;" style="text-align: center;">&nbsp;</div>';
                                                        stml += '</td>';

                                                        stml += '</tr>';
                                                    }
                                                    This.parent('tr').after(stml);
                                                    var funs = function (ProcessId, ExecutorIdentityId, That) {
                                                        console.log(ProcessId)
                                                        console.log(ExecutorIdentityId)
                                                        if (That.parent('tr').attr('data_check') == 'checkbox') {
                                                            console.log('不请求')
                                                        } else {
                                                            jQuery.ajax({
                                                                url: "/apps/CommandProcessor.ashx?cmd=workflow.processuser.notfinishedlist.get" + '&ProcessId=' + ProcessId + '&ExecutorIdentityId=' + ExecutorIdentityId,
                                                                type: "GET",
                                                                async: false,
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    console.log(data);
                                                                    atml = '';
                                                                    for (var i = 0; i < data.listData.length; i++) {
                                                                        atml += '<tr class="sub-line table-tr_0 sub-line-first sub-line-last three_List" id="' + ExecutorIdentityId + '" style="display: none;">';
                                                                        atml += '<td class="no-expand-colx" data="" id="Td19" colspan="">';
                                                                        atml += '    <div class="td-content" title="">&nbsp;</div>';
                                                                        atml += '</td>';
                                                                        atml += '<td class="no-expand-col" data="" id="Td19" colspan="" style="border-left:0;position:relative;">';
                                                                        atml += '    <div class="td-content"></div>';
                                                                        atml += '</td>';

                                                                        atml += '<td colspan="5" class="table-index sub-title source_engine_title" data="[object Object]" id="Td225" colspan="" style="position: relative;">';
                                                                        atml += '  <div class="td-content" style="position: absolute;top: 10px;left: 3px;"><span class="icon"></span><a href="#" style="color: #000;font-weight: inherit;" title="' + data.listData[i].InstanceName + '">' + data.listData[i].InstanceName + '</a></div>';
                                                                        atml += '</td>';
                                                                        atml += '</tr>';
                                                                    }
                                                                    That.parent('tr').after(atml);
                                                                }
                                                            })
                                                        }

                                                    }

                                                }
                                                $('.three_lists').click(function () {
                                                    Numbers++;
                                                    var That = $(this);
                                                    var ExecutorIdentityId = $(this).parent('tr').attr('sid');
                                                    funs(ID, ExecutorIdentityId, That);
                                                    console.log(Numbers)
                                                    if (Numbers > 1) {
                                                        $(this).parent('tr').attr('data_check', 'checkbox');
                                                        var attr = $(this).parent('tr').attr('data_check');
                                                        if (attr == 'checkbox') {

                                                        } else {
                                                            funs(ID, ExecutorIdentityId, That);
                                                        }
                                                    }

                                                    $(this).children('div').toggleClass('opens')
                                                    for (var i = 0; i < $(this).parent('tr').siblings('.three_List').length; i++) {
                                                        if ($(this).parent('tr').attr('sid') == $(this).parent('tr').siblings('.three_List').eq(i).attr('id')) {
                                                            $(this).parent('tr').siblings('.three_List').eq(i).toggle();
                                                        } else {
                                                            //$(this).parent('tr').siblings('.sub-line').eq(i).hide();
                                                        }
                                                    }
                                                })
                                            }
                                        });
                                    }
                                }
                            }
                            $('.table_third tbody').html(html);
                            $('.loaded').click(function () {
                                var ID = $(this).parent('tr').attr('id');
                                var This = $(this);
                                func(ID, This);
                                $(this).parent('tr').attr('data_check', 'checkbox');
                                $(this).toggleClass("open");
                                for (var i = 0; i < $(this).parent('tr').siblings('.sub-line').length; i++) {
                                    if ($(this).parent('tr').attr('id') == $(this).parent('tr').siblings('.sub-line').eq(i).attr('id')) {
                                        $(this).parent('tr').siblings('.sub-line').eq(i).toggle();
                                        if ($(this).is('.open')) {

                                        } else {
                                            $('.sub-line').hide();
                                            $('.sub-line').eq(i).children('td').children('div').removeClass('opens');
                                            $('.three_List').hide();
                                        }
                                    }
                                }
                            })
                        } else {
                            alert('没有这个流程哦');
                            $('.first_input').val('');
                        }
                    }
                })
                localStorage.clear('input_third')
            }

        })



    </script>
</body>
</html>
