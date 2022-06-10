<%@ Page Language="C#" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<html style="" class="  ext-strict">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>批量传阅</title>
    <meta content="NO-CACHE" http-equiv="PRAGMA">
    <!--<script src="/EXT/ext-3.3.3/ext-core.js"></script>-->
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script>
        window.sfdcPage = new GenericSfdcPage();
        //window.sfdcPage = new EditPage(null);
        UserContext.initialize({ "networkId": "", "labelLastModified": "1416425598000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterExtended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/HelpBubble.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/userEditContactInfo.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css">
    <link type="text/css" rel="stylesheet" href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <script src="/jslibrary/sfdc/hr.js"></script>
    <script>        //ClientHash.prototype.needsClientHash('sid_Client','000000390Wh0000000yvHG','114.111.166.78','/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcore%2Fuserprofile%2FContactInfoEditPage%3Fu%3D0059000000390Wh%26focus%3Demail');</script>
    <style>
         .label.active {
            background-color: #f2f2f2;
            color: #0094ff !important;
        }

        .checkboxlabel.active {
            background-color: #f2f2f2;
            color: #0094ff !important;
        }

        .checkbox-group-label {
            width: 14% !important;
            float: left !important;
        }

        #addpeople {
            width: 15px;
            cursor: pointer;
            float: left;
            margin-right: 5px;
            margin-left: 5px;
            margin-top: 8px;
        }

        .morepeople {
            font-size: 12px;
        }

        .addpeople {
            float: left;
            font-size: 12px;
            /*margin-left: 5px;*/
            cursor: pointer;
            /*margin-left: 35px;*/
        }

            .addpeople > span {
                margin-top: 8px;
                float: left;
            }

        .checkbox-group {
            float: left;
            border: 1px solid #dedede;
            padding: 5px;
            height: 150px;
            overflow-y: auto;
            width: 80%;
            /*margin-left: 35px;*/
            float: left;
            margin-top: 10px;
        }

        .checkboxlabel input {
            margin-right: 5px;
        }

        #nextActivityContainer {
            width: 350px;
        }

            #nextActivityContainer > div {
                float: left;
            }

        .checkbox-group > div:hover {
            background-color: #f2f2f2;
        }

        .search-input {
            float: left;
            border: 1px solid #dedede;
            height: 28px;
        }

            .search-input input {
                border: 0;
                outline: none;
                height: 26px;
                text-indent: 5px;
            }
        .periodElementGroup {
            display:inline-block;
            vertical-align: middle;
        }
        .zen .zen-skinnyForm .label {
            display:inline-block;
            
        }
        #forwardProcess{
            width:600px!important;
        }
        .ft_14{
          font-size:14px!important;
        }
    </style>
