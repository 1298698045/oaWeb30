<%@ Page Language="C#" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>选择人员</title>
    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/SearchOnly.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1415916830000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-11-21 上午10:24", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <link href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/elements.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/common.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.202.191.9', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcommon%2Fdata%2FLookupResultsFrame%3F_CONFIRMATIONTOKEN%3D74tklwJ1kpbiYkV_VMefjRpQMnNNXsNw7DZcPc4N32mDwN1iWtYerm5o4LluLbzzZC6lszXR2Vlqlnt8GHJxmAXEY8nJh.25XzeADpHcoCAdtgYsEBGJryRJ0PAm0jAcNcqYN9cN_jwY0AL8GXMMUXMlu3tQtgYHrU0xkr8Ff48GGP1yr16mA5IiiiRPNoqUN7V_TQ%253D%253D%26igdp%3D0%26lkenhmd%3DSEARCH_NAME%26lkfm%3DeditPage%26lknm%3Dcon4%26lksrch%3DEdge%2BCommunications%26lktp%3D001%262%3DEdge%2BCommunications%26country%3D%26zip%3D%26state%3D%26city%3D%26street%3D%2610%3D%2611%3D%2612%3D%26cancel%3D%2B%25E5%258F%2596%25E6%25B6%2588%2B');</script>
    <style>
        .hasMotif {
            margin: 0;
        }
        * {
            margin: 0;
            padding: 0;
        }

        body, html {
            color: #333;
            height: 100%;
        }

        .clear {
            clear: both;
        }

        .head {
            background-color: #f2f2f2;
            height: 50px;
            line-height: 50px;
            border-bottom: 1px solid #dedede;
            position: absolute;
            width: 100%;
        }

            .head img {
                float: left;
                width: 30px;
                margin: 0 20px;
                margin-top: 10px;
            }

        .nav-item {
            float: left;
            height: 50px;
            line-height: 50px;
            padding: 0 20px;
            cursor: pointer;
        }

            .nav-item.active {
                color: #2db7f5;
                border-bottom: 3px solid #2db7f5;
            }

        .body-nav {
            float: left;
        }

        .body-search {
            float: right;
            margin-top: 10px;
        }

        .left {
            float: left;
        }

        .search-btn {
            border: 1px solid #dedede;
            padding: 0px 20px;
            height: 30px;
            line-height: 30px;
            cursor: pointer;
        }

        .search-input {
            height: 30px;
            border: 1px solid #dedede;
            border-right: 1px;
        }

            .search-input input {
                border: 0;
                outline: none;
                height: 28px;
                width: 100%;
            }

        .body-top {
            border-bottom: 1px solid #dedede;
            padding-right: 15px;
        }

        .main-item img {
            width: 40px;
            height: 40px;
        }

        .right {
            float: right;
        }

        .main-item {
            border-bottom: 1px solid #dedede;
            padding: 10px 20px;
        }

        .item-mi {
            margin-left: 20px;
        }

        .item-right img {
            display: none;
        }

        .main-item.active img {
            display: block;
        }

        .main-item.active {
            background-color: #f2f2f2;
        }

        .main-item:hover {
            background-color: #f2f2f2;
            cursor: pointer;
        }

        .main {
            display: none;
        }

        .foot {
            border-top: 1px solid #dedede;
            position: absolute;
            bottom: 0px;
            width: 100%;
            padding-top: 20px;
            padding-bottom: 20px;
            z-index: 2;
            background-color: white;
        }

            .foot > div {
                float: right;
            }

                .foot > div > div {
                    border: 1px solid #dedede;
                    border-radius: 4px;
                    float: left;
                    margin-right: 15px;
                    padding: 5px 15px;
                    cursor: pointer;
                }

                    .foot > div > div:hover {
                        background-color: #f2f2f2;
                    }

        .shur {
            background-color: #0094ff;
            color: white;
        }

            .shur:hover {
                background-color: #20699c !important;
            }

        .body {
            float: left;
            width: 100%;
            padding-top: 51px;
            box-sizing: border-box;
            height: 100%;
            padding-bottom: 74px;
        }

        .body-right {
            float: left;
            width: 20%;
            border-left: 1px solid #dedede;
            box-sizing: border-box;
            padding: 51px 20px;
            height: 100%;
        }

            .body-right img {
                width: 14px;
                float: right;
                margin-top: 3px;
                margin-right: 8px;
                cursor: pointer;
            }

        .checked-item {
            border: 1px solid #dedede;
            border-radius: 4px;
            padding: 5px 0;
            padding-left: 10px;
            margin-top: 10px;
        }

            .checked-item:hover {
                background-color: #f2f2f2;
            }

        .main-item-group,.main-item-role {
            border-bottom: 1px solid #dedede;
            padding: 5px 0;
            cursor: pointer;
        }

            .main-item-group:hover,.main-item-role:hover {
                background-color: #f2f2f2;
            }

        .body-main {
            overflow-y: auto;
            height: 100%;
            box-sizing: border-box;
            padding-bottom: 53px;
        }

        .panel-header {
            border-top: 0 !important;
        }

        #treePanel {
            border-bottom: 0 !important;
        }

        .panel.panel-htop {
            float: left;
        }

        .right-people {
            float: left;
            box-sizing: border-box;
            height: 100%;
            overflow-y: auto;
        }

        #zuzhijiegou, #changyongzu,#juese {
            height: 100%;
            width: 100%;
        }

        #changyongzutree,#juesetree {
            border-right: 1px solid #dedede;
            float: left;
            overflow: auto;
            height: 100%;
            box-sizing: border-box;
        }

        .main-item .name {
            color: blue;
        }

        #new {
            height: 100%;
        }

        .hightsearch-head {
            padding: 20px;
            border-bottom: 1px solid #dedede;
        }

            .hightsearch-head > div {
                padding: 0 20px;
                height: 50px;
                line-height: 50px;
            }

            .hightsearch-head select {
                position: relative \9;
                top: 10px \9;
            }

        .search-btn.active {
            background-color: #0094ff;
            color: white;
        }

        .search-name {
            display: inline-block;
            width: 60px;
        }

        .hightsearch-head .search-input {
            border-right: 1px solid #dedede;
            width: 300px;
        }

        .hightsearch-head > div > div {
            padding: 0 20px;
        }

        .hightsearch-footbtn {
            border-bottom: 1px solid #dedede;
            height: 65px;
            padding: 15px 0;
            box-sizing: border-box;
        }

            .hightsearch-footbtn > div {
                width: 300px;
                margin: 0 auto;
                height: 50px;
            }

                .hightsearch-footbtn > div div {
                    border: 1px solid #dedede;
                    border-radius: 4px;
                    float: left;
                    margin-right: 15px;
                    padding: 8px 25px;
                    cursor: pointer;
                }

                    .hightsearch-footbtn > div div:hover {
                        background-color: #f2f2f2;
                    }

            .hightsearch-footbtn .hightsearch-shur {
                background-color: #0094ff;
                color: white;
            }

                .hightsearch-footbtn .hightsearch-shur:hover {
                    background-color: #20699c;
                }

        .hightsearch-people {
            overflow: auto;
        }

        .hightsearch {
            display: none;
        }

        .main-item-group.active,.main-item-role.active {
            background-color: #f2f2f2;
        }

        .main-item-group,.main-item-role {
            padding: 10px 0;
        }

        .maincontent {
            height: 100%;
        }
        .easyui-tree li {
            margin-left:0;
        }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif lookupTab  LookupResultsFrame" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <input type="hidden" name="lkenhmd" id="lkenhmd" value="SEARCH_NAME" />
    <input type="hidden" name="lkfm" id="lkfm" value="<%=Request["lkfm"]%>" />
    <input type="hidden" name="lknm" id="lknm" value="<%=Request["lknm"]%>" />
    <input type="hidden" name="lktp" id="lktp" value="8" />
    <input type="hidden" name="lksrch" id="lksrch" value="<%=Request["lksrch"]%>" />
    <div class="head">
        <img src="/img/images/Personal1.png" alt="选择人员" />
        <span>选择人员</span>
    </div>
    <div class="body">
        <div class="body-top">
            <div class="body-nav">
                <div class="nav-item active">最近</div>
                <div class="nav-item">同部门</div>
                <div class="nav-item">我的下属</div>
                <div class="nav-item">组织结构</div>
                <div class="nav-item">小组</div>
                <div class="nav-item">角色</div>
                <div class="clear"></div>
            </div>
            <div class="body-search">
                <div class="search-input left">
                    <input type="type" name="name" value="" />
                </div>
                <div class="search-btn left lsearch" style="border-right:0;">搜索</div>
                <div class="search-btn left gsearch">高级搜索</div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="body-main">
            <div class="maincontent">
                <div id="latestusediv" class="main" style="display: block;">
                </div>
                <div id="tongbumen" class="main">
                </div>
                <div id="wodexiashu" class="main">
                </div>
                <div id="zuzhijiegou" class="main">
                    <div id="treePanel" class="easyui-panel" title="组织结构" style="width: 240px; min-height: 0!important;">
                        <ul class="easyui-tree" id="organizationTree" style="display: block;">
                            <li></li>
                        </ul>
                    </div>
                    <div class="zuzhijiegou-people right-people"></div>
                </div>
                <div id="changyongzu" class="main">
                    <div id="changyongzutree" style="width: 240px; min-height: 0!important;">
                    </div>
                    <div class="changyongzu-people right-people"></div>
                </div>
                <div id="juese" class="main">
                    <div id="juesetree" style="width: 240px; min-height: 0!important;">
                    </div>
                    <div class="juese-people right-people"></div>
                </div>
                <div id="searchpeoplediv" class="main">
                </div>
            </div>
            <div class="hightsearch">
                <div class="hightsearch-head">
                    <div>
                        <div class="left">
                            <span class="search-name">用户名:</span>
                            <input class="search-input" type="" name="UserName" value="" />
                        </div>
                        <div class="left">
                            <span class="search-name">姓名:</span>
                            <input class="search-input" type="" name="FullName" value="" />
                        </div>
                    </div>
                    <div>
                        <div class="left">
                            <span class="search-name">工号:</span>
                            <input class="search-input" type="" name="EmployeeId" value="" />
                        </div>
                        <div class="left">
                            <span class="search-name">岗位:</span>
                            <select class="search-input" type="" name="PostId" id="PostId" value="">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <div class="left">
                            <span class="search-name">职级:</span>
                            <select class="search-input" type="" name="TitleLevel"id="TitleLevel" value="">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="hightsearch-footbtn">
                    <div>
                        <div class="hightsearch-shur">搜 索</div>
                        <div class="hightsearch-clear">重 置</div>
                        <div class="hightsearch-quite">取 消</div>
                    </div>

                </div>
                <div class="hightsearch-people">
                </div>
            </div>
        </div>
    </div>
    <div class="foot">
        <div>
            <%--<div class="clearchook">清除</div>--%>
            <div class="quite">取消</div>
            <%--<div class="shur">确定</div>--%>
        </div>
    </div>

    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script>

        //头部导航
        $('.nav-item').click(function () {
            if ($(this).html() == '组织结构' || $(this).html() == '小组') {
                $('.body-main').css('overflow', 'hidden')
            } else {
                $('.body-main').css('overflow', 'auto')
            }
            $('.nav-item').removeClass('active');
            $(this).addClass('active');
            $('.main').hide();
            $('.main').eq($(this).index()).show();
            $('.main-item').removeClass('active')
            for (var i = 0; i < peoplename.length; i++) {
                $('.main-item[valueid=' + peoplename[i].valueId + ']').addClass('active')
            }
        })
        //最近使用人
        getlatestuse();
        function getlatestuse() {
            ajaxMethodGetData('user.latestuse.getlist', null, function (data) {
                //console.log(data)
                $('#latestusediv .main-item').remove()
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    var imgurl = '/img/cal/1.png'
                    //if (res.PhotoUrl && res.PhotoUrl != '') {
                    //    imgurl = res.PhotoUrl
                    //}
                    var userName = '';
                    if (res.UserName) {
                        userName = res.UserName;
                    }  
                    if (res.EmployeeId) {
                        var EmployeeId = res.EmployeeId
                    } else {
                        var EmployeeId = ''
                    }
                    $('#latestusediv').append('<div class="main-item" valueId="' + res.SystemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                        + '<img class="left" src="' + imgurl + '" alt="">'
                        + '<div class="item-mi left">'
                            + '<div><span class="name">' + res.FullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                            + '<div>' + res.BusinessUnitIdName + '</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')
                }
                checkpeople();
            })
        }
        //同部门
        $('.nav-item').eq(1).one('click', function () {
            getmybusiness();
        })
        function getmybusiness() {
            ajaxMethodGetData('user.mybusiness.getlist', null, function (data) {
                //console.log(data)
                $('#tongbumen .main-item').remove()
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    var imgurl = '/img/cal/1.png'
                    //if (res.PhotoUrl && res.PhotoUrl != '') {
                    //    imgurl = res.PhotoUrl
                    //}
                    var userName = '';
                    if (res.UserName) {
                        userName = res.UserName;
                    }
                    if (res.EmployeeId) {
                        var EmployeeId = res.EmployeeId
                    } else {
                        var EmployeeId = ''
                    }
                    $('#tongbumen').append('<div class="main-item" valueId="' + res.SystemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                        + '<img class="left" src="' + imgurl + '" alt="">'
                        + '<div class="item-mi left">'
                            + '<div><span class="name">' + res.FullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                            + '<div class="">' + res.BusinessUnitIdName + '</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')
                }
                checkpeople();
            })
        }
        //选人
        var peoplename = []
        function checkpeople() {
            $('.main-item').off()
            $('.main-item').click(function () {
                var EmployeeId = $(this).attr('valueid')
                var name = $(this).find('.name').html()
                lookupControlPick(EmployeeId, name)

                window.close();

                //$(this).toggleClass('active')
                //if ($(this).hasClass('active')) {
                //    var name = $(this).find('.name').html()
                //    var EmployeeId = $(this).attr('EmployeeId')
                //    var BusinessUnitIdName = $(this).attr('BusinessUnitIdName')
                //    var valueId = $(this).attr('valueId')
                //    peoplename.push({
                //        name: name,
                //        valueId: valueId,
                //        BusinessUnitIdName: BusinessUnitIdName,
                //        EmployeeId: EmployeeId
                //    })
                //    $('.body-right').append('<div class="checked-item" valueId="' + valueId + '"><span>' + name + '</span><img src="/img/cal/13.png" alt=""></div>')
                //    deletepeople()
                //} else {
                //    var id = $(this).attr('valueid')
                //    var peoplename2 = []
                //    for (var i = 0; i < peoplename.length; i++) {
                //        if (id == peoplename[i].valueId) {
                //        } else {
                //            peoplename2.push(peoplename[i])
                //        }
                //    }
                //    peoplename = peoplename2
                //    $('.body-right').find('div[valueId=' + id + ']').remove()
                //}
            })
        }
        //小组
        $('.nav-item').eq(4).one('click', function () {
            getgroup();
            $('.right-people').width($('.body').width() - 241)
        })
        function getgroup() {
            ajaxMethodGetData('sys.group.search', null, function (data) {
                //console.log(data)
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    $('#changyongzutree').append('<div class=" main-item-group" groupId="' + res.GroupId + '">'
                        + '<div class="item-mi left">'
                            + '<div class="name">' + res.Name + '(' + res.Quantity + ')' + '</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')
                }
                gropupeople()
            })
        }
        //组下选人
        function gropupeople() {
            $('.main-item-group').click(function () {
                $(this).parent().find('.main-item-group').removeClass('active')
                $(this).addClass('active')
                var that = this;
                var groupId = $(this).attr('groupId')
                ajaxMethodGetData('sys.group.member.search', { groupId: groupId, disablePage: 1 }, function (data) {
                    $('.changyongzu-people').find('.main-item').remove()
                    for (var i = 0; i < data.listData.length; i++) {
                        var res = data.listData[i]
                        var imgurl = '/img/cal/1.png'
                        //if (res.PhotoUrl && res.PhotoUrl != '') {
                        //    imgurl = res.PhotoUrl
                        //}
                        var userName = '';
                        if (res.UserName) {
                            userName = res.UserName;
                        }
                        if (res.EmployeeId) {
                            var EmployeeId = res.EmployeeId
                        } else {
                            var EmployeeId = ''
                        }
                        $('.changyongzu-people').append('<div class="main-item" valueId="' + res.SystemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                        + '<img class="left" src="' + imgurl + '" alt="">'
                        + '<div class="item-mi left">'
                            + '<div><span class="name">' + res.FullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                            + '<div>' + res.BusinessUnitIdName + '</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')
                    }
                    checkpeople()
                })
            })
        }
        //删除人
        function deletepeople() {
            $('.checked-item img').click(function () {
                var id = $(this).parent().attr('valueId')
                var peoplename2 = []
                for (var i = 0; i < peoplename.length; i++) {
                    if (id == peoplename[i].valueId) {
                    } else {
                        peoplename2.push(peoplename[i]);
                    }
                }
                peoplename = peoplename2;
                $('.body').find('div[valueId=' + id + ']').removeClass('active')
                $(this).parent().remove()
            })
        }
        $('.clearchook').click(function () {
            $('.main-item').removeClass('active');
            peoplename = [];
        })
        //角色
        $('.nav-item').eq(5).one('click', function () {
            $('.right-people').width($('.body').width() - 241)

            ajaxMethodGetData('sys.role.search', null, function (data) {
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    $('#juesetree').append('<div class=" main-item-role" RoleId="' + res.RoleId + '">'
                        + '<div class="item-mi left">'
                            + '<div class="name">' + res.Name +'</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')
                }
                $('.main-item-role').click(function () {
                    $(this).parent().find('.main-item-role').removeClass('active')
                    $(this).addClass('active')
                    var that = this;
                    var RoleId = $(this).attr('RoleId')
                    ajaxMethodGetData('sys.rolemember.search', { roleid: RoleId }, function (data) {
                        $('.juese-people').find('.main-item').remove()
                        //console.log(data.listData)
                        for (var i = 0; i < data.listData.length; i++) {
                            var res = data.listData[i]
                            var imgurl = '/img/cal/1.png'
                            //if (res.PhotoUrl && res.PhotoUrl != '') {
                            //    imgurl = res.PhotoUrl
                            //}
                            var userName = '';
                            if (res.UserName) {
                                userName = res.UserName;
                            }
                            if (res.EmployeeId) {
                                var EmployeeId = res.EmployeeId
                            } else {
                                var EmployeeId = ''
                            }
                            $('.juese-people').append('<div class="main-item" valueId="' + res.SystemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                            + '<img class="left" src="' + imgurl + '" alt="">'
                            + '<div class="item-mi left">'
                                + '<div><span class="name">' + res.FullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                                + '<div>' + res.BusinessUnitIdName + '</div>'
                            + '</div>'
                            + '<div class="item-right right">'
                                + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                            + '</div>'
                            + '<div class="clear"></div>'
                        + '</div>')
                        }
                        checkpeople()
                    })
                })
            })
           
        })
        //部门
        $('.nav-item').eq(3).one('click', function () {
            treeNode = new treeLoader("organizationTree", "organizationtree", treeItemClick);
            treeNode.init();
            var screenHeight = getClientHeight();
            $("#treePanel").height(screenHeight - 210);
            $('.right-people').width($('.body').width() - 241)
        })
        function treeItemClick(node) {
            var businessUnitId = node.id;
            ajaxMethodGetData('sys.user.search', { businessUnitId: businessUnitId }, function (data) {
                $('.zuzhijiegou-people .main-item').remove()
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    var imgurl = '/img/cal/1.png'
                    //if (res.PhotoUrl && res.PhotoUrl != '') {
                    //    imgurl = res.PhotoUrl
                    //}
                    var classname = ''
                    for (var j = 0; j < peoplename.length; j++) {
                        if (res.systemUserId == peoplename[j].valueId) {
                            classname = 'active'
                        }
                    }
                    var userName = '';
                    if (res.userName) {
                        userName = res.userName;
                    }
                    if (res.EmployeeId) {
                        var EmployeeId = res.EmployeeId
                    } else {
                        var EmployeeId = ''
                    }
                    $('.zuzhijiegou-people').append('<div class="main-item ' + classname + '" valueId="' + res.systemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                        + '<img class="left" src="' + imgurl + '" alt="">'
                        + '<div class="item-mi left">'
                        + '<div><span class="name">' + res.fullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                        + '<div>' + res.BusinessUnitIdName + '</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')
                }
                checkpeople()
            })
        }
        //搜索人

        $('.gsearch').one('click', function () {
            ajaxMethodGetData('stringmap.getlist', {
                objectTypeCode: 8,
                Name: 'PostId'
            }, function (data) {
                for (var i = 0; i < data.length; i++){
                    $('#PostId').append('<option value="'+data[i].value+'">'+data[i].label+'</option>')
                }
            })
            ajaxMethodGetData('stringmap.getlist', {
                objectTypeCode: 8,
                Name: 'TitleLevel'
            }, function (data) {
                for (var i = 0; i < data.length; i++) {
                    $('#TitleLevel').append('<option value="' + data[i].value + '">' + data[i].label + '</option>')
                }
            })
        })

        function searchpeople(UserName, FullName, EmployeeId, PostId, type, TitleLevel) {
            $('.body-main').css('overflow', 'auto')
            $('.main').hide();
            $('#searchpeoplediv').show();
            var search = $('.search-input input').val();
            var d = {
                search: search
            }
            if (UserName) {
                d.UserName = UserName
            }
            if (FullName) {
                d.FullName = FullName
            }
            if (EmployeeId) {
                d.EmployeeId = EmployeeId
            }
            if (PostId) {
                d.PostId = PostId
            }
            if (TitleLevel) {
                d.TitleLevel = TitleLevel
            }
            if (type == 1) {
                d.search = ''
            }
            ajaxMethodGetData('sys.user.search', d, function (data) {
                $('#searchpeoplediv .main-item').remove()
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    var imgurl = '/img/cal/1.png'
                    //if (res.PhotoUrl && res.PhotoUrl != '') {
                    //    imgurl = res.PhotoUrl
                    //}
                    var classname = ''
                    for (var j = 0; j < peoplename.length; j++) {
                        if (res.systemUserId == peoplename[j].valueId) {
                            classname = 'active'
                        }
                    }
                    if (res.userName) {
                        var userName = res.userName
                    } else {
                        var userName = ''
                    }
                    if (res.EmployeeId) {
                        var EmployeeId = res.EmployeeId
                    } else {
                        var EmployeeId = ''
                    }
                    if (type == 1) {
                        $('#searchpeoplediv').append('<div class="main-item ' + classname + '" valueId="' + res.systemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                        + '<img class="left" src="' + imgurl + '" alt="">'
                        + '<div class="item-mi left">'
                            + '<div><span class="name">' + res.fullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                            + '<div>' + res.BusinessUnitIdName + '</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')

                    //    $('.hightsearch-people').append('<div class="main-item ' + classname + '" valueId="' + res.systemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                    //    + '<img class="left" src="' + imgurl + '" alt="">'
                    //    + '<div class="item-mi left">'
                    //        + '<div><span class="name">' + res.fullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                    //        + '<div>' + res.BusinessUnitIdName + '</div>'
                    //    + '</div>'
                    //    + '<div class="item-right right">'
                    //        + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                    //    + '</div>'
                    //    + '<div class="clear"></div>'
                    //+ '</div>')
                    } else {
                        $('#searchpeoplediv').append('<div class="main-item ' + classname + '" valueId="' + res.systemUserId + '"BusinessUnitIdName="' + res.BusinessUnitIdName + '"EmployeeId="' + EmployeeId + '">'
                        + '<img class="left" src="' + imgurl + '" alt="">'
                        + '<div class="item-mi left">'
                            + '<div><span class="name">' + res.fullName + '</span><span class="">/' + userName + '</span><span class="">/' + EmployeeId + '</span></div>'
                            + '<div>' + res.BusinessUnitIdName + '</div>'
                        + '</div>'
                        + '<div class="item-right right">'
                            + '<img style="width:30px;margin-top:5px;" src="/img/cal/checked.png" alt="">'
                        + '</div>'
                        + '<div class="clear"></div>'
                    + '</div>')
                    }
                }
                checkpeople();
            })
        }

        //高级搜索
        $('.gsearch').click(function () {
            if ($(this).hasClass('active')) {
                $('.hightsearch').hide()
                $('.maincontent').show()
                $(this).removeClass('active')
            } else {

                $('.hightsearch').show()
                $('.maincontent').hide()
                $(this).addClass('active')
            }
        })

        $('.hightsearch-clear').click(function () {
            $('.hightsearch input').val('')
            $('.hightsearch option[value=""]').attr("selected", "selected");
        })
        $('.hightsearch-quite').click(function () {
            $('.hightsearch').hide()
            $('.maincontent').show()
            $('.gsearch').removeClass('active')
        })
        $('.hightsearch-shur').click(function () {
            var UserName = $('input[name="UserName"]').val()
            var FullName = $('input[name="FullName"]').val()
            var EmployeeId = $('input[name="EmployeeId"]').val()
            var PostId = $('select[name="PostId"]').val()
            var TitleLevel = $('select[name="TitleLevel"]').val()
            searchpeople(UserName, FullName, EmployeeId, PostId, 1, TitleLevel)
            $('.hightsearch').hide()
            $('.maincontent').show()
            $('.search-btn').removeClass('active')
        })

        $('.search-input input').keyup(function (event) {
            if (event.keyCode == 13) {
                debugger
                searchpeople()
            }
        })
        $('.lsearch').click(function () {
            searchpeople()

        })
        $(window).resize(function () {
            window.location.reload()
        })
        $('.quite').click(function () {
            window.close();
        })
        $('.shur').click(function () {
            var ids = []
            for (var i = 0; i < peoplename.length; i++) {
                ids.push(peoplename[i].valueId)
            }
            window.opener.getcheckedpeople(peoplename)
            ids = ids.join(',')
            window.opener.ids = ids
            window.close();
        })

        //$('.hightsearch-people').height($(window).height() - 385)
    </script>
    <!-- Body events -->
    <script type="text/javascript">
        /*选择值用这个*/
        function lookupControlPick(valId, valName) {
           
                var controlName = document.getElementById("lknm").value;
                var formName = document.getElementById("lkfm").value;
                //this.SearchForm, this.SearchFieldControl, entity.ID, entity.Name
                //top.window.opener.lookupPick(formName, controlName + "_lkid", "'" + controlName + "'", '', valId, valName, 'null', '');
            // debugger;
                if (window.opener.formcomponents) {
                    window.opener.formcomponents.lookupPick(controlName, valId, valName)
                } else if (window.opener.lookupPick) {
                    window.opener.lookupPick(formName, controlName + "_lkid", controlName, '', valId, valName)
                } else if (window.opener.lookupPick) {
                    window.opener.lookupPick(formName, controlName + "_lkid", controlName, '', valId, valName, 'null', '')
                } 
        }
    </script>
    <script type="text/javascript">        function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { } function bodyOnUnload() { }</script>
</body>
</html>