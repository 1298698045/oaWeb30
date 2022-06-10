var dialogs = {};
function showInstanceDialog(url, dialogName, dialogTitle, width, height) {
    var c = b = null;
    c = dialogName;// "notifyInstance";
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
function confirmCancelWF(id) {
    //if ((Modal.confirm && Modal.confirm('是否收回该发文吗？')) || (!Modal.confirm && window.confirm('是否收回该发文吗？')))
    //{
    //    return true;
    //}
    //a || (a = LC.getLabel("Global", "are_you_sure"));
    //a || (a = '是否撤销收回该流程吗？撤销后进入退件箱，可以进行删除。');
    //return Modal.confirm(a)

    layer.confirm('是否撤销收回该流程吗？撤销后进入退件箱，可以进行删除。', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        layer.close(index)
    }, function () {
        layer.close(index);
    });
}
function confirmFinishWF(id) {
    //if ((Modal.confirm && Modal.confirm('是否收回该发文吗？')) || (!Modal.confirm && window.confirm('是否收回该发文吗？')))
    //{
    //    return true;
    //}
    //a || (a = LC.getLabel("Global", "are_you_sure"));
    //a || (a = '是否结束该事务吗？结束后，流程标记已完成');
    //return Modal.confirm(a)

    layer.confirm('是否结束该事务吗？结束后，流程标记已完成', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        layer.close(index)
    }, function () {
        location.href = '/WFPageProcessor.ashx?cmd=finishwfinstance2&amp;id=" + rowId + "&retURL=%2f122%2fo';
        layer.close(index);
    });
}
function reminderInstance(instanceId) {
    var c = b = null;
    c = "notifyInstance";
    b = "/apps/wf/NotifyMem.aspx?InstanceId=" + instanceId;
    //var dialog = new NonaccessibleDialog(c, '提醒', b, 450, 530); //CollaborationAccessibleDialog
    var dialog = new CollaborationAccessibleDialog(c, '催办', b, 530, 450);
    dialog.display();
}
function forwardProcess(ids) {
    //var unitId = jQuery("#unitId").val();
    //var unitName = jQuery("#unitName").val();
    //var attendYear = jQuery("#yearNumber").val();
    //var attendMonth = jQuery("#monthNumber").val();
    var url1 = '/apps/wf/forwardProcess.aspx?ids=' + ids + "&retURL=/122/o";
    //url1 += "&retURL=%2fa0Q%2fo";
    showDialog(url1, "forwardProcess", "批量传阅", 860, 550);
    //var c = "forwardProcess";
    //var dialog = new CollaborationAccessibleDialog(c, '批量传阅', url1, 530, 450);
    //dialog.display();
}
function jumpProcess(id, ProcessId,fromActivityId)
{
    showDialog('/apps/wf/InstanceJumpStep.aspx?InstanceId=' + id + "&ProcessId=" + ProcessId + "&fromActivityId=" + fromActivityId + "&retURL=/122/o", 'instanceJumpStep', '跳转', 580, 480)
}
function insertProcess(id, ProcessId) {
    showDialog('/apps/wf/InstanceInsertApprove.aspx?InstanceId=' + id + "&ProcessId=" + ProcessId + "&retURL=/122/o", 'instanceInsertApprove', '加签', 580, 500)
}
function transferAgentProcess(id) {
    showDialog('/apps/wf/InstanceTranAgent.aspx?InstanceId=' + id + "&retURL=/122/o", 'instanceTranAgent', '委派', 580, 480)
}
function confirmDelete2(a, id, enityType) {
    //a || (a = '你確定要进行删除嗎？');
    //var con = Modal.confirm(a)
    //if (con) {
    //    //@@delete action
    //    var url = "/apps/CommandProcessor.ashx?cmd=delwfinstance&id=" + id + "&type=" + enityType;
    //    jQuery.ajax({
    //        async: false, cache: false, dataType: "json",
    //        error: function (request, textStatus, errorThrown) {
    //        },
    //        success: function (data, textStatus) {
    //            //CampaignManageMembersTab.query();
    //            reloadPage();
    //        },
    //        type: "POST",
    //        url: url
    //    });
    //}
    //return false;

    parent.layer.confirm('你確定要进行删除吗？', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        parent.layer.close(index)
    }, function () {
        var url = "/apps/CommandProcessor.ashx?cmd=delwfinstance&id=" + id + "&type=" + enityType;
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            error: function (request, textStatus, errorThrown) {
            },
            success: function (data, textStatus) {
                //CampaignManageMembersTab.query();
                reloadPage();
                getinstancecount();
                parent.layer.close(index);
            },
            type: "POST",
            url: url
        });
    });
}

