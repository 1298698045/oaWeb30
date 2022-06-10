
$(".liftnav li").each(function () {
    $(this).click(function () {
        $(".liftnav li").removeClass("active");
        $(this).addClass("active");
        var a = 6100;

        for (i = 0; i <= $(".liftnav p").length; i++) {
            $(".liftnav p").eq(i).css({
                background: "url(/img/cal/" + a + ".png) no-repeat left 10px center",
                backgroundSize: "18px"
            });
            a++;
        }

        $(this).children("p").css("background", "none");
        $(this).children("p").css({
            background: "url(/img/cal/" + 700 + $(this).index() + ".png) no-repeat left 10px center",
            backgroundSize: "18px"
        });
        var scope = $(this).attr("scope", scope);
        taskssearch(pageNumber);
    });
});
var a = 6100;

for (i = 0; i <= $(".liftnav p").length; i++) {
    $(".liftnav p").eq(i).css({
        background: "url(/img/cal/" + a + ".png) no-repeat left 10px center",
        backgroundSize: "18px"
    });
    a++;
}

$(".chaxun p").each(function () {
    $(this).click(function () {
        $(".chaxun p").removeClass("active");
        $(this).addClass("active");
    });
});
$(".page p[title]").each(function () {
    $(this).click(function () {
        $(".page p[title]").removeClass("active");
        $(this).addClass("active");
    });
});
$(".liftnav p").eq(0).css({
    background: "url(/img/cal/7000.png) no-repeat left 10px center",
    backgroundSize: "18px"
}); //日历选择
//获取当天日期

var day2 = new Date();
day2.setTime(day2.getTime());
var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1) + "-" + day2.getDate();
$(".pinput3").each(function () {
    $(this).click(function () {
        var that = this;
        $(this).parents(".time").append('<div class="ca"><div class="ca-head"><p class="ca-date" id="ca-date">' + s2 + '</p><div class="ca-time">' + '<select><option value="00:00">00:00</option></select></div></div>' + '<div id="schedule-box" class="boxshaw"></div><div class="ca-foot">' + '<div class="ca-clear">清除</div><div class="ca-true">确定</div></div></div>');
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
            var time = $("#ca-date").html() + " " + $(this).parents(".ca").find("select").val(); //console.log(time)

            $(that).attr("time", time);
            $(that).find("input").val($("#ca-date").html());
            $(that).next().find("input").val($(this).parents(".ca").find("select").val());
            $(".ca").remove();
        });
    });
}); //获取任务列表

var totalRowCount;

function taskssearch(pageNumber) {
    var url = "/apps/CommandProcessor.ashx?cmd=project.task.search";
    var search = $("#allmission .main-head>div").eq(0).find("input").val();
    var startDate = $("#allmission .main-head>div").eq(2).find("input").val();
    var endDate = $("#allmission .main-head>div").eq(1).find("input").val();
    var statusCode = $("#allmission .main-head>div").eq(3).find("select").val();
    var scope = 0;
    scope = $(".liftnav").find("li.active").attr("scope");
    if (statusCode == "请选择") statusCode = "";
    if (statusCode == "未开始") statusCode = 0;
    if (statusCode == "进行中") statusCode = 1;
    if (statusCode == "已完成") statusCode = 2;
    if (statusCode == "等待其他人") statusCode = 3;
    if (statusCode == "已推迟") statusCode = 4;
    var createdby = $("#allmission .main-head>div").eq(4).find("input").val();
    jQuery.ajax({
        data: {
            pageSize: 10,
            pageNumber: pageNumber,
            scope: scope,
            search: search,
            startDate: startDate,
            endDate: endDate,
            statusCode: statusCode,
            createdby: createdby
        },
        async: true,
        cache: false,
        dataType: "json",
        error: function error(request, textStatus, errorThrown) { },
        success: function success(res) {
            console.log(res); //console.log(res.totalRowCount)

            totalRowCount = res.totalRowCount / 10;
            totalRowCount = Math.ceil(totalRowCount);
            $(".body-main").find("li").remove();

            for (var i = 0; i < res.listData.length; i++) {
                var data = res.listData[i];
                var name = data.OwningUserName;
                var ScheduledStart = data.ScheduledStart;
                var ScheduledEnd = data.ScheduledEnd;
                var Subject = data.Subject;
                var CreatedOn = data.CreatedOn;
                var statusCode = data.StatusCode;
                var ActivityId = data.ActivityId;
                if (statusCode == 0) statusCode = "未开始";
                if (statusCode == 1) statusCode = "进行中";
                if (statusCode == 2) statusCode = "已完成";
                if (statusCode == 3) statusCode = "等待其他人";
                if (statusCode == 4) statusCode = "已推迟";
                var subject = data.Subject;
                $(".body-main").append('<li ActivityId="' + ActivityId + '">' + '<div class="body-head">' + '<p style="width:31% " class="zhuti"><input type="checkbox"style="margin-left: 10px"><span style="margin-left: 20px;color: rgba(16, 138, 249, 1)">' + subject + '</span></p>' + '<p style="width:10%;position:relative"> <span class="xiaodian"></span><span>' + statusCode + '</span></p>' + '<p style="width:8% "><span class="red">高</span></p>' + '<p style="width:13% "><span>' + ScheduledStart + '</span></p>' + '<p style="width:13% "><span>' + ScheduledEnd + '</span></p>' + '<p style="width:8% "><span class="blue">' + name + '</span></p>' + '<p style="width:9% "><span>' + CreatedOn + '</span></p>' + '<p style="width:6.5%;padding-left:1.5%;position:relative"">' + '<span class="sanjiao">' + '<img src="/img/cal/20.PNG"  />' + '</span>' + '</p>' + '</div>' + '</li>');
            }

            missionbianji2();
            toxiangqing2();
            $(".main-body .page>p").eq(2).html("共" + totalRowCount + "页");
        },
        url: url
    });
} //分配人


