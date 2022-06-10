function encodeForSearch(a) {
    return window.encodeURIComponent ? encodeURIComponent(a) : escape(a);
}
var hrActionURL = "/apps/HrProcessor.ashx";
function getDataList(method, d, callbak, queryString) {
    var url = hrActionURL + "?cmd=" + method;
    //var queryString = "";
    //for (var i = 0; i < parameters.length; i++) {
    //    var oParameter = parameters[i];
    //    queryString += "&" + oParameter.name + "=" + oParameter.value;
    //}
    if (queryString != "")
        url += "&" + queryString;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            // alert("0");
        },
        success: function (data, textStatus) {
            if (callbak)
                callbak(data);
        },
        type: "GET",
        url: url
    });
}
function postData(method, d, callback) {
    //debugger;
    var url = hrActionURL + "?cmd=" + method;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            if (callback)
                callback(data);
        },
        type: "POST",
        url: url
    });
}
/*
type,同事，个人，公用
dept,部门
srch
*/
function searchAllEmps(renderCallback, srch) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    var url = "/apps/HrProcessor.ashx?cmd=searchemps&search=" + encodeURIComponent(srch);
    jQuery.ajax({
        async: true, cache: false, dataType: "json", error: function (request, textStatus, errorThrown) { errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]); },
        success: function (data, textStatus) {
            // debugger;
            renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
function getDepartmentEmployees(renderCallback, id) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    var url = "/apps/HrProcessor.ashx?cmd=getdepartmentemployees&id=" + id;
    jQuery.ajax({
        async: true, cache: true, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;           
            renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
/*
月末考勤统计
*/
function statMonthAttend(renderCallback,year,month) {

    var url = "/apps/HrProcessor.ashx?cmd=statmonthattend&attendyear=" + year + "&attendmonth=" + month;
    jQuery.ajax({
        async: true,
        cache: false,
        dataType: "html",
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            console.log(request);
            console.log(textStatus);
            console.log(errorThrown);
        },
        success: function (data, textStatus) {
            //debugger;
            //if (window.sfdcPage)
            //    window.sfdcPage.filterResults(null, '', '', 'noh=1', 'PricebookEntry', 5);
            alert("统计计算完成");
            if (renderCallback)
                renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
function getAttendRule(renderCallback, id) {

    var url = "/apps/HrProcessor.ashx?cmd=getentity&objectype=30039&id=" + id;
    jQuery.ajax({
        async: true, cache: false, dataType: "json", error: function (request, textStatus, errorThrown) { errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]); },
        success: function (data, textStatus) {
            // debugger;
            if (renderCallback) {
                renderCallback(data);
            }
        },
        type: "GET",
        url: url
    });
}
/*根据id删除排班*/
function removeEmployeeShift(renderCallback, id) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    var url = "/apps/HrProcessor.ashx?cmd=RemoveEmployeeShift&id=" + id;
    jQuery.ajax({
        async: true, cache: true, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;     
            if (renderCallback) {
                renderCallback(data);
            }
        },
        type: "GET",
        url: url
    });
}
/*删除排班*/
function delEmployeeShift(renderCallback, empShiftId) {
    var url = "/apps/HrProcessor.ashx?cmd=delemployeeshift&id=" + empShiftId;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {

            if (renderCallback) {
                renderCallback(data);
            }
        },
        type: "POST",
        url: url
    });
}
function setEmployeeShift(renderCallback, empid, day, shiftId, description,unitId) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    if (!unitId)
        unitId = "";
    //debugger;
    var url = "/apps/HrProcessor.ashx?cmd=SetEmployeeShift&empid=" + empid + "&day=" + day + "&shiftId=" + shiftId + "&unitId=" + unitId + "&description=" + encodeURIComponent(description);
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //alert("保存成功！");
            if (renderCallback) {
                renderCallback(data);
            }
        },
        type: "POST",
        url: url
    });
}

function uiRefreshCalendarEmpDayShifts(renderCall, empid, day) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    //debugger;
    var url = "/apps/HrProcessor.ashx?cmd=uirefreshempdayshifts&empid=" + empid + "&day=" + day;
    jQuery.ajax({
        async: true, cache: false, dataType: "html",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
           // debugger;
            renderCall(empid, day,data);
        },
        type: "GET",
        url: url
    });
}

