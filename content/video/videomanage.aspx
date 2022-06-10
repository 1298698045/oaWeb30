<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="videomanage.aspx.cs" Inherits="Supermore.content.video.videomanage" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="" class="  ext-strict">
<head>
    <title>内容 ： 视频 ： 视频管理</title>
    <script type="text/javascript" src="/static/111213/js/perf/stub.js"></script>
    <!--<script type="text/javascript" src="/faces/a4j/g/3_3_3.Finalorg.ajax4jsf.javascript.AjaxScript?rel=1453004515000"></script>-->
    <script type="text/javascript" src="/jslibrary/sfdc/SfdcCore.js"></script>
    <script type="text/javascript" src="/EXT/ext-3.3.3/ext.js"></script>
    <!--
    <script type="text/javascript" src="/jslibrary/1449190104000/sfdc/AnalyticsFramework.js"></script>
    <script type="text/javascript" src="/jslibrary/1449190104000/sfdc/GuidedTour.js"></script>
    <script type="text/javascript" src="/jslibrary/1449190104000/sfdc/AnalyticsHome.js"></script>
      <script type="text/javascript" src="/jslibrary/sfdc/VFState.js"></script>   -->
    <script type="text/javascript" src="/content/video/public.js"></script>
    <script type="text/javascript" src="/static/111213/js/picklist.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script type="text/javascript" src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/LineItem.js"></script>
    <script src="/jslibrary/sfdc/source/SearchOnly.js"></script>
    <!--<script src="/jslibrary/sfdc/source/SearchOnlyExtend.js"></script>-->
    <script src="/jslibrary/sfdc/EntityCustomSearchPage.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" class="user">
    <!--<link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css" class="user">-->
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/AnalyticsHome.css" class="user">
    <!--
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/AnalyticsCommon.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/35.0/sprites/1450809186000/Theme3/zh/base/GuidedTour.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/35.0/sprites/1450809186000/Theme3/zh/base/chatterCore.css" class="user">
    <link type="text/css" rel="stylesheet" href="/sCSS/35.0/sprites/1450809186000/Theme3/zh/base/chatterExtended.css" class="user">-->
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "isS1Desktop": false, "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-MM-dd HH:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1450733912000", "today": "2016-1-20 上午10:32", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'File';</script>
    <link href="https://ap1..com/favicon.ico" rel="shortcut icon">
    <link href="/content/video/icon.css" rel="stylesheet" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //ClientHash.prototype.needsClientHash('sid_Client','000000390Wh0000000yvHG','36.110.120.9','/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00O%2Fo');</script>
    <style>
        .x-panel {
            height: 100%;
        }

        .x-panel-bwrap {
            height: 100%;
            border-bottom: 1px solid #ccc;
        }

        .noSidebarCell, .sidebarCell .fixed {
            padding: 0 10px;
        }

        body .bPageTitle {
            padding: 0;
        }

        .x-form-field-wraps {
            position: relative;
            right: 10px;
            top: 0;
            text-align: right;
            zoom: 1;
            white-space: nowrap;
        }

        .ext-strict .x-form-text {
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .quickfindContainer .quickfindInput {
            background-position: 2px 6px;
        }

        body .btn {
            height: 33px;
            background: #fff;
            border: 1px solid #ccc;
            font-size: 12px;
            width: 89px;
        }

        /*body .btn:hover {
                color: #333;
                background-color: #e6e6e6;
                border-color: #adadad;
            }*/


        .icon-wenjianjia {
            color: #F7DCA7;
            margin-right: 8px;
        }

        .icon-AVIshipinwenjian-copy {
            font-size: 20px;
            margin-right: 8px;
            color: #1797c0;
        }

        .x-tree-node {
            /*height: 29px;*/
            line-height: 29px;
        }

        .x-tree-node-el {
            line-height: 29px;
            cursor: pointer;
        }

        .x-tree-lines .x-tree-node .x-tree-ec-icon.x-tree-elbow-plus {
            margin-right: 10px;
            margin-top: 5px;
        }

        .x-tree-lines .x-tree-node .x-tree-node-collapsed .x-tree-node-icon {
            margin-top: 5px;
        }

        .x-tree-root-ct.x-tree-lines .x-tree-node .x-tree-ec-icon.x-tree-elbow-minus {
            margin-right: 10px;
            margin-top: 5px;
        }

        .x-tree-lines .x-tree-node .x-tree-ec-icon.x-tree-elbow-end-plus {
            margin-right: 10px;
            margin-top: 5px;
        }

        .x-tree-lines .x-tree-node .x-tree-node-expanded .x-tree-node-icon {
            margin-top: 5px;
        }

        /*.loaded {
            background-image: url(/img/expand.png);
            background-position: 9px center;
            background-repeat: no-repeat;
            display: inline-block;
            width: 26px;
            height: 14px;
            margin-top: 6px;
        }

        .open {
            background-image: url(/img/close.png);
            background-position: 9px center;
            background-repeat: no-repeat;
        }*/
        .black {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #000;
            opacity: .5;
            z-index: 999;
            display: none;
        }

        .new_build, .update, .Upload ,.Delete{
            z-index: 10000;
            position: absolute;
            
            width: 50%;
            background: #fff;
            padding-bottom: 19px;
            border-radius: 10px;

            left:0px;
            right: 0px;
            top:0px;
            margin:auto;
        }

            .new_build .div_input, .update .div_input {
                text-align: center;
            }

            .new_build input, .update input {
                width: 80%;
                margin-top: 22px;
                height: 30px;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding-left: 13px;
            }

        .foot_btn {
            margin-top: 30px;
            text-align: center;
        }

            .foot_btn button:first-child {
                margin-right: 45px;
            }

        #upload_video {
            width: 100px;
            height: 35px;
            margin: 0 auto;
            margin-top: 20px;
            text-align: center;
            line-height: 35px;
            font-size: 15px;
            border: 1px solid #337ab7;
            border-radius: 5px;
            background: #337ab7;
            color: #fff;
        }

            #upload_video:hover {
                background-color: #286090;
                border-color: #204d74;
            }

        #upload_video_ {
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            width: 100px;
            height: 35px;
        }

        body .yes, .ok {
            color: #fff;
            background-color: #5bc0de;
            border-color: #46b8da;
        }

        body .ok {
            color: #fff;
            background-color: #5bc0de;
            border-color: #46b8da;
        }

        body .yes:hover, .ok:hover {
            color: #fff;
            background-color: #31b0d5;
            border-color: #269abc;
        }

        body .no {
            color: #fff;
            background-color: #d9534f;
            border-color: #d9534f;
        }

            body .no:hover {
                background-color: #c9302c;
                border-color: #ac2925;
            }
    </style>

    <link href="/content/video/plupload/plupload-3.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css" rel="stylesheet" />
    <link href="/content/video/plupload/plupload-3.1.2/js/jquery.ui.plupload/css/jquery.ui.plupload.css" rel="stylesheet" />
    <script src="/content/video/plupload/plupload-3.1.2/js/plupload.full.min.js"></script>
    <script src="/content/video/plupload/plupload-3.1.2/js/jquery.ui.plupload/jquery.ui.plupload.min.js"></script>
    <script src="/content/video/plupload/plupload-3.1.2/js/jquery.plupload.queue/jquery.plupload.queue.min.js"></script>
    <script src="/content/video/plupload/plupload-3.1.2/js/i18n/zh_CN.js"></script>
    <script src="/content/video/plupload/upload.js"></script>
    <script>
        function returnRoot() {
            
            $('#currentFolderId').html('');
            var treePanel = Ext.getCmp('ext-comp-1001');
            
            treePanel.getLoader().load(treePanel.root);

            loadGrids("");
        }
    </script>
