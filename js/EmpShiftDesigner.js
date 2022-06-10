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
    shiftEditor.prototype.viewMode = 1; //1 - view , 2 edit
    shiftEditor.prototype.calendar = 2; //1 - month , 2 week    
    shiftEditor.prototype.startDate = "";
    shiftEditor.prototype.endDate = "";
    shiftEditor.prototype.unitType = 30041; //10 dept 30041 attendgroup
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
        if (data.length == 0) {
            html = "<div style=\"border-radius: 4px;border-color: #39f;background-color: #ffc;border-style: solid;border-width: 1px;color: #000;padding: 6px 8px 6px 6px;margin: 4px 20px;\">您还没有管理任何排班班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组</div>";
        }
        this.groups = data;
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            if (i == 0 || item.id == curentUnitId) {
                html += "<div style=\"display:inline-block;border:solid 1px #0ff;background-color:#0ff;margin-left:5px;margin-top:5px;margin-bottom:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" onclick=\"editor.search('',this.value)\" data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\" /> " + item.name + "</div>";
            }
            else {
                html += "<div style=\"display:inline-block;border:solid 1px #eee;background-color:#eee;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" onclick=\"editor.search('',this.value)\" data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\" /> " + item.name + "</div>";
            }
        }
        $("#groupBar").html(html);
    }
    shiftEditor.prototype.getCellColor = function (shiftId)
    {
        for (var i = 0; i < this.shifts.length; i++)
        {
            var shift = this.shifts[i];
            if (shift.WorkShiftId == shiftId)
                return shift.Color;
        }
    }
    shiftEditor.prototype.renderShiftBar = function (data) {
        this.shifts = data;
        if (this.viewMode == 1) return; // 查询模式，不显示班次
        var html = "";
        var c1 = "<div style=\"background-color:#ebebeb;margin-top:5px;margin-bottom:10px;border:1px solid #e6e6e6;line-height:25px;\">";
        var c2 = "<div style=\"background-color:#ebebeb;margin-top:8px;margin-bottom:0px;border:1px solid #ebebeb;line-height:25px;\">";
        c2 += "<input type=\"button\" name=\"btnWorkShift\" id='btnWorkShift_0' class=\"btnShift\" value=\"清除选择\" title=\"清除选择的班次\" onclick=\"clearSelectShift()\" />&nbsp;&nbsp;";
        /*
          <input type=\"button" name="btnWorkShift" id='btnWorkShift_0' class="btnShift" value="清除选择" title="清除选择的班次" onclick="clearSelectShift()" />";
        */
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            if (item.ShiftTypeCode == 30022) //请假
            {
                c1 += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectShift(this,'" + item.WorkShiftId + "');\" />&nbsp;";
            }
            else
                c2 += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectShift(this,'" + item.WorkShiftId + "');\" />&nbsp;";
        }
        c2 += "</div>";
        c1 += "</div>";
        html += c2;
        html += c1;
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
                html += "<div style=\"display:inline-block;border:solid 1px #0ff; background-color:#0ff;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\"><input type='checkbox' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" data-name=\"" + item.name + "\" /> " + item.name + "</div>";
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
      
        var html = "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        //checkbox选择
        if (this.viewMode != 1) {
            html += "<th rowspan='2'></th>";
        }
        html += "<td style=\"width: 40px\" rowspan='2'></td>";
        html += "<th rowspan='2'>姓名</th>";
       
        var days = d.Days.length;       
        var clsweekEnd = "text-align:center;min-width:80px;color:red;";
        var clsweek = "text-align:center;min-width:80px;";
        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            
            if (this.showMemo) {
                if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) 
                {
                    html += "<th class='' colspan='2'  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
                else
                    html += "<th class='' colspan='2' style='text-align:center;min-width:80px;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
            
                if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) {
                    html += "<th class=''  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
                else {
                    html += "<th class=''  style='" + clsweek + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
            }
        }
        // html += "<th class='' style='text-align:center;'>总时长</th><th class='zen-deemphasize' style='text-align:center;'>夜班</th>";
        html += "<th class='' style='text-align:center;'  rowspan='2'>总工时长</th><th class='zen-deemphasize' style='text-align:center;'  rowspan='2'>夜班</th><th rowspan='2'>备注</th></tr>";

        html += "<tr class=\"\">";
        
        if (this.showMemo) {
            for (var c = 0; c < 7; c++) {
                html += "<th class='' style='text-align:center;'>班次</th><th class='zen-deemphasize' style='text-align:center;'>管床</th>";
            }
        }
       
        html += "</tr>";
       //debugger;
        html += "<tbody style=\"height:50px;overflow:auto;\">";
        var html2 = "";
        for (var i = 0; i < data.length; i++) { //
            var group = data[i];
            //html += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\" />&nbsp;";
            //html2 += "<tr>";
            //html2 += "<td colspan='18'><div class=\"tgroup\" style=\"font-size:14px;font-weight:bold;padding-left:5px;\">" + group.GroupName + "</div></td>";
            //html2 += "</tr>";
            var emps = group.Employees;
            for (var j = 0; j < emps.length; j++) {
                var emp = emps[j];
                if ((j % 2) == 0)
                    html2 += "<tr class='odd'>";
                else
                    html2 += "<tr class=\"even\">";
                
                //编辑状态
                if (this.viewMode != 1) {
                    
                    html2 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chkemp_" + emp.EmployeeId + "' dataname='" + emp.Name + "' /></td>";
                }
                html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + (j + 1) + "</td>";
                
                html2 += "<td class=\"nameCol1\" style='vertical-align:middle;' nowrap=\"nowrap\">" + emp.Name + "</td>";
                var nl = "";
                //if (emp.NurseLevel) {
                //    if (emp.NurseLevel != "")
                //        nl = "N" + emp.NurseLevel
                //}
                //html2 += "<td class=\"nameCol1\" style='vertical-align:middle;'>" + nl + "</td>";
               
                for (var h = 0; h < 7; h++) {
                    var empShift = emp.Shifts[h];
                    if (empShift == null) continue;

                    var empDayShifts = empShift.dayShifts;
                    var cellId = "c_" + emp.EmployeeId + "_" + empShift.WorkDay;
                    var memoTxtId = "memo_" + emp.EmployeeId + "_" + empShift.WorkDay;
                    var cellWidth = 98;
                    var cellHeight = 98;
                    html2 += "<td  id=\"" + cellId + "\" title=\"" + emp.Name + " " + empShift.WorkDay + "\"";
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:left;margin:0px;padding:0px;vertical-align:middle;font-size:14px;' ";
                    if (this.viewMode == 1)
                    {
                        html2 += " onclick=\"\" >";
                    }
                    else
                        html2 += " onclick=\"setEmpShift('" + emp.EmployeeId + "','" + emp.Name + "','" + empShift.WorkDay + "')\" >";
                   
                    if (empDayShifts.length == 0) {
                        html2 += "</td>";                        
                    }
                    else {                       
                        if (empDayShifts.length > 1) {
                            cellWidth = Math.ceil(100 / empDayShifts.length);
                            cellHeight = Math.ceil(100 / empDayShifts.length);
                        }
                        else if (empDayShifts.length == 1) {
                            cellWidth = 96;
                            cellHeight = 98;
                        }
                    }
                    var strShifts = "";
                    var strMemos = "";
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
                                if (shift.canEdit) {
                                    //display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%;background-color:#e8e8e9;;width:100%;
                                    html2 += "<div style='display:inline-block;width:100%;margin:0px;padding:0px;text-align:left;height:" + cellHeight + "%;'>";

                                    html2 += " <div id='" + shift.EmpWorkShiftId + "' ";
                                    html2 += "  style='display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%;width:100%;" + color + "'";
                                    //html2 += "'";
                                    html2 += "  >";

                                    html2 += shift.Name + "</div>";
                                    html2 += "</div>";
                                }
                                

                                if (this.showMemo) {
                                    memoTxtId = "memo_" + shift.EmpWorkShiftId;
                                    strMemos += "<div style='display:inline-block;width:96%;margin:0px;padding:0px;text-align:center;height:" + cellHeight + "%;'>";
                                    strMemos += " <div  style='vertical-align:middle;cursor:pointer;display:inline-block;'>" + shift.Description + "</div>";
                                    strMemos += "</div>";
                                }
                                
                            }
                            
                        }
                        else {
                            var color = this.getCellColor(shift.WorkShiftId);
                            if (color == undefined || color == "")
                                color = "background-color:#e8e8e9;";

                            strShifts += "<div style='display:inline-block;width:96%;margin:0px;padding:0px;text-align:left;height:" + cellHeight + "%;'>";
                            strShifts += " <div id='" + shift.EmpWorkShiftId + "' ";
                            strShifts += "  style='display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%;width:100%;";
                           
                            //debugger;
                            //if (shift.BatchId != "" && shift.BatchId != this.unitId) { //如果该员工是其它组排的，不可以删除
                             //   //alert("is same!");
                           //     strShifts += "background-color:#e8e8e9;' title=\"该班次，其它科室排的。\" "
                           // }
                            //else {
                                //debugger;
                                strShifts += color + "'";
                                strShifts += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" ";
                           // }

                            strShifts += " >";
                            strShifts += shift.Name + "</div>";
                            strShifts += "</div>";

                            if (this.showMemo) {
                                memoTxtId = "memo_" + shift.EmpWorkShiftId;
                                strMemos += "<div style='display:inline-block;width:96%;margin:0px;padding:0px;text-align:center;height:" + cellHeight + "%;'>";
                                strMemos += " <div  style='vertical-align:middle;cursor:pointer;display:inline-block;'><input type=\"text\" onclick=\"memoInput(event)\" class=\"memoText\" valueid=\"" + shift.EmpWorkShiftId + "\" empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></div>";
                                strMemos += "</div>";
                            }
                            
                        }
                    } //end form

                    html2 += strShifts;
                    html2 += "</td>"; //end 班次
                    //start 备注
                    if (this.showMemo)
                    {
                        html2 += "<td  style='vertical-align:middle;cursor:pointer;width:80px;text-align:center;'>";
                        html2 += strMemos;
                        html2 += "</td>";
                    }
                    //end cell
                }
                html2 += "<td class=\"\" style=\"vertical-align:middle;\">" + emp.WorkHours + "</td>";
                html2 += "<td class=\"\"  style=\"vertical-align:middle;\">" + emp.NightHours + "</td>";
                html2 += "<td class=\"\"  style=\"vertical-align:middle;width:100px;\">" + "" + "</td>";
                html2 += "</tr>";
            }

            //debugger;
            //create memo
            html2 += this.createGroupMemo(group,19);
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
        //checkbox选择
        if (this.viewMode != 1) {
            html += "<th></th>";
        }
        html += "<th rowspan='2'>姓名</th>";
        //debugger;
        var clsweekEnd = "text-align:center;color:red;";
        var clsweek = "text-align:center;";
        var days = d.Days.length;
       
        for (var j = 0; j < d.Days.length; j++)
        {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            //html += "<th class='' style='text-align:center;'>" + this.toWeekName(wDay) + yday + "</th>";
            if (this.showMemo) {
                if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) {
                    html += "<th class='' colspan='2'  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
                else
                    html += "<th class='' colspan='2' style='text-align:center;min-width:80px;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {

                if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) {
                    html += "<th class=''  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
                else {
                    html += "<th class=''  style='" + clsweek + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
            }
        }
        //<th rowspan='2'>时长</th>
        //html += "<th rowspan='2'>出勤/天</th></tr>";
        html += "";
       
        var colSpan1 = (days + 4);
        html += "<tbody style=\"height:50px;overflow:auto;\">";
        var html2 = "";
        for (var i = 0; i < data.length; i++) {
            var group = data[i];
            //html += "<input type='button' id='" + item.WorkShiftId + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\" />&nbsp;";
            //html2 += "<tr>";
            //html2 += "<td colspan='"+colSpan1+"'><div class=\"tgroup\" style=\"font-size:14px;font-weight:bold;padding-left:5px;\">" + group.GroupName + "</div></td>";
            //html2 += "</tr>";
            //debugger;
            var emps = group.Employees;
            for (var j = 0; j < emps.length; j++) {
                var emp = emps[j];
                if ((j % 2) == 0)
                    html2 += "<tr>";
                else
                    html2 += "<tr class=\"even\">";
                //编辑状态
                if (this.viewMode != 1) {
                    html2 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chkemp_" + emp.EmployeeId + "' dataname='" + emp.Name + "' /></td>";
                }
                html2 += "<td class=\"nameCol1\" style='vertial-align:middle;'  nowrap=\"nowrap\">" + emp.Name + "</td>";
                //var nl = "";
                //if (emp.NurseLevel) {
                //    if (emp.NurseLevel != "")
                //        nl = "N" + emp.NurseLevel
                //}
                //html2 += "<td class=\"nameCol1\" style='vertical-align:middle;'>" + nl + "</td>";

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
                    html2 += "  title=\"" + emp.Name +" "+ empShift.WorkDay + "\"";
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:left;margin:0px;padding:0px;' ";
                    if (this.viewMode == 1)
                    {
                        html2 += " onclick=\"void()\" >";
                    }
                    else
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

                                if (shift.canEdit) {
                                    html2 += "<div style='display:inline-block;width:100%;margin:0px;padding:0px;text-align:left;height:" + cellHeight + "%;'>";
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
                                }
                                
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
                                //if (color == undefined || color == "")
                                //    color = "background-color:#e8e8e9;";

                                //html2 += "<div style='display:inline-block;width:96%;margin:0px;padding:0px;text-align:left;height:" + cellHeight + "%;'>";
                                html2 += "<div style='display:inline-block;width:96%;margin:0px;padding:0px;text-align:left;'>";
                                //white-space:nowrap;
                                html2 += "<div id='" + shift.EmpWorkShiftId + "' ";
                                html2 += "  style='display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;";
                                
                                if (this.showMemo)
                                    html2 += "width:45%;";
                                else
                                    html2 += "width:100%;";
                                //debugger;
                                //if (shift.BatchId!="" && shift.BatchId != this.unitId) { //如果该员工是其它组排的，不可以删除
                                 //   //alert("is same!");
                                //    html2 += "background-color:#e8e8e9;' title=\"该班次，其它科室排的。\" "
                                //}
                                //else {
                                   //debugger;
                                    html2 += color+"'";
                                    html2 += " onclick=\"delEmpShift('" + shift.EmpWorkShiftId + "','" + cellId + "')\" ";
                                //}
                                html2 += ">";

                                html2 += shift.Name + "</div>";
                                if (this.showMemo) {
                                    memoTxtId = "memo_" + shift.EmpWorkShiftId;
                                    html2 += "<div  style='vertical-align:middle;cursor:pointer;display:inline-block;'><input type=\"text\" onclick=\"memoInput(event)\" class=\"memoText\" valueid=\"" + shift.EmpWorkShiftId + "\" empid=\"" + emp.EmployeeId + "\" day=\"" + shift.WorkDay + "\" id=\"" + memoTxtId + "\" value=\"" + shift.Description + "\" /></div>";
                                }
                                html2 += "</div>";
                               

                            }
                        }
                    }
                    html2 += "</td>";
                    //end cell
                }
                //html2 += "<td class=\"nameCol1\">" + emp.WorkHours + "</td>";
                //html2 += "<td class=\"nameCol1\" style=\"color:green;\">" + emp.AttendDays + "</td>";
                html2 += "</tr>";
            }
            //debugger;
            //create memo
            //html2 += this.createGroupMemo(group, colSpan1);
        }
        html2 += this.createGroupMonthMemo(d.Group, colSpan1);
        html += html2;
        html += "</tbody></table>";
        //$("#shiftContainer1").append(html);
        $("#shiftContainer1").html(html);
    }
    shiftEditor.prototype.createGroupMemo = function (group, colSpan1) {
        var html2 = "";
        html2 += "<tr>";
        html2 += "<td class=\"\" style=\"vertical-align:middle;\">留言</td>";
        if (this.viewMode == 1) {
            html2 += "<td class=\"\" colspan='" + colSpan1 + "' style=\"text-align:left;margin:5px;padding-left:10px;\">" + group.LeaveMessage + "<pre></pre></td>";
        }
        else
            html2 += "<td class=\"\" colspan='35'><textarea id=\"txtNurseMessage\" class=\"weekBz\" style=\"WIDTH: 99%;\" rows=\"5\">" + group.LeaveMessage + "</textarea></td>";

        html2 += "</tr>";
        html2 += "<tr>";
        html2 += "<td class=\"\" style=\"vertical-align:middle;\">备注</td>";
        if (this.viewMode == 1) {
            html2 += "<td class=\"\" colspan='48' style=\"text-align:left;margin:5px;padding-left:10px;\">" + group.Description + "<pre></pre></td>";
        }
        else
            html2 += "<td class=\"\" colspan='48'><textarea id=\"txtDescription\" name=\"txtDescription\" class=\"weekBz\" style=\"WIDTH: 99%;\" rows=\"5\">" + group.Description + "</textarea></td>";

        html2 += "</tr>"
        return html2;
    }
    /*
      月排班备注
    */
    shiftEditor.prototype.createGroupMonthMemo = function (group, colSpan1) {
        var html2 = "";
        html2 += "<tr>";
        html2 += "<td class=\"\" style=\"vertical-align:middle;\">留言</td>";
        if (this.viewMode == 1) {
            html2 += "<td class=\"\" colspan='" + colSpan1 + "' style=\"text-align:left;margin:5px;padding-left:10px;\">" + group.LeaveMessage + "<pre></pre></td>";
        }
        else
            html2 += "<td class=\"\" colspan='35'><textarea id=\"txtNurseMessage\" class=\"weekBz\" style=\"WIDTH: 99%;\" rows=\"5\">" + group.LeaveMessage + "</textarea></td>";

        html2 += "</tr>";
        html2 += "<tr>";
        html2 += "<td class=\"\" style=\"vertical-align:middle;\">备注</td>";
        if (this.viewMode == 1) {
            html2 += "<td class=\"\" colspan='48' style=\"text-align:left;margin:5px;padding-left:10px;\">" + group.Description + "<pre></pre></td>";
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

        closeShiftBar(1);
        closeShiftButtons(1);
        var self = this;
        this.loadData("workshift.designer.init", para, function (data) {
            var html = "";
            if (!data) return;
            /*
            if (data.closePeriod) //关闭考勤上报
            {
                self.viewMode = 1; //设置成View Mode
                closeShiftBar(0);
                closeShiftButtons(0);
                //关闭状态
                var statusContainer1 = document.getElementById("statusContainer");
                if (statusContainer1)
                    statusContainer1.style.display = "none";
            }
            */
            if (data.Group.ShiftStatusCode == 0) {
                /*
                var eleShiftBar = document.getElementById("shiftBar");
                if (eleShiftBar) {
                    eleShiftBar.style.display = "block";
                    jQuery("#actionToolBar").show();
                }
                jQuery("#actionCancelBar").hide();
                */
                closeShiftBar(1);
                closeShiftButtons(1);            
            }
            if (data.Group.ShiftStatusCode == 1) {
                closeShiftBar(0);
                closeShiftButtons(0);
            }
            document.getElementById("calendarHeader").innerHTML = data.BussinessUnitName + "&nbsp;&nbsp;职工排班表";
            $('#shiftName').html(data.UnitName)
            $('#status').html(data.Group.ShiftStatusName)
            $('#shifttime').html(data.Year + '年' + data.MonthNumber+'月')
            //debugger;
            var elTitle = document.getElementById("dateText");
            if (elTitle)
                elTitle.innerHTML = data.StartDate + " 至 " + data.EndDate;
            //编辑模式
            if (self.viewMode == 2) {
               // debugger
                self.renderShiftBar(data.Shifts);

                if (data.Group.ShiftStatusCode == 1) //已提交
                {
                    document.getElementById("shiftStatusName").innerHTML = "已提交";
                    jQuery("#btnSubmitBatch").attr("value", "撤销提交");
                    jQuery("#btnSubmitBatch").attr("onclick", "submitGroupWorkshiftStatus(0)");
                    jQuery("#btnSaveBatch").attr("disabled", "disabled");
                    jQuery("#btnDeleteSelectShift").attr("disabled", "disabled");
                    closeShiftBar(0);
                    closeShiftButtons(0);
                }
                else {
                    document.getElementById("shiftStatusName").innerHTML = "未提交";
                    jQuery("#btnSubmitBatch").attr("value", "提交排班");
                    jQuery("#btnSubmitBatch").attr("onclick", "submitGroupWorkshiftStatus(1)");
                    jQuery("#btnDeleteSelectShift").removeAttr("disabled");
                    jQuery("#btnSaveBatch").removeAttr("disabled");
                    closeShiftBar(1);
                    closeShiftButtons(1);
                }
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
        //this.weekNumber = nextWeek;
        var para = "md2=" + nextWeek;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + this.unitId;
        para += "&nextweek=1";
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    shiftEditor.prototype.previous = function () {
        var nextWeek = 0;
        //debugger;
        if (this.calendar == 1) {
            if (this.month == 1) {
                // nextWeek = ((this.weekNumber * 1) + 1);
                this.year--;
                this.month = 12;
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
        //debugger;
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
                this.year++;
                this.weekNumber = 1;
            }
            else {
                nextWeek = ((this.weekNumber * 1) + 1);
                this.weekNumber = nextWeek;
            }
        }
        var para = "md2=" + nextWeek;
        para += "&md0=" + this.year;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        para += "&unitType=" + this.unitType;
        para += "&unitId=" + this.unitId;
        this.loadDesigner(para);
       // this.weekNumber++;
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
        /*
        for (var i = 0; i < this.groups.length; i++) {
            if (i > 0)
                groupIds += ",";
            var g = this.groups[i];
            groupIds += g.id;
        }
        */
        $("input[name=attendGroup]").each(function (i, elment) {
            var i = 0;
            var check = $(this).attr("checked");
            if (check) {
                groupIds = $(this).val();
                //unitName = $(this).attr("data-name");
                //break;
            }
        });
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
        html += "<th rowspan='2'>姓名</th>";
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
                //debugger;
                callback(data);
            },
            type: "GET",
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
    shiftEditor.prototype.init = function (md0,md1,md2,unitId) {
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
        if (unitId)
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

function closeStatusBar()
{
    
}
function closeShiftBar(status) {
    //关闭班次
    var eleShiftBar = document.getElementById("shiftBar");
    if (eleShiftBar)
    {
        if (status == 0)
            eleShiftBar.style.display = "none";
        else
            eleShiftBar.style.display = "block";
    }
}
function closeShiftButtons(status) {
    //关闭工具条
    var shiftButtons1 = document.getElementById("shiftButtons");
    if (shiftButtons1) {
        if (status == 0)
            shiftButtons1.style.display = "none";
        else
            shiftButtons1.style.display = "block";
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
    var url = "/apps/HrProcessor.ashx?cmd=workshift.attendgroup.month.save&startDate=" + startDate + "&endDate=" + endDate;
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
    //debugger;
    //if (editor.weekNumber > 0) {
        saveGroupShiftDescription(editor.startDate, editor.endDate, editor.year, editor.month, editor.weekNumber, editor.unitId, updateMemo, nurseMessage, desc1);
    //}
    if (editor.showMemo) {
        editor.saveDB();
    }
    alert("保存成功！");
}
/*

*/
function submitGroupWorkshiftStatus(status) {
    //var attendYear = jQuery("#yearNumber").val();
    //var attendMonth = jQuery("#monthNumber").val();
    var attendYear = jQuery("#md0").val();
    var attendMonth = jQuery("#md1").val();
    jQuery("#selWorkShift").val("");
    //document.getElementById("selWorkShift").value = "";
    var unitId = "";

    $("input[name=attendGroup]").each(function (i, elment) {
        var i = 0;
        var check = $(this).attr("checked");
        if (check) {
            if (i > 0)
                deptId += ",";
            var text = $(this).val();
            unitId += text;
            i++;
        }

    });
    var a = "你确定要提交上报当前组的排班吗？";
    if (status == 0)
        a = "你确定要撤销提交上报当前组的排班吗？";
    if (Modal.confirm(a)) {

        var url = "/apps/HrProcessor.ashx?cmd=workshift.group.month.submit";
        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                objectTypeCode: 30041,
                unitId: unitId,
                status: status,
                desc: document.getElementById("txtDescription").value,
                leaveMessage: document.getElementById("txtNurseMessage").value
            },
            error: function (request, textStatus, errorThrown) {
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                //debugger;
                //callBack(data);
                showMonth();
            },
            type: "POST",
            url: url
        });

    }
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

function clearEmpWeekShift() {
    var s = document.getElementById("startDate").value;
    var e = document.getElementById("endDate").value;

    if (window.confirm("你确定要删除当前时间范围 (" + s + "至" + e + ") 所有排班数据吗？")) {
        editor.clearData();
    }
}

function setEmpShift(empId, name, day) {
    var selectWorkShift = document.getElementById("selWorkShift").value;
    if (selectWorkShift == "") {
        //alert("请选择班次！");
        return;
    }
    var unitId = "";
    var deptId = "";
    $("input[name=attendGroup]").each(function (i, elment) {
        var i = 0;
        var check = $(this).attr("checked");
        if (check) {
            unitId = $(this).val();
            deptId = $(this).attr("deptId");
       }
    });
    //alert(selectWorkShift);
    setGroupEmployeeShift(saveCallback, empId, day, selectWorkShift, "", deptId, unitId);
}
function setGroupEmployeeShift(renderCallback, empid, day, shiftId, description,deptId, unitId) {
       
    if (!unitId)
        unitId = "";
 
    var url = "/apps/HrProcessor.ashx?cmd=SetEmployeeShift&empid=" + empid + "&day=" + day + "&shiftId=" + shiftId + "&objectTypeCode=30041&unitId=" + unitId + "&deptId=" + deptId + "&description=" + encodeURIComponent(description);
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
/*
copy
*/
function copyGroupWorkshift() {
    var sDate = jQuery("#startDate").val();
    var eDate = jQuery("#endDate").val();
    var md0 = jQuery("#md0").val();
    var md1 = jQuery("#md1").val();
    var md2 = jQuery("#md2").val();
    var unitId = "";
    var unitName= "";
    $("input[name=attendGroup]").each(function (i, elment) {
        var i = 0;
        var check = $(this).attr("checked");
        if (check) {
            unitId = $(this).val();
            unitName = $(this).attr("data-name");
        }
    });
    var url1 = '/attd/cloneRangeShift.aspx?startDate=' + sDate + '&endDate=' + eDate + '&md0=' + md0 + '&md1=' + md1 + '&md2=' + md2 + "&objectTypeCode=30041&unitId=" + unitId + "&unitName=" + unitName;
    showDialog(url1, "copyGroupEmpshift", "复制排班", 600, 420);
}
/*
排序
*/
function sortGroupMember() {
   
    var unitId = "";
    var unitName = "";
    $("input[name=attendGroup]").each(function (i, elment) {
        var i = 0;
        var check = $(this).attr("checked");
        if (check) {
            unitId = $(this).val();
            unitName = $(this).attr("data-name");
        }
    });
    var url1 = '/attd/shifts/sortGroupMember.aspx?objectTypeCode=30041&unitId=' + unitId + "&unitName=" + unitName;
    showDialog(url1, "sortGroupMember", "组成员排序", 680, 480);
}
function copyWorkshift() {
    var sDate = jQuery("#startDate").val();
    var eDate = jQuery("#endDate").val();
    //var weekNum = jQuery("#dphe_md2").val();
    //var md0 = jQuery("#dphe_md0").val();
    var weekNum = jQuery("#md2").val();
    var md0 = jQuery("#md0").val();
    window.location = '/hr/attend/cloneEmpshifts.aspx?t=06e&start=' + sDate + '&end=' + eDate + '&md0=' + md0 + '&weekNum=' + weekNum+"&retURL=";
}
function printCalendar() {
    //editor.nextWeek();
    var showm = (editor.showMemo ? "1":"0");
    var url = "/_ui/hr/attend/empshift/print?md0=" + editor.year + "&md1=" + editor.month + "&md2=" + editor.weekNumber + "&unitId=" + editor.unitId + "&calendar=" + editor.calendar + "&showMemo=" + showm;
    printWin(url);
}
function exportCalendar() {
    var showm = (editor.showMemo ? "1" : "0");
    var url = "/apps/HrProcessor.ashx?cmd=attendance.workshift.calendar.export&md0=" + editor.year + "&md1=" + editor.month + "&startDate=" + editor.startDate + "&endDate=" + editor.endDate + "&objectTypeCode=30041&unitId=" + editor.unitId + "&calendar=" + editor.calendar + "&showMemo=" + showm;
    printWin(url);
}
function searchMonthEmpShifts() {
    var search = "";
    var yearNumber = jQuery("#md0").val();
    var monthNumber = jQuery("#md1").val();
    editor.year = yearNumber;
    editor.month = monthNumber;
    editor.searchMode = true;
    //var deptId = document.getElementById("DeptId_lkid").value;
    //search = "&DeptId=" + deptId;
    //search += "&name=" + encodeURIComponent(document.getElementById("empName").value);
    var unitId = "";
    $("input[name=attendGroup]").each(function (i, elment) {
        var check = $(this).attr("checked");
        if (check) {
            unitId = $(this).val();
        }
    });

    editor.unitId = unitId;
    editor.searchText = search;
    editor.search(search,unitId);
}
/*删除选择的人员考勤安排*/
function deleteGroupSelectShiftData() {
    var attendYear = jQuery("#md0").val();
    var attendMonth = jQuery("#md1").val();

    var start = jQuery("#startDate").val();
    var end = jQuery("#endDate").val();
    
    var empIds = "";
    var i = 0;
    $("input[id^=chkemp_]").each(function (i, elment) {
        var check = $(this).attr("checked");
        if (check) {
            //debugger;
            if (i > 0)
                empIds += ",";
            var text = $(this).val();
            empIds += text;
            i++;
        }
    });
    var unitId="";
    $("input[name=attendGroup]").each(function (i, elment) {
        var check = $(this).attr("checked");
        if (check) {
            unitId = $(this).val();
        }
    });

    if (empIds == "") {
        alert("请选择要删除排班的人员！");
        return;
    }

    if (Modal.confirm("你确定要删除选择员工的整月排班吗？")) {

        var url = "/apps/HrProcessor.ashx?cmd=workshift.dept.month.employee.delete";

        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                startDate: start,
                endDate:end,
                objectTypeCode: 30041,
                unitId: unitId,
                employeeIds: empIds
            },
            error: function (request, textStatus, errorThrown) {
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                //debugger;
                //callBack(data);
                //window.location.reload();
                searchMonthEmpShifts();
            },
            type: "POST",
            url: url
        });
    }

}


function exchangeEmployeeShiftDialog() {
    var employeeId_from = "";
    var employeeIdName_from = "";
    var employeeId_to = "";
    var employeeIdName_to = "";

    var selectCount = 0;

    $("input[id^=chkemp_]").each(function (i, elment) {
        var check = $(this).attr("checked");

        if (check) {
            if (selectCount==0) {
                //empIds += ",";
                //empNames += ",";

                var text = $(this).val();
                var name = $(this).attr("dataname");

                employeeId_from = text;
                employeeIdName_from = name;
            }
            if (selectCount == 1) {
                //empIds += ",";
                //empNames += ",";

                var text = $(this).val();
                var name = $(this).attr("dataname");

                employeeId_to = text;
                employeeIdName_to = name;
            }
            //empIds += text;
            //empNames += name;

            selectCount++;
        }
    });

    if (selectCount != 2) {
        alert("请选择两个人员进行调班");
        return;
    }

    selectCount = 0;
    var unitId = "";
    var deptId = "";
    $("input[name=attendGroup]").each(function (i, elment) {
        var check = $(this).attr("checked");
        if (check) {
            if (i > 0) {
                deptId += ",";
            }
            var text = $(this).val();
            unitId += text;
            selectCount++;
        }

    });
    var url = "/attd/shifts/exchangeShift.aspx?objectTypeCode=30041&unitId=" + unitId;
    url += "&employeeId_from=" + employeeId_from + "&employeeIdName_from=" + employeeIdName_from;
    url += "&employeeId_to=" + employeeId_to + "&employeeIdName_to=" + employeeIdName_to;

    showDialog(url, "exchangeEmpShifts", "换班/调换", 660, 480);
}

function exportCalendarForGroup() {
    var title = $('.noSecondHeader').text();

    //get page table data
    var dataTable = $('#shiftContainer1').find('table.mytable');
    var headLines = [];
    var headLinesCount = 0;
    var dataLines = [];
    var dataLinesCount = 0;

    $(dataTable).find('thead').children('tr').each(function (index, e) {
        if ($(this).children().length == 0)
            $(this).remove();
    });

    $(dataTable).find('thead').children('tr').each(function (rowIndex, row) {

        var headThs = [];
        var headLine = {};
        headLinesCount++;
        var thCount = $(this).children('th').length;

        $(this).children('th').each(function (index, e) {

            if (rowIndex == 1 && index == 0 && $(dataTable).find('thead').children('tr').length == 2) {
                var headTh = {};
                headTh.Text = '';
                headThs.push(headTh);
                headTh.Text = '';
                headThs.push(headTh);
            }

            var headTh = {};
            headTh.Text = $(this).text();
            headThs.push(headTh);

            if ($(dataTable).find('thead').children('tr').length == 2) {
                if ($(this).text().indexOf('/') > 0) {
                    var headTh = {};
                    headTh.Text = '';
                    headThs.push(headTh);
                }
            }

            if (rowIndex == 1 && index + 1 == thCount && $(dataTable).find('thead').children('tr').length == 2) {
                var headTh = {};
                headTh.Text = '';
                headThs.push(headTh);
                headTh.Text = '';
                headThs.push(headTh);
                if ($(this).siblings().length > 7) {
                    var headTh = {};
                    headTh.Text = '';
                    headThs.push(headTh);
                }
            }
        });

        headLine.Ths = headThs;
        headLine.ThCount = headThs.length;
        headLines.push(headLine);
    });

    $(dataTable).find('tbody').children('tr').each(function () {
        var dataTds = [];
        var dataLine = {};
        dataLinesCount++;

        $(this).children('td').each(function () {
            var dataTd = {};
            dataTd.Text = $(this).text();
            dataTds.push(dataTd);
        });
        dataLine.Tds = dataTds;
        dataLine.TdCount = dataTds.length;
        dataLines.push(dataLine);

    });

    openWindowWithPost("/apps/CommandProcessor.ashx?cmd=attd.excelexport.empshiftdata", {
        headLinesCount: headLinesCount,
        dataLinesCount: dataLinesCount,
        headLines: headLines,
        dataLines: dataLines,
        title: title,
    });
}

function openWindowWithPost(url, data) {
    var form = document.createElement("form");
    form.target = "_blank";
    form.method = "POST";
    form.action = url;
    form.style.display = "none";

    for (var key in data) {
        var input = document.createElement("input");
        input.type = "hidden";
        input.name = key;

        if (typeof data[key] == 'object') {
            input.value = JSON.stringify(data[key]);

        } else {
            input.value = data[key];
        }
        form.appendChild(input);
    }

    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
}


