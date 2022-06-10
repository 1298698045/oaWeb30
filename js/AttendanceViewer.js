{
    function attendanceEditor(a, b, c, f, g) {
        if (a) this.viewMode = a; //1 view 2 edit
        if (b) this.calendar = b;
        this.groupBar = document.getElementById(c);
        this.shiftBar = document.getElementById(f);

        if (g) {
            this.unitType = g;
        }
        //if (g) {
        //if (g == "0")
        //    this.showMemo = false;
        //else
        //    this.showMemo = true;
        //}
        //if (g)
        //    this.viewMode = g;
    }
    attendanceEditor.prototype.groups = null;
    //attendanceEditor.prototype.shifts = null;
    attendanceEditor.prototype.groupBar = null;
    attendanceEditor.prototype.shiftBar = null;
    attendanceEditor.prototype.calendar = 1; //1 - month , 2 week
    attendanceEditor.prototype.viewMode = 1; //1 - view , 2 edit
    attendanceEditor.prototype.unitType = 10; //10 dept 4030 attendgroup
    attendanceEditor.prototype.unitId = "";
    attendanceEditor.prototype.startDate = "";
    attendanceEditor.prototype.endDate = "";
    //attendanceEditor.prototype.weekNumber = 0;
    attendanceEditor.prototype.year = 0;
    attendanceEditor.prototype.month = 0;
    attendanceEditor.prototype.BussinessUnitName = ""; //dept
    //attendanceEditor.prototype.showMemo = true; //show memo input

    //attendanceEditor.prototype.UpdateMemo = "";
    //attendanceEditor.prototype.NurseMessage = "";
    //attendanceEditor.prototype.Description = "";
    attendanceEditor.prototype.searchText = "";
    attendanceEditor.prototype.searchMode = false;

    attendanceEditor.prototype.renderGroupBar = function (data, curentUnitId) {
        var html = "";
        if (data.length == 0) {
            // html = "<div style=\"border-radius: 4px;border-color: #39f;background-color: #ffc;border-style: solid;border-width: 1px;color: #000;padding: 6px 8px 6px 6px;margin: 4px 20px;\">您还没有管理任何排班班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组</div>";
        }
        this.groups = data;
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            if (i == 0 || item.id == curentUnitId)
                html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\"><input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" onclick=\"editor.search('',this.value)\" /> " + item.name + "</div>";
            else
                html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\"><input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" onclick=\"editor.search('',this.value)\" /> " + item.name + "</div>";

        }
        $("#groupBar").html(html);
    }

    attendanceEditor.prototype.getCellColor = function (shiftId) {
        for (var i = 0; i < this.shifts.length; i++) {
            var shift = this.shifts[i];
            if (shift.WorkShiftId == shiftId)
                return shift.Color;
        }
    }

    attendanceEditor.prototype.renderShiftBar = function (data) {
        this.shifts = data;
        var html = "";
        html = "设置请假时长:<select id='leaveDay' name='leaveDay'><option value='1'>1天</option><option value='0.5'>半天</option><option value='0.25'>0.25天</option></select>天&nbsp;";
        html += "<input type=\"button\" name=\"btnWorkShift\" id=\"btnWorkShift_20\" class=\"btnShift\" value=\"清除选择\" title=\"清除选择\" onclick=\"clearSelectShift()\">&nbsp;&nbsp;";
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            html += "<input type='button' id='" + item.Id + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectAttendType(this,'" + item.Id + "');\" />&nbsp;";
        }
        $("#shiftBar").html(html);
    }
    attendanceEditor.prototype.loadGroups = function () {
        var self = this;
        this.loadData("hr.attendgroups.getlist", "", function (data) {
            var html = "";
            if (!data) return;
            //debugger;
            if (data.length == 0) {
                html = "还没有排班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组";
            }
            self.renderGroupBar(data, self.unitId);
            /*
            for (var i = 0; i < data.length; i++) {
                var item = data[i];
                html += "<div style=\"display:inline-block;border:solid 1px #0ff; background-color:#0ff;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\"><input type='radio' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" /> " + item.name + "</div>";
            }
            $("#groupBar").html(html);
            */
        });
    }
    attendanceEditor.prototype.initInfo = function (d) {
        try {
            this.startDate = d.StartDate;
            this.endDate = d.EndDate;
            this.year = d.Year;
            this.weekNumber = d.WeekNumber;
            this.month = d.MonthNumber;
            this.groups = d.Groups;
            this.shifts = d.Shifts;
            document.getElementById("md0").value = this.year;
            document.getElementById("md2").value = this.weekNumber;
            document.getElementById("startDate").value = this.startDate;
            document.getElementById("endDate").value = this.endDate;
            document.getElementById("md1").value = this.month;

            this.UpdateMemo = d.UpdateMemo;
            this.Description = d.Description;
            this.NurseMessage = d.NurseMessage;
        }
        catch (e)
        { }
    }
    attendanceEditor.prototype.renderWeekCalendar = function (d) {
        var data = d.EmpShiftData;
        //debugger
        var html = "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        html += "<th rowspan='2'>姓名</th>";
        html += "<th rowspan='2'>层级</th>";
        var days = d.Days.length;
        //debugger;
        /*
        var da = d.StartDate.split('-');
        var startdate = new Date(da[0],da[1],da[2]);
        for (var w = 1; w <= 7; w++) {

            var month = startdate.getMonth() + 1;
            var day = startdate.getDate();
            var yday = "<div> " + month + "/" + day + "</div>";
            html += "<th class='' colspan='2' style='text-align:center;'>" + this.toWeekName(w) + yday + "</th>";
            startdate.setDate(startdate.getDate() + 1);
        }
        */
        var clsweekEnd = "text-align:center;min-width:80px;color:red;";
        var clsweek = "text-align:center;min-width:80px;";
        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if (this.showMemo) {
                if (wDay == 0 || wDay == 6) {
                    html += "<th class='' colspan='2'  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
                else
                    html += "<th class='' colspan='2' style='text-align:center;min-width:80px;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
                if (wDay == 0 || wDay == 6)
                    html += "<th class=''  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                else {
                    html += "<th class=''  style='" + clsweek + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
            }
        }
        html += "<th rowspan='2'>时长</th><th rowspan='2'>夜班</th></tr>";

        html += "<tr class=\"\">";
        if (this.showMemo) {
            for (var c = 0; c < 7; c++) {
                html += "<th class='' style='text-align:center;'>班次</th><th class='zen-deemphasize' style='text-align:center;'>备注</th>";
            }
        }
        //else {
        //    html += "<th class='' style='text-align:center;'>班次</th>";
        //}
        //debugger;
        html += "</tr><tbody style=\"height:50px;overflow:auto;\">";
        var html2 = "";
        for (var i = 0; i < data.length; i++) {
            var group = data[i];
            //html += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\" />&nbsp;";
            html2 += "<tr>";
            html2 += "<td colspan='18'><div class=\"tgroup\" style=\"font-size:14px;font-weight:bold;padding-left:5px;\">" + group.GroupName + "</div></td>";
            html2 += "</tr>";
            var emps = group.Employees;
            for (var j = 0; j < emps.length; j++) {
                var emp = emps[j];
                if ((j % 2) == 0)
                    html2 += "<tr>";
                else
                    html2 += "<tr class=\"even\">";
                html2 += "<td class=\"nameCol1\">" + emp.Name + "</td>";
                html2 += "<td class=\"nameCol1\" >" + "" + "</td>";

                for (var h = 0; h < 7; h++) {
                    var shift = emp.Shifts[h];
                    if (shift == null) continue;
                    var cellId = "c_" + emp.EmployeeId + "_" + shift.WorkDay;
                    var memoTxtId = "memo_" + emp.EmployeeId + "_" + shift.WorkDay;
                    html2 += "<td  id=\"" + cellId + "\"";
                    if (this.viewMode == 1) {
                        if (shift.Name == "") {
                            html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";
                            html2 += "</td>";
                        }
                        else {
                            var color = this.getCellColor(shift.WorkShiftId);
                            if (color != undefined && color != "")
                                html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;" + color + "' ";
                            else
                                html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";
                            html2 += " >";
                            //html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" >";
                            html2 += shift.Name + "</td>";
                        }
                        if (this.showMemo)
                            html2 += "<td  style='vertical-align:middle;text-align:center;cursor:pointer;width:80px;'>" + shift.Description + "</td>";
                    }
                    else {
                        if (shift.Name == "") {

                            html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";

                            html2 += " onclick=\"setEmpShift('" + emp.EmployeeId + "','" + emp.Name + "','" + shift.WorkDay + "')\" >";
                            html2 += "</td>";

                            if (this.showMemo)
                                html2 += "<td  style='vertical-align:middle;text-align:center;cursor:pointer;width:80px;'><input class=\"memoText\" type=\"text\" valueid=\"" + shift.EmpWorkShiftId + "\"  empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></td>";
                        }
                        else {
                            var color = this.getCellColor(shift.WorkShiftId);
                            if (color != undefined && color != "")
                                html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;" + color + "' ";
                            else
                                html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";

                            html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" >";
                            html2 += shift.Name + "</td>";
                            if (this.showMemo)
                                html2 += "<td  style='vertical-align:middle;cursor:pointer;width:80px;'><input type=\"text\" class=\"memoText\" valueid=\"" + shift.EmpWorkShiftId + "\" empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></td>";

                        }
                    }
                }
                html2 += "<td class=\"nameCol\"></td>";
                html2 += "<td class=\"nameCol\" ></td>";
                html2 += "</tr>";
            }
        }


        html += html2;
        html += "</tbody></table>";
        //$("#shiftContainer1").append(html);
        $("#shiftContainer1").html(html);
    }
    attendanceEditor.prototype.renderMonthCalendar = function (d) {
        //debugger;
        var data = d.listData;

        var html = "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        html += "<th >部门</th>";
        html += "<th >姓名</th>";
        html += "<th >工号</th>";
        var days = d.Days.length;

        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if (wDay == 6 || wDay == 0) {
                html += "<th class='' style='text-align:center;color:red;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
                html += "<th class='' style='text-align:center;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
        }


        html += "";

        var colSpan1 = (days + 4);
        html += "<tbody style=\"height:50px;overflow:auto;\">";
        var html2 = "";
        //debugger;

        for (var i = 0; i < data.length; i++) {
            var emp = data[i];

            if ((i % 2) == 0)
                html2 += "<tr>";
            else
                html2 += "<tr class=\"even\">";
            html2 += "<td class=\"nameCol\" nowrap='nowrap'>" + emp.DeptName + "</td>";
            html2 += "<td class=\"nameCol\" >" + emp.Name + "</td>";
            html2 += "<td class=\"nameCol\" >" + emp.EmployeeNo + "</td>";
            var attendData = emp.AttendData;
            for (var h = 0; h < days; h++) {
                //var day1 = d.Days[j];

                var row = attendData[h];
                if (row == null)
                    continue;
                var cellId = "c_" + emp.EmployeeId + "_" + row.AttendDate;
                //var memoTxtId = "memo_" + emp.EmployeeId + "_" + row.AttendDate;
                html2 += "<td  id=\"" + cellId + "\" title=\"" + row.AttendDate + "\"";
                
                tempCell = "<div style='cursor:pointer;'  id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'>" + row.LeaveTypeName + "(" + row.LeaveDays + ")</div>";

                var leaveType = row.LeaveTypeCode * 1;
                if (leaveType > 0 || row.LeaveTypeName != "") {
                    //border-radius:3px;margin:3px;
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'  >";
                    html2 += tempCell;
                }
                else {
                    //0 工作
                    if (row.WorkStatus == 1) //请假
                    {

                    }
                    else if (row.WorkStatus == -100) //不在单元上班
                    {
                        html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:grey;' >";
                        //html2 += " / ";
                        html2 += "<div style='cursor:pointer;' onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> X </div>";
                    }
                    else if (row.WorkStatus == 2) // 休息
                    {
                        html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;min-width:30px;background-color:#ebebeb;color:red;'  >";
                        //html2 += " - ";
                        html2 += "<div style='cursor:pointer;' onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> - </div>";
                    }
                    else {
                        html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' >";
                        //html2 += " / ";
                        html2 += "<div style='cursor:pointer;' onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> / </div>";
                    }
                }
                html2 += "</td>";


            }
            //html2 += "<td class=\"\"></td>";
            //html2 += "<td class=\"\" ></td>";
            //html2 += "<td class=\"\" ></td>";
            html2 += "</tr>";
        }



        html += html2;
        html += "</tbody></table>";

        $("#shiftContainer1").html(html);
    }
    attendanceEditor.prototype.renderGrid = function (d) {
        this.initInfo(d);
        //debugger;
        if (this.calendar == 2) // week calendar
            this.renderWeekCalendar(d);
        else
            this.renderMonthCalendar(d);
    }
    attendanceEditor.prototype.loadDesigner = function (para) {
        var self = this;
        this.loadData("attendance.detail.report", para, function (data) {
            var html = "";
            if (!data) return;
            if (self.searchMode) {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;人员考勤表";
            }
            else {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;" + data.BussinessUnitName + " 人员考勤表";
            }
            //debugger;
            if (self.viewMode == 2) //编辑模式
            {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate;
                self.renderShiftBar(data.AttendTypes);
            }
            document.getElementById("unitId").value = data.UnitId;
            self.unitId = data.UnitId;
            self.renderGroupBar(data.Units, data.UnitId);
            self.renderGrid(data);

        });
    }


    attendanceEditor.prototype.previous = function () {
        var nextWeek = 0;
        if (this.calendar == 1) {
            if (this.month == 1) {
                // nextWeek = ((this.weekNumber * 1) + 1);
                this.year--;
                this.month = 1;
            }
            else {
                this.month = ((this.month * 1) - 1);
            }
        }
        else {
            if (this.weekNumber == 1) {
                // nextWeek = ((this.weekNumber * 1) + 1);
                this.year--;
                nextWeek = 53;
            }
            else {
                nextWeek = ((this.weekNumber * 1) - 1);
            }
        }
        var para = "md2=" + nextWeek;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        //para += "&md0=" + this.year;
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    attendanceEditor.prototype.next = function () {
        var nextWeek = 0;
        if (this.calendar == 1) {
            if (this.month == 12) {
                // nextWeek = ((this.weekNumber * 1) + 1);
                this.year++;
                this.month = 1;
            }
            else {
                this.month = ((this.month * 1) + 1);
            }
        }
        else {
            if (this.weekNumber == 53) {
                // nextWeek = ((this.weekNumber * 1) + 1);
            }
            else {
                nextWeek = ((this.weekNumber * 1) + 1);
            }
        }
        var para = "md2=" + nextWeek;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    attendanceEditor.prototype.refresh = function () {

        var para = "md2=" + this.weekNumber;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        para += "&viewMode=" + this.viewMode;
        this.loadDesigner(para);

    }
    attendanceEditor.prototype.saveDB = function () {
        //debugger;
        var json = "[";
        //var i
        jQuery("input[id^='memo_']").each(function (index, value) {
            if (index > 0)
                json += ",";
            var eleId = jQuery(this).attr("id");
            var employeeId = jQuery(this).attr("empid");
            var workDay = jQuery(this).attr("day");
            var valueid = jQuery(this).attr("valueid");
            var description = $(this).val();
            json += "{\"EmpWorkShiftId\":\"" + valueid + "\",\"EmployeeId\":\"" + employeeId + "\",\"WorkDay\":\"" + workDay + "\",\"Description\":\"" + description + "\"}";
        });
        json += "]";
        //console.log(json);
        var data = {
            data: json
        };
        this.postData("workshift.designer.save", data, null, function () { });
    }
    /*删除数据*/
    attendanceEditor.prototype.clearData = function () {
        var startDate = this.startDate;
        var endDate = this.endDate;
        var groupIds = "";
        for (var i = 0; i < this.groups.length; i++) {
            if (i > 0)
                groupIds += ",";
            var g = this.groups[i];
            groupIds += g.id;
        }
        var weekNum = this.weekNumber;
        var url = "/apps/HrProcessor.ashx?cmd=attendance.designer.clear&group=1&startDate=" + startDate + "&endDate=" + endDate + "&groupIds=" + groupIds;
        url += "&md0=" + this.year;
        url += "&md1=" + this.month;
        url += "&md2=" + this.weekNumber;
        var parent = this;
        jQuery.ajax({
            async: true, cache: false, dataType: "JSON",
            error: function (request, textStatus, errorThrown) {
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                //window.location.reload();
                parent.refresh();
            },
            type: "POST",
            url: url
        });
    }

    attendanceEditor.prototype.loadData = function (method, para, callback) {
        var url = "/apps/HrProcessor.ashx?cmd=" + method;
        if (para) {
            url += "&" + para;
        }
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            error: function (request, textStatus, errorThrown) {
                // debugger;
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                // debugger;
                callback(data);
            },
            type: "GET",
            url: url
        });
    }
    attendanceEditor.prototype.postData = function (method, d, para, callback) {
        var url = "/apps/HrProcessor.ashx?cmd=" + method;
        if (para) {
            url += "&" + para;
        }
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            data: d,
            error: function (request, textStatus, errorThrown) {
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                callback(data);
            },
            type: "POST",
            url: url
        });
    }
    attendanceEditor.prototype.toWeekName = function (dayOfWeek) {
        var d = "";
        switch (dayOfWeek) {
            case 1:
                d = "一";
                break;
            case 2:
                d = "二";
                break;
            case 3:
                d = "三";
                break;
            case 4:
                d = "四";
                break;
            case 5:
                d = "五";
                break;
            case 6:
                d = "六";
                break;
            case 0:
            case 7:
                d = "日";
                break;
        }
        return d;
    }
    attendanceEditor.prototype.init = function (md0, md1, md2, unitType, unitId) {
        var para = "";
        if (md0) this.year = md0;
        if (md1) this.month = md1;
        //debugger;
        var d = new Date();
        this.month = d.getMonth();

        para = "md0=" + this.year;
        para += "&md1=" + this.month;
        if (md2 && md2 != "") {
            this.weekNumber = md2;
            para += "&md2=" + this.weekNumber;
        }
        para += "&calendar=" + this.calendar;
        para += "&viewMode=" + this.viewMode;
        para += "&unitType=" + this.unitType;
        if (unitId)
            para += "&unitId=" + unitId;
        //para += "&name=123";
        //if (this.searchMode)
        //    para += "&searchMode=1";
        //this.loadGroups();
        //this.loadShifts();
        //this.loadGroupEmployees();   
        this.loadDesigner(para);

    };
    attendanceEditor.prototype.search = function (searchText, unitId) {
        var para = "";
        para = "md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&md2=" + this.weekNumber;
        para += "&calendar=" + this.calendar;
        para += "&viewMode=" + this.viewMode;
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + unitId;
        para += "&searchMode=1";
        para += searchText;
        this.loadDesigner(para);

    };
    attendanceEditor.prototype.render = function () {
        if (this.viewMode == 1) {
            renderMonthCalendar();
        }
        if (this.viewMode == 2) {
            renderWeekCalendar();
        }
    }

}

