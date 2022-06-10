<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="WebClient._ui.core.chatter.files.detail" %>

<%@ Register Src="/UIControls/ZenPageHeader.ascx" TagName="FileMainNav" TagPrefix="uc1" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!doctype html>
<html class="ext-strict zen brandQuaternaryBgr" style="display: none !important;">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>文件：<%=FileName%> ~  - Developer Edition</title>
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zen-container.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zenifiedChatterPageBase.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterBreadcrumbs.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css">
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/ChatterFiles.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1413507464000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-10-23 上午10:30", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": false }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "ZEN", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'File';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413820402000/Theme3/zh/base/zen-container.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1412230112000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413771514000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413820402000/Theme3/zh/base/zenifiedChatterPageBase.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413820402000/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413820402000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413820402000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413820402000/Theme3/zh/base/chatterBreadcrumbs.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1413820402000/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //       ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '117.79.232.198', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F06990000001823J');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif fileTab  FileDetailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div class="zen-page" id="page">
        <div role="banner">
                <uc1:FileMainNav runat="server" ID="FileMainNav1" />
        </div>
        <div class="zen-bodyZen brdPalette brandPrimaryBrd">
            <div class="zen-bodyInner" id="bodyInner">
                <div class="zen-main" role="main">
                    <a name="skiplink">
                        <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                            title="内容在此开始" /></a><div class="mainContentHeader zen-mbm">
                                <ul class="zen-pipedList zen-end">
                                    <li class="zen-lastItem zen-firstItem"><span class="zen-media zen-mediaExt"><span
                                        class="zen-mediaBody"><a href="/_ui/core/chatter/files/FileTabPage"
                                            class="zen-deemphasize">« 返回列表</a><!--<a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                class="zen-imgExt" title="此页面的帮助 （新窗口）"><img src="/s.gif" alt="帮助" class="helpIcon"
                                                    title="帮助" /></a>--></span></span></li></ul>
                                <div class="zen-media">
                                    <img src="/s.gif" alt="文件" class="zen-mls zen-img pageTitleIcon" title="文件" /><div
                                        class="zen-mediaBody">
                                        <h1 class="zen-man">
                                            文件：<%=FileName%></h1>
                                    </div>
                                </div>
                                <div class="ptBreadcrumb">« <a id="backLink" href="/_ui/core/chatter/files/FileTabPage">返回列表</a>
                                </div>
                            </div>
                    <script>                        //         chatter.getToolbox().setToken('.Ay8XtWEdLPIHvEoByJf5G2Pvlg5H3ppRkZ1quuN6YasOkd30nbkOmcxGJFJBLkKCjPvKipZ4MsbbheTY5kv7SIMgCNqR2aQ7tsda.rCVxE7EgYV3VWJctHafHu9wyjkHpBaXwgjmcXCHl.ghgNV.KK80ao=');</script>
                    <div class="filesDetailPage">
                        <div class="threecolumn">
                            <div class="headerContent">
                                <div class="fileTailNode">
                                    <img src="/sfc/images/docicons/doctype_txt_32.png?v=188-1" alt="纯文本" class="fileDetailTitleIcon"
                                        height="32" title="纯文本" width="32" /><span class="fileTitleText fileTitle" id="fileTitle"
                                            title="<%=FileName%>"><%=FileName%></span><span class="sharedWithStatusBadge"><span class="sharingStatusIcon"><img
                                                src="/img/s.gif" alt="此文件是专有文件。已将其与其他任何人进行共享。" class="lockItemIcon" title="此文件是专有文件。已将其与其他任何人进行共享。" /></span><span
                                                    class="sharingBadgeLabel">专用</span></span></div>
                                <span class="headerRightContent"><a href="/_ui/core/chatter/files/FileTabPage"
                                    class="helpLinkElement"><span class="helpLink">« 返回列表</span>
                                    <!--<img title="此页面的帮助 （新窗口）" alt="此页面的帮助 （新窗口）" class="helpIcon" src="/s.gif" />-->
                                </a></span>
                            </div>
                            <div class="leftContent">
                                <div class="chatterFileDetailLeftPanel">
                                    <table>
                                        <tr>
                                            <td>
                                                <div>
                                                    <div class="chatterFileDetailActionListPanel">
                                                        <ul>
                                                            <li><a href="/apps/files/FileDownload.aspx?id=<%=FileId%>"
                                                                shouldstayinownframe="true" title="下载 <%=FileName%>">
                                                                <img src="/img/s.gif" alt="" width="1" height="1" class="downloadItemIcon" /><span
                                                                    class="actionLabel">下载 <%=FileName%></span></a><span class="fileSizeLabel"> (340&nbsp;B)</span>
                                                            </li><!--
                                                            <li><a href="javascript:void(0);" onclick="Sfdc.AccessibleShareWithDropDownPanel.showHideShareOptionDropdown(this, {docId: '<%=FileId%>', versionId: '<%=FileId%>', fileTitle: '<%=FileName%>', fileOwnerID: '<%=FileId%>', sharedWithWizardDataLoadUrl: '/file/sharedwithwizard/', showPeopleAndGroupOptions: true, showLinkOption: true, sharingScope: '', areSharingTypesUpdatable:'true'});return false;"
                                                                title="文件共享设置">
                                                                <img src="/img/s.gif" alt="" width="1" height="1" class="shareFileWithItemIcon" /><span class="actionLabel">文件共享设置</span><img src="/img/s.gif" alt="" width="1" height="1" class="content-action-link-arrow" /></a>                                                                        
                                                            </li>
                                                            <li class="chatterFileUploadNewVersionAction"><a href="javascript:void(0);" onclick="Sfdc.AccessibleUploadFileDialog.open({&quot;docId&quot;:&quot;<%=FileId%>&quot;})"
                                                                title="上载新版本">
                                                                <img src="/img/s.gif" alt="" width="1" height="1" class="updateVersionItemIcon" /><span
                                                                    class="actionLabel">上载新版本</span></a> </li>-->
                                                            <li><a href="javascript:void(0);" onclick="Sfdc.AccessibleEditFileDialog.open({&quot;fileName&quot;:&quot;<%=FileName%>&quot;,&quot;docId&quot;:&quot;<%=FileId%>&quot;})"
                                                                title="编辑详细信息">
                                                                <img src="/img/s.gif" alt="" width="1" height="1" class="editItemIcon" /><span class="actionLabel">编辑详细信息</span></a>
                                                            </li>
                                                            <li><a href="javascript:void(0);" onclick="Sfdc.ChatterFiles.deleteFile('<%=FileId%>');return false;"  title="删除">
                                                                <img src="/img/s.gif" alt="" width="1" height="1" class="deleteItemIcon" /><span class="actionLabel">删除</span></a> 
                                                             </li>
                                                        </ul>
                                                        <div class="hidden" id="chatterFilesEditPanelHolder">
                                                            <div class="chatterFilesEditPanel" id="chatterFilesEditPanel">
                                                                <form action="" id="chatterFileForm_edit" method="POST" name="chatterFileForm_edit"
                                                                onsubmit="return false;">
                                                                <div class="requiredLegendContainer" id="requiredLegend_edit">
                                                                    <span class="requiredLegend"><span class="requiredExampleOuter"><span class="requiredExample">
                                                                        &nbsp;</span></span><span class="requiredMark">*</span><span class="requiredText"> =
                                                                            必填信息</span></span>&nbsp;</div>
                                                                <table class="postInput" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr class="hidden" id="fileNameRow_edit">
                                                                        <th scope="row">
                                                                            <label for="fileName_edit">
                                                                                <span class="requiredMark">*</span>名称</label>
                                                                        </th>
                                                                        <td>
                                                                            <div class="requiredInput">
                                                                                <div class="requiredBlock">
                                                                                </div>
                                                                                <input class="fileFormInputElement" id="fileName_edit" maxlength="260" name="fileName_edit"
                                                                                    size="20" title="名称" type="text" value="<%=FileName%>" /><div class="errorMsg hidden">
                                                                                    </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="descRow_edit">
                                                                        <th scope="row">
                                                                            <label for="desc_edit">
                                                                                描述</label>
                                                                        </th>
                                                                        <td>
                                                                            <div>
                                                                                <textarea class="fileFormInputElement" cols="60" id="desc_edit" maxlength="1005"
                                                                                    name="desc_edit" rows="4" title="描述" type="text" wrap="soft"><%=Desc%></textarea><div class="errorMsg hidden">
                                                                                    </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <input type="hidden" id="hiddenFileName_edit" name="hiddenFileName" value="" /><div
                                                                    class="sharedWithOptionPanel hidden" id="sharedWithOptionPanel_edit">
                                                                    <label>
                                                                        您想使用该文件做什么？</label><ul>
                                                                            <li class="sharedWithStatusBar"><a href="javascript:void(0);" class="lockItemIcon"
                                                                                id="shareOptionStatus_edit" onclick="Sfdc.AccessibleUploadFileDialog.showShareOptionDropdown(this, {pubLinkEnabled:true});return false;">
                                                                                <span>专用上载</span><img src="/s.gif" alt="" width="1" height="1" class="tinyDownArrowIcon"
                                                                                    title="" /></a></li></ul>
                                                                </div>
                                                                <input type="hidden" id="shareOption_edit" name="shareOption_edit" value="pvt" /></form>
                                                                <div class="saveButtonBar">
                                                                    <input value=" 保存 " class="zen-btn" id="editFilesButton" name="editFilesButton" onclick="Sfdc.AccessibleEditFileDialog.edit();"
                                                                        title="保存" type="button" />&nbsp;<input value=" 取消 " class="zen-btn" name="cancelbutton"
                                                                            onclick="Sfdc.AccessibleEditFileDialog.close();" title="取消" type="button" /></div>
                                                            </div>
                                                        </div>
                                                        <script type="text/javascript">           SfdcCmp.init(Sfdc.get('.chatterFileDetailActionListPanel'));</script>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="vfButtonBar">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="userInfoPanel">
                                                    <a href="/_ui/core/userprofile/UserProfilePage?u=<%=OwningUser%>" title="<%=OwningUserName%>"><span
                                                        class="userThumbnail chatter-avatar chatter-avatarMedium" title="<%=OwningUserName%>">
                                                        <img src="/img/T.png" alt="<%=OwningUserName%>" width="30"
                                                            height="30" class="chatter-photo" title="liu jack" /><img src="/s.gif" alt="" class="chatter-avatarStyle"
                                                                title="" /></span></a>
                                                    <div class="userNameLastModifiedAtPanel">
                                                        <div class="userNameLabel">
                                                            所有者
                                                        </div>
                                                        <div class="userNameValue">
                                                            <a href="/_ui/core/userprofile/UserProfilePage?u=<%=OwningUser%>" class="userNameValue"
                                                                title="liu jack"><span class="userNameValueSpan" id="userNameValueSpan"><%=OwningUserName%></span></a>
                                                        </div>
                                                    </div>
                                                    <div class="lastModifiedAt">
                                                        上次修改时间<br />
                                                        <%=ModifiedOn%>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr><!--
                                        <tr>
                                            <td>
                                                <div>
                                                    <h3 class="numberVersionLabel">
                                                        版本 1
                                                    </h3>
                                                </div>
                                                <div class="allVersionsLink">
                                                    <a href="javascript:void(0);" id="seeAllVersionsId" onclick="Sfdc.AccessibleFileVersionListDialog.showDialog('版本历史', '<%=FileId%>')">
                                                        显示所有版本</a>
                                                </div>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="fileReportLink">
                                                    <a href="/00O?rt=140&amp;retURL=%2F06990000001823J&amp;c=DI&amp;c=NM&amp;c=DC&amp;c=PC&amp;c=CC&amp;c=LKC&amp;c=SC&amp;c=LNC&amp;duel0=DI%2CNM%2CDC%2CPC%2CCC%2CLKC%2CSC%2CLNC&amp;sort=DC&amp;sortdir=down&amp;t=title_FileEngagementReport&amp;scope=organization&amp;scopeid=06990000001823J&amp;details=yes"
                                                        target="_blank" title="显示文件报表">
                                                        <img src="/img/s.gif" alt="显示文件报表" width="1" height="1" class="fileReportIcon" title="显示文件报表" />显示文件报表</a>
                                                </div>
                                            </td>
                                        </tr>-->
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="vfButtonBar">
                                                    <a href="javascript:void(0);" onclick="Sfdc.AccessibleEditFileDialog.open({&quot;fileName&quot;:&quot;新建文本文档&quot;,&quot;docId&quot;:&quot;<%=FileId%>&quot;,&quot;editType&quot;:&quot;editDescription&quot;})"
                                                        title="编辑详细信息">
                                                        <img src="/img/s.gif" alt="编辑详细信息" width="1" height="1" class="editDescIcon" title="编辑详细信息" /></a>
                                                    <h3 class="descriptionLabel">
                                                        描述
                                                    </h3>
                                                </div>
                                                <div id="descriptionValue" class="descriptionValue">
                                                    <span id="fileDescriptionText"></span><a href="javascript:void(0);" id="addDescriptionId"
                                                        onclick="Sfdc.AccessibleEditFileDialog.open({&quot;fileName&quot;:&quot;新建文本文档&quot;,&quot;docId&quot;:&quot;<%=FileId%>&quot;,&quot;editType&quot;:&quot;editDescription&quot;})">
                                                        添加描述</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="mainContent">
                                <div class="lowerMainContent" id="lowerMainContent">
                                    <div id="rightContent" class="rightContent">
                                        <div class="chatterFileDetailFollowUnfollowLinks">
                                            <div data-chatter-widget="subscribeBtn" data-sfdc-entity-id="<%=FileId%>" data-sfdc-network-id="000000000000000"
                                                onclick="SfdcApp.Chatter.SubscribeButton.onClick(event);">
                                                <span class="zen-media zen-mediaExt" data-chatter-subscribe="1"><a href="javascript:void(0);"
                                                    class="zen-mrs zen-img">
                                                    <img src="/s.gif" alt="追随该文件以接收摘要中的更新。" width="1" height="1" class="chatter-icon chatter-followIcon"
                                                        title="追随该文件以接收摘要中的更新。" /></a><span class="zen-mediaBody"><a href="javascript:void(0);"
                                                            title="追随该文件以接收摘要中的更新。">追随</a></span></span><span class="zen-media zen-mediaExt"
                                                                onblur="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" onfocus="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                onmouseout="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" onmouseover="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                style="display: none"><img src="/s.gif" alt="停止追随该文件以停止接收摘要中的更新。" width="1" height="1"
                                                                    class="chatter-icon zen-mrs chatter-checkedIcon zen-img" title="停止追随该文件以停止接收摘要中的更新。" /><span
                                                                        class="zen-mediaBody">正在追随<a href="javascript:void(0);" class="zen-mls zen-imgExt"
                                                                            data-chatter-subscribe="0" title="停止追随该文件以停止接收摘要中的更新。"><img src="/s.gif" alt="停止追随该文件以停止接收摘要中的更新。"
                                                                                width="1" height="1" class="chatter-icon chatter-unfollowIcon" title="停止追随该文件以停止接收摘要中的更新。" /></a></span></span></div>
                                        </div>
                                        <div class="followers 06990000001823J thumbnailPanel profileSection" id="followerPanel"
                                            data-hovdata="dir=chatterHover-left">
                                            <div class="vfButtonBar">
                                                <div>
                                                    <h3>
                                                        追随者</h3>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="panelEmptyContent">
                                                    没有追随者。
                                                </div>
                                            </div>
                                        </div>
                                        <script type="text/javascript">      chatter.getFollowersPanel().wire('<%=FileId%>');</script>
                                        <div id="fileSharedWithSummaryPanel" class="thumbnailPanel profileSection" style="display:none">
                                            <div class="vfButtonBar">
                                                <div>
                                                    <a href="javascript:void(0);" id="shareWithViewAllLink" onclick="Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList(null, '<%=FileId%>');return false;">
                                                        显示全部 (1)</a>
                                                </div>
                                                <div>
                                                    <h3>
                                                        共享者</h3>
                                                </div>
                                            </div>
                                            <div class="itemList sharedWithSummaryList" data-hovdata="dir=chatterHover-left">
                                                <ul>
                                                    <li>
                                                        <div class="thumbnailIcon" data-hovid="0059000000390Wh">
                                                            <a href="/0059000000390Wh" title="liu jack"><span class="chatter-avatar chatter-avatarTiny"
                                                                data-hovid="0059000000390Wh" title="liu jack">
                                                                <img src="/img/T.png" alt="liu jack" width="16"
                                                                    height="16" class="chatter-photo" title="liu jack" /><img src="/s.gif" alt="" class="chatter-avatarStyle"
                                                                        title="" /></span> </a>
                                                        </div>
                                                        <div class="thumbnailLabel" data-hovid="0059000000390Wh">
                                                            <span><a href="/0059000000390Wh" class="entityLink" title="liu jack">liu jack</a>
                                                            </span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="centerContent" class="centerContent">
                                        <div id="dpvPreviewWrapper">
                                            <h2 class="filePreviewHeading">
                                                预览</h2>
                                            <div class="chatterFileViewerPanel" id="chatterFileViewerPanel">
                                                <div class="chatterFileViewerPreviewPanel"><!--
                                                    <div class="chatterFileViewerPreviewContent chatterFileVeiwerProcessingContent">
                                                        <div class="uploadProgress">
                                                        </div>
                                                        <p class="title panelLabel">
                                                            正在处理文件</p>
                                                        <p class="panelLabel">
                                                            您可继续工作。您的文件预览就绪时将在这里显示。</p>
                                                    </div>-->
                                                </div>
                                            </div>
                                            <script>       chatterFilePreview.getPreviewPoller('<%=FileId%>').startPoll()</script>
                                        </div>
                                    </div>
                                    <div class="clearingBox">
                                    </div>
                                </div>
                            </div>
                            <div class="clearingBox">
                            </div>
                        </div>
                    </div>
                    <!-- Body events -->
                    <script type="text/javascript">                        function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F06990000001823J&isAjaxRequest=1&renderMode=ZEN&nocache=1414031400887'; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "XkkWwEOrM3Ins0_eOj3vgAG2r8hdztF4lZUqalZUW.dGOw8xNWMO"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                </div>
            </div>
        </div>
        
        <cc1:ZenPageFooter runat="server" ID="ZenPageFooter1" />
    </div>
    <script>        //      var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1414038413000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
    <script>        //    var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1406927496000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
</body>
</html>
<!-- page generation time: 227ms -->