$("#allmission .main-head div").eq(4).find("p").click(function () {
    $(".card-people").remove();
    $(this).parent("div").css("position", "relative");
    $(this).parent("div").append('<div class="card-people">' + '<div class="sousuo">' + '<p><input type="text" placeholder="搜索"></p>' + '</div>' + '<ul>' + '</ul>' + '<div class="peoplechooked"><div class="peoplechooked-head">被分配人</div>' + '<div class="peoplechooked-body"><img src="/img/cal/1.png"><span>张丽萍</span></div></div>' + '<div class="peoplechooktj"><div class="peoplechooked-head">推荐</div>' + '<div class="peoplechooked-body"><input type="checkbox"><img src="/img/cal/1.png"><span>所有成员</span></div></div>' + '<div class="peoplechookbm">按部门/组添加</div>' + '<div class="peoplechookfg"></div>' + '<div class="queding">确定</div>' + '</div>');
    searchusers2();
    $(".queding").click(function () {
        var NAME = $(this).parents(".main-head").attr("NAME");
        $(this).parent().parent("div").find("input").eq(0).val(NAME);
        $(this).parent().remove();
    });
});

function searchusers2() {
    //搜索分配人
    var url = "/SecurityProcessor.ashx?cmd=searchusers";
    $("#allmission .main-head div").eq(4).find(".card-people input").keyup(function () {
        var search = $("#allmission .main-head div").eq(4).find(".card-people input").val(); //console.log(search)

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
                $(".card-people ul").append('<p class="sousuojieguo">共 <span>' + res.length + '</span> 条搜索结果</p>');

                for (var i = 0; i < res.length; i++) {
                    var data = res[i];
                    var name = data.name;
                    var id = data.id;
                    $(".card-people ul").append('<li tit="' + id + '"><input type="checkbox"><p><img src="/img/cal/15.png"></p><span>' + name + '</span></li>');
                }

                $("#card .card-people li").each(function () {
                    $(this).click(function () {
                        var id = $(this).attr("tit");
                        NAME = $(this).find("span").html();
                        $(this).parents(".item").attr("NAME", NAME);
                    });
                });
            },
            url: url
        });
    });
} //分页查询


$(".main-body .page>p").eq(3).find("input").val(1);
$(".chaxun p").eq(0).click(function () {
    pageNumber = 1;
    taskssearch(pageNumber);
    $(".main-body .page>p").eq(3).find("input").val(pageNumber);
});
$(".main-body .page>p").eq(0).click(function () {
    pageNumber--;

    if (pageNumber < 1) {
        pageNumber = 0;
    }

    taskssearch(pageNumber);
    $(".main-body .page>p").eq(3).find("input").val(pageNumber);
});
$(".main-body .page>p").eq(1).click(function () {
    //console.log(111)
    pageNumber++;
    taskssearch(pageNumber);
    $(".main-body .page>p").eq(3).find("input").val(pageNumber);
});
$(".main-body .page>p").eq(4).click(function () {
    //console.log(111)
    pageNumber = $(".main-body .page>p").eq(3).find("input").val();
    taskssearch(pageNumber);
});
$; //获取屏幕高度

var clientHeight;
var clientWidth;

function getClientHeight() {
    if (document.body.clientHeight && document.documentElement.clientHeight) {
        clientHeight = document.body.clientHeight < document.documentElement.clientHeight ? document.body.clientHeight : document.documentElement.clientHeight;
        clientWidth = document.body.clientWidth < document.documentElement.clientWidth ? document.body.clientWidth : document.documentElement.clientWidth;
    } else {
        clientHeight = document.body.clientHeight > document.documentElement.clientHeight ? document.body.clientHeight : document.documentElement.clientHeight;
        clientWidth = document.body.clientWidth > document.documentElement.clientWidth ? document.body.clientWidth : document.documentElement.clientWidth;
    }

    return clientHeight, clientWidth;
}