/*保存备注信息*/
function saveDeptShiftDescription(startDate, endDate, yearNum, weekNum, updateMemo, nurseMessage, desc) {
    var url = "/apps/HrProcessor.ashx?cmd=saveDeptShiftInfo&startDate=" + startDate + "&endDate=" + endDate;
    url += "&YearNum=" + yearNum;
    url += "&WeekNum=" + weekNum;
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
            //reloadURL();
        },
        type: "POST",
        url: url
    });
}

function saveShiftInfo() {

    //保存备注
    var updateMemo = "";//jQuery("#txtUpdateMemo").val();
    var nurseMessage = jQuery("#txtNurseMessage").val();
    var desc1 = jQuery("#txtDescription").val();
    saveDeptShiftDescription(editor.startDate, editor.endDate, editor.year, editor.weekNumber, updateMemo, nurseMessage, desc1);
    if (editor.showMemo)
        editor.saveDB();
}
function previousWeek() {
    editor.previousWeek();
}
function nextWeek() {
    editor.nextWeek();
}
function previousCalendar() {
    editor.previous();
}
function nextCalendar() {
    editor.next();
}
function showWeek() {
    editor.calendar = 2;
    editor.refresh();
}
function showMonth() {
    editor.calendar = 1;
    editor.refresh();
}
function showMemo(checked) {
    editor.showMemo = checked;
    editor.refresh();
}
function searchAttendanceDetails() {
    editor.year = document.getElementById("yearNumber").value;
    editor.month = document.getElementById("monthNumber").value;
    editor.searchMode = true;
    var search = "";
    var deptId = "";// document.getElementById("DeptId_lkid").value;
    /*
     $("input[name=attendGroup]").each(function (i, elment) {
         var i = 0;
         var check = $(this).attr("checked");
         if (check) {
             if (i > 0)
                 deptId += ",";
             var text = $(this).val();
             deptId += text;
             i++;
         }
          
     });
     */
    var search = "";
    var deptId = document.getElementById("DeptId_lkid").value;
    if (deptId == "") {
        // alert("请选择查询部门。");
        // return;
    }
    editor.unitId = deptId;
    //search += "md0=" + editor.year;
    //search += "&md1=" + editor.month;
    //search += "&UnitId=" + deptId;

    var eleName = document.getElementById("empName");
    if (eleName) {
        var name = encodeURIComponent(eleName.value);
        //if (deptId == "" && name == "");
        //{
        //    alert("请选择部门或者输入姓名");
        //    return false;
        //}
        //search = "&unitId=" + deptId;
        search += "&name=" + name;
    }
    editor.searchText = search;
    editor.search(search, deptId);
}
function clearEmpWeekShift() {
    var s = document.getElementById("startDate").value;
    var e = document.getElementById("endDate").value;

    if (window.confirm("你确定要删除当前周(" + s + "至" + e + ")所有排班数据吗？")) {
        editor.clearData();
    }
}
/*
copy
*/
function copyWorkshift() {
    var sDate = jQuery("#startDate").val();
    var eDate = jQuery("#endDate").val();
    //var weekNum = jQuery("#dphe_md2").val();
    //var md0 = jQuery("#dphe_md0").val();
    var weekNum = jQuery("#md2").val();
    var md0 = jQuery("#md0").val();
    window.location = '/hr/attend/cloneEmpshifts.aspx?t=06e&start=' + sDate + '&end=' + eDate + '&md0=' + md0 + '&weekNum=' + weekNum + "&retURL=";
}
function printCalendar() {
    //editor.nextWeek();
    var showm = (editor.showMemo ? "1" : "0");
    var url = "/_ui/hr/attend/empshift/print?md0=" + editor.year + "&md1=" + editor.month + "&md2=" + editor.weekNumber + "&calendar=" + editor.calendar + "&showMemo=" + showm;
    printWin(url);
}