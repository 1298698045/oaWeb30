



{
    function attendanceEditor(a, b, c, f, g,year,month) {
        if (a) this.viewMode = a; //1 view 2 edit
        if (b) this.calendar = b;
        this.groupBar = document.getElementById(c);
        this.shiftBar = document.getElementById(f);

        if (g) {
            this.unitType = g;
        }
        if (year) {
            this.year = year;
        }
        if (month) {
            this.month = month;
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
    attendanceEditor.prototype.Custom1 = false//医疗组长
    attendanceEditor.prototype.isJd = false; //嘉定版本
    attendanceEditor.prototype.isHRUpdate = false; //从考勤期间修改
    attendanceEditor.prototype.pageSize = 20;//分页


    attendanceEditor.prototype.renderGroupBar = function (data, curentUnitId) {
        var html = "<span>出勤部门 ：</span>";
        if (data.length == 0) {
            // html = "<div style=\"border-radius: 4px;border-color: #39f;background-color: #ffc;border-style: solid;border-width: 1px;color: #000;padding: 6px 8px 6px 6px;margin: 4px 20px;\">您还没有管理任何排班班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组</div>";
        }
        this.groups = data;
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            if (window.adminedit) {
                if (getQueryString('deptId') == item.id) {
                    if (attendanceEditor.prototype.isJd) {
                        html += "<button class=\"active\"  data-name=\"" + item.name + "\" deptid=\"" + item.id + "\" onclick=\"teamChangeJd('" + item.id + "')\" id=\"dept_" + item.id + "\" attendstatusCode=\"" + item.attendStatusCode + "\">" + item.name + "</button>";
                    }
                    else {
                        html += "<button class=\"active\"  data-name=\"" + item.name + "\" deptid=\"" + item.id + "\" onclick=\"teamChange('" + item.id + "')\" id=\"dept_" + item.id + "\" attendstatusCode=\"" + item.attendStatusCode + "\">" + item.name + "</button>";
                    }
                }
            } else {
                if (item.id == curentUnitId) {
                    if (attendanceEditor.prototype.isJd) {
                        html += "<button class=\"active\"  data-name=\"" + item.name + "\" deptid=\"" + item.id + "\" onclick=\"teamChangeJd('" + item.id + "')\" id=\"dept_" + item.id + "\" attendstatusCode=\"" + item.attendStatusCode + "\">" + item.name + "</button>";
                    }
                    else {
                        html += "<button class=\"active\"  data-name=\"" + item.name + "\" deptid=\"" + item.id + "\" onclick=\"teamChange('" + item.id + "')\" id=\"dept_" + item.id + "\" attendstatusCode=\"" + item.attendStatusCode + "\">" + item.name + "</button>";
                    }
                }
                else {
                    if (attendanceEditor.prototype.isJd) {
                        html += "<button   data-name=\"" + item.name + "\" deptid=\"" + item.id + "\"  onclick=\"teamChangeJd('" + item.id + "')\"  id=\"dept_" + item.id + "\" attendstatusCode=\"" + item.attendStatusCode + "\">" + item.name + "</button>";
                    }
                    else {
                        html += "<button   data-name=\"" + item.name + "\" deptid=\"" + item.id + "\"  onclick=\"teamChange('" + item.id + "')\"  id=\"dept_" + item.id + "\" attendstatusCode=\"" + item.attendStatusCode + "\">" + item.name + "</button>";
                    }
                    //html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                    //html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" onclick=\"editor.search('',this.value)\"  data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\" /> " + item.name + "</div>";

                }
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
        if (data.GroupReportStatus == 1&&!window.adminedit) //查看模式，已封存
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
        html += "</optgroup>";

        html += "</select>天&nbsp;";
        html += "<input type=\"button\" name=\"btnWorkShift\" id=\"btnWorkShift_00\" class=\"btnShift\" value=\"清除考勤\" title=\"清除考勤\" onclick=\"clearSelectShift()\">&nbsp;&nbsp;";
        html = "<span>类型 ：</span>";
        for (var i = 0; i < this.shifts.length; i++) {
            var item = this.shifts[i]; 
            //html += "<input type='button' id='" + item.Id + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectAttendType(this,'" + item.Id + "');\" />&nbsp;";
            html += " <button id=\"leavetype_" + item.Id + "\" leavetype=\"" + item.Id + "\"  title='" + item.Name + "' onclick=\"pickLeaveType('" + item.Id + "');\" >" + item.Name + "</button>";
        }
        html += "<button class=\"clearchook\" id='leavetype_00' leavetype=\"\"  onclick=\"clearSelectLeaveType()\">清除考勤</button>";
        
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
        if(window.settableheightf){
            settableheight()
        }
        var data = d.listData;
        var html = "<tr><td><span> 科室：</span><b>" + d.UnitName + "</b></td><td></td>";
        html += "<td><b>" + d.Year + "</b>年<b>" + d.MonthNumber + "</b>月 </td><td></td><td style='text-align:right;'> <span> 状态:</span> <b>" + d.GroupReportStatusName + "</b></td></tr>";
        html += "<thead><tr class=\"\">";
        if (this.viewMode != 1) {
            html += "<th></th>";
            html += "<th >部门</th>";
        }
        html += "<th >序号</th>";
        html += "<th ><a href='#' onclick=\"\">姓名</a></th>";
        html += "<th >工号</th>";
        var days = d.Days.length;

        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) {
                html += "<th class='' style='text-align:center;color:red;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
            else {
                html += "<th class='' style='text-align:center;'>" + this.toWeekName(wDay) + yday + "</th>";
            }
        }
        //<th rowspan='2'>出勤</th>
        if (this.viewMode == 1) {
            html += "<th>请假</th>";
        }
        html += "</tr></thead>";

        var colSpan1 = (days + 4);
        //html += "<tbody style=\"height:50px;overflow:auto;font-size: 12px;\">";
        $("#table1-tr1 tbody tr").remove()
        $("#table1-tr1 tbody").append(html)
        $("#table1-tr2 tbody tr").remove()
        $("#table1-tr2 tbody").append(html)
        
        var html2 = "";
        //debugger;
        var html1 = "";
        for (var i = 0; i < data.length; i++) {
            var emp = data[i];

            if ((i % 2) == 0)
                html2 += "<tr class=\"even\">";
                html1 += "<tr class=\"even\">";
            if (this.viewMode != 1) {
                html2 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chk_" + emp.EmployeeId + "' /></td>";
                html2 += "<td class=\"nameCol\" style=\"width:100px;vertical-align:middle;\">" + emp.DeptName + "</td>";
                html1 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chk_" + emp.EmployeeId + "copy' /></td>";
                html1 += "<td class=\"nameCol\" style=\"width:100px;vertical-align:middle;\">" + emp.DeptName + "</td>";
            }
            else {
                html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + (i + 1) + "</td>";
                html1 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + (i + 1) + "</td>";
            }

            html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + emp.Name + "</td>";
            html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";
            html1 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + emp.Name + "</td>";
            html1 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";
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
                html1 += "<td  id=\"" + cellId + "copy" + "\" title=\"" + cellTitle + "\"";
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
                html1 += " style='vertical-align:middle;cursor:pointer;text-align:center;' >";
                if (inText != "") {
                    html2 += "<span class=\"spancolo1\" style=\"color:red;\">";
                    html2 += inText;
                    html2 += "</span>";
                    html1 += "<span class=\"spancolo1\" style=\"color:red;\">";
                    html1 += inText;
                    html1 += "</span>";
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
                            html1 += "<div style='cursor:pointer;color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_scopy'> " + shiftName + " </div>";
                            //}
                        }
                    }
                }

                for (var j = 0; j < row.LeaveDetail.length; j++) {
                    var leaveInfo = row.LeaveDetail[j];
                    //debugger;
                    var tempCell = '<div style="color:' + row.LeaveDetail[j].Color + ';background-color:' + row.LeaveDetail[j].BgColor + '" class=\"qingjia';
                    var tempCell1 = '<div style="color:' + row.LeaveDetail[j].Color + ';background-color:' + row.LeaveDetail[j].BgColor + '" class=\"qingjia';
                    var leaveStr = leaveInfo.LeaveTypeName;
                    if (this.showSymbol && leaveInfo.Symbol != "") {
                        leaveStr = leaveInfo.Symbol;
                    }
                    if (!leaveInfo.canEdit) {
                        tempCell += 'class="cannotEdit"';
                        tempCell1 += 'class="cannotEdit"';
                    }
                    tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveStr + "(" + leaveInfo.LeaveDays + ")</div>";
                    tempCell1 += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "copy' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveStr + "(" + leaveInfo.LeaveDays + ")</div>";
                    html2 += tempCell;
                    html1 += tempCell1;
                }


                html2 += "</td>";
                html1 += "</td>";

            }

            //print mode display stat
            if (this.viewMode == 1) {
                //html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AbsentDays + "</td>";
                //html1 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AbsentDays + "</td>";
                if (emp.StatDesc) {
                    var descHTML = "";
                    if (emp.StatDesc != "") {
                        descHTML = emp.StatDesc;
                    }
                    html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + descHTML + "</td>";
                    html1 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + descHTML + "</td>";
                }
                else {
                    html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\"></td>";
                    html1 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\"></td>";
                }
            }
            //html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AttendDays + "</td>";
            //html2 += "<td class=\"\" ></td>";
            html2 += "</tr>";
            html1 += "</tr>";
        }



        html += html2;
        html += "</tbody></table>";

        //$("#shiftContainer1").html(html);
        //$(".table1 tbody").append(html);
       
        $("#table1-tr1 tbody").append(html1);
        $("#table1-tr2 tbody").append(html2);
    }
    attendanceEditor.prototype.renderMonthCalendar = function (d) {
        if (window.settableheightf) {
            settableheight()
        }
        //debugger;
        if (this.viewMode == 1) {
        //if (d.GroupReportStatus == 1) {
            this.renderMonthViewCalendar(d);
            return;
        }
        var data = d.listData;

        var html = '<th style="width: 40px">序号</th><th style="width: 40px;position:relative;"><p class="inputcheck" style="top:10px;"><input id="checkall" type="checkbox"></p></th><th>姓名</th><th>工号</th>';
        var days = d.Days.length;

        for (var j = 0; j < d.Days.length; j++) {
            var day = d.Days[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if ((wDay == 6 || wDay == 0 || day.isHoliday) && !day.isWorkDay) {
                html += "<th class='red-th' ><div>" + this.toWeekName(wDay) + "</div><div>" + yday + "</div></th>";
            }
            else {
                html += "<th class='' ><div>" + this.toWeekName(wDay) + "</div><div>" + yday + "</div></th>";
            }
        }
        if (this.DescriptionCode == 1) {
            html += "<th class='' ><div>备注</div><div></div></th>";
        }
        if (this.Custom1 == 1) {
            html += "<th class='' ><div>医疗组</div><div></div></th>";
            html += "<th class='' ><div>是否为医疗组长</div><div></div></th>";

        }
        $("#table1-tr1 .table1-tr1").html(html);
        $("#table1-tr2 .table1-tr2").html(html);
        //endheader
        this.renderFixColumns(d);

        var colSpan1 = (days + 4);

        var html2 = "";
        var html1 = "";
        //debugger;

        for (var i = 0; i < data.length; i++) {
            var emp = data[i];

            if ((i % 2) == 0){
                html2 += "<tr>";
                html1 += "<tr>";
            }
            else {
                html2 += "<tr class=\"trcolo\">";
                html1 += "<tr class=\"trcolo\">";
            }
                
            //if (this.viewMode != 1) {
            //   html2 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chk_" + emp.EmployeeId + "' /></td>";
            //   html2 += "<td class=\"nameCol\" style=\"width:100px;vertical-align:middle;\">" + emp.DeptName + "</td>";
            //   html1 += "<td class=\"nameCol1\" style='vertical-align:middle;max-width:50px;'><input type='checkbox' value=\"" + emp.EmployeeId + "\" id='chk_" + emp.EmployeeId + "' /></td>";
            //   html1 += "<td class=\"nameCol\" style=\"width:100px;vertical-align:middle;\">" + emp.DeptName + "</td>";
            //}
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


            html2 += '';

            html1 += "<td style=\"width: 40px\">" + (i + 1) + "</td>";
            html1 += "<td style=\"width: 40px\" class=\"checktd\">";
            html1 += "<p class=\"inputcheck\">";
            //html1 += " <img src=\"/img/add/23.check_1(14x14).png\">";
            html1 += "<input type=\"checkbox\" title=\"选择 " + emp.Name + "\" name=\"empid\" value=\"" + emp.EmployeeId + "\" id=\"" + cellId + "\" data-name=\"" + emp.Name + "\">";
            html1 += "  </p>";
            html1 += "</td>";

            //html1 += "<td nowrap=\"nowrap\">" + emp.DeptName+"</td>";
            html1 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + emp.Name + "</td>";
            html1 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";


            html1 += ''
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
                html1 += "<td  id=\"" + cellId + "copy" + "\" title=\"" + cellTitle + "\"";
                var inText = "";
                if (empInDate == row.AttendDate) {
                   //inText = "调入";
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
                        html1 += "<span class=\"spancolo1\" style=\"color:red;\">";
                        html1 += inText;
                        html1 += "</span>";
                    }

                    var shiftName = "工作";
                    if (row.ShiftName) {
                        if (row.ShiftName != "") {
                            shiftName = row.ShiftName;
                            if (totalDays < 1)
                                html2 += "<div style='cursor:pointer;color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_s'> " + shiftName + " </div>";
                                html1 += "<div style='cursor:pointer;color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_scopy'> " + shiftName + " </div>";
                        }
                    }

                    for (var j = 0; j < row.LeaveDetail.length; j++) {
                        var leaveInfo = row.LeaveDetail[j];
                        var tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        tempCell += " title='报送部门:" + leaveInfo.BusinessUnitIdName + " 报送人:" + leaveInfo.CreatedByName + "'";
                        
                        tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";

                        var tempCell1 = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        tempCell1 += " title='报送部门:" + leaveInfo.BusinessUnitIdName + " 报送人:" + leaveInfo.CreatedByName + "'";

                        tempCell1 += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "copy' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";

                        html2 += tempCell
                        html1 += tempCell1;
                    }

                    html2 += "</td>";
                    html1 += "</td>";

                }
                else {
                    // tempCell = "<div style='cursor:pointer;' onclick=\"setEmpWorkStatus('{0}','{1}','{2}','c_{0}_{1}')\" id='c_{0}_{1}' data-status='{2}'>{3}</div>";
                    //employeeId, attendDate, attd.LeaveTypeCode, attd.LeaveTypeName
                    html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' "; //end TD
                    html1 += " style='vertical-align:middle;cursor:pointer;text-align:center;' "; //end TD
                    if ((this.closeStatus == 1 || this.reportStatus == 1)&&!window.adminedit) {
                        html2 += " onclick=\"void('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\"  >";
                        html1 += " onclick=\"void('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\"  >";
                    }
                    else {
                        html2 += " onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\"  >";
                        html1 += " onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\"  >";
                    }
                    var shiftName = "工作";

                    if (inText != "") {
                        html2 += "<span class=\"spancolo1\" style=\"color:red;\">";
                        html2 += inText;
                        html2 += "</span>";
                        html1 += "<span class=\"spancolo1\" style=\"color:red;\">";
                        html1 += inText;
                        html1 += "</span>";
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
                                html1 += "<span class=\"spancolo1\">";
                                html1 += shiftName;
                                html1 += "</span>";
                            }
                        }
                    }
                    else {
                        //if (row.WorkStatus == 0) {
                        // html2 += "<div style='' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'> / </div>";
                        //}
                        html2 += "<span class=\"spancolo1\">";
                        html2 += "</span>";
                        html1 += "<span class=\"spancolo1\">";
                        html1 += "</span>";
                    }

                    for (var j = 0; j < row.LeaveDetail.length; j++) {
                        //0 工作 1 请假 2休息
                        //debugger;white-space:nowrap;
                        var leaveInfo = row.LeaveDetail[j];
                        //tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                        var tempCell = '<div style="color:' + row.LeaveDetail[j].Color + ';background-color:' + row.LeaveDetail[j].BgColor + '" class=\"qingjia';
                        var tempCell1 = '<div style="color:' + row.LeaveDetail[j].Color + ';background-color:' + row.LeaveDetail[j].BgColor + '" class=\"qingjia';
                        //<div class="qingjia">事假（1）</div>

                        if (this.reportStatus == 1&&!window.adminedit) {
                            tempCell += ' cannotEdit"'
                            tempCell1 += ' cannotEdit"'
                        } else {
                            if (row.LeaveDetail[j].canEdit || window.adminedit) {
                                tempCell += "\" onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + cellId + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
                                tempCell1 += "\" onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + cellId + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
                            } else {
                                tempCell += ' cannotEdit"'
                                tempCell1 += ' cannotEdit"'
                            }
                        }

                        //tempCell += "  onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','" + row.AttendDate + "','c_" + emp.EmployeeId + "_" + row.AttendDate + "')\" ";
                       
                        tempCell += " title='报送部门:" + leaveInfo.BusinessUnitIdName + " 报送人:" + leaveInfo.CreatedByName + "'";
                        tempCell1 += " title='报送部门:" + leaveInfo.BusinessUnitIdName + " 报送人:" + leaveInfo.CreatedByName + "'";
                        tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' data-status='{2}'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                        tempCell1 += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "copy' data-status='{2}'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                        

                        html2 += tempCell;
                        html1 += tempCell1;
                    }

                    html2 += "</td>";
                    html1 += "</td>";
                }

            }
            if (this.DescriptionCode == 1) {
                html2 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:90px;\">'
                html1 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:90px;\">'
                if (this.CloseStatusCode == 1)//如果封存
                {
                    html2 += '<span>' + emp.Description + '</span>'
                    html1 += '<span>' + emp.Description + '</span>'
                }
                else {
                    if (this.GroupReportStatus == 0) {
                        html2 += '<input employeeId="' + emp.EmployeeId + '" style="border:1px solid #dedede;width:80px;margin-left:3px;height:22px;" class="description-textarea" value="' + emp.Description + '"></input>'
                        html1 += '<input employeeId="' + emp.EmployeeId + '" style="border:1px solid #dedede;width:80px;margin-left:3px;height:22px;" class="description-textarea" value="' + emp.Description + '"></input>'
                    }
                    else if (this.GroupReportStatus == 1) {
                        html2 += '<span>' + emp.Description + '</span>'
                        html1 += '<span>' + emp.Description + '</span>'
                    }
                }
                html2 += '</td>';
                html1 += '</td>';
            }

            if (this.Custom1 == 1) {
                html2 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:90px;\">'
                html1 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:90px;\">'
                if (this.CloseStatusCode == 1)//如果封存
                {
                    html2 += '<span>' + emp.Custom2 + '</span>'
                    html1 += '<span>' + emp.Custom2 + '</span>'
                }
                else {
                    html2 += '<span>' + emp.Custom2 + '</span>'
                    html1 += '<span>' + emp.Custom2 + '</span>'
                }
                html2 += '</td>';
                html1 += '</td>';
            }


            if (this.Custom1 == 1) {
                html2 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:90px;\">'
                html1 += '<td class=\"\" style=\"text-align:center;vertical-align:middle;width:90px;\">'
                if (this.CloseStatusCode == 1)//如果封存
                {
                    html2 += '<span>' + emp.Custom1 + '</span>'
                    html1 += '<span>' + emp.Custom1 + '</span>'
                }
                else {
                    if (this.GroupReportStatus == 0) {
                        if (emp.Custom1 == '是') {
                            html2 += '<select value="' + emp.Custom1 + '" employeeId="' + emp.EmployeeId + '" class="peopleCustom1"><option value=""></option><option value="否">否</option><option selected=true value="是">是</option></select>'
                            html1 += '<select value="' + emp.Custom1 + '" employeeId="' + emp.EmployeeId + '" class="peopleCustom1"><option value=""></option><option value="否">否</option><option selected=true value="是">是</option></select>'
                        } else {
                            html2 += '<select value="' + emp.Custom1 + '" employeeId="' + emp.EmployeeId + '" class="peopleCustom1"><option value=""></option><option selected=true  value="否">否</option><option value="是">是</option></select>'
                            html1 += '<select value="' + emp.Custom1 + '" employeeId="' + emp.EmployeeId + '" class="peopleCustom1"><option value=""></option><option selected=true  value="否">否</option><option value="是">是</option></select>'
                        }

                    }
                    else if (this.GroupReportStatus == 1) {
                        html2 += '<span>' + emp.Custom1 + '</span>'
                        html1 += '<span>' + emp.Custom1 + '</span>'
                    }
                }
                html2 += '</td>';
                html1 += '</td>';
            }

            

            //print mode display stat
            if (this.viewMode == 1) {
                //html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AbsentDays + "</td>";
                //html1 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AbsentDays + "</td>";
                if (emp.StatDesc) {
                    var descHTML = "";
                    if (emp.StatDesc != "") {
                        descHTML = emp.StatDesc;
                    }
                    html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + descHTML + "</td>";
                    html1 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + descHTML + "</td>";
                }
                else {
                    html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\"></td>";
                    html1 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\"></td>";
                }
            }

            html2 += "</tr>";
            html1 += "</tr>";
        }
        $("#table1-tr1 tbody tr").not("#table1-tr1 tbody .table1-tr1").remove();
        $("#table1-tr2 tbody tr").not("#table1-tr2 tbody .table1-tr2").remove();
        $("#table1-tr1 tbody").append(html1);
        $("#table1-tr2 tbody").append(html2);
        if (this.DescriptionCode == 1) {
            if (this.CloseStatusCode == 1)//如果封存
            {
                $('.description-textarea').prop('readonly', 'readonly')
            }
            else {
                if (this.GroupReportStatus == 0) {

                    $('.description-textarea').prop('readonly', '')
                    $('.description-textarea').blur(function () {
                        ajaxMethodPOSTData('attendance.month.employee.remark.save', {
                            businessUnitId: $('#groupBar .active').attr('deptid'),
                            employeeId: $(this).attr('employeeId'),
                            yearNumber: $('#yearNumber').val(),
                            monthNumber: $('#monthNumber').val(),
                            Remark: $(this).val(),
                            Custom1: $(this).parent().parent().find('.peopleCustom1').val(),
                            Custom2:$(this).parent().parent().find('.peopleCustom2').val()
                        }, function (data) {

                        })
                    })
                }
                else if (this.GroupReportStatus == 1) {
                    $('.description-textarea').prop('readonly', 'readonly')
                }
            }
        }
        if (this.Custom1 == 1) {
            $('.peopleCustom1').change(function () {
                ajaxMethodPOSTData('attendance.month.employee.remark.save', {
                    businessUnitId: $('#groupBar .active').attr('deptid'),
                    employeeId: $(this).attr('employeeId'),
                    yearNumber: $('#yearNumber').val(),
                    monthNumber: $('#monthNumber').val(),
                    Custom1: $(this).val(),
                    Custom2:$(this).parent().parent().find('.peopleCustom2').val(),
                    Remark: $(this).parent().parent().find('.description-textarea').val()

                }, function (data) {

                })
            })
            $('.peopleCustom2').change(function () {
                ajaxMethodPOSTData('attendance.month.employee.remark.save', {
                    businessUnitId: $('#groupBar .active').attr('deptid'),
                    employeeId: $(this).attr('employeeId'),
                    yearNumber: $('#yearNumber').val(),
                    monthNumber: $('#monthNumber').val(),
                    Custom1: $(this).parent().parent().find('.peopleCustom1').val(),
                    Custom2: $(this).val(),
                    Remark: $(this).parent().parent().find('.description-textarea').val()

                }, function (data) {

                })
            })
        }

        
        $("#table1-tr2 tr").each(function (index) {
            if (index > 50) {
                $(this).hide()
            }
        })
        $('#TotalPageNumber span').html(Math.ceil(($("#table1-tr2 tr").length - 1) / 50))


        $('#checkall').change(function () {
            if ($(this).attr('checked') == 'checked') {
                $('.inputcheck input').each(function (i, dom) {
                    if ($(dom).parents('tr').css('display') != 'none') {
                        $(dom).prop('checked', 'checked')
                    } else {
                        $(dom).prop('checked', '')
                    }
                })
            } else {
                $('.inputcheck input').prop('checked', '')
            }
        })
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
        if (this.calendar == 2){
            this.renderWeekCalendar(d);
        }// week calendar
            
        else {
            this.renderMonthCalendar(d);
        }
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
        $('#attendance').hide()

        if (window.adminedit) {
            para += '&unitId=' + getQueryString('deptId');
        }
        if (this.isHRUpdate)//人力资源修改
        {
            para += '&isHRUpdate=1';
        }

        ajaxMethodGetData('attenance.report.search', { attendyear: self.year, attendmonth: self.month }, function (data) {
            if (data.rows[0].isopenedattendance == 'True'||window.adminedit) {
                $('#attendance').show()
                $('#attendance>div').show()
                $('.right-set>button').show()
                $('.right-set>p').show()
                $('.right-check').show()
                self.loadData("attendance.dept.employee.search", para, function (data) {

                    //if (window.adminedit) {
                    //    data.GroupReportStatus = 0
                    //    self.CloseStatusCode = data.CloseStatusCode

                    //}

                    var html = "";
                    if (!data) return;
                    //debugger;
                    //self.viewMode = data.viewMode;
                    $('#description').val(data.Description)
                    $('#LeaveMessage').val(data.LeaveMessage)
                    self.CloseStatusCode = data.CloseStatusCode
                    self.GroupReportStatus = data.GroupReportStatus
                    if (data.CloseStatusCode == 1)//如果封存
                    {
                        showButtons(0);
                        jQuery('.printbtn').show();
                    }
                    else {
                        if (data.GroupReportStatus == 0) {
                            showButtons(1);
                            jQuery("#btnSaveBatch").html("提交考勤");
                            jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(1)");
                            jQuery("#btnSaveBatch").show();
                            jQuery('.printbtn').hide();
                        }
                        else if (data.GroupReportStatus == 1) {
                            //self.setMode(1);
                            showButtons(0);
                            if (data.CloseStatusCode == 0) {
                                jQuery("#btnSaveBatch").html("撤销提交");
                                jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(0)");
                                jQuery("#btnSaveBatch").show();
                                jQuery('.printbtn').show();
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
            } else {
                $('#attendance').show()
                $('#calendarHeader').html($('#yearNumber').val()+'年' + $('#monthNumber').val() + '月')
                $('#attendance>div').hide()
                $('.attendance-head').show()
                $('.right-set>button').hide()
                $('.right-set>p').hide()
                $('.right-check').hide()
                alert($('#monthNumber').val()+'月未开通上报，请上报开通月份！')
            }
        })

        

    }
    attendanceEditor.prototype.setMode = function (mode)
    {
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
        if (this.Custom1 == '1') {
            url += '&isMedicalGroup=true'
        }
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
        $(document).ready(function () {
            var height = $(window).height() - 260 - $('#attendSettings').height();
            if (window.isFullScreen) {
                height = $(window).height() - 160 - $('#attendSettings').height();
                $('#cancelScreen').show();
                $('#allScreen').hide();
            }
            else {
                $('#allScreen').show();
                $('#cancelScreen').hide();
            }
            if ($('#attendSettings').css('display') == 'none') {
                height = height + 40
            }
            $('.attendance-body-table').css('height', height + 'px');           
        })
    }
}
/*部门切换*/
function teamChange(deptId) {
    //var deptId = $(this).attr("deptid");
    //debugger;
    document.getElementById("unitId").value = deptId;
    editor.search('', deptId);
    
    
    $("#attendance .attend-team button").removeClass("active")
    //$(this).addClass("active")
    $("#dept_" + deptId).addClass("active");
    var deptName = $("#dept_" + deptId).attr("data-name");
    $("#unitName").val(deptName);
    pagesizechange(window.pagesize);
}
/*
考勤类型选择
*/
function pickLeaveType(t) {
    $("#attendance .jiaqi-type button").removeClass("active")
    // $(this).addClass("active")leavetype_1
    $("#leavetype_" + t).addClass("active");
    document.getElementById("selWorkShift").value = t;
}
function clearSelectLeaveType() {
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
    var deptId = document.getElementById("unitId").value;

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
    var ele1 = document.getElementById("chkShowShiftDetail");
    if (ele1) {
        if (document.getElementById("chkShowShiftDetail").checked) {
            symbol = "1";
        }
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
        jQuery("#" + eleID + "copy").attr("data-status", data.WorkStatus);
        //if (data.WorkStatus == 100)
        //{
        //}
        //else
        //{
        //}
        //tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;' onclick=\"setEmpWorkStatus('" + data.EmployeeId + "','" + data.AttendDate + "','" + data.AttendDate + "','c_" + data.EmployeeId + "_" + data.AttendDate + "')\" id='c_" + data.EmployeeId + "_" + data.AttendDate + "' data-status='{2}'>" + data.CellText + "</div>";
        var html2 = "";
        var html1 = "";
        //debugger;
        if (data.LeaveDetail.length > 0) {
            for (var j = 0; j < data.LeaveDetail.length; j++) {
                //0 工作 1 请假 2休息
                var leaveInfo = data.LeaveDetail[j];
                var BgColor = leaveInfo.BgColor
                var Color = leaveInfo.Color
                //BACKGROUND:#6ce26c;color:red;

                if (data.LeaveDetail[j].canEdit==true) {
                    var tempCell = "<div style='background-color:" + BgColor + ";color:" + Color + "' class='qingjia' style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;'";
                    tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + eleID + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
                    var tempCell1 = "<div style='background-color:" + BgColor + ";color:" + Color + "' class='qingjia' style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;'";
                    tempCell1 += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + eleID + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";

                } else {
                    var tempCell = "<div class='qingjia cannotEdit' style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;'";
                    var tempCell1 = "<div class='qingjia cannotEdit' style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;'";
                }
                //tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + eleID + "')\"";
                tempCell += " title='报送部门:" + leaveInfo.BusinessUnitIdName + " 报送人:" + leaveInfo.CreatedByName + "'";
                tempCell += " data-status='" + leaveInfo.LeaveTypeCode + "'";
                tempCell1 += " title='报送部门:" + leaveInfo.BusinessUnitIdName + " 报送人:" + leaveInfo.CreatedByName + "'";
                tempCell1 += " data-status='" + leaveInfo.LeaveTypeCode + "'";
                tempCell += " id='c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate + "' >" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                tempCell1 += " id='c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate + "copy' >" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                html2 += tempCell;
                html1 += tempCell1;
            }
        }
        //else {
        // html2 = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;'  id='c_" + data.EmployeeId + "_" + data.AttendDate + "' data-status='{2}'>" + data.CellText + "</div>";
        //}
        jQuery("#" + eleID).html(html2);
        jQuery("#" + eleID+"copy").html(html1);
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
    var a = cellId.split('_');
    var empId = a[1];
    var day = a[2];
    if (document.getElementById("selWorkShift").value == "") {
        delAttendEmployeeDayData(refreshAttendCell, valId, empId, day, cellId);
        //refreshAttendCell(refreshAttendCell, empId, day);
    } else {
        setEmpWorkStatus(empId, day, '', cellId)
    }
}
function refreshAttendCell(data, cellId) {
    var html2 = "";
    var html1 = "";
    if (data.LeaveDetail) {
        for (var j = 0; j < data.LeaveDetail.length; j++) {
            var leaveInfo = data.LeaveDetail[j];
            var cellId = "c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate;
            var BgColor = leaveInfo.BgColor
            var Color = leaveInfo.Color
            var tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:" + BgColor + ";color:" + Color + ";'";
            var tempCell1 = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:" + BgColor + ";color:" + Color + ";'";
            if (data.LeaveDetail[j].canEdit == true) {
                tempCell += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + cellId + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
                tempCell1 += " onclick=\"delAttendEmpDay('" + leaveInfo.ValueId + "','" + cellId + "','" + leaveInfo.EmployeeId + "','" + leaveInfo.AttendDate + "')\"";
            } else {
                tempCell += "class='cannotEdit'"
                tempCell1 += "class='cannotEdit'"
            }
            tempCell += " id='c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate + "_" + leaveInfo.ValueId + "' data-status='{2}'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
            tempCell1 += " id='c_" + leaveInfo.EmployeeId + "_" + leaveInfo.AttendDate + "_" + leaveInfo.ValueId + "copy' data-status='{2}'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
            html2 += tempCell;
            html1 += tempCell1;
        }
    }
    jQuery("#" + cellId).html(html2);
    jQuery("#" + cellId+"copy").html(html1);
    editor.resizeDesigner();
}
/*根据id删除考勤*/
function delAttendEmployeeDayData(renderCallback, id, empId, attendDay, eleCellId) {

    var url = "/apps/HrProcessor.ashx?cmd=attendance.leaveday.delete&id=" + id;
    url += "&EmployeeId=" + empId;
    url += "&AttendDate=" + attendDay;
    url += "&objectTypeCode=" + 10;
    var unitId = $('#groupBar .active').attr('id').split('_')[1]
    url += "&unitId=" + unitId;
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
    ajaxMethodGetAsyncData('attendace.monthtips.number', {
        startDate: $('#calendarHeader').html().split(' 至 ')[0],
        endDate: $('#calendarHeader').html().split(' 至 ')[1],
        unitId: unitId
    }, false, function (data) {
        var a = "";
        if (status == 0) {
            a = "你确定要取消  部门【" + unitName + "】  " + attendYear + "年" + attendMonth + "月  上报考勤吗？";
        }
        else {
            a = "你确定要提交上报 部门【" + unitName + "】  " + attendYear + "年" + attendMonth + "月  考勤吗？";
            a += '\n' + '本月人数' + data.data.Table[0].Count + '人' + '\n' + '上月人数' + data.data.Table[1].Count + '人'
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
                        EmployeeId: "",
                        desc: "",
                        description: $('#description').val(),
                        LeaveMessage: $('#LeaveMessage').val()
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

                        //良乡-更新出勤天数,计算按国家法定节假日计算更新
                        //updateAttendDays(attendYear, attendMonth);

                        searchMonthEmpAttendances();
                        if (status == 1) {
                            showButtons(0);
                            jQuery("#btnSaveBatch").html("撤销提交");
                            jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(0)");
                            jQuery("#attendStatusName").html("已上报");
                            jQuery('.printbtn').show()
                            if (data.Depts) {
                                var len = data.Depts.length;
                                var msg = "";
                                var deptId = "";
                                for (var i = 0; i < len; i++) {
                                    var row = data.Depts[i];
                                    if (row.StatusCode == 0) {
                                        msg += row.ObjectIdName;
                                    }
                                    if (row.StatusCode == 0 && deptId == "") {
                                        deptId = row.ObjectId;
                                    }
                                }
                                if (msg != "") {
                                    //debugger;
                                    teamChange(deptId);
                                    alert(msg+"，但还有【" + msg + "】 未上报完成！" );
                                }
                            }

                        }
                        else {
                            showButtons(1);
                            jQuery("#btnSaveBatch").html("提交上报考勤");
                            jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(1)");
                            jQuery("#attendStatusName").html("未上报");
                            //jQuery("#unitId").val();
                            jQuery('.printbtn').hide()
                        }
                        jQuery("#btnSaveBatch").show();

                    }
                });

            }
        
    })
    
}

//良乡-更新出勤天数,计算按国家法定节假日计算更新
function updateAttendDays(attendYear, attendMonth) {
    var param = { attendYear: attendYear, attendMonth: attendMonth };
    var url = "attendance.attenddays.update";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: param,
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
           // console.log("updateAttendDays data: " + data);
        },
        type: "POST",
        url: url
    });
}