/*增加目录权限*/
function addInstanceAccess(entityId, objType, objectId, rightCode, callback) {
    var cmd = "wf.instance.access.add";
    var url1 = "/WFPageProcessor.ashx?cmd=" + cmd;
    url1 += "&entityId=" + entityId;
    //url1 += "&objectType=" + objType;
    url1 += "&objectId=" + objectId;
    url1 += "&rightCode=" + rightCode;
    jQuery.ajax({
        async: true, cache: false, dataType: "json", error: function (request, textStatus, errorThrown) { errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]); },
        success: function (data, textStatus) {
            if (callback) {
                callback(data);
            }
        },
        type: "POST",
        url: url1
    });
}
function updateInstanceAccess(id, rightCode, callback) {
    var cmd = "wf.instance.access.update";
    var url1 = "/WFPageProcessor.ashx?cmd=" + cmd;
    url1 += "&id=" + id;
    //url1 += "&objectType=" + objType;
    // url1 += "&objectId=" + objectId;
    url1 += "&rightCode=" + rightCode;
    jQuery.ajax({
        async: true, cache: false, dataType: "json", error: function (request, textStatus, errorThrown) { errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]); },
        success: function (data, textStatus) {
            //debugger;
            //renderCallback(data);
            //if (data.status == "success") {
            callback(data);
            //}
            //else {

            //}
        },
        type: "POST",
        url: url1
    });
}

function getRelatedWFinstances(entityId,  callback) {
    var cmd = "wfinstance.related.getlist";
    var url1 = "/WFPageProcessor.ashx?cmd=" + cmd;
    url1 += "&id=" + entityId;
    //url1 += "&objectType=" + objType;
    //url1 += "&objectId=" + objectId;
    //url1 += "&rightCode=" + rightCode;
    jQuery.ajax({
        async: true, cache: false, dataType: "json", error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
           // messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            if (callback) {
                callback(data);
            }
        },
        type: "GET",
        url: url1
    });
}

function addParticipator(s) {
    //$("#activityParticipator" + s).append();
}



