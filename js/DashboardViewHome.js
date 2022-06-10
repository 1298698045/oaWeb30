function loadEditObjects()
{
    var url = "/apps/CommandProcessor.ashx?cmd=dutyshift.today.getlist";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            // alert("0");
        },
        success: function (data, textStatus) {
            // callbak(data);
            var html = "";
            if (!data.data.Table) return;
            //debugger;
            html += "<li class=\"selted\"><div style='height: 10px;'></div>";
            html += " <div class=\"eventHomeEventItems\">";
            if (data.data.Table.length > 0) {
                for (var i = 0; i < data.data.Table.length; i++) {
                    var row = data.data.Table[i];
                    html += "  <div class=\"eventHomeEventItem\">";
                    html += "     <div class='evtLine' style='width:3px;background-color:#10a2f8;'></div><div class=\"evtTime\">" + row.EmployeeIdName + "</div><div class='evtSubject'><a>" + row.WorkShiftIdName + "</a></div></div>";
                }
            }
            html += " </div>";
            html += "  </li>";
           // debugger;
            //document.getElementById("mustEditObjects").innerHTML = html;
            jQuery("#mustEditObjects").html(html);
            //document.write(html);
            //alert(html);
        },
        type: "GET",
        url: url
    });
}
function loadMyMeetings() {
    var url = "/apps/CommandProcessor.ashx?cmd=meeting.home.list";
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
        },
        success: function (data, textStatus) {
            var html = "";
            if (!data.data) return;
            if (data.data.length > 0) {
                html += "<li class=\"selted\"><div style='height: 10px;'></div>";
                html += "<div class=\"eventHomeEventItems\">";
                html += "<div class=\"eventHomeEventItem\" style='display:block'>"
                html += "<div class='evtTime' style='width:60px;font-size:12px;border-left: 3px solid #10a2f8;margin-right:0;'>标题</div><div style='width:115px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;' class='evtSubject'>开始时间</div><div style='width:70px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;' class='evtSubject'>地点</div><div style='width:40px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;' class='evtSubject'>操作</div></div>";
                for (var i = 0; i < data.data.length; i++) {
                    var row = data.data[i];
                html += "<div class=\"eventHomeEventItem\" style='display:block'>";
                    if (row.StatusCodeName=='未接受') {
                        html += '<div class="evtTime" style="width:60px;font-size:12px;border-left: 3px solid #10a2f8;margin-right:0;" title="' + row.Name + '">' + row.Name + '</div><div style="width:115px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;overflow: hidden;text-overflow: ellipsis;" class="evtSubject" title="' + row.ScheduledStart + '">' + row.ScheduledStart + '</div><div style="width:70px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;overflow: hidden;text-overflow: ellipsis;" class="evtSubject" title="' + row.RoomIdName + '">' + row.RoomIdName + '</div><div style="width:40px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;" class="evtSubject"><span style="color:blue;cursor: pointer;" onclick=\'isreceived("' + row.MeetingId + '")\'>接受</span></div></div>';
                    }
                    else {
                        html += '<div class="evtTime" style="width:60px;font-size:12px;border-left: 3px solid #10a2f8;margin-right:0;" title="' + row.Name + '">' + row.Name + '</div><div style="width:115px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;overflow: hidden;text-overflow: ellipsis;" class="evtSubject" title="' + row.ScheduledStart + '">' + row.ScheduledStart + '</div><div style="width:70px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;overflow: hidden;text-overflow: ellipsis;" class="evtSubject" title="' + row.RoomIdName + '">' + row.RoomIdName + '</div><div style="width:40px;font-weight:normal;color: #323434;font-size:12px;margin-right:0;" class="evtSubject">' + row.StatusCodeName + '</div></div>';
                    }
                }
                html += " </div>";
                html += "  </li>";
            }
            jQuery("#myMeetings").html(html);
           
        },
        type: "GET",
        url: url
    });
}

function isreceived(id) {
    $('#iframe').attr('src', '/alert/rejectedMeeting.html?id=' + id).show().height(430);
    $('#changeDiv').show()
    $('.popup-mask').show()
}

function received(id) {
    var that=this
    ajaxMethodPostData('meeting.audience.accept', { meetingId: id, statusCode:1}, function () {
        loadMyMeetings()
    })
}
function rejected(id) {
    $('#iframe').attr('src', '/alert/rejectedMeeting.html?id=' + id).show().height(400);
    $('#changeDiv').show()
    $('.popup-mask').show()
}
