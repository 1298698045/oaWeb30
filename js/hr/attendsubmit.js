var urlRoot = "/apps/HrProcessor.ashx?1=1";
function deptAttendToExcel() {

    var year = document.getElementById("yearNumber") ? document.getElementById("yearNumber").value : $('#weektime').val().split('-')[0];
    var month = document.getElementById("monthNumber") ? document.getElementById("monthNumber").value : $('#weektime').val().split('-')[1];
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

function synchAttendPeople(type) {
    if (type=='1') {
        var year = document.getElementById("yearNumber");
        var month = document.getElementById("monthNumber");
        var node = $('#LeftTree').tree('getSelected');
        if (node.isleft) {
            var deptId= node.id
        } else {
            var deptId= node.ParentId
        }
        var d = {
            startDate: editor.startDate,
            endDate: editor.endDate,
            unitId: deptId
        };
        ajaxMethodPostData("attendance.deptmonth.employee.synch", d, editor.rendertable());
    }
    else if (type == '2') {
        var startDate = $('#weektime').val().split('~')[0];
        var endDate = $('#weektime').val().split('~')[1];
        var node = $('#LeftTree').tree('getSelected')
        if (node.isleft) {
            var deptId = node.id
        } else {
            var deptId = node.ParentId
        }
        var d = {
            startDate: startDate,
            endDate: endDate,
            unitId: deptId
        };
        ajaxMethodPostData("attendance.deptmonth.employee.synch", d, editor.rendertable());
    }
    else {
        var year = document.getElementById("yearNumber");
        var month = document.getElementById("monthNumber");
        var deptId = document.getElementById("unitId").value;
        var d = {
            startDate: editor.startDate,
            endDate: editor.endDate,
            unitId: deptId
        };
        ajaxMethodPostData("attendance.deptmonth.employee.synch", d, searchMonthEmpAttendances);
    }
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
function addplays(id, name, lkid, lkname,type) {
    if (type == '1') {
        var win = document.getElementById('closeRangeShiftContentId').contentWindow;
        var ids = id.split(',');
        if (ids.length > 1) {
            error('每行只能选择一个被复制人员！')
        }
        else {
            $(win.document.getElementById(lkid)).attr('value', id);
            $(win.document.getElementById(lkname)).text(name);
        }
    }
    else if (type == '2') {
        var win = document.getElementById('closeRangeShiftContentId').contentWindow;
        $(win.document.getElementById(lkid)).attr('value', id);
        $(win.document.getElementById(lkname)).html(name);
    }
    else if (lkid == 'employeeIdss') {
        var win = document.getElementById('arrangeGroupWorkshiftContentId').contentWindow;
        $(win.document.getElementById("employeeIds")).attr('value', id);
        $(win.document.getElementById("employeeIdNames")).text(name);
        win.intSelect();
    }
    $('.popup-mask').hide();
    $('#iframe').hide();
}

var PostCategoryHtml = '<option value ="">请选择</option>'
            + '<option value ="医电">医电</option>'
            + '<option value ="治疗">治疗</option>'
            + '<option value ="组长">组长</option>'
            + '<option value ="责护">责护</option>'
            + '<option value ="上夜">上夜</option>'
            + '<option value ="下夜">下夜</option>'
            + '<option value ="助夜1">助夜1</option>'
            + '<option value ="助夜2">助夜2</option>'
            + '<option value ="助早">助早</option>'
            + '<option value ="防控">防控</option>'
            + '<option value ="助责">助责</option>'
            + '<option value ="大输">大输</option>'
            + '<option value ="小输">小输</option>'
            + '<option value ="采血">采血</option>'
            + '<option value ="换药">换药</option>'
            + '<option value ="采血">采血</option>'
            + '<option value ="预检1">预检1</option>'
            + '<option value ="预检2">预检2</option>'
            + '<option value ="预检3">预检3</option>'
            + '<option value ="测温">测温</option>'
            + '<option value ="医电">医电</option>'
            + '<option value ="组长">组长</option>'
            + '<option value ="责护">责护</option>'
            + '<option value ="院前-白">院前-白</option>'
            + '<option value ="院前-夜">院前-夜</option>'
            + '<option value ="注射">注射</option>'
            + '<option value ="巡回">巡回</option>'
            + '<option value ="清创">清创</option>'
            + '<option value ="洗手">洗手</option>'
            + '<option value ="术前1">术前1</option>'
            + '<option value ="术前2">术前2</option>'
            + '<option value ="取血">取血</option>'
            + '<option value ="器械室">器械室</option>'
            + '<option value ="普洗1">普洗1</option>'
            + '<option value ="普洗2">普洗2</option>'
            + '<option value ="备班">备班</option>'
            + '<option value ="值夜">值夜</option>'
            + '<option value ="助洗">助洗</option>'
            + '<option value ="手洗1">手洗1</option>'
            + '<option value ="手洗2">手洗2</option>'
            + '<option value ="普包1">普包1</option>'
            + '<option value ="普包2">普包2</option>'
            + '<option value ="低温">低温</option>'
            + '<option value ="外来器械">外来器械</option>'
            + '<option value ="手术器械">手术器械</option>'
            + '<option value ="手包">手包</option>'
            + '<option value ="物资1">物资1</option>'
            + '<option value ="物资2">物资2</option>'
            + '<option value ="发放1">发放1</option>'
            + '<option value ="发放2">发放2</option>'
            + '<option value ="开会">开会</option>'
            + '<option value ="公出">公出</option>'
            + '<option value ="夜查">夜查</option>'
            + '<option value ="培训">培训</option>'
            + '<option value ="保健">保健</option>'
            + '<option value ="正班">正班</option>'
            + '<option value ="节假日">节假日</option>'
            + '<option value ="助岗">助岗</option>'

$(document).ready(function () {
    $('#PostCategory').html(PostCategoryHtml);
})