/*显示或者隐藏那些按钮*/
function showButtons(status) {
    if (status == 0) {
        jQuery("#attendSettings").hide();
        jQuery("#btnSychEmployee").hide();
        jQuery("#btnBatchAttend").hide();
        jQuery("#btnDelEmpData").hide();
        jQuery("#btnSaveBatch").hide();
        jQuery("#btnTransferIn").hide();
        jQuery("#btnTransferOut").hide();
        jQuery("#btnSortEmp").hide();
        $('#description').prop('readonly', 'readonly')
        $('#LeaveMessage').prop('readonly', 'readonly')
        $('.description-textarea').prop('readonly', 'readonly')

        $('#btnchangeMedicalGroup').hide()
    }
    if (status == 1) {

        //var eleShiftBar = document.getElementById("shiftBar");
        //if (eleShiftBar) {
        //    eleShiftBar.style.display = "block";
        //    jQuery("#actionToolBar").show();
        //}
        //jQuery("#actionCancelBar").hide();
        jQuery("#attendSettings").show(); //时间
        jQuery("#btnSychEmployee").show();
        jQuery("#btnBatchAttend").show();
        jQuery("#btnDelEmpData").show();
        jQuery("#btnSaveBatch").show();

        jQuery("#btnTransferIn").show();
        jQuery("#btnTransferOut").show();
        jQuery("#btnSortEmp").show();
        jQuery("#shiftBar").show();
        $('#description').prop('readonly', '')
        $('#LeaveMessage').prop('readonly', '')
        $('.description-textarea').prop('readonly', '')
        if (attendanceEditor.prototype.Custom1 == '1') {
            $('#btnchangeMedicalGroup').show()
        } else {
            $('#btnchangeMedicalGroup').hide()

        }
    }
    if (window.adminedit) {
        jQuery("#attendSettings").show();
    }
    editor.resizeDesigner();
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
var empIds = "";
var empNames = "";
function openBatchAttend() {
   // debugger
    empIds = ''
    empNames = ''
    var selectCount = 0;
    $("input[id^=emp_]").each(function (i, elment) {
        var check = $(this).prop("checked");
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

    if (empIds == "" || selectCount == 0) {
        alert("请至少选择一个人员进行考勤设置");
        return;
    }
    var yearNumber = jQuery("#yearNumber").val();
    var monthNumber = jQuery("#monthNumber").val();
    selectCount = 0;
    var unitId = jQuery("#unitId").val();

    var url = "/attd/batchMonthAttend.aspx?objectTypeCode=10&unitId=" + unitId + "&yearNumber=" + yearNumber + "&monthNumber=" + monthNumber;
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
        var check = $(this).prop("checked");
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
                unitId: unitId,
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
            var check = $(this).prop("checked");

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
            alert("请至少选择一个人员。");
            return;
        }
        transferOutSelectEmp();
        //var url = "/attd/TransferEmpOut.aspx?objectTypeCode=10&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empId=" + empIds + "&empName=" + empNames;
        //showDialog(url, "TransferEmpOut", title, 580, 400);
        return;
    }

    var title = "加人";
    if (type == 1)
        title = "删人";
    var url = "";
    //45 - 借入，49 - 调入
    if (type == 45)
    {
        title = "借入";
        url = "/attd/TransferBorrowEmpIn.aspx?objectTypeCode=10&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empName=" + empNames;
        showDialog(url, "TransferEmp", title, 620, 520);
    }
    else
    {
        //debugger;
        url = "/attd/TransferEmp.aspx?objectTypeCode=10&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empName=" + empNames;
        showDialog(url, "TransferEmp49", title,740,500);
    }
    
    
   
}
/*人员调出*/
function TransferEmpOut()
{
    var empIds = "";
    var empNames = "";
    var selectCount = 0;

    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#unitName").val();

    //if (type == 1) {
        //调出
        $("input[id^=emp_]").each(function (i, elment) {
            var check = $(this).prop("checked");

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
            alert("请至少选择一个人员。");
            return;
        }
    var url = "/attd/TransferEmpOut.aspx?objectTypeCode=10&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empId=" + empIds + "&empName=" + empNames;
    showDialog(url, "TransferEmpOut", "调出", 580, 400);
}
function empLend() {
   // debugger
    var empIds = "";
    var empNames = "";
    var selectCount = 0;

    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#unitName").val();


    //借出
    $("input[id^=emp_]").each(function (i, elment) {

        var check = $(this).prop("checked");

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
        alert("请至少选择一个人员。");
        return;
    }

    var url = "/attd/EmpLend.aspx?objectTypeCode=10&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empName=" + empNames + "&EmployeeId_lkid=" + empIds;
    showDialog(url, "EmpLend", "调出", 620, 480);


}
/*
删除/调出人员
*/
function transferOutSelectEmp() {

    var empIds = "";
    var j = 0;
    $("input[id^=emp_]").each(function (i, elment) {
        var check = $(this).prop("checked");
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
        alert("请选择人员进行考勤删除.");
        return;
    }
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    if (Modal.confirm("你确定要从本部门删除你选择的员工吗？删除后，选择的人员在本部门上报的考勤明细同时也删除。如果选中的员工在本月在本部门上过班，请不要删除。")) {

        //var url = "/apps/HrProcessor.ashx?cmd=attendance.employee.month.transferout";
        var url = "/apps/HrProcessor.ashx?cmd=attendance.dept.employee.month.delete";
        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                objectTypeCode: 10,
                unitId: unitId,
                outDate: "",
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
function printAttendStatReport() {

}
/*备注*/
function remarkDialog() {
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#unitName").val();
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var url1 = '/attd/shifts/RemarkWorkshift.aspx?objectTypeCode=10&unitId=' + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth;
    showDialog(url1, "remark", "备注", 680, 480);
}
function sortEmpDialog() {
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

//更改医疗组
function changeMedicalGroup() {
    var empIds = "";
    var empNames = "";
    var selectCount = 0;

    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#unitName").val();


    $("input[id^=emp_]").each(function (i, elment) {
        var check = $(this).prop("checked");

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

    if (empIds == "" || selectCount <= 0) {
        alert("请选择一个人员进行考勤设置");
        return;
    }
    //transferOutSelectEmp();
    var url = "/attd/changeMedicalGroup.aspx?objectTypeCode=30041&unitId=" + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empId=" + empIds + "&empName=" + empNames;
    showDialog(url, "", '设置考勤组', 580, 400);


}
