<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name=renderer  content=webkit>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=640,minimum-scale=0.5,maximum-scale=1.0,user-scalable=no, initial-scale=1.0" />
    <%--<meta name="viewport" content="width=1300px" />--%>
    <link rel="stylesheet" href="/js/layoutlist/layoutlist.css" />
    <link rel="stylesheet" href="/template/css/indexStyle.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/common.css" />
    <link rel="stylesheet" href="/utils/index.min.css">
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/icon/iconfont.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layout.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layoutAside.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/home.css" />
    <link rel="stylesheet" href="/css/homepage.css" />
    
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <%--<script src="/js/CommonUtils.js" type="text/javascript"></script>--%>
    <script src="/js/html2pdf/html2pdf.bundle.min.js" type="text/javascript"></script>
       <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <script src="/jslibrary/sfdc/EmployeePicker.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <script>
        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    
    <script type="text/javascript" src="/js/workflowinstance.js"></script>
<script type="text/javascript" src="/js/layoutlist/ProcessPageConfig.js"></script>
        <script src="/apps/flowdesigner/editors/js/Workflow.js" type="text/javascript"></script>
    <title>OA</title>
    <style>
        .center {
            margin-top: 0px;
            height: 100%;
        }
        .rightWrapper{
            margin-left:0px;
            padding:0px;
        }
       .search .iconfont{
           visibility:hidden;
       }
    </style>
</head> 
<body class="hasMotif Custom18Tab massAddCampaignMemberWiz MassAddCampaignMembersSelectCampaignStage sfdcBody brandQuaternaryBgr"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    onload="if(this.bodyOnLoad)bodyOnLoad();">
       <div class="pageWraper" id="app">
        <div class="center">
            <div class="layoutContent">
                <div class="rightWrapper">
                    <div class="layoutContainer" style="display: block;">
                        <div class="newTodoWrap">
                            <div class="panelModuleWrap panelModuleTop">
                                <div class="tabList">
                                    <div class="tabItem" :class="{'active':currentStr=='lately'}" @click="handleTopTab('lately')">
                                        最近使用
                                    </div>
                                    <div class="tabItem" :class="{'active':currentStr=='collection'}" @click="handleTopTab('collection')">
                                        我的收藏
                                    </div>
                                </div>
                                <div class="moduleBoxWrap" v-if="currentStr=='lately'">
                                    <div class="moduleBox" v-for="(item,index) in latelyList" :key="index"  @click="createProcess(item)">
                                        <div class="title">
                                            <div class="leftTitle">
                                                {{item.name}}
                                            </div>
                                            <div class="rightIcon" @click.stop>
                                                <i class="iconfont icon-shezhi"></i>
                                                <div class="childTipsBox" @click.stop="handleCollection(item,true)">
                                                        收藏
                                                    <div class="popper__arrow">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="bottomInfo">人力资源</div>--%>
                                    </div>
                                    <div class="fake_item"></div>
                                    <div class="fake_item"></div>
                                </div>
                                <div class="moduleBoxWrap" v-if="currentStr=='collection'">
                                    <div class="moduleBox" v-for="(item,index) in collectionList" :key="index"  @click="createProcess(item)">
                                        <div class="title">
                                            <div class="leftTitle">
                                                {{item.Name}}
                                            </div>
                                            <div class="rightIcon" @click.stop>
                                                <i class="iconfont icon-shezhi"></i>
                                                <div class="childTipsBox cancelTips" @click.stop="handleCollection(item,false)">
                                                        取消收藏
                                                    <div class="popper__arrow">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="bottomInfo">人力资源</div>--%>
                                    </div>
                                    <div class="fake_item"></div>
                                    <div class="fake_item"></div>
                                </div>
                            </div>
                            <div class="panelModuleWrap panelModuleBottom">
                                <div class="panelModuleHead">
                                    <div class="lTitle">
                                        全部流程
                                    </div>
                                    <div class="rContent">
                                        <div class="search">
                                            <input type="text" value="" v-model="searchText" placeholder="搜索流程" id="searchProcess">
                                            <div class="searchIcon" @click="handleProcessSearch">
                                                <i class="iconfont icon-sousuo"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div v-if="searchText==''&&searchList==''||searchList==undefined">
                                    <div class="tabList">
                                        <div class="tabItem" :class="{'active':current==0}" @click="handleTab(0)">
                                            全部
                                        </div>
                                        <div class="tabItem" :class="{'active':current==item.folderId}" v-for="item in listData" @click="handleTab(item)">
                                            {{item.name}}
                                        </div>
                                    </div>
                                
                                    <div class="moduleBoxWrap" v-if="current==0">
                                        <div class="moduleBox" v-for="item in listAll" :processId="item.processId" :name="item.name" @click="createProcess(item)">
                                            <div class="title">
                                                <div class="leftTitle">
                                                    {{item.name}}
                                                </div>
                                                <div class="rightIcon" @click.stop>
                                                    <i class="iconfont icon-shezhi"></i>
                                                    <div class="childTipsBox" @click.stop="handleCollection(item,true)">
                                                            收藏
                                                        <div class="popper__arrow">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="fake_item"></div>
                                        <div class="fake_item"></div>
                                    </div>
                                    <div class="moduleBoxWrap" v-for="item in listData" v-if="current==item.folderId">
                                        <div class="moduleBox" v-for="v in item.Processes" :processId="item.processId" :name="item.name" @click="createProcess(item)">
                                            <div class="title">
                                                <div class="leftTitle">
                                                    {{item.name}}
                                                </div>
                                                <div class="rightIcon" @click.stop>
                                                    <i class="iconfont icon-shezhi"></i>
                                                    <div class="childTipsBox" @click.stop="handleCollection(item,true)">
                                                            收藏
                                                        <div class="popper__arrow">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="fake_item"></div>
                                        <div class="fake_item"></div>
                                    </div>
                                </div>
                                <div class="moduleBoxWrap" v-else>
                                    <div class="moduleBox" v-for="item in searchList" :processId="item.processId" :name="item.name" @click="createProcess(item)">
                                        <div class="title">
                                            <div class="leftTitle">
                                                {{item.name}}
                                            </div>
                                            <div class="rightIcon" @click.stop>
                                                <i class="iconfont icon-shezhi"></i>
                                                <div class="childTipsBox" @click.stop="handleCollection(item,true)">
                                                        收藏
                                                    <div class="popper__arrow">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="fake_item"></div>
                                    <div class="fake_item"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
