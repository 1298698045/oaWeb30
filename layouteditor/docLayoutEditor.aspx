<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docLayoutEditor.aspx.cs"
    Inherits="WebClient.layouteditor.docLayoutEditor" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>表单与相关列表设计：新表单  ~ 设置 - 高效协同</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/setup.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/48.0/sprites/1582680690000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link href="/css/cntrt/cntrt.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script type="text/javascript">
        //SetupTreeNode.prototype.initializeSetup = function () {
        //    var openNodes = '';
        //    if (openNodes != null) {
        //        SetupTreeNode.prototype.openListSetup = openNodes.split(':');
        //    }
        //    SetupTreeNode.prototype.personalSetupV2 = false;
        //}
    </script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1425603402000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-3-18 上午8:59", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/setup.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425509820000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426127703000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>
    <!--<link rel="shortcut icon" href="https://ap1..com/favicon.ico" />-->
    <script src="/jslibrary/sfdc/Security.js"></script>
    <meta content="C#" name="CODE_LANGUAGE" />
        <script type="text/javascript" src="/js/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
        function DoSaveWorkTableStyle() {
            return SaveDocument();
        }
        //生成HTML
        function WebCreateFieldHTML(stableId, sFieldId, sFieldName) {
            webform.WebOffice.WebSetMsgByName("COMMAND", "CREATEHTML");
            webform.WebOffice.WebSetMsgByName("TABLEID", stableId);
            webform.WebOffice.WebSetMsgByName("FIELDID", sFieldId);
            webform.WebOffice.WebSetMsgByName("FIELDNAME", sFieldName);            
            if (webform.WebOffice.WebSendMessage()) {
                // alert("OK！");
            }
            else {
                alert("生成HTML的数据信息发送失败");
            }
            return true;
        }
        function WebCreateSubEntityHTML(stableId, sFieldId, sFieldName) {
            
        }
        //插入字段
        function WebInsertField(sTBid) {
            var stableid = sTBid;
            var sFieldId = jQuery("#drp_tablist").val();// document.getElementById("drp_tablist").value;
            var sFieldName = jQuery("#drp_tablist option:selected").text();
            //var sPath = webform.WebCtlUserField.GetPath();
            //var sfilename = "Field.htm";
            var sPost, sRet;
            sRet = "";
            if (WebCreateFieldHTML(stableid, sFieldId, sFieldName)) {  //调用完成生成HTML的函数
                webform.WebOffice.WebInsertFile(); //用控件的接口，把生成的文件插入到当前文档中
            }
            else {
                alert("插入字段失败！");
            }
            /*
            sPost = "bdgsdy_WebInsertField";
            var kindid = '4f242cdc-3c51-45a8-a71f-00b85f2c294b';
            $.ajax({
            async: false,
            cache: true,
            timeout: 1000,
            type: "get",
            dataType: "html",
            url: "ajax.ashx",
            data: { key: sPost, sTableId: kindid, sDataTableId: sTBid, sFieldId: sfieldid },
            error: function (o) { },
            success: function (o) {
            sRet = o;
            }
            });
            if (sRet.substring(0, 5) != "LKERR") {
            if (webform.WebCtlUserField.CreateFieldInfo(sRet, sfilename)) {
            try {
            webform.WebOffice.WebObject.Application.ChangeFileOpenDirectory(sPath);
            webform.WebOffice.WebObject.Application.Selection.InsertFile(sfilename, "", false, false, false);
            }
            catch (e) {
            alert("插入表单属性信息时出现错误，当前Office环境可能不支持该操作，建议使用OfficeXP版本！");
            }
            }
            else {
            alert("出现错误，您可能不具备权限！请确保当前WINDOWS的登录用户是管理员用户。");
            }
            }
            else {
            alert("生成表单属性信息时出现错误，[错误描述信息:]\n" + sRet);
            }
            */
            //webform.WebOffice.WebObject.Content.Text  ---取值
            //webform.WebOffice.WebObject.Application.Selection.Range.Text  ---赋值
        }

        function CallDelete() {
            if (confirm('您确定要删除文档吗?')) {
               // __doPostBack("lnbdel", "");
            }
        }

        function CallSave() {
            if (DoSaveWorkTableStyle()) {
                // __doPostBack("lnbSave", "");
                document.webform.submit();
            }
        }
    </script>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <style>
        .navlist{
            font-size:14px;
            overflow:hidden;
            margin-top:10px;
        }
        .navitem{
            float:left;
            padding: 5px 10px;
            margin:0 10px 0;
            cursor:pointer;
        }
        .navitem.active{
            border-bottom:2px solid #108def;
        }
        .related-item-head{
            padding-bottom:5px;
        }
        .layoutrelated-item{
            margin-top:25px;
        }
        .related-item-body .related-list-head{
            height: 30px;
            line-height: 30px;
            border-top: 1px solid #dddbda;
            margin-left: 0;
        }
        .related-item-body .related-list-head div {
            width: 117px;
        }
        .related-item-body .related-list-head > div {
            float: left;
            height: 30px;
            margin-left: 3px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        body #iframe {
            position: fixed;
            background-color: white;
            width: 100%;
            left: 0;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: block;
            height:620px;
            border:0;
            overflow:hidden;
            z-index:9999;
            display:none;
        }
        .popup-mask {
            display:none;
            position: fixed;
            background-color:transparent;
            width:100%;
            height:100%;
            top:0;
            z-index:999;
            left:0;
            position:fixed;
            background: url(/img/bgOverlayDialogBackground.png) ;
            background-color: transparent;
        }
        #newbtns{
            float: right;
            width: 84px;
            height: 30px;
            line-height: 30px;
            border: 1px solid #dddbda;
            border-radius: 4px;
            text-align: center;
            color: #108af9;
            font-size: 12px;
            margin-right: 10px;
            cursor: pointer;
        }
        body.sfdcBody {
            background:none;
            padding:0;
            margin:0;
            border:0;
        }
        .bodyDiv {
            box-shadow:none;
        }
        .setupTab .brdPalette {
            border: 0;
        }
        input[type="button"] {
            height: 30px;
            line-height: 30px;
            border: 1px solid #dddbda;
            border-radius: 4px;
            text-align: center;
            color: #108af9;
            font-size: 12px;
            margin-right:0px;
            cursor: pointer;
            background-color:white;
            padding:0 10px;
            outline:none;
        }
        input[type="button"]:hover{
            background-color:#f2f2f2;
        }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif setupTab  Html sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
       <%--  <div class="bPageHeader" id="AppBodyHeader">                  
        </div> --%>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv_setup">
            <table class="outerNoSidebar" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>                   
                    <td class="noSidebarCell">
                        <a name="skiplink">
                            <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif"></a>
                        <div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img title="" class="pageTitleIcon" alt="" src="/s.gif"><h1 class="pageType noSecondHeader">
                                        表单：
                                        <%=FormTitle%></h1>
                                    <div class="blank">
                                        &nbsp;</div>
                                    <div class="navlist">
                                        <div class="navitem active">主表</div>
                                        <div class="navitem">相关列表</div>
                                    </div>
                                </div>
                                <div class="links"><!--
                                    <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                        <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a>--></div>
                            </div>
                            <div class="ptBreadcrumb">
                            </div>
                        </div>
                        <center class="section">
                            <form name="webform" method="post" action="docLayoutEditor.aspx" id="webform">
                            <input type="hidden" name="entityTemplateId" id="entityTemplateId"  value="<%=EntityTemplateId%>" />
                             <input type="hidden" name="id" id="id"  value="<%=FormId%>" />
                             <input type="hidden" name="setupid" id="setupid"  value="CustomObjects" />
                            <script language="javascript" type="text/javascript">
                                function batchTemplate() {
                                    window.location = "/01I/detail?setupid=CustomObjects&id=" + document.getElementById("entityTemplateId").value;
                                }
                                function StatusMsg(mString) {
                                    if (mString != null && mString != '') document.getElementById('StatusBar').innerHTML = "<span title='状态信息：" + mString + "'>" + mString + "</span>";
                                }
                                function Load() {
                                    try {
                                        webform.WebOffice.WebUrl = "<%=mServerUrl%>";
                                        webform.WebOffice.RecordID = '<%=Request["id"]%>';
                                        webform.WebOffice.Template = "";
                                        webform.WebOffice.FileName = '<%=Request["id"]%>.doc';
                                        webform.WebOffice.FileType = ".doc";
                                        webform.WebOffice.EditType = "1";
                                        webform.WebOffice.UserName = "管理员〖1〗";
                                        webform.WebOffice.ShowMenu = "1";
                                       // webform.WebOffice.AppendMenu("2", "保存本地文件(&S)");

                                        webform.WebOffice.WebOpen();  	//打开该文档

                                        StatusMsg(webform.WebOffice.Status);
                                        webform.WebOffice.WebShow(false);
                                    } catch (e) { }
                                }
                                function WebDesign() {
                                    webform.WebOffice.WebObject.Application.ActiveDocument.ToggleFormsDesign();
                                }
                                function WebReFresh() {
                                    try {
                                        webform.WebOffice.WebReFresh();
                                    } catch (e) { }
                                    StatusMsg("文档已刷新...");
                                }
                                function WebdoNotDesign() {
                                    if (webform.WebOffice.WebObject.Application.ActiveDocument.FormsDesign) {
                                        webform.WebOffice.WebObject.Application.ActiveDocument.ToggleFormsDesign();
                                    }
                                }
                                function LoadDocument() {
                                    if (!confirm("您确定要重新载入正文信息吗？重新载入后，当前未保存的数据将丢失！")) {
                                        return false;
                                    }
                                    StatusMsg("正在打开文档...");
                                    webform.WebOffice.EditType = 1;
                                    if (!webform.WebOffice.WebOpen()) {
                                        StatusMsg(webform.WebOffice.Status);
                                    } else {
                                        StatusMsg(webform.WebOffice.Status);
                                    }
                                }
                                function PreViewHtml() {
                                    window.open("PreviewForm.aspx?formId=<%=mRecordID%>&templateid=<%=EntityTemplateId%>","previewform");
                                }
                                function WebOpenPrint() {
                                    try {
                                        webform.WebOffice.WebOpenPrint();
                                        StatusMsg(webform.WebOffice.Status);
                                    } catch (e) { }
                                }
                                function WebOpenLocal() {
                                    if (!confirm("您确定要打开本地文件到当前编辑器吗？载入本地文件后，当前未保存的数据将丢失！")) {
                                        return false;
                                    }
                                    try {
                                        webform.WebOffice.WebOpenLocal();
                                        StatusMsg(webform.WebOffice.Status);
                                    }
                                    catch (e) { }
                                }
                                function WebSaveLocal() {
                                    try {
                                        webform.WebOffice.WebSaveLocal();
                                        StatusMsg(webform.WebOffice.Status);
                                    }
                                    catch (e) { }
                                }
                                function UnLoad() {
                                    try {
                                        var sPost, sRet;
                                        sRet = "OK";
                                        if (!webform.WebOffice.WebClose()) {
                                            StatusMsg(webform.WebOffice.Status);
                                        } else {
                                            StatusMsg("关闭文档...");
                                        }
                                    } catch (e) {
                                    }
                                    if (sRet != "OK") {
                                        window.event.returnValue = "当前文件还没有正常解锁！您退出后，别人可能无法编辑！\n如果您选择离开，请再次重新进入点击退出或者返回按钮来解锁当前文件！"
                                    }
                                }
                                function WebSaveAsHtml() {
                                    var bReturn = false;
                                    try {
                                        if (webform.WebOffice.WebSaveAsHtml()) {
                                            bReturn = true;
                                            webform.HTMLPath.value = "../SysFiles/HTML/<%=mRecordID%>.htm";
                                        }
                                        StatusMsg(webform.WebOffice.Status);
                                        return bReturn;
                                    } catch (e) { return false; }
                                }
                                function SaveDocument() {
                                    var sPost, sRet;
                                    sRet = "";
                                    if (webform.EditType.value == "0") {
                                        alert("你在查看状态，不能保存!");
                                        return false;
                                    }
                                    if (!WebSaveAsHtml()) {
                                        StatusMsg("生成数据时碰到错误，保存失败！");
                                        alert("生成数据时碰到错误，保存失败！");
                                        return false;
                                    }
                                    if (!webform.WebOffice.WebSave()) {
                                        StatusMsg(webform.WebOffice.Status);
                                        alert("表单保存失败！");
                                        return false;
                                    } else {
                                        //alert("表单保存成功！");
                                        StatusMsg(webform.WebOffice.Status);
                                    }
                                    return true;
                                }
                            </script>
                            <table width="100%" height="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
                                <!-- <tr>
                                    <td height="30" colspan="6">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0" height="30">
                                            <tr>
                                                <td width="68%">
                                                </td>
                                                <td width="32%" align="right">
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>-->
                                <tr>
                                    <td align="right" valign="middle" height="40" width="100%" style="padding-right: 11px" colspan="6">
                                        <input type="button" class="btn_sjbd" onclick="javascript:WebDesign();return false;"
                                            value="设计表单" />&nbsp;
                                        <input type="button" class="btn_shuaxin" onclick="javascript:WebReFresh();return false;"
                                            value="刷新" />&nbsp;
                                        <input type="button" class="btn_cxzr" onclick="javascript:LoadDocument();return false;"
                                            value="重新载入" />&nbsp;
                                        <input type="button" class="btn_ylbd" onclick="javascript:PreViewHtml();" value="预览表单" />&nbsp;
                                        <input type="button" class="btn_print" onclick="javascript:WebOpenPrint();" value="打印" />&nbsp;
                                        <input type="button" class="btn_open" onclick="javascript:WebOpenLocal();" value="打开本地" />&nbsp;
                                        <input type="button" class="btn_cwbd" onclick="javascript:WebSaveLocal();" value="存本地" />&nbsp;
                                        <input type="button" class="btn_delete" onclick="javascript:CallDelete();" value="删除" />&nbsp;
                                        <input type="button" class="btn_preserve" onclick="javascript:CallSave();" value="保存" />
                                        <input type="button" class="btn_preserve" onclick="javascript:batchTemplate();" value="返回" />
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#eeeeee" height="20" width="70%" colspan="5">
                                        <span id="StatusBar" style="padding-left: 10px; float: left;"></span>
                                    </td>
                                    <td width="30%" bgcolor="#eeeeee" align="right" style="padding-top:5px; padding-right:5px;">
                                       字段： <select name="drp_tablist" id="drp_tablist" style="height: 20px; text-align: right; margin:0px;  ">
                                            <%=FieldOptions%>
                                        </select>
                                        <input type="button" class="btn_insert" value="插入" onclick="WebInsertField('f2901dc0-3a2a-40e7-8ef5-fd4e68cf78a5')" />
                                    </td>
                                </tr>
                                <tr>
                                    <td id="tdWebOfficeObject" colspan="6" height="100%" style="min-height:800px;" align="center" bgcolor="#eeeeee"
                                        valign="top">
                                        <input type="hidden" name="RecordID" value="<%=mRecordID%>" />
                                        <input type="hidden" name="Template" value="" />
                                        <input type="hidden" name="FileType" value=".doc" />
                                        <input type="hidden" name="EditType" value="1" />
                                        <input type="hidden" name="HTMLPath" value="../SysFiles/Forms/<%=mRecordID%>.htm" />
                                        <object id="WebOffice" width="100%" height="768" classid="clsid:23739A7E-5741-4D1C-88D5-D50B18F7C347"
                                            codebase="iWebOffice2003.ocx#version=8.8.3.2">
                                        </object>
                                        <!--<script src="iWebOffice2009.js" type="text/javascript"></script>-->
                                    </td>
                                </tr>
                            </table>
                            <!--
                            <a id="OcxCustomTableBlock">
                                <object id="WebCtlUserField" codebase="../ocx/OCXCUSTOMTABLE.OCX#version=3,5,0,5"
                                    height="0" width="0" classid="CLSID:28F5AEC1-2278-4FF9-BA71-C8A6E30B16F6" viewastext>
                                </object>
                            </a>-->
                            </form>
                        </center>
                        <center class="section" style="display:none;">
                            <div id="newbtns">设置相关列表</div>
                            <div style="clear:both;"></div>
                            <div id="layout_related"></div>
                        </center>
                        <!-- Body events -->
                        <script type="text/javascript">
                            function bodyOnLoad() {
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };                               
                                if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                            } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }

                        </script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>      

    <!--<script defer="true" src="/jslibrary/sfdc/Setup.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>    -->
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <script src="/js/alert.js"></script>
    <script type="text/javascript">
        $('.navitem').click(function () {
            $('.navitem').removeClass('active')
            $(this).addClass('active')
            $('.section').hide()
            $('.section').eq($(this).index()).show()
        })

        if ($('#layout_related').length > 0) {
            getrelated()
        }
        //相关列表
        function getrelated() {
            $('#layout_related').html('')
            var objectTypeCode = getQueryString('objectTypeCode')
            if (!objectTypeCode) {
                objectTypeCode = window.objectTypeCode
            }
            var id = getQueryString('id')
            ajaxMethodGetData('entity.relatedlistinfos.get', {
                layoutId: id
                ,objectTypeCode: objectTypeCode
            }, function (data) {
                createdrelatedlist(data.actions[0].returnValue.relatedLists)
                createdrelatedlistdata()
                for (var i = 0; i < data.actions[0].returnValue.relatedLists.length; i++) {
                    var res = data.actions[0].returnValue.relatedLists[i]
                    $('#leftnav ul').append('<li><a href="#relatedlist_' + res.relatedSObject + '">' + res.label + '</a></li>')

                }
            })
        }
        $('#newbtns').click(function () {
            $('#iframe').attr('src', '/layouteditor/layout_RelatedListSort.html').show().height(460).css('margin-top', '-230px')
            $('.popup-mask').show()
        })
        function addRelatedItem(relatedListId, name) {
            $('#iframe').attr('src', '/layouteditor/layout_relatedlistshow.html?relatedListId=' + relatedListId + '&name=' + name).show().height(540).css('margin-top', '-230px')
            $('.popup-mask').show()
        }
        function createdrelatedlist(data) {
            var html = ''
            for (var i = 0; i < data.length; i++) {
                var res = data[i]
                html += '<div class="related-item layoutrelated-item" objectTypeCode="' + res.objectTypeCode + '" id="relatedlist_' + res.relatedSObject + '">'
                        + '    <div class="related-item-head">'
                        + '        <div class="related-item-logo">'
                        + '            <img src="/img/cal/hetongguanli.png" alt="" />'
                        + '        </div>'
                        + '        <div class="related-item-name">'
                        + '            <span>' + res.label + '</span>'
                        + '            <span>(0)</span>'
                        + '        </div>'
                        + '        <div class="related-item-pay" onclick=addRelatedItem("' + res.relatedListId + '","' + res.relatedObjectAttributeName + '")>'
                        + '            <span>编辑字段</span>'
                        + '        </div>'
                        + '        <div class="related-item-pay" onclick=deleteRelatedItem("' + res.relatedListId + '","' + res.relatedObjectAttributeName + '")>'
                        + '            <span>删除</span>'
                        + '        </div>'
                        + '    </div>'

                        + '</div>'
            }
            $('#layout_related').append(html)
        }
        function deleteRelatedItem(id) {
            $('.popup-mask').show()

            $('#iframe').show().attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=deleterelateditem').height(280).css('margin-top','-140px')
        }
        function createdrelatedlistdata() {
            var objectTypeCode = getQueryString('objectTypeCode')
            if (!objectTypeCode) {
                objectTypeCode = window.objectTypeCode
            }
            var id = getQueryString('id');
            ajaxMethodGetData('entity.relatedrecords.get', {
                layoutId: id,
                objectTypeCode: objectTypeCode,
                id: id
            }, function (data) {
                var res = data.actions[0].returnValue
                var listItems = res.listItems
                var recordIds = res.recordIds
                var records = res.records
                var pid = getQueryString('id')
                for (var item in listItems) {
                        var width = listItems[item].length * 120 + 80
                        $('#relatedlist_' + item).append('<div class="related-item-body">'
                        + '        <div style="width:' + width + 'px;min-width:100%;"><div class="related-list-head"></div></div>'
                        + '    </div>')
                        for (var i = 0; i < listItems[item].length; i++) {
                            //console.log(123)
                            $('#relatedlist_' + item).find('.related-list-head').append('<div name="' + listItems[item][i].field + '">' + listItems[item][i].title + '</div>')
                           
                        }
                }
            })
        }
        
        //生成相关列表 html
    </script>
    <iframe frameborder="0" src="" id="iframe" style="height: 460px; width: 840px; margin-top: -230px; margin-left: -420px; left: 50%;"></iframe>
    <div class="popup-mask"></div>
    <!--
        <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary//fdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
</body>
</html>