function processEmp(renderCall, action,empid) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    //debugger;
    var url = "/apps/HrProcessor.ashx?cmd=empaction&id=" + empid + "&action=" + action;
    jQuery.ajax({
        async: true, cache: false, dataType: "html",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            //renderCall(empid, empid);
            window.location.reload();
        },
        type: "GET",
        url: url
    });
}
function approveEmpProfile(renderCall, action, empid) {
    //debugger;
    var url = "/apps/HrProcessor.ashx?cmd=emp.profile.approve&id=" + empid + "&approveStatus=" + action;
    jQuery.ajax({
        async: true, cache: false, dataType: "html",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;
            //renderCall(empid, empid);
            window.location.reload();
        },
        type: "GET",
        url: url
    });
}
function sortEmp(empid,seq) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    //debugger;
    var url = "/apps/HrProcessor.ashx?cmd=sortemp&id=" + empid + "&seq=" + seq;
    jQuery.ajax({
        async: true, cache: false, dataType: "html",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            //renderCall(empid, empid);
            window.location.reload();
        },
        type: "GET",
        url: url
    });
}
/*保存人员周排班数据，带教人员，责任，备注（欠休）*/
function saveEmpShiftInfo(employeeId, workDay, description, student, memo, yearNum,weekNum,sortNumber,startDate,endDate)
{
    var url = "/apps/HrProcessor.ashx?cmd=saveEmpShiftInfo&EmployeeId=" + employeeId + "&WorkDay=" + workDay + "&description=" + encodeURIComponent(description);
    url += "&Student=" + encodeURIComponent(student);
    url += "&Memo=" + encodeURIComponent(memo);
    url += "&YearNum=" + yearNum;
    url += "&WeekNum=" + weekNum;
    url += "&sortNumber=" + sortNumber;
    url += "&startDate=" + startDate;
    url += "&endDate=" + endDate;
    jQuery.ajax({
        async: false, cache: false, dataType: "JSON",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            //renderCall(empid, empid);
            //window.location.reload();
        },
        type: "POST",
        url: url
    });
}
/*按部门保存周排班备注信息*/
function saveDeptShiftInfo(startDate, endDate,yearNum, weekNum, updateMemo, nurseMessage, desc) {
    var url = "/apps/HrProcessor.ashx?cmd=saveDeptShiftInfo&startDate=" + startDate + "&endDate=" + endDate;
    //url += "&description=" + encodeURIComponent(desc);
   // url += "&nurseMessage=" + encodeURIComponent(nurseMessage);
   // url += "&updateMemo=" + encodeURIComponent(updateMemo);
    url += "&YearNum=" + yearNum;
    url += "&WeekNum=" + weekNum;
   // url += "&startDate=" + startDate;
    //url += "&endDate=" + endDate;
    jQuery.ajax({
        async: true, cache: false, dataType: "JSON",
        data: {
            nurseMessage: encodeURIComponent(nurseMessage),
            updateMemo: encodeURIComponent(updateMemo),
            description: encodeURIComponent(desc)
        },
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //debugger;
        },
        success: function (data, textStatus) {
            //debugger;
            //renderCall(empid, empid);
            //window.location.reload();
            reloadURL();
        },
        type: "POST",
        url: url
    });
}
/*改变排班 班次 或者备注*/
function changeEmpShift(id, fieldName, fieldValue,empId,workDay) {
    var url = "/apps/HrProcessor.ashx?cmd=upateEmpShift&id=" + id + "&fieldName=" + encodeURIComponent(fieldName);
    url += "&fieldValue=" + encodeURIComponent(fieldValue);
    jQuery.ajax({
        async: true, cache: false, dataType: "JSON",
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
           // debugger;
            if (empId && workDay)
                reloadCell(empId, workDay);
            //window.location.reload();
        },
        type: "POST",
        url: url
    });
}
/*

*/
function clearEmpShifts(startDate, endDate, deptId,weekNum)
{
    var url = "/apps/HrProcessor.ashx?cmd=clearEmpWeekShifts&startDate=" + startDate + "&endDate=" + endDate + "&deptId=" + deptId;
    url += "&weekNum=" + weekNum;
    jQuery.ajax({
        async: true, cache: false, dataType: "JSON",
        error: function (request, textStatus, errorThrown) {
           
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            //renderCall(empid, empid);
            window.location.reload();
        },
        type: "POST",
        url: url
    });
}

