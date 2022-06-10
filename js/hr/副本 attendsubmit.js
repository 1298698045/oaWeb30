var urlRoot = "/apps/HrProcessor.ashx?1=1";
function deptAttendToExcel() {

    var year = document.getElementById("yearNumber").value;
    var month = document.getElementById("monthNumber").value;
    var deptId = document.getElementById("unitId").value;
    var d = {
        yearNumber: year,
        monthNumber: month,
        unitId: deptId
    };
    ajaxMethodPostData("attendance.deptmonth.employee.toexcel", d);
}
/*
同步部门人员名单
*/
function synchAttendPeople() {

    var year = document.getElementById("yearNumber").value;
    var month = document.getElementById("monthNumber").value;
    var deptId = document.getElementById("unitId").value;
    synchDeptMonthAttendPeople(year, month, deptId);
}
function synchDeptMonthAttendPeople(year, month, deptId) {
    var d = {
        yearNumber:year,
        monthNumber:month,
        unitId:deptId
    };
    ajaxMethodPostData("attendance.deptmonth.employee.synch", d, searchMonthEmpAttendances);
}
/*删除员工与考勤 划分部门*/
function deleteEmpMonthAttend(empId, deptId, yearNumber, monthNumber, callBack) {
    var url = urlRoot + "&cmd=hr.attend.monthemp.delete";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: {
            employeeId: empId,
            deptId: deptId,
            yearNumber: yearNumber,
            monthNumber: monthNumber
        },
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            if (callBack)
                callBack(data);
        },
        type: "POST",
        url: url
    });
}
