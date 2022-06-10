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
    attendanceEditor.prototype.showSymbol = false;
    //attendanceEditor.prototype.UpdateMemo = "";
    //attendanceEditor.prototype.NurseMessage = "";
    //attendanceEditor.prototype.Description = "";
    attendanceEditor.prototype.reportStatus = "0"; //上报状态 1 已上报
    attendanceEditor.prototype.closeStatus = "0"; //封存状态 1 已上报
    attendanceEditor.prototype.searchText = "";
    attendanceEditor.prototype.searchMode = false;
    attendanceEditor.prototype.DescriptionCode = '1'//行备注
    attendanceEditor.prototype.isJd = false; //嘉定版本
    attendanceEditor.prototype.leaveDay = 1 //请假时间

    attendanceEditor.prototype.renderGroupBar = function (data, curentUnitId) {
        var html = "<span>出勤部门 ：</span>";
        if (data.length == 0) {
            // html = "<div style=\"border-radius: 4px;border-color: #39f;background-color: #ffc;border-style: solid;border-width: 1px;color: #000;padding: 6px 8px 6px 6px;margin: 4px 20px;\">您还没有管理任何排班班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组</div>";
        }
        this.groups = data;
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            if (item.id == curentUnitId) {
                if (attendanceEditor.prototype.isJd) {
                    html += "<button class=\"active\"  data-name=\"" + item.name + "\" deptid=\"" + item.id + "\" onclick=\"teamChangeJd('" + item.id + "')\" id=\"dept_" + item.id + "\">" + item.name + "</button>";
                }
                else {
                    html += "<button class=\"active\"  data-name=\"" + item.name + "\" deptid=\"" + item.id + "\" onclick=\"teamChange('" + item.id + "')\" id=\"dept_" + item.id + "\">" + item.name + "</button>";
                }

            }
            else {

                if (attendanceEditor.prototype.isJd) {
                    html += "<button   data-name=\"" + item.name + "\" deptid=\"" + item.id + "\"  onclick=\"teamChangeJd('" + item.id + "')\"  id=\"dept_" + item.id + "\">" + item.name + "</button>";
                }
                else {
                    html += "<button   data-name=\"" + item.name + "\" deptid=\"" + item.id + "\"  onclick=\"teamChange('" + item.id + "')\"  id=\"dept_" + item.id + "\">" + item.name + "</button>";
                }
                //html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                //html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" onclick=\"editor.search('',this.value)\"  data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\" /> " + item.name + "</div>";
                
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
        html = "设置请假时长:<select id='leaveDay' name='leaveDay'><option value='1'>1天</option><option value='0.5'>半天</option>";
        html += "<option value='0.125'>1小时</option>";
        html += "<option value='0.25'>2小时</option>";
        html += "<option value='0.375'>3小时</option>";
        //html += "<option value='0.5'>4小时</option>";
        html += "<option value='0.625'>5小时</option>";
        html += "<option value='0.725'>6小时</option>";
        html += "<option value='0.875'>7个小时</option>";

        html += "<optgroup label='存休'>";
        html += "<option value='1.125'>1天1小时</option>";
        html += "<option value='1.25'>1天2小时</option>";
        html += "<option value='1.375'>1天3小时</option>";
        html += "<option value='1.5'>1.5天</option>";
        html += "<option value='1.625'>1天5小时</option>";
        html += "<option value='1.725'>1天6小时</option>";
        html += "<option value='1.875'>1天7个小时</option>";
        html += "<option value='2'>2天</option>";
        html += "<option value='2.5'>2.5天</option>";

        html += "</select>天&nbsp;";
        if (this.leaveDay == 1) {
            $("#leaveDay").html(html);
        }

        html += "<input type=\"button\" name=\"btnWorkShift\" id=\"btnWorkShift_00\" class=\"btnShift\" value=\"清除选择\" title=\"清除选择\" onclick=\"clearSelectShift()\">&nbsp;&nbsp;";
        html = "<span>类型 ：</span>";
        
        for (var i = 0; i < this.shifts.length; i++) {
            var item = this.shifts[i]; 
            //html += "<input type='button' id='" + item.Id + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectAttendType(this,'" + item.Id + "');\" />&nbsp;";
            html += " <button id=\"leavetype_" + item.Id + "\" leavetype=\"" + item.Id + "\"  title='" + item.Name + "' onclick=\"pickLeaveType('" + item.Id + "');\" >" + item.Name + "</button>";
        }
        html += "<button class=\"clearchook\" id='leavetype_00' leavetype=\"\"  onclick=\"clearSelectLeaveType()\">清除选择</button>";

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

    attendanceEditor.prototype.renderMonthViewCalendar = function (d) {
        //debugger;
        var data = d.listData;
        var html = "<table style='font-size:13px;' width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><span> 部门：</span><b>" + d.UnitName + "</b></td><td></td>";
        html += "<td><b>" + d.Year + "</b>年<b>" + d.MonthNumber + "</b>月 </td><td></td><td style='text-align:right;'> <span> 状态:</span> <b style='color:red;'>" + d.GroupReportStatusName + "</b></td></tr></table>";
        html += "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        if (this.viewMode != 1) {
            html += "<th></th>";
            html += "<th >部门</th>";
        }
        html += "<th >序号</th>";
        html += "<th ><a href='#' onclick=\"\">姓名</a></th>";
        html += "<th >工号</th>";
        html += "<th >全勤</th>";
        var days = d.Days.length;

        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if (wDay == 6 || wDay == 0 || day.isHoliday) {
                html += "<th class='' style='text-align:center;color:red;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
                html += "<th class='' style='text-align:center;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
        }
        //<th rowspan='2'>出勤</th>
        if (this.viewMode == 1) {
            html += "<th rowspan='2'>请假</th>";
        }
        if (this.DescriptionCode == 1) {
            html += "<th rowspan='2'>备注</th>";
            //泰兴 医疗组 是否为医疗组长字段
            //html += "<th>医疗组</th>";
            //html += "<th>是否为医疗组长</th>";
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
            else {
                html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + (i+1) + "</td>";
            }

            html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + emp.Name + "</td>";
            html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";
            if (emp.IsFullAttend)
                html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\"><img src='/img/checkbox_checked.gif' /></td>";
            else
            {
                html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\"></td>";
            }


            var attendData = emp.AttendData;
            var empInDate = "";
            if (emp.InDate)
                empInDate = emp.InDate;

            for (var h = 0; h < days; h++) {
                //var day1 = d.Days[j];

                var row = attendData[h];
                if (row == null)
                    continue;
                var cellTitle = emp.Name + " " + row.AttendDate;
                var cellId = "c_" + emp.EmployeeId + "_" + row.AttendDate;
                //var memoTxtId = "memo_" + emp.EmployeeId + "_" + row.AttendDate;
                html2 += "<td  id=\"" + cellId + "\" title=\"" + cellTitle + "\"";

                var inText = "";
                if (empInDate == row.AttendDate) {
                    inText = "调入";
                }

                var totalDays = 0;
                for (var j = 0; j < row.LeaveDetail.length; j++) {
                    var leaveInfo = row.LeaveDetail[j];
                    totalDays += (leaveInfo.LeaveDays * 1);
                }

                html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' >";

                if (inText != "") {
                    html2 += "<span class=\"spancolo1\" style=\"color:red;\">";
                    html2 += inText;
                    html2 += "</span>";
                }
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
                        if (leaveInfo.LeaveTypeCode == 0)
                            tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;'";
                        else
                            tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        var leaveStr = leaveInfo.LeaveTypeName;
                        if (this.showSymbol && leaveInfo.Symbol != "") {
                            leaveStr = leaveInfo.Symbol;
                        }

                        if (row.LeaveDetail[j].canEdit) {
                       } else {
                            tempCell += 'class="cannotEdit"'
                        }

                        tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveStr + "(" + leaveInfo.LeaveDays + ")</div>";

                        html2 += tempCell;
                    }
                   

                    html2 += "</td>";

                
            }
            
            debugger
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
            if (this.DescriptionCode == 1) {
                html2 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:110px;\">'
                html2 += '<span>' + emp.Description + '</span>'
                html2 += '</td>';
                //泰兴 医疗组 是否为医疗组长字段
                //html2 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:110px;\">'
                //html2 += '<span>' + emp.Custom2 + '</span>'
                //html2 += '</td>';
                //html2 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:110px;\">'
                //html2 += '<span>' + emp.Custom1 + '</span>'
                //html2 += '</td>';
            }
            html2 += "</tr>";
        }



        html += html2;
        html += "</tbody></table>";




        $("#shiftContainer1").html(html);
    }
    attendanceEditor.prototype.renderMonthCalendar = function (d) {
        
        if (this.viewMode == 1) {
            this.renderMonthViewCalendar(d);
            return;
        }
        var data = d.listData;

        var html = "";
        html += "<tbody><tr class=\"\">";
        var days = d.Days.length;

        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if (wDay == 6 || wDay == 0 || day.isHoliday) {
                html += "<th class='red-th' ><div>" + this.toWeekName(wDay) + "</div><div>" + yday + "</div></th>";
            }
            else {
                html += "<th class='' ><div>" + this.toWeekName(wDay) + "</div><div>" + yday + "</div></th>";
            }
        }
        html += "</tr></tbody>";
        $("#colHeader").html(html);
        //endheader
        this.renderFixColumns(d);

        var colSpan1 = (days + 4);

        var html2 = "";
        html = " <table class=\"table4\">";
        
        //debugger;

        for (var i = 0; i < data.length; i++) {
            var emp = data[i];

            if ((i % 2) == 0)
                html2 += "<tr>";
            else
                html2 += "<tr class=\"trcolo\">";
            //if (this.viewMode != 1) {
             //   html2 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chk_" + emp.EmployeeId + "' /></td>";
             //   html2 += "<td class=\"nameCol\" style=\"width:100px;vertical-align:middle;\">" + emp.DeptName + "</td>";
            //}
          
            var attendData = emp.AttendData;
            var empInDate = "";
            if (emp.InDate)
                empInDate = emp.InDate;
            for (var h = 0; h < days; h++) {
                //var day1 = d.Days[j];

                var row = attendData[h];
                if (row == null)
                    continue;
                var cellTitle = emp.Name + " " + row.AttendDate;
                var cellId = "c_" + emp.EmployeeId + "_" + row.AttendDate;
                //var memoTxtId = "memo_" + emp.EmployeeId + "_" + row.AttendDate;
                html2 += "<td  id=\"" + cellId + "\" title=\"" + cellTitle + "\"";
                var inText = "";
                if (empInDate == row.AttendDate)
                {
                    inText = "调入";
                }

                if (this.viewMode == 1) {
                   
                    var totalDays = 0;
                    for (var j = 0; j < row.LeaveDetail.length; j++) {
                        var leaveInfo = row.LeaveDetail[j];
                        totalDays += (leaveInfo.LeaveDays * 1);
                    }
                    //console.log("totaldays:" + totalDays);

                    if (inText != "") {
                        html2 += "<span class=\"spancolo1\" style=\"color:red;\">";
                        html2 += inText;
                        html2 += "</span>";
                    }

                    var shiftName = "工作";
                    if (row.ShiftName) {
                        if (row.ShiftName != "") {
                            shiftName = row.ShiftName;
                            if (totalDays < 1)
                                html2 += "<div style='cursor:pointer;color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_s'> " + shiftName + " </div>";
                        }
                    }

                    for (var j = 0; j < row.LeaveDetail.length; j++) {
                        var leaveInfo = row.LeaveDetail[j];
                        tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        tempCell += " title='报送部门：" + leaveInfo.BusinessUnitIdName + " "+cellTitle + "'";
                        tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                        
                        html2 += tempCell;
                    }
                  
                    html2 += "</td>";

                }
                else {
                    // tempCell = "<div style='cursor:pointer;' onclick=\"setEmpWorkStatus('{0}','{1}','{2}','c_{0}_{1}')\" id='c_{0}_{1}' data-status='{2}'>{3}</div>";
                    //employeeId, attendDate, attd.LeaveTypeCode, attd.LeaveTypeName
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' "; //end TD

                    if (this.closeStatus == 1 || this.reportStatus == 1) {
                        html2 += " onclick=\"void('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\"  >";
                    }
                    else {
                        html2 += " onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\"  >";
                    }
                    var shiftName = "工作";

                    if (inText != "")
                    {
                        html2 += "<span class=\"spancolo1\" style=\"color:red;\">";
                        html2 += inText;
                        html2 += "</span>";
                    }

                    if (this.showShift) {
                        if (row.ShiftName) {
                            if (row.ShiftName != "") {
                                //debugger;
                                shiftName = row.ShiftName;
                                //html2 += "<div style='color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> " + shiftName + " </div>";
                                html2 += "<span class=\"spancolo1\">";
                                html2 += shiftName;
                                html2 += "</span>";
                            }
                        }
                    }
                    else {
                        //if (row.WorkStatus == 0) {
                           // html2 += "<div style='' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> / </div>";
                        //}
                        html2 += "<span class=\"spancolo1\">";
                        html2 += "</span>";
                    }

                    for (var j = 0; j < row.LeaveDetail.length; j++) {
                        //0 工作 1 请假 2休息
                        //debugger;white-space:nowrap;
                        var leaveInfo = row.LeaveDetail[j];
                        //tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        tempCell = "<div class=\"qingjia\" ";
                        //<div class="qingjia">事假（1）</div>
                        if (this.reportStatus == 0)
                            tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + cellId + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
                        //tempCell += "  onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" ";
                        tempCell += " title='报送部门：" + leaveInfo.BusinessUnitIdName + " " + cellTitle + "'";
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
            
            html2 += "</tr>";
        }
        html += html2;
        html += "</table>";

        $("#shiftContainer1").html(html);
    }
    attendanceEditor.prototype.renderFixColumns = function (d) {
        var data = d.listData;
        var html2 = "";
        for (var i = 0; i < data.length; i++) {
            var emp = data[i];
            if ((i % 2) == 0)
                html2 += "<tr>";
            else
                html2 += "<tr class=\"trcolo\">";
            var cellId = "emp_" + emp.EmployeeId;
            html2 += "<td style=\"width: 40px\">" + (i + 1) + "</td>";
            html2 += "<td style=\"width: 40px\" class=\"checktd\">";
            html2 += "<p class=\"inputcheck\">";
            //html2 += " <img src=\"/img/add/23.check_1(14x14).png\">";
            html2 += "<input type=\"checkbox\" title=\"选择 " + emp.Name + "\" name=\"empid\" value=\"" + emp.EmployeeId + "\" id=\"" + cellId + "\" data-name=\"" + emp.Name + "\">";
            html2 += "  </p>";
            html2 += "</td>";

            //html2 += "<td nowrap=\"nowrap\">" + emp.DeptName+"</td>";
            html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + emp.Name + "</td>";
            html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";
            html2 += "</tr>";
        }
        $("#empList").html(html2);
    }
    attendanceEditor.prototype.renderGrid = function (d) {
        this.initInfo(d);
        //debugger;
        if (this.calendar == 2) // week calendar
            this.renderWeekCalendar(d);
        else
            this.renderMonthCalendar(d);
        this.resizeDesigner();
    }
    //attendanceEditor.prototype.render = function () {
    //    if (this.viewMode == 1) {
    //        renderMonthCalendar();
    //    }
    //    if (this.viewMode == 2) {
    //        renderWeekCalendar();
    //    }

    //}
    attendanceEditor.prototype.loadDesigner = function (para) {
        var self = this;
        this.loadData("attendance.dept.employee.search", para, function (data) {
            var html = "";
            if (!data) return;
            $('#Description').html(data.Description)
            $('#LeaveMessage').html(data.LeaveMessage)
            //self.viewMode = data.viewMode;
            if (data.CloseStatusCode == 1)//如果封存
            {
                showButtons(0);
            }
            else {
                if (data.GroupReportStatus == 0) {
                    showButtons(1);
                    jQuery("#btnSaveBatch").html("提交考勤");
                    jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(1)");
                    jQuery("#btnSaveBatch").show();
                }
                else if (data.GroupReportStatus == 1) {
                    //self.viewMode = 1;
                    showButtons(0);
                    if (data.CloseStatusCode == 0) {
                        jQuery("#btnSaveBatch").html("撤销提交");
                        jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(0)");
                        jQuery("#btnSaveBatch").show();
                    }
                }
            }

            if (data.GroupReportStatusName) {
                //document.getElementById("attendStatusName").innerHTML = data.GroupReportStatusName;
                jQuery("#attendStatusName").html(data.GroupReportStatusName);
            }
            if (self.searchMode) {
                document.getElementById("calendarHeader").innerHTML = data.Year + '年' + data.MonthNumber + '月（' + data.StartDate + " 至 " + data.EndDate + "）&nbsp;&nbsp;" + data.UnitName + "&nbsp;&nbsp;人员考勤表";
            }
            else {
                //document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;" + data.UnitName + " 人员考勤表";
                //document.getElementById("calendarHeader").innerHTML = data.Year + " 年 " + data.MonthNumber + "月&nbsp;&nbsp;" + data.UnitName + " 考勤表";
                document.getElementById("calendarHeader").innerHTML = data.OrganizationName + "职工考勤表";
            }
            //debugger;
            if (self.viewMode == 2) //编辑模式
            {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate;
                self.renderShiftBar(data);
            }
            document.getElementById("unitId").value = data.UnitId;//设置当前组/部门
            jQuery("#unitName").val(data.UnitName);
            self.unitId = data.UnitId;
            self.reportStatus = data.GroupReportStatus;//上报状态
            self.closeStatus = data.GroupReportStatus;//封存状态
            //debugger;
            self.renderGroupBar(data.Units, data.UnitId);
            self.renderGrid(data);

        });
    }
    attendanceEditor.prototype.setMode = function (mode) {
        this.viewMode = mode;
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
        var url = "/apps/HrProcessor.ashx?cmd=attendance.clear&objectTypeCode=10&startDate=" + startDate + "&endDate=" + endDate + "&groupIds=" + groupIds;
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
    attendanceEditor.prototype.init = function (md0, md1, md2, unitType, unitId) {
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
    
    attendanceEditor.prototype.resizeDesigner = function () {
       // console.log(111)
        var rCount = $(".table3").find("tr").length;
        // alert(rCount);

        for (var i = 0; i < rCount ; i++) {
            var rheight = $(".table4").find("tr").eq(i).height(); //右边数据行高
            var lheight = $(".table3").find("tr").eq(i).height(); //左边数据行高
            if (rheight == lheight) {
                //console.log('right==left,right' + rheight + 'left:' + lheight);
            }
            if (rheight > lheight) {
                //debugger;
                //    $(".table3").find("tr").eq(i).css("height", rheight);
                // alert('right' + rheight + 'left:' + lheight);
                //    //console.log('right>left,right' + rheight + 'left:' + lheight);
                $(".table4").find("tr").eq(i).css("height", rheight);
                $(".table3").find("tr").eq(i).css("height", rheight);
            }
            if (lheight > rheight) {
                // debugger;
                //    $(".table4").find("tr").eq(i).css("height", lheight);
                //    $(".table3").find("tr").eq(i).css("height", lheight);
                //   // console.log('right<left,right' + rheight + 'left:' + lheight);
                //   // alert('right' + rheight + 'left:' + lheight);
                $(".table4").find("tr").eq(i).css("height", lheight);
                $(".table3").find("tr").eq(i).css("height", lheight);
            }

            $(".table3").find("tr").eq(i).find("td").css("vertical-align", "middle")
        }
        //把日期设置成 对应数据列的宽度
        //debugger;
        //console.log("userAgent:"+navigator.userAgent);
       // alert("userAgent:"+navigator.userAgent);
        //火狐+1
        //谷歌+2
        //IE8+2
        //IE11+1
        var offSet = 0;
        if (commonUtils.IS_IE8) {
            offSet = 2;
        }
        else if (commonUtils.IS_H5) {
            //  alert("chrome1");
            if (commonUtils.IS_Chrome)
                offSet = 2;
            //else if (commonUtils.IS_FF5)
            //    offSet = 1;
            else if (commonUtils.OS_WIN7)
                offSet = 1;
        }
        else if (commonUtils.IS_Chrome) {
            // alert("chrome");
            offSet = 2;
        }
        else if (commonUtils.IS_FF5) {
            offSet = 1;
        }
        
       // alert(offSet);
        var colCount = $(".table2").find("th").length;
        for (var j = 0; j < colCount; j++) {
           
            var width = $(".table4").find("tr").eq(1).find("td").eq(j).width();
            var rWidth = width;//+2;
            //if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
            //    width = width - 1;
            //}
            
            rWidth = rWidth + offSet;
            
            var headerCell = $(".table2").find("th").eq(j);
            headerCell.css("width", rWidth);
            headerCell.width(rWidth);

            var dataCell = $(".table4").find("tr").eq(1).find("td").eq(j);
            dataCell.css("width", rWidth);
            dataCell.width(rWidth);

            //log
            //var colWidth = $(".table2").find("th").eq(j).width();
            //var dataWidth = $(".table4").find("tr").eq(1).find("td").eq(j).width();
            //console.log("table4:width:" + j + "source:" + width + "change:"+rWidth + ",after change data:" + +dataWidth + ",after change header:" + colWidth);
        }
        //兼容ie11下input位置
        $("#attendance .inputcheck").each(function () {
            var height = $(this).parent("td").height() / 2
            $(this).css("top", height - 8)
        })
    }
}
/*部门切换*/
function teamChange(deptId)
{
    //var deptId = $(this).attr("deptid");
    //debugger;
    document.getElementById("unitId").value = deptId;
    editor.search('', deptId);

    $("#attendance .attend-team button").removeClass("active")
    //$(this).addClass("active")
    $("#dept_" + deptId).addClass("active");
    var deptName = $("#dept_" + deptId).attr("data-name");
    $("#unitName").val(deptName);
}
/*
考勤类型选择
*/
function pickLeaveType(t)
{
    $("#attendance .jiaqi-type button").removeClass("active")
    // $(this).addClass("active")leavetype_1
    $("#leavetype_" + t).addClass("active");
    document.getElementById("selWorkShift").value = t;
}
function clearSelectLeaveType()
{
    $("#attendance .jiaqi-type button").removeClass("active")
    $("#leavetype_00").addClass("active");
    document.getElementById("selWorkShift").value = "";
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
    //debugger
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
function refreshDesinger() {
    searchMonthEmpAttendances();
}
function reloadDesignerData() {
    searchMonthEmpAttendances();
}
/*
刷新查询
*/
function searchMonthEmpAttendances() {
    var selEle = document.getElementById("yearNumber");
    if (selEle)
        editor.year = selEle.value;

    selEle = document.getElementById("monthNumber");
    if (selEle)
        editor.month = selEle.value;

    editor.searchMode = true;
    editor.viewMode = 2;
    var ele = document.getElementById("chkShowShiftDetail");
    if (ele) {
        if (ele.checked)
            editor.showShift = true;
        else
            editor.showShift = false;
    }
    var search = "";
    var deptId =  document.getElementById("unitId").value;
        
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
        if (ele.checked)
            search += "&showShift=1";
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
/*打印排班明细*/
function printShiftCalendar() {
    //editor.nextWeek();
    //var showm = "0";
    //var url = "/_ui/hr/attend/empshift/print?md0=" + editor.year + "&md1=" + editor.month + "&objectTypeCode=10&unitType=10&unitId=" + editor.unitId + "&md2=" + editor.weekNumber + "&calendar=" + editor.calendar + "&showMemo=" + showm;
    var url = "/attd/shifts/prtDeptShiftDetail.aspx?unitId=" + editor.unitId + "&md0=" + editor.year + "&md1=" + editor.month;
    //printWin(url);
    window.open(url, "部门排班打印", 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
}
/*打印考勤明细*/
function printAttenanceCalendar() {
    var unitId = "";
    var unitId = jQuery("#unitId").val();
    var showm = "0";
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var symbol = "";
    if (document.getElementById("chkShowShiftDetail").checked)
    {
        symbol = "1";
    }
    ///attd/prtGroupAttendDetail.aspx?unitId=d19ff819-4897-418e-b2f9-83b4f4f0eec2&unitType=30041&md0=2019&md1=1&reportorBy=2ec00cf2-a484-4136-8fef-e2a2719c5ed6&name=测试1&viewMode=1
    var url = "/attd/prtDeptAttendDetail.aspx?md0=" + attendYear + "&md1=" + attendMonth + "&unitType=10&unitId=" + unitId + "&viewMode=1";
    //url += "&symbol=1";
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
    window.open(url, "打印考勤明细", 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
}
function getSelectGroupDeptId() {
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
//设置考勤
function setEmpWorkStatus(empId, day, oldStatus, eleID) {
    var newStatus = document.getElementById("selWorkShift").value;
    if (newStatus == "") {
        alert("请在上选择 “ 类型” 中任意选择一个！");
        return;
    }
    var leaveDays = document.getElementById("leaveDay").value;
    //debugger;
    //var oldStatus = "";// jQuery("#" + eleID).attr("data-status");
    var businessUnitId = jQuery("#unitId").val();
    reportEmployeeDayAttendance(empId, day, oldStatus, newStatus, leaveDays, businessUnitId, businessUnitId, eleID, updateCellStatus);
    changedStatus = true;
}
function updateCellStatus(data) {
    //debugger;
    if (data.Status) {
        var eleID = data.ElementId;
        jQuery("#" + eleID).attr("data-status", data.WorkStatus);
        //if (data.WorkStatus == 100)
        //{
        //}
        //else
        //{
        //}
        //tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;' onclick=\"setEmpWorkStatus('" + data.EmployeeId + "','" + data.AttendDate + "','" + data.AttendDate + "','c_" + data.EmployeeId + "_" + data.AttendDate + "')\" id='c_" + data.EmployeeId + "_" + data.AttendDate + "' data-status='{2}'>" + data.CellText + "</div>";
        var html2 = "";
        //debugger;
        if (data.LeaveDetail.length > 0) {
            for (var j = 0; j < data.LeaveDetail.length; j++) {
                //0 工作 1 请假 2休息
                var leaveInfo = data.LeaveDetail[j];
                //BACKGROUND:#6ce26c;color:red;
                tempCell = "<div class='qingjia' style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;'";
                //tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + eleID + "')\"";
                tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + eleID + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
                tempCell += " data-status='" + leaveInfo.LeaveTypeCode + "'";
                tempCell += " id='c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate + "' >" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                html2 += tempCell;
            }
        }
        //else {
           // html2 = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;'  id='c_" + data.EmployeeId + "_" + data.AttendDate + "' data-status='{2}'>" + data.CellText + "</div>";
        //}
        jQuery("#" + eleID).html(html2);
        editor.resizeDesigner();
    }
    else {
        alert(data.msg);
    }
}
/*
设置某一个人一天考勤
empId           姓名ID
day,            日期
oldStatus,      旧状态
newStatus,      新状态
leaveDays,      上报天数
unitId          组ID
businessUnitId  组对应的部门ID
eleID,          当前元素
callBack        回调函数
*/
function reportEmployeeDayAttendance(empId, day, oldStatus, newStatus, leaveDays, unitId, businessUnitId, eleID, callBack) {
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
            objectTypeCode: 10,
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

function delAttendEmpDay(valId, cellId) {
    //debugger;
    var event1 = window.event;
    if (event1)
        event1.cancelBubble = true;
    //alert(document.getElementById("selWorkShift").value);
    if (document.getElementById("selWorkShift").value == "") {
        var a = cellId.split('_');
        var empId = a[1];
        var day = a[2];

        delAttendEmployeeDayData(refreshAttendCell, valId, empId, day, cellId);

        //refreshAttendCell(refreshAttendCell, empId, day);
    }
}
function refreshAttendCell(data, cellId) {
    var html2 = "";
    if (data.LeaveDetail) {
        for (var j = 0; j < data.LeaveDetail.length; j++) {
            var leaveInfo = data.LeaveDetail[j];
            var cellId = "c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate;
            tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
            tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + cellId +  "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
            tempCell += " id='c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate + "_" + leaveInfo.ValueId + "' data-status='{2}'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
            html2 += tempCell;
        }
    }
    jQuery("#" + cellId).html(html2);
    editor.resizeDesigner();
}
/*根据id删除考勤*/
function delAttendEmployeeDayData(renderCallback, id, empId, attendDay, eleCellId) {

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
                searchMonthEmpAttendances();
            },
            type: "POST",
            url: url
        });
    }

}

/*
提交上报考勤
*/
function submitDeptAttendStatus(status) {
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#dept_" + unitId).attr("data-name");
    jQuery("#unitName").val(unitName);
    var a = "";
    if (status == 0) {
        a = "你确定要取消提交上报  部门【" + unitName + "】  " + attendYear + "年" + attendMonth + "月  考勤吗？";
    }
    else {
        a = "你确定要提交上报 部门【" + unitName + "】  " + attendYear + "年" + attendMonth + "月  考勤吗？";
    }
    if (Modal.confirm(a)) {

        var url = "/apps/HrProcessor.ashx?cmd=attendance.month.submit";
        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                objectTypeCode: 10,
                unitId: unitId,
                status: status,
                desc: "",
                EmployeeId:""
            },
            type: "POST",
            url: url,
            error: function (request, textStatus, errorThrown) {
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                //debugger;
                //callBack(data);
                //window.location.reload();
                searchMonthEmpAttendances();
                if (status == 1) {
                    showButtons(0);
                    jQuery("#btnSaveBatch").html("撤销提交");
                    jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(0)");
                    jQuery("#attendStatusName").html("已上报");
                    
                }
                else {
                    showButtons(1);
                    jQuery("#btnSaveBatch").html("提交上报考勤");
                    jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(1)");
                    jQuery("#attendStatusName").html("未上报");
                }
                jQuery("#btnSaveBatch").show();
                jQuery("#unitId").val();
            }
        });

    }
}
/*显示或者隐藏那些按钮*/
function showButtons(status)
{
    if (status == 0)
    {
        jQuery("#attendSettings").hide();

        jQuery("#btnBatchAttend").hide();
        jQuery("#btnDelEmpData").hide();
        jQuery("#btnSaveBatch").hide();
        jQuery("#btnTransferIn").hide();
        jQuery("#btnTransferOut").hide();
        jQuery("#btnSortEmp").hide();
    }
    if (status == 1) {

        //var eleShiftBar = document.getElementById("shiftBar");
        //if (eleShiftBar) {
        //    eleShiftBar.style.display = "block";
        //    jQuery("#actionToolBar").show();
        //}
        //jQuery("#actionCancelBar").hide();
        jQuery("#attendSettings").show(); //时间

        jQuery("#btnBatchAttend").show();
        jQuery("#btnDelEmpData").show();
        jQuery("#btnSaveBatch").show();

        jQuery("#btnTransferIn").show();
        jQuery("#btnTransferOut").show();
        jQuery("#btnSortEmp").show();
        jQuery("#shiftBar").show();
    }
}
function transferOutPeople() {
    var empIds = [];
    var empNames = "";
    var selectCount = 0;
    $("input[id^=emp_]").each(function (i, elment) {
        var check = $(this).attr("checked");

        if (check) {
            if (empIds.length > 0) {
                ///empIds += ",";
                empNames += ",";
            }
            var text = $(this).val();
            var name = $(this).attr("data-name");
            //empIds += text;
            empIds[selectCount] = text;
            empNames += name;
            selectCount++;
        }
    });

    if (empIds == "" || selectCount != 1) {
        alert("请选择至少一个需要调出部门的人员！");
        return;
    }
    //var deptId = jQuery("#unitId").val();
    //var yNum = jQuery("#yearNumber").val();
    //var mNum = jQuery("#monthNumber").val();

    //if (Modal.confirm("你确定要调出你选择的员工吗？")) {
    //    for (var i = 0; i < empIds.length; i++) {
    //        var empId = empIds[i];
    //        deleteEmpMonthAttend(empId, deptId, yNum, mNum, searchMonthEmpAttendances);
    //    }
    //}
    transferOutSelectEmp();
    //empTransfer();
}
/*
批量选择人员的设置考勤
*/
function openBatchAttend() {
    var empIds = "";
    var empNames = "";

    var selectCount = 0;
    $("input[id^=emp_]").each(function (i, elment) {
        var check = $(this).attr("checked");

        if (check) {
            if (empIds.length > 0) {
                empIds += ",";
                empNames += ",";
            }
            var text = $(this).val();
            var name = $(this).attr("data-name");
            empIds += text;
            empNames += name;

            selectCount++;
        }
    });

    if (empIds == "" || selectCount ==0) {
        alert("请至少选择一个人员进行考勤设置");
        return;
    }
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    selectCount = 0;
    var unitId = jQuery("#unitId").val();
    
    var url = "/attd/batchMonthAttend.aspx?objectTypeCode=10&unitId=" + unitId + "&empId=" + empIds + "&empName=" + empNames;
    showDialog(url, "batchAttend", "批量设置考勤", 680, 480);
}

/*
删除选择的人员考勤
*/
function deleteSelectEmpAttendData() {
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var empIds = "";
    var i = 0;
    $("input[id^=emp_]").each(function (i, elment) {
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
    var unitId = jQuery("#unitId").val();
    if (Modal.confirm("你确定要删除你选择的员工考勤吗？")) {

        var url = "/apps/HrProcessor.ashx?cmd=attendance.employee.monthleave.delete";

        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                unitId:unitId,
                objectTypeCode: 10,
                employeeIds: empIds
            },
            error: function (request, textStatus, errorThrown) {
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                //debugger;
                //callBack(data);
                //window.location.reload();
                searchMonthEmpAttendances();
            },
            type: "POST",
            url: url
        });
    }

}

function empTransfer(type) {
    var empIds = "";
    var empNames = "";
    var selectCount = 0;

    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#unitName").val();

    if (type == 1) {
        //调出
        $("input[id^=emp_]").each(function (i, elment) {
            var check = $(this).attr("checked");

            if (check) {
                if (empIds.length > 0) {
                    empIds += ",";
                    empNames += ",";
                }
                var text = $(this).val();
                var name = $(this).attr("data-name");
                empIds += text;
                empNames += name;

                selectCount++;
            }
        });

        if (empIds == "" || selectCount != 1) {
            alert("请选择一个人员进行考勤设置");
            return;
        }
        //transferOutSelectEmp();
        var url = "/attd/TransferEmpOut.aspx?objectTypeCode=10&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empId=" + empIds + "&empName=" + empNames;
        showDialog(url, "TransferEmpOut", title, 580, 400);
        return;
    }
   
    var title = "调入";
    if (type == 1)
        title = "调出";
    var url = "/attd/TransferEmp.aspx?objectTypeCode=10&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empName=" + empNames;
    showDialog(url, "TransferEmp", title, 600, 400);
}
/*
调出人员
*/
function transferOutSelectEmp() {
   
    var empIds = "";
    var j = 0;
    $("input[id^=emp_]").each(function (i, elment) {
        var check = $(this).attr("checked");
        if (check) {
            //debugger;
            if (j > 0)
                empIds += ",";
            var text = $(this).val();
            empIds += text;
            j++;
        }
    });
    
    if (empIds == "") {
        alert("请选择人员进行考勤删除");
        return;
    }
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    if (Modal.confirm("你确定要调出你选择的员工吗？")) {

        var url = "/apps/HrProcessor.ashx?cmd=attendance.employee.month.transferout";

        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                objectTypeCode: 10,
                unitId: unitId,
                outDate:"",                
                employeeIds: empIds
            },
            error: function (request, textStatus, errorThrown) {
                //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            },
            success: function (data, textStatus) {
                searchMonthEmpAttendances();
            },
            type: "POST",
            url: url
        });
    }

}
function printAttendStatReport()
{

}
function sortEmpDialog()
{
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#unitName").val();
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var url1 = '/attd/shifts/sortGroupMember.aspx?objectTypeCode=10&unitId=' + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth;
    url1 += "&retURL=%2fa0Q%2fo";
    showDialog(url1, "sortGroupMember", "人员排序", 680, 480);
}