<script type="text/javascript" src="/js/request.js"></script>
<script type="text/javascript" src="/js/head.js"></script>
<script type="text/javascript" src="/js/formcomponents.js"></script>
<script type="text/javascript" src="/utils/vue.js"></script>
<script type="text/javascript" src="/utils/index.min.js"></script>
<script type="text/javascript" src="/js/mixin.js"></script>
<script type="text/javascript">
    function bodyOnLoad() {
        setFocusOnLoad();
        //jQuery("#treeRootNode").height(jQuery("#lineItemView_wrapper").height());
        if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQxTkROYSx4c3dtLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&isAjaxRequest=1&renderMode=RETRO&nocache=1437552855562'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQyT1RSYSw2cDlmLE1HVXdaalF3"; };
    } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
    function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
</script>
<script type="text/javascript" src="/utils/messageTips.js">
</script>
<script>
    var app = new Vue({
        el: '#app',
        data: function () {
            return {
                listData: [],
                listClass: [],
                listAll: [],
                current: 0,
                disabled: true,
                collectionList: [],
                latelyList: [],
                currentStr: 'lately',
                searchText: '',
                searchList: []
            }
        },
        created: function () {
            this.getCollection('process.favorite.getlist', 'collection');
            this.getCollection('process.latestused.getlist', '');
            this.getQueryList();
        },
        watch:{
            searchText: {
                handler(val, oldVal) {
                    console.log(val, oldVal)
                    if (val.length >= 2 || val.length == 0) {
                        this.handleProcessSearch();
                    }
                }
            }
        },
        methods: {
            handleTopTab:function(str) {
                this.currentStr = str;
            },
            open() {
                var that = this;
                var success = function callback(messageText) {
                    that.$message({
                        type: 'success',
                        message: messageText
                    });
                }
                var error = function callbackError(messageText) {
                    that.$message({
                        type: 'info',
                        message: messageText
                    });
                }
                messageTips(this, '标题', '描述', '确定', '取消', 'text', true, '成功执行！', '已取消', success, error, 'cancelButtonClass', 'confirmButtonClass')
            },
            createProcess: function (item) {
                item.name = item.name || item.Name
                item.processId = item.processId || item.ProcessId
                var url = "/apps/wf/createInstancePop.aspx?t=a0M&processId=" + item.processId + "&name=" + item.name
                parent.showDialog(url, 'createInstancePop', '发起事务',600, 400);
            },
            handleTab(item) {
                if (item == 0) {
                    this.current = 0;
                } else {
                    this.current = item.folderId;
                }
            },
            flatten(data) {
                var that = this;
                var list = data;
                var result = []
                list.forEach(function (item) {
                    if (item.Processes) {
                        item.Processes.forEach(function (v) {
                            result.push(v)
                        })
                    }
                })
                return result
            },
            treeData(data) {
                var result = []
                var list = JSON.parse(JSON.stringify(data))
                if (!Array.isArray(list)) {
                    return result
                }
                list.forEach(function(item) {
                    delete item.children
                })
                var map = {}
                list.forEach(function (item) {
                    map[item.id] = item
                })
                list.forEach(function (item) {
                    const parent = map[item.pid]
                    if (parent) {
                        parent.children = parent.children || []
                        parent.children.push(item)
                    } else {
                        result.push(item)
                    }
                })
                return result
            },
            // 收藏true 取消收藏false
            handleCollection: function (item, isBoolean) {
                item.processId = item.processId || item.ProcessId;
                cmd = 'process.favorite.add'
                var data = {
                    processid: item.processId
                }
                if (!isBoolean) {
                    cmd = 'process.favorite.delete'
                    data = {
                        valueId: item.processId
                    }
                }
                var that = this;
                var url = "/apps/CommandProcessor.ashx?c=1" + "&cmd=" + cmd;
                jQuery.ajax({
                    async: false, cache: false, dataType: "json",
                    data: data,
                    error: function (request, textStatus, errorThrown) {
                    },
                    success: function (data, textStatus) {
                        console.log(data)
                        var type = 'success'
                        if (data.status == 0) {
                            type = 'error'
                        }
                        that.$message({
                            type: type,
                            message: data.msg
                        });
                    },
                    type: "GET",
                    url: url
                });
            },
            getCollection: function (cmd,str) {
                var that = this;
                var url = "/apps/CommandProcessor.ashx?c=1" + "&cmd="+cmd;
                jQuery.ajax({
                    async: false, cache: false, dataType: "json",
                    data: {
                    },
                    error: function (request, textStatus, errorThrown) {
                        // errorThrown = String(errorThrown).replace(/&/g, "&").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, ">");
                    },
                    success: function (data, textStatus) {
                        // 我的收藏
                        if (str == 'collection') {
                            that.collectionList = data.rows;
                        } else {
                            // 最近使用
                            that.latelyList = data.rows;
                        }
                    },
                    type: "GET",
                    url: url
                });
            },
            handleProcessSearch: function () {
                var that = this;
                if (that.searchText == '') {
                    that.getQueryList();
                } else {
                    var result = []
                    that.listAll.forEach(function (item) {
                        if (item.name.indexOf(that.searchText) != -1) {
                            result.push(item);
                        }
                    })
                }
                that.searchList = result;
                console.log('result', that.searchList)
            },
            getQueryList: function () {
                var that = this;
                var url = "/apps/CommandProcessor.ashx?c=1&cmd=process.search";
                jQuery.ajax({
                    async: false, cache: false, dataType: "json",
                    data: {
                    },
                    error: function (request, textStatus, errorThrown) {
                        // errorThrown = String(errorThrown).replace(/&/g, "&").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, ">");
                    },
                    success: function (data, textStatus) {
                        var arr = data.processLists;
                        that.listData = arr;
                        that.listAll = that.flatten(arr);

                        //a = listData.filter(item=>item.name=='最近使用')
                        console.log('listData', that.listAll)
                    },
                    type: "GET",
                    url: url
                });
            }
        }
    })
