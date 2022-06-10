var wfUrl = "/WFPageProcessor.ashx";

function saveProcessScheme() {
    var id = jQuery("#txtflowId").val();
    var scheme1 = getFlowLayout();

    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: true,
        /*scriptCharset: "utf-8",*/
        dataType: "json",
        data: {
            cmd: "savescheme",
            id: id,
            scheme: scheme1
        },
        type: "POST",
        success: function (data) {
            window.location = "/apps/wf/ProcessDetail.aspx?t=121&id=" + id;
            //jQuery("#retURL").val();
        },
        error: function (request, textStatus, errorThrown) {

        }
    });
}

function closeProcessSchemeDesigner() {
    var procId = jQuery("#txtflowId").val();
    window.location = '/apps/wf/ProcessDetail.aspx?t=121&id=' + procId;
}
function getWFStep(code1, callbackRenderForm) {
    funProcessId = jQuery("#txtflowId").val();
    var date = new Date();
    var r=date.getTime();
    var url1 = "/WFPageProcessor.ashx?cmd=getactivity&processid=" + funProcessId + "&code=" + code1+"&r="+r;
    var req = new mxXmlRequest(url1, null, 'GET', false);
    req.send();
    var rData = req.getText();
    //var stepData = eval("(" + rData + ")");
    return rData;
    
    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: false,
        dataType: "json",
        data: {
            cmd: "getactivity",
            processid: funProcessId,
            code: code1
        },
        type: "GET",
        success: function (data) {
            // callbackRenderForm(data);            
            //{"stepCode":50000000008,"participantor":{"participantorTypeCode":,,"mSelectType":1,"mValue":"","jSelectType":1,"jPeopleType":1,"jValue":"1"}}
           //jQuery("#field_deadline").val();
            jQuery("#participantor_lkid").val(data.participantor.mValue);
            jQuery("#participantor").val(data.participantor.mPeopleName);
           
            if (data.isCollaboration)
                jQuery("#chkCollaboration").attr("checked", true);
                        
            if (data.defaultSelectParticipator)
                document.getElementById("chkDefaultSelectParticipator").checked = true;
            
            if (data.ccNotHandleParticipator)
                document.getElementById("chkCcNotHandleParticipator").checked = true;

            jQuery("#stepTypeCode").val(data.stepTypeCode);
            //jQuery('input[name=mSelectType]:checked').val();
            //jQuery("input[name='participantorTypeCode'][value='" + data.participantor.participantorTypeCode + "']").attr("checked", true);
            //jQuery("input[name='mSelectType'][value='" + data.participantor.mSelectType + "']").attr("checked", true);
            //jQuery("input[name='jSelectType'][value='" + data.participantor.jSelectType + "']").attr("checked", true);
            //jQuery("input[name='jPeopleType'][value='" + data.participantor.jPeopleType + "']").attr("checked", true);
            //jQuery('input[name=participantorTypeCode]:checked').val();
            //jQuery('input[name=JSelectType]:checked').val();
            //jQuery('input[name=JPeopleType]:checked').val();
        },
        error: function (request, textStatus, errorThrown) {
            
        }
    });
}
/*
Get Step rights
*/
function getWFStepRights(procId, stepId, renderCallback) {
    var url = "/WFPageProcessor.ashx?cmd=getsteppri";
    jQuery.ajax({
        type: "GET",
        url: url,
        async: true,
        cache: false,
        dataType: "json",
        data: {
            processId: procId,
            stepId: stepId
        },
        error: function (request, textStatus, errorThrown) {
           // debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;
            renderCallback(data);
        }

    });
}
/*
Get participantors of step
*/
function getStepPossibleParticipantors(procId, stepId, procInstanceId, ruleLogId, callbackRenderForm, sessionKey) {
    //getstepparticipantor
    //funProcessId = jQuery("#id").val();
    var ssKey = "";
    if (sessionKey)
    {
        ssKey = sessionKey;
    }
    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: true,
        dataType: "json",
        data: {
            cmd: "process.step.participator.getlist",//new
            //cmd: "getstepparticipantor",//old
            procId: procId,
            processId: procId,
            procInstanceId: procInstanceId,
            processInstanceId:procInstanceId,
            stepId: stepId,
            ruleLogId: ruleLogId,
            sessionKey: ssKey
        },
        type: "GET",
        success: function (data) {
            if (callbackRenderForm)
                callbackRenderForm(data);
        },
        error: function (request, textStatus, errorThrown) {
           //debugger;
        }
    });
}
/*
获取节点的可能下一环节
*/
function getStepPossibleTransitions(procId, stepId, procInstanceId, callbackRenderForm, sessionKey, ruleLogId) {
    //getstepparticipantor
    //funProcessId = jQuery("#id").val();
    var ssKey = "";
    if (sessionKey) {
        ssKey = sessionKey;
    }
    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: true,
        dataType: "json",
        data: {
            cmd: "wf.step.transition",
            procId: procId,
            processId: procId,
            stepId: stepId,
            procInstanceId: procInstanceId,
            ruleLogId:"",
            sessionKey: ssKey
        },
        type: "GET",
        success: function (data) {
            callbackRenderForm(data);
        },
        error: function (request, textStatus, errorThrown) {
            //debugger;
        }
    });
}
/*get all steps of process*/
function getAllSteps(procId,procInstanceId, callbackRenderForm)
{

    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: false,
        dataType: "json",
        data: {
            cmd: "getallsteps",
            procId: procId,
           /*stepId: stepId,*/
            procInstanceId: procInstanceId
        },
        type: "GET",
        success: function (data) {
            // debugger;
            callbackRenderForm(data);

        },
        error: function (request, textStatus, errorThrown) {
            //debugger;
        }
    });
}
/*获取所有执行过的步骤*/
function getPreviousSteps(procId, procInstanceId, curstepId,callbackRenderForm) {

    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: false,
        dataType: "json",
        data: {
            cmd: "getprevioussteps",
            procId: procId,
            stepId: curstepId,
            procInstanceId: procInstanceId
        },
        type: "GET",
        success: function (data) {
            // debugger;
            callbackRenderForm(data);

        },
        error: function (request, textStatus, errorThrown) {
            //debugger;
        }
    });
}
/*
获取当前环节的 上一环节
如果是并行，显示所有
*/
function getPreviousSteps2(procId, procInstanceId, curstepId, callbackRenderForm) {

    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: false,
        dataType: "json",
        data: {
            cmd: "wf.step.previous",
            procId: procId,
            processid: procId,
            currentactivity: curstepId,
            stepid: curstepId,
            procInstanceId: procInstanceId
        },
        type: "GET",
        success: function (data) {
            // debugger;
            callbackRenderForm(data);
        },
        error: function (request, textStatus, errorThrown) {
            //debugger;
        }
    });
}
//通知传阅
/*
procInstanceId,
members -- 传阅人,
msg,bySms,bySysMsg
*/
function wfNotifyRead(procInstanceId,members,msg,bySms,bySysMsg)
{
    jQuery.ajax({
        url: wfUrl,
        cache: false,
        async: false,
        dataType: "json",
        data: {
            cmd: "wfnotifyread",
            processInstanceId: procInstanceId,           
            zhihuiInfo:encodeURIComponent(msg),
            zhihuiMember_lkid: members,
            zhihuiChannel1:  bySysMsg,
            zhihuiChannel2: bySms
        },
        type: "GET",
        success: function (data) {
            // debugger;
            //callbackRenderForm(data);
            alert("传阅完成");
        },
        error: function (request, textStatus, errorThrown) {
            //debugger;
        }
    });
}
function forwardProcess(ids) {
    //var unitId = jQuery("#unitId").val();
    //var unitName = jQuery("#unitName").val();
    //var attendYear = jQuery("#yearNumber").val();
    //var attendMonth = jQuery("#monthNumber").val();
    var url1 = '/apps/wf/forwardProcess.aspx?ids=' + ids;//'+ "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth;
    //url1 += "&retURL=%2fa0Q%2fo";
    showDialog(url1, "forwardProcess", "批量传阅", 860, 550);
}
function approveReject1(ids) {
    //var unitId = jQuery("#unitId").val();
    //var unitName = jQuery("#unitName").val();
    //var attendYear = jQuery("#yearNumber").val();
    //var attendMonth = jQuery("#monthNumber").val();
    var url1 = '/apps/wf/forwardProcess.aspx?ids=' + ids;//'+ "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth;
    //url1 += "&retURL=%2fa0Q%2fo";
    showDialog(url1, "forwardProcess", "批量传阅", 860, 550);
}
var funProcessId = "";
function saveWFStep2(cellId) {
    //debugger
    var deadline1 = jQuery("#field_deadline").val();
    var mPeopleName = jQuery("#participantor").val();
    var mPeopleId = jQuery("#participantor_lkid").val();
    //var mSelectType = $('input[name=mSelectType]:checked').val();
    //var participantorTypeCode = $('input[name=participantorTypeCode]:checked').val();
    //var jSelectType = $('input[name=jSelectType]:checked').val();
    //var jPeopleType = $('input[name=jPeopleType]:checked').val();
    var sType = jQuery("#splitType").val();
    var jType = jQuery("#joinType").val();
    var stepTypeCode= jQuery("#stepTypeCode").val();
    var numberOfJoinVotes = 0;
    
    var orderOfCollaboration = false;
    var isCollaboration = false;
    if (document.getElementById("chkCollaboration").checked)
        isCollaboration = true;

    numberOfJoinVotes = jQuery("#numberofJoinvotes").val();

    if (document.getElementById("orderOfCollaboration").checked)
        orderOfCollaboration = true;

    orderOfExecution = jQuery("#txtOrderOfExecution").val();
    var defaultSelectParticipator = false;
    if (document.getElementById("chkDefaultSelectParticipator").checked)
        defaultSelectParticipator = true;

    var ccNotHandleParticipator = false;
    if (document.getElementById("chkCcNotHandleParticipator").checked)
        ccNotHandleParticipator = true;
    //过滤已经在本节点执行过的人
    var removeExecutedParticipator = false;
    if (document.getElementById("removeExecutedParticipator").checked)
        removeExecutedParticipator = true;

    var stepData = {
        code: cellId,
        stepTypeCode: stepTypeCode,
        deadline: deadline1,
        mValue: mPeopleId,
        mPeopleName: mPeopleName,
        mFilterPeopleType: 0,
        isCollaboration: isCollaboration,
        orderOfCollaboration:orderOfCollaboration,
        splitType:sType,
        joinType: jType,
        numberOfJoinVotes: numberOfJoinVotes,
        orderOfExecution: orderOfExecution,
        defaultSelectParticipator: defaultSelectParticipator,
        ccNotHandleParticipator: ccNotHandleParticipator,
        removeExecutedParticipator: removeExecutedParticipator
        //participantorTypeCode: participantorTypeCode,
        //mSelectType: mSelectType,
        //jSelectType: jSelectType,
        //jPeopleType: jPeopleType
    };
    saveWFStep(stepData);
}
function saveWFStep(data1, callbackRenderForm) {
    funProcessId = jQuery("#txtflowId").val();
    var wfUrl1 =wfUrl+ "?cmd=savestep&processid=" + funProcessId;
    jQuery.ajax({
        url: wfUrl1,
        cache: false,
        async: false,
        type: "json",
        data:data1,
        /*
        data: {
            cmd: "savestep",
            stepcode: code
        },*/
        type: "POST",
        success: function (data) {
            if (callbackRenderForm)
                callbackRenderForm(data);
        },
        error: function (request, textStatus, errorThrown) {

        }
    });
}
function setParticipator(nameField, idField, nameValue, idValue) {
    jQuery("#" + nameField).val(nameValue);
    jQuery("#" + idField).val(idValue);
}
function peopleLookupPick(a, b, c, d, e, f, g, k) {
    //document.getElementById(b).value = e;
    // document.getElementById(c).value = f;
    // debugger;
    jQuery("#" + b).val(e);
    jQuery("#" + c).val(f);
}
var currentStepId = 0;
var currentRuleId = 0;
function getAutoCode(type1,radId) {
    //debugger;
    //2 step,3 rule
    if (currentStepId == 0) {
        var nextStepCode = document.getElementById("nextStepCode").value;
        currentStepId = (nextStepCode * 1);
    }
    if (currentRuleId == 0) {
        var nextRuleCode = document.getElementById("nextRuleCode").value;
        currentRuleId = (nextRuleCode * 1);
    }
    if (type1 == 2) {
        currentStepId = currentStepId + 1;
        return currentStepId;
    }
    if (type1 == 3) {
        currentRuleId = currentRuleId + 1;
        return currentRuleId;
    }
//    var processCode1 = document.getElementById("processCode").value;
//    if (radId <= 1) {
//        var newCode = processCode1 + radId;
//        return newCode;
//    }
//    else {
//        var newCode1 = (radId * 1) + 1;
//        return newCode1;
//    }

    var url1 = "/WFPageProcessor.ashx?cmd=getAutoCode&type=" + type1;
    /*    
    var req = new mxXmlRequest(url1, null, 'GET', false);
    req.send();
    return req.getText();
    */
    jQuery.ajax({
        url: url1,
        cache: false,
        async: false,
        dataType: "text",
        type: "GET",
        success: function (data) {
            //debugger;
            alert(data);
            return data;
        },
        error: function (request, textStatus, errorThrown) {
        }
    });
}
function getWfInstanceAndInitAndNext(callbackRenderForm) {
    var processId = jQuery("#id").val();
    var url1 = "/WFPageProcessor.ashx?cmd=getwfinstanceinitandnext&id=" + processId + "&stepid=";
    //var req = new mxXmlRequest(url1, null, 'GET', false);
    //req.send();
    //return req.getText();
    
    jQuery.ajax({
        url: url1,
        cache: false,
        async: false,
        dataType: "json",        
        type: "GET",
        success: function (data) {
             callbackRenderForm(data);
            // debugger;
            //{"stepCode":50000000008,"participantor":{"participantorTypeCode":,,"mSelectType":1,"mValue":"","jSelectType":1,"jPeopleType":1,"jValue":"1"}}
            //jQuery("#field_deadline").val();
            //jQuery("#txtparticipantors").val(data.participantor.mValue);
            //jQuery('input[name=mSelectType]:checked').val();
            //jQuery("input[name='participantorTypeCode'][value='" + data.participantor.participantorTypeCode + "']").attr("checked", true);
            //jQuery("input[name='mSelectType'][value='" + data.participantor.mSelectType + "']").attr("checked", true);
            //jQuery("input[name='jSelectType'][value='" + data.participantor.jSelectType + "']").attr("checked", true);
            //jQuery("input[name='jPeopleType'][value='" + data.participantor.jPeopleType + "']").attr("checked", true);
            //jQuery('input[name=participantorTypeCode]:checked').val();
            //jQuery('input[name=JSelectType]:checked').val();
            //jQuery('input[name=JPeopleType]:checked').val();
        },
        error: function (request, textStatus, errorThrown) {

        }
    });
}
var dialogs = {};
function showCustomDialog(url, dialogName, dialogTitle, height, width) {
    var c = b = null;
    c = dialogName; // "notifyInstance";
    //debugger;
    b = url;
    var dialog = null;
    //var dialog = new CollaborationAccessibleDialog(c, '催办', b, 450, 530);
    if (!dialogs[c]) {
        dialog = new NonaccessibleDialog(c, dialogTitle, b, height, width); //CollaborationAccessibleDialog
        dialogs[c] = dialog;
    }
    else {
        dialog = dialogs[c];
        dialog.url = b;
    }
    dialog.display();
}
function showConditionEditor(ruleCode,fromStepCode,toStepCode) {
    var procId = jQuery("#txtflowId").val();
    //showCustomDialog("/apps/wf/ProcRuleCondition.aspx?ruleCode=" + ruleCode + "&processId=" + procId, "showCondition", "设置条件", 500, 780);
    
    $('#iframe').show().attr('src', '/alert/wf/ProcRuleCondition.html?ProcessId=' + procId + '&RuleCode=' + ruleCode);
    $('.popup-mask').show();
}
/**/
function ActivityProperty(properties) {
    if (properties != null && typeof (properties) != 'undefined') {
        this.xmlProperties = properties;
        this.deserialize();
    }
};
//节点类型
ActivityProperty.prototype.stepTypeCode = 0;

