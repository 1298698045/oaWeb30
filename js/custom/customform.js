/*科研限制*/

function onReimburseItemChange(callbak)
{
    var projectId = jQuery("#ProjectId_lkid").val();
    if (projectId == "") {
        alert("请科研项目！");
        return false;
    }
    //var projectId = jQuery("#ProjectId_lkid").val();
    var expenditureItemCode = jQuery("#ExpenditureItemCode").val();
    var fundSource = jQuery("#FundSource").val();
    var url = "/apps/HrProcessor.ashx?cmd=project.expenditure.balance.get";
    if (projectId == "" && expenditureItemCode != "" && fundSource != "")
    {
        alert("请选择科研项目，支出项目，资金来源！");
        return false;
    }
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: {
            projectId: projectId,
            ExpenditureItemCode: expenditureItemCode,
            FundSource: fundSource
        },
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            // alert("0");
        },
        success: function (data, textStatus) {
            //console.log(data);
            //if (callbak)
            try {
                // callbak(data);        
                //if (data.hasBalance)
                //{
                var balanceAmount = data.returnValue.BalanceAmount*1;
                if (balanceAmount == 0) {
                    $("#ApplyAmount").attr("readonly", "readonly");
                    $("#Amount").attr("readonly", "readonly");                   
                }
                else {
                    $("#ApplyAmount").removeAttr("readonly");
                    $("#Amount").removeAttr("readonly");
                }
                $("#FundBalance").val(data.returnValue.BalanceAmount);
                $("#FundBalance").attr("readonly", "readonly");
                //}
                var reminderMsg = "申请中金额：<span style='color:blue;'>" + data.returnValue.ApplyAmount + "</span>本期支出：<span style='color:red;'>" + data.returnValue.SpentAmount + "</span>";
            }
            catch (e) {

            }
        },
        type: "POST",
        url: url
    });
}
/*请假单控制*/
function onLeaveOnChange() {
    var leaveType = jQuery("#LeaveType").val();
    if (leaveType == "") {
        alert("请选择请假类型");
        return false;
    }
    var startDay = jQuery("#StartTime").val();
    var startTime = jQuery("#StartTime_time").val();

    var startTime1 = startDay;
    if (startTime)
        startTime1 = startDay + " " + startTime;

    if (startTime == "") {
        //alert("请选择请假时间请输入");
        return false;
    }

    var endDay = jQuery("#EndTime").val();
    var endTime = jQuery("#EndTime_time").val();

    var endTime1 = endDay;
    if (endTime)
        endTime1 = endDay + " " + startTime;

    var leavedays = jQuery("#LeaveDuration").val();
    if (leavedays == "") {
        return false;
    }
    calculateLeaveDays(leaveType, startTime1,endTime1, leavedays, setLeaveEndTime);
}
/*计算请假天数，或者请假截止日期*/
function calculateLeaveDays2(leaveType, startTime, leavedays, callbak) {

    var url = "/apps/HrProcessor.ashx?cmd=calculateleave&leavetype=" + leaveType + "&startTime=" + startTime + "&leavedays=" + leavedays;
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            // alert("0");
        },
        success: function (data, textStatus) {
            callbak(data);
        },
        type: "POST",
        url: url
    });
}
/*计算请假天数，或者请假截止日期*/
function calculateLeaveDays(leaveType, startTime,endTime, leavedays, callbak) {
    //calculateleave
    var employeeId = jQuery("#UserId_lkid").val();
    var url = "/apps/HrProcessor.ashx?cmd=attendance.leavetypeaccount.check&leavetype=" + leaveType + "&startTime=" + startTime + "&endTime=" + endTime + "&leavedays=" + leavedays;
    url += "&employeeId=" + employeeId;
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            // alert("0");
        },
        success: function (data, textStatus) {
            callbak(data);
        },
        type: "POST",
        url: url
    });
}
/*请假设置*/
function setLeaveEndTime(data) {

    var leaveType = jQuery("#LeaveType").val();
    if (leaveType == "" && leaveType != undefined)
    {
        return;
    }
    if (data) {

        //今天的时间        
        var startTime = jQuery("#StartTime").val();
        if (startTime != "" && startTime != undefined) {
            var day2 = new Date();
            day2.setTime(day2.getTime());
            var today = day2.getFullYear() + "-" + (day2.getMonth() + 1) + "-" + day2.getDate();
            var eqStatus = compareDate(startTime, today);
            if (leaveType != 2 && eqStatus != -1) {
                alert("请假开始时间必须大于当前时间！");
                jQuery("#StartTime").val("");
                jQuery("#StartTime_time").val();
                return;
            }
        }

        jQuery("#EndTime").val(data.endDay);
        //if (data.endTime)
        jQuery("#EndTime_time").val(data.endTime);
        if (data.balanceAmount != undefined)
            jQuery("#BalanceAmount").val(data.balanceAmount);
        //if (data.UsedDays)
        jQuery("#UsedDays").val(data.UsedDays);
        //请假天数
        jQuery("#LeaveDuration").val(data.leaveDays);

        if (data.isBalanceLimit != undefined) {
            var balaceAmount = data.balanceAmount * 1;
            if (balaceAmount <= 0 && data.isBalanceLimit) {
                isValidated = false;
                hasHolidayBalance = false;
            }
            else {
                hasHolidayBalance = false;
            }
        }
        jQuery("#UsedDays").attr("readonly", "readonly");
        jQuery("#BalanceAmount").attr("readonly", "readonly");
    }
    //checkAttachQty();
}
/*
检查是否有附件
*/
function checkAttachQty()
{
    if (requiredAttaches == false)
    {
        return;
    }
    //年假不需要附件
    var leaveType = jQuery("#LeaveType").val();
    if (leaveType == undefined || leaveType == "6" || leaveType == "31") {
        requiredAttaches = false;
        return;
    }
    //StartTime
    //hasAttachLeaveType
    var instanceId = processInstanceId;
    if (instanceId == undefined || instanceId == "")
        instanceId = document.getElementById("_processInstanceId").value;
    var url = "/apps/HrProcessor.ashx?cmd=process.instance.file.quantity.get&id=" + instanceId;
    jQuery.ajax({
        async: false, cache:false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
          
        },
        success: function (data, textStatus) {
            //callbak(data);
            if (data == null) {
                return;
            }
            var qty = data.actions[0].returnValue.Quantity;
            if (qty == 0) {
                hasAttach = false;
            }
            else {
                hasAttach = true;
            }
            //requiredAttaches && !hasAttach
        },
        type: "GET",
        url: url
    });
}
jQuery(document).ready(function () {
   
    jQuery("#ExpenditureItemCode").change(function (ele) {
        onReimburseItemChange();
    });
    jQuery("#FundSource").change(function () {
        onReimburseItemChange();
    });

    jQuery("#ExpenditureItemCode").change(function () {
      //onLeaveOnChange();
     });
    jQuery("#LeaveDuration").change(function () {
        onLeaveOnChange();
    });
    jQuery("#LeaveType").change(function () {
        onLeaveOnChange();
    });
    jQuery("#StartTime").change(function () {
        onLeaveOnChange();
    });
    jQuery("#EndTime").change(function () {
        onLeaveOnChange();
    });
    //debugger;
    //jQuery("#EmployeeId").change(function () {
    //    empChange();
    //});

});

