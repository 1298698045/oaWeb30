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
            var date = self.year ? new Date(self.year + '-' + self.month+'-01') : new Date();
            var year = date.getFullYear();
            var month = date.getMonth();
            var thisMonthStartDate = formatDate(new Date(year,month,1))
            var thisMonthEndDate = formatDate(new Date(year,month+1,0)) 
            var thisMonth = []
            thisMonth.push(thisMonthStartDate,thisMonthEndDate)
            return thisMonth
        }
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var thisMonth = getThisMonth();
        self.para = "md2=" + (self.weekNumber || 0);
        self.para += "&md0=" + (self.year||year);
        self.para += "&md1=" + (self.month||month);
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
        para += "&md0=" + document.getElementById("yearNumber").value;
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
        para += "&md0=" + document.getElementById("yearNumber").value;
        para += "&md1=" + this.month;
        para += "&calendar=" + this.calendar;
        this.loadDesigner(para);
        //this.weekNumber++;
    }
    attendanceEditor.prototype.refresh = function () {

        var para = "md2=" + this.weekNumber;
        para += "&md0=" + document.getElementById("yearNumber").value;
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
        var url = "/apps/HrProcessor.ashx?cmd=attendance.clear&objectTypeCode=30041&startDate=" + startDate + "&endDate=" + endDate + "&groupIds=" + groupIds;
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
        this.month = $('#monthNumber').val()
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
        //error3(para);
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
        para += "&startDate=" + this.startDate;
        para += "&endDate=" + this.endDate;
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
    attendanceEditor.prototype.resizeDesigner = function () {
        $(document).ready(function () {
            //var height = $(window).height() - 185 - $('#attendSettings').height();
            //if (window.isFullScreen) {
            //    height = $(window).height() -85 - $('#attendSettings').height();
            //}
            var height = $(window).height() - $('#attendSettings').height() - $('.attendance-head').height() - 18;
            if (window.isFullScreen) {
                height = $(window).height() - $('#attendSettings').height() - $('.attendance-head').height() - 40;
            }
            if ($('#attendSettings').css('display') == 'none') {
                height = height + 20
            }
            $('#table-content').css('height', height + 'px');
            $("#treePanel").height(height - 5 + 'px');
            $('#table-content').width($('#attendance').width() - 200);
            //$('.attendance-body-table-flex').width($('#attendance').width() - 17 - 200);
            $('#table-content-flex').width($('#attendance').width() - 17 - 200);
        })
        //hover1()
        //hover2()
    }
}
//浮层
var hoverindex = 0;
function hover1() {
    $(".qingjia1").bind("contextmenu", function () {
        return false;
    })
    $('.qingjia1').mousedown(function (e) {
        if (e.which != 3) {
            return;
        }
        var ShiftMethodCode1 = '';
        var ShiftMethodCode2 = $(this).attr('ShiftMethodCode');
        var data = window.AttendTypesData;
        if (data && data.length) {
            for (i = 0; i < data.length; i++) {
                if (data[i].WorkShiftId == $(this).attr('WorkshiftId')) {
                    ShiftMethodCode1 = data[i].ShiftMethodCode
                }
            }
        }
        if (hoverindex != 1 && (ShiftMethodCode1 == '3' || ShiftMethodCode1 == 3 || ShiftMethodCode2 == 3 || ShiftMethodCode2 == '3')) {
            hoverindex = 0;
            $('.shift-hover1').show();
            $('.card-hover-point1').show();
            var top = $(this).offset().top - 117 - 7;
            var top2 = $(this).offset().top;
            var left = $(this).offset().left + $(this).width() - 5 - 7;
            if (window.isFullScreen) {
                top = $(this).offset().top - 17 - 7;
            }
            $('.card-hover-point1').css({
                top: top + 10,
                left: left - 2
            });

            if (top + 300 > $(window).height()) {
                top = $(window).height() - 300;
                if (window.isFullScreen) {
                    top = $(this).offset().top - 170;
                }
            }

            if (left + 270 > $(window).width() - 300) {
                left = left - 270 - $(this).width() - 10 + 10;
                $('.card-hover-point1').css({
                    left: left + 252
                });
            }

            if (left < 0) {
                left = 375;
                top -= 50;
                $('.card-hover-point1').css({
                    top: top + 60,
                    left: left - 26
                });
            }

            $('.shift-hover1').show().css({
                top: top,
                left: left
            });
            var that = this
            $('#hoversave').attr('EmpWorkshiftId', $(that).attr('EmpWorkshiftId'));
            $('#hoversave').attr('WorkShiftIdName', $(that).attr('WorkShiftIdName'));
            $('#Name').val($(that).attr('Name'));
            $('#ShiftHours').val($(that).attr('ShiftHours'));
            if ($(that).attr('ShiftHours') != 0) {
                $('#ShiftHours').attr('disabled', true)
            }
            else {
                $('#ShiftHours').attr('disabled', false)
            }
            $('#Description').val($(that).attr('Description'));
            $('#PostCategory').val($(that).attr('PostCategory'));

        }
    })
    //    .mouseleave(function (e) {
    //    //console.log(e)
    //    var dom = ''
    //    if (e.toElement) {
    //        dom = e.toElement
    //    } else if (e.relatedTarget) {
    //        dom = e.relatedTarget
    //    }
    //    if (!$(dom).hasClass('card-hover-point1') && !$(dom).hasClass('shift-hover1')) {
    //        $('.shift-hover1').hide()
    //        $('.card-hover-point1').hide()
    //    }
    //    hoverindex = 2;
    //});
    $(document).mousemove(function () {
        hoverindex = 0;
    });
    //$('.shift-hover1').mouseleave(function () {
    //    $('.shift-hover1').hide()
    //    $('.card-hover-point1').hide()
    //})
    $('.shift-hover1 select').change(function () {
        $('.shift-hover1').off("mouseleave");
        $('.qingjia1').off("mousedown");
        $('.qingjia1').off("mouseleave");
    })
    $('.shift-hover1 #hoversave').off("click");
    $('.shift-hover1 #hoversave').click(function (e) {
        $('.card-hover-point1').hide();
        $('.shift-hover1').hide();
        hover1();
        var that = this;
        if (hoverindex == 0) {
            hoverindex = 1;
        }
        function callback(data) {
            if (data.status == 1) {
                refreshDesinger();
                success2('保存成功')
                return false;
            } else {
                error3('保存失败')
            }
        }
        var id = $(that).attr('EmpWorkshiftId')
        var messages = {
            params: {
                recordRep: {
                    objTypeCode: 30043,
                    fields: {
                        Name: $('#Name').val(),
                        ShiftHours: $('#ShiftHours').val(),
                        Description: $('#Description').val(),
                        PostCategory: $('#PostCategory').val(),
                    }
                }
            }
        }
        if (id != null) {
            messages.params.recordRep.id = id
        }
        messages = JSON.stringify(messages)
        var data = { message: messages };
        ajaxMethodPostData('entity.saverecord', data, callback)
        return false;
    });
    $('.shift-hover1 #hovercancel').click(function (e) {
        $('.card-hover-point1').hide();
        $('.shift-hover1').hide();
        hover1();
        if (hoverindex == 0) {
            hoverindex = 1;
        }

        return false;
    });
    //$('#ShiftHours').html('');
    //for (i = 1; i <= 24; i++) {
    //    $('#ShiftHours').append('<option value ="' + i + '">' + i + 'h</option>');
    //}
}
function shiftChange() {
    $('#Name').val($('#hoversave').attr('WorkShiftIdName').replace(/\(.*?\)/g, '') + '(' + $('#PostCategory').val() + ')')
}
function hover2() {
    $('#shiftBar button').not('.clearchook').not('.copyShift').mouseenter(function (e) {
        if (hoverindex != 1) {
            hoverindex = 0;
            $('.shift-hover2').show();
            $('.card-hover-point2').show();
            var top = $(this).offset().top - 120;
            var left = $(this).offset().left + $(this).width() - 30;

            if (window.isFullScreen) {
                top = $(this).offset().top + 30;
            }

            $('.card-hover-point2').css({
                top: top - 15,
                left: left + 10
            });

            if (top + 20 > $(window).height()) {
                //top = $(window).height() - 220;
            }

            if (left + 360 > $(window).width() - 360) {
                left = left - 300 - $(this).width();
                $('.card-hover-point2').css({
                    left: left + 325
                });
            }

            if (left < 0) {
                left = 360;
                top -= 50;
                $('.card-hover-point2').css({
                    top: top + 60,
                    left: left - 26
                });
            }
            if (window.isFullScreen) {
                top = $(this).offset().top + 182;
            }
            $('.shift-hover2').show().css({
                top: top - 210 + 46,
                left: left
            });

            var data = window.AttendTypesData
            if (data && data.length) {
                for (i = 0; i < data.length; i++) {
                    if (data[i].Id == $(this).attr('leavetype')) {
                        $('#ShiftName').html(data[i].Name);
                        $('#CheckTimes').html(data[i].CheckTimes);
                        $('#WorkHours').html(data[i].WorkHours ? data[i].WorkHours + '小时' : '');
                        $('#StartTime1').html(data[i].StartTime1);
                        $('#EndTime1').html(data[i].EndTime1);
                        $('#StartTime2').html(data[i].StartTime2);
                        $('#EndTime2').html(data[i].EndTime2);
                        $('#StartTime3').html(data[i].StartTime3);
                        $('#EndTime3').html(data[i].EndTime3);
                    }
                }
            }

            //var d = {
            //    Id: $(this).attr('leavetype'),
            //    ObjTypeCode: 30040
            //}
            //ajaxMethodGetData('entity.detail.get', d, function (data) {
            //    if (data && data.record) {
            //        var selects = data.context.picklistValuesMap
            //        $('#ShiftName').html(data.record.Name);
            //        $('#ShiftMethodCode').html(selects.ShiftMethodCode[data.record.ShiftMethodCode].label);
            //        $('#WorkShiftIdNameCode').html(selects.WorkShiftIdNameCode[data.record.WorkShiftIdNameCode].label);
            //        $('#CheckTimes').html(data.record.CheckTimes);
            //        $('#WorkHours').html(data.record.WorkHours?data.record.WorkHours+'小时':'');
            //        $('#TotalDays').html(data.record.TotalDays?data.record.TotalDays+'天':'');
            //        $('#PostCategory').html(selects.PostCategory[data.record.PostCategory].label);
            //        $('#NightTypeCode').html(selects.NightTypeCode[data.record.NightTypeCode].label);
            //        $('#Description2').html(data.record.Description);
            //    }
            //})
        }
    }).mouseleave(function (e) {
        //console.log(e)
        var dom = ''
        if (e.toElement) {
            dom = e.toElement
        } else if (e.relatedTarget) {
            dom = e.relatedTarget
        }
        if (!$(dom).hasClass('card-hover-point2') && !$(dom).hasClass('shift-hover2')) {
            $('.shift-hover2').hide()
            $('.card-hover-point2').hide()
        }
        hoverindex = 2;
    });
    $(document).mousemove(function () {
        hoverindex = 0;
    });
    $('.shift-hover2').mouseleave(function () {
        $('.shift-hover2').hide()
        $('.card-hover-point2').hide()
    })
    $('.shift-hover2 .close').click(function (e) {
        $('.card-hover-point2').hide();
        $('.shift-hover2').hide();

        if (hoverindex == 0) {
            hoverindex = 1;
        }
        return false;
    });
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
    copyData = {}
    $('.qingjia1').removeClass('copysel');
    document.getElementById("selWorkShift").value = "";
}
/*
考勤类型选择
*/
function pickLeaveType(t) {
    $("#attendance .jiaqi-type button").removeClass("active")
    // $(this).addClass("active")leavetype_1
    $("#leavetype_" + t).addClass("active");
    copyData = {}
    $('.qingjia1').removeClass('copysel');
    $('td').removeClass('copysel');
    document.getElementById("selWorkShift").value = t;
}
function clearSelectLeaveType() {
    $("#attendance .jiaqi-type button").removeClass("active")
    $("#leavetype_00").addClass("active");
    copyData = {}
    $('.qingjia1').removeClass('copysel');
    $('td').removeClass('copysel');
    document.getElementById("selWorkShift").value = "delete";
}
function copyShift() {
    copyData = {}
    $("#attendance .jiaqi-type button").removeClass("active")
    $("#leavetype_01").addClass("active");
    document.getElementById("selWorkShift").value = "copy";
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
/*
刷新查询
*/
function refreshDesinger() {
    var index = $("#shiftBar button.active").attr('num')
    searchMonthEmpAttendances();
    if (index != 'undefined' && index != undefined) {
        $('#shiftBar button').removeClass("active");
        $('#shiftBar button').eq(index).addClass("active");
    }
    //if (copyData.Name) {
    //    $('#shiftBar button').removeClass("active");
    //    $("#leavetype_01").addClass("active");
    //    $("#" + copyData.Id + ".qingjia1").addClass("copysel");

    //}
    //if (copyData.copyStartDate) {
    //    $('#shiftBar button').removeClass("active");
    //    $("#leavetype_01").addClass("active");
    //    //$("#" + copyData.Id + ".qingjia1").addClass("copysel");

    //}
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
            error3("请选择部门或者输入姓名");
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
function printShiftCalendar() {
    //editor.nextWeek();
    var showm = "0";
    // var url = "/_ui/hr/attend/empshift/print?md0=" + editor.year + "&md1=" + editor.month + "&objectTypeCode=10&unitType=10&unitId=" + editor.unitId + "&md2=" + editor.weekNumber + "&calendar=" + editor.calendar + "&showMemo=" + showm;
    var url = "/06e/x?DeptId_lkid=" + editor.unitId + "&md0=" + editor.year + "&md1=" + editor.month;
    printWin(url);
}

function printAttenanceCalendar() {
    var unitId = "";
    var showm = "0";
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var symbol = "";
    var node = $('#LeftTree').tree('getSelected')
    if (node.isleft) {
        return;
    } else {
        unitId = node.id;
    }
    var url = "/attd/shifts/prtDeptShiftDetail.aspx?unitType=10&unitId=" + unitId + "&md0=" + attendYear + "&md1=" + attendMonth;
    var ele = document.getElementById("chkShowShiftSymbol");
    if (ele) {
        if (ele.checked)
            url += "&symbol=1";
    }
    //window.open(url, "打印部门排班", 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes;');
    printWin(url);
}
function getSelectDeptId() {
    //var node = $('#LeftTree').tree('getSelected')
    //if (node.isleft) {
    //    prea += "&DeptId=" + node.id
    //} else {
    //    prea += "&GroupId=" + node.id
    //}
    var deptId = jQuery("#unitId").val();
    return deptId;
}

//设置考勤
function setEmpWorkStatus(empId, day, oldStatus, eleID, deptId, groupId, obj) {
    return;
    var businessUnitId = jQuery("#unitId").val();
    var workshiftId = document.getElementById("selWorkShift").value;
    if (workshiftId == "") {
        error3("请选择需要添加的 “ 班次”！");
        return;
    }
    if (workshiftId == "delete") {
        error3("请选择需要删除的班次！");
        return;
    }
    if (workshiftId == "copy") {
        //if (copyData.Name) {
        //    copyEmployeeDayAttendance(empId, day, workshiftId, businessUnitId, businessUnitId, eleID, refreshAttendCell, deptId, groupId);
        //    changedStatus = true;
        //}
        //else {
        //    error3("请选择需要复制的班次！");
        //}
        if (copyData.copyStartDate) {
            if ($(obj).hasClass('copysel')) {
                return;
            }
            copyEmployeeDayAttendance2(empId, day, workshiftId, businessUnitId, businessUnitId, eleID, refreshAttendCell, deptId, groupId);
            changedStatus = true;
        }
        else {
            if (!$(obj).find('.qingjia1').length) {
                error("请选择需要复制的班次！");
                return;
            }
            copyData = {
                copyStartDate: day,
                copyEndDate: day,
                startDate: day,
                endDate: day,
                objectTypeCode: 10,
                unitId: deptId,
                cloneEmployeeId: empId,
                employeeIds: empId,
                isOverride: true,
                type: 1,

                BusinessUnitId: deptId,
                Day: day,
                ElementId: eleID,
                EmployeeId: empId,
                GroupId: groupId
            }
            //console.log(copyData)
            $(obj).addClass('copysel');
        }
        return;
    }
    //var leaveDays = document.getElementById("leaveDay").value;
    //debugger;
    //var oldStatus = jQuery("#" + eleID).attr("data-status");




    reportEmployeeDayAttendance(empId, day, workshiftId, businessUnitId, businessUnitId, eleID, refreshAttendCell, deptId, groupId);
    //reportEmployeeDayAttendance(empId, day, workshiftId, businessUnitId, businessUnitId, eleID, refreshDesinger, deptId, groupId);
    changedStatus = true;
}
/*
设置某一个人一天考勤
empId           姓名ID
day,            日期
oldStatus,      旧状态
newStatus,      新状态
unitId          组ID
businessUnitId  组对应的部门ID
eleID,          当前元素
callBack        回调函数
*/
function reportEmployeeDayAttendance(empId, day, workshiftId, unitId, businessUnitId, eleID, callBack, deptId, groupId) {
    var elementId = eleID;
    var url = "/apps/HrProcessor.ashx?cmd=workshift.month.deptgroup.employee.arranage";
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: {
            employeeId: empId,
            day: day,
            workshiftId: workshiftId,
            deptId: deptId,
            groupId: groupId,
            description: "",
            elementId: eleID
        },
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            if (callBack) {
                callBack(data, elementId);
            }
        },
        type: "GET",
        url: url
    });
}
function copyEmployeeDayAttendance(empId, day, workshiftId, unitId, businessUnitId, eleID, callBack, deptId, groupId) {
    var elementId = eleID;
    var url = "/apps/HrProcessor.ashx?cmd=workshift.month.deptgroup.employee.arranage";
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data: {
            employeeId: empId,
            day: day,
            workshiftId: window.copyData.WorkShiftId,
            deptId: deptId,
            groupId: groupId,
            description: "",
            elementId: eleID
        },
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            //if (callBack) {
            //    callBack(data, elementId);
            //}
            function callback1(d) {
                if (d.status == 1) {
                    //refreshDesinger();
                    if (callBack) {
                        callBack(data, elementId, d);
                    }
                    return false;
                } else {
                    error3('复制班次失败')
                }
            }
            var id = '';
            if (data && data.returnValue && data.returnValue.Shifts && data.returnValue.Shifts.length) {
                for (i = 0; i < data.returnValue.Shifts.length; i++) {
                    if (data.returnValue.Shifts[i].WorkShiftId == window.copyData.WorkShiftId) {
                        id = data.returnValue.Shifts[i].EmpWorkShiftId
                    }
                }
            }
            else {
                return false
            }
            var messages = {
                params: {
                    recordRep: {
                        objTypeCode: 30043,
                        fields: {
                            Name: window.copyData.Name,
                            ShiftHours: window.copyData.ShiftHours,
                            Description: window.copyData.Description,
                            PostCategory: window.copyData.PostCategory,
                        }
                    }
                }
            }
            if (id != null) {
                messages.params.recordRep.id = id
            }
            messages = JSON.stringify(messages)
            var data1 = { message: messages };
            ajaxMethodPostData('entity.saverecord', data1, callback1)
        },
        type: "GET",
        url: url
    });
}
function copyEmployeeDayAttendance2(empId, day, workshiftId, unitId, businessUnitId, eleID, callBack, deptId, groupId) {
    var elementId = eleID;
    window.copyData.startDate = day;
    window.copyData.endDate = day;
    window.copyData.employeeIds = empId;
    window.copyData.BusinessUnitId = deptId;
    window.copyData.Day = day;
    window.copyData.ElementId = eleID;
    window.copyData.EmployeeId = empId;
    window.copyData.GroupId = groupId;
    var data1 = window.copyData;
    var that = this;
    ajaxMethodPostData('workshift.employee.shift.copy', data1, callback1)
    function callback1(d) {
        if (d.status == 1) {
            if (callBack) {
                callBack(d, elementId);
            }
        } else {
            error3('复制失败')
        }
    }

}
function delAttendEmpDay(obj, valId, cellId, employeeId, attendDate, unitid) {
    return;
    //debugger;
    var event1 = window.event;
    if (event1)
        event1.cancelBubble = true;
    //error3(document.getElementById("selWorkShift").value);
    var a = cellId.split('_');
    var empId = a[1];
    var day = a[2];
    if (document.getElementById("selWorkShift").value == "delete") {
        delAttendEmployeeDayData(refreshAttendCell, valId, empId, day, cellId, unitid);
        //refreshAttendCell(refreshAttendCell, empId, day);
    } else if (document.getElementById("selWorkShift").value == "copy") {
        //var businessUnitId = jQuery("#unitId").val();
        //if (copyData.Name) {
        //    copyEmployeeDayAttendance(empId, day, $(obj).attr('WorkShiftId'), businessUnitId, businessUnitId, cellId, refreshDesinger);
        //    changedStatus = true;
        //}
        //else {
        //    copyData = {
        //        Id: $(obj).attr('id') || '',
        //        Name: $(obj).attr('Name') || '',
        //        ShiftHours: $(obj).attr('ShiftHours') || '',
        //        Description: $(obj).attr('Description') || '',
        //        PostCategory: $(obj).attr('PostCategory') || '',
        //        WorkShiftId: $(obj).attr('WorkShiftId') || ''
        //    }
        //    $(obj).addClass('copysel');
        //}
        $(obj).parent().trigger('click');
    } else {
        //setEmpWorkStatus('',empId, day, '', cellId)；
        $(obj).parent().trigger('click');
    }
}
function refreshAttendCell(data, cellId, copydata) {
    var html2 = "";
    //debugger;
    if (data.returnValue) {
        var data = data.returnValue
    }
    if (data.Shifts) {
        for (var j = 0; j < data.Shifts.length; j++) {
            var row = data.Shifts[j];
            var cellId = "c_" + row.EmployeeId + "_" + row.WorkDay;
            var css = row.CssStyle;
            var canEdit = row.canEdit

            var style = ''
            if (row.Color != '') {
                //style = "background-color:" + shift.CssStyle;
                style += 'color:' + row.Color + ';'
            }
            if (row.BgColor != '') {
                //style = "background-color:" + shift.CssStyle;
                style += 'background-color:' + row.BgColor + ';'
            }
            if (style == "") {
                style = "background-color:#f0fbf8;";//#f0fbf8
            }
            var BusinessUnitIdName = row.BusinessUnitIdName ? row.BusinessUnitIdName : '';
            var CreatedByName = row.CreatedByName ? row.CreatedByName : '';
            var GroupIdName = row.GroupIdName ? row.GroupIdName : '';
            var BusinessUnitId = row.UnitId;
            if (!BusinessUnitId)
                BusinessUnitId = row.BusinessUnitId;
            var tempCell = ''
            var CheckTimes = row.CheckTimes;
            var WorkHours = row.WorkHours ? row.WorkHours : row.ShiftHours;
            var Name = row.Name;
            var StartTime1 = row.StartTime1 ? row.StartTime1 : '';
            var StartTime2 = row.StartTime2 ? row.StartTime2 : '';
            var StartTime3 = row.StartTime3 ? row.StartTime3 : '';
            var EndTime1 = row.EndTime1 ? row.EndTime1 : '';
            var EndTime2 = row.EndTime2 ? row.EndTime2 : '';
            var EndTime3 = row.EndTime3 ? row.EndTime3 : '';
            var ShiftHours = row.ShiftHours || '';
            var Description = row.Description || '';
            var PostCategory = row.PostCategory || '';
            var WorkShiftIdName = row.WorkShiftIdName || '';
            if (copydata && copydata.data.EmpWorkShiftId == row.EmpWorkShiftId) {
                Name = copydata.data.Name;
                ShiftHours = copydata.data.ShiftHours || '';
                Description = copydata.data.Description || '';
                PostCategory = copydata.data.PostCategory || '';
            }
            if (canEdit == false) {
                tempCell = "<div title='报送部门/组：" + BusinessUnitIdName + (BusinessUnitIdName && GroupIdName ? "/" : '') + GroupIdName + "，报送人：" + CreatedByName + "。班次名称：" + Name + "，上下班次数：" + CheckTimes + "，应出勤时长：" + WorkHours + "，第一次上班：" + StartTime1 + "，第一次下班：" + EndTime1 + (CheckTimes == 2 ? "，第二次上班：" + StartTime2 : '') + (CheckTimes == 2 ? "，第二次下班：" + EndTime2 : '') + (CheckTimes == 3 ? "，第三次上班：" + StartTime3 : '') + (CheckTimes == 3 ? "，第三次下班：" + EndTime3 : '') + "。' class=\"qingjia1 cannotEdit\" style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;margin:3px;" + style + "'";;
            } else {
                tempCell = "<div title='报送部门/组：" + BusinessUnitIdName + (BusinessUnitIdName && GroupIdName ? "/" : '') + GroupIdName + "，报送人：" + CreatedByName + "。班次名称：" + Name + "，上下班次数：" + CheckTimes + "，应出勤时长：" + WorkHours + "，第一次上班：" + StartTime1 + "，第一次下班：" + EndTime1 + (CheckTimes == 2 ? "，第二次上班：" + StartTime2 : '') + (CheckTimes == 2 ? "，第二次下班：" + EndTime2 : '') + (CheckTimes == 3 ? "，第三次上班：" + StartTime3 : '') + (CheckTimes == 3 ? "，第三次下班：" + EndTime3 : '') + "。' class=\"qingjia1\" style='cursor:pointer;vertical-align:middle;cursor:pointer;text-align:center;margin:3px;" + style + "'";
                tempCell += " onclick=\"delAttendEmpDay(this,'" + row.EmpWorkShiftId + "','" + cellId + "','" + row.EmployeeId + "','" + row.WorkDay + "','" + BusinessUnitId + "')\"";

            }
            tempCell += " id='c_" + row.EmployeeId + "_" + row.WorkDay + "_" + row.EmpWorkShiftId + "' data-status='{2}' EmpWorkshiftId='" + row.EmpWorkShiftId + "' WorkShiftId='" + row.WorkShiftId + "' ShiftMethodCode='" + row.ShiftMethodCode + "' Name='" + Name + "' ShiftHours='" + ShiftHours + "' Description='" + Description + "' PostCategory='" + PostCategory + "' WorkShiftIdName='" + WorkShiftIdName + "'>" + Name;
            if (row.LeaveDays > 0)
                tempCell += "(" + row.LeaveDays + ")";
            tempCell += "</div>";
            html2 += tempCell;
        }
    }
    //debugger;
    // console.log($("#" + cellId))
    //console.log($("#" + cellId+'copy'))
    if (data.ElementId) {
        cellId = data.ElementId;
    }
    $("#" + cellId).html(html2);
    $("#" + cellId + 'copy').html(html2);
    $(document).ready(function () {
        //hover1();
    })
    editor.resizeDesigner();
}
/*根据id删除考勤*/
function delAttendEmployeeDayData(renderCallback, id, empId, attendDay, eleCellId, unitId) {

    var url = "/apps/HrProcessor.ashx?cmd=workshift.employee.month.delete&id=" + id;
    url += "&EmployeeId=" + empId;
    url += "&AttendDate=" + attendDay;
    url += "&objectTypeCode=" + 10;
    //var unitId = $('#groupBar .active').attr('deptid')
    url += "&unitId=" + unitId;
    jQuery.ajax({
        async: true, cache: true, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //error3('ol1');
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
/*
提交上报排班
*/
function submitDeptAttendStatus(status) {
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#dept_" + unitId).attr("data-name");

    var a = "";
    if (status == 0) {
        a = "你确定要取消提交上报  部门【" + unitName + "】  " + attendYear + "年" + attendMonth + "月  排班吗？";
    }
    else {
        a = "你确定要提交上报 部门【" + unitName + "】  " + attendYear + "年" + attendMonth + "月  排班吗？";
    }
    if (Modal.confirm(a)) {
        var Description = document.getElementById("description").value;
        var LeaveMessage = $("#LeaveMessage").val();
        var url = "/apps/HrProcessor.ashx?cmd=workshift.dept.month.submit";
        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: attendMonth,
                objectTypeCode: 10,
                unitId: unitId,
                status: status,
                desc: Description,
                LeaveMessage: LeaveMessage,
            },
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
                    //jQuery('.qingjia1').off("mousedown");
                }
                else {
                    showButtons(1);
                    jQuery("#btnSaveBatch").html("提交排班");
                    jQuery("#btnSaveBatch").attr("onclick", "submitDeptAttendStatus(1)");
                    jQuery("#attendStatusName").html("未上报");
                    //hover1();
                }
                //hover2();
                jQuery("#btnSaveBatch").show();
            },
            type: "POST",
            url: url
        });

    }
}
/*显示或者隐藏那些按钮*/
function showButtons(status) {
    //debugger;
    if (status == 0) {
        jQuery("#attendSettings").hide();

        jQuery("#btnGroupArrange").hide();
        jQuery("#btnBatchArrange").hide();
        jQuery("#btnTempArrange").hide();
        jQuery("#btnExchange").hide();
        jQuery("#btnSort").hide();
        jQuery("#btnRemark").hide();
        jQuery("#btnCopy").hide();
        jQuery("#btnSaveBatch").hide();

        jQuery("#btnDelEmpData").hide();

        jQuery("#btnTransferIn").hide();
        jQuery("#btnchangeMedicalGroup").hide();
        jQuery("#btnTransferOut").hide();
    }
    if (status == 1) {

        //var eleShiftBar = document.getElementById("shiftBar");
        //if (eleShiftBar) {
        //    eleShiftBar.style.display = "block";
        //    jQuery("#actionToolBar").show();
        //}
        //jQuery("#actionCancelBar").hide();
        jQuery("#attendSettings").show(); //时间

        jQuery("#btnGroupArrange").show();
        jQuery("#btnBatchArrange").show();
        jQuery("#btnTempArrange").show();
        jQuery("#btnExchange").show();
        jQuery("#btnSort").show();
        jQuery("#btnRemark").show();
        jQuery("#btnCopy").show();
        jQuery("#btnSaveBatch").show();

        jQuery("#btnBatchAttend").show();
        jQuery("#btnDelEmpData").show();


        jQuery("#btnTransferIn").show();
        jQuery("#btnchangeMedicalGroup").show();

        jQuery("#btnTransferOut").show();

        jQuery("#shiftBar").show();
    }
    editor.resizeDesigner();
}
function transferOutPeople() {
    var empIds = [];
    var empNames = "";
    var selectCount = 0;
    $("input[id^=chkemp_]").each(function (i, elment) {
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

    if (empIds == "" || selectCount <= 0) {
        error3("请选择至少一个需要调出部门的人员！");
        return;
    }
    var deptId = jQuery("#unitId").val();
    var yNum = jQuery("#yearNumber").val();
    var mNum = jQuery("#monthNumber").val();

    //if (Modal.confirm("你确定要调出你选择的员工吗？")) {
    //    for (var i = 0; i < empIds.length; i++) {
    //        var empId = empIds[i];
    //        deleteEmpMonthAttend(empId, deptId, yNum, mNum, searchMonthEmpAttendances);
    //    }
    //}
    transferOutSelectEmp();
}
/*
批量选择人员的设置考勤
*/
function openBatchAttend() {
    var empIds = "";
    var empNames = "";

    var selectCount = 0;
    $("input[id^=chkemp_]").each(function (i, elment) {
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
        error3("请选择一个人员进行考勤设置");
        return;
    }
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    selectCount = 0;
    var unitId = "";

    var url = "/hr/attend/CreateEmpWorkShift.aspx?objectTypeCode=10&unitId=" + unitId + "&empId=" + empIds + "&empName=" + empNames;
    showDialog(url, "batchShift", "批量排班", 680, 480);
}
/*
复制排班
*/
function copyBatchShift() {

}
/*
删除选择的人员考勤
*/
function deleteSelectEmpAttendData() {
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var empIds = "";

    var j = 0;
    $("input[id^=chkemp_]").each(function (i, elment) {
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

    var node = $('#LeftTree').tree('getSelected')
    if (node.isleft) {
        var deptId = node.id
    } else {
        var deptId = node.ParentId
        var groupid = node.id
    }
    if (empIds == "") {
        error('请选择人员。');
        return;
    }
    //var unitId = jQuery("#unitId").val();
    layer.confirm('你确定要删除选择的员工排班吗？', {
        btn: ['取消', '确定'] //按钮
    }, function (index) {
        layer.close(index);
    }, function (index) {
        var url = "/apps/HrProcessor.ashx?cmd=workshift.deptgroup.employee.month.delete";
        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            data: {
                yearNumber: attendYear,
                monthNumber: Number(attendMonth) || 0,
                objectTypeCode: 10,
                deptId: deptId,
                groupid: groupid,
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
        layer.close(index);
    });
}
function empTransfer(type) {
    var empIds = "";
    var empNames = "";
    var selectCount = 0;

    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();

    var deptId = ''
    var deptName = ''

    var GroupId = ''
    var GroupName = ''

    var node = $('#LeftTree').tree('getSelected')
    //console.log(node)
    if (node.isleft) {
        deptId = node.id
        deptName = node.TextName
    } else {
        deptId = node.ParentId
        deptName = node.ParentIdName
        GroupId = node.id
        GroupName = node.ParentId
    }
    //console.log(deptName)
    if (type == 1) {
        //调出
        $("input[id^=chkemp_]").each(function (i, elment) {
            var check = $(this).prop("checked");
            GroupId = $(this).parents('tr').attr('groupid')
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
        console.log(selectCount)

        if (empIds == "" || selectCount <= 0) {
            error3("请选择一个人员进行移除");
            return;
        }

        //transferOutSelectEmp();
        var url = "/attd/TransferEmpOut.aspx?objectTypeCode=10&unitId=" + deptId + "&unitName=" + deptName + "&GroupId=" + GroupId + "&GroupName=" + GroupName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empId=" + empIds + "&empName=" + empNames;
        showDialog(url, "TransferEmpOut", title, 580, 400);
        return;
    }

    var title = "新增人员";
    if (type == 1)
        title = "调出";
    var url = "/attd/TransferEmpGroup.aspx?objectTypeCode=10&deptId=" + deptId + "&deptName=" + deptName + "&GroupId=" + GroupId + "&GroupName=" + GroupName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&empName=" + empNames;
    showDialog(url, "TransferEmpGroup", title, 720, 450);
}



/*
调出人员
*/
/*
调出人员
*/
function transferOutSelectEmp() {

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

    if (empIds == "") {
        error3("请选择人员进行考勤删除");
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
                unitId: unitId,
                outDate: "",
                objectTypeCode: 30041,
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
function sortEmpDialog() {
    var node = $('#LeftTree').tree('getSelected');
    if (node.isleft) {
        var unitId = node.id;

    } else {
        var unitId = node.ParentId
    }
    var unitName = node.TextName;
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var startDate = editor.startDate;
    var endDate = editor.endDate;
    var url1 = '/attd/shifts/sortGroupMember.aspx?objectTypeCode=10&unitId=' + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth + "&startDate=" + startDate + "&endDate=" + endDate;
    //url1 += "&retURL=%2f06e%2fm";
    url1 += "&retURL=%2f_ui%2fhr%2fGroup%2fWorkshift%2fWeekPage"
    showDialog(url1, "sortGroupMember", "人员排序", 680, 480);
}
function pickWorkshift() {
    var url1 = "/attd/shifts/Pickerworkshift.aspx";
    showDialog(url1, "Pickerworkshift", "设置使用班次", 1000, 600);
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
            if (selectCount == 0) {

                var text = $(this).val();
                var name = $(this).attr("data-name");

                employeeId_from = text;
                employeeIdName_from = name;
            }
            if (selectCount == 1) {

                var text = $(this).val();
                var name = $(this).attr("data-name");
                employeeId_to = text;
                employeeIdName_to = name;
            }
            selectCount++;
        }
    });

    if (selectCount != 2) {
        error3("请选择两个人员进行调班");
        return;
    }
    selectCount = 0;

    var node = $('#LeftTree').tree('getSelected');
    var unitId = node.id;
    var unitName = node.TextName;
    var startDate = editor.startDate;
    var endDate = editor.endDate;
    var url = "/attd/shifts/exchangeShift.aspx?objectTypeCode=10&unitId=" + unitId + "&startDate=" + startDate + "&endDate=" + endDate;
    url += "&employeeId_from=" + employeeId_from + "&employeeIdName_from=" + employeeIdName_from;
    url += "&employeeId_to=" + employeeId_to + "&employeeIdName_to=" + employeeIdName_to;

    showDialog(url, "exchangeEmpShifts", "换班/调换", 660, 480);
}
/*组班*/
function groupArrangeWorkshiftDialog() {
    checkedid = []
    checkedname = []
    var selectCount = 0
    $("input[id^=chkemp_]").each(function (i, elment) {
        var check = $(this).attr("checked");
        if (check) {
            var value = $(this).val();
            var name = $(this).attr("data-name");
            checkedid.push({
                id: value,
                name: name
            })
            selectCount++;
        }
    });
    if (selectCount < 1) {
        error3("请至少选择一个人员进行批量排班");
    } else {
        //var year = document.getElementById("md0").value;
        var unitName = jQuery("#unitName").val();
        var unitId = $("#unitId").val();
        var yearNumber = jQuery("#yearNumber").val();
        var monthNumber = jQuery("#monthNumber").val();
        var weekNumber = "";
        var sDate = "";// document.getElementById("startDate").value;
        var eDate = "";//document.getElementById("endDate").value;

        var url = "/attd/shifts/arrangeGroupWorkshift.aspx?startDate=" + sDate + "&endDate=" + eDate + "&year=" + yearNumber + "&month=" + monthNumber + "&objectTypeCode=10&unitId=" + unitId + "&focus=aboutTab&retURL=%2F_ui%2Fhr%2FGroup%2FWorkshift%2FWeekPage%3Fmd0%3D" + yearNumber + "%26md2%3D" + weekNumber;

        showDialog(url, "arrangeGroupWorkshift", "跟班排班", 800, 485); return false;
    }
}
/*轮班*/
var checkedid = []
function batchArrangeWorkshiftDialog() {
    var selectCount = 0;
    checkedid = []
    checkedname = []
    $("input[id^=chkemp_]").each(function (i, elment) {
        var check = $(this).attr("checked");
        if (check) {
            var value = $(this).val();
            var name = $(this).attr("data-name");
            var groupid = $(this).attr('groupid')
            checkedid.push({
                EmployeeId: value,
                name: name,
                GroupId: groupid
            })
            selectCount++;
        }
    });
    if (selectCount < 1) {
        error3("请至少选择一个人员进行批量排班");
    } else {
        //SfdcApp.ChatterProfileSection.showDialog("contactInfo");
        var unitName = jQuery("#unitName").val();
        var unitId = $("#unitId").val();
        var yearNumber = jQuery("#yearNumber").val();
        var monthNumber = jQuery("#monthNumber").val();
        var weekNumber = "";
        var sDate = "";// document.getElementById("startDate").value;
        var eDate = "";//document.getElementById("endDate").value;
        var url = "/hr/attend/CreateEmpWorkShift.aspx?startDate=" + sDate + "&endDate=" + eDate + "&year=" + yearNumber + "&month=" + monthNumber + "&md2=" + weekNumber + "&objectTypeCode=10&unitId=" + unitId + "&groupId=" + unitId + "&retURL=%2f_ui%2fhr%2fGroup%2fWorkshift%2fWeekPage&type=doctor";
        showDialog(url, "batchArrangeshift", "批量排班", 750, 485); return false;
    }
}
/*模板排骨*/
function templateArrangeWorkShiftDialog() {

    var selectCount = 0;
    var employeeIds = '';
    var employeeIdNames = '';

    $("input[id^=chkemp_]").each(function () {

        var check = $(this).attr("checked");
        if (check) {
            if (selectCount == 0) {
                employeeIds = $(this).val();
                employeeIdNames = $(this).attr("data-name");
            } else {
                employeeIds += "," + $(this).val();
                employeeIdNames += "," + $(this).attr("data-name");
            }
            selectCount++;
        }
    });

    if (selectCount == 0) {
        error3("请选择人员进行模板排班");
        return;
    }

    //var unitId = $($('#groupBar').children('button.active')[0]).attr('deptid');
    var unitId = jQuery("#unitId").val()

    var unitName = $($('#groupBar').children('button.active')[0]).attr('data-name');
    var yearNumber = document.getElementById("yearNumber").value;
    var monthNumber = document.getElementById("monthNumber").value;
    var startDate = editor.startDate;
    var endDate = editor.endDate;
    if (unitId != undefined) {

        var url = "/attd/shifts/templateArrangeWorkshift.aspx?yearNumber=" + yearNumber + "&monthNumber=" + monthNumber + "&startDate=" + startDate + "&endDate=" + endDate;
        url += "&objectTypeCode=10&unitId=" + unitId;
        url += "&employeeIdNames=" + employeeIdNames + "&employeeIds=" + employeeIds;

        showDialog(url, "arrangeGroupWorkshift", "模板排班", 800, 600); return false;
    }
}
/*复制排班*/
function copyWorkshiftDialog() {
    var sDate = "";// jQuery("#startDate").val();
    var eDate = "";//jQuery("#endDate").val();
    //var weekNum = jQuery("#dphe_md2").val();
    //var md0 = jQuery("#dphe_md0").val();
    var selectCount = 0;
    $("input[id^=chkemp_]").each(function () {

        var check = $(this).attr("checked");
        if (check) {
            if (selectCount == 0) {
                employeeIds = $(this).val();
                employeeIdNames = $(this).attr("data-name");
            } else {
                employeeIds += "," + $(this).val();
                employeeIdNames += "," + $(this).attr("data-name");
            }
            selectCount++;
        }
    });

    if (selectCount == 0) {
        error3("请选择要复制的人员！");
        return;
    }
    //if (selectCount > 1) {
    //    error3("只能选择复制一个人！");
    //    return;
    //}
    var node = $('#LeftTree').tree('getSelected');
    if (node.isleft) {
        var unitId = node.id;
        var unitName = node.TextName;

    } else {
        var unitId = node.ParentId;
        var unitName = node.ParentIdName;
    }
    var yearNumber = jQuery("#yearNumber").val();
    var monthNumber = jQuery("#monthNumber").val();
    var startDate = editor.startDate;
    var endDate = editor.endDate;
    var copyStartDate = '';
    var copyEndDate = '';
    var url = "/attd/cloneRangeShift.aspx?objectTypeCode=10&unitId=" + unitId + "&yearNumber=" + yearNumber + "&monthNumber=" + monthNumber + "&employeeIds=" + employeeIds + "&startDate=" + startDate + "&endDate=" + endDate + "&copyStartDate=" + copyStartDate + "&copyEndDate=" + copyEndDate;
    url += "&employeeIdNames=" + employeeIdNames
    //window.location = '/hr/attend/cloneEmpshifts.aspx?t=06e&start=' + sDate + '&end=' + eDate + '&md0=' + md0 + '&weekNum=' + weekNum;

    showDialog(url, "closeRangeShift", "复制排班", 600, 480);
}
/*导入排班*/
function exportWorkshiftDialog() {
    var node = $('#LeftTree').tree('getSelected');
    if (node.isleft) {
        var unitId = node.id;
        var unitName = node.TextName;

    } else {
        var unitId = node.ParentId;
        var unitName = node.ParentIdName;
    }
    var yearNumber = jQuery("#yearNumber").val();
    var monthNumber = jQuery("#monthNumber").val();
    var startDate = editor.startDate;
    var endDate = editor.endDate;

    var url = "/attd/exportRangeShift.aspx?objectTypeCode=10&unitId=" + unitId + "&yearNumber=" + yearNumber + "&monthNumber=" + monthNumber + "&startDate=" + startDate + "&endDate=" + endDate + "&unitName=" + unitName;
    showDialog(url, "exportRangeShift", "导入排班", 600, 400);
}
/*备注*/
function remarkDialog() {
    var unitId = jQuery("#unitId").val();
    var unitName = jQuery("#unitName").val();
    var attendYear = jQuery("#yearNumber").val();
    var attendMonth = jQuery("#monthNumber").val();
    var url1 = '/attd/shifts/RemarkWorkshift.aspx?objectTypeCode=10&unitId=' + unitId + "&unitName=" + unitName + "&yearNumber=" + attendYear + "&monthNumber=" + attendMonth;
    showDialog(url1, "sortGroupMember", "备注", 680, 480);
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
function updown(that) {
    if ($(that).find('img').attr('src') == '/img/cal/147.png') {
        $(that).find('img').attr('src', '/img/images/15.chevronright_1(14x14).png')
        $('div[groupid=' + $(that).attr('groupid') + ']').parent().attr('rowspan', '1')
    } else {
        var rows = $(that).parent().parent().parent().find('tr[groupid=' + $(that).attr('groupid') + ']').length + 1
        $(that).find('img').attr('src', '/img/cal/147.png')
        $('div[groupid=' + $(that).attr('groupid') + ']').parent().attr('rowspan', rows)
    }
    $('tr[groupid=' + $(that).attr('groupid') + ']').toggle()
}
function deletegrouppeople(groupid, employeeId, deptid) {
    if (groupid == '') {
        error3('该人员未分组')
    } else {
        $('.popup-mask').show()
        var yearNumber = $("#yearNumber").val();
        var monthNumber = $("#monthNumber").val();
        $('#iframe').attr('src', '/attd/shifts/deleteGroupRow.html?employeeId=' + employeeId + '&groupid=' + groupid + '&deptid=' + deptid + '&yearNumber=' + yearNumber + '&monthNumber=' + monthNumber).show().height(280).css('margin-top', '-140px')
    }
}
function groupappendpeople(id, deptid) {
    $('.popup-mask').show()
    $('#iframe').attr('src', '/alert/attend/shiftgroupappendpeople.html?month=1&groupid=' + id + '&deptid=' + deptid).show().height(640).css('margin-top', '-320px')
}
function upgrouppeople(groupid, employeeId, deptid, that) {
    if ($(that).parent().parent().find('td[rowspan]').length == 0) {
        var EmployeeId2 = $(that).parent().parent().prev().attr('empid')
        var yearNumber = $("#yearNumber").val();
        var monthNumber = $("#monthNumber").val();
        var data = {
            yearNumber: yearNumber,
            monthNumber: monthNumber,
            DeptId: deptid,
            GroupId: groupid,
            EmployeeId: employeeId,
            EmployeeId2: EmployeeId2,
            rank: 'before',
            sortNumber: $(that).parent().parent().attr('sortNumber')
            //SortNumber: $(that).parent().parent().index()-1,
        }
        ajaxMethodGetData('workshift.deptgroup.employee.month.sort', data, function (data) {
            var html1 = $(that).parent().parent().find('td').not('.flextd')
            var html2 = $(that).parent().parent().prev().find('td').not('.flextd')
            $(that).parent().parent().append(html2)
            $(that).parent().parent().prev().append(html1)
            success2('保存成功')
        })
    } else {
        error3('已经是第一个了')
    }
}
function downgrouppeople(groupid, employeeId, deptid, that) {
    if ($(that).parent().parent().next().find('td[rowspan]').length == 0) {
        var EmployeeId2 = $(that).parent().parent().next().attr('empid')
        var yearNumber = $("#yearNumber").val();
        var monthNumber = $("#monthNumber").val();
        var data = {
            yearNumber: yearNumber,
            monthNumber: monthNumber,
            DeptId: deptid,
            GroupId: groupid,
            EmployeeId: employeeId,
            EmployeeId2: EmployeeId2,
            rank: 'after',
            sortNumber: $(that).parent().parent().attr('sortNumber')
            //SortNumber: $(that).parent().parent().index()+1,
        }
        ajaxMethodGetData('workshift.deptgroup.employee.month.sort', data, function (data) {
            var html1 = $(that).parent().parent().find('td').not('.flextd')
            var html2 = $(that).parent().parent().next().find('td').not('.flextd')
            $(that).parent().parent().append(html2)
            $(that).parent().parent().next().append(html1)
            success2('保存成功')
        })
    } else {
        error3('已经是最后一个了')
    }
}