getClientHeight();
$(".main-head").height();
$("#allmission .body-main").height(clientHeight - 380 - $(".main-head").height());
$(".liftnav").height(clientHeight - 240);
$(window).resize(function () {
    getClientHeight();
    $("#allmission .body-main").height(clientHeight - 380 - $(".main-head").height());
    $(".liftnav").height(clientHeight - 240);
});
$(".main-body .body-head>p").eq(1).click(function () {
    //console.log(111)
    $(".bianji-liebiaochook1").show().children("li").click(function () {
        $(".bianji-liebiaochook1 li").removeClass("active");
        $(this).addClass("active");
        $(".bianji-liebiaochook1").hide();
    });
});
$(document).mouseup(function (e) {
    if ($(e.target).parents(".bianji-liebiaochook1").length == 0) {
        $(".bianji-liebiaochook1").hide();
    }
});
$(".main-body .body-head>p").eq(2).click(function () {
    $(".bianji-liebiaochook2").show().children("li").click(function () {
        $(".bianji-liebiaochook2 li").removeClass("active");
        $(this).addClass("active");
        $(".bianji-liebiaochook2").hide();
    });
    $(document).mouseup(function (e) {
        if ($(e.target).parents(".bianji-liebiaochook2").length == 0) {
            $(".bianji-liebiaochook2").hide();
        }
    });
}); //任务操作

function missionbianji2() {
    $("#allmission .sanjiao").click(function () {
        $(".miss-bianji").remove();

        if (a == 0) {
            $(this).append('<div class="miss-bianji">' + '<div class="miss-bianji1">编辑</div>' + '<div class="miss-bianji1">移动</div>' + '<div>删除</div>' + '</div>');
            a = 1;
        } else {
            $(" .miss-bianji").remove();
            a = 0;
        }

        $(".miss-bianji div").eq(2).click(function () {
            $(".delete-mask").show();
            $(".delete-shur").show();
            $(".delete-shur-foot div").eq(0).off();
            $(".delete-shur-foot div").eq(0).click(function () {
                //删除任务
                var activeid = $(".miss-bianji div").parent().parent().parent().parent().parent().attr("activityid"); //console.log($(".miss-bianji div").parent().parent().parent().parent().parent())
                //console.log(activeid)

                addTaskdelete(activeid);
                $(".miss-bianji div").parent().parent().parent().parent().parent().remove();
                $(".miss-bianji").remove();
                $(".delete-mask").hide();
                $(".delete-shur").hide();
            });
            return false;
        });
        $(".miss-bianji div").eq(1).click(function () {
            $(".delete-mask").show();
            $(".delete-bianji").show(); //移动任务

            $(".delete-liebiaochook").click(function () {
                $(".bianji-liebiaochook3").show();
                $(".bianji-liebiaochook3").find("li").each(function () {
                    $(this).click(function () {
                        $(".delete-liebiaochook>div").find("span").html($(this).text());
                        $(".bianji-liebiaochook").hide();
                        return false;
                    });
                });
            });
            $(".delete-bianji-foot").find("div").eq(1).click(function () {
                $(".delete-bianji").hide();
            });
            $(".delete-bianji-foot div").eq(0).off();
            $(".delete-bianji-foot div").eq(0).click(function () {
                $("#card .miss-bianji").remove();
                $(".delete-mask").hide();
                $(".delete-bianji").hide();
            });
            return false;
        }); //添加子任务

        $(".miss-bianji div").eq(3).click(function () {
            $(".popup").show();
            $(".delete-mask").show();
        });
        $(".miss-bianji div").eq(0).click(function () {
            //任务编辑
            var id = $(this).parents("li").attr("activityid"); //console.log(id)

            $("#newmission").show();
            $(".mission-header").hide();
            $(".mission-header4").show();
            $("#qqqq").hide();
            $("#allmission").hide();
            $(".mission").hide();
            $(".invite").hide();
            window.location.href = "/cal/tasklist.aspx?" + "id=" + id;
            getmiss2(id);
        });
        return false;
    });
}

$("#allmission .popup-main .body-main").height(260);
$(".popup-foot div").eq(0).click(function () {
    $(".delete-mask").hide();
    $(".popup").hide();
});
$(".popup-foot div").eq(1).click(function () {
    $(".delete-mask").hide();
    $(".popup").hide();
}); //进入详情页面

function toxiangqing2() {
    $(".body-main li .zhuti").each(function () {
        $(this).click(function () {
            var activityid = $(this).parent().parent().attr("activityid");
            window.location.href = "/cal/taskView.aspx?" + "id=" + activityid;
        });
    });
}