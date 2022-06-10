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
    attendanceEditor.prototype.groupReportStatus = 0; //0 - draft 1 -  update
    attendanceEditor.prototype.unitType = 10; //10 dept 30041 attendgroup
    attendanceEditor.prototype.unitId = "";
    attendanceEditor.prototype.startDate = "";
    attendanceEditor.prototype.endDate = "";
    //attendanceEditor.prototype.weekNumber = 0;
    attendanceEditor.prototype.year = 0;
    attendanceEditor.prototype.month = 0;
    attendanceEditor.prototype.BussinessUnitName = ""; //dept
    //attendanceEditor.prototype.showMemo = true; //show s
    attendanceEditor.prototype.showShift = false; //show shift detail
    //show shift symbol
    attendanceEditor.prototype.showSymbol = true; 
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
            if (i == 0 || item.id == curentUnitId) {
                html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" onclick=\"editor.search('',this.value)\" data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\"/> " + item.name + "</div>";
            }
            else {
                html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" onclick=\"editor.search('',this.value)\"  data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\" /> " + item.name + "</div>";
            }
              
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
        this.shifts = data.AttendTypes;
        //debugger;
        if (data.viewMode == 1) //查看模式，已封存
        {
            jQuery("#actionToolBar").hide();
            return;
        }
        var html = "";
        html = "设置请假时长:<select id='leaveDay' name='leaveDay'><option value='1'>1天</option>";
        html += "<option value='0.5'>半天</option>";
        /*
        html += "<option value='0.125'>1小时</option>";
        html += "<option value='0.25'>2小时</option>";
        html += "<option value='0.375'>3小时</option>";
        html += "<option value='0.625'>5小时</option>";
        html += "<option value='0.725'>6小时</option>";
        html += "<option value='0.875'>7个小时</option>";
        html += "<option value='1.125'>1天1小时</option>";
        html += "<option value='1.25'>1天2小时</option>";
        html += "<option value='1.375'>1天3小时</option>";
        html += "<option value='1.5'>1.5天</option>";
        html += "<option value='1.625'>1天5小时</option>";
        html += "<option value='1.725'>1天6小时</option>";
        html += "<option value='1.875'>1天7个小时</option>";
        html += "<option value='2'>2天</option>";
        html += "<option value='2.125'>2天1小时</option>";
        html += "<option value='2.25'>2天2小时</option>";
        html += "<option value='2.375'>2天3小时</option>";
        html += "<option value='2.5'>2.5天</option>";
        html += "<option value='2.625'>2天5小时</option>";
        html += "<option value='2.725'>2天6小时</option>";
        html += "<option value='2.875'>2天7个小时</option>";
        html += "<option value='3'>3天</option>";
        */
        //html += "<option value='0.5'>4小时</option>";
        //html += "<optgroup label='存休'>";
        //html += "</optgroup>";

        html += "</select>天&nbsp;";
        html += "<input type=\"button\" name=\"btnWorkShift\" id=\"btnWorkShift_00\" class=\"btnShift\" value=\"清除选择\" title=\"清除选择\" onclick=\"clearSelectShift()\">&nbsp;&nbsp;";
        for (var i = 0; i < this.shifts.length; i++) {
            var item = this.shifts[i];
            html += "<input type='button' id='" + item.Id + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectAttendType(this,'" + item.Id + "');\" />&nbsp;";
        }

        //html += "&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' id='btnSaveBatch' value=' 提交考勤 '  class='btnShift' onclick=\"  submitGroupAttendStatus(1)\" title='提交考勤' style='height: 25px;' />";
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
            self.renderGroupBar(data,self.unitId);
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
                if (wDay == 0 || wDay == 6 || day.isHoliday) {
                    html += "<th class='' colspan='2'  style='" + clsweekEnd + "'>" + this.toWeekName(wDay) + yday + "</th>";
                }
                else
                    html += "<th class='' colspan='2' style='text-align:center;min-width:80px;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
                if (wDay == 0 || wDay == 6 || day.isHoliday)
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
        var html = "";

        html = "<table style='font-size:13px;' width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><span>考勤组：</span><b>" + d.UnitName + "</b></td><td></td>";
        html += "<td><b>" + d.Year + "</b>年<b>" + d.MonthNumber + "</b>月 </td><td></td><td style='text-align:right;'> <span> 状态:</span> <b style='color:red;'>" + d.GroupReportStatusName + "</b></td></tr></table>";

        html += "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        if (this.viewMode != 1) {
            html += "<th></th>";
            html += "<th >部门</th>";
        }
        
        html += "<th ><a href='#' onclick=\"\">姓名</a></th>";
        html += "<th >工号</th>";
        var days = d.Days.length;

        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay)
            {
                html += "<th class='' style='text-align:center;color:red;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else
            {
                html += "<th class='' style='text-align:center;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
        }
        //<th rowspan='2'>出勤</th>
        if (this.viewMode == 1) {
            html += "<th rowspan='2'>请假</th>";
        }
        html += "</tr></thead>";
      
        var colSpan1 = (days + 4);
        html += "<tbody style=\"height:50px;overflow:auto;font-size: 12px;\">";
        var html2 = "";
        //debugger;
       
        for (var i = 0; i < data.length; i++) {
            var emp = data[i];
           
            if ((i % 2) == 0)
                html2 += "<tr>";
            else
                html2 += "<tr class=\"even\">";
            if (this.viewMode != 1) {
                html2 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chk_" + emp.EmployeeId + "' /></td>";
                html2 += "<td class=\"nameCol\" style=\"width:100px;vertical-align:middle;\">" + emp.DeptName + "</td>";
            }
            
            html2 += "<td class=\"nameCol1\"  style=\"vertical-align:middle;\">" + emp.Name + "</td>";
            html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";
            var attendData = emp.AttendData;
            for (var h = 0; h < days; h++) {
                //var day1 = d.Days[j];
               
                var row = attendData[h];
                if (row == null)
                    continue;
                var cellTitle = '报送部门：' + emp.DeptName + '报送人：' + emp.Name + " " + row.AttendDate;
                var cellId = "c_" + emp.EmployeeId + "_" + row.AttendDate;

                //var memoTxtId = "memo_" + emp.EmployeeId + "_" + row.AttendDate;
                html2 += "<td  id=\"" + cellId + "\" title=\"" + cellTitle + "\"";
                
                var totalDays = 0;
                for (var j = 0; j < row.LeaveDetail.length; j++) {
                    var leaveInfo = row.LeaveDetail[j];
                    totalDays += (leaveInfo.LeaveDays * 1);
                }

                if (this.viewMode == 1) {
                    /*
                    if (row.WorkStatus == 2) // 休息
                    {
                        html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;min-width:30px;background-color:#f9f9f9;'  >";
                        html2 += " - ";
                    }
                    else {
                    }
                    */                    
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' >";
                    //console.log("totaldays:" + totalDays);
                    var shiftName = "工作";
                    if (this.showShift) {
                        if (row.ShiftName) {
                            if (row.ShiftName != "") {
                                shiftName = row.ShiftName;
                                if (this.showSymbol) {
                                    shiftName = row.ShiftSymbol;
                                }
                                //if (totalDays < 1) {
                                html2 += "<div style='cursor:pointer;color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_s'> " + shiftName + " </div>";
                                //}
                            }
                        }
                    }

                    for (var j = 0; j < row.LeaveDetail.length; j++) {
                        var leaveInfo = row.LeaveDetail[j];
                        //debugger;
                        tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        var leaveStr = leaveInfo.LeaveTypeName;
                        if (this.showSymbol && leaveInfo.Symbol != "") {
                            leaveStr = leaveInfo.Symbol;
                        }
                        if (!leaveInfo.canEdit) {
                            tempCell +='class="cannotEdit"'
                        }
                        tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveStr + "(" + leaveInfo.LeaveDays + ")</div>";
                        html2 += tempCell;
                    }
                    //if (row.WorkStatus == 2 && totalDays == 0 && shiftName != "休息") // 如果
                    //{
                    //   html2 += "<div style='cursor:pointer;color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_s'> 休息 </div>";
                    //}

                    html2+= "</td>";
                    
                }
                else {
                    // tempCell = "<div style='cursor:pointer;' onclick=\"setEmpWorkStatus('{0}','{1}','{2}','c_{0}_{1}')\" id='c_{0}_{1}' data-status='{2}'>{3}</div>";
                    //employeeId, attendDate, attd.LeaveTypeCode, attd.LeaveTypeName
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' "; //end TD
                    html2 += " onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\"  >";
                                          
                    //if (row.WorkStatus == -1) //没有排班
                    //{
                    //    html2 += "<div style='cursor:pointer;' title=\"" + cellTitle + "\" onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> &nbsp; </div>";
                    //}
                    //else if (row.WorkStatus == 2) // 休息
                    //{
                        //html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;min-width:30px;background-color:#fff;color:red;'  >";
                        //html2 += "<div style='cursor:pointer;' title=\"" + cellTitle + "\" onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> 休息 </div>";
                        //if (row.ShiftName == "") {
                            //shiftName = row.ShiftName;
                            //html2 += "<div style='' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> 休息 </div>";
                        //}
                    //}
                    
                    var shiftName = "工作";
                    if (this.showShift) {
                        //debugger;
                        if (row.ShiftName) {
                            if (row.ShiftName != "") {
                                shiftName = row.ShiftName;
                               // if (totalDays < 1)
                                    html2 += "<div style='color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> " + shiftName + " </div>";
                            }
                        }
                    }
                    else {
                        if (row.LeaveDetail.length == 0)
                        {
                            html2 += "<div style='' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "'>  </div>";
                        }
                    }
                    
                    for (var j = 0; j < row.LeaveDetail.length; j++) {
                        //debugger;
                        //0 工作 1 请假 2休息
                        //debugger;white-space:nowrap;
                        var leaveInfo = row.LeaveDetail[j];
                        tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        if (this.groupReportStatus != 1)//已上报不能删除
                            tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + cellId + "')\"";
                        //tempCell += "  onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" ";
                        tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                       
                        html2 += tempCell;
                    }
                     
                    html2 += "</td>";
                }
                 
            }

            //print mode display stat
            if (this.viewMode == 1) {
                //html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AbsentDays + "</td>";
                if (emp.StatDesc) {
                    var descHTML = "";
                    if (emp.StatDesc != "") {
                        descHTML = emp.StatDesc;
                    }
                    html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + descHTML + "</td>";
                }
                else {
                    html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\"></td>";
                }
            }
            //html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AttendDays + "</td>";
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
        debugger
        var self = this;
        this.loadData("attendance.group.employee.search", para, function (data) {
            var html = "";
            if (!data) return;
            debugger;
            $('#LeaveMessage').html(data.LeaveMessage)
            $('#Description').html(data.Description)
            if (data.closePeriod) //关闭考勤上报
            {
                self.viewMode = 1;
                var eleShiftBar = document.getElementById("shiftBar");
                if (eleShiftBar) {
                    eleShiftBar.style.display = "none";
                    jQuery("#actionToolBar").hide();
                }
            }
            else {
                self.viewMode = data.viewMode;
                if (data.GroupReportStatus == 0) {
                    var eleShiftBar = document.getElementById("shiftBar");
                    if (eleShiftBar) {
                        eleShiftBar.style.display = "block";
                        jQuery("#actionToolBar").show();
                    }
                    jQuery("#actionCancelBar").hide();
                }
                if (data.GroupReportStatus == 1) {
                    var eleShiftBar = document.getElementById("shiftBar");
                    if (eleShiftBar) {
                        eleShiftBar.style.display = "none";
                        jQuery("#actionToolBar").hide();
                        if (data.CloseStatusCode == 0)//如果不封存
                        {
                            jQuery("#actionCancelBar").show();
                        }
                        else {
                            jQuery("#actionCancelBar").hide();
                        }
                    }
                }
            }
            if (data.CloseStatusCode == 1)//如果封存
            {
                jQuery("#actionToolBar").hide();
            }
            else {
               // jQuery("#actionCancelBar").show();
            }
            
            jQuery("#GroupReportStatus").val(data.GroupReportStatus);
            
            if (data.GroupReportStatusName)
            {
                document.getElementById("attendStatusName").innerHTML = data.GroupReportStatusName;
            }
            if (self.searchMode) {
                //document.getElementById("calendarHeader").innerHTML = data.Year + '年' + data.MonthNumber + '月（' + data.StartDate + " 至 " + data.EndDate + "）&nbsp;&nbsp;" + data.UnitName + "&nbsp;&nbsp;人员考勤表";
                document.getElementById("calendarHeader").innerHTML = data.Year + '年' + data.MonthNumber + '月&nbsp;&nbsp;' + data.UnitName + "&nbsp;&nbsp;人员考勤表";
            }
            else {
                //document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;" + data.UnitName + " 人员考勤表";
                document.getElementById("calendarHeader").innerHTML = data.OrganizationName + "职工考勤表";
            }
            //debugger;
            if (self.viewMode == 2) //编辑模式
            {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate;
                self.renderShiftBar(data);
            }
            document.getElementById("unitId").value = data.UnitId;//设置当前组/部门
            self.unitId = data.UnitId;
            self.groupReportStatus = data.GroupReportStatus;
            //alert(data.GroupReportStatus);
            self.renderGroupBar(data.Units,data.UnitId);
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
        var url = "/apps/HrProcessor.ashx?cmd=workshift.designer.clear&group=1&startDate=" + startDate + "&endDate=" + endDate + "&groupIds=" + groupIds;
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
            type: "POST",
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
    attendanceEditor.prototype.init = function (md0, md1, md2,unitType,unitId) {
        var para = "";
        if (md0) this.year = md0;
        if (md1) this.month = md1;
        //debugger;
        //var d = new Date();
        //this.month = d.getMonth();

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
        if (this.showShift)
            para += "&showShift=1";
        if (this.showSymbol)
            para += "&symbol=1";
        //alert(para);
        //para += "&name=123";
        //if (this.searchMode)
        //    para += "&searchMode=1";
        //this.loadGroups();
        //this.loadShifts();
        //this.loadGroupEmployees();   
        this.loadDesigner(para);

    };
    attendanceEditor.prototype.search = function (searchText,unitId) {
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
function reloadDesignerData()
{
    searchMonthEmpShifts()
}
function searchMonthEmpShifts() {

    var search = "";
    var deptId = "";// document.getElementById("DeptId_lkid").value;

    var selEle = document.getElementById("yearNumber");
    if (selEle)
        editor.year = selEle.value;

    selEle = document.getElementById("monthNumber");
    if (selEle)
        editor.month = selEle.value;

    editor.searchMode = true;
    editor.viewMode = 2;
   
   
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
    var eleName = document.getElementById("empName");
    if (eleName) {
        var name = encodeURIComponent(eleName.value);
        if (deptId == "" && name == "");
        {
            alert("请选择部门或者输入姓名");
            return false;
        }
        //search = "&unitId=" + deptId;
        search += "&name=" + name;
    }
     
    var ele = document.getElementById("chkShowShiftDetail");
    if (ele) {
        if (ele.checked) {
            editor.showShift = true;
            search += "&showShift=1";
        }
        else {
            search += "&showShift=0";
            editor.showShift = false;
        }
    }
    //if (document.getElementById("chkShowShiftDetail").checked)      
    //if (document.getElementById("chkShowShiftSymbol").checked)
    ele = document.getElementById("chkShowShiftSymbol");
    if (ele) {
        if (ele.checked)
            search += "&symbol=1";
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
    var url1 = '/attd/shifts/sortGroupMember.aspx?objectTypeCode=30041&unitId=' + unitId + "&unitName=" + unitName+"&retURL=/_ui/core/hr/attend/ui/GroupAttendReportPage";
    showDialog(url1, "sortGroupMember", "组成员排序", 680, 480);
}
function printShiftCalendar() {
    //editor.nextWeek();
    var showm = "0";
    var url = "/_ui/hr/attend/empshift/print?md0=" + editor.year + "&md1=" + editor.month +"&unitId="+editor.unitId+ "&md2=" + editor.weekNumber + "&calendar=" + editor.calendar + "&showMemo=" + showm;
    printWin(url);
}

function printAttenanceCalendar()
{
    var unitId = "";
    var groupReportStatus = jQuery("#GroupReportStatus").val();
    if (groupReportStatus == "0")
    {
        alert("请先提交上报才能打印！");
        return;
    }
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
    var showm = "0";
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();

    ///attd/prtGroupAttendDetail.aspx?unitId=d19ff819-4897-418e-b2f9-83b4f4f0eec2&unitType=30041&md0=2019&md1=1&reportorBy=2ec00cf2-a484-4136-8fef-e2a2719c5ed6&name=测试1&viewMode=1
    var url = "/attd/prtGroupAttendDetail.aspx?md0=" + attendYear + "&md1=" + attendMonth + "&unitType=30041&unitId=" + unitId + "&viewMode=1";
    var ele = document.getElementById("chkShowShiftSymbol");
    if (ele) {
        if (ele.checked)
            url += "&symbol=1";
    }
    ele = document.getElementById("chkShowShiftDetail");
    if (ele) {
        if (ele.checked)
            url += "&showShift=1";
    }
    window.open(url, "考勤打印查看", 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
}
function getSelectGroupDeptId()
{
    var unitId = "";
    var unitName = "";
    var deptId = "";
    $("input[name=attendGroup]").each(function (i, elment) {
        var i = 0;
        var check = $(this).attr("checked");
        if (check) {
            if (i > 0)
                deptId += ",";
            var text = $(this).val();
            unitId += text;
            unitName = $(this).attr("data-name");
            deptId = $(this).attr("deptid");
            i++;
        }

    });
    return deptId;
}
/*
设置某一个人一天考勤
empId           姓名ID
day,            日期
oldStatus,      旧状态
newStatus,      新状态
leaveDays,      上报天数
eleID,          当前元素
unitId          组ID
businessUnitId  组对应的部门ID
callBack        回调函数
*/
function reportEmployeeDayAttendance(empId, day, oldStatus, newStatus, leaveDays, eleID, unitId, businessUnitId, callBack) {
    //debugger;
    var url = "/apps/HrProcessor.ashx?cmd=attendance.leave.employee.day.set";
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: {
            employeeId: empId,
            attendDate: day,
            oldStatus: oldStatus,
            newStatus: newStatus,
            leaveDays: leaveDays,
            elementId: eleID,
            businessUnitId: businessUnitId,
            objectTypeCode: 30041,
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
/*
提交考勤上报或者取消
*/
function submitGroupAttendStatus(status)
{
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = "";
    var unitName = "";
    $("input[name=attendGroup]").each(function (i, elment) {
        var i = 0;
        var check = $(this).attr("checked");
        if (check) {
            if (i > 0)
                deptId += ",";
            var text = $(this).val();           
            unitId += text;
            unitName = $(this).attr("data-name");
            i++;
        }

    });
    var a = "";
    if (status == 0)
    {
        a = "你确定要取消提交上报【" + unitName + "】 组  " + attendYear + "年" + attendMonth + "月  考勤吗？";
    }
    else {
        a = "你确定要提交上报【" + unitName + "】 组  " + attendYear + "年" + attendMonth + "月  考勤吗？";
    }
    if (Modal.confirm(a)) {
        
        var url = "/apps/HrProcessor.ashx?cmd=attendance.month.submit";
        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                objectTypeCode: 30041,
                unitId: unitId,
                status: status,
                desc: ""
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
function delAttendEmpDay(valId,cellId)
{
    var event1 = window.event;
    if (event1)
        event1.cancelBubble = true;

    if (document.getElementById("selWorkShift").value == "") {
        var a = cellId.split('_');
        var empId = a[1];
        var day = a[2];

        delAttendEmployeeDayData(refreshAttendCell, valId, empId,day, cellId);
        
        //refreshAttendCell(refreshAttendCell, empId, day);
    }
}
function refreshAttendCell(data,cellId)
{
    var html2 = "";
    if (data.LeaveDetail) {
        for (var j = 0; j < data.LeaveDetail.length; j++) {
            var leaveInfo = data.LeaveDetail[j];
            tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
            tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
            tempCell += " id='c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate + "' data-status='{2}'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
            html2 += tempCell;
        }
    }
    jQuery("#" + cellId).html(html2);
}
/*根据id删除考勤*/
function delAttendEmployeeDayData(renderCallback, id,empId,attendDay,eleCellId) {
 
    var url = "/apps/HrProcessor.ashx?cmd=attendance.leaveday.delete&id=" + id;
    url += "&EmployeeId=" + empId;
    url += "&AttendDate=" + attendDay;
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
                renderCallback(data, eleCellId);
            }
        },
        type: "GET",
        url: url
    });
}
/*删除选择的人员考勤安排*/
function deleteGroupAttendData() {
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var empIds = "";
    var i = 0;
    $("input[id^=chk_]").each(function (i, elment) {
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


    if (empIds == "") {
        alert("请选择人员进行考勤删除");
        return;
    }

    if (Modal.confirm("你确定要删除你选择的员工考勤吗？")) {

        var url = "/apps/HrProcessor.ashx?cmd=attendance.employee.monthleave.delete";

        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                objectTypeCode: 30041,
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
function showEditLeaveDetail(valId, employeeId, date)
{
    var event1 = window.event;
    event1.cancelBubble = true 
    //debugger;
    //: e.stopPropagation();
    //dialogLeaveSet.contents = '<div>2222222</div>';
    //dialogLeaveSet.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"mw_picker_header_label\"\u003E您添加本月上报考勤人员 至多 100 个人员上报。 \u003Ca class=\"help_link\" href=\"javascript:openPopupFocusEscapePounds(\'\', \'Help\', 1024, 768, \'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no\', false, false);\" id=\"mw_picker_tell_me_more_link\" name=\"tell_me_more\" title=\"了解详细信息！ （新窗口）\"\u003E了解详细信息！\u003C/a\u003E\u003C/div\u003E\u003Cdiv class=\"mw_container\"\u003E\u003Cdiv class=\"search_area\"\u003E\u003Clabel for=\"mw_picker_search_prefix\"\u003E搜索\u003C/label\u003E\u003Cdiv class=\"search_text_div\" id=\"mw_picker_search_text_div\"\u003E\u003Cimg src=\"/img/s.gif\" alt=\"\" class=\"search_text_icon\" title=\"\" /\u003E\u003Cinput  class=\"search_text\" id=\"mw_picker_search_prefix\" maxlength=\"30\" name=\"mw_picker_search_prefix\" onkeydown=\"Sfdc.PeoplePicker.who.onSearchKeyDown(event)\" onkeyup=\"Sfdc.PeoplePicker.who.onSearchKeyUp(event)\" size=\"20\" type=\"text\" value=\"\" /\u003E\u003Cimg src=\"/img/s.gif\" alt=\"\" class=\"clear_text_icon\" alt=\"清除搜索词\" id=\"mw_picker_search_clear_text_btn\" onclick=\"Sfdc.PeoplePicker.who.onSearchClearButtonClick(event)\" onkeypress=\"Sfdc.PeoplePicker.who.onSearchClearButtonKeyPress(event)\" tabindex=\"0\" title=\"清除搜索词\" /\u003E\u003C/div\u003E\u003Cinput value=\" 查找 \"  class=\"btn\" id=\"mw_picker_search_btn\" name=\"mw_picker_search_btn\" onclick=\"Sfdc.PeoplePicker.who.onSearch();\" title=\"查找\" type=\"button\" /\u003E\u003C/div\u003E\u003Cdiv class=\"message overlimit_results infoM4\" id=\"mw_picker_overlimit_results_message\"\u003E\u003Ctable  class=\"messageTable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cimg src=\"/img/s.gif\" alt=\"信息\"  class=\"msgIcon\" title=\"信息\"/\u003E\u003C/td\u003E\u003Ctd class=\"messageCell\"\u003E\u003Cdiv class=\"messageText\"\u003E前 300 个结果显示如下。您可以精简搜索，以缩短列表。\u003C/div\u003E\u003C/td\u003E\u003C/tr\u003E\n\u003C/table\u003E\u003C/div\u003E\u003Cscript\u003Eif (window.sfdcPage) sfdcPage.registerMessage(\'mw_picker_overlimit_results_message\');\u003C/script\u003E\u003Cdiv class=\"mw_list_area\" id=\"mw_picker_list_area\"\u003E\u003Cdiv class=\"found_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"mw_picker_found_label\"\u003E可用： \u003C/div\u003E\u003Cdiv class=\"mw_list\" id=\"mw_picker_loading_icon_div\" style=\"display: none;\"\u003E\u003Cimg src=\"/img/loading.gif\" alt=\"请稍候...\" class=\"mw_loading\" title=\"请稍候...\" /\u003E\u003Cspan class=\"mw_loading\"\u003E正在加载...\u003C/span\u003E\u003C/div\u003E\u003Cul class=\"mw_list\" id=\"mw_picker_found_list_id\" onblur=\"Sfdc.PeoplePicker.who.handleListFocusOut(event);\" onfocus=\"Sfdc.PeoplePicker.who.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003Cdiv class=\"add_remove\"\u003E添加\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_add_button\" name=\"add_button\" onclick=\"Sfdc.PeoplePicker.who.onAdd();\"\u003E\u003Cdiv class=\"rightArrowIcon\" title=\"添加\"\u003E\u003C/div\u003E\u003C/a\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_remove_button\" name=\"remove_button\" onclick=\"Sfdc.PeoplePicker.who.onRemove();\"\u003E\u003Cdiv class=\"leftArrowIcon\" title=\"删除\"\u003E\u003C/div\u003E\u003C/a\u003E删除\u003C/div\u003E\u003Cdiv class=\"selected_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"mw_picker_selected_label\"\u003E已选取： \u003C/div\u003E\u003Cdiv id=\"mw_picker_inner_selected_div\"\u003E\u003Cul class=\"mw_list\" id=\"mw_picker_selected_list_id\" onblur=\"Sfdc.PeoplePicker.who.handleListFocusOut(event);\" onfocus=\"Sfdc.PeoplePicker.who.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"make_primary\"\u003E创建\u003Cbr/\u003E\u003Cspan  style=\"color: green;\"\u003E主要\u003C/span\u003E\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_primary_button\" name=\"mw_picker_primary_button\" onclick=\"Sfdc.PeoplePicker.who.makePrimary();\"\u003E\u003Cdiv class=\"upArrowIcon\" title=\"创建主要的 (Shift-P)\"\u003E\u003C/div\u003E\u003C/a\u003E\u003C/div\u003E\u003Cdiv style=\"clear: both\"\u003E\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"limit_exceeded_message\" id=\"mw_picker_limit_exceeded_message\"\u003E\u003C/div\u003E\u003C/div\u003E\u003C/div\u003E';
    //dialogLeaveSet.show();
}