function showEditLeaveDetail(valId, employeeId, date) {
    var event1 = window.event;
    event1.cancelBubble = true
    //debugger;
    //: e.stopPropagation();
    //dialogLeaveSet.contents = '<div>2222222</div>';
    //dialogLeaveSet.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"mw_picker_header_label\"\u003E您添加本月上报考勤人员 至多 100 个人员上报。 \u003Ca class=\"help_link\" href=\"javascript:openPopupFocusEscapePounds(\'\', \'Help\', 1024, 768, \'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no\', false, false);\" id=\"mw_picker_tell_me_more_link\" name=\"tell_me_more\" title=\"了解详细信息！ （新窗口）\"\u003E了解详细信息！\u003C/a\u003E\u003C/div\u003E\u003Cdiv class=\"mw_container\"\u003E\u003Cdiv class=\"search_area\"\u003E\u003Clabel for=\"mw_picker_search_prefix\"\u003E搜索\u003C/label\u003E\u003Cdiv class=\"search_text_div\" id=\"mw_picker_search_text_div\"\u003E\u003Cimg src=\"/img/s.gif\" alt=\"\" class=\"search_text_icon\" title=\"\" /\u003E\u003Cinput  class=\"search_text\" id=\"mw_picker_search_prefix\" maxlength=\"30\" name=\"mw_picker_search_prefix\" onkeydown=\"Sfdc.PeoplePicker.who.onSearchKeyDown(event)\" onkeyup=\"Sfdc.PeoplePicker.who.onSearchKeyUp(event)\" size=\"20\" type=\"text\" value=\"\" /\u003E\u003Cimg src=\"/img/s.gif\" alt=\"\" class=\"clear_text_icon\" alt=\"清除搜索词\" id=\"mw_picker_search_clear_text_btn\" onclick=\"Sfdc.PeoplePicker.who.onSearchClearButtonClick(event)\" onkeypress=\"Sfdc.PeoplePicker.who.onSearchClearButtonKeyPress(event)\" tabindex=\"0\" title=\"清除搜索词\" /\u003E\u003C/div\u003E\u003Cinput value=\" 查找 \"  class=\"btn\" id=\"mw_picker_search_btn\" name=\"mw_picker_search_btn\" onclick=\"Sfdc.PeoplePicker.who.onSearch();\" title=\"查找\" type=\"button\" /\u003E\u003C/div\u003E\u003Cdiv class=\"message overlimit_results infoM4\" id=\"mw_picker_overlimit_results_message\"\u003E\u003Ctable  class=\"messageTable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cimg src=\"/img/s.gif\" alt=\"信息\"  class=\"msgIcon\" title=\"信息\"/\u003E\u003C/td\u003E\u003Ctd class=\"messageCell\"\u003E\u003Cdiv class=\"messageText\"\u003E前 300 个结果显示如下。您可以精简搜索，以缩短列表。\u003C/div\u003E\u003C/td\u003E\u003C/tr\u003E\n\u003C/table\u003E\u003C/div\u003E\u003Cscript\u003Eif (window.sfdcPage) sfdcPage.registerMessage(\'mw_picker_overlimit_results_message\');\u003C/script\u003E\u003Cdiv class=\"mw_list_area\" id=\"mw_picker_list_area\"\u003E\u003Cdiv class=\"found_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"mw_picker_found_label\"\u003E可用： \u003C/div\u003E\u003Cdiv class=\"mw_list\" id=\"mw_picker_loading_icon_div\" style=\"display: none;\"\u003E\u003Cimg src=\"/img/loading.gif\" alt=\"请稍候...\" class=\"mw_loading\" title=\"请稍候...\" /\u003E\u003Cspan class=\"mw_loading\"\u003E正在加载...\u003C/span\u003E\u003C/div\u003E\u003Cul class=\"mw_list\" id=\"mw_picker_found_list_id\" onblur=\"Sfdc.PeoplePicker.who.handleListFocusOut(event);\" onfocus=\"Sfdc.PeoplePicker.who.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003Cdiv class=\"add_remove\"\u003E添加\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_add_button\" name=\"add_button\" onclick=\"Sfdc.PeoplePicker.who.onAdd();\"\u003E\u003Cdiv class=\"rightArrowIcon\" title=\"添加\"\u003E\u003C/div\u003E\u003C/a\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_remove_button\" name=\"remove_button\" onclick=\"Sfdc.PeoplePicker.who.onRemove();\"\u003E\u003Cdiv class=\"leftArrowIcon\" title=\"删除\"\u003E\u003C/div\u003E\u003C/a\u003E删除\u003C/div\u003E\u003Cdiv class=\"selected_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"mw_picker_selected_label\"\u003E已选取： \u003C/div\u003E\u003Cdiv id=\"mw_picker_inner_selected_div\"\u003E\u003Cul class=\"mw_list\" id=\"mw_picker_selected_list_id\" onblur=\"Sfdc.PeoplePicker.who.handleListFocusOut(event);\" onfocus=\"Sfdc.PeoplePicker.who.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"make_primary\"\u003E创建\u003Cbr/\u003E\u003Cspan  style=\"color: green;\"\u003E主要\u003C/span\u003E\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_primary_button\" name=\"mw_picker_primary_button\" onclick=\"Sfdc.PeoplePicker.who.makePrimary();\"\u003E\u003Cdiv class=\"upArrowIcon\" title=\"创建主要的 (Shift-P)\"\u003E\u003C/div\u003E\u003C/a\u003E\u003C/div\u003E\u003Cdiv style=\"clear: both\"\u003E\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"limit_exceeded_message\" id=\"mw_picker_limit_exceeded_message\"\u003E\u003C/div\u003E\u003C/div\u003E\u003C/div\u003E';
    //dialogLeaveSet.show();
}