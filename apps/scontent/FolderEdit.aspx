<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FolderEdit.aspx.cs" Inherits="WebClient.apps.scontent.FolderEdit" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>文件夹:<%=FolderName%>   ~ - Developer Edition</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css">
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; } //]]&gt;</script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script>        window.sfdcPage = new EditPage(null);
        UserContext.initialize({ "networkId": "", "labelLastModified": "1421084164000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-1-20 上午8:32", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": true }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Custom32';</script>
    <script>
        /*   try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420446347000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }
        */</script>
    <link href="https://ap1..com/favicon.ico" rel="shortcut icon">
    <script src="/jslibrary/sfdc/Security.js"></script>
       <script src="/js/Business.js" type="text/javascript"></script>
      <link class="user" href="/CSS/email.css" rel="stylesheet" type="text/css" />
    <script>        //   ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '118.186.239.71', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fa00%2Fe%3FretURL%3D%252Fa00%252Fo');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab  editPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
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
                    <td id="bodyCell" class="oRight">
                        <a name="skiplink">
                            <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img title="" class="pageTitleIcon" alt="" src="/s.gif"><h1 class="pageType noSecondHeader">
                                                编辑文件夹：<%=FolderName%></h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                                <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="bDescription">
                            <!--
                            注意：模板必须“可供使用”。-->
                        </div>
                        <script type="text/javascript">
                            function clearLookupFieldValue(b,c)
                            {
                                document.getElementById(b).value = "";
                                document.getElementById(c).value = "";
                            }
                            function peopleLookupPick(a, b, c, d, e, f, g, k) {
                                //document.getElementById(b).value = e;
                                //document.getElementById(c).value = f;
                                
                                var orgNames = document.getElementById(b).value;
                                var orgIds = document.getElementById(c).value

                                var names = e;
                                var ids = f;
                                if (orgNames != "")
                                    names = orgNames + "," + e;
                                // else
                                //   names = e;
                                if (orgIds != "")
                                    ids = orgIds + "," + f;
                                //else
                                //    ids = f;
                                document.getElementById(b).value = names;
                                document.getElementById(c).value = ids;
                            }
                            function toggleZhihui() {
                                if (document.getElementById("isPublic").checked == true)
                                    jQuery("#zhihuiContainer").hide();
                                else
                                    jQuery("#zhihuiContainer").show();
                            }
                            function addMembers() {
                                var objType = jQuery("#sharing_search").val();//类型
                                var entityId = jQuery("#id").val();
                                var obj = jQuery("#select3").val();
                                //alert(obj);
                                addContentAccess(entityId, objType, obj, 1, function A1() {
                                    window.location.reload();
                                });
                                //select3
                            }
                            //saveAllSelected([document.editPage.duel_reports_select_0, document.editPage.duel_reports_select_1], [document.editPage.duel_reports0, document.editPage.duel_reports1], ',', '\\', '--无--');
                            //saveAllSelected([ document.editPage.duel_sharedto_select_0, document.editPage.duel_sharedto_select_1 ], [ document.editPage.duel_sharedto0, document.editPage.duel_sharedto1 ], ',', '\\', '--无--');
                        </script>
                        <form onsubmit="javascript:if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }"
                        name="editPage" method="post" id="editPage" action="/00l/e">
                        <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                        <input type="hidden" value="" id="duel_reports0" name="duel_reports0" />
                        <input type="hidden" value="" id="duel_reports1" name="duel_reports1" />
                        <input type="hidden" value="" id="duel_sharedto0" name="duel_sharedto0" />
                        <input type="hidden" value="" id="duel_sharedto1" name="duel_sharedto1" />
                        <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                            <div class="pbHeader">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="pbTitle">
                                                <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                    文件夹编辑</h2>
                                            </td>
                                            <td id="topButtonRow" class="pbButton">
                                                <input type="submit" name="save" title="保存" class="primary btn" value=" 保存 ">
                                                <input value=" 保存并新建 " class="btn" title="保存并新建" name="save_new" type="submit" />   
                                                <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 ">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div style="display: none" id="errorDiv_ep" class="pbError">
                                    错误：无效数据。<br>
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div class="pbSubsection">
                                    <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                        <tbody>
                                            <tr class="detailRow">
                                                <td colspan="4">
                                                    &nbsp;
                                                </td>
                                            </tr>    <tr>
                                            <td class="labelCol requiredInput">
                                                <label for="Name">
                                                    <span class="requiredMark">*</span>类型</label>
                                            </td>
                                             <td class="data2Col" colspan="3">
                                                <div class="requiredInput">
                                                    <div class="requiredBlock">
                                                    </div> <input type="hidden" value="<%=objectTypeCodeId%>" id="objectTypeid" />
                                                    <select id="objectTypeCode" name="objectTypeCode">

                                                    </select>
                                                </div>
                                                 </td>
                                        </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="Name">
                                                        <span class="requiredMark">*</span>文件夹标签</label>
                                                </td>
                                                <td colspan="3" class="data2Col">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <input type="text" size="20" onblur="DeveloperNameInputElement.setName(this, document.getElementById('DeveloperName'), 'Folder');"
                                                            name="Name" maxlength="40" id="Name" value="<%=FolderName%>" /></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="Name">
                                                        <span class="requiredMark">*</span>父栏目</label>
                                                </td>
                                                <td colspan="3" class="data2Col">
                                                     <cc1:FolderSelector runat="server" id="folderPicker" />
                                                </td>
                                            </tr>
                                             <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="Name">
                                                        <span class="requiredMark">*</span>序号</label>
                                                </td>
                                                <td colspan="3" class="data2Col">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <input type="text" size="20"   name="sortNumber" maxlength="40" id="sortNumber" value="<%=SortNumber%>" /></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="last labelCol">
                                                    <label for="con19street">
                                                        描述</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <textarea wrap="soft" type="text" tabindex="22" rows="3" name="description" maxlength="255"
                                                        id="description" cols="27"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label>
                                                        审批发布</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                            <input type="checkbox" size="20" name="needCensor" id="needCensor" value="1" <%=NeedCensorHTML%> />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label>
                                                        打开评论</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                            <input type="checkbox" size="20" name="allowComment" id="allowComment" value="1"
                                                                <%=AllowCommentHTML%> />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="detailRow">
                                                <td colspan="4">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">
                                                     <label>
                                                        创建人:                                                   
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="hidden" id="pulishBy_lkid" name="pulishBy_lkid" value="<%=AllowCreatedIds%>" />
                                                    <input type="hidden" value="" id="pulishBy_lktp" name="pulishBy_lktp" />
                                                    <input type="hidden" value="" id="pulishBy_lkold" name="pulishBy_lkold" />
                                                    <input type="hidden" value="1" id="pulishBy_lspf" name="pulishBy_lspf" />
                                                    <input type="hidden" value="0" id="pulishBy_lspfsub" name="pulishBy_lspfsub" />
                                                    <input type="hidden" value="0" id="pulishBy_mod" name="pulishBy_mod" /><span class="lookupInput">
                                                        <textarea wrap="soft" type="text" title="创建人" rows="5" name="pulishBy" maxlength="2000"
                                                            id="pulishBy" cols="70"><%=AllowCreatedNames%></textarea>
                                                        <a href="javascript:openLookup('/_ui/common/data/PeoplePicker.aspx?lkfm=editPage&lknm=pulishBy&lktp=' + getElementByIdCS('pulishBy_lktp').value,760,'1','&lksrch=' + escapeUTF(getElementByIdCS('pulishBy').value.substring(0, 80)))"
                                                            tabindex="3" title="查找（创建人） （新窗口）">
                                                            <img src="/s.gif" alt="查找（创建人） （新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                                                onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                                onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                title="查找（创建人） （新窗口）" /></a> </span><a href="javascript:clearLookupFieldValue('pulishBy','pulishBy_lkid')" title="清除已选项"><img src="/img/ico_cancel_clear.png"  /></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">
                                                     <label>
                                                        审核人:                                                    
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="hidden" id="approveBy_lkid" name="approveBy_lkid" value="<%=AllowApprovedIds%>"/>
                                                    <input type="hidden" value="" id="approveBy_lktp" name="approveBy_lktp" />
                                                    <input type="hidden" value="" id="approveBy_lkold" name="approveBy_lkold" />
                                                    <input type="hidden" value="1" id="approveBy_lspf" name="approveBy_lspf" />
                                                    <input type="hidden" value="0" id="approveBy_lspfsub" name="approveBy_lspfsub" />
                                                    <input type="hidden" value="0" id="approveBy_mod" name="approveBy_mod" /><span class="lookupInput">
                                                        <textarea wrap="soft" type="text" title="审核人" rows="5" name="approveBy" maxlength="2000"
                                                            id="approveBy" cols="70"><%=AllowApprovedNames%></textarea>
                                                        <a href="javascript:openLookup('/_ui/common/data/PeoplePicker.aspx?lkfm=editPage&lknm=approveBy&lktp=' + getElementByIdCS('approveBy_lktp').value,760,'1','&lksrch=' + escapeUTF(getElementByIdCS('approveBy').value.substring(0, 80)))"
                                                            tabindex="3" title="查找（审核人） （新窗口）">
                                                            <img src="/s.gif" alt="查找（审核人） （新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                                                onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                                onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                title="查找（审核人） （新窗口）" /></a> </span><a href="javascript:clearLookupFieldValue('approveBy','approveBy_lkid')" title="清除已选项"><img src="/img/ico_cancel_clear.png"  title="清除已选项" alt="" /></a>
                                                </td>
                                            </tr>
                                            <tr class="detailRow">
                                                <td class="labelCol">浏览范围
                                                </td>
                                                <td>
                                                    <div>
                                                        <input type="checkbox" value="1" onclick="toggleZhihui();" name="isPublic" id="isPublic"
                                                            checked="checked" /><label for="isPublic">所有人可查看</label></div>
                                                </td>
                                            </tr>
                                            <tr style="display: none" id="zhihuiContainer">
                                                <td class="labelCol">                                                   
                                                        浏览人: 
                                                    <label>
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="hidden" id="readerRange_lkid" name="readerRange_lkid" value="<%=AllowReadIds%>"/>
                                                    <input type="hidden" value="" id="readerRange_lktp" name="readerRange_lktp" />
                                                    <input type="hidden" value="" id="readerRange_lkold" name="readerRange_lkold" />
                                                    <input type="hidden" value="1" id="readerRange_lspf" name="readerRange_lspf" />
                                                    <input type="hidden" value="0" id="readerRange_lspfsub" name="readerRange_lspfsub" />
                                                    <input type="hidden" value="0" id="readerRange_mod" name="readerRange_mod" /><span class="lookupInput">
                                                        <textarea wrap="soft" type="text" title="浏览人" rows="5" name="readerRange" maxlength="2000"
                                                            id="readerRange" cols="70"><%=AllowReadNames%></textarea>
                                                        <a href="javascript:openLookup('/_ui/common/data/PeoplePicker.aspx?lkfm=editPage&lknm=readerRange&lktp=' + getElementByIdCS('readerRange_lktp').value,760,'1','&lksrch=' + escapeUTF(getElementByIdCS('readerRange').value.substring(0, 80)))"
                                                            tabindex="3" title="查找（浏览人） （新窗口）">
                                                            <img src="/s.gif" alt="查找（浏览人） （新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                                                onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                                onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                title="查找（浏览人） （新窗口）" /></a> </span>
                                                </td>
                                            </tr>
                                            <!--
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label>
                                                        文件夹唯一名称</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <input type="text" size="20" name="DeveloperName" maxlength="40" id="DeveloperName"><div
                                                            tabindex="0" onmouseover="addMouseOver(this)" onfocus="addMouseOver(this)" class="mouseOverInfoOuter">
                                                            <img title="" class="infoIcon" alt="" src="/s.gif"><div style="display: none;" class="mouseOverInfo">
                                                                API 和受管软件包使用的唯一名称。名称必须以字母开头，仅使用字母数字字符和下划线。名称不能以下划线结尾或包含两条连续的下划线。</div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="empty labelCol last">
                                                    &nbsp;
                                                </td>
                                                <td class="empty dataCol last">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="IsReadonly">
                                                        <span class="requiredMark">*</span>公用文件夹访问权限</label>
                                                </td>
                                                <td colspan="3" class="data2Col">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <select name="IsReadonly" id="IsReadonly">
                                                            <option value="1">只读</option>
                                                            <option  selected="selected" value="0">读/写</option>
                                                        </select></div>
                                                </td>
                                            </tr>
                                            <tr class="detailRow">
                                                <td colspan="4">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol empty">
                                                    &nbsp;
                                                </td>
                                                <td colspan="3" class="data2Col">
                                                    <div id="duel_reports" class="duelingListBox">
                                                        <div style="display: none" id="editPage_duel_reports_errorMsg" class="errorMsg">
                                                            &nbsp;</div>
                                                        <table class="layout">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="selectCell">
                                                                        <div class="selectTitle">
                                                                            <label for="duel_reports_select_0">
                                                                                未归档公用电子邮件模板</label></div>
                                                                        <select size="14" name="duel_reports_select_0" multiple="multiple" id="duel_reports_select_0">
                                                                            <option value="00X90000001mYUh">Marketing: Product Inquiry Response</option>
                                                                            <option value="00X90000001mYUj">Sales: New Customer Email</option>
                                                                            <option value="00X90000001mYUc">SUPPORT: Self-Service New Comment Notification (SAMPLE)</option>
                                                                            <option value="00X90000001mYUk">SUPPORT: Self-Service New User Login Information (SAMPLE)</option>
                                                                            <option value="00X90000001mYUl">SUPPORT: Self-Service Reset Password (SAMPLE)</option>
                                                                            <option value="00X90000001mYUZ">Support: Case Assignment Notification</option>
                                                                            <option value="00X90000001mYUa">Support: Case Created (Phone Inquiries)</option>
                                                                            <option value="00X90000001mYUb">Support: Case Created (Web Inquiries)</option>
                                                                            <option value="00X90000001mYUi">Support: Case Response</option>
                                                                            <option value="00X90000001mYUg">Support: Escalated Case Notification</option>
                                                                            <option value="00X90000001mYUf">Support: Escalated Case Reassignment</option>
                                                                            <option value="00X90000001mYUe">Support: Self-Service New Login and Password</option>
                                                                            <option value="00X90000001mYUd">Support: Self-Service Reset Password</option>
                                                                            <option value="00X90000000kXIW">客户入口网站：新用户登录信息（示例）</option>
                                                                            <option value="00X90000000kXIY">客户入口网站：用户自助注册错误（示例）</option>
                                                                            <option value="00X90000000kXIX">客户入口网站：重置密码（示例）</option>
                                                                        </select>
                                                                    </td>
                                                                    <td class="zen-phs buttonCell">
                                                                        <div class="text">
                                                                            添加</div>
                                                                        <div class="zen-mbs text">
                                                                            <a id="duel_reports_select_0_right" href="javascript:if (!document.getElementById('duel_reports_select_0').disabled&& !document.getElementById('duel_reports_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_reports_select_0, document.editPage.duel_reports_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_reports_errorMsg');}">
                                                                                <img title="添加" class="rightArrowIcon" alt="添加" src="/s.gif"></a></div>
                                                                        <div class="text">
                                                                            <a id="duel_reports_select_0_left" href="javascript:if (!document.getElementById('duel_reports_select_0').disabled&& !document.getElementById('duel_reports_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_reports_select_1, document.editPage.duel_reports_select_0,'--无--', [],  [] ,'--无--',false,null,'editPage_duel_reports_errorMsg');}">
                                                                                <img title="删除" class="leftArrowIcon" alt="删除" src="/s.gif"></a></div>
                                                                        <div class="duelingText">
                                                                            删除</div>
                                                                    </td>
                                                                    <td class="selectCell">
                                                                        <div class="selectTitle">
                                                                            <label for="duel_reports_select_1">
                                                                                此文件夹中的电子邮件模板</label></div>
                                                                        <select size="14" name="duel_reports_select_1" multiple="multiple" id="duel_reports_select_1">
                                                                            <option value="">--无--</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <script>                                                            window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_reports_select_0', 'duel_reports_select_1'], 'editPage_duel_reports_errorMsg');</script>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="empty labelCol last">
                                                    &nbsp;
                                                </td>
                                                <td colspan="3" class="last data2Col">
                                                    <ul class="folderAccess">
                                                        <li>
                                                            <input type="radio" value="1" onclick="Sfdc.Dom.set(['duel_sharedto_select_0', 'duel_sharedto_select_1', 'p12'], 'disabled', true);"
                                                                name="AccessType" id="AccessType1" checked="checked" /><label for="AccessType1">所有用户均可访问此文件夹</label>
                                                            <script type="text/javascript">
                                                                document.getElementById("AccessType1").checked = true;
                                                            </script>
                                                        </li>
                                                        <li>
                                                                    <input type="radio" value="2" onclick="Sfdc.Dom.set(['duel_sharedto_select_0', 'duel_sharedto_select_1', 'p12'], 'disabled', true);"
                                                                        name="AccessType" id="AccessType2"><label for="AccessType2">所有用户均看不见此文件夹</label></li>
                                                        <li>
                                                            <div>
                                                                <input type="radio" value="0" onclick="Sfdc.Dom.set(['duel_sharedto_select_0', 'duel_sharedto_select_1', 'p12'], 'disabled', false);"
                                                                    name="AccessType" id="AccessType0" /><label for="AccessType0">只有下列用户可访问此文件夹：</label>
                                                                <div id="duel_sharedto" class="duelingListBox">
                                                                    <div style="display: none" id="editPage_duel_sharedto_errorMsg" class="errorMsg">
                                                                        &nbsp;</div>
                                                                    <div>
                                                                        <label for="p12">
                                                                            搜索：</label>&nbsp;<select title="小组类型" onchange="duel_sharedto_select_0Var.filter()"
                                                                                name="p12" id="p12">
                                                                                <option selected="" value="R">公用小组</option>
                                                                                <option value="A">角色</option>
                                                                               
                                                                                                    <option value="D">角色、内部和入口网站下属</option>
                                                                                                    <option value="I">角色和内部下属</option>
                                                                            </select>&nbsp;&nbsp;<label for="searchValue_p12">属于：</label>&nbsp;<input type="text"
                                                                                size="20" onpropertychange="duel_sharedto_select_0Var.handlePropertyChange();{Sfdc.Dom.set(['duel_sharedto_select_0', 'duel_sharedto_select_1', 'p12'], 'disabled', false);if (document.getElementById('AccessType0')) { document.getElementById('AccessType0').checked=true; }}"
                                                                                onkeydown="return duel_sharedto_select_0Var.handleKeyDown(event);" name="searchValue_p12"
                                                                                maxlength="80" id="searchValue_p12" />&nbsp;<input type="button" title="查找" onclick="duel_sharedto_select_0Var.doSearch();{Sfdc.Dom.set(['duel_sharedto_select_0', 'duel_sharedto_select_1', 'p12'], 'disabled', false);if (document.getElementById('AccessType0')) { document.getElementById('AccessType0').checked=true; }}"
                                                                                    name="go_duel_sharedto_select_0" id="go_duel_sharedto_select_0Var" class="btn"
                                                                                    value=" 查找 " /><br />
                                                                        <div id="error_duel_sharedto_select_0" class="errorMsg" style="visibility: hidden;">
                                                                        </div>
                                                                    </div>
                                                                    <table class="layout">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="selectCell">
                                                                                    <div class="selectTitle">
                                                                                        <label for="duel_sharedto_select_0">
                                                                                            可供共享</label></div>
                                                                                    <select size="14" name="duel_sharedto_select_0" multiple="multiple" id="duel_sharedto_select_0">
                                                                                    </select>
                                                                                </td>
                                                                                <td class="zen-phs buttonCell">
                                                                                    <div class="text">
                                                                                        添加</div>
                                                                                    <div class="zen-mbs text">
                                                                                        <a id="duel_sharedto_select_0_right" href="javascript:if (!document.getElementById('duel_sharedto_select_0').disabled&& !document.getElementById('duel_sharedto_select_1').disabled) {duel_sharedto_select_0Var.beforeMoveRight();;window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_sharedto_select_0, document.editPage.duel_sharedto_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_sharedto_errorMsg');}">
                                                                                            <img title="添加" class="rightArrowIcon" alt="添加" src="/s.gif"></a></div>
                                                                                    <div class="text">
                                                                                        <a id="duel_sharedto_select_0_left" href="javascript:if (!document.getElementById('duel_sharedto_select_0').disabled&& !document.getElementById('duel_sharedto_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_sharedto_select_1, document.editPage.duel_sharedto_select_0,'--无--', [], null,'--无--',false,null,'editPage_duel_sharedto_errorMsg');duel_sharedto_select_0Var.moveLeft();}">
                                                                                            <img title="删除" class="leftArrowIcon" alt="删除" src="/s.gif"></a></div>
                                                                                    <div class="duelingText">
                                                                                        删除</div>
                                                                                </td>
                                                                                <td class="selectCell">
                                                                                    <div class="selectTitle">
                                                                                        <label for="duel_sharedto_select_1">
                                                                                            共享用户</label></div>
                                                                                    <select size="14" name="duel_sharedto_select_1" multiple="multiple" id="duel_sharedto_select_1">
                                                                                        <option value="">--无--</option>
                                                                                    </select>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <script>                                                                        window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_sharedto_select_0', 'duel_sharedto_select_1'], 'editPage_duel_sharedto_errorMsg');</script>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>-->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="pbBottomButtons">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="pbTitle">
                                                <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif">&nbsp;
                                            </td>
                                            <td id="bottomButtonRow" class="pbButtonb">
                                                <input type="submit" name="save" title="保存" class="primary btn" value=" 保存 ">
                                                <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 ">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script>                            if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "save_new", "cancel"]); }</script>
                        </form>
                             <div id="addMemberContainer" style="display:none">
                                <table>
                                    <tr>
                                        <td>
                                            <select id="select3" class=" hidden" multiple="multiple" name="select3[]">
                                            </select></td>
                                        <td>
                                            <input type="button" value="添加" onclick="addMembers()" class="btn" />
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#select3").fcbkcomplete({
                                                        //$("#select3").fcbkcomplete({
                                                        json_url: "/apps/CommandProcessor.ashx?cmd=email.user.searchusers",
                                                        complete_text: "请录入 用户姓名，用户名，角色名，小组名，科室名称...",
                                                        addontab: true,
                                                        maxitems: 8,
                                                        height: 8,
                                                        cache: true
                                                    });
                                                });

                                                var folderId = jQuery("#id").val();
                                               
                                                if (folderId)
                                                {
                                                    //alert(folderId);
                                                    jQuery("#RelatedActivityMemberList").show();
                                                    jQuery("#addMemberContainer").show();
                                                    //document.getElementById("RelatedActivityAttachmentList").style.display = "none";
                                                }
                                            </script>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div id="RelatedActivityMemberList" class="bRelatedList first" style="display: block">
                                <a name="RelatedActivityAttachmentList_target"></a>
                                <!-- Begin ListElement -->
                              
                                <script src="/js/jquery/jquery.fcbkcomplete.js" type="text/javascript"></script>
                                <!-- motif: Event -->

                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img width="12" height="1" title="" style="margin-right: 0.25em;" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3 id="RelatedMemberList_title">管理与查看人员</h3>
                                                        </td>
                                                        <td class="pbButton"></td>
                                                        <td class="pbHelp">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="RelatedActivityAttachmentList_body" class="pbBody">
                                            <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                <tbody>
                                                    <!--
                                                    <tr class="headerRow">
                                                        <th class="noRowsHeader" scope="col">没有可显示的记录</th>
                                                    </tr>-->
                                                    <tr class="headerRow">
                                                        <th class="actionColumn" scope="col">操作</th>
                                                        <th scope="col" class=" zen-deemphasize">类型</th>
                                                        <th scope="col" class=" zen-deemphasize">名称</th>
                                                        <th scope="col" class=" zen-deemphasize">权限<div id="sharingPermissionsHelpText" class="mouseOverInfoOuter" onfocus="addMouseOver(this)" onmouseover="addMouseOver(this)">
                                                            <img class="infoIcon" src="/s.gif" alt="" title="">
                                                            <div class="mouseOverInfo" style="display: none; opacity: -0.2; left: 16px; bottom: -25px;">
                                                            </div>
                                                        </th>
                                                    </tr>
                                                    <%=MembersHTML%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav"></div>
                                <script>                                    //try { sfdcPage.registerRelatedList('RelatedActivityAttachmentList', '0', '管理与查看人员', false, '/00U/e?retURL=%2Fhome%2Fhome.jsp', 'retURL=%2Fhome%2Fhome.jsp&amp;relatedListId=RelatedActivityAttachmentList&amp;hideDL=1&amp;noh=1&amp;keepPref=1', false, false, true, 'RelatedActivityAttachmentList'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                        <script type="text/javascript">
                            var d = { entity: "itemCategory" }
                            ajaxMethodPOSTData("tree.get", d, callback);
                            function callback(data)
                            {
                                //debugger
                                for (var i = 0; i < data.rows.length; i++) {
                                    if($("#objectTypeid").val()==data.rows[i].id)
                                    {
                                        $("#objectTypeCode").append('<option value="'+data.rows[i].id+'" selected>'+data.rows[i].text+'</option>'); 
                                    }
                                    $("#objectTypeCode").append('<option value="'+data.rows[i].id+'">'+data.rows[i].text+'</option>'); 
                                }
                            }
                            /*
                            var duel_sharedto_select_0Var = new SelectFilterElement("p12", "R", "duel_sharedto_select_0", "", "duel_sharedto_select_1", 100, true, null);
                            var existingSelduel_sharedto_select_0 = document.getElementById('duel_sharedto_select_1');
                            duel_sharedto_select_0Var.addOptions(false, [['R', '小组：开发一组组', 'R:00G90000001c3rI', '开发一组组', existingSelduel_sharedto_select_0, ''], ['R', '所有内部用户', 'R:00G90000002JvmL', '所有内部用户', existingSelduel_sharedto_select_0, ''], ['R', '所有客户入口网站用户', 'R:00G90000001dC8o', '所有客户入口网站用户', existingSelduel_sharedto_select_0, ''], ['A', '角色：CEO', 'A:00G90000002JvmM', 'ceo', existingSelduel_sharedto_select_0, ''], ['A', '角色：CFO', 'A:00G90000002Jvma', 'cfo', existingSelduel_sharedto_select_0, ''], ['A', '角色：COO', 'A:00G90000002Jvmu', 'coo', existingSelduel_sharedto_select_0, ''], ['A', '角色：Channel Sales Team', 'A:00G90000002Jvmg', 'channel sales team', existingSelduel_sharedto_select_0, ''], ['A', '角色：Customer Support, International', 'A:00G90000002Jvmo', 'customer support, international', existingSelduel_sharedto_select_0, ''], ['A', '角色：Customer Support, North America', 'A:00G90000002Jvme', 'customer support, north america', existingSelduel_sharedto_select_0, ''], ['A', '角色：Director, Channel Sales', 'A:00G90000002JvmY', 'director, channel sales', existingSelduel_sharedto_select_0, ''], ['A', '角色：Director, Direct Sales', 'A:00G90000002JvmS', 'director, direct sales', existingSelduel_sharedto_select_0, ''], ['A', '角色：Eastern Sales Team', 'A:00G90000002Jvmm', 'eastern sales team', existingSelduel_sharedto_select_0, ''], ['A', '角色：Installation & Repair Services', 'A:00G90000002Jvmk', 'installation & repair services', existingSelduel_sharedto_select_0, ''], ['A', '角色：Marketing Team', 'A:00G90000002Jvmi', 'marketing team', existingSelduel_sharedto_select_0, ''], ['A', '角色：SVP, Customer Service & Support', 'A:00G90000002JvmW', 'svp, customer service & support', existingSelduel_sharedto_select_0, ''], ['A', '角色：SVP, Human Resources', 'A:00G90000002Jvms', 'svp, human resources', existingSelduel_sharedto_select_0, ''], ['A', '角色：SVP, Sales & Marketing', 'A:00G90000002JvmO', 'svp, sales & marketing', existingSelduel_sharedto_select_0, ''], ['A', '角色：VP, International Sales', 'A:00G90000002Jvmq', 'vp, international sales', existingSelduel_sharedto_select_0, ''], ['A', '角色：VP, Marketing', 'A:00G90000002JvmU', 'vp, marketing', existingSelduel_sharedto_select_0, ''], ['A', '角色：VP, North American Sales', 'A:00G90000002JvmQ', 'vp, north american sales', existingSelduel_sharedto_select_0, ''], ['A', '角色：Western Sales Team', 'A:00G90000002Jvmc', 'western sales team', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：CEO', 'D:00G90000002JvmN', 'ceo', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：CFO', 'D:00G90000002Jvmb', 'cfo', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：COO', 'D:00G90000002Jvmv', 'coo', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Channel Sales Team', 'D:00G90000002Jvmh', 'channel sales team', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Customer Support, International', 'D:00G90000002Jvmp', 'customer support, international', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Customer Support, North America', 'D:00G90000002Jvmf', 'customer support, north america', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Director, Channel Sales', 'D:00G90000002JvmZ', 'director, channel sales', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Director, Direct Sales', 'D:00G90000002JvmT', 'director, direct sales', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Eastern Sales Team', 'D:00G90000002Jvmn', 'eastern sales team', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Installation & Repair Services', 'D:00G90000002Jvml', 'installation & repair services', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Marketing Team', 'D:00G90000002Jvmj', 'marketing team', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Customer Service & Support', 'D:00G90000002JvmX', 'svp, customer service & support', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Human Resources', 'D:00G90000002Jvmt', 'svp, human resources', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Sales & Marketing', 'D:00G90000002JvmP', 'svp, sales & marketing', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：VP, International Sales', 'D:00G90000002Jvmr', 'vp, international sales', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：VP, Marketing', 'D:00G90000002JvmV', 'vp, marketing', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：VP, North American Sales', 'D:00G90000002JvmR', 'vp, north american sales', existingSelduel_sharedto_select_0, ''], ['D', '角色、内部和入口网站下属：Western Sales Team', 'D:00G90000002Jvmd', 'western sales team', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：CEO', 'I:00G90000001dC8z', 'ceo', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：CFO', 'I:00G90000001dC96', 'cfo', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：COO', 'I:00G90000001dC8s', 'coo', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Channel Sales Team', 'I:00G90000001dC93', 'channel sales team', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Customer Support, International', 'I:00G90000001dC8v', 'customer support, international', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Customer Support, North America', 'I:00G90000001dC8r', 'customer support, north america', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Director, Channel Sales', 'I:00G90000001dC8y', 'director, channel sales', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Director, Direct Sales', 'I:00G90000001dC92', 'director, direct sales', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Eastern Sales Team', 'I:00G90000001dC95', 'eastern sales team', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Installation & Repair Services', 'I:00G90000001dC8u', 'installation & repair services', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Marketing Team', 'I:00G90000001dC8w', 'marketing team', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：SVP, Customer Service & Support', 'I:00G90000001dC90', 'svp, customer service & support', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：SVP, Human Resources', 'I:00G90000001dC8t', 'svp, human resources', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：SVP, Sales & Marketing', 'I:00G90000001dC94', 'svp, sales & marketing', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：VP, International Sales', 'I:00G90000001dC8x', 'vp, international sales', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：VP, Marketing', 'I:00G90000001dC8q', 'vp, marketing', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：VP, North American Sales', 'I:00G90000001dC8p', 'vp, north american sales', existingSelduel_sharedto_select_0, ''], ['I', '角色和内部下属：Western Sales Team', 'I:00G90000001dC91', 'western sales team', existingSelduel_sharedto_select_0, '']]);
                            duel_sharedto_select_0Var.addOptions(false, [<%=AvailableOptions%>]);
                            if (existingSelduel_sharedto_select_0.options.length == 0) {
                            existingSelduel_sharedto_select_0.options[0] = new Option('--无--', '');
                            }
                            */
                        </script>
                        <!-- Body events -->
                        <!-- if ((typeof duel_sharedto_select_0Var != 'undefined') && (typeof duel_sharedto_select_0Var.init != 'undefined')) { duel_sharedto_select_0Var.init(); }; Sfdc.Dom.set(['duel_sharedto_select_0', 'duel_sharedto_select_1', 'p12'], 'disabled', true);-->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
<!-- page generation time: 115ms -->
