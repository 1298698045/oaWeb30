<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="closedtasklst.aspx.cs" Inherits="WebClient.wfinstance.closedtasklst" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>已办事务 ： 流程管理 ~ 高效源于协同</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css">
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/SelectionSearchPage.css" rel="stylesheet" type="text/css" />
    <link href="/css/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/LineItem.js"></script>
    <script src="/jslibrary/sfdc/source/SearchOnly.js"></script>
    <script src="/jslibrary/sfdc/EntityCustomSearchPage.js"></script>
     <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/searchFilterField.js"></script>
     <script src="/js/Business.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <script src="/apps/flowdesigner/editors/js/Workflow.js"></script>
    <script>
        UserContext.initialize({ "networkId": "", "labelLastModified": "1437415694000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd tthh:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Employee';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/EXT/ext-3.3.3/resources/css/ext-all-notheme.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/ExtCSS-SFDC.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/SelectionSearchPage.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1436375594000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437271521000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1437416662000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        window.sfdcPage = new EntityCustomSearchPage();//</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '114.111.167.121', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk');</script>
    <style>
        .subNav-tab{
            margin-left:20px;
        }
        #sidebarCell {
            padding-top:50px;
            padding-bottom:0;
        }
        #bodyCell {
            padding-bottom:8px;
            padding-left:0px;            
        }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif campaignTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="subNav" style="height: 25px; background-color: #fff; margin: 0px; margin-top:10px; border-bottom: 1px dotted #E9E9E9; line-height: 23px; font-size: 13px; margin-left: 5px; margin-bottom: 5px;">
                <div style="width:100%;height:30px;">
                   <a id="wfcreatewizard" href="/wfinstance/instanceCreate.aspx?gridid=wfcreatewizard&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">新建流程</span>
                    </a>                   
                    <a id="wfrulelog" href="/wfinstance/wftasklst.aspx?gridid=wfrulelog&t=a0M" class="subNav-tab ">
                        <span style="display:inline-block;width:75px;">待办事务(<span class="stat" id="waitingTaskQty" style="color:red;">0</span>)</span>
                    </a>
                    <a id="closedwfrulelog"  href="/wfinstance/closedtasklst.aspx?gridid=closedwfrulelog&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">已办事务</span>
                    </a>                   
                    <a id="mycreatewfinstances" href="/wfinstance/instlst.aspx?gridid=mycreatewfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">我发起件(<span class="stat" id="instanceQty" style="color:blue;">0</span>)</span>
                    </a>  
                    <a id="cancelledWfinstances" href="/wfinstance/cancellst.aspx?gridid=cancelledWfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">退回/撤销(<span class="stat" id="cancelledQty" style="color:red;">0</span>)</span>
                    </a>                    
                    <a id="myreadwfinstances" href="/wfinstance/fowardReadLog.aspx?gridid=myreadwfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">收到传阅(<span class="stat" id="readQty" style="color:red;">0</span>)</span>
                    </a>
                    <a id="createdreadwfinstances" href="/wfinstance/SendInstanceRead.aspx?gridid=createdreadwfinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">我传阅的</span>
                    </a>  
                    <a id="mydraftinstances" href="/wfinstance/draftlst.aspx?gridid=mydraftinstances&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">草稿箱(<span class="stat" id="draftQty" style="color:red;">0</span>)</span>
                    </a>                   
                     <a id="mycomments" href="/wfinstance/commentliblst.aspx?gridid=mycomments&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">常用意见</span>
                    </a> <!--
                     <a id="wordtemplates" href="/wfinstance/DocTemplates.aspx?gridid=wordtemplates&t=a0M" class="subNav-tab">
                        <span style="display:inline-block;width:75px;">正文模板</span>
                    </a>  
                      <a id="settings" href="/wfinstance/personalSetup.aspx?gridid=settings&t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">个人设置</span>
                    </a>              
                    <a id="dashboard" href="/wfinstance/dashboard.aspx?t=a0M" class="subNav-tab">
                        <span style="display: inline-block; width: 75px;">报表</span>
                    </a>-->
                </div>                  
            </div>
            
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class=" sidebarCell sidebarCollapsible  " id="sidebarCell">
                        <div style="margin:2px;">
                            <h3>流程分类</h3>
                        </div>
                         
                       <input id="gridId" type="hidden" value="<%=Request["gridId"]%>" name="gridId">
                        <div class='treeNode' id="treeRootNode" style="width: 200px;">
                        </div>
                        <script type="text/javascript">

                            //jQuery.on
                            //Ext.onReady(function () {
                            jQuery(document).ready(function () {
                                // shorthand
                                var treeHeight = getClientHeight();
                                treeHeight = treeHeight - 110 - 80 - 20 - 28;
                                jQuery("#treeRootNode").height(treeHeight);

                                var Tree = Ext.tree;
                                //debugger
                                var tree = new Tree.TreePanel({
                                    rootVisible: !1, autoScroll: !0,
                                    autoScroll: true,
                                    /*useArrows: true,*/
                                    animate: true,
                                    enableDD: true,
                                    containerScroll: true,
                                    border: true,
                                    /*autoheight: true,*/
                                    height: treeHeight,
                                    // auto create TreeLoader
                                    dataUrl: '/WFPageProcessor.ashx?cmd=workflow.gettree',
                                    root: {
                                        nodeType: 'async',
                                        text: '流程分类',
                                        draggable: false,
                                        id: 'src'
                                    },
                                    listeners : {
                                        click : function(node, c) {// 单击节点事件(node是节点对象)
                                            if(!node.isLeaf()){//不是叶子节点
                                                node.singleClickExpand = true;//提供单击属性
                                                if (node.isExpanded()) {   
                                                    node.collapse(true);//闭合该节点
                                                }else {
                                                    node.expand(node);//展开该节点
                                                }
                                            }else{//是叶子节点
                                                //Ext.getCmp('**id').ByTypeCodeFn(node.id);// 调用按类型查询的方法 
                                            }
                                        }
                                    }
                                });

                                tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
                                // render the tree
                                tree.render('treeRootNode');
                                tree.getRootNode().expand();
                                $('.x-tree-node').click(function () {
                                    console.log(123)
                                    $(this).find('.x-tree-node-ct').toggle()
                                })

                            });
                            function treeSelectionChange(a, b) {
                                var folderId = a.selNode.id;
                               
                                if (folderId == "000")
                                    folderId="";
                                var extSrch = "";
                                extSrch += "\nProcessId\teq\t" + folderId;
                                //如果选择的是流程
                                if (a.selNode.leaf)
                                    document.getElementById("processId").value = folderId;
                                else
                                    return;

                                window.sfdcPage.filterResults(null, '', '/_ui/workflow/wfinstance/ManageInstancesListServlet?filterType=122&filterState=instance_all&filterId=CBC8869A-92D5-4CEC-BB6D-1DC87A71A52C', 'noh=1', 'PricebookEntry', 0, extSrch);
                            }
                            function reHandleTask(instanceId, ruleLogId) {
                                var a = '确认要收回重办当前吗？';
                                if (Modal.confirm(a)) {
                                    //var d = {"instanceId":instanceId};
                                    //ajaxMethodPostData("wf.runtime.rehandle", d, function r() {
                                    //    ListViewport.instances['lineItemView'].refreshList();
                                    //});
                                    if (!ruleLogId)
                                        ruleLogId = "";
                                    var url = "/WFPageProcessor.ashx?cmd=wf.runtime.rehandle&instanceId=" + instanceId + "&ruleLogId=" + ruleLogId;
                                    //url += queryString;
                                    jQuery.ajax({
                                        async: false, cache: false, dataType: "json",
                                        // data: d,
                                        error: function (request, textStatus, errorThrown) {
                                            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                                        },
                                        success: function (data, textStatus) {
                                            ListViewport.instances['lineItemView'].refreshList();
                                            //if (callback)
                                            //    callback(data);
                                        },
                                        type: "POST",
                                        url: url
                                    });
                                }
                            }
                            function reloadPage() {
                                var extSrch = "";
                                window.sfdcPage.filterResults(null, '', '/_ui/workflow/wfinstance/ManageInstancesListServlet?filterType=122&filterState=instance_all&filterId=CBC8869A-92D5-4CEC-BB6D-1DC87A71A52C', 'noh=1', 'PricebookEntry', 0, extSrch);
                            }
                        </script>
                    </td>
                    <td id="bodyCell" class="oRight">
                        <!-- Start page content -->
                        <style>
                            .searchPanel{
                                border-radius: .25rem;
                                margin:0px;
                                padding:0px;
                                /*background-color:#f2f2f2;*/
                            }

                        </style>
                        <form action="/_ui/busop/orderitem/MultiOrderItemEdit" id="editPage" method="post"
                            name="editPage" onsubmit="if (window.ffInAlert) { return false; }" target="">
                            <input id="lookup" type="hidden" value="" name="lookup">
                            <input id="objectTypeCode" type="hidden" value="123" name="objectTypeCode">
                          
                        
                            <div id="lineItemView_searchHeader" class="searchPanel searchFilterFieldsHolder searchFilterFieldsHolderFirst">
                                <table class="searchFilterFields" style="margin: 0px; padding: 0px;text-align:left;">
                                    <tr valign="middle">
                                        <td>
                                            <span class="inputTitle" style="display:inline-block;">名称</span>
                                            <br />
                                            <div style="display:block;">
                                            <input autofocus="autofocus" id="search" maxlength="255" name="search" onkeypress="window.sfdcPage.handleKeyPress(event,'PricebookEntry', this)"
                                                size="20" title="搜索" type="text" value="" class="" />
                                            </div>
                                            <span>&nbsp</span>

                                        </td>
                                        <td>
                                            创建时间 从<span class="dateInput dateOnlyInput">
                                                <input id="srt_createdon" name="srt_createdon" onblur="if(!isDate(this.value)) { this.value=''; }" searchcolumn="true" datafield="createdon" dataope="ge" onfocus="DatePicker.pickDate(false, 'srt_createdon', false);" size="15" tabindex="2" type="text" value="">
                                                  </span>
                                            至<span class="dateInput dateOnlyInput"><input id="end_createdon" name="end_createdon" onblur="if(!isDate(this.value)) { this.value=''; }" searchcolumn="true" datafield="createdon" dataope="le" onfocus="DatePicker.pickDate(false, 'end_createdon', false);" size="15" tabindex="3" type="text" value="" data-uidsfdc="15"></span>
                                        </td>
                                        <td>紧急度:
                                            <select id="Priority" name="Priority" searchcolumn="true" datafield="Priority" dataope="eq" tabindex="4">
                                                  <option value="">--选择--</option>
                                                  <option value="0">一般</option>
                                                 <option value="1">紧急</option>
                                                 <option value="2">加急</option>
                                            </select>
                                        </td>
                                        <td>
                                            <div style="float:right;">
                                            
                                            <div style="display:inline-block;">
                                                 <input id="processId" value="" name="processId" type="hidden" searchcolumn="true" datafield="processId" dataope="eq"/>
                                            <input value=" 搜索 " class="btn" id="save_filter_PricebookEntry" name="searchButton"
                                                    onclick="window.sfdcPage.filterResults(null, '/_ui/busop/orderitem/SelectSearch?srtOrd=1&addTo=80190000000PJyk&offset=0', '/_ui/busop/orderitem/SelectSearch?srtOrd=1&isNFltr=1&addTo=80190000000PJyk&offset=0&relatedListId=PricebookEntry', 'noh=1', 'PricebookEntry', 5); return false"
                                                    title="搜索" type="button" />

                                                 <input  class="btn" id="btnExport" name="btnExport" value=" 导出 " title="导出" type="button" onclick="" />
                                            </div>
                                            </div>
                                        </td>
                                    </tr>                                    
                                </table>
                            </div>
                            <script src="/static/111213/js/picklist.js"></script>
                            <script>
                                <%=InitJson%>
                            </script>
                            <div class="individualPalette listViewportWrapper" id="lineItemView_wrapper">
                                <div class="listViewport opportunityBlock" id="lineItemView_listViewport">
                                    <form action="" id="lineItemView_actionForm" method="POST" name="lineItemView_actionForm"
                                        onsubmit="return ListViewport.instances['lineItemView'].verify('请至少选择一行')">
                                        <input type="hidden" id="lineItemView_pageState" name="lineItemView_pageState" value="" /><input
                                            type="hidden" id="lineItemView_rolodexState" name="lineItemView_rolodexState"
                                            value="" /><div class="topNav primaryPalette" id="lineItemView_topNav" style="display: none">
                                                <div class="controls">
                                                    <h2 class="title"></h2>
                                                    <span class="divisionLabel" id="lineItemView_divisionLabel"></span>
                                                    <div class="topNavTab" id="lineItemView_topNavTab">
                                                    </div>
                                                    <div class="clearingBox">
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="subNav" id="lineItemView_subNav">
                                            <div class="linkBar brandSecondaryBrd">
                                                <div class="listButtons" id="lineItemView_listButtons">
                                                </div>
                                                <div class="clearFilter" id="lineItemView_clearFilter">
                                                </div>
                                                <div class="rolodex" id="lineItemView_rolodex" style="visibility: hidden">
                                                    <a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A0%7D%29"
                                                        class="listItem"><span class="listItemPad">A</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A1%7D%29"
                                                            class="listItem"><span class="listItemPad">B</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A2%7D%29"
                                                                class="listItem"><span class="listItemPad">C</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A3%7D%29"
                                                                    class="listItem"><span class="listItemPad">D</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A4%7D%29"
                                                                        class="listItem"><span class="listItemPad">E</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A5%7D%29"
                                                                            class="listItem"><span class="listItemPad">F</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A6%7D%29"
                                                                                class="listItem"><span class="listItemPad">G</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A7%7D%29"
                                                                                    class="listItem"><span class="listItemPad">H</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A8%7D%29"
                                                                                        class="listItem"><span class="listItemPad">I</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A9%7D%29"
                                                                                            class="listItem"><span class="listItemPad">J</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A10%7D%29"
                                                                                                class="listItem"><span class="listItemPad">K</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A11%7D%29"
                                                                                                    class="listItem"><span class="listItemPad">L</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A12%7D%29"
                                                                                                        class="listItem"><span class="listItemPad">M</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A13%7D%29"
                                                                                                            class="listItem"><span class="listItemPad">N</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A14%7D%29"
                                                                                                                class="listItem"><span class="listItemPad">O</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A15%7D%29"
                                                                                                                    class="listItem"><span class="listItemPad">P</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A16%7D%29"
                                                                                                                        class="listItem"><span class="listItemPad">Q</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A17%7D%29"
                                                                                                                            class="listItem"><span class="listItemPad">R</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A18%7D%29"
                                                                                                                                class="listItem"><span class="listItemPad">S</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A19%7D%29"
                                                                                                                                    class="listItem"><span class="listItemPad">T</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A20%7D%29"
                                                                                                                                        class="listItem"><span class="listItemPad">U</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A21%7D%29"
                                                                                                                                            class="listItem"><span class="listItemPad">V</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A22%7D%29"
                                                                                                                                                class="listItem"><span class="listItemPad">W</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A23%7D%29"
                                                                                                                                                    class="listItem"><span class="listItemPad">X</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A24%7D%29"
                                                                                                                                                        class="listItem"><span class="listItemPad">Y</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A25%7D%29"
                                                                                                                                                            class="listItem"><span class="listItemPad">Z</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:26})"
                                                                                                                                                                class="listItem"><span class="listItemPad">其他</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:-1})"
                                                                                                                                                                    class="listItem listItemLast"><span class="listItemPad">全部</span></a>
                                                </div>
                                                <div class="clearingBox">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="listBody" id="lineItemView_listBody">
                                            <div class="exception" id="lineItemView_exception">
                                            </div>
                                        </div>
                                        <div class="offPageIds" id="lineItemView_offPageIds">
                                        </div>
                                    </form>
                                    <div class="bottomNav" id="lineItemView_bottomNav">
                                        正在加载...
                                    </div>
                                </div>
                                <div class="feedContainer" id="lineItemView_feedContainer" style="display: none">
                                    <div class="feedBody" id="lineItemView_feedBody">
                                    </div>
                                </div>
                            </div>
                        </form>

                        <script type="text/javascript">
                             //var grid1 = getQueryString("gridid");
                             var grid1 = document.getElementById("gridId").value;
                             jQuery("#" + grid1).addClass("subNav-tab-active");
                        </script>
                         <script type="text/javascript">
                             ajaxMethodData("wf.instance.stat", null, function (data) {
                                 $("#draftQty").html(data.draftQty);
                                 $("#waitingTaskQty").html(data.waitingTaskQty);
                                 $("#instanceQty").html(data.instanceQty);
                                 $("#readQty").html(data.readQty);
                                 $("#cancelledQty").html(data.cancelledQty);
                             });
                        </script>
                        <!-- Body events -->
                        <script type="text/javascript">
                            function bodyOnLoad() {
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQxTkROYSx4c3dtLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&isAjaxRequest=1&renderMode=RETRO&nocache=1437552855562'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQyT1RSYSw2cDlmLE1HVXdaalF3"; };
                            } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();"
                                    onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                    onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker"
                                        name="calMonthPicker" title="月"><option value="0">一月</option>
                                        <option value="1">二月</option>
                                        <option value="2">三月</option>
                                        <option value="3">四月</option>
                                        <option value="4">五月</option>
                                        <option value="5">六月</option>
                                        <option value="6">七月</option>
                                        <option value="7">八月</option>
                                        <option value="8">九月</option>
                                        <option value="9">十月</option>
                                        <option value="10">十一月</option>
                                        <option value="11">十二月</option>
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';"
                                        onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';"
                                        onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';"
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                        </select>
                            </div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">今天</a>
                                </div>
                            </div>
                        </div>
                        
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
    <script>
        $(function () {
            $('#btnExport').click(function () {
                var search = $('#search').val()
                var data = {
                    search: search,
                    filterQuery: getFilterCondition()
                }
                console.log(data)
                var gridid = getQueryString('gridid')
                if (gridid == 'closedwfrulelog') {
                    openWindowWithPost('/apps/CommandProcessor.ashx?c=1&cmd=process.instance.waitingtask.export', data)

                } 
            })
        })
        
    </script>
</html>
<!-- page generation time: 187ms -->



