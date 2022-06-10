
$(".missmessage-body p").each(function () {
    $(this).click(function () {
        $(".missmessage-body p").removeClass("active");
        $(this).addClass("active");
    });
});
$(".pinlv div").each(function () {
    $(this).click(function () {
        $(".pinlv div").removeClass("active");
        $(this).addClass("active");
    });
});
$(".save div").each(function () {
    $(this).click(function () {
        $(".save div").removeClass("active");
        $(this).addClass("active");
    });
}); //新建任务

var activeid;
activityid()
function activityid() {
   
}

function addTaskadd() {
    activeid = getQueryString('id');
    if (activeid) { } else {
        activeid = $('#newmission').attr('missionid')
    }
    console.log(activeid)

    if (activeid && activeid!='') {
        $('.newmission-foot .save div').eq(0).hide()
        $('.newmission-head').html('编辑任务')
    } else {
        $('.newmission-foot .save div').eq(0).show()
        $('.newmission-head').html('新建任务')
        $('#newmission input').val('')
    }

    var url = window.location.href;

    var scheduledstart = $(".pinput3 input").eq(0).val() + ' ' + $('.starttime2 select').eq(0).val();
    var scheduledend = $(".pinput3 input").eq(1).val() + ' ' + $('.starttime2 select').eq(1).val();
    var subject = $(".title input").val();

    var phone = $(".phone input").val();
    var email = $(".email input").eq(0).val();
    var people = $(".email input").eq(1).val();
    var youxianji = $(".missmessage-bodyright .pinput1 span").eq(0).html();

    if (youxianji == "低") {
        youxianji = 0;
    }

    if (youxianji == "中") {
        youxianji = 1;
    }

    if (youxianji == "高") {
        youxianji = 2;
    }

    var zhuangtai = $(".missmessage-bodyright .pinput1 span").eq(1).html();
    if (zhuangtai == "未开始") {
        zhuangtai = 0;
    }
    if (zhuangtai == "进行中") {
        zhuangtai = 1;
    }

    if (zhuangtai == "已完成") {
        zhuangtai = 2;
    }

    if (zhuangtai == "等待其他人") {
        zhuangtai = 3;
    }

    if (zhuangtai == "已推迟") {
        zhuangtai = 4;
    }

    var mingcheng = $(".email input").eq(4).val();
    var xiangguanxiang = $(".email input").eq(5).val();
    var OwningUser = $(".peoplechook").attr("owningid");
    var description = $('#description').val();
    var ReminderTime = $('#ReminderTime').html();

    if (ReminderTime == '截止前15分钟') {
        ReminderTime = 15;
    }

    if (ReminderTime == '截止前30分钟') ReminderTime = 30;
    if (ReminderTime == '截止前60分钟') ReminderTime = 60;
    var url = "/apps/HrProcessor.ashx?cmd=project.task.edit";
    var RegardingObjectId = getQueryString('projectId')

    if (subject != "") {

        jQuery.ajax({
            data: {
                RegardingObjectTypeCode: 20290,
                RegardingObjectId: RegardingObjectId,
                subject: subject,
                scheduledend: scheduledend,
                scheduledstart: scheduledstart,
                prioritycode: youxianji,
                StatusCode:zhuangtai,
                scope: "2",
                id: activeid,
                OwningUser: OwningUser,
                description: description,
                ReminderTime: ReminderTime
            },
            async: true,
            cache: false,
            dataType: "json",
            error: function error(request, textStatus, errorThrown) { },
            success: function success(res) {//console.log(res)
                 //window.location.reload()
            },
            url: url
        });
    } else {
        alert("请输入任务主题");
    }
} //提交
$(".save div").eq(2).click(function () {
    addTaskadd();
    var subject = $(".title input").val();
    

});
$(".save div").eq(1).click(function () {
    $('.popup-mask').hide();
    $('#newmission').hide();
   
});
$(".save div").eq(0).click(function () {
    addTaskadd();
    $('input').not('.starttime input').val('');
}); //日历选择
//获取当天日期

