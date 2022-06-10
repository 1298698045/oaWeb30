<%@ Page Language="C#" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<html style="" class="  ext-strict">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>审批拒绝</title>
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
    <script type="text/javascript" src="/apps/flowdesigner/editors/js/workflow.js?cache=1130"></script>
    <script>        //ClientHash.prototype.needsClientHash('sid_Client','000000390Wh0000000yvHG','114.111.166.78','/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcore%2Fuserprofile%2FContactInfoEditPage%3Fu%3D0059000000390Wh%26focus%3Demail');</script>
    <style>
        #peopleContainer{
            display:none;
        }
         .checkbox-group {
            float: left;
            border: 1px solid #dedede;
            padding: 5px;
            height: 200px;
            overflow-y: auto;
            width: 80%;
            margin-left: 0px;
            float: left;
            margin-top: 10px;
        }

        .checkboxlabel input {
            margin-right: 5px;
        }
        .checkbox-group > div:hover {
            background-color: #f2f2f2;
        }
        #participatorContainer{
            min-width:200px;
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

            //排班人必须选
            saveAllSelected([document.editPage.duel_select_0, document.editPage.duel_select_1], [document.editPage.duel0, document.editPage.duel1], ',', '\\', '--无--');
            //saveAllSelected([document.editPage.shift_select_0, document.editPage.shift_select_1], [document.editPage.shift0, document.editPage.shift1], ',', '\\', '--无--');

            //var duel1Items = document.getElementById("memo").value;
            //if (duel1Items == "") {
            //    alert("请填写备注！");
            //    return false;
            //}
            var toStepId = "";
            var isPre = document.getElementById("instActionBackPre").checked;
            var isBackStep = document.getElementById("instActionBack").checked;
            var method = "wf.activity.backprestep";
            var bachValue = $(':radio[name="instAction"]:checked').val();
            if (bachValue=="b") {
                //isPre || 
                toStepId = document.getElementById("backActivity1").value;
                if (toStepId == "") {
                    alert("请选择退回节点！");
                    return false;
                }
                method = "wf.activity.backstep";
            }
            else if (bachValue=="p")  //退回上一节点
            {
                method = "wf.activity.backprestep";
            }
            else if (bachValue == "s") {
                //退回发起人
                method = "wf.activity.backstart";
            }
                

            var stepId = document.getElementById("fromStepId").value;
            
            //传阅
            var wfUrl = "/WFPageProcessor.ashx?cmd="+method;
            jQuery.ajax({
                url: wfUrl,
                cache: false,
                async: false,
                dataType: "json",
                data: {
                    instanceId: document.getElementById("procInstanceId").value,
                    ruleLogId: document.getElementById("ruleLogId").value,
                    fromStepId: stepId,
                    toStepId: toStepId,
                    memo: document.getElementById("memo").value
                },
                type: "POST",
                success: function (data) {
                   // alert("办理完毕!");
                    //closeDialog(true);
                    parent.location = "/wfinstance/wftasklst.aspx?gridid=wfrulelog&t=a0M";
                },
                error: function (request, textStatus, errorThrown) {

                }
            });
            document.getElementById("saveAs").value = "1";
            //document.forms['editPage'].submit();
        }

        function focusInput() {

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
            //jQuery('#duel_select_0').find('option').remove();
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
    <script type="text/javascript">
        jQuery(document).ready(function () {
            initNextStepInfo();
            $('#backActivity1').change(function () {
                var procId = jQuery("#processId").val();
                var procInstanceId = jQuery("#procInstanceId").val();
                var stepId = $(this).val();
                processstepactualparticipatorgetlist(procId, stepId, procInstanceId, fillUsers);
            })
        });

        function initNextStepInfo() {
            var procId = jQuery("#processId").val();
            var procInstanceId = jQuery("#procInstanceId").val();
            var stepId = "";
            var nextActivity = jQuery("#nextActivity").val();
            if (nextActivity != "" && nextActivity != null) {
                stepId = nextActivity.substr(37, 36);
                getStepPossibleParticipantors(procId, stepId, procInstanceId, fillUsers);
            }
            else {
                //最后一步
                // document.getElementById("btnSaveTop").value = " 提交完成 ";
                // document.getElementById("btnSaveBottom").value = " 提交完成 ";
            }
            adjustInstanceAction('p');//加载退回到上一步
            //debugger;
            var currentStepId = jQuery("#fromStepId").val();
            getWFStepRights(procId, currentStepId, setStepRight);
        }
        function processstepactualparticipatorgetlist(procId, stepId, procInstanceId, callback) {
            ajaxMethodGetData('process.step.actualparticipator.getlist', {
                procId: procId,
                processId: procId,
                procInstanceId: procInstanceId,
                processInstanceId: procInstanceId,
                stepId: stepId,
            }, callback)
        }
        function setStepRight(data) {
            if (data != null) {
                //2_4_8_16退回权限_终止权限_跳转权限_撤销回到发起人
                //instActionNext instActionJump instActionBack instActionTerminate instActionCancel
               // debugger;
                var flowRights = data.flowRight.split('_');
                if (flowRights[0] == "0") {
                    jQuery("#instActionBack").attr("disabled", "disabled");
                    jQuery("#backActivity1").attr("disabled", "disabled");
                }
                else {
                    jQuery("#instActionBack").removeAttr("disabled");
                    //jQuery("#backActivity1").removeAttr("disabled");
                }
                // document.getElementById("procPriv_2").checked = true;
                if (flowRights[1] == "0")
                    jQuery("#instActionTerminate").attr("disabled", "disabled");
                // document.getElementById("procPriv_4").checked = true;
                if (flowRights[2] == "0")
                    jQuery("#instActionJump").attr("disabled", "disabled");
                //document.getElementById("procPriv_8").checked = true;
                if (flowRights[3] == "0") //退回到发起人
                {
                    jQuery("#instActionBackStart").attr("disabled", "disabled");
                }
                else {
                    jQuery("#instActionBackStart").removeAttr("disabled");

                }
                if (flowRights[4]) {
                    if (flowRights[4] == "0")
                        jQuery("#instActionFinish").attr("disabled", "disabled");
                }
                else {
                    jQuery("#instActionFinish").attr("disabled", "disabled");
                }
                if (flowRights.length >= 6) {
                    if (flowRights[5] != "1")  //show addPeople Button                                            
                        $("#addPeople").hide();
                }
            }
        }
        function fillUsers(data) {
            var sC = 0;
            var aC = 0;
            //debugger;
            var length = 0;
            if (data) {
                if (data.participators) {
                    length = data.participators.length;
                }
            }
            else {

                return;
            }

            if (data.Deadline != "0")
                jQuery("#cpn11").val(data.Deadline);
            var html1 = "";
            for (var c = 0; c < length; c++) {
                var item = data.participators[c];
                //duel_reports_select_0
                //dule111.options[c] = new Option(item.userName, item.userId);
                if (item.selected) {
                    //document.getElementById("duel_reports_select_1").options[sC] = new Option(item.userName, item.userId);                                        
                    //jQuery("#duel_select_1").append('<option value="' + item.userId + '"  selected=\"selected\">' + item.userName + ' ' + item.BusinessUnitIdName + '</option>');
                    html1 += "<div class=\"checkboxlabel\"><label><input name=\"participator\" type=\"checkbox\" value='" + item.userId + "' checked='checked' >" + item.userName + ' / ' + item.BusinessUnitIdName + "</label></div>";
                    sC++;
                }
                else {
                    //document.getElementById("duel_reports_select_0").options[aC] = new Option(item.userName, item.userId);
                    //jQuery("#duel_select_0").append('<option value="' + item.userId + '"  selected=\"selected\">' + item.userName + ' ' + item.BusinessUnitIdName + '</option>');
                    html1 += "<div class=\"checkboxlabel\"><label><input name=\"participator\" type=\"checkbox\" value='" + item.userId + "' >" + item.userName + ' / ' + item.BusinessUnitIdName + "</label></div>";
                    aC++;
                }
            }
            //alert(html1);
            jQuery("#participatorContainer").html(html1);
        }
        function adjustInstanceAction(a) {
            jQuery("#peopleContainer").hide();
            var b = "njtbf";
            if (a == "n")//选下一步时候，自动刷新
            {
                clearPeoples();
                initNextStepInfo();//
                //jQuery("#participatorContainer").show();
            }
            if (a == "p")
            {
                //到上一环节
                jQuery("#backActivity1").attr("disabled", "disabled");
                jQuery("#containBackActivity").hide();
            }
            if (a == "s") {
                //发起人
                jQuery("#backActivity1").attr("disabled", "disabled");
                jQuery("#containBackActivity").hide();
            }
            if (a == "b") {
                //指定环节
                jQuery("#backActivity1").removeAttr("disabled");
                jQuery("#containBackActivity").show();
                jQuery("#peopleContainer").show();
                
            }
            if (a == "b" || a == "f" || a == "p")//获取退回步骤的执行人
            {
                $("#b").show();
                if (a == "b" || a == "p")//指定节点
                {
                    //jQuery("#participatorContainer").show();
                    var procId = jQuery("#processId").val();
                    var procInstanceId = jQuery("#procInstanceId").val();
                    var currStepId = jQuery("#fromStepId").val();
                    //load activity
                    //if (document.getElementById("backActivity1").options.length <= 0) {
                    if (a == "b") {
                        getPreviousSteps(procId, procInstanceId, currStepId, renderBackSteps);
                        var stepId = $('#backActivity1').val();
                        processstepactualparticipatorgetlist(procId, stepId, procInstanceId, fillUsers);
                    }
                    if (a == "p")
                        getPreviousSteps2(procId, procInstanceId, currStepId, renderBackSteps);
                }
                else {
                    
                    jQuery("#participatorContainer").hide();
                }
            }
            if (a == "s")
            {
                $("#b").hide();
            }
            if (a == "j")//跳转重新加载办理人员
            {
                clearPeoples();
                //jQuery("#participatorContainer").show();
                var procId = jQuery("#processId").val();
                var procInstanceId = jQuery("#procInstanceId").val();

                if (document.getElementById("jumpActivity1").options.length <= 0)
                    getAllSteps(procId, procInstanceId, renderJumpSteps);
            }
            //debugger;
            for (i = 0; i < b.length; i++) {
                var ele = document.getElementById(b.charAt(i));
                //if (ele)
                //    b.charAt(i) == a.charAt(0) ? ele.style.display = "" : ele.style.display = "none";
            }
        }
        function renderBackSteps(data) {
            if (data) {
                //debugger;
                //document.getElementById("backActivity1").options.clear();
                document.getElementById("backActivity1").options.length = 0;
                document.getElementById("backActivity1").options.add(new Option('--请选择--', ''));
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    //var userId = ids[c1].substring(2);
                    document.getElementById("backActivity1").options.add(new Option(item.text, item.id));
                }
                var length = document.getElementById("backActivity1").options.length;
                if (length == 2)
                    document.getElementById("backActivity1").options[1].selected = true;
            }
        }
        function renderJumpSteps(data) {
            if (data) {
                //debugger;
                document.getElementById("jumpActivity1").options.add(new Option('--请选择--', ''));
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    //var userId = ids[c1].substring(2);
                    document.getElementById("jumpActivity1").options.add(new Option(item.text, item.id));

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
                            <a tabindex="-1" aria-selected="false" aria-controls="TabPanel:0:Body:1" role="tab" href="javascript:void(0);">审批拒绝
                            </a>
                        </li>
                        <%--<li id="contactTab" role="presentation" data-uidsfdc="20" class="">
                            <a tabindex="0" aria-selected="false" aria-controls="TabPanel:0:Body:2" role="tab" href="javascript:void(0);">留言
                            </a>
                        </li>--%>
                    </ul>
                </div>
                <div class="zen-body">
                    <form method="post" action="/apps/wf/ApproveReject.aspx" name="editPage" id="editPage" class="zen-form zen-labelMedium zen-skinnyForm"
                        onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }">
                        <input type="hidden" value="<%=Request["retURL"]%>" name="retURL" id="retURL">
                        <input id="processId" type="hidden" value="<%=Request["processId"]%>" name="processId" />
                        <input id="procInstanceId" type="hidden" value="<%=Request["instanceId"]%>" name="procInstanceId" />
                        <input type="hidden" id="nextActivity" name="nextActivity" value="" />
                        <input type="hidden" id="ruleLogId" name="ruleLogId" value="<%=Request["ruleLogId"]%>" />
                        <input id="fromStepId" type="hidden" name="fromStepId" value="<%=Request["stepId"]%>" />
                        <input id="saveAs" type="hidden" value="" name="saveAs">
                        <input id="duel0" type="hidden" value="" name="duel0">
                        <input id="duel1" type="hidden" value="" name="duel1">
                        <ul role="presentation" class="zen-tabBody" style="width: 600px;">
                            <li id="TabPanel:0:Body:1" aria-expanded="false" role="tabpanel" class="zen-current">
                                <div class="zen-line zen-mtm">
                                    <div class="zen-lastUnit zen-unit field_communityNickname">
                                        <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                            <tbody>

                                                <tr class="detailRow">
                                                    <td colspan="5">&nbsp;
                                                        <table>
                                                            <tr align="top">
                                                                <td nowrap="nowrap">
                                                                    <label for="aboutMe" class="zen-label">退回类型：</label></td>
                                                                <td>
                                                                    <div style="display: block;">
                                                                        <div style="display: inline-block;">
                                                                            <input type="radio" value="p" onclick="adjustInstanceAction('p');" name="instAction" checked="checked"
                                                                                id="instActionBackPre" /><label for="rectypeftm" style="display: inline-block;" onclick="document.getElementById('instActionBackPre').checked=true;adjustInstanceAction('p');">退回上一环节</label>
                                                                        </div>
                                                                        <div style="display: inline-block;align:center;">
                                                                            <input type="radio" value="s" onclick="adjustInstanceAction('s');" name="instAction"
                                                                                id="instActionBackStart" /><label for="rectypeftm" style="display: inline-block;" > 退回发起人</label>
                                                                        </div>
                                                                        <div style="display: inline-block;">
                                                                            <input type="radio" value="b" onclick="adjustInstanceAction('b');" name="instAction" disabled="disabled"
                                                                                id="instActionBack" /><label for="rectypeftm" style="display: inline-block;" >退回指定节点</label>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr id="containBackActivity">
                                                                <td>
                                                                    <div style="display: inline-block;">
                                                                    <label for="aboutMe" class="zen-label">退回节点：</label></div>
                                                                </td>
                                                                <td nowrap="nowrap">
                                                                    <div style="display:block; margin: 5px;" id="b" class="periodElementGroup">
                                                                        <div style="display: inline-block;" >
                                                                            <select id="backActivity1" name="backActivity" style="height: 25px;"  disabled="disabled">
                                                                            </select><div style="font-size:12px;display: inline-block;margin-left:5px;color:blue;">请选择退回节点！</div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr id="peopleContainer">
                                                                <td nowrap="nowrap" style="vertical-align:top;">
                                                                    <div style="float: left;">
                                                                        <label class="checkbox-group-label" for="aboutMe" class="zen-label">办理人员：</label>
                                                                    </div>
                                                                </td>
                                                                <td nowrap="nowrap" style="padding-bottom:10px;">
                                                                    <div style="float: left;">
                                                                        <div class="checkbox-group" id="participatorContainer">
                                                                            <div class="checkboxlabel">
                                                                                <label>
                                                                                    <input type="checkbox" value="" />
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="participatorContainer2" style="vertical-align: top;display:none">
                                                    <td nowrap="nowrap">
                                                        <label for="aboutMe" class="zen-label">办理人员：</label></td>
                                                   
                                                </tr>
                                                <tr id="participatorContainer1" class="last detailRow" style="vertical-align: top;display:none">
                                                    <td colspan="4" style="vertical-align: top">
                                                        <table>
                                                            <tr>
                                                                <td style="vertical-align: top" nowrap="nowrap">类型：&nbsp;<select title="小组类型" onchange="switchType()" name="sharing_search" id="sharing_search">
                                                                    <option selected="selected" value="U">按用户</option>
                                                                    <option value="R">小组</option>
                                                                </select>&nbsp;&nbsp;
                                                        <div id="deptContainer" class="pbSubsection" style="overflow-y: yes; width: 120px; height: 350px; overflow: auto; display: block; margin-left: 0px;">
                                                            <br />
                                                            <div class='treeNode' id="treeRootNode">
                                                            </div>
                                                        </div>
                                                                    <script type="text/javascript">
                                                                        $('#allchecky').click(function () {
                                                                            if ($(this).prop('checked') == true) {
                                                                                $('#participatorContainer input[type="checkbox"]').prop('checked', 'checked')
                                                                            } else {
                                                                                $('#participatorContainer input[type="checkbox"]').prop('checked', '')
                                                                            }
                                                                        })
                                                                        $('#allcheckn').click(function () {
                                                                            $('#participatorContainer input[type="checkbox"]').each(function () {
                                                                                if ($(this).prop('checked') == true) {
                                                                                    $(this).prop('checked', '')
                                                                                } else {
                                                                                    $(this).prop('checked', 'checked')
                                                                                }
                                                                            })

                                                                        })

                                                                        jQuery(document).ready(function () {
                                                                            //debugger

                                                                            var Tree = Ext.tree;
                                                                            var tree = new Tree.TreePanel({
                                                                                rootVisible: !1,
                                                                                useArrows: true,
                                                                                autoScroll: true,
                                                                                animate: false,
                                                                                enableDD: true,
                                                                                containerScroll: true,
                                                                                border: false,
                                                                                // auto create TreeLoader
                                                                                dataUrl: '/apps/CommandProcessor.ashx?cmd=getdeptchildren',
                                                                                root: {
                                                                                    nodeType: 'async',
                                                                                    text: '组织',
                                                                                    draggable: false,
                                                                                    id: 'src'
                                                                                }
                                                                            });
                                                                            tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
                                                                            // render the tree
                                                                            tree.render('treeRootNode');
                                                                            tree.getRootNode().expand();

                                                                        });
                                                                        function treeSelectionChange(a, b) {
                                                                            var deptId = a.selNode.id;
                                                                            //alert(deptId);
                                                                            deptChange(deptId);
                                                                        }
                                                                        function searchEmps() {
                                                                            // debugger;
                                                                            var sel = document.getElementById("sharing_search");
                                                                            //if (sel.value == "U") {
                                                                            var srchText = jQuery("#searchValue_sharing_search").val();
                                                                            if (srchText != "") {
                                                                                searchAllEmps(fillUserList, srchText);
                                                                            }
                                                                            //}
                                                                            //else {
                                                                            //    duel_select_0Var.doSearch();                                                                        
                                                                            //}
                                                                        }
                                                                        function deptChange(d) {
                                                                            var t = document.getElementById("sharing_search");
                                                                            //if (t.value == "U" || t.value == "B") {
                                                                            getDepartmentUsers(fillUserList, d);
                                                                            //}
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
                                                                                    var deptName = "";
                                                                                    //if (item.BusinessUnitIdName)
                                                                                    //    deptName = item.BusinessUnitIdName;

                                                                                    sele.add(new Option('用户：' + item.name + ' ' + deptName, type + ':' + item.id));
                                                                                    // sele.add(new Option('用户：' + item.name + ' ' + deptName, item.id));
                                                                                    //['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, '']
                                                                                    if (allowAdded) {

                                                                                        var data2 = [type, '用户：' + item.name, type + ':' + item.id, item.name + ' ' + deptName, existingSelduel_select_0, ''];
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
                                                                </td>
                                                                <td>
                                                                    <div id="duel" class="duelingListBox">
                                                                        <div style="display: none" id="editPage_duel_errorMsg" class="errorMsg">&nbsp;</div>
                                                                        <div>
                                                                            <label for="sharing_search"></label>
                                                                            搜索：<input type="text" size="20" onpropertychange="duel_select_0Var.handlePropertyChange();" onkeydown="return duel_select_0Var.handleKeyDown(event);" name="searchValue_sharing_search" maxlength="80" id="searchValue_sharing_search">&nbsp;<input type="button" title="查找" onclick=" searchEmps();" name="go_duel_select_0" id="go_duel_select_0Var" class="btn" value=" 查找 "><br>
                                                                            <div id="error_duel_select_0" class="errorMsg" style="visibility: hidden;"></div>
                                                                        </div>
                                                                        <table class="layout">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="selectCell">
                                                                                        <div class="selectTitle">
                                                                                            <label for="duel_select_0">可用成员</label>
                                                                                        </div>
                                                                                        <select size="11" name="duel_select_0" multiple="multiple" id="duel_select_0" style="height: 295px; width: 270px;" ondblclick="selectItems()">
                                                                                        </select>
                                                                                        <script>
                                                                                            function selectItems() {
                                                                                                //debugger;
                                                                                                if (!document.getElementById('duel_select_0').disabled && !document.getElementById('duel_select_1').disabled) {
                                                                                                    duel_select_0Var.beforeMoveRight();;
                                                                                                    window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1, '--无--', [], null, '--无--', false, null, 'editPage_duel_errorMsg');
                                                                                                }
                                                                                            }
                                                                                            function removeItems() {
                                                                                                if (!document.getElementById('duel_select_0').disabled && !document.getElementById('duel_select_1').disabled) { window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0, '--无--', [], null, '--无--', false, null, 'editPage_duel_errorMsg'); duel_select_0Var.moveLeft(); }
                                                                                            }
                                                                                        </script>
                                                                                    </td>
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
                                                                                            <label for="duel_select_1">组所选成员</label>
                                                                                        </div>
                                                                                        <select size="11" name="duel_select_1" multiple="multiple" id="duel_select_1" style="height: 295px; width: 270px;" ondblclick="removeItems()">
                                                                                        </select></td>
                                                                                    <td class="zen-phs buttonCell">
                                                                                        <div class="text">
                                                                                            向上
                                                                                        </div>
                                                                                        <div class="zen-mbs text">
                                                                                            <a id="duel_select_1_up" href="javascript:window.editPage_DLBEInstance.instMoveUp(document.editPage.duel_select_1, 'NAME', null, '排班对象无法删除，并且必须是被排班的人。','editPage_duel_errorMsg');">
                                                                                                <img title="向上" class="upArrowIcon" alt="向上" src="/s.gif"></a>
                                                                                        </div>
                                                                                        <div class="text">
                                                                                            <a id="duel_select_1_down" href="javascript:window.editPage_DLBEInstance.instMoveDown(document.editPage.duel_select_1, 'NAME', null, '排班对象无法删除，并且必须是被排班的人。','editPage_duel_errorMsg');">
                                                                                                <img title="向下" class="downArrowIcon" alt="向下" src="/s.gif"></a>
                                                                                        </div>
                                                                                        <div class="text">
                                                                                            向下
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                        <script>window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_select_0', 'duel_select_1'], 'editPage_duel_errorMsg');</script>
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr style="vertical-align: top;margin-top:5px;">
                                                    <td nowrap="nowrap">
                                                        <label for="aboutMe" class="zen-label">留&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;言：</label>
                                                    </td>
                                                    <td colspan="4" style="vertical-align: top">
                                                        <table class="layout">
                                                            <tr>
                                                                <td colspan="3">
                                                                    <textarea cols="80" rows="10" name="memo" id="memo"  maxlength="80"style="width: 400px; height: 200px;"></textarea>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <script type="text/javascript">
                                            var duel_select_0Var = new SelectFilterElement("sharing_search", "U", "duel_select_0", "", "duel_select_1", 100, true, null);

                                            var existingSelduel_select_0 = document.getElementById('duel_select_1');
                                            //duel_select_0Var.addOptions(false, []);
                                            duel_select_0Var.addOptions(false, [<%%>]);
                                            if (existingSelduel_select_0.options.length == 0) {
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
                                </table>
                            </li>
                        </ul>
                        <div class="net-buttons zen-mtl">
                            <input type="button" value=" 提交拒绝 " name="save" class="zen-btn zen-primaryBtn zen-pas" onclick="javascript: validateAndSave();">
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
