<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inviteAddMtgItem.aspx.cs" Inherits="WebClient.apps.meetings.inviteAddMtgItem" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <title>邀请添加议题：<%=AddToTitle%></title>
    <script src="/static/111213/js/perf/stub.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/zh_CN.js" type="text/javascript"></script>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/setup.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>        window.sfdcPage = new ApexDetailPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1427926072000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-4-7 下午9:47", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif homeTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div
        id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td id="bodyCell" class="oRight"><a name="skiplink">
                        <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img title="" class="pageTitleIcon" alt="" src="/s.gif"><h1 class="pageType">邀请添加议题<span class="titleSeparatingColon">:</span></h1>
                                    <h2 class="pageDescription">添加到：<%=AddToTitle%></h2>
                                    <div class="blank">&nbsp;</div>
                                </div>
                                <div class="links"></div>
                            </div>
                            <div class="ptBreadcrumb"></div>
                        </div>
                        <form onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }" name="editPage" method="post" id="editPage" action="/ui/meeting/item/invitee">
                            <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <input type="hidden" value="" id="duel0" name="duel0"><input type="hidden" value="" id="duel1" name="duel1">
                            <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock bLayoutBlock secondaryPalette">
                                <div class="pbHeader">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td class="pbTitle">
                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">添加到</h2>
                                                </td>
                                                <td id="topButtonRow" class="pbButton">
                                                    <input type="submit" title="保存" name="save" class="btn primary" value=" 保存 ">
                                                    <input type="submit" title="取消" name="cancel" class="btn" value=" 取消 "></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pbBody">
                                    <div style="display: none" id="errorDiv_ep" class="pbError">
                                        错误：无效数据。<br>
                                        请查看下列所有错误消息以纠正数据。
                                    </div>
                                    <div id="head_1_ep" class="brandTertiaryBgr first pbSubheader tertiaryPalette">
                                        <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter"><span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span class="requiredText"> = 必填信息</span></span></span><h3>选择目标用户、组、角色<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <script type="text/javascript">
                                            function searchUsers() {
                                                // debugger;
                                                var sel = document.getElementById("sharing_search");
                                                if (sel.value == "U") {
                                                    var srchText = jQuery("#searchValue_sharing_search").val();
                                                    searchAllUsers(fillUserList, srchText);
                                                }
                                                else {
                                                    duel_select_0Var.doSearch();
                                                    //duel_select_0Var.doSearch();
                                                }
                                            }
                                            function fillUserList(data) {
                                                var arrData = new Array();
                                                var allowAdded = true;
                                                var sele = document.getElementById("duel_select_0");
                                                jQuery('#duel_select_0').find('option').remove();
                                                var type = jQuery('#sharing_search').val();

                                                if (data) {
                                                    //debugger;
                                                    for (var i = 0; i < data.length; i++) {
                                                        var item = data[i];
                                                        sele.add(new Option('用户：' + item.name, type + ':' + item.id));
                                                        //['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, '']
                                                        if (allowAdded) {
                                                            var data2 = [type, '用户：' + item.name, type + ':' + item.id, item.name, existingSelduel_select_0, ''];
                                                            arrData[i] = data2;
                                                        }
                                                    }
                                                    //arrData += "]";
                                                    if (allowAdded) {
                                                        duel_select_0Var.addOptions(false, arrData);
                                                    }
                                                }
                                            }
                                        </script>
                                        <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                            <tbody>
                                                <!--
                                                <tr>
                                                    <td class="labelCol requiredInput">
                                                        <label for="p2"><span class="assistiveText">*</span>标签</label></td>
                                                    <td class="dataCol col02">
                                                        <div class="requiredInput">
                                                            <div class="requiredBlock"></div>
                                                            <input type="text" value="开发1组" size="20" name="p2" maxlength="40" id="p2"></div>
                                                    </td>
                                                    <td class="labelCol last empty">&nbsp;</td>
                                                    <td class="dataCol last empty">&nbsp;</td>
                                                </tr>-->
                                                <tr class="detailRow">                                                    
                                                    <td colspan="4">&nbsp;</td>
                                                </tr>
                                                <tr class="last detailRow">   
                                                    <td colspan="4">
                                                        <div id="duel" class="duelingListBox">
                                                            <div style="display: none" id="editPage_duel_errorMsg" class="errorMsg">&nbsp;</div>
                                                            <div>
                                                                <label for="sharing_search">搜索：</label>&nbsp;<select title="小组类型" onchange="duel_select_0Var.filter()" name="sharing_search" id="sharing_search">
                                                                    <option selected="" value="P">个人小组</option>
                                                                     <option  value="R">公用小组</option>
                                                                    <option value="U">用户</option>
                                                                    <option value="A">角色</option>                                                                   
                                                                    <!--
                                                                    <option value="D">角色、内部和入口网站下属</option>
                                                                    <option value="I">角色和内部下属</option>-->
                                                                </select>&nbsp;&nbsp;<label for="searchValue_sharing_search">属于：</label>&nbsp;<input type="text" size="20" onpropertychange="duel_select_0Var.handlePropertyChange();" onkeydown="return duel_select_0Var.handleKeyDown(event);" name="searchValue_sharing_search" maxlength="80" id="searchValue_sharing_search">&nbsp;<input type="button" title="查找" onclick="searchUsers();" name="go_duel_select_0" id="go_duel_select_0Var" class="btn" value=" 查找 "><br>
                                                                <div id="error_duel_select_0" class="errorMsg" style="visibility: hidden;"></div>
                                                            </div>
                                                            <table class="layout">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="selectCell">
                                                                            <div class="selectTitle">
                                                                                <label for="duel_select_0">可用成员</label>
                                                                            </div>
                                                                            <select size="14" name="duel_select_0" multiple="multiple" id="duel_select_0"  onclick="javascript:if (!document.getElementById('duel_select_0').disabled&& !document.getElementById('duel_select_1').disabled) {duel_select_0Var.beforeMoveRight();;window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');}">
                                                                            </select></td>
                                                                        <td class="zen-phs buttonCell">
                                                                            <div class="text">添加</div>
                                                                            <div class="zen-mbs text">
                                                                                <a id="duel_select_0_right" href="javascript:if (!document.getElementById('duel_select_0').disabled&amp;&amp; !document.getElementById('duel_select_1').disabled) {duel_select_0Var.beforeMoveRight();;window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');}">
                                                                                    <img title="添加" class="rightArrowIcon" alt="添加" src="/s.gif"></a>
                                                                            </div>
                                                                            <div class="text">
                                                                                <a id="duel_select_0_left" href="javascript:if (!document.getElementById('duel_select_0').disabled&amp;&amp; !document.getElementById('duel_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');duel_select_0Var.moveLeft();}">
                                                                                    <img title="删除" class="leftArrowIcon" alt="删除" src="/s.gif"></a>
                                                                            </div>
                                                                            <div class="duelingText">删除</div>
                                                                        </td>
                                                                        <td class="selectCell">
                                                                            <div class="selectTitle">
                                                                                <label for="duel_select_1">所选成员</label>
                                                                            </div>
                                                                            <select size="14" name="duel_select_1" multiple="multiple" id="duel_select_1"  onclick="getGroupRoleUsers()">
                                                                            </select></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <script>window.editPage_DLBEInstance=new DuelingListBoxesElement(['duel_select_0','duel_select_1'],'editPage_duel_errorMsg');</script>
                                                        </div>
                                                    </td>
                                                      <td align="left">
                                                        成员：<br />
                                                        <div style="height:300px;overflow:auto;border:1px solid #eaeaea; " id="membersContainer">

                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                          <script type="text/javascript">
                                              function getGroupRoleUser0(val) {
                                                  var seleValue = "";
                                                  //var sele = $("#duel_select_1 option:selected");
                                                  var i = 0;
                                                  $("#duel_select_0 option:selected").each(function () {
                                                      if (i > 0)
                                                          seleValue + ",";
                                                      seleValue += $(this).val(); //这里得到的就是
                                                      i++;
                                                  });
                                                  //alert(seleValue);
                                                  var d = { id: seleValue };
                                                  ajaxMethodData("group.user.getlist", d, function (data) {
                                                      var html1 = "";
                                                      for (var l = 0; l < data.listData.length; l++) {
                                                          var row = data.listData[l];
                                                          html1 += "<div>" + row.name + "</div>";
                                                      }
                                                      $("#membersContainer").html(html1);
                                                  });
                                              }
                                              function getGroupRoleUsers(val)
                                              {
                                                  var seleValue = "";
                                                  //var sele = $("#duel_select_1 option:selected");
                                                  var i = 0;
                                                  $("#duel_select_1 option:selected").each(function () {
                                                      if (i > 0)
                                                          seleValue + ",";
                                                      seleValue += $(this).val(); //这里得到的就是
                                                      i++;
                                                  });
                                                  //alert(seleValue);
                                                  var d = { id: seleValue };
                                                  ajaxMethodData("group.user.getlist", d, function (data) {
                                                      var html1 = "<ul>";
                                                      for (var l = 0; l < data.listData.length; l++)
                                                      {
                                                          var row = data.listData[l];
                                                          html1 += "<li>"+row.name+"</li>";
                                                      }
                                                      html1 += "</ul>";
                                                      $("#membersContainer").html(html1);
                                                  });
                                              
                                              }
                                        </script>
                                    <div class="pbSubheader brandTertiaryBgr first tertiaryPalette" id="head_2_ep">
                                        <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                            <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                class="requiredText"> </span></span></span><h3>通知内容<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="p6"><span class="requiredMark">*</span>主题</label></td>
                                                <td  class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock"></div>
                                                        <input type="text" size="70" name="p6" maxlength="100" id="p6" value="【会议通知】<%=AddToTitle%>"></div>
                                                </td>
                                                 <td class="labelCol  empty">&nbsp;</td>
                                                <td class="dataCol  empty">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="last labelCol">
                                                    <label for="con20">
                                                        <span class="requiredMark">*</span>
                                                        通知内容</label><div class="textCounterOuter">
                                                            <div class="textCounterMiddle">
                                                                <div id="con20_counter" class="textCounter">
                                                                    32000 剩余
                                                                </div>
                                                            </div>
                                                        </div>
                                                </td>
                                                <td colspan="3" class="last data2Col">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock"></div>
                                                        <textarea wrap="soft" type="text" tabindex="30" rows="6" onmousedown="handleTextAreaElementChangeWithByteCheck('con20', 32000, 0, '剩余', '超出极限');"
                                                            onkeyup="handleTextAreaElementChangeWithByteCheck('con20', 32000, 0, '剩余', '超出极限');"
                                                            onkeydown="handleTextAreaElementChangeWithByteCheck('con20', 32000, 0, '剩余', '超出极限');"
                                                            onclick="handleTextAreaElementChangeWithByteCheck('con20', 32000, 0, '剩余', '超出极限');"
                                                            onchange="handleTextAreaElementChangeWithByteCheck('con20', 32000, 0, '剩余', '超出极限');"
                                                            name="con20" maxlength="32000" id="con20" cols="75"><%=Message%></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="last detailRow">
                                                <td class="last labelCol">提醒方式</td>
                                                <td colspan='3'>
                                                    <input id="sendMail" name="sendMail" type="checkbox" value="1" checked="checked" /><label
                                                        for="sendMail">发送APP推送、即时系统消息</label>
                                                </td>
                                            </tr>
                                            <tr class="last detailRow" style="display:none;">
                                                <td></td>
                                                <td colspan='3'>
                                                    <input id="sendSms" name="sendSms" type="checkbox" value="1" /><label
                                                        for="sendMail">发送通知手机短信</label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="pbBottomButtons">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td class="pbTitle">
                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif">&nbsp;</td>
                                                <td id="bottomButtonRow" class="pbButtonb">
                                                    <input type="submit" title="保存" name="save" class="btn primary" value=" 保存 ">
                                                    <input type="submit" title="取消" name="cancel" class="btn" value=" 取消 "></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg"></div>
                                </div>
                            </div>
                            <script>if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save","cancel"]); }</script>
                            <script type="text/javascript">
                                var duel_select_0Var = new SelectFilterElement("sharing_search", "R", "duel_select_0", "", "duel_select_1", 100, true, null);
                                var existingSelduel_select_0 = document.getElementById('duel_select_1');
                                duel_select_0Var.addOptions(false, [<%=AvaliableOptions%>]);
                                //duel_select_0Var.addOptions(false,[['R', '小组：信息小组', 'R:00G90000002acYX', '信息小组', existingSelduel_select_0, ''],['R', '小组：开发一组组', 'R:00G90000001c3rI', '开发一组组', existingSelduel_select_0, ''],['R', '所有客户入口网站用户', 'R:00G90000001dC8o', '所有客户入口网站用户', existingSelduel_select_0, ''],['U', '用户：liu jack', 'U:0059000000390Wh', 'liu jack', existingSelduel_select_0, ''],['U', '用户：liu lan', 'U:005900000039oIN', 'liu lan', existingSelduel_select_0, ''],['U', '用户：璞', 'U:00590000003y68m', '璞', existingSelduel_select_0, ''],['U', '用户：站点来宾用户 公司网站', 'U:005900000039Sll', '站点来宾用户 公司网站', existingSelduel_select_0, ''],['A', '角色：CEO', 'A:00G90000002JvmM', 'ceo', existingSelduel_select_0, ''],['A', '角色：CFO', 'A:00G90000002Jvma', 'cfo', existingSelduel_select_0, ''],['A', '角色：COO', 'A:00G90000002Jvmu', 'coo', existingSelduel_select_0, ''],['A', '角色：Channel Sales Team', 'A:00G90000002Jvmg', 'channel sales team', existingSelduel_select_0, ''],['A', '角色：Customer Support, International', 'A:00G90000002Jvmo', 'customer support, international', existingSelduel_select_0, ''],['A', '角色：Customer Support, North America', 'A:00G90000002Jvme', 'customer support, north america', existingSelduel_select_0, ''],['A', '角色：Director, Channel Sales', 'A:00G90000002JvmY', 'director, channel sales', existingSelduel_select_0, ''],['A', '角色：Director, Direct Sales', 'A:00G90000002JvmS', 'director, direct sales', existingSelduel_select_0, ''],['A', '角色：Eastern Sales Team', 'A:00G90000002Jvmm', 'eastern sales team', existingSelduel_select_0, ''],['A', '角色：Installation &amp; Repair Services', 'A:00G90000002Jvmk', 'installation &amp; repair services', existingSelduel_select_0, ''],['A', '角色：Marketing Team', 'A:00G90000002Jvmi', 'marketing team', existingSelduel_select_0, ''],['A', '角色：SVP, Customer Service &amp; Support', 'A:00G90000002JvmW', 'svp, customer service &amp; support', existingSelduel_select_0, ''],['A', '角色：SVP, Human Resources', 'A:00G90000002Jvms', 'svp, human resources', existingSelduel_select_0, ''],['A', '角色：SVP, Sales &amp; Marketing', 'A:00G90000002JvmO', 'svp, sales &amp; marketing', existingSelduel_select_0, ''],['A', '角色：VP, International Sales', 'A:00G90000002Jvmq', 'vp, international sales', existingSelduel_select_0, ''],['A', '角色：VP, Marketing', 'A:00G90000002JvmU', 'vp, marketing', existingSelduel_select_0, ''],['A', '角色：VP, North American Sales', 'A:00G90000002JvmQ', 'vp, north american sales', existingSelduel_select_0, ''],['A', '角色：Western Sales Team', 'A:00G90000002Jvmc', 'western sales team', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：CEO', 'D:00G90000002JvmN', 'ceo', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：CFO', 'D:00G90000002Jvmb', 'cfo', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：COO', 'D:00G90000002Jvmv', 'coo', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Channel Sales Team', 'D:00G90000002Jvmh', 'channel sales team', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Customer Support, International', 'D:00G90000002Jvmp', 'customer support, international', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Customer Support, North America', 'D:00G90000002Jvmf', 'customer support, north america', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Director, Channel Sales', 'D:00G90000002JvmZ', 'director, channel sales', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Director, Direct Sales', 'D:00G90000002JvmT', 'director, direct sales', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Eastern Sales Team', 'D:00G90000002Jvmn', 'eastern sales team', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Installation &amp; Repair Services', 'D:00G90000002Jvml', 'installation &amp; repair services', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Marketing Team', 'D:00G90000002Jvmj', 'marketing team', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：SVP, Customer Service &amp; Support', 'D:00G90000002JvmX', 'svp, customer service &amp; support', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：SVP, Human Resources', 'D:00G90000002Jvmt', 'svp, human resources', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：SVP, Sales &amp; Marketing', 'D:00G90000002JvmP', 'svp, sales &amp; marketing', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：VP, International Sales', 'D:00G90000002Jvmr', 'vp, international sales', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：VP, Marketing', 'D:00G90000002JvmV', 'vp, marketing', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：VP, North American Sales', 'D:00G90000002JvmR', 'vp, north american sales', existingSelduel_select_0, ''],['D', '角色、内部和入口网站下属：Western Sales Team', 'D:00G90000002Jvmd', 'western sales team', existingSelduel_select_0, ''],['I', '角色和内部下属：CEO', 'I:00G90000001dC8z', 'ceo', existingSelduel_select_0, ''],['I', '角色和内部下属：CFO', 'I:00G90000001dC96', 'cfo', existingSelduel_select_0, ''],['I', '角色和内部下属：COO', 'I:00G90000001dC8s', 'coo', existingSelduel_select_0, ''],['I', '角色和内部下属：Channel Sales Team', 'I:00G90000001dC93', 'channel sales team', existingSelduel_select_0, ''],['I', '角色和内部下属：Customer Support, International', 'I:00G90000001dC8v', 'customer support, international', existingSelduel_select_0, ''],['I', '角色和内部下属：Customer Support, North America', 'I:00G90000001dC8r', 'customer support, north america', existingSelduel_select_0, ''],['I', '角色和内部下属：Director, Channel Sales', 'I:00G90000001dC8y', 'director, channel sales', existingSelduel_select_0, ''],['I', '角色和内部下属：Director, Direct Sales', 'I:00G90000001dC92', 'director, direct sales', existingSelduel_select_0, ''],['I', '角色和内部下属：Eastern Sales Team', 'I:00G90000001dC95', 'eastern sales team', existingSelduel_select_0, ''],['I', '角色和内部下属：Installation &amp; Repair Services', 'I:00G90000001dC8u', 'installation &amp; repair services', existingSelduel_select_0, ''],['I', '角色和内部下属：Marketing Team', 'I:00G90000001dC8w', 'marketing team', existingSelduel_select_0, ''],['I', '角色和内部下属：SVP, Customer Service &amp; Support', 'I:00G90000001dC90', 'svp, customer service &amp; support', existingSelduel_select_0, ''],['I', '角色和内部下属：SVP, Human Resources', 'I:00G90000001dC8t', 'svp, human resources', existingSelduel_select_0, ''],['I', '角色和内部下属：SVP, Sales &amp; Marketing', 'I:00G90000001dC94', 'svp, sales &amp; marketing', existingSelduel_select_0, ''],['I', '角色和内部下属：VP, International Sales', 'I:00G90000001dC8x', 'vp, international sales', existingSelduel_select_0, ''],['I', '角色和内部下属：VP, Marketing', 'I:00G90000001dC8q', 'vp, marketing', existingSelduel_select_0, ''],['I', '角色和内部下属：VP, North American Sales', 'I:00G90000001dC8p', 'vp, north american sales', existingSelduel_select_0, ''],['I', '角色和内部下属：Western Sales Team', 'I:00G90000001dC91', 'western sales team', existingSelduel_select_0, '']]);
                                if (existingSelduel_select_0.options.length == 0) { 
                                    existingSelduel_select_0.options[0] = new Option('--无--','');
                                }

                             </script>

                        </form>
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad(){if ((typeof duel_select_0Var != 'undefined') && (typeof duel_select_0Var.init != 'undefined')) { duel_select_0Var.init();};if (typeof(startSessionTimer)!='undefined') {startSessionTimer(); };if (typeof(ActivityReminder)!='undefined') {ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4Tmkwd01TMHdNMVF3Tnpvek1UbzBPUzR3TWpWYSxmVzloblAwejVIZ3lNUllvU2ItYjhVLFpXTmhaVEU1');};SetupTreeNode.prototype.initializeSetup();if ((window.sfdcPage) &amp;&amp; (sfdcPage.executeOnloadQueue)){sfdcPage.executeOnloadQueue();};if (typeof(ActivityReminder)!='undefined') {ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4Tmkwd01TMHdNMVF3Tnpvek1UbzBPUzR3TXpWYSxUR2JJaE4yQVFZSXpXMEQyR1dDVmZqLFpXTmhaVEU1');};; if (this.loadChatFrameJs) loadChatFrameJs();SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");new UnifiedSearchAutoCompleteElement("phSearchInput","/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet",1,{},false,null,"phSearchForm",["div","searchOwner","asPhrase","sen"],{},true,3,100);new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true);if(window.PreferenceBits){window.PreferenceBits.prototype.csrfToken="VmpFPSxNakF4Tmkwd01TMHdNMVF3Tnpvek1UbzBPUzR3TnpWYSw0TTllaTg1R3NCaGpqM2tYN1Jid3hhLE1HVXdaalF3";};}function bodyOnBeforeUnload(){if ((window.sfdcPage) &amp;&amp; (sfdcPage.executeOnBeforeUnloadQueue)){sfdcPage.executeOnBeforeUnloadQueue();};}function bodyOnFocus(){closePopupOnBodyFocus();}function bodyOnUnload(){}</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
<!-- page generation time: 124ms -->