var day2 = new Date();
day2.setTime(day2.getTime());
var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1) + "-" + day2.getDate();
var s3 = day2.getHours();
var s4 = day2.getMinutes();
var ss2 = s3 + ":" + s4;
$(".pinput3").eq(0).find("input").val(s2);
$(".pinput2").eq(0).find("select").val(ss2);
$(".timechookca").each(function () {
    $(this).click(function () {
        var that = this;
        $(this).parent().parent().parent().append('<div class="ca"><div class="ca-head"><p class="ca-date" id="ca-date">' + s2 + '</p><div class="ca-time">' + '<select><option value="00:00">00:00</option></select></div></div>' + '<div id="schedule-box" class="boxshaw"></div><div class="ca-foot">' + '<div class="ca-clear">清除</div><div class="ca-true">确定</div></div></div>');
        $(document).mousedown(function (e) {
            if ($(e.target).parents(".ca").length == 0) {
                $(".ca").remove();
            }
        });
        var fenzhong = 0;
        var xiaoshi = 0;

        for (var i = 0; i < 95; i++) {
            fenzhong += 15;

            if (fenzhong == 60) {
                xiaoshi++;
                fenzhong = 0;
            }

            var fenzhong2 = fenzhong;
            var xiaoshi2 = xiaoshi;

            if (fenzhong == 0) {
                fenzhong2 = "00";
            }

            if (xiaoshi < 10) {
                xiaoshi2 = "0" + xiaoshi;
            }

            var time = xiaoshi2 + ":" + fenzhong2;
            $(".ca").find("select").append('<option value="' + time + '">' + time + '</option>');
        }

        var mySchedule = new Schedule({
            el: '#schedule-box',
            //date: '2018-9-20',		
            clickCb: function clickCb(y, m, d) {
                document.querySelector('#ca-date').innerHTML = +y + '-' + m + '-' + d;
            },
            nextMonthCb: function nextMonthCb(y, m, d) {
                document.querySelector('#ca-date').innerHTML = +y + '-' + m + '-' + d;
            },
            nextYeayCb: function nextYeayCb(y, m, d) {
                document.querySelector('#ca-date').innerHTML = +y + '-' + m + '-' + d;
            },
            prevMonthCb: function prevMonthCb(y, m, d) {
                document.querySelector('#ca-date').innerHTML = +y + '-' + m + '-' + d;
            },
            prevYearCb: function prevYearCb(y, m, d) {
                document.querySelector('#ca-date').innerHTML = +y + '-' + m + '-' + d;
            }
        });
        $(".ca-true").click(function () {
            var time = $("#ca-date").html() + " " + $(this).parents(".ca").find("select").val();
            $(that).attr("time", time);
            $(that).find("input").val(time);
            $(".ca").remove();
        });
    });
}); //分配人

$(".missmessage-bodyright .email input").eq(0).click(function () {
    $(".card-people").remove();
    var FullName = $("#aaa").attr("name");
    $(this).parents(".email").append('<div class="card-people">' + '<div class="sousuo">' + '<p><input type="text" placeholder="搜索"></p>' + '</div>' + '<ul>' + '</ul>' + '<div class="peoplechooked"><div class="peoplechooked-head">被分配人</div>' + '<div class="peoplechooked-body"><img src="/img/cal/1.png"><span class="spann1">' + FullName + '</span></div></div>' + '<div class="peoplechooktj"><div class="peoplechooked-head">推荐</div>' + '<div class="peoplechooked-body peoplechooked-body2"></div></div>' + '<div class="peoplechookbm">按部门/组添加</div>' + '<div class="peoplechookfg"></div>' + '<div class="queding">确定</div>' + '</div>'); //最近使用成员

    $.ajax({
        type: "post",
        url: "/apps/CommandProcessor.ashx?cmd=user.latestuse.getlist",
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {
            console.log(res);

            for (var i = 0; i < res.listData.length; i++) {
                $(".peoplechooked-body2").append('<div><img src="/img/cal/1.png"><span>所有成员</span></div>');
                var data = res.listData[i];
                name = data.FullName;
                var id = data.SystemUserId;
                var PhotoUrl = data.PhotoUrl;
                $(".peoplechooked-body2>div").eq(i).attr("id", id);
                $(".peoplechooked-body2>div").eq(i).find("span").html(name);
                //$(".peoplechooked-body2>div").eq(i).find("img").prop("src", PhotoUrl);
            }

            $(".peoplechooked-body2>div").each(function () {
                $(this).click(function () {
                    var name = FullName;
                    $(".peoplechooked-body").eq(0).find("span").html($(this).find("span").html());
                    $(".peoplechooked-body").eq(0).find("img").prop("src", $(this).find("img").prop("src"));
                    $(this).parents(".email").attr("NAME", $(this).find("span").html());
                    $(this).parents(".email").attr("owningid", $(this).attr("id"));
                });
            });
        }
    });
    $(document).mousedown(function (e) {
        if ($(e.target).parents(".card-people").length == 0) {
            $(".card-people").remove();
        }
    });
    searchusers();
    $(".queding").click(function () {
        var NAME = $(this).parents(".email").attr("NAME");
        if (NAME) {
            $(this).parents(".email").find("input").eq(0).val(NAME);
        } else {
            $(this).parents(".email").find("input").eq(0).val($('.spann1').html())
            $(this).parents(".email").attr("owningid", UserId);

        }
        $(this).parent().remove();
    });
});