ActivityProperty.prototype.xmlProperties = "";

ActivityProperty.prototype.condition = "";

ActivityProperty.prototype.participantors = "";

ActivityProperty.prototype.allowTextEditor = true;

ActivityProperty.prototype.allowAttachEditor = true;

ActivityProperty.prototype.allowBackPrevious = true;

ActivityProperty.prototype.allowCancel = true;
//协作节点
ActivityProperty.prototype.isCollaboration = false;

ActivityProperty.prototype.joinType = "and";

ActivityProperty.prototype.splitType = "or";
//汇聚需要票数
ActivityProperty.prototype.numberofJoinvotes = 0;
ActivityProperty.prototype.orderOfCollaboration = 0;

ActivityProperty.prototype.serialize = function () {

};
ActivityProperty.prototype.deserialize = function () {
    //activityProperties;
    var arrProperties = this.xmlProperties.split("|");
    for (var i = 0; i < arrProperties.length; i++) {
        var prop = arrProperties[i];
        var temp = prop.split(":");
        var propName = temp[0];
        var propValue = temp[1];

        if (propName == "participantors") {
            this.participantors = propValue;
        }
        if (propName == "allowTextEditor") {
            this.allowTextEditor = (propValue == "true" ? true : false);
        }
        if (propName == "allowAttachEditor") {
            this.allowAttachEditor = (propValue == "true" ? true : false);
        }
        if (propName == "allowBackPrevious") {
            this.allowBackPrevious = (propValue == "true" ? true : false);
        }
        if (propName == "allowCancel") {
            this.allowCancel = (propValue == "true" ? true : false);
        }
    }
    //xmlProperties.
};   