function Processcancel(id) {
    parent.layer.confirm('是否收回该事务吗？收回后进入草稿箱，可以进行删除', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        parent.layer.close(index)
    }, function () {
        var url = "/WFPageProcessor.ashx?cmd=wf.runtime.rehandle&instanceId=" + id;
        //url += queryString;
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            // data: d,
            error: function (request, textStatus, errorThrown) {
                errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            },
            success: function (data, textStatus) {
                $('#datagrid').datagrid('reload')
                parent.layer.close(index)
            },
            type: "POST",
            url: url
        });
    });
}
function Processcircularize(ids) {
    var url1 = '/apps/wf/forwardProcess.aspx?ids=' + ids;
    parent.showDialog(url1, "forwardProcess", "批量传阅", 860, 550);
}
function ProcessreminderInstance(id) {
    var c = "notifyInstance";
    var b = "/apps/wf/NotifyMem.aspx?InstanceId=" + id;
    parent.showDialog(b, 'notifyInstance', '催办提醒', 530, 450);
}
function Processtodetailed(url) {
    window.open(url)
}
function ProcessopenchangeDiv(url) {
    parent.showDialog(url, 'instanceTranAgent', '委派', 500, 400)
}
function Processtoreload(id, ruleLogId) {
    parent.layer.confirm('确认要收回重办当前吗', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        parent.layer.close(index)
    }, function () {
        var url = "/WFPageProcessor.ashx?cmd=wf.runtime.rehandle&instanceId=" + id + "&ruleLogId=" + ruleLogId;
        //url += queryString;
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            // data: d,
            error: function (request, textStatus, errorThrown) {
                errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            },
            success: function (data, textStatus) {
                $('#datagrid').datagrid('reload')
                parent.layer.close(index)
            },
            type: "POST",
            url: url
        });
    });
}
function formatName1(val, row, index) {
    var rowId = row["ProcessInstanceId"];
    var instanceName = row["Name"];
    var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/a0M/e?objectTypeCode=123&source=l&id=' + rowId + '&retURL=%2f122%2fo">' + instanceName + '</a>';
    return html;
}
function formatOper1(val, row, index) {
    var rowId = row["ProcessInstanceId"];
    var ProcessId = row.ProcessId
    var fromActivityId = row.CurrentStepId//return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
    //var urlApprove = "/a0M/e?id=" + rowId;

    //<a href="/WFPageProcessor.ashx?cmd=cancelwfinstance&amp;id=b4a13439-ce3a-4b6a-9224-3b38c5f36415&amp;retURL=%2f122%2fo" onclick="return confirmCancelWF();"><span>撤销</span></a>

    var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/122/detail?source=i&id=' + rowId + '&retURL=%2f122%2fo">查看</a>&nbsp;';
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:openWindow('/apps/wf/WFFormPrint.aspx?InstanceId=" + rowId + "','_contract')\" >打印</a>&nbsp;";
    //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?type=1010&delID=" + rowId + "&retURL=\">删除</a>";

    var state = row["StateCode"];
    //alert(state);
    //|| state == "5"
    if (state == "1") {
        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:jumpProcess('" + rowId + "','" + ProcessId + "','" + fromActivityId + "')\" >跳转</a>&nbsp;";
        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:insertProcess('" + rowId + "','" + ProcessId + "')\" >加签</a>&nbsp;";
        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:transferAgentProcess('" + rowId + "')\" >委派</a>&nbsp;";

        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"#\" onclick=\"return confirmCancelWF('" + rowId + "');\">撤销</a>";
        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"#\" onclick=\"return confirmFinishWF('" + rowId + "');\">结束</a>";
    }
    //已完成
    if (state == "3" || state == "5") {
        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:insertProcess('" + rowId + "')\" >加签</a>&nbsp;";
        var IsArchived = row["IsArchived"];//是否归档
        var ProcessId = row["ProcessId"];//事务ID
        var ProcessInstanceId = row["ProcessInstanceId"];//流程ID
        var Title = row["Name"];//流程事务名称
        var ObjectTypeCode = 122;
        if (IsArchived == "True") {
            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:archiveProcess('1','" + ProcessId + "','" + ProcessInstanceId + "','" + Title + "','" + ObjectTypeCode + "')\" >取消归档</a>&nbsp;";
        }
        else {
            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:archiveProcess('0','" + ProcessId + "','" + ProcessInstanceId + "','" + Title + "','" + ObjectTypeCode + "')\" >归档</a>&nbsp;";
        }
    }
    if (state == "5") {
        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:jumpProcess('" + rowId + "','" + ProcessId + "','" + fromActivityId + "')\" >跳转</a>&nbsp;";
    }
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:publish('" + rowId + "')\" >发布</a>&nbsp;";

    return html;
}
function formatStatus1(val, row, index) {
    var value = row["StateCodeName"];
    if (value == "流转中") {
        return "<span style='color:red;font-weight:bold;'>" + value + "</span>";
    }
    if (value == "已完成") {
        return "<span style='color:blue'>" + value + "</span>";
    }
    if (value == "草稿") {
        return "<span style='color:grey'>" + value + "</span>";
    }
    if (value == "已退回" || value == "退回" || value == "已撤销") {
        return "<span style='color:#8F3A44;font-weight:bold;'>" + value + "</span>";
    }
}
function formatStatus2(val, row, index) {
    var value = row["StateCode"];
    // console.log(value);
    if (value == "1" || value == "审批通过" || value == "已发布") {
        return "<span style='color:blue;font-weight:bold;'>已发布</span>";
    }
    if (value == "2" || value == "审批未通过") {
        return "<span style='color:red'>审批未通过</span>";
    }
    if (value == "0" || value == "草稿") {
        return "<span style='color:grey'>草稿</span>";
    }
    if (value == "已退回" || value == "退回") {
        return "<span style='color:#8F3A44;font-weight:bold;'>" + value + "</span>";
    }
}
function openWindow(url, title) {
    window.open(url, title, 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
}
function confirmCancelWF(a, id) {
    //if ((Modal.confirm && Modal.confirm('是否收回该发文吗？')) || (!Modal.confirm && window.confirm('是否收回该发文吗？')))
    //{
    //    return true;
    //}
    //a || (a = LC.getLabel("Global", "are_you_sure"));
    //a || (a = '是否撤销该事务吗？撤销后进入发起人的退件箱，发起人可以进行删除！');
    //if (Modal.confirm(a)) {
    //    //var url = "/WFPageProcessor.ashx?cmd=process.instance.cancel&amp;id=" + id;
    //    var data = { processInstanceId: id };
    //    ajaxMethodPostData("process.instance.cancel", data, GridInstancesearch);
    //}


    layer.confirm('是否撤销该事务吗？撤销后进入发起人的退件箱，发起人可以进行删除', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        layer.close(index)
    }, function () {
        var d = { processInstanceId: id };
        var url = "/apps/CommandProcessor.ashx?cmd=process.instance.cancel";
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            data: d,
            error: function (request, textStatus, errorThrown) {
            },
            success: function (data, textStatus) {
                GridInstancesearch(data);
                layer.close(index);
            },
            type: "POST",
            url: url
        });
    });
}
//流程归档或取消归档
function archiveProcess(isarchived, processsid, processinstranceid, title, objecttypecode) {
    var d = {
        IsArchived: isarchived,
        ProcessId: processsid,
        ProcessInstanceId: processinstranceid,
        ObjectTypeCode: objecttypecode,
        Title: title
    };
    var url = "/WFPageProcessor.ashx?cmd=prcoess.archiveto.file";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            // errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            alert(data.message);
            $('#datagrid').datagrid('reload');
        },
        type: "POST",
        url: url
    });
}
function publish(id) {
    $('#changeDiv').show()
    $('.popup-mask').show()
    $('#iframe').attr('src', '/alert/wf/publishToContent.html?id=' + id).show()
}