</script>
<script>
    var height = $(this).height() - 64;
    var width = $(this).width();
    var bodyTopHeight = $('.layoutContainer .newTodoWrap .panelModuleWrap.panelModuleTop').outerHeight();
    console.log(bodyTopHeight, 'bodyTopHeight')
    bodyBottomHeight = height - bodyTopHeight;
    $('.layoutContainer .newTodoWrap .panelModuleWrap.panelModuleBottom').css('height', bodyBottomHeight + 'px');
    $('.center').css("height", height + 'px');
    $(window).resize(function () {
        width = $(this).width();
        height = $(this).height() - 64;
        $('.center').css("height", height + 'px');
        bodyBottomHeight = height - bodyTopHeight;
        $('.layoutContainer .newTodoWrap .panelModuleWrap.panelModuleBottom').css('height', bodyBottomHeight + 'px');
        // console.log('width', width)
    });
    $('.guideWrap .tabContainer .tab').click(function(){
        $('.guideWrap .tabContainer .tab').removeClass('active');
        $(this).addClass('active');
    })
    $('.sanlan').click(function(){
        $('.treeTemplate').toggle();
        $(this).toggleClass('active');
    })
    $('.noticeModal .tabContainer .tab').click(function(){
        $('.noticeModal .tabContainer .tab').removeClass('active');
        $(this).addClass('active');
    })
    $('.leftTabMenu').click(function () {
        $('.leftTabMenu').removeClass('active');
        $(this).addClass('active');
        var name = $(this).attr('name')
        if (name && name != 'undefined') {
            $('#childreniframe').attr('src', '/wfinstance/instPageTemplate.aspx?iframename=childreniframe&objTypeId=123&name=' + name);
        }
        else {
            $('#childreniframe').attr('src', '');
        }
    })
    $(document).ready(function () {
        var name = $('.leftTabMenu.active').attr('name');
        if (name && name != 'undefined') {
            $('#childreniframe').attr('src', '/wfinstance/instPageTemplate.aspx?iframename=childreniframe&objTypeId=123&name=' + name);
        }
        else {
            $('#childreniframe').attr('src', '');
        }
    })

    

  
</script>
</html>