</head>
<body onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif reportTab  sfdcBody brandQuaternaryBgr   ext-gecko ext-gecko3 x-theme-aloha-esque" onload="if(this.bodyOnLoad)bodyOnLoad();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onunload="if(this.bodyOnUnload)bodyOnUnload();" id="ext-gen3" style="overflow: hidden;">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div class="black"></div>
    <div id="contentWrapper" style="position: absolute; width: 98.5%; height: 100%;">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" style="height: calc(100% - 119px);">
            <table cellspacing="0" cellpadding="0" border="0" id="bodyTable" class="outerNoSidebar" style="height: 100%; margin-top: 20px; width: 100%; display: block;">
                <tbody style="height: 100%; width: 100%; display: block;">
                    <tr style="height: 100%; width: 100%; display: block;">
                        <td class="noSidebarCell" style="height: 100%; display: block;">
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" alt="内容在此开始" src="/s.gif"></a><span id="thePage"></span><span id="thePage:j_id0"></span><div class="bPageTitle">
                                    <div class="ptBody secondaryPalette brandSecondaryBrd">
                                        <div class="content">
                                            <h1 class="pageType noSecondHeader">
                                                <a href="#" onclick="returnRoot();">视频库</a></h1>
                                            <div class="blank"></div>
                                        </div>
                                        <div class="addNewButtons" style="float: right">
                                            <input style="height: 33px;" type="button" value="上传视频" title="上传视频" class="btn" onclick="Upload()">
                                            <input style="height: 33px;" type="button" value="新建文件夹" title="新建文件夹" onclick="New()" class="btn">
                                        </div>
                                    </div>
                                </div>
                            <span id="thePage:rerenderPanel">
                                <script type="text/javascript">
                                    var response = {};
                                </script>
                            </span>
                            <input type="hidden" name="currentFolder" id="currentFolder" />
                            <div style="visibility: hidden" id="homeContent" class="homeContent">
                            </div>
                            <div class="new_build" style="display: none;">
                                <div class="div_input">
                                    <input type="type" class="name" placeholder="请输入文件夹名称" />
                                </div>
                                <div class="foot_btn">
                                    <button class="yes btn">确定</button>
                                    <button class="no btn">取消</button>
                                </div>
                            </div>
                            <div class="update" style="display: none;">
                                <div class="div_input">
                                    <input type="type" oninput="value=value.replace(/[^\d]/g,'')" class="names" placeholder="请输入序号(只能填数字)" />
                                </div>
                                <div class="foot_btn">
                                    <button class="ok btn">确定</button>
                                    <button class="no btn">取消</button>
                                </div>
                            </div>
                                <div class="Upload" style="display: none;width:60%;">
                                         <div id="uploaderContainer" ></div>
                               
                                <div class="foot_btn">
                                    <button class="no btn">关闭</button>
                                </div>
                            </div>
                            <div class="Delete" style="display: none;width:18%;top: 206px;">
                                <div class="div_input">
                                    <div style="font-size:14px;text-align:center;margin-top:30px;">确定要删除吗？</div>
                                </div>
                                <div class="foot_btn">
                                    <button class="delete_ok btn">确定</button>
                                    <button class="no btn">取消</button>
                                </div>
                            </div>
                            <div id="currentFolderId" style="display:none;"></div>
                            <div id="homeContentDest" class="homeContent" style="height: 81%;">
                                <div id="ext-comp-1015" class=" homePanel x-border-layout-ct" style="width: 100%; height: 100%;">
                                    <div id="folderTreePanel" class="x-panel" style="border: solid; border: 1px; width: 240px; left: 0px; top: 0px; height: 100%;">
                                    </div>

                                    <script type="text/javascript">
                                        //左侧自动渲染
                                        var treeHeight = 0;
                                        jQuery(document).ready(function () {
                                            treeHeight = getAutoHeight();
                                            treeHeight = treeHeight - 111 - 37 - 30 - 20;
                                            var Tree = Ext.tree;
                                            var tree = new Tree.TreePanel({
                                                rootVisible: !1, autoScroll: !0,
                                                border: true,
                                                height: treeHeight,
                                                root: {
                                                    nodeType: 'async',
                                                    text: '文档库',
                                                    draggable: false,
                                                    id: ''
                                                }
                                            });

                                            //tree.getSelectionModel().on("selectionchange", tree);
                                            tree.on('click', function (node, e) {
                                                loadGrids(node.id);
                                            });
                                            tree.on('beforeload', function (node) {
                                                var timestamp = (new Date()).valueOf();
                                                if (node.isRoot) {
                                                    tree.loader.dataUrl = "/apps/CommandProcessor.ashx?t=" + timestamp + "&cmd=video.subfolder.list&ParentId=";
                                                }
                                                else {
                                                    tree.loader.dataUrl = "/apps/CommandProcessor.ashx?t=" + timestamp + "&cmd=video.subfolder.list&ParentId=" + node.id;
                                                }
                                            });
                                            // id=ext-comp-1001
                                            tree.render('folderTreePanel');
                                            tree.getRootNode().expand();
                                            jQuery("#ext-gen5").height('100%');
                                            loadGrids("");
                                        });
                                    </script>
                                    <script type="text/javascript">
                                        //获取根文件夹的请求(root)
                                        function loadGrids(extSrch) {
                                            $('#currentFolderId').html(extSrch);
                                            var timestamp = (new Date()).valueOf();
                                            
                                            jQuery.ajax({
                                                url: "/apps/CommandProcessor.ashx?t=" + timestamp + "&cmd=video.video.getitems",
                                                type: "GET",
                                                async: false,
                                                dataType: "json",
                                                data: {
                                                    ParentId: extSrch
                                                },
                                                success: function (data) {
                                                    renderGrid(data)
                                                }
                                            });
                                        }

                                        //创建文件夹
                                        function New() {
                                            $('.new_build').show();
                                            $('.black').show();
                                           
                                            var ParentId = $('#currentFolderId').html();
                                            $('.yes').click(function () {
                                                var val = $('.name').val();
                                                var vals = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]");
                                                var result = val.match(vals)

                                                if (!result) {
                                                    jQuery.ajax({
                                                        url: "/apps/CommandProcessor.ashx?cmd=video.folder.create",
                                                        type: "GET",
                                                        async: false,
                                                        dataType: "json",
                                                        data: {
                                                            Name: val,
                                                            ParentId: ParentId,
                                                            SortNumber: '1001'
                                                        },
                                                        success: function (data) {
                                                            if ($('#currentFolderId').html() == '') {
                                                                var treePanel = Ext.getCmp('ext-comp-1001');
                                                                var node = new Ext.tree.TreeNode({ id: data.Data.id, text: data.Data.text, leaf: false, cls:'folder'}); //为叶子节点
                                                                //var parentNode = treePanel.root.appendChild(node);
                                                                treePanel.getLoader().load(treePanel.root);
                                                            }

                                                            loadGrids(ParentId);
                                                            $('.new_build').hide();
                                                            $('.black').hide();
                                                            $('.name').val('');
                                                        }
                                                    });
                                                } else {
                                                    alert("含有特殊字符")

                                                }

                                            })
                                        }
                                        $('.no').click(function () {
                                            $('.update').hide();
                                            $('.new_build').hide();
                                            $('.Upload').hide();
                                            $('.black').hide();
                                            $('.Delete').hide();
                                        })

                                        
                                       

                                        //更新排序
                                        function Update(id, text) {
                                            $('.names').val(text);
                                            $('.update').show();
                                            $('.black').show();
                                            
                                        }
                                        //右侧内容获取
                                        function renderGrid(data) {
                                            var html = "";
                                            for (var i = 0; i < data.length; i++) {
                                                var item = data[i];
                                                if ((i % 2) == 0)
                                                    html += "<tr class=\" dataRow even\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";
                                                else
                                                    html += "<tr class=\" dataRow odd\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";

                                                html += " <td class=\"dataCell\">";
                                                if (item.cls == "folder") {
                                                    html += "<i class='iconfont icon-wenjianjia'></i><a href=\"#\" onclick=\"loadGrids('" + item.id + "')\">";
                                                }
                                                else {
                                                    html += "<i class='iconfont icon-AVIshipinwenjian-copy'></i><a target='_blank' href=\"" + '/content/video/video.html?id=' + item.id + "\">";
                                                }
                                                html += item.text + "</a></td>";

                                                html += " <td class=\"dataCell\">" + item.createdbyusername + "</td>";
                                                var time = item.created.replace('t', ' ');
                                                var times = item.modifiedon.replace('t', ' ');
                                                html += " <td class=\"dataCell\">" + time + "</td>";
                                                html += " <td class=\"dataCell\">" + times + "</td>";
                                                html += "<td class=\"  \" scope=\"row\">";

                                                if (item.cls == "folder" && item.canadmin == true) {
                                                    //html += " <a title=\"排序\" class=\"actionLink\" href=\"#\" onclick=\"Update('" + item.id + "','" + item.text + "')\">排序</a>&nbsp;|&nbsp;";
                                                    html += " <a title=\"删除\" class=\"actionLink\" href='#' onclick=\"Delete('" + item.id + "')\">删除</a>";
                                                }
                                                else {
                                                    if (item.canadmin == true) {
                                                        //html += " <a title=\"替换\" class=\"actionLink\" href=\"#\">替换</a>&nbsp;|&nbsp;";
                                                        html += " <a title=\"删除\" class=\"actionLink\" href='#'  onclick=\"DeleteFile('" + item.id + "')\">删除</a>&nbsp; ";
                                                    }
                                                    ////判断他的后缀
                                                    //if (item.fileExtension == ".xls" || item.fileExtension == "xls" ||
                                                    //    item.fileExtension == ".xlsx" || item.fileExtension == "xlsx" ||
                                                    //    item.fileExtension == ".docx" || item.fileExtension == "docx" ||
                                                    //    item.fileExtension == ".doc" || item.fileExtension == "doc" ||
                                                    //    item.fileExtension == ".zip" || item.fileExtension == "zip") {
                                                    //    html += "&nbsp;|&nbsp; <a title=\"查看\" class=\"actionLink\" href='#'>查看</a>";
                                                    //}
                                                    //else if (item.fileExtension == ".pdf" || item.fileExtension == "pdf"
                                                    //   || item.fileExtension == ".jpg" || item.fileExtension == "jpg"
                                                    //    || item.fileExtension == ".png" || item.fileExtension == "png"
                                                    //    || item.fileExtension == ".gif" || item.fileExtension == "gif"
                                                    //    || item.fileExtension == ".bmp" || item.fileExtension == "bmp") {
                                                    //    html += "&nbsp;|&nbsp; <a title=\"查看\" class=\"actionLink\" href='#'>查看</a>";
                                                    //}
                                                }
                                                html += "</td>";
                                                html += "</tr>";
                                            }
                                            if (html.length == 0) {
                                                html += "<tr>";
                                                html += "<td style='text-align:center;' colspan='5'>没有数据";

                                                html += "</td>";
                                                html += "</tr>";
                                            }
                                            jQuery("#chidItems").html(html)
                                        }
                                        //删除文件夹
                                        function Delete(id) {
                                            var ID = $('#currentFolderId').html();
                                            $('.black').show();
                                            $('.Delete').show();
                                            $('.delete_ok').click(function () {
                                                jQuery.ajax({
                                                    url: "/apps/CommandProcessor.ashx?cmd=video.folder.delete",
                                                    type: "GET",
                                                    async: false,
                                                    dataType: "json",
                                                    data: {
                                                        Id: id
                                                    },
                                                    success: function (data) {
                                                        if (data.status == 1) {
                                                            // alert('删除成功');
                                                            $('.black').hide();
                                                            $('.Delete').hide();
                                                            loadGrids(ID);
                                                        }
                                                    }
                                                });
                                            })

                                        }

                                        function DeleteFile(id) {
                                            var folderId = $('#currentFolderId').html();
                                            $('.black').show();
                                            $('.Delete').show();
                                            $('.delete_ok').click(function () {
                                                jQuery.ajax({
                                                    url: "/apps/CommandProcessor.ashx?cmd=video.video.delete",
                                                    type: "GET",
                                                    async: false,
                                                    dataType: "json",
                                                    data: {
                                                        FileId: id
                                                    },
                                                    success: function (data) {
                                                        if (data.status == 1) {
                                                            $('.black').hide();
                                                            $('.Delete').hide();
                                                            loadGrids(folderId);
                                                        }
                                                    }
                                                });
                                            })
                                        }
                                        //上传视频
                                        function Upload() {
                                            var guid = generateUUID();
                                            var uploadUrl = '/apps/CommandProcessor.ashx?cmd=video.video.upload';
                                            var currentFolderId = $('#currentFolderId').html();
                                            $("#uploaderContainer").empty();
                                            $("#uploaderContainer").append("<div id='" + guid + "'></div>");
                                            InitPLUpload('#' + guid + '', uploadUrl, currentFolderId, 'mp4,jpg,png,jpeg', 2, false, false);
                                            $('.Upload').show();
                                            $('.black').show();
                                        }
                                        //查看视频
                                        function openFile(url) {
                                            location.href = "/content/video/video.html" + '?url=' + url;
                                        }
                                    </script>
                                    <script type="text/javascript">
                                        function getAutoHeight() {
                                            var x = 0, y = 0;
                                            if (self.innerHeight) // all except Explorer
                                            {
                                                x = self.innerWidth;
                                                y = self.innerHeight;
                                            }
                                            else if (document.documentElement && document.documentElement.clientHeight)
                                                // Explorer 6 Strict Mode
                                            {
                                                x = document.documentElement.clientWidth;
                                                y = document.documentElement.clientHeight;
                                            }
                                            else if (document.body) // other Explorers
                                            {
                                                x = document.body.clientWidth;
                                                y = document.body.clientHeight;
                                            }
                                            return y;
                                        }
                                    </script>
                                    <%--右侧--%>
                                    <div id="ext-comp-1016" class=" x-panel x-panel-noborder x-border-panel" style="left: 247px; top: 0px; width: calc(100% - 243px);">
                                        <!-- Begin RelatedListElement -->
                                        <div class="bRelatedList" style="height: 100%; overflow: auto;">
                                            <!-- Begin ListElement -->
                                            <!-- motif: Account -->
                                            <!-- WrappingClass -->
                                            <div class="hotListElement">
                                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                                    <!--<form onsubmit="if (window.ffInAlert) { return false; }" name="actionForm" method="POST" id="actionForm" autocomplete="off" action="">-->
                                                    <div class="pbHeader">
                                                        <div id="listview_subNav" class="subNav">
                                                            <div class="linkBar brandSecondaryBrd">
                                                                <div id="listview_search" class=" quickfindContainer">
                                                                    <div class="x-form-field-wraps x-form-field-trigger-wrap" id="ext-gen113" style="padding-left: 10px;">
                                                                        <input type="text" name="ext-comp-1017" id="ext-comp-1017" onchange="searchFiles()" autocomplete="off" size="16" class="x-form-text x-form-field quickfindInput x-form-empty-field" style="width: 210px; height: 26px;" title="快速搜索" onkeydown="searchKeyDown()" /><img class="x-form-trigger undefined" alt="" src="/s.gif" id="ext-gen114" style="display: none;">
                                                                    </div>
                                                                </div>
                                                                <div class="clearingBox"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="pbBody" style="overflow: auto;" id="gridBody">
                                                        <table class="list" cellspacing="0" cellpadding="0" border="0">
                                                            <tr class="headerRow">

                                                                <th class=" zen-deemphasize" scope="col">名称
                                                                </th>
                                                                <th class=" zen-deemphasize" scope="col">创建人
                                                                </th>
                                                                <th class=" zen-deemphasize" scope="col">创建时间
                                                                </th>
                                                                <th class="PhoneNumberElement zen-deemphasize" scope="col">最后修改时间
                                                                </th>
                                                                <th class="actionColumn" scope="col" style="width: 100px;">操作
                                                                </th>
                                                            </tr>
                                                            <tbody id="chidItems">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="pbFooter secondaryPalette">
                                                        <div class="bg">
                                                        </div>
                                                    </div>
                                                    <!--</form>-->
                                                </div>
                                            </div>
                                            <div class="listElementBottomNav">
                                            </div>
                                            <!-- End ListElement -->
                                        </div>
                                        <!-- End RelatedListElement -->
                                    </div>
                                   
                                </div>
                            </div>
                            <!-- Body events -->
                            <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4Tmkwd01TMHlNMVF3TWpvek1qbzFOaTQ1TXpoYSxBazhWVWRXc1BOa1BZRWVQZUxraVFiLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");; if (this.loadChatFrameJs) loadChatFrameJs(); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd01TMHlNMVF3TWpvek1qbzFOeTQzTURCYSxKRDBEejZnLWRXd1FWRUtLR2ZtV2lqLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                            
                            <!-- End page content -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
</body>
</html>
