var AttendTypesData = {}
var copyData = {}
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
    attendanceEditor.prototype.searchText = "";
    attendanceEditor.prototype.searchMode = false;

    attendanceEditor.prototype.renderGroupBar = function (data, curentUnitId) {
        var html = "<span>出勤组：</span>";
        if (data.length == 0) {
            // html = "<div style=\"border-radius: 4px;border-color: #39f;background-color: #ffc;border-style: solid;border-width: 1px;color: #000;padding: 6px 8px 6px 6px;margin: 4px 20px;\">您还没有管理任何排班班组，点击<a href=\"/06c/e?retURL=%2f06c%2ffilter\" title=\"新建组\">这里</a>新建考勤组</div>";
        }
        this.groups = data;
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            if (item.id == curentUnitId) {
                //html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                //html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" checked=\"checked\" onclick=\"editor.search('',this.value)\" data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\"/> " + item.name + "</div>";
                html += "<button class=\"active\"  data-name=\"" + item.name + "\" deptid=\"" + item.id + "\" onclick=\"teamChange('" + item.id + "')\" id=\"dept_" + item.id + "\">" + item.name + "</button>";
            }
            else {
                //html += "<div style=\"display:inline-block;background-color:#eee;margin-top:5px;margin-bottom:5px;margin-left:5px;font-size:13px;line-height:25px;padding:2px 5px;border-radius:5px;cursor:pointer;\">";
                //html += "<input type='radio' name='attendGroup' value='" + item.id + "' id=\"group_" + item.id + "\" onclick=\"editor.search('',this.value)\"  data-name=\"" + item.name + "\" deptid=\"" + item.deptId + "\" /> " + item.name + "</div>";
                html += "<button   data-name=\"" + item.name + "\" deptid=\"" + item.id + "\"  onclick=\"teamChange('" + item.id + "')\"  id=\"dept_" + item.id + "\">" + item.name + "</button>";
            }
        }
        $("#groupBar").html('');
    }

    attendanceEditor.prototype.getCellColor = function (shiftId) {
        for (var i = 0; i < this.shifts.length; i++) {
            var shift = this.shifts[i];
            if (shift.WorkShiftId == shiftId)
                return shift.Color;
        }
    }

    attendanceEditor.prototype.renderShiftBar = function (data) {
        window.AttendTypesData = data.AttendTypes;
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
        html += "</optgroup>";

        html += "</select>天&nbsp;";
        html += "<input type=\"button\" name=\"btnWorkShift\" id=\"btnWorkShift_00\" class=\"btnShift\" value=\"清除排班\" title=\"清除排班\" onclick=\"clearSelectShift()\">&nbsp;&nbsp;";
        html = "<span>班次 ：</span>";
        for (var i = 0; i < this.shifts.length; i++) {
            var item = this.shifts[i]; pickLeaveType
            //html += "<input type='button' id='" + item.Id + "' name='btnWorkShift' value='" + item.Name + "' class=\"btnShift\"  onclick=\"selectAttendType(this,'" + item.Id + "');\" />&nbsp;";
            html += " <button id=\"leavetype_" + item.Id + "\" leavetype=\"" + item.Id + "\"  title='" + item.Name + "' onclick=\"pickLeaveType('" + item.Id + "');\" num='" + i + "'>" + item.Name + "</button>";
        }
        html += "<button class=\"clearchook\" id='leavetype_00' leavetype=\"\"  onclick=\"clearSelectLeaveType()\">清除排班</button>";
        html += "<button class=\"copyShift\" id='leavetype_01' leavetype=\"\"  onclick=\"copyShift()\">复制排班</button>";
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
        var data = d.listData;
        var html = "<table class=\"mytable\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
        html += "<thead><tr class=\"\">";
        //html += "<td style=\"width: 40px\"></td>";
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

        //html += "<th>工作<div>天数</div></th>";
        //html += "<th>工作<div>时长</div></th>";
        //html += "<th>休息<div>天数</div></th>";

        html += "</tr></thead>";

        var colSpan1 = (days + 4);
        html += "<tbody style=\"height:50px;overflow:auto;font-size: 12px;\">";
        //debugger;

        for (var i = 0; i < data.length; i++) {
            var emp = data[i];
            var html2 = "";

            //html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + (i+1) + "</td>";
            html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + emp.Name + "</td>";
            html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";
            var attendData = emp.AttendData;
            for (var h = 0; h < days; h++) {
                //var day1 = d.Days[j];

                var row = attendData[h];
                if (row == null)
                    continue;
                var cellTitle = emp.Name + " " + row.AttendDate;
                var cellId = "c_" + emp.EmployeeId + "_" + row.AttendDate;
                //var memoTxtId = "memo_" + emp.EmployeeId + "_" + row.AttendDate;
                html2 += "<td  id=\"" + cellId + "\" title=\"" + cellTitle + "\"";

                html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' >";
                //console.log("totaldays:" + totalDays);

                for (var j = 0; j < row.Shifts.length; j++) {
                    var shift = row.Shifts[j];
                    //white-space:nowrap;
                    tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;margin:3px;" + shift.CssStyle + "'";
                    tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "' >";
                    if (this.showSymbol) {
                        tempCell += shift.Symbol;
                    }
                    else
                        tempCell += shift.WorkShiftIdName;

                    tempCell += "</div>";
                    html2 += tempCell;
                }

                html2 += "</td>";
            }
            $(".table1 tr").eq(i + 1).append(html2);
            $(".table1-flex tr").eq(i + 1).append(html2);

            //print mode display stat
            //html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AbsentDays + "</td>";
            // html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AttendDays + "</td>";
            //html2 += "<td class=\"\" style=\"text-align:center;vertical-align:middle;\">" + emp.AttendDays + "</td>";
            // html2 += "<td class=\"\" ></td>";
            // html2 += "<td class=\"\" ></td>";
        }


        //if (d.Description)
        //    $("#description1").html(d.Description);
        //if (d.LeaveMessage)
        //    $("#leaveMessage1").html(d.LeaveMessage);
    }
    attendanceEditor.prototype.renderMonthCalendar = function (d) {
        //debugger;
        if (this.viewMode == 1) {
            this.renderMonthViewCalendar(d);
            return;
        }
        var html = "";
        var days = d.ListData.length;

        for (var j = 0; j < d.ListData.length; j++) {
            var day = d.ListData[j];
            var yday = "<div> " + day.Name + "</div>";
            var wDay = day.DayofWeek;
            //var 
            wDay = wDay * 1;
            if ((wDay == 6 || wDay == 0 || day.IsHoliday) && !day.IsWorkDay) {

                html += "<th class='red-th' ><div>" + this.toWeekName(wDay) + "</div><div>" + yday + "</div></th>";
            }
            else {
                html += "<th class='' ><div>" + this.toWeekName(wDay) + "</div><div>" + yday + "</div></th>";
            }
        }
        $(".table1-tr1 th").remove()
        $(".table1-tr1").append(html);
        $(".table1-tr1-flex th").remove()
        $(".table1-tr1-flex").append(html);
        //endheader

        var colSpan1 = (days + 4);



    }

    attendanceEditor.prototype.rendertable = function () {
        var prea = this.para
        var node = $('#LeftTree').tree('getSelected')
        if (node.isleft) {
            //prea += "&DeptId=" + node.id
            return
        } else {
            //prea += "&GroupId=" + node.id
            prea += "&unitId=" + node.id
            //prea += "&BusinessUnitId=" + node.id
        }
        if ($('#name').val()) {
            prea += "&name=" + $('#name').val()
        }
        if ($('#WorkShiftName').val()) {
            prea += "&WorkShiftName=" + $('#WorkShiftName').val()
        }
        prea += '&searchMode=1';
        prea += '&unitType=10';
        var that = this
        this.loadData("workshift.dept.employee.search", prea, function (data) {
            $('#TotalPageNumber span').html(Math.ceil((data.listData.length) / window.pagesize))
            that.renderFixColumns(data);
            if (data.CloseStatusCode == 1 || data.closePeriod)//如果封存
            {
                showButtons(0);
            } else {
                if (data.ReportStatus == 0) {
                    showButtons(1);
                    jQuery("#btnSaveBatch").html("提交排班");
                    jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(1)");
                    jQuery("#btnSaveBatch").show();
                    //hover1()
                }
                else if (data.ReportStatus == 1) {
                    showButtons(0);
                    if (data.CloseStatusCode != 1) {
                        jQuery("#btnSaveBatch").html("撤销提交");
                        jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(0)");
                        jQuery("#btnSaveBatch").show();
                        //jQuery('.qingjia1').off("mousedown");
                    }
                }
                //hover2()
                if (data.ReportStatusName) {
                    document.getElementById("attendStatusName").innerHTML = data.ReportStatusName;
                }
            }

            document.getElementById("unitId").value = data.UnitId;//设置当前组/部门
            //if (data.Description)
            document.getElementById("description").value = data.Description || '';//设置当前组/部门
            //else
            //   document.getElementById("description").value = "";

            //if (data.LeaveMessage)
            document.getElementById("LeaveMessage").value = data.LeaveMessage || '';//设置当前组/部门
            //else
            //   document.getElementById("LeaveMessage").value = "";
        });
    }
    attendanceEditor.prototype.renderFixColumns = function (d) {
        var data = d.listData;
        //data.sort(function (a,b) {
        //    return a.sortNumber - b.sortNumber
        //});
        var html2 = "";
        var html = " <table class=\"table4\">";
        var isEditable = true;

        var UnitId = d.UnitId
        //debugger;
        if (this.viewMode == 1 || d.ReportStatus == "1") {
            isEditable = false;
        }
        var groups = [{
            GroupId: '',
            GroupName: '未分组',
            data: []
        }]
        for (var i = 0; i < data.length; i++) {
            var emp = data[i];
            var key = true
            for (var j = 0; j < groups.length; j++) {
                if (emp.GroupId == groups[j].GroupId) {
                    key = false
                    groups[j].data.push(emp)
                    break;
                }
            }
            if (key == true) {
                groups.push({
                    GroupId: emp.GroupId,
                    GroupName: emp.GroupName,
                    data: []
                })
                groups[groups.length - 1].data.push(emp)
            }
        }
        var index = 0
        var sortNumber = 1;
        for (var j = 0; j < groups.length; j++) {
            for (var i = 0; i < groups[j].data.length; i++) {
                var emp = groups[j].data[i];
                index++
                var cellId = "chkemp_" + emp.EmployeeId;
                if ((i % 2) == 0) {
                    html2 += "<tr>";
                }
                else {
                    html2 += "<tr empid='" + emp.EmployeeId + "' sortNumber='" + sortNumber + "' class=\"trcolo\">";
                }
                sortNumber += 1;
                html2 += "<td class='flextd' style=\"width: 40px\">" + index + "</td>";
                //html2 += "<td style=\"width: 40px\" class='btnimg'>"
                //    + "<div class='removegroup' onclick=\"deletegrouppeople('" + groups[j].GroupId + "','" + emp.EmployeeId + "','" + UnitId + "')\"><img src='/img/images/02.1.2.1.Subtract_.png'/></div>"
                //    + "<div class='removegroup' onclick=\"upgrouppeople('" + groups[j].GroupId + "','" + emp.EmployeeId + "','" + UnitId + "',this)\"><img src='/img/images/Ascending2.png'/></div>"
                //    + "<div class='removegroup' onclick=\"downgrouppeople('" + groups[j].GroupId + "','" + emp.EmployeeId + "','" + UnitId + "',this)\"><img src='/img/images/Descending2.png'/></div>"
                //    + "</td>";

                //html2 += "<td style=\"width: 40px\" class=\"checktd\">";
                //html2 += "<p class=\"inputcheck\">";
                ////html2 += " <img src=\"/img/add/23.check_1(14x14).png\">";
                //html2 += "<input groupid='" + groups[j].GroupId + "' type=\"checkbox\" title=\"选择 " + emp.Name + "\" name=\"empid\" value=\"" + emp.EmployeeId + "\" id=\"" + cellId + "\" data-name=\"" + emp.Name + "\">";
                //html2 += "  </p>";
                //html2 += "</td>";

                //html2 += "<td nowrap=\"nowrap\">" + emp.DeptName+"</td>";
                html2 += "<td class=\"nameCol1\" nowrap='nowrap' style=\"vertical-align:middle;\">" + emp.Name + "</td>";
                html2 += "<td class=\"nameCol1\" style=\"vertical-align:middle;\">" + emp.EmployeeNo + "</td>";

                var empInDate = "";
                if (emp.InDate)
                    empInDate = emp.InDate;
                var attendData = emp.AttendData
                for (var h = 0; h < attendData.length; h++) {
                    //var day1 = d.Days[j];

                    var row = attendData[h];
                    if (row == null)
                        continue;

                    var cellTitle = emp.Name + " " + row.AttendDate;
                    var cellId = "c_" + emp.EmployeeId + "_" + row.AttendDate;
                    //var memoTxtId = "memo_" + emp.EmployeeId + "_" + row.AttendDate;
                    html2 += "<td  id=\"" + cellId + "\" title=\"" + cellTitle + "\"";

                    if (this.viewMode == 1) {

                        var totalDays = 0;
                        for (var j = 0; j < row.LeaveDetail.length; j++) {
                            var leaveInfo = row.LeaveDetail[j];
                            totalDays += (leaveInfo.LeaveDays * 1);
                        }
                        //console.log("totaldays:" + totalDays);
                        var shiftName = "工作";
                        if (row.ShiftName) {
                            if (row.ShiftName != "") {
                                shiftName = row.ShiftName;
                                if (totalDays < 1)
                                    html2 += "<div style='cursor:pointer;color:grey;' title=\"" + cellTitle + "\" id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_s'> " + shiftName + " </div>";
                            }
                        }

                        for (var j = 0; j < row.Shifts.length; j++) {
                            var leaveInfo = row.Shifts[j];
                            tempCell = "<div style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;BACKGROUND:#6ce26c;color:red;'";
                            tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + leaveInfo.LeaveTypeCode + "' data-status='" + leaveInfo.LeaveTypeCode + "'>" + leaveInfo.LeaveTypeName + "(" + leaveInfo.LeaveDays + ")</div>";
                            html2 += tempCell;
                        }

                        html2 += "</td>";

                    }
                    else {

                        var shiftName = "/";
                        html2 += " style='vertical-align:middle;cursor:pointer;text-align:center;' "; //end TD

                        if (isEditable)
                            html2 += " onclick=\"setEmpWorkStatus('" + emp.EmployeeId + "','" + row.AttendDate + "','0','c_" + emp.EmployeeId + "_" + row.AttendDate + "','" + UnitId + "','" + emp.GroupId + "',this)\"  ";

                        html2 += ">";
                        html2 += "<span class=\"spancolo1\">";
                        html2 += "</span>";
                        for (var k = 0; k < row.Shifts.length; k++) {
                            //0 工作 1 请假 2休息
                            //debugger;white-space:nowrap;
                            var shift = row.Shifts[k];

                            var style = "";
                            if (shift.Color != '') {
                                //style = "background-color:" + shift.CssStyle;
                                style += 'color:' + shift.Color + ';'
                            }
                            if (shift.BgColor != '') {
                                //style = "background-color:" + shift.CssStyle;
                                style += 'background-color:' + shift.BgColor + ';'
                            }
                            if (style == "") {
                                style = "background-color:#f0fbf8;";//#f0fbf8
                            }
                            var canEdit = shift.canEdit
                            var BusinessUnitIdName = shift.BusinessUnitIdName ? shift.BusinessUnitIdName : '';
                            var CreatedByName = shift.CreatedByName ? shift.CreatedByName : '';
                            var GroupIdName = shift.GroupIdName ? shift.GroupIdName : '';
                            var CheckTimes = shift.CheckTimes;
                            var WorkHours = shift.WorkHours ? shift.WorkHours : shift.ShiftHours;
                            var Name = shift.Name;
                            var StartTime1 = shift.StartTime1 ? shift.StartTime1 : '';
                            var StartTime2 = shift.StartTime2 ? shift.StartTime2 : '';
                            var StartTime3 = shift.StartTime3 ? shift.StartTime3 : '';
                            var EndTime1 = shift.EndTime1 ? shift.EndTime1 : '';
                            var EndTime2 = shift.EndTime2 ? shift.EndTime2 : '';
                            var EndTime3 = shift.EndTime3 ? shift.EndTime3 : '';
                            var ShiftHours = shift.ShiftHours || '';
                            var Description = shift.Description || '';
                            var PostCategory = shift.PostCategory || '';
                            var WorkShiftIdName = shift.WorkShiftIdName || '';
                            if (canEdit == false) {
                                tempCell = "<div title='报送部门/组：" + BusinessUnitIdName + (BusinessUnitIdName && GroupIdName ? "/" : '') + GroupIdName + "，报送人：" + CreatedByName + "。班次名称：" + Name + "，上下班次数：" + CheckTimes + "，应出勤时长：" + WorkHours + "，第一次上班：" + StartTime1 + "，第一次下班：" + EndTime1 + (CheckTimes == 2 ? "，第二次上班：" + StartTime2 : '') + (CheckTimes == 2 ? "，第二次下班：" + EndTime2 : '') + (CheckTimes == 3 ? "，第三次上班：" + StartTime3 : '') + (CheckTimes == 3 ? "，第三次下班：" + EndTime3 : '') + "。' class=\"qingjia1 cannotEdit\" style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;margin:3px;" + style + "'";;
                            } else {
                                tempCell = "<div title='报送部门/组：" + BusinessUnitIdName + (BusinessUnitIdName && GroupIdName ? "/" : '') + GroupIdName + "，报送人：" + CreatedByName + "。班次名称：" + Name + "，上下班次数：" + CheckTimes + "，应出勤时长：" + WorkHours + "，第一次上班：" + StartTime1 + "，第一次下班：" + EndTime1 + (CheckTimes == 2 ? "，第二次上班：" + StartTime2 : '') + (CheckTimes == 2 ? "，第二次下班：" + EndTime2 : '') + (CheckTimes == 3 ? "，第三次上班：" + StartTime3 : '') + (CheckTimes == 3 ? "，第三次下班：" + EndTime3 : '') + "。' class=\"qingjia1\" style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;margin:3px;" + style + "'";
                                if (isEditable)
                                    tempCell += " onclick=\"delAttendEmpDay(this,'" + shift.EmpWorkShiftId + "','" + cellId + "','" + emp.EmployeeId + "','" + row.AttendDate + "','" + UnitId + "')\"";
                            }
                            tempCell += " id='c_" + emp.EmployeeId + "_" + row.AttendDate + "_" + shift.EmpWorkShiftId + "' data-status='{2}' EmpWorkshiftId='" + shift.EmpWorkShiftId + "' WorkShiftId='" + shift.WorkShiftId + "' ShiftMethodCode='" + shift.ShiftMethodCode + "' Name='" + Name + "' ShiftHours='" + ShiftHours + "' Description='" + Description + "' PostCategory='" + PostCategory + "' WorkShiftIdName='" + WorkShiftIdName + "'>" + Name + "<br />" + Description + "</div>";

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
        }

        $(".table1 tr").not($(".table1 tr").eq(0)).remove()
        $(".table1 tbody").append(html2);

        $(".table1-flex tr").not($(".table1-flex tr").eq(0)).remove()
        $(".table1-flex tbody").append(html2);
        $('.table1-flex input[type="checkbox"]').not('#checkall').remove()

        $(".table1-flex tr").find('td').each(function () {
            $(this).attr('id', $(this).attr('id') + 'copy')
        })

        //$('.table1-tr1-flex .red-th').each(function () {
        //    var index = $(this).index()
        //    $('td:nth-child(' + index + ')').each(function () {
        //        if ($(this).parents('.grouprow').length != 0) {
        //            $(this).next().css('backgroundColor', '#ededed')
        //        } else {
        //            $(this).css('backgroundColor', '#ededed')
        //        }
        //    })
        //})


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
    attendanceEditor.prototype.loadDesigner = function (para) {
        var self = this;
        function formatDate(date) {
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            if (month < 10) {
                month = '0' + month
            }
            if (day < 10) {
                day = '0' + day
            }
            return (year + '-' + month + '-' + day)
        }
        function getThisMonth() {
            var date = self.year ? new Date(self.year + '-' + self.month + '-01') : new Date();
            var year = date.getFullYear();
            var month = date.getMonth();
            var thisMonthStartDate = formatDate(new Date(year, month, 1))
            var thisMonthEndDate = formatDate(new Date(year, month + 1, 0))
            var thisMonth = []
            thisMonth.push(thisMonthStartDate, thisMonthEndDate)
            return thisMonth
        }
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var thisMonth = getThisMonth();
        self.para = "md2=" + (self.weekNumber || 0);
        self.para += "&md0=" + (self.year || year);
        self.para += "&md1=" + (self.month || month);
        self.para += "&calendar=" + self.calendar;
        self.para += "&viewMode=" + self.viewMode;
        self.para += "&startDate=" + thisMonth[0];
        self.para += "&endDate=" + thisMonth[1];
        self.startDate = thisMonth[0];
        self.endDate = thisMonth[1];
        this.loadData("workshift.search.header.get", self.para, function (data) {

            var html = "";
            if (!data) return;
            //debugger;

            if (self.searchMode) {
                document.getElementById("calendarHeader").innerHTML = data.Year + '年' + data.MonthNumber + '月（' + data.StartDate + " 至 " + data.EndDate + "）&nbsp;&nbsp;" + data.UnitName + "&nbsp;&nbsp;人员考勤表";
            }
            else {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate + "&nbsp;&nbsp;" + data.UnitName + " 人员排班表";
            }
            if (data.GroupReportStatusName) {
                document.getElementById("attendStatusName").innerHTML = data.GroupReportStatusName;
            }
            //debugger;
            if (self.viewMode == 2) //编辑模式
            {
                document.getElementById("calendarHeader").innerHTML = data.StartDate + " 至 " + data.EndDate;
                //self.renderShiftBar(data);
            }
            document.getElementById("unitId").value = data.UnitId;//设置当前组/部门
            self.unitId = data.UnitId;
            self.reportStatus = data.GroupReportStatus;//上报状态
            self.closeStatus = data.GroupReportStatus;//封存状态

            jQuery("#unitName").val(data.UnitName);

            //self.renderGroupBar(data.Units, data.UnitId);
            self.renderGrid(data);

            //debugger;
            var unitId = $('#groupBar .active').attr('deptid');
            var deptId = data.UnitId;
            var yNumber = document.getElementById("yearNumber").value;
            var mNumber = document.getElementById("monthNumber").value;

            if (!copyData.copyStartDate && !$('#LeftTree').tree('getSelected')) {
                self.loadtree()
            }
            else {
                self.rendertable()
            }
            //if (!copyData.Name&& !$('#LeftTree').tree('getSelected')) {
            //    self.loadtree(data.Units)
            //}

            //self.rendertable()
        });
    }

    attendanceEditor.prototype.loadtree = function (Units) {
        var self = this;
        var para = '';
        para += "&year=" + document.getElementById("yearNumber").value;
        para += "&month=" + document.getElementById("monthNumber").value;
        if ($('#LeftTreeSearch').val()) {
            para += "&deptName=" + $('#LeftTreeSearch').val()
        }
        ajaxMethodGetData('attendance.businessunit.search' + para, null, function (data0) {
            var Units = data0.ListData;
            var data = [];
            //console.log(Units)
            for (var i = 0; i < Units.length; i++) {
                data.push({
                    children: [],
                    TextName: Units[i].CategoryCodeName,
                    text: Units[i].CategoryCodeName,
                    id: Units[i].CategoryCode,
                    isleft: true
                })
                if (Units[i].BusinessUnits) {
                    for (var j = 0; j < Units[i].BusinessUnits.length; j++) {
                        data[i].children.push({
                            children: [],
                            TextName: Units[i].BusinessUnits[j].Name,
                            text: Units[i].BusinessUnits[j].Name + (Units[i].BusinessUnits[j].ShiftStatusName ? (Units[i].BusinessUnits[j].ShiftStatus == '1' ? '<span class="deptzhuangtai" style="color:#108af9;">（' + Units[i].BusinessUnits[j].ShiftStatusName + '）</span>' : '<span class="deptzhuangtai">（' + Units[i].BusinessUnits[j].ShiftStatusName + '）</span>') : '<span class="deptzhuangtai"></span>'),
                            id: Units[i].BusinessUnits[j].BusinessUnitId,
                            isleft: false,
                            ParentId: Units[i].CategoryCode,
                            ParentIdName: Units[i].CategoryCodeName
                        })
                    }
                }
            }
            //console.log(data)
            $('#LeftTree').tree({
                data: data,
                onLoadSuccess: function (node, data) {
                },
                onSelect: function (rowIndex, rowData) {
                    self.rendertable()
                    copyData = {}
                }
            })
            setTimeout(function () {
                if (!$('#LeftTree').tree('getSelected') && data[0].children[0]) {
                    var node = $('#LeftTree').tree('find', data[0].children[0].id);
                    $('#LeftTree').tree('select', node.target);
                }
            }, 200)
        })
    }
}