function lookupPick(formName, controlName, controlName2, null1, valId, valName) {
    $('#' + controlName2).val(valName)
    $('#' + controlName2 + '_lkid').val(valId)
    $('#' + controlName2 + '_lkold').val(valName)

    var lookupObjectTypeCode = $('[name="' + controlName2 + '"]').parent().parent().find('[name="' + controlName2 + '_lktp"]').val()
    var ObjectTypeCode = $('[name="' + controlName2 + '"]').parent().parent().find('[name="' + controlName2 + '_lkid"]').attr('objecttypecode')
    var lookupAttributeName = controlName2
    var id = valId
    lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id)
}
function lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id) {
    ajaxMethodGetData('entity.attributelookup.inputrequest', {
        lookupObjectTypeCode: lookupObjectTypeCode,
        ObjectTypeCode: ObjectTypeCode,
        lookupAttributeName: lookupAttributeName,
        id: id
    }, function (data) {
        var res = data.actions[0].returnValue.changeValues
       // console.log(res.ContractNumber)
       // console.log(res.ContractTotalAmount)
        for (var item in res) {
            if (res[item] != null) {
                if (res[item].Id) {
                    $('#' + item).val(res[item].Name)
                    $('#' + item + '_lkid').val(res[item].Id)
                    $('#' + item + '_lkold').val(res[item].Name)
                } else {
                    $('#' + item).val(res[item])
                }
            } else {
                $('#' + item).val('')
            }
        }
    })
}
function choosePeople(name,obj) {
    opencenterwindow('/_ui/common/data/UserLookResult.aspx?type=relatedchhoose&lknm=' + name, '', 1150, 600)
}

function chooseLookup(objtypecode, name, title, search,lookupName) {
    //debugger;
    if (parent.$('#iframe2').length == 0) {
        parent.$('body').append('<div class="popup-mask"></div><iframe id="iframe2" frameborder="0"></iframe><style>.popup-mask {position: fixed;background: url(/img/bgOverlayDialogBackground.png);background-color: transparent;top: 0;left: 0;width: 100%;height: 100%;display: none;z-index: 100;}body #iframe2 {position: fixed;z-index: 101;background-color: white;width: 80%;left: 10%;top: 50%;margin-top: -310px;border-radius: 7px;display: none;height: 620px;border: 0;}</style>')
    }
    var url = '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lookupName=' + lookupName + '&lknm=' + name + '&title=' + title + '&search=' + search;
    parent.$('#iframe2').show().attr('src', url).height(640).css('margin-top', '-320px')
    parent.$('.popup-mask').show();
}
function chooseDept(name) {
    opencenterwindow('/alert/deptchose_form.html?type=relatedchhoose&lknm=' + name, '', 750, 520)
}
if (parent.$('#iframe2').length == 0) {
    parent.$('body').append('<div class="popup-mask"></div><iframe id="iframe2" frameborder="0"></iframe><style>.popup-mask {position: fixed;background: url(/img/bgOverlayDialogBackground.png);background-color: transparent;top: 0;left: 0;width: 100%;height: 100%;display: none;z-index: 100;}body #iframe2 {position: fixed;z-index: 101;background-color: white;width: 80%;left: 10%;top: 50%;margin-top: -310px;border-radius: 7px;display: none;height: 620px;border: 0;}</style>')
}