</head>
<body onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif userTab  ContactInfoEditPage  ext-gecko ext-gecko3" onload="if(this.bodyOnLoad)bodyOnLoad();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onunload="if(this.bodyOnUnload)bodyOnUnload();">
    <!-- Main Body Starts Here -->
    <script>chatter.getToolbox().setToken('');</script>
    <script>
        Sfdc.onload(function () {
            // Max length handler
            /*
            Sfdc.each(Sfdc.select('.input-max-length'), function (el) {
                var maxLength = el.getAttribute('data-maxLength');
                var errorText = el.getAttribute('data-errorMessage');
                Sfdc.on(el, 'keyup', function () {
                    chatter.getToolbox().validateTextFieldLength(el, {
                        maxlength: maxLength,
                        msg: errorText
                    });
                });
            });
            */

            //var curMonth = d.getMonth() + 1;

            //jQuery("#startSalMonth").val(curMonth);
            //jQuery("#endSalMonth").val(curMonth);

            //debugger;
            SfdcCmp.init(document.body);

            SfdcCmp.onBind(Sfdc.get("TabPanel"), function (event) {
                // debugger;
                //this.selectTab(Sfdc.get(contactTab));
            });


        });

        function closeDialog(refreshParent) {
            if (window.opener) {
                window.opener.closeDialog(refreshParent);
            } else {
                window.parent.closeDialog(refreshParent);
            }
        }

        function resizeOverlay(height, width) {
            var handle = window.opener ? window.opener : window.parent;
            handle.resizeDialog(height, width);
            // debugger;
            jQuery("#deptContainer").height(height - 20);
        }

        function validateAndSave() {
            /*
            var newEmailValue = document.getElementById("email").value.toLowerCase();
            if (newEmailValue != ""
                && newEmailValue != "jackliu185@sina.com".toLowerCase()) {
                if (confirm('为确保系统安全，新电子邮件地址的所有人必须验证此更改。\n\n当单击\"确定\"时，将向指定地址发送一封电子邮件，其中包含确认此更改的指导。\n\n如果您不想进行此更改，则请单击\"取消\"。')) {
                    trackActivityInOmniture('profile-info-edit');
                    document.forms['formname'].submit();
                }
            } else {
                trackActivityInOmniture('profile-info-edit');
                document.forms['formname'].submit();
            }
            */
            //var newValue = document.getElementById("startDate").value;
            //if (newValue == "") {
            //    alert("排班开始日期不能为空！");
            //    return false;
            //}
            //newValue = document.getElementById("endDate").value;
            //if (newValue == "") {
            //    alert("排班结束日期不能为空！");
            //    return false;
            //}

            //排班人必须选
            //saveAllSelected([document.editPage.duel_select_0, document.editPage.duel_select_1], [document.editPage.duel0, document.editPage.duel1], ',', '\\', '--无--');
            //saveAllSelected([document.editPage.shift_select_0, document.editPage.shift_select_1], [document.editPage.shift0, document.editPage.shift1], ',', '\\', '--无--');

            //var duel1Items = document.getElementById("duel1").value;
            //if (duel1Items == "") {
            //    alert("被传阅人不能为空！");
            //    return false;
            //}
            var participator = "";//document.getElementById("duel1").value;
            participator = getChecklistValues("participator");
            var newArr = participator.split(',');
            var temp = [];
            for (var i = 0; i < newArr.length; i++) {
                temp.push('U:'+newArr[i])
            }
            participator = temp.join(',');
            console.log(participator)
            //传阅
            var wfUrl = "/WFPageProcessor.ashx?cmd=wf.instance.forward";
            jQuery.ajax({
                url: wfUrl,
                cache: false,
                async: false,
                dataType: "json",
                data: {
                    ids: document.getElementById("ids").value,
                    processInstanceId: document.getElementById("ids").value,
                    userids: participator,
                    message: document.getElementById("message").value
                },
                type: "POST",
                success: function (data) {
                    alert("传阅完毕");
                    closeDialog(false);
                },
                error: function (request, textStatus, errorThrown) {

                }
            });
            document.getElementById("saveAs").value = "1";
            //document.forms['editPage'].submit();
        }

        function focusInput() {
            var element = document.getElementById('email');
            if (element && isTabPanelElementVisible(element)) {
                element.focus();
                return;
            }
            var elements = document.getElementsByTagName('input');
            for (var i = 0; (elements[i] != null) ; i++) {
                var elementType = elements[i].type;
                if (elementType && elementType.indexOf('hidden') == -1 && isTabPanelElementVisible(elements[i])) {
                    elements[i].focus();
                    return;
                }
            }
        }

        function isTabPanelElementVisible(el) {
            if (el.className.search("hidden") >= 0 || el.parentNode.tagName.toLowerCase() == 'body') {
                return false;
            }
            return el.className.search("zen-current") >= 0 || isTabPanelElementVisible(el.parentNode);
        }

        function switchType(d) {
            var t = document.getElementById("sharing_search");
            if (t.value == "R") {
                //getDepartmentEmployees(fillEmployeeList, d)
                ajaxMethodGetData("sys.group.search", {}, fillGroupList);
            }
            if (t.value == "U") {
                deptChange(d);
            }
        }
        function fillGroupList(data) {
            var arrData = new Array();
            var allowAdded = true;
            var sele = document.getElementById("duel_select_0");
            jQuery('#duel_select_0').find('option').remove();
            //var type = jQuery('#sharing_search').val();

            if (data) {
                var listData = data.listData;
                var type = "R";
                for (var i = 0; i < listData.length; i++) {
                    var item = listData[i];
                    var deptName = "";

                    sele.add(new Option('组：' + item.Name + '(' + item.Quantity + ')', type + ':' + item.GroupId));
                    // sele.add(new Option('用户：' + item.name + ' ' + deptName, item.id));
                    //['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, '']
                    if (allowAdded) {
                        var data2 = [type, '组：' + item.Name, type + ':' + item.GroupId, item.Name, existingSelduel_select_0, ''];
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
    <div class="zen">
        <div data-sfdc-widget="SfdcCmp.Ui.Tabs" id="TabPanel" class="zen-box zen-tabs zen-simpleTabs" data-uidsfdc="21">
            <div class="zen-inner">
                <div class="zen-header">
                    <ul role="tablist" class="zen-tabControl">
                        <li id="aboutTab" role="presentation" data-uidsfdc="19" class="zen-current">
                            <a tabindex="-1" aria-selected="false" aria-controls="TabPanel:0:Body:1" role="tab" href="javascript:void(0);">传阅
                            </a>
                        </li>
                        <%--<li id="contactTab" role="presentation" data-uidsfdc="20" class="">
                            <a tabindex="0" aria-selected="false" aria-controls="TabPanel:0:Body:2" role="tab" href="javascript:void(0);">留言
                            </a>
                        </li>--%>
                    </ul>
                </div>
                <div class="zen-body"  style="width: 600px!important;">
                    <form method="post" action="/apps/wf/forwardProcess.aspx" name="editPage" id="editPage" class="zen-form zen-labelMedium zen-skinnyForm"
                        onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }">
                        <input type="hidden" value="" name="token">
                        <input type="hidden" value="<%=Request["retURL"]%>" name="retURL" id="retURL">
                        <input id="ids" type="hidden" value="<%=Request["ids"]%>" name="ids" />
                        <input id="shift1" type="hidden" value="" name="shift1" />
                        <input id="objectTypeCode" type="hidden" value="<%=Request["objectTypeCode"]%>" name="objectTypeCode" />
                        <input id="saveAs" type="hidden" value="" name="saveAs">
                        <input id="duel0" type="hidden" value="" name="duel0">
                        <input id="duel1" type="hidden" value="" name="duel1">
                        <ul role="presentation" class="zen-tabBody" style="width: 600px;">
                            <li id="TabPanel:0:Body:1" aria-expanded="false" role="tabpanel" class="zen-current">
                                <div class="zen-line zen-mtm">
                                    <div class="zen-lastUnit zen-unit field_communityNickname">
                                        <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                            <tbody>

                                                <%--<tr class="detailRow">
                                                    <td colspan="5">&nbsp;
                                                        <table>
                                                              
                                                            <tr>
                                                                <td>
                                                                    <div style="display: inline-block;">
                                                                        <label for="aboutMe" class="zen-label">当前节点：</label>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div id="stepName"></div>
                                                                </td>
                                                            </tr>
                                                            <tr id="tranContainer">
                                                                <td>
                                                                    <div style="display: inline-block;">
                                                                        <label for="aboutMe" class="zen-label">下一环节：</label>
                                                                    </div>
                                                                </td>
                                                                <td nowrap="nowrap">
                                                                    <div style="display: block; margin: 5px 0;" id="n" class="periodElementGroup">
                                                                        <div style="display: inline-block;" id="nextActivityContainer">
                                                                            <select id="backactivity1" name="backactivity" style="height: 25px;">
                                                                            </select><div style="font-size: 12px; display: inline-block; margin-left: 5px; color: blue;">请选择退回节点！</div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>--%>
                                                <tr id="peopleContainer">
                                                    <td nowrap="nowrap">
                                                        <div style="float: left;">
                                                            <label class="checkbox-group-label" for="aboutMe" class="zen-label ft_14" style="font-size:14px;">办理人员：</label>
                                                        </div>
                                                        <div style="float: left;">
                                                            <div class="addpeople">
                                                                <div class="search-input">
                                                                    <input type="text" value="" placeholder="请输入搜索字符" id="srchPeople" name="srchPeople" onblur="searchInnerPeople(this.value)" />
                                                                </div>
                                                                <img id="addpeople" src="/img/cal/add.png" alt="添加办理人员" />
                                                                <span>添加人员</span>
                                                            </div>
                                                            <div style="clear:both;">
                                                                <label style="display:inline-block"><input id="allchecky" type="checkbox"/>全选</label>
                                                                <label style="display:inline-block"><input id="allcheckn" type="checkbox"/>反选</label>
                                                            </div>
                                                            <div class="checkbox-group" id="participatorContainer">
                                                                <div class="checkboxlabel">
                                                                    <%--<label>
                                                                        <input type="checkbox" value="" />
                                                                    </label>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                     <td colspan="4" style="vertical-align: top;display:none;" id="tipsMessage">
                                                         <div style="color:red;font-weight:bold;">当前已是最后节点，确认结束,点【提交完成】。</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="overflow:hidden;padding:20px 0;">
                                                        <p class="label ft_14" style="width:93.32px;float:left;font-weight:bold;">留言：</p>
                                                        <div class="textarea" style="float:left;">
                                                           <textarea cols="70" rows="80" name="message" maxlength="80" id="message" style="width: 300px; height: 100px;"></textarea>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr style="vertical-align: top;">
                                                    <td colspan="4" style="vertical-align: top">
                                                        <table class="layout">
                                                            <%-- <tr>
                                                                <td style="height: 5px;"></td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td class="labelCol">
                                                                    <label for="cpn4" class="ft_14" style="width:93.32px;margin-right:0;font-size:14px;">
                                                                        提醒方式</label>
                                                                </td>
                                                                <td class="dataCol col02">
                                                                    <input type="checkbox" id="noticeMessage" name="noticeMessage" checked="checked" />系统消息
                                                                        <input type="checkbox" id="noticeSms" name="noticeSms"  checked="checked"  />手机短信
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                            <tbody>
                                                <!--
                                                <tr class="detailRow">
                                                    <td colspan="5">&nbsp;</td>
                                                </tr>-->
                                            </tbody>
                                        </table>

                                        <script type="text/javascript">
                                            var duel_select_0Var = new SelectFilterElement("sharing_search", "U", "duel_select_0", "", "duel_select_1", 100, true, null);

                                            var existingSelduel_select_0 = document.getElementById('duel_select_1');
                                            //duel_select_0Var.addOptions(false, []);
                                            duel_select_0Var.addOptions(false, [<%%>]);
                                            if (existingSelduel_select_0 && existingSelduel_select_0.options && existingSelduel_select_0.options.length == 0) {
                                                existingSelduel_select_0.options[0] = new Option('--无--', '');
                                            }
                                        </script>


                                    </div>
                                </div>
                            </li>
                            <li id="TabPanel:0:Body:2" aria-expanded="false" role="tabpanel" class="">
                                <table>
                                    <tr style="height: 10px;">
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap">
                                            <label for="aboutMe" class="zen-label">留言</label>
                                        </td>
                                        <td colspan="3">
                                            <textarea cols="70" rows="80" name="message" maxlength="80" id="message" style="width: 400px; height: 300px;"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                        <div class="net-buttons zen-mtl">
                            <input type="button" value="保    存" name="save" class="zen-btn zen-primaryBtn zen-pas" onclick="javascript: validateAndSave();">
                            <input type="button" value="关    闭" class="zen-btn zen-pas" onclick="javascript: closeDialog(false);" id="editContactInfoCancelButton">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="datePicker" class="datePicker" style="display: none; left: 272px; top: 316px;">
        <div class="dateBar">
            <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();" onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
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
            </select><img title="下月" onmouseover="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';" onfocus="this.className = 'calRightOn';" onclick="DatePicker.datePicker.nextMonth();" onblur="this.className = 'calRight';" class="calRight" alt="下月" src="/s.gif"><select title="年" name="calYearPicker" id="calYearPicker"><option value="2015">2015</option>
                <option value="2016">2016</option>
                <option value="2017">2017</option>
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
            </select>
        </div>
        <div class="calBody">
            <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                <tbody>
                    <tr>
                        <th scope="col" class="dayOfWeek">星期日</th>
                        <th scope="col" class="dayOfWeek">星期一</th>
                        <th scope="col" class="dayOfWeek">星期二</th>
                        <th scope="col" class="dayOfWeek">星期三</th>
                        <th scope="col" class="dayOfWeek">星期四</th>
                        <th scope="col" class="dayOfWeek">星期五</th>
                        <th scope="col" class="dayOfWeek">星期六</th>
                    </tr>
                    <tr id="calRow1" class="calRow">
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend prevMonth">28</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday prevMonth">29</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">1</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">2</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">3</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">4</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">5</td>
                    </tr>
                    <tr id="calRow2" class="calRow">
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">6</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">7</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">8</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">9</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">10</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">11</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">12</td>
                    </tr>
                    <tr id="calRow3" class="calRow">
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">13</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">14</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">15</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">16</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">17</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">18</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">19</td>
                    </tr>
                    <tr id="calRow4" class="calRow">
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">20</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">21</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">22</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">23</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">24</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">25</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">26</td>
                    </tr>
                    <tr id="calRow5" class="calRow">
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend">27</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">28</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">29</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday">30</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday todayDate">31</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekday nextMonth">1</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);" class="weekend nextMonth">2</td>
                    </tr>
                    <tr id="calRow6" class="calRow" style="display: none;">
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                        <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            <div class="buttonBar"><a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday" href="javascript:%20void%280%29%3B">今天</a></div>
        </div>
    </div>
    <script>
        // displayNoteBelowCompanyField(document.getElementById("companyName"));
        // setTimeout("focusInput();", 10);
        function searchInnerPeople(search) {
            $('.checkbox-group>div').hide();
            $('.checkbox-group>div').each(function () {
                var label = $(this).find('label').text();
                if (label.indexOf(search) != -1) {
                    $(this).show();
                }
            })
        }
        $('#addpeople').next().click(function () {
            var iWidth = '1000';
            var iHeight = '500';
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
            window.open('/alert/addpeople/addpeople.html', 'newwindow', 'height=' + iHeight + 'px, width=' + iWidth + 'px, top=' + iTop + ', left=' + iLeft + ', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')
        })
        //选择的人员id
        var ids = '';
        function getcheckedpeople(ids) {
            //console.log(ids)
            for (var i = 0; i < ids.length; i++) {
                $('.checkbox-group').append('<div class="checkboxlabel"><label><input name="participator" type="checkbox" checked="checked" value="' + ids[i].valueId + '">' + ids[i].name + " (" + ids[i].EmployeeId + ") " + ids[i].BusinessUnitIdName + '</label></div>')
            }
        }
    </script>
    <!-- Body events -->
    <script type="text/javascript">function bodyOnLoad() {
    if ((typeof duel_select_0Var != 'undefined') && (typeof duel_select_0Var.init != 'undefined')) { duel_select_0Var.init(); };
    //if ((typeof shift_select_0Var != 'undefined') && (typeof shift_select_0Var.init != 'undefined')) { shift_select_0Var.init(); };
    setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
} function bodyOnBeforeUnload() { } function bodyOnFocus() { closePopup(); focusInput(); } function bodyOnUnload() { closePopup(); focusInput(); }</script>
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>