function doSubmitNextDone()
{
    //validate 
    saveFormData(0);//保存表单
    var isSelectParticipator = false;
    var isSelectNextActivities = false;
    $("input[id^='participator_']:checked").each(function (i, elment) {
        var i = 0;
        //var check = $(this).attr("checked");
        //if (check) {
            isSelectParticipator = true;
            //break;
       // }
    });

    $("input[name='nextActivity']:checked").each(function (i, elment) {
        var i = 0;
        //var check = $(this).attr("checked");
        //if (check) {
        isSelectNextActivities = true;
        //break;
        // }
    });
    if (!isSelectParticipator || !isSelectNextActivities)
    {
        alert("请至少选择一个提交节点步骤与节点的执行人!");
        return;
    }
    var url1 = "/WFPageProcessor.ashx?cmd=executeactivity&action=1";
    jQuery("#nextstep_picker_save_btn").attr("disabled", "disabled");
    jQuery.ajax({
        url: url1,
        cache: false,
        async: false,
        dataType: "json",
        type: "POST",
        data: jQuery("#editPage").serialize(),
        /*{
            jQuery("#editPage").serialize()
            instanceId: jQuery("#instanceId").val(),
            ruleLogId: jQuery("#ruleLogId").val(),
            curStepId: jQuery("#stepId").val(),
            action:1,
            nextActivity: jQuery("input[name='nextActivity']").val()
        }*/
        success: function (data) {
            //debugger;
            //alert(data);
            //return data;
            window.location = "/a0M/o";
        },
        error: function (request, textStatus, errorThrown) {
            jQuery("#nextstep_picker_save_btn").removeAttr("disabled");
        }
    });
}
/*
finish instance
*/
function finishWF(instanceId,stepid,ruleLogId,callback) {
    var url1 = "/ui/wf/instance/finish?instanceId="+instanceId+"&stepid="+stepid+"&ruleLogId="+ruleLogId;
   
    jQuery.ajax({
        url: url1,
        cache: false,
        async: false,
        dataType: "json",
        type: "GET",
        //data: jQuery("#editPage").serialize(),
       
        success: function (data) {
            //debugger;
            //alert(data);
            //return data;
            //window.location = "/a0M/o";
            callback(data)
        },
        error: function (request, textStatus, errorThrown) {
            //jQuery("#nextstep_picker_save_btn").removeAttr("disabled");
        }
    });
}
function showParticipantor(procId, stepId, stepCode) {
    if (procId == "")
        procId = jQuery("#txtflowId").val();
    //openPopupFocusEscapePounds('/_ui/common/data/PeoplePicker.aspx?lkfm=editPage&lknm=participantor&lktp=' + selectPeopleValue, 'PeoplePicker', 1024, 780, 'width=760,height=630,resizable=yes,toolbar=no,status=no,scrollbars=yes,menubar=no,directories=no,location=yes,dependant=no', false, false);
    $('#iframe').show().attr('src', '/_ui/common/data/wflowPeoplePicker.html?ProcessId=' + procId + '&StepId=' + stepId + '&StepCode=' + stepCode)
    $('.popup-mask').show();
}
/*
加签
*/
function addStepParticipator(InstanceId, ProcessId, stepId, currentStepName, ruleLogId) {

    if (InstanceId == undefined || InstanceId == "") {
        InstanceId = jQuery("#instanceId").val();
    }
    if (stepId == undefined || stepId == "") {
        ProcessId = jQuery("#_processId").val();
    }
    if (stepId == undefined || stepId == "") {
        stepId = jQuery("#stepId").val();
    }
    if (currentStepName == undefined || currentStepName == "") {
        currentStepName = jQuery("#currentStepName").val();
    }
    if (ruleLogId == undefined || ruleLogId == "") {
        ruleLogId = jQuery("#ruleLogId").val();
    }

    //$('#iframe').show().attr('src', '/wfinstance/data/AddStepParticipator.aspx?ProcessInstanceId=' + processInstanceId + '&StepId=' + stepId + '&RuleLogId=' + ruleLogId)
    //$('.popup-mask').show();
    showDialog('/wfinstance/modal/AddStepParticipator.aspx?InstanceId=' + InstanceId + '&ProcessId=' + ProcessId + '&StepId=' + stepId + '&currentStepName=' + currentStepName + '&RuleLogId=' + ruleLogId + "&retURL=/a0M/detail", 'AddStepParticipator', '加签', 580, 460)
}