function rptEmpWorkShifts(startDate, endDate, deptId, postId, empName, shiftType, shiftName,ftotalAmount, renderCallback,groupid) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    //RptEmpWorkShifts
    var url = "/apps/HrProcessor.ashx?cmd=attendance.workshift.report&startDate=" + startDate + "&endDate=" + endDate + "&deptId=" + deptId + "&postId=" + postId + "&shiftType=" + shiftType + "&empName=" + encodeURIComponent(empName) + "&shiftName=" + encodeURIComponent(shiftName) + '&groupid=' + groupid;
    if (ftotalAmount != "")
    {
        url += "&ftotalAount=1";
    }
    jQuery.ajax({
        async: true, cache: false, dataType: "json", error: function (request, textStatus, errorThrown) { errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]); },
        success: function (data, textStatus) {
            // debugger;
            if (renderCallback)
                renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
function exportEmpWorkShifts(startDate, endDate, deptId, postId, empName, shiftType, shiftName, renderCallback) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    var url = "/apps/HrProcessor.ashx?cmd=export.emp.attendshift&startDate=" + startDate + "&endDate=" + endDate + "&deptId=" + deptId + "&postId=" + postId + "&shiftType=" + shiftType + "&empName=" + encodeURIComponent(empName) + "&shiftName=" + encodeURIComponent(shiftName);
    window.open(url);
    /*
    jQuery.ajax({
        async: true, cache: false, dataType: "html", error: function (request, textStatus, errorThrown) { errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]); },
        success: function (data, textStatus) {
            // debugger;
            //if (renderCallback)
            //     renderCallback(data);
        },
        type: "GET",
        url: url
    });
    */
}
function exportAttendanceWorkShifts(startDate, endDate, deptId, postId, empName, shiftType, shiftName, ftotalAmount, renderCallback) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    var url = "/apps/HrProcessor.ashx?cmd=attendance.workshift.report.export&startDate=" + startDate + "&endDate=" + endDate + "&deptId=" + deptId + "&postId=" + postId + "&shiftType=" + shiftType + "&empName=" + encodeURIComponent(empName) + "&shiftName=" + encodeURIComponent(shiftName);
    if (ftotalAmount != "") {
        url += "&ftotalAount=1";
    }
    window.open(url);
   
}
/*保存月排班数据，同时提交排班状态*/
function saveMonthEmpWorkShift(yearNum, monthNum, employeeId, sortNumber, startDate, endDate, description) {
    var url = "/apps/HrProcessor.ashx?cmd=attend.monthshift.emp.save&EmployeeId=" + employeeId + "&description=" + encodeURIComponent(description);
    //url += "&Student=" + encodeURIComponent(student);
    //url += "&Memo=" + encodeURIComponent(memo);
    url += "&YearNumber=" + yearNum;
    url += "&MonthNumber=" + monthNum;
    url += "&sortNumber=" + sortNumber;
    url += "&startDate=" + startDate;
    url += "&endDate=" + endDate;
    jQuery.ajax({
        async: false, cache: false, dataType: "JSON",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            //renderCall(empid, empid);
            //window.location.reload();
        },
        type: "POST",
        url: url
    });
}
function saveMonthDeptWorkShift(yearNum, monthNum, sDate, eDate, updateMemo, leaveMessage, description,callback)
{
    var url = "/apps/HrProcessor.ashx?cmd=attend.monthshift.dept.save&description=" + encodeURIComponent(description);
    url += "&leaveMessage=" + encodeURIComponent(leaveMessage);
    url += "&UpdateMemo=" + encodeURIComponent(updateMemo);
    url += "&YearNumber=" + yearNum;
    url += "&MonthNumber=" + monthNum;   
    url += "&startDate=" + startDate;
    url += "&endDate=" + endDate;
    jQuery.ajax({
        async: false, cache: false, dataType: "JSON",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            //debugger;
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            if (callback)
                callback(data);
        },
        type: "POST",
        url: url
    });
}
/*获取考勤组*/
function getAttendGroups(renderCallback) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    var url = "/apps/HrProcessor.ashx?cmd=hr.attendgroups.getlist";
    jQuery.ajax({
        async: true, cache: true, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //alert('ol1');
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;           
            renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
/*初始化考勤区间*/
function attendInitPeriod(attendYear,renderCallback) {
    //var roleId = jQuery("#id").val();
    //if (userId == undefined) return;
    var url = "/apps/HrProcessor.ashx?cmd=attend.period.init&attendyear=" + attendYear;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            //renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
/*设置某一个人一天考勤*/
function reportEmpAttendDayStatus(empId, day, oldStatus, newStatus, leaveDays, eleID, unitId, callBack)
{
    var url = "/apps/HrProcessor.ashx?cmd=attend.employee.workstatus";
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: {
            employeeId: empId,
            attendDate: day,
            oldStatus: oldStatus,
            newStatus: newStatus,
            leaveDays: leaveDays,
            elementId: eleID,
            unitId: unitId
        },
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            if (callBack) {
                callBack(data);
            }
        },
        type: "GET",
        url: url
    });
}
/*删除某一个考勤*/
function deleteEmployeeDateAttend(id, employeeId, attendDate, renderCallback) {
    var url = "/apps/HrProcessor.ashx?cmd=attendance.leave.remove&id=" + id + "&employeeId=" + employeeId + "&attendDate=" + attendDate;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {

            if (renderCallback) {
                renderCallback(data);
            }
        },
        type: "POST",
        url: url
    });
}
/*提交部门考勤状态*/
function submitDeptAttendStatus(attendYear, attendMonth,desc,  callBack) {
    var url = "/apps/HrProcessor.ashx?cmd=hr.attend.monthreport.submit";
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: {
            attendYear: attendYear,
            attendMonth: attendMonth,
            description: encodeURIComponent(desc)
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
var urlRoot = "/apps/HrProcessor.ashx?1=1";
/*提交部门状态*/
function submitDeptWorkShiftStatus(attendYear, attendMonth,status, callBack) {
    var url = "/apps/HrProcessor.ashx?cmd=hr.attend.monthshift.submit";
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: {
            attendYear: attendYear,
            attendMonth: attendMonth,
            status:status
        },
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;
            callBack(data);
        },
        type: "POST",
        url: url
    });
}

