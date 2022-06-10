function shiftActivity()
{

}
shiftActivity.setCellShift = function (a, b, c, d, e, f) {

}
shiftActivity.setCellMemo = function (a, b, c, d, e, f) {

}
shiftActivity.deleCellShift = function (a, b, c, d, e, f) {

}
shiftActivity.deleCellMemo = function (a, b, c, d, e, f) {

}
{
    function shiftEditor(a, b, c, f, g,unitType) {
        if (a) this.viewMode = a;
        if (b) this.calendar = b;
        this.groupBar = document.getElementById(c);
        this.shiftBar = document.getElementById(f);
        //if (g) {
        if (g == "0")
            this.showMemo = false;
        else
            this.showMemo = true;
        //}
        //if (g)
        //    this.viewMode = g;
        if(unitType)
            this.unitType = unitType;
    }
    shiftEditor.prototype.groups = null;
    shiftEditor.prototype.shifts = null;
    shiftEditor.prototype.groupBar = null;
    shiftEditor.prototype.shiftBar = null;
    shiftEditor.prototype.calendar = 2; //1 - month , 2 week
    shiftEditor.prototype.viewMode = 1; //1 - view , 2 edit
    shiftEditor.prototype.startDate = "";
    shiftEditor.prototype.endDate = "";
    shiftEditor.prototype.unitType = 4030; //10 dept 4030 attendgroup
    shiftEditor.prototype.unitId = "";
    shiftEditor.prototype.weekNumber = 0;
    shiftEditor.prototype.year = 0;
    shiftEditor.prototype.month = 0;
    shiftEditor.prototype.BussinessUnitName = ""; //dept

    shiftEditor.prototype.showMemo = true; //show memo input

    shiftEditor.prototype.UpdateMemo = "";
    shiftEditor.prototype.NurseMessage = "";
    shiftEditor.prototype.Description = "";
    shiftEditor.prototype.searchText = "";
    shiftEditor.prototype.searchMode = false;

    shiftEditor.prototype.renderGroupBar = function (data, curentUnitId) {
        var html = "";
        if (!data) return;
        if (data.length == 0) {
            html = "<div style=\"border-radius: 4px;border-color: #39f;background-color: #ffc;border-style: solid;border-width: 1px;color: #000;padding: 6px 8px 6px 6px;margin: 4px 20px;\">您还没有管理任何排班班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组</div>";
        }
        this.groups = data;
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            if (i == 0 || item.id == curentUnitId)
                html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\"><input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" onclick=\"editor.search('',this.value)\" /> " + item.name + "</div>";
            else
                html += "<div style=\"display:inline-block;border:solid 1px #0ff; background-color:#0ff;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\"><input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" onclick=\"editor.search('',this.value)\" /> " + item.name + "</div>";
        }
        $("#groupBar").html(html);
    }
    shiftEditor.prototype.getCellColor = function (shiftId)
    {
        if (!this.shifts)
            return "";
        for (var i = 0; i < this.shifts.length; i++)
        {
            var shift = this.shifts[i];
            if (shift.WorkShiftId == shiftId)
                return shift.Color;
        }
    }
    shiftEditor.prototype.renderShiftBar = function (data) {
        if (!data) return;
        this.shifts = data;
        var html = "";
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            html += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectShift(this,'" + item.WorkShiftId + "');\" />&nbsp;";
        }
        $("#shiftBar").html(html);
    }
    shiftEditor.prototype.loadGroups = function () {
        this.loadData("hr.attendgroups.getlist", "", function (data) {
            var html = "";
            if (!data) return;
            //debugger;
            if (data.length == 0)
            {
                html = "还没有排班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组";
            }
            //this.renderGroupBar(data);
            for (var i = 0; i < data.length; i++) {
                var item = data[i];
                html += "<div style=\"display:inline-block;border:solid 1px #0ff; background-color:#0ff;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\"><input type='checkbox' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" /> " + item.name + "</div>";
            }
            $("#groupBar").html(html);
        });
    }
    shiftEditor.prototype.loadShifts = function () {
        this.loadData("workshift.businessunit.getlist", "", function (data) {
            var html = "";
            if (!data) return;

            //this.renderShiftBar(data);
            
            for (var i = 0; i < data.length; i++) {
                var item = data[i];
                html += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectShift(this,'" + item.WorkShiftId + "');\" />&nbsp;";
            }
            $("#shiftBar").html(html);
            
        });
    }
    shiftEditor.prototype.initInfo = function (d) {
        try
        {
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
    shiftEditor.prototype.renderWeekCalendar = function (d) {
        var data = d.EmpShiftData;
        //debugger
        var html = "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        html += "<th rowspan='2'>姓名</th>";
        html += "<th rowspan='2'>层级</th>";
        var days = d.Days.length;       
        var clsweekEnd = "text-align:center;min-width:80px;color:red;";
        var clsweek = "text-align:center;min-width:80px;";
        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            /*
            if (this.showMemo) {
                if (wDay == 0 || wDay == 6)
                {
                    html += "<th class='' colspan='2'  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
                else
                    html += "<th class='' colspan='2' style='text-align:center;min-width:80px;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
            */
            if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) {
                html += "<th class=''  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
                html += "<th class=''  style='" + clsweek + "'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            //}
        }
        html += "<th rowspan='2'>时长</th><th rowspan='2'>夜班</th></tr>";

        html += "<tr class=\"\">";
        /*
        if (this.showMemo) {
            for (var c = 0; c < 7; c++) {
                html += "<th class='' style='text-align:center;'>班次</th><th class='zen-deemphasize' style='text-align:center;'>备注</th>";
            }
        }
        html += "</tr>";
        */
        html += "<tbody style=\"height:50px;overflow:auto;\">";
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
                    html2 += "<tr  class=\"odd\">";
                else
                    html2 += "<tr class=\"even\">";
                html2 += "<td class=\"nameCol1\">" + emp.Name + "</td>";
                html2 += "<td class=\"nameCol1\" >" + "" + "</td>";
               
                for (var h = 0; h < 7; h++) {
                    var empShift = emp.Shifts[h];
                    if (empShift == null) continue;

                    var empDayShifts = empShift.dayShifts;
                    var cellId = "c_" + emp.EmployeeId + "_" + empShift.WorkDay;
                    var memoTxtId = "memo_" + emp.EmployeeId + "_" + empShift.WorkDay;
                    var cellWidth = 98;
                    var cellHeight = 98;
                    html2 += "<td  id=\"" + cellId + "\"";
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:left;margin:0px;padding:0px;font-size:14px;' ";
                    html2 += " onclick=\"setEmpShift('" + emp.EmployeeId + "','" + emp.Name + "','" + empShift.WorkDay + "')\" >";
                    if (empDayShifts.length == 0) {
                        html2 += "</td>";
                    }
                    else {
                        //  html2 += " >";
                        if (empDayShifts.length > 1) {
                            cellWidth = Math.ceil(100 / empDayShifts.length);
                            cellHeight = Math.ceil(100 / empDayShifts.length);
                        }
                        else if (empDayShifts.length == 1) {
                            cellWidth = 96;
                            cellHeight = 98;
                        }
                    }

                    //start cell
                    for (k = 0; k < empDayShifts.length; k++) {
                        var shift = empDayShifts[k];
                        if (this.viewMode == 1) {
                            if (shift.Name == "") {
                               // html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";
                               // html2 += "</td>";
                            }
                            else {

                                var color = this.getCellColor(shift.WorkShiftId);
                                if (color == undefined || color == "")
                                    color = "background-color:#e8e8e9;";

                                html2 += "<div style='display:inline-block;width:100%;margin:0px;padding:0px;text-align:left;font-size:14px;height:" + cellHeight + "%;'>";
                                html2 += "<div  style='display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%;" + color + ";";
                                if (this.showMemo)
                                    html2 += "width:45%;'";
                                else
                                    html2 += "width:100%;'";

                                html2 += " id='" + shift.EmpWorkShiftId + "' ";
                                html2 += "  >";
                                html2 += shift.Name + "</div>";
                                if (this.showMemo) {
                                    memoTxtId = "memo_" + shift.EmpWorkShiftId;
                                    html2 += " <div  style='vertical-align:middle;cursor:pointer;display:inline-block;'>" + shift.Description + "</div>";
                                }
                                html2 += "</div>";
                                /*
                                var color = this.getCellColor(shift.WorkShiftId);
                                if (color != undefined && color != "")
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;" + color + "' ";
                                else
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";
                                html2 += " >";                              
                                html2 += shift.Name;
                                */
                            }
                            //if (this.showMemo)
                            //    html2 += "<div  style='vertical-align:middle;text-align:center;cursor:pointer;width:80px;'>" + shift.Description + "</div>";
                        }
                        else {
                            if (shift.Name == "") {
                                /*
                                html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";
                                html2 += " onclick=\"setEmpShift('" + emp.EmployeeId + "','" + emp.Name + "','" + shift.WorkDay + "')\" >";
                                html2 += "</td>";
                                if (this.showMemo)
                                    html2 += "<td  style='vertical-align:middle;text-align:center;cursor:pointer;width:80px;'><input class=\"memoText\" type=\"text\" valueid=\"" + shift.EmpWorkShiftId + "\"  empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></td>";
                                */
                            }
                            else {
                                var color = this.getCellColor(shift.WorkShiftId);
                                if (color == undefined || color == "")
                                    color = "background-color:#e8e8e9;";

                                html2 += "<div style='display:inline-block;width:96%;margin:0px;padding:0px;text-align:left;font-size:14px;height:" + cellHeight + "%;'>";
                                html2 += "<div  style='display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%;" + color + ";";
                                if (this.showMemo)
                                    html2 += "width:45%;'";
                                else
                                    html2 += "width:100%;'";

                                html2 += " id='" + shift.EmpWorkShiftId + "' ";
                                html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" >";
                                html2 += shift.Name + "</div>";
                                if (this.showMemo) {
                                    memoTxtId = "memo_" + shift.EmpWorkShiftId;
                                    html2 += "<div  style='vertical-align:middle;cursor:pointer;display:inline-block;'><input type=\"text\" onclick=\"memoInput(event)\" class=\"memoText\" valueid=\"" + shift.EmpWorkShiftId + "\" empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></div>";
                                }
                                html2 += "</div>";
                                /*
                                if (color != undefined && color != "")
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;" + color + "' ";
                                else
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;' ";
                                html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" >";
                                html2 += shift.Name + "</td>";
                                if (this.showMemo)
                                    html2 += "<td  style='vertical-align:middle;cursor:pointer;width:80px;'><input type=\"text\" class=\"memoText\" valueid=\"" + shift.EmpWorkShiftId + "\" empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></td>";
                                */
                            }
                        }
                    }
                    html2 += "</td>";
                    //end cell
                }
                html2 += "<td class=\"nameCol\"></td>";
                html2 += "<td class=\"nameCol\" ></td>";
                html2 += "</tr>";
            }

            //debugger;
            //create memo
            html2 += this.createGroupMemo(group,18);
        }

        html += html2;
        html += "</tbody></table>";
        //$("#shiftContainer1").append(html);
        $("#shiftContainer1").html(html);
    }
    shiftEditor.prototype.renderMonthCalendar = function (d) {
        //debugger;
        var data = d.EmpShiftData;
       
        var html = "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        html += "<th rowspan='2'>科室</th>";
        html += "<th rowspan='2'>姓名</th>";
        html += "<th rowspan='2'>层级</th>";
       
        var days = d.Days.length;
        //debugger;
        for (var j = 0; j < d.Days.length; j++)
        {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) {
                html += "<th class='' style='text-align:center;color:red;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else
                html += "<th class='' style='text-align:center;'>" + this.toWeekName(wDay) + yday + "</th>";
        }
        
        html += "<th rowspan='2'>时长</th><th rowspan='2'>夜班</th></tr>";
        html += "";
       
        var colSpan1 = (days + 4);
        html += "<tbody style=\"height:50px;overflow:auto;\">";
        var html2 = "";
        for (var i = 0; i < data.length; i++) {
            var group = data[i];
            //html += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\" />&nbsp;";
           // html2 += "<tr>";
           // html2 += "<td colspan='"+colSpan1+"'><div class=\"tgroup\" style=\"font-size:14px;font-weight:bold;padding-left:5px;\">" + group.GroupName + "</div></td>";
           // html2 += "</tr>";
            var emps = group.Employees;
            for (var j = 0; j < emps.length; j++) {
                var emp = emps[j];
                if ((j % 2) == 0)
                    html2 += "<tr>";
                else
                    html2 += "<tr class=\"even\">";
                html2 += "<td  style='vertical-align:middle;'>" + emp.DeptIdName + "</td>";
                html2 += "<td  nowrap='nowrap' style='vertical-align:middle;'>" + emp.Name + "</td>";
               // html2 += "<td class=\"nameCol1\" ></td>";
                html2 += "<td  style='vertical-align:middle;'>" + emp.NurseLevel + "</td>";
                for (var h = 0; h < days; h++) {
                    var empShift = emp.Shifts[h];
                    if (empShift == null)
                    {
                        html2 += "<td class=\"\" style=\"min-width:30px;\"></td>";
                        continue;
                    }
                    var empDayShifts = empShift.dayShifts;
                    var cellId = "c_" + emp.EmployeeId + "_" + empShift.WorkDay;
                    var memoTxtId = "memo_" + emp.EmployeeId + "_" + empShift.WorkDay;
                                       
                    var cellWidth = 98;
                    var cellHeight = 98;
                    html2 += "<td  id=\"" + cellId + "\"";
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:left;margin:0px;padding:0px;font-size:14px;' ";
                    html2 += " onclick=\"setEmpShift('" + emp.EmployeeId + "','" + emp.Name + "','" + empShift.WorkDay + "')\" >";
                    if (empDayShifts.length == 0) {
                        html2 += "</td>";
                    }
                    else {
                        //  html2 += " >";
                        if (empDayShifts.length > 1) {
                            cellWidth = Math.ceil(100 / empDayShifts.length);
                            cellHeight = Math.ceil(100 / empDayShifts.length);
                        }
                        else if (empDayShifts.length == 1) {
                            cellWidth = 96;
                            cellHeight = 98;
                        }
                    }

                    //start cell
                    for (k = 0; k < empDayShifts.length; k++) {
                        var shift = empDayShifts[k];

                        if (this.viewMode == 1) {
                            if (shift.Name == "") {
                               // html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;min-width:40px;' >";

                            }
                            else {
                                var color = this.getCellColor(shift.WorkShiftId);
                                if (color == undefined || color == "")
                                    color = "background-color:#e8e8e9;";

                                html2 += "<div style='display:inline-block;width:100%;margin:0px;padding:0px;text-align:left;font-size:14px;height:" + cellHeight + "%;'>";
                                html2 += "<div  style='display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%;" + color + ";";
                                if (this.showMemo)
                                    html2 += "width:45%;'";
                                else
                                    html2 += "width:100%;'";

                                html2 += " id='" + shift.EmpWorkShiftId + "' ";
                                html2 += "  >";
                                html2 += shift.Name + "</div>";
                                if (this.showMemo) {
                                    memoTxtId = "memo_" + shift.EmpWorkShiftId;
                                    html2 += " <div  style='vertical-align:middle;cursor:pointer;display:inline-block;'>" + shift.Description + "</div>";
                                }
                                html2 += "</div>";
                                /*
                                var color = this.getCellColor(shift.WorkShiftId);
                                if (color != undefined && color != "")
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;min-width:30px;" + color + "' ";
                                else
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;min-width:40px;' ";
                                html2 += " >";
                                html2 += shift.Name;
                                */
                            }

                        }
                        else {
                            if (shift.Name == "") {
                               // html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;min-width:40px;' ";
                               // html2 += " onclick=\"setEmpShift('" + emp.EmployeeId + "','" + emp.Name + "','" + shift.WorkDay + "')\" >";
                            }
                            else {

                                var color = this.getCellColor(shift.WorkShiftId);
                                if (color == undefined || color == "")
                                    color = "background-color:#e8e8e9;";

                                html2 += "<div style='display:inline-block;width:96%;margin:0px;padding:0px;text-align:left;font-size:14px;height:" + cellHeight + "%;'>";
                                html2 += "<div  style='display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%;" + color + ";";
                                if (this.showMemo)
                                    html2 += "width:45%;'";
                                else
                                    html2 += "width:100%;'";

                                html2 += " id='" + shift.EmpWorkShiftId + "' ";
                                html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" >";
                                html2 += shift.Name + "</div>";
                                if (this.showMemo) {
                                    memoTxtId = "memo_" + shift.EmpWorkShiftId;
                                    html2 += "<div  style='vertical-align:middle;cursor:pointer;display:inline-block;'><input type=\"text\" onclick=\"memoInput(event)\" class=\"memoText\" valueid=\"" + shift.EmpWorkShiftId + "\" empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></div>";
                                }
                                html2 += "</div>";
                                /*
                                var color = this.getCellColor(shift.WorkShiftId);
                                if (color != undefined && color != "")
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;min-width:40px;" + color + "' ";
                                else
                                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;min-width:40px;' ";

                                html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" >";
                                html2 += shift.Name;
                                */

                            }
                        }
                    }
                    html2 += "</td>";
                    //end cell
                }
                html2 += "<td class=\"nameCol\"></td>";
                html2 += "<td class=\"nameCol\" ></td>";
                html2 += "</tr>";

                
            }
            //debugger;
            //create memo
            //html2 += this.createGroupMemo(group, colSpan1);
        }

        html += html2;
        html += "</tbody></table>";
        //$("#shiftContainer1").append(html);
        $("#shiftContainer1").html(html);
    }
    shiftEditor.prototype.createGroupMemo = function (group, colSpan1) {
        var html2 = "";
        html2 += "<tr>";
        html2 += "<td class=\"\" style=\"vertical-align:middle;\">护士长留言</td>";
        if (this.viewMode == 1) {
            html2 += "<td class=\"\" colspan='" + colSpan1 + "' style=\"text-align:left;margin:5px;padding-left:10px;\">" + group.LeaveMessage + "</td>";
        }
        else
            html2 += "<td class=\"\" colspan='35'><textarea id=\"txtNurseMessage\" class=\"weekBz\" style=\"WIDTH: 99%;\" rows=\"5\">" + group.LeaveMessage + "</textarea></td>";

        html2 += "</tr>";
        html2 += "<tr>";
        html2 += "<td class=\"\" style=\"vertical-align:middle;\">备注</td>";
        if (this.viewMode == 1) {
            html2 += "<td class=\"\" colspan='48' style=\"text-align:left;margin:5px;padding-left:10px;\">" + group.Description + "</td>";
        }
        else
            html2 += "<td class=\"\" colspan='48'><textarea id=\"txtDescription\" name=\"txtDescription\" class=\"weekBz\" style=\"WIDTH: 99%;\" rows=\"5\">" + group.Description + "</textarea></td>";

        html2 += "</tr>"
        return html2;
    }
    shiftEditor.prototype.renderGrid = function (d) {
        this.initInfo(d);
        //debugger;
        if(this.calendar==2) // week calendar
            this.renderWeekCalendar(d);
        else
            this.renderMonthCalendar(d);
    }
    shiftEditor.prototype.loadDesigner = function (para) {
        var self = this;
        this.loadData("attendance.employeeshift.search", para, function (data) {
            var html = "";
            var deptName = "";
            if (!data) return;
            /*
            if (self.searchMode)
            {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;人员排班表";
            }
            else
            {              
                
            }
            */
            if (data.UnitName)
                deptName = data.UnitName;
            if (data.BussinessUnitName)
                deptName = data.BussinessUnitName;
            //document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;" + deptName + " 人员排班表";
            document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;" + " 人员排班表";
           // debugger;
            if (self.viewMode == 2) {
                //document.getElementById("dateText").innerHTML = data.StartDate + " 至 " + data.EndDate;
                self.renderShiftBar(data.Shifts);
            }
            self.renderGroupBar(data.Groups, data.UnitId);
            self.unitId = data.UnitId;
            self.renderGrid(data);

        });
    }
    shiftEditor.prototype.previousWeek= function () {
        var nextWeek = 0;
        if (this.weekNumber == 1) {
            // nextWeek = ((this.weekNumber * 1) + 1);
            this.year--;
            nextWeek = 53;
        }
        else {
            nextWeek = ((this.weekNumber * 1) - 1);
        }
        var para = "md2=" + nextWeek;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + this.unitId;
        //para += "&md0=" + this.year;
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    shiftEditor.prototype.nextWeek = function () {
        var nextWeek = 0;
        if (this.weekNumber == 53) {
           // nextWeek = ((this.weekNumber * 1) + 1);
        }
        else {
            nextWeek = ((this.weekNumber * 1) + 1);
        }

        var para = "md2=" + nextWeek;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + this.unitId;
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    shiftEditor.prototype.previous = function () {
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
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + this.unitId;
        //para += "&md0=" + this.year;
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    shiftEditor.prototype.next= function () {
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
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + this.unitId;
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    shiftEditor.prototype.refresh = function () {
       
        var para = "md2=" + this.weekNumber;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + this.unitId;
        this.loadDesigner(para);
        
    }
    shiftEditor.prototype.saveDB = function () {
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
            data:json
        };
        this.postData("workshift.designer.save", data,null, function () { });
    }
    /*删除数据*/
    shiftEditor.prototype.clearData = function () {
        var startDate = this.startDate;
        var  endDate = this.endDate;
        var groupIds = "";
        for (var i = 0; i < this.groups.length; i++) {
            if (i > 0)
                groupIds += ",";
            var g = this.groups[i];
            groupIds += g.id;
        }
        var weekNum = this.weekNumber;
        var url = "/apps/HrProcessor.ashx?cmd=workshift.designer.clear&group=1&startDate=" + startDate + "&endDate=" + endDate + "&groupIds=" + groupIds;
        url += "&md0=" + this.year;
        url += "&md1=" + this.month;
        url += "&md2=" + this.weekNumber;
        url += "&unitType=" + this.unitType;
        url += "&unitId=" + this.unitId;
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
    shiftEditor.prototype.loadGroupEmployees = function () {
        //
        var html = "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        html += "<th rowspan='2'>科室</th>";
        html += "<th rowspan='2'>姓名</th>";
        html += "<th rowspan='2'>层级</th>";
        for (var w = 1; w <= 7; w++) {
            html += "<th class='' colspan='2' style='text-align:center;'>周" + w + "</th>";
        }
        html += "</tr><tr class=\"\">";
        html += "";
        for (var c = 0; c < 7; c++) {
            html += "<th class='' style='text-align:center;'>班次</th><th class='zen-deemphasize' style='text-align:center;'>备注</th>";
        }
        html += "</tr><tbody>";

        try {
            var html2 = "";
            this.loadData("workshift.group.employees.getlist", "", function (data) {
                //var html = "";
                //debugger;
                if (!data) return;
                for (var i = 0; i < data.length; i++) {
                    var group = data[i];
                    //html += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\" />&nbsp;";
                    html2 += "<tr>";
                    html2 += "<td colspan='16'><div class=\"tgroup\" style=\"font-size:14px;font-weight:bold;\">" + group.GroupName + "</div></td>";
                    html2 += "</tr>";
                    var emps = group.Employees;
                    for (var j = 0; j < emps.length; j++) {
                        var emp = emps[j];
                        html2 += "<tr>";
                        html2 += "<td >" + emp.Name + "</td>";
                        html2 += "<td >" + emp.Name + "</td>";

                        for (var h = 0; h < 7; h++) {
                            var shift = emp.Shifts[h];
                            var cellId = "c_" + emp.EmployeeId + "_" + shift.WorkDay;
                            html2 += "<td style='vertical-align:middle;cursor:pointer;text-align:center;' id=\"" + cellId + "\"";
                            if (shift.Name == "") {
                                html2 += " onclick=\"setEmpShift('" + emp.EmployeeId + "','" + emp.Name + "','" + shift.WorkDay + "')\" >";
                                html2 += "</td>";
                                html2 += "<td  style='vertical-align:middle;text-align:center;cursor:pointer;'>" + shift.Description + "</td>";
                            }
                            else {
                                html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId  +  "')\" >";

                                html2 += shift.Name + "</td>";
                                html2 += "<td  style='vertical-align:middle;cursor:pointer;'>" + shift.Description + "</td>";
                            }
                        }
                        html2 += "</tr>";
                    }
                }
            });
            html += html2;
        }
        catch (e)
        { }

        html += "</tbody></table>";
        $("#shiftContainer1").append(html);

    }
    shiftEditor.prototype.loadData = function (method, para, callback) {
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
            type: "POST",
            url: url
        });
    }
    shiftEditor.prototype.postData = function (method, d, para, callback) {
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
    };    
    shiftEditor.prototype.init = function (md0,md1,md2,unitId,startDate,endDate) {
        var para = "";
        if (md0) this.year = md0;
        if (md1) this.month = md1;
        //debugger;
        para = "md0=" + this.year;
        para += "&md1=" + this.month;
        if (md2 && md2 != "") {
            this.weekNumber = md2;
            para += "&md2=" + this.weekNumber;
        }
        para += "&calendar=" + this.calendar;
        para += "&unitType=" + this.unitType;
        if (unitId) {
            this.unitId = unitId;           
            para += "&unitId=" + unitId;
        }
        if (startDate) {
            this.startDate = startDate;
            para += "&startDate=" + startDate;
        }
        if (endDate) {
            this.endDate = endDate;
            para += "&endDate=" + endDate;
        }
        //if (this.searchMode)
        //    para += "&searchMode=1";
        //this.loadGroups();
        //this.loadShifts();
        //this.loadGroupEmployees();   
        this.loadDesigner(para);

    };
    shiftEditor.prototype.search = function (searchText, unitId) {
        var para = "";
       
        para = "md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&md2=" + this.weekNumber;
        para += "&calendar=" + this.calendar;
        //para += "&searchMode=1";
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + unitId;
        para += searchText;
        this.loadDesigner(para);

    };
    shiftEditor.prototype.render = function () {
        if (this.viewMode == 1) {
            renderMonthCalendar();
        }
        if (this.viewMode == 2) {
            renderWeekCalendar();
        }
    };
    shiftEditor.prototype.toWeekName = function (dayOfWeek) {
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
function saveGroupShiftDescription(startDate, endDate, yearNum,monthNum, weekNum, groupId,updateMemo, nurseMessage, desc) {
    var url = "/apps/HrProcessor.ashx?cmd=attendgroup.shift.save&startDate=" + startDate + "&endDate=" + endDate;
    url += "&YearNumber=" + yearNum;
    url += "&MonthNumber=" + monthNum;
    url += "&WeekNumber=" + weekNum;
    jQuery.ajax({
        async: true, cache: false, dataType: "JSON",
        data: {
            groupId:groupId,
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

    saveGroupShiftDescription(editor.startDate, editor.endDate, editor.year, editor.month, editor.weekNumber, editor.unitId, updateMemo, nurseMessage, desc1);
    if (editor.showMemo)
        editor.saveDB();
}
function previousWeek() {
    editor.previousWeek();
}
function nextWeek()
{
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
function searchMonthEmpShifts()
{
    var search = "";
    var deptId = document.getElementById("DeptId_lkid").value;
    if (deptId == "")
    {
       // alert("请选择查询部门。");
       // return;
    }
    //editor.year = document.getElementById("yearNumber").value;
    //editor.month = document.getElementById("monthNumber").value;
    editor.searchMode = true;    
    //debugger;
    search = "&DeptId=" + deptId;
    //search = "&unitId=" + deptId;
    editor.unitId = deptId;
    search += "&name=" + encodeURIComponent(document.getElementById("empName").value);
    editor.startDate = document.getElementById("startDate").value;
    editor.endDate = document.getElementById("endDate").value;
   
    search += "&startDate=" + editor.startDate;
    search += "&endDate=" + editor.endDate;

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
function copyGroupWorkshift() {
    var sDate = jQuery("#startDate").val();
    var eDate = jQuery("#endDate").val();
    //var weekNum = jQuery("#dphe_md2").val();
    //var md0 = jQuery("#dphe_md0").val();
    var weekNum = jQuery("#md2").val();
    var md0 = jQuery("#md0").val();
    var url1 = '/attend/cloneEmpshifts.aspx?t=06e&start=' + sDate + '&end=' + eDate + '&md0=' + md0 + '&weekNum=' + weekNum + "&retURL=";
    //showDialog(url1,"copyGroupEmpshift","复制排班",600,800);
}
function printCalendar() {
    //editor.nextWeek();
    var showm = (editor.showMemo ? "1":"0");
    var url = "/_ui/hr/attend/empshift/print?md0=" + editor.year + "&md1=" + editor.month + "&md2=" + editor.weekNumber + "&unitId=" + editor.unitId + "&calendar=" + editor.calendar + "&showMemo=" + showm;
    printWin(url);
}