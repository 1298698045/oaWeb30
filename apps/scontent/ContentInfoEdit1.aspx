<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="ContentInfoEdit.aspx.cs"
    Inherits="WebClient.apps.scontent.ContentInfoEdit" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>信息编辑: <%=CTitle%> ~ 知识内容管理 - 协同办公系统</title>
    <!--
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/elements.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/common.css">
    -->
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css">
    <script type="text/javascript">
        //<![CDATA[
        try{(function(){var w=self,l,p,o;if(w&&top){for(;w!==top&&(p=w.parent)&&p!==w&&(o=p.location)&&o.protocol===(l=w.location).protocol&&(o.host===l.host||(p.document&&p.document.domain===w.document.domain));w=p);if(w!==top)throw "";}({f:function(){document.documentElement?document.documentElement.style.display="":(!this.a&&(this.a=10),this.a<1E5&&(window.sfdcRetryShowWindow=this)&&setTimeout("sfdcRetryShowWindow.f()",this.a),this.a*=2)}}.f())})();}catch(e){if(top!==self)top.location=location;else throw e;}//]]&gt;</script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/Business.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script>        window.sfdcPage = new EditPage(null);
        UserContext.initialize({ "networkId": "", "labelLastModified": "1421084164000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": true }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-MM-dd HH:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
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
    <script src="/ckeditor/ckeditor-4.x/rel/ckeditor.js?t=4.4.4.5"></script>
    <style>
        .cke {
            visibility: hidden;
        }
    </style>
    <link href="https://ap1..com/favicon.ico" rel="shortcut icon">
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //   ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '118.186.239.71', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fa00%2Fe%3FretURL%3D%252Fa00%252Fo');</script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/sfdc-config.js?t=4.4.4.5"></script>
    <link rel="stylesheet" type="text/css" href="/ckeditor/ckeditor-4.x/rel/skins/moono/editor_gecko.css?t=4.4.4.5">
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/lang/zh-cn.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/styles.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/language/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcImage/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcMediaEmbed/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcSmartLink/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcCodeBlock/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcTable/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcVfAjax4J/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/menubutton/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/iframedialog/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/language/lang/zh-cn.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcImage/lang/zh-cn.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/table/dialogs/table.js?t=4.4.6.2"></script>
    <!--<script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/pastefromword/filter/default.js"></script>  -->
    <link rel="stylesheet" type="text/css" href="/ckeditor/ckeditor-4.x/rel/skins/moono/dialog.css?t=4.4.6.2" />
        <style>
        #filelist ul, #filelist li {
            list-style: none;
            margin-left: 0;
            padding-left: 0;
        }

        #filelist li {
            margin-bottom: 10px;
        }

            #filelist li:hover {
                background-color: #f2f2f2;
            }

        #filelist ul {
            margin-top: 0;
        }

        #filelist img {
            width: 30px;
            height: 30px;
        }

        #filelist .file-name {
            margin-left: 15px;
            line-height: 30px;
        }

        #filelist .file-delete {
            margin-left: 25px;
            cursor: pointer;
            color: #108def;
            line-height: 30px;
            float: right;
            margin-right: 50px;
        }

        #addfile img {
            width: 16px;
            height: 16px;
            margin-right: 5px;
            float: left;
            margin-top: -1px;
        }

        #addfile {
            cursor: pointer;
            margin-top: 10px;
            line-height: 16px;
            width: 50px;
        }

        #addpeople {
            cursor: pointer;
            margin-top: 10px;
            line-height: 16px;
            width: 50px;
            position: relative;
            clear: both;
            margin: 15px;
        }

            #addpeople img {
                width: 16px;
                height: 16px;
                margin-right: 5px;
                float: left;
                margin-top: -1px;
            }

        .file-deleteimg {
            width: 14px;
            height: 14px;
            margin-top: 10px;
            cursor: pointer;
        }

        .peoplelist li, .peoplelist ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .peoplelist li {
            float: left;
            padding: 5px 20px 5px 10px;
            border: 1px solid #dedede;
            font-size: 12px;
            margin-left: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            position: relative;
        }

            .peoplelist li img {
                width: 12px;
                height: 12px;
                position: absolute;
                right: 2px;
                top: 7px;
                cursor: pointer;
            }
    </style>
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
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="信息" class="pageTitleIcon" title="信息" /><h1 class="pageType noSecondHeader">编辑信息：<%=CTitle%></h1>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a>
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>

                        <script src="/static/js/picklist.js"></script>
                        <script type="text/javascript">
                            function valiateForm()
                            {
                                if (document.getElementById('cancelAction').value=='1')
                                    return true;
                                var title = document.getElementById("cpn1").value;
                                if (title=="")
                                {
                                    alert("标题必须输入");
                                    return false;
                                }
                                var folderId = document.getElementById("folderPicker").value;
                                if (folderId=="")
                                {
                                    alert("栏目必须选择");
                                    return false;
                                }
                                var keyWords1 = document.getElementById("KeyWords").value;
                                if (keyWords1=="")
                                {
                                    alert("标签必须选择");
                                    return false;
                                }
                                return true;
                            }
                            function enableTopDate(ele)
                            {
                                //alert(ele.checked);
                                if(ele.checked)
                                {
                                    document.getElementById('endTopDate').disabled=false; 
                                }
                                else
                                {
                                    document.getElementById('endTopDate').disabled=true; 
                                    document.getElementById('endTopDate').value="";
                                }
                            }
                        </script>
                        <form action="/apps/scontent/ContentInfoEdit.aspx" id="editPage" method="post" name="editPage" enctype="multipart/form-data"
                            onsubmit="if (!valiateForm()) { return false; } if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }">
                            <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <input type="hidden" id="cancelAction" name="cancelAction" />
                            <div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette" id="ep">
                                <div class="pbHeader">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">信息编辑</h2>
                                            </td>
                                            <td class="pbButton" id="topButtonRow">
                                                <input value=" 保存发布 " class="btn" title="保存发布" name="save" type="submit"  id="save_top" />
                                                <input value=" 保存并提交审核 " class="btn" title="保存并提交审核" name="save_approve" id="save_approve_top" type="submit" /> 
                                                <%if (CanApprove)
                                                  {%>
                                                <!--<input value=" 审核并通知 " class="btn" title="审核并通知" name="approve_notify" type="submit" />-->
                                                <div class="menuButton" id="managedetail">
                                                    <div class="menuButtonButton" id="managedetailButton"><span class="menuButtonLabel" id="managedetailLabel" tabindex="0">审批</span></div>
                                                    <div class="menuButtonMenu" id="managedetailMenu"><a href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>',1);" class="menuButtonMenuLink firstMenuItem">审批发布</a><a href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>','2'); " class="menuButtonMenuLink">审批不发布</a></div>
                                                </div>
                                                <script>    new MenuButton('managedetail', false);</script>
                                                <input value=" 预览内容 " class="btn" title="预览内容" name="preview" type="button" onclick="openPopupFocusEscapePounds('/apps/scontent/PreviewContent.aspx?id=<%=EntityId%>&ispreview=1', 'Prev', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" />
                                                <%} %>
                                                <input value=" 取消 " class="btn" title="取消" name="cancel" type="submit" onclick="document.getElementById('cancelAction').value='1'" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbBody">
                                    <div class="pbError" id="errorDiv_ep" style="display: none">
                                        错误：无效数据。<br />
                                        请查看下列所有错误消息以纠正数据。
                                    </div>
                                    <div class="pbSubheader brandTertiaryBgr first tertiaryPalette" id="head_1_ep">
                                        <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                            <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                class="requiredText"> = 必填信息</span></span></span><h3>信息属性<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol">
                                                    <label>
                                                        发布人</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <%=OwnerName%>
                                                </td>
                                                <td class="labelCol">
                                                    <label for="cpn9">
                                                        发布部门</label>
                                                </td>
                                                <td class="dataCol">
                                                    <%=BusinessUnitIdControlHtml%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="cpn1">
                                                        <span class="requiredMark">*</span>标题</label>
                                                </td>
                                                <td class="dataCol col02" colspan="3">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <input id="cpn1" maxlength="120" name="cpn1" size="50" tabindex="1" type="text" value="<%=CTitle%>" />
                                                    </div>
                                                </td>

                                            </tr>
                                            <!--
                                                <tr>
                                                    <td class="labelCol">
                                                        <label for="cpn16">
                                                            主题词</label>
                                                    </td>
                                                    <td class="dataCol col02" colspan="3">
                                                        <input id="keyWords" maxlength="120" name="keyWords" size="50" tabindex="2" type="text" value="<%=KeyWords%>" />
                                                    </td>
                                                    <td class="labelCol empty">
                                                        &nbsp;
                                                    </td>
                                                    <td class="dataCol empty">
                                                        &nbsp;
                                                    </td>
                                                </tr>-->
                                            <tr>
                                                <td class="labelCol">
                                                    <label for="cpn2">
                                                        <span class="requiredMark">*</span>所属栏目</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <!--<input type="hidden" name="parent_lkid" id="parent_lkid" value="<%=FolderId%>" /><input type="hidden" name="parent_lkold" id="parent_lkold" value="" />
                                                           <input type="hidden" name="parent_lktp" id="parent_lktp" value="NewsFolderLookup" /><input type="hidden" name="parent_lspf" id="parent_lspf" value="1" />
                                                           <input type="hidden" name="parent_lspfsub" id="parent_lspfsub" value="0" />
                                                           <input type="hidden" name="parent_mod" id="parent_mod" value="1" />
                                                           <span class="lookupInput"><input type="text" id="parent" maxlength="255" name="parent" onchange="getElementByIdCS('parent_lkid').value='';getElementByIdCS('parent_mod').value='1';" size="20" tabindex="4" value="<%=FolderName%>" /><a href="javascript:openLookup('/_ui/common/data/LookupPage?lkfm=editPage&amp;lknm=parent&amp;lktp=' + getElementByIdCS('parent_lktp').value,670,'1','&amp;lksrch=' + escapeUTF(getElementByIdCS('parent').value.substring(0, 80)))" id="parent_lkwgt" onclick="setLastMousePosition(event)" tabindex="4" title="分类 查找（新窗口）"><img src="/s.gif" alt="分类 查找（新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" title="分类 查找（新窗口）"></a></span>-->
                                                        <cc1:FolderSelector runat="server" ID="folderPicker" />
                                                    </div>

                                                </td>
                                                <td class="labelCol">
                                                    <label for="cpn2">
                                                        <span class="requiredMark">*</span>置顶信息</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <input id="chkIsTop" name="chkIsTop" tabindex="1" type="checkbox" onclick="enableTopDate(this)" <%=IsTopHTML%> />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">
                                                    <label for="cpn2">
                                                        <span class="requiredMark">*</span>重要信息</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <input id="chkIsImportant" name="chkIsImportant" tabindex="1" type="checkbox" <%=IsImportantHTML%> />
                                                </td>

                                                <td class="labelCol">置顶截止
                                                </td>
                                                <td class="dataCol col02">
                                                    <input id="endTopDate" name="endTopDate" tabindex="6" size="10" type="text" value='<%=EndTopDate%>' onfocus="DatePicker.pickDate(false, 'endTopDate', false);" onblur="if(!isDate(this.value)) {{ this.value=''; }}" disabled="disabled" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">附件权限
                                                </td>
                                                <td class="dataCol"><select name="attachRightCode" id="attachRightCode"><%=AttachRightCodeControlHTML%></select>
                                                </td>
                                                <td class="labelCol ">状态
                                                </td>
                                                <td class="dataCol col02">
                                                    <%=StatusName%>
                                                    <input type="hidden" name="statusCode" id="statusCode" value="" />
                                                </td>
                                            </tr>
                                            <tr>
                                                                        <td class="labelCol"><span class="requiredMark">*</span>发布时间
                                                                        </td>
                                                                        <td class="dataCol col02">
                                                                              <input id="CreatedOn" name="CreatedOn" tabindex="6" size="24" style="width:140px;" type="text" value='<%=CreatedOn%>' onfocus="DatePicker.pickDate(false, 'CreatedOn', true);"   />
                                                                        </td>
                                                                    </tr>
                                            <!--
                                                <tr>
                                                    <td class="labelCol">
                                                        <label for="cpn3">
                                                            状态</label>
                                                    </td>
                                                    <td class="dataCol col02">
                                                        <span>
                                                            <select id="cpn3" name="cpn3" tabindex="4">
                                                                <option value="0" selected="true">草稿</option>
                                                                <option value="1" >已发布</option>
                                                            </select></span><script>                    new picklist('cpn3', '3', null, ['0', '草稿'], ' id=\"cpn3\" name=\"cpn3\" tabindex=\"4\"', true, true);</script>
                                                    </td>
                                                    <td class="labelCol empty">
                                                        &nbsp;
                                                    </td>
                                                    <td class="dataCol empty">
                                                        &nbsp;
                                                    </td>
                                                </tr>                                                
                                                    <tr>
                                                        <td class="labelCol">
                                                            <label for="cpn5">
                                                                开始日期</label>
                                                        </td>
                                                        <td class="dataCol col02">
                                                            <span class="dateInput dateOnlyInput">
                                                                <input id="cpn5" name="cpn5" onfocus="DatePicker.pickDate(false, 'cpn5', false);"
                                                                    size="12" tabindex="5" type="text" /><span class="dateFormat">[&nbsp;<a href="javascript:DatePicker.insertDate('2014-11-21', 'cpn5', true);"
                                                                        tabindex="5">2014-11-21</a>&nbsp;]</span></span>
                                                        </td>
                                                        <td class="labelCol empty">
                                                            &nbsp;
                                                        </td>
                                                        <td class="dataCol empty">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                <tr>
                                                    <td class="labelCol">
                                                        <label for="cpn6">
                                                            结束日期</label>
                                                    </td>
                                                    <td class="dataCol col02">
                                                        <span class="dateInput dateOnlyInput">
                                                            <input id="cpn6" name="cpn6" onfocus="DatePicker.pickDate(false, 'cpn6', false);"
                                                                size="12" tabindex="6" type="text" /><span class="dateFormat">[&nbsp;<a href="javascript:DatePicker.insertDate('2014-11-21', 'cpn6', true);"
                                                                    tabindex="6">2014-11-21</a>&nbsp;]</span></span>
                                                    </td>
                                                    <td class="labelCol empty">
                                                        &nbsp;
                                                    </td>
                                                    <td class="dataCol empty">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                -->

                                        </table>
                                    </div>
                                    <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_2_ep">
                                        <h3>内容<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <span id="thePage:mainLayout:formIdea:pb:pbs:j_id43" class="fieldIdeaBody">
                                                        <textarea id="cpn4" maxlength="32768" name="cpn4" rows="25"
                                                            tabindex="8" type="text" wrap="soft"><%=Contents%></textarea><script>
                                                                                                                             CKEDITOR.timestamp = '4.4.6.2';
                                                                                                                             var protocolAndHost = window.location.protocol + '//' + window.location.host;
                                                                                                                             var editor = CKEDITOR.replace('cpn4', {
                                                                                                                                 removePlugins: 'elementspath,maximize,image,liststyle,resize', //removePlugins: 'elementspath,maximize,image,tabletools,liststyle,contextmenu,resize,font',
                                                                                                                                 baseHref: protocolAndHost + '/ckeditor/ckeditor-4.x/rel/',
                                                                                                                                 customConfig: '/ckeditor/ckeditor-4.x/rel/sfdc-config.js',
                                                                                                                                 height: '450',
                                                                                                                                 bodyId: 'cpn4_rta_body',
                                                                                                                                 toolbar: 'Knowledge', /*SalesforceBasic,ServiceCommunity,HomePageComponent,EmailMultiFormat,Email,KnowledgeWithIframes,Knowledge*/
                                                                                                                                 sfdcLabels: { CkeMediaEmbed: { title: '嵌入多媒体内容', description: '使用 DailyMotion、Vimeo 和 Youtube 上的 <iframe&gt; 代码。', subtitle: '将 &amp;lt;iframe&amp;gt; 代码粘贴至此：', exampleTitle: '示例：', example: '\n\n<iframe width=\&quot;560\&quot; height=\&quot;315\&quot; src=\&quot;https://www.youtube.com/embed/KcOm0TNvKBA\&quot; frameborder=\&quot;0\&quot; allowfullscreen&gt;</iframe&gt;\n            \n        ', iframeMissing: '无效的 <iframe&gt; 元素。请使用已批准站点上的有效代码。' }, sfdcSwitchToText: { sfdcSwitchToTextAlt: '使用纯文本' }, CkeImageDialog: { uploadTab: '上载图像', infoTab_url: 'URL', error: '错误：', uploadTab_desc_info: '为视觉缺陷用户输入图像说明', uploadTab_desc: '描述', infoTab_url_info: '示例：http://www.mysite.com/myimage.jpg', btn_insert: '插入', defaultImageDescription: '用户添加的图片', missingUrlError: '必须输入一个 URL', uploadTab_file: '选择图像', infoTab_desc: '描述', btn_upadte: '更新', wrongFileTypeError: '您只能插入 .gif、.jpeg 和 .png 文件。', btn_update_tooltip: '更新图像', infoTab: 'Web 地址', btn_insert_tooltip: '插入图像', title: '插入图像', infoTab_desc_info: '为视觉缺陷用户输入图像说明', imageUploadLimit_info: '超过最大上载图像数', uploadTab_file_info: '最大大小 1 MB。仅限 png、gif 或 jpeg', btn_update: '更新' }, CkeImagePaste: { CkeImagePasteWarning: '粘贴图像无法在 Firefox 中正常使用，请用 [复制图像位置] 替代。'} },
                                                                                                                                 contentsCss: ['/ckeditor/ckeditor-4.x/rel/contents.css', '/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/CKEditor.css', '/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/HtmlDetailElem.css'],
                                                                                                                                 disableNativeSpellChecker: true,
                                                                                                                                 language: 'zh-cn',
                                                                                                                                 allowIframe: false,
                                                                                                                                 sharedSpaces: { top: 'cke_topSpace', bottom: ' cke_bottomSpace' },
                                                                                                                                 filebrowserImageUploadUrl: '/apps/CommandProcessor.ashx?cmd=RtaImageUpload'
                                                                                                                                 /*'/_ui/common/request/servlet/RtaImageUploadServlet'*/
                                                                                                                             });

                                                            </script>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_3_ep">
                                        <h3>移动栏目分类<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="cpn8">
                                                        <span class="requiredMark">*</span>标签</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <%=TagHTML%>
                                                    </div>
                                                </td>
                                                <td class="labelCol empty">&nbsp;
                                                </td>
                                                <td class="dataCol empty">&nbsp;
                                                </td>
                                            </tr>

                                        </table>
                                    </div>
                                       <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_4_ep">
                                        <h3>查看范围<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol empty">查看范围
                                                </td>
                                                <td class="data2Col" colspan="3">
                                                    <input type="checkbox" id="chkIsPublic" name="chkIsPublic" checked="checked" />所有人可以查看
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol empty" style="vertical-align: middle;">选择人员
                                                    <input type="hidden" id="readers" name="readers" value="<%=Readers%>"/>
                                                </td>
                                                <td class="peoplelist">
                                                    <ul>
                                                          <%=ContentReadersListHtml%>
                                                    </ul>
                                                    <div id="addpeople">
                                                        <img src="/img/images/Add.png">添加</div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_5_ep">
                                        <h3>图片新闻/手机APP封皮<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol">
                                                    <label for="mainImg">
                                                        图片新闻</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <%=CoverHTML%>
                                                    <input id="mainImg" name="mainImg[]" size="40" type="file" multiple="multiple" />
                                                </td>
                                                <td class="labelCol empty">&nbsp;
                                                </td>
                                                <td class="dataCol empty">&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">
                                                    <label for="coverDisplay">
                                                        图片（手机/首页）</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <select name="coverDisplay" id="coverDisplay">
                                                        <option value="">--选择--</option>
                                                        <option value="LeftTitle">标题左边</option>
                                                        <option value="RightTitle">标题右边</option>
                                                        <option value="BelowTitleBigImg">标题下面大图</option>
                                                        <option value="BelowGrid">标题下列表</option>
                                                        <option value="Carousel">标题下轮播</option>
                                                    </select><input type="checkbox" name="publishHome" id="publishHome" onclick="if(this.checked) {document.getElementById('coverDisplay').options[3].checked=true;}" />发送到首页展播
                                                </td>
                                                <td class="labelCol last empty">&nbsp;
                                                </td>
                                                <td class="dataCol last empty">&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="Div1">
                                        <h3>附件<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                     <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol">
                                                    <label for="mainImg">
                                                        附件</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div id="filelist">
                                                        <ul class="norellist"></ul>

                                                    </div>
                                                    <input id="attachFile" name="attachFile[]" size="40" type="file" multiple="multiple" />
                                                    <div id="addfile">
                                                        <img src="/img/images/Add.png" />添加</div>
                                                </td>
                                                <td class="labelCol empty">&nbsp;
                                                </td>
                                                <td class="dataCol empty">&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="pbBottomButtons">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;
                                            </td>
                                            <td class="pbButtonb" id="bottomButtonRow">
                                                <input value=" 保存发布 " class="btn" name="save" tabindex="14" title="保存发布" type="submit"   id="save_bottom" />
                                                <input value=" 保存并提交审核 " class="btn" title="保存并提交审核" name="save_approve" id="save_approve_bottom" type="submit" />                                                 
                                                <!--<input value=" 保存并新建 " class="btn" name="save_new" tabindex="15" title="保存并新建" type="submit" />-->
                                                
                                                <input value=" 取消 " class="btn" title="取消" name="cancel" type="submit" onclick="document.getElementById('cancelAction').value='1'" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg">
                                    </div>
                                </div>
                            </div>
                            <script>                            if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save","save_approve","save_new", "cancel"]); }</script>
                        </form>
                        <script type="text/javascript">
                            function delCoverImg(id)
                            {
                                deleteMediaImg(id,refImgContainer);
                            }
                            function refImgContainer(data)
                            {
                                window.location.reload();
                            }
                        </script>
                        <script type="text/javascript">
                                jQuery(document).ready(function () {
                                    jQuery("#folderPicker").change(function () {
                                        var id=$("#folderPicker").find("option:selected").val();
                                        onFolderChange(id);
                                    });
                               
                                });
                                function onFolderChange(id)
                                {
                                    ajaxMethodGetData('content.folder.approveright.check', {folderId:id},function(data){
                                        //console.log(data);
                                        if(data.status==1){
                                            if(data.needApprove==true)
                                            {
                                                //alert(124);
                                                document.getElementById("save_top").style.display="none";
                                                document.getElementById("save_approve_top").style.display="";

                                                document.getElementById("save_bottom").style.display="none";
                                                document.getElementById("save_approve_bottom").style.display="";
                                            }
                                            else
                                            {
                                                //alert(456);
                                                document.getElementById("save_approve_top").style.display="none";
                                                document.getElementById("save_top").style.display="";

                                                document.getElementById("save_approve_bottom").style.display="none";
                                                document.getElementById("save_bottom").style.display="";
                                            }
                                        }else{
                                            alert(data.meessage);
                                        }
                                    })
                                }
                        </script>
                        <script>                            picklist.initAll()</script>
                        <script>  
                            window.sfdcPage.appendToOnloadQueue(function () {
                                //DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Campaign&setupid=CampaignFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Campaign&retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&setupid=CampaignFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Campaign", "newUrl": "/01I/e?retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&setupid=Campaign", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&tableEnumOrId=Campaign&setupid=CampaignValidations", "newUrl": "/03d/e?retURL=%2F701%2Fo&TableEnumOrId=Campaign&Active=1&setupid=CampaignValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=Campaign&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=Campaign&et=QUICK_CREATE&retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3K/e?retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑布局", "hoverText": "自定义此页面布局", "url": "/layouteditor/layoutEditor.apexp?type=Campaign&lid=00h9000000RbNyc&retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&setupid=CampaignLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                //new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Fsection%253DDev_Tools%2526target%253Ddev_quick_access_menu.htm%2526loc%253Dhelp%2526language%253Dzh_CN%2526release%253D192.12.1%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo");
                            });</script>
                        <!-- Body events -->
                        <script type="text/javascript">                         
                            function bodyOnLoad() { new ForeignKeyInputElement("Parent", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "701" });
                                handleTextAreaElementChangeWithByteCheck('cpn4', 32000, 0, '剩余', '超出极限'); setFocusOnLoad();
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; 
                                Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); 
                                SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); 
                                new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                SfdcApp.MruHovers.global_data.url = 'retURL=%2F701%2Fe%3FretURL%3D%252F701%252Fo&isAjaxRequest=1&renderMode=RETRO&nocache=1416573429435';
                                if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
                                if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
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
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
       <script>
           ajaxMethodGetData('file.attachment.getlist', {id:getQueryString('id')},function(data){
               for (var i = 0; i < data.listData[0].length; i++) {
                   var res = data.listData[0][i]
                   var FileExtension = res.FileExtension
                   var imgsrc = '/img/filetype/Folder.png'
                   if (FileExtension == "xls" || FileExtension == "xlsx") {
                       imgsrc = "/img/filetype/xls.png"
                   }
                   else if (FileExtension == "docx" || FileExtension == "doc") {
                       imgsrc = "/img/filetype/doc.png"
                   }
                   else if (FileExtension == "zip") {
                       imgsrc = "/img/filetype/rar.png"
                   }
                   else if (FileExtension == "png" || FileExtension == "jpg") {
                       imgsrc = "/img/filetype/Image.png"
                   }
                   else if (FileExtension == "bmp" || FileExtension == "jpeg") {
                       imgsrc = "/img/filetype/Image.png"
                   }else if (FileExtension == "txt") {
                       imgsrc = "/img/filetype/Folder.png"
                   }
                   else if (FileExtension == "pdf") {
                       imgsrc = "/img/filetype/Pdf.png"
                   } else {
                       imgsrc = "/img/filetype/Folder.png"
                   }
                   //debugger
                   $('.norellist').append('<li fileid="'+res.Id+'">'
                                          +'    <img src="'+imgsrc+'">'
                                          +'    <span class="file-name">'+res.Name+'</span>'
                                          +'    <span class="file-delete">删除</span>'
                                          +'</li>')
    
               }
               $('.file-delete').click(function(){
                   debugger
                   var that = this
                   console.log($(that).parent().attr('fileid'))
                   if(confirm('确定要删除吗？')){
                       ajaxMethodGetData('file.attachment.delete', {id:$(that).parent().attr('fileid')},function(data){
                           if(data.status==1){
                               $(that).parent().remove()
                           }else{
                               alert('删除失败')
                           }
                       })
                   }
               })
           })
           $('#addfile').click(function(){
               $(this).before('<div><input style="margin-top:10px;" id="attachFile" name="attachFile[]" size="40" type="file" multiple="multiple"><img onclick="newfiledelete(this)" class="file-deleteimg" src="/img/cal/closegray.png"/></div>')
           })
           function newfiledelete(that){
               $(that).parent().remove()
           }
           $('#addpeople').click(function(){
               opencenterwindow('/_ui/common/data/invite_UserLookResult.html', '', 1150, 600)
           })
           function invitepeople(ids, names) {
               var oldids = []
               var oldnames = []
               $('.peoplelist ul li').each(function(){
                   oldids.push($(this).attr('peopleid'))
                   oldnames.push($(this).attr('peoplename'))
               })
               for (var i = 0; i < oldids.length; i++) {
                   for (var j = 0; j < ids.length; j++) {
                       if(oldids[i]==ids[j]){
                           ids.splice(j,1)
                           names.splice(j,1)
                       }
                   }
               }
               if(oldids.length>0){
                   $('#readers').val(oldids.join(',')+','+ids.join(','))
               }else{
                   $('#readers').val(ids.join(','))
               }
            
               for (var i = 0; i < ids.length; i++) {
                   var id = ids[i]
                   var name = names[i]
                   $(".peoplelist ul").append('<li peoplename="'+name+'" class="people" peopleid="' + id + '"><div><img class="peopleimg" src="/img/images/430.png" /></div>' + name + '<img class="peopledeleteimg" src="/img/images/02.Close_.png"/></li>')
               }
               $(".people img").click(function(){
                   $(this).parent().remove()
                   var ids = [] 
                   $('.people').each(function () {
                       ids.push($(this).attr('peopleid'))
                   })
                   $('#readers').val(ids.join(','))
               })
           }
           $(".people img").click(function(){
               $(this).parent().remove()
               var ids = [] 
               $('.people').each(function () {
                   ids.push($(this).attr('peopleid'))
               })
               $('#readers').val(ids.join(','))
           })
    </script>
</body>
</html>
<!-- page generation time: 115ms -->