function searchusers() {
    //搜索分配人
    var url = "/SecurityProcessor.ashx?cmd=searchusers";
    $(".missmessage-bodyright .email .card-people input").eq(0).keyup(function () {
        var search = $(".missmessage-bodyright .email .card-people input").eq(0).val(); //console.log(search)

        jQuery.ajax({
            data: {
                search: search
            },
            async: true,
            cache: false,
            dataType: "json",
            error: function error(request, textStatus, errorThrown) { },
            success: function success(res) {
                $(".card-people").find(".peoplechooked").remove();
                $(".card-people").find(".peoplechooktj").remove();
                $(".card-people").find(".peoplechookbm").remove();
                $(".card-people ul").show();
                $(".card-people ul li").remove();
                $(".card-people ul .sousuojieguo").remove();
                $(".card-people ul").append('<div class="sousuojieguo">共 <span>' + res.length + '</span> 条搜索结果</div>');

                for (var i = 0; i < res.length; i++) {
                    var data = res[i];
                    var name = data.name;
                    var id = data.id;
                    $(".card-people ul").append('<li tit="' + id + '"><p class="checkboxinput"></p><p><img src="/img/cal/15.png"></p><span>' + name + '</span></li>');
                }

                $(".card-people li").each(function () {
                    $(this).click(function () {
                        $(".checkboxinput").removeClass("active");
                        $(this).children(".checkboxinput").addClass("active");
                        var id = $(this).attr("tit");
                        NAME = $(this).find("span").html();
                        $(this).parents("#aaa").attr("name", NAME);
                        $(this).parents("#aaa").attr("owningid", id);
                    });
                });
            },
            url: url
        });
    });
}

$(".tixingcheck").each(function () {
    $(this).click(function () {
        $(this).toggleClass("active");
        $(this).parent().parent().find(".hidediv").toggle();
    });
});
$(".chongfucheck").each(function () {
    $(this).click(function () {
        $(this).toggleClass("active");
        $(this).parent().parent().find(".hidediv").toggle();
    });
});
$("#sex").prev().click(function () {
    $('.email ul').hide();
    $(".jiezhishijian").hide();
    $("#sex").show();
    $("#sex li").each(function () {
        $(this).click(function () {
            $("#sex li").removeClass("active");
            $(this).addClass("active");
            $("#sex").prev().find("span").html($(this).find("span").html());
        });
    });
    $(document).click(function () {
        $("#sex").hide();
    });
    return false;
}); //合同状态

$("#Select3").prev().click(function () {
    $('.email ul').hide();
    $(".jiezhishijian").hide();
    $("#Select3").show();
    $("#Select3 li").each(function () {
        $(this).click(function () {
            $("#Select3 li").removeClass("active");
            $(this).addClass("active");
            $("#Select3").prev().find("span").html($(this).find("span").html());
        });
    });
    $(document).click(function () {
        $("#Select3").hide();
    });
    return false;
});
$(".jiezhishijian").prev().click(function () {
    $('.email ul').hide();
    $(".jiezhishijian").show();
    $(".jiezhishijian li").each(function () {
        $(this).click(function () {
            $(".jiezhishijian li").removeClass("active");
            $(this).addClass("active");
            $(".jiezhishijian").prev().find("span").html($(this).find("span").html());
        });
    });
    $(document).click(function () {
        $(".jiezhishijian").hide();
    });
    return false;
});