function getinstancecount() {
    ajaxMethodGetData("wf.instance.stat", null, function (data) {
        parent.$("#draftQty").html(data.draftQty);
        parent.$("#waitingTaskQty").html(data.waitingTaskQty);
        parent.$("#instanceQty").html(data.instanceQty);
        parent.$("#readQty").html(data.readQty);
        parent.$("#cancelledQty").html(data.cancelledQty);
    });
}


function deleteProcessInstance(id) {
    //if (confirm('您是否确认删除?')) {
    //    //@@delete action
    //    var url = "/apps/CommandProcessor.ashx?cmd=process.instance.delete&id=" + id;
    //    jQuery.ajax({
    //        async: false, cache: false, dataType: "json",
    //        error: function (request, textStatus, errorThrown) {
    //        },
    //        success: function (data, textStatus) {
    //            //window.location.reload();
    //            if (data.status == 1) {
    //                //ListViewport.instances['lineItemView'].refreshList();
    //                $('#dg').datagrid('reload');
    //            }
    //            else {
    //                alert(data.msg);
    //            }
    //        },
    //        type: "POST",
    //        url: url
    //    });
    //}
    //return false;

    parent.layer.confirm('是否确定删除?', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        parent.layer.close(index)
    }, function () {
        var url = "/apps/CommandProcessor.ashx?cmd=process.instance.delete&id=" + id;
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            error: function (request, textStatus, errorThrown) {
            },
            success: function (data, textStatus) {
                //window.location.reload();
                if (data.status == 1) {
                    //ListViewport.instances['lineItemView'].refreshList();
                    $('#dg').datagrid('reload');
                }
                else {
                    //alert(data.msg);
                }
                parent.layer.close(index)
            },
            type: "POST",
            url: url
        });
    });
}