/*添加考勤上报人员*/
function addEmpMonthAttend(empId, deptId, yearNumber, monthNumber, callBack) {
    var url = urlRoot + "&cmd=hr.attend.monthemp.add";
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

/*添加被排班人员*/
function addEmpMonthWorkshift(yearNumber, monthNumber, deptId, empId, callBack) {
    var url = urlRoot + "&cmd=hr.workshift.monthemp.add";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: {
            yearNumber: yearNumber,
            monthNumber: monthNumber,
            deptId: deptId,
            employeeId: empId
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
/*删除员工与考勤 划分部门*/
function deleteEmpMonthWorkshift(yearNumber, monthNumber, deptId, empId, callBack) {
    var url = urlRoot + "&cmd=hr.workshift.monthemp.delete";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: {
            yearNumber: yearNumber,
            monthNumber: monthNumber,
            deptId: deptId,
            employeeId: empId
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

/*提醒未上报人员*/
function notifyAttendNotReport(yearNumber, monthNumber, callBack) {
    var url = urlRoot + "&cmd=notification.attendnotreport.send";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: {
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
        type: "GET",
        url: url
    });
}
function calculateDaysOfAnnualLeave(callBack) {
    postData("attend.employee.annualleave.calculate", callBack);
}
function calculateDaysOfAnnualLeaveUsed(callBack) {
    postData("attend.employee.annualleaveusedused.calculate", callBack);
}