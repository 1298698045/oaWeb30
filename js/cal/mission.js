
//邀请查看着
$(".yaoqingchakanzhe").click(function () {
    $('iframe').show();
});
$(".missionleft-head li").each(function () {
    $(this).click(function () {
        var that = this;
        $(".missionleft-head li").removeClass("active");
        $(this).addClass("active");
        $(".missionleft-body>div").removeClass("active");
        $(".missionleft-body>div").eq($(that).index()).addClass("active");
    });
});
$(".people-head li").each(function () {
    $(this).click(function () {
        $(".people-head li").removeClass("active");
        $(this).addClass("active");
    });
});
$(".page p[title]").each(function () {
    $(this).click(function () {
        $(".page p[title]").removeClass("active");
        $(this).addClass("active");
    });
}); //获取任务

var StatusCode;
var statusCode;
var url = window.location.href;
var id = getQueryString('id');

if (id) {
    getmiss();
    getpeople();
}
function getmiss() {
    $(".mission").attr("id", id);
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=project.task.get",
        data: {
            id: id
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {
            var owninguser = res.listData[0].OwningUser
            var userid = res.context.userid
            if (owninguser != userid) {
                $('.bianji').hide()
                $('.shanchu').hide()
            }

            if (res) {
                var data = res.listData[0];
                var Subject = data.Subject;
                var ScheduledEnd = data.ScheduledEnd;
                var ScheduledStart = data.ScheduledStart;
                var OwningUserName = data.OwningUserName;
                var PriorityCodeName = data.PriorityCodeName;
                var PriorityCode = data.PriorityCode;
                var StatusCodeName = data.StatusCodeName;
                var ReminderTime = data.ReminderTime;
                var ActualEnd = data.ActualEnd;
                var ActualStart = data.ActualStart;
                ReminderTime = "截止前 " + ReminderTime + " 分钟";
                var CreatedByName = data.CreatedByName;
                var CreatedOn = data.CreatedOn;
                var Description = data.Description;
                var statusCode = data.StatusCode;
                $(".mission-header2").find(".mission-header-leftlogo p").eq(1).html(Subject);
                $(".missionright-head span").eq(1).html("(" + res.Files.length + ")");
                $('.missionright-body.missionright-body3 .missionright-head>span').eq(1).html('(' + res.Files.length + ')');
                $(".mission").attr("StatusCode", StatusCode);
                $(".missionmession-body .main span").eq(0).html(Subject);
                $(".missionmession-body .main span").eq(1).html(OwningUserName);
                $(".missionmession-body .main span").eq(2).html(ScheduledStart);
                $(".missionmession-body .main span").eq(4).html(ScheduledEnd);
                $(".missionmession-body .main span").eq(3).html(ActualStart);
                $(".missionmession-body .main span").eq(5).html(Description);
                $(".missionmession-body .main span").eq(6).html(PriorityCodeName);
                $(".missionmession-body .main span").eq(6).attr('prioritycode', PriorityCode);
                $(".missionmession-body .main span").eq(7).html(StatusCodeName);
                $(".missionmession-body .main span").eq(7).attr('statuscode', statusCode);
                $(".missionmession-body .main span").eq(8).html(ReminderTime);
                $(".missionmession-body .main span").eq(9).html("从 " + ScheduledStart + " 到 " + ScheduledEnd + " 每天发生");
                $(".missionmession-body .main span").eq(10).html(CreatedByName);
                $(".missionmession-body .main span").eq(11).html(CreatedOn);
                $(".missionmession-body .main span").eq(12).html(CreatedByName);
                $(".missionmession-body .main span").eq(13).html(CreatedOn);
            }
        }
    });
}
 //更改任务状态


function changemissmion(StatusCode, ActualStart, ActualEnd, Remark,ids) {
    var url = window.location.href;
    var id = getQueryString('id');
    if (id == null) {
        id=ids
    }
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=entity.save",
        data: {
            id: id,
            statusCode: StatusCode,
            ActualStart: ActualStart,
            ActualEnd: ActualEnd,
            Remark: Remark,
            objTypeCode: 4200
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {
            console.log(res);
        }
    });
}


finishend()
function finishend() {
    $(".finishend").click(function () {
        if ($(this).hasClass('avtive')) { } else {
            var ids = ''
            var that = this;
            $(".popup-finish").show();
            $(".popup-mask").show(); //获取当天日期

            var day2 = new Date();
            day2.setTime(day2.getTime());
            var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1) + "-" + day2.getDate();
            
            var realitytime = $('.realitytime').html();
            if (!realitytime) {
                ids = $(this).parents('.item-main').find('.miss-xiangqing').attr('activityid')
                realitytime = $(this).parents('.item-main').find('.time').html()
                if (realitytime.indexOf('~') != -1) {
                    realitytime = realitytime.split('~')[0]
                    var realitytime1 = realitytime.split(' ')[1];
                    var realitytime2 = realitytime.split(' ')[2];
                } else {
                    var realitytime1 = realitytime.split(' ')[1];
                    var realitytime2 = realitytime.split(' ')[2];
                }
            } else {
                var realitytime1 = realitytime.split(' ')[0];
                var realitytime2 = realitytime.split(' ')[1];
            }
            
            var hour = day2.getHours();
            var minute = day2.getMinutes();
            $(".finish-time-day").eq(1).find("span").html(s2);
            $(".finish-time-hour").eq(1).find("span").html(hour + ":" + minute);
            $(".finish-time-day").eq(0).find("span").html(realitytime1);
            $(".finish-time-hour").eq(0).find("span").html(realitytime2);
            var that = this;
            $(".finish-time-day").each(function () {
                $(this).click(function () {
                    var that = this;
                    $(".ca").remove();
                    $(this).parents(".popup-body").append('<div class="ca"><div class="ca-head"><p class="ca-date" id="ca-date">' + s2 + '</p><div class="ca-time">' + '<select id="select"></select></div></div>' + '<div id="schedule-box" class="boxshaw"></div><div class="ca-foot">' + '<div class="ca-clear">清除</div><div class="ca-true">确定</div></div></div>');
                    $(".ca #select").append('<option value="' + hour + ":" + minute + '">' + hour + ":" + minute + '</option>');
                    $(".ca #select").append('<option value="00:00">' + "00:00" + '</option>');
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

                    $(".ca-true").click(function () {
                        var time = $("#ca-date").html();
                        var time2 = $(this).parents(".popup-body").find(".ca select").val();
                        $(that).attr("time", time);
                        $(that).find("span").html(time);
                        $(that).next().find("span").html(time2);
                        $(".ca").remove();
                    });
                });
            });
            $(".popup-finish .popup-foot-shur").click(function () {
                $(".popup-finish .popup-foot-shur").off();
                $(that).addClass("avtive");
                if ($(that).find("span").html() == "标记完成") {
                    StatusCode = 2;
                    ActualStart = $(this).parents(".popup").find(".finish-time-day span").eq(0).html() + " " + $(this).parents(".popup").find(".finish-time-hour span").eq(0).html();
                    ActualEnd = $(this).parents(".popup").find(".finish-time-day span").eq(1).html() + " " + $(this).parents(".popup").find(".finish-time-hour span").eq(1).html();
                    Remark = $(this).parents(".popup").find("textarea").val();
                    $(that).find("span").html("已完成");
                    $(that).append('<div class=".img"><img src="/img/cal/23.check_2(12x12).png"></div>');
                    changemissmion(StatusCode, ActualStart, ActualEnd, Remark);
                    $(".othermession-body .rightdiv .main span").eq(0).html("已完成");
                } else if ($(that).find("span").html() == "已完成") {
                    StatusCode = 2;
                    $(that).find("span").html("标记完成");
                    changemissmion(StatusCode, ActualStart, ActualEnd, Remark);
                    $(".othermession-body .rightdiv .main span").eq(0).html("未完成");
                } else {
                    StatusCode = 2;
                    ActualStart = $(this).parents(".popup").find(".finish-time-day span").eq(0).html() + " " + $(this).parents(".popup").find(".finish-time-hour span").eq(0).html();
                    ActualEnd = $(this).parents(".popup").find(".finish-time-day span").eq(1).html() + " " + $(this).parents(".popup").find(".finish-time-hour span").eq(1).html();
                    Remark = $(this).parents(".popup").find("textarea").val();                   
                    changemissmion(StatusCode, ActualStart, ActualEnd, Remark,ids);

                }

                $(".popup-finish").hide();
                $(".popup-mask").hide();
            });
        }
    });
}
$(".mission-header2 select").click(function () {
    $(".oRight").click(function () {
        $(".genggai-div2").hide();
    });
    $(".genggai-div2").toggle();
    return false;
});
$(".popup-main .body-main").height(260);
$(".popup-foot div").eq(0).click(function () {
    $(".popup-mask").hide();
    $(".popup").hide();
});
$(".popup-foot div").eq(1).click(function () {
    $(".popup-mask").hide();
    $(".popup").hide();
}); //任务编辑

$(".mission-header2").find(".bianji").click(function () {
    var id = $(".mission").attr("id");
    $('.popup-mask').show();
    $('#newmission').show();
    $('.newmission-foot .save div').eq(0).hidef()
    $('.newmission-head').html('编辑任务')
    getmiss2(id);
});

function getmiss2(id) {
    $.ajax({
        type: "post",
        url: "/apps/CommandProcessor.ashx?cmd=project.task.get",
        data: {
            id: id
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {
            //console.log(res)
            var data = res.listData[0];
            var Subject = data.Subject;
            var ScheduledEnd = data.ScheduledEnd;
            var ScheduledEnd1 = ScheduledEnd.split(" ")[0];
            var ScheduledEnd2 = ScheduledEnd.split(" ")[1];
            var ScheduledStart = data.ScheduledStart;
            var ScheduledStart1 = ScheduledStart.split(" ")[0];
            var ScheduledStart2 = ScheduledStart.split(" ")[1];
            var OwningUserName = data.OwningUserName;
            var PriorityCodeName = data.PriorityCodeName;
            var StatusCodeName = data.StatusCodeName;
            var ReminderTime = data.ReminderTime;
            var PriorityCode = data.PriorityCode;
            ReminderTime = ReminderTime / 60;
            ReminderTime = "截止前 " + ReminderTime + " 分钟";
            var CreatedByName = data.CreatedByName;
            var CreatedOn = data.CreatedOn;
            var Description = data.Description;
            var StatusCode = data.StatusCode;
            var Description = data.Description;
            var ReminderTime = data.ReminderTime;

            if (ReminderTime != '') {
                $('.tixingcheck').addClass('active');
            }

            $('#description').val(Description);
            $(".pinput3").eq(0).attr("time", ScheduledStart);
            $(".pinput3").eq(1).attr("time", ScheduledEnd);
            $(".missmessage-body input").eq(0).val(Subject);
            $(".missmessage-body .starttime input").eq(0).val(ScheduledStart1);
            $(".missmessage-body select").eq(0).val(ScheduledStart2);
            
            $(".missmessage-body input").eq(2).val(ScheduledEnd1);
            $(".missmessage-body select").eq(1).val(ScheduledEnd2);

            $(".peoplechook input").val(OwningUserName);
            $('#description').val(Description);
            $('#sex').prev().find('span').html(PriorityCodeName)
            $('#Select3').prev().find('span').html(StatusCodeName)
            console.log(PriorityCodeName)
            console.log(StatusCode)
            $(".textarea-div textarea").val(Description);
        }
    });
} //获取评论


var pageNumber = 1;

function commentsgetlist(pageNumber) {
    var url = window.location.href;
    var id = getQueryString('id');

    if (id) {
        $.ajax({
            url: "/apps/CommandProcessor.ashx?cmd=object.comment.getlist",
            data: {
                id: id,
                pageSize: 5,
                pageNumber: pageNumber
            },
            async: true,
            cache: false,
            dataType: "json",
            success: function success(res) {
                //console.log(res)
                if (res.listData) {
                    $(".missionleft-head li").eq(2).find("span").html("(" + res.listData.length + ")");
                    $(".comment-main").remove();

                    for (var i = 0; i < res.listData.length; i++) {
                        var data = res.listData[i];
                        var createdbyname = data.CreatedByName;
                        var createdon = data.CreatedOn;
                        var comment = data.Comment;
                        var commentid = data.CommentId;
                        var LikeQty = data.LikeQty;
                        $(".comment ul").append(" <li class=\"comment-main\" commentid=\"" + commentid + "\">\n                                         <p class=\"name\">\n                                                " + createdbyname + "\n                                            <div class=\"deleteup\">\n                                                <div class=\"deleteup-delete\">\n                                                    <span>\u5220\u9664</span>\n                                                    <span class=\"border\"></span>\n\n                                                </div>\n                                                <div class=\"deleteup-up\">\n                                                    <span>" + LikeQty + "</span>\n                                                    <img src=\"/img/cal/18.\u8D5E(18x18)_1.png\" />\n                                                </div>\n                                            </div>\n                                          </p>\n                                    <p class=\"jieshao\">" + comment + "</p>\n                                   <p class=\"miaoshu\"><span>\u4FE1\u606F\u4E2D\u5FC3</span>&nbsp;&nbsp;&nbsp;<span>" + createdon + "</span></p>\n                                </li>");
                    }

                    var number2 = res.listData.length / 25;
                    var number = parseInt(res.listData.length / 25);

                    if (number2 != number) {
                        number++;
                    }

                    $('.comment .page p').eq(2).html('共' + number + '页');
                    $('.comment .page p').eq(1).attr('number', number);
                } //删除评论


                $(".deleteup-delete").each(function () {
                    $(this).click(function () {
                        var id = $(this).parents(".comment-main").attr("commentid");
                        $(".comment-main").remove();
                        commentdelete(id);
                        commentsgetlist(pageNumber);
                    });
                }); //点赞

                $(".mission .deleteup img").each(function () {
                    $(this).click(function () {
                        var id = $(this).parents(".comment-main").attr("commentid"); //console.log(id)

                        $(this).prev().html(parseInt($(this).prev().html()) + 1);
                        $(this).prop("src", "/img/cal/18.赞(18x18)_2.png");
                        $(this).prop("zhuangtai", "dianzan");
                        $(this).off();
                        $.ajax({
                            url: "/apps/CommandProcessor.ashx?cmd=object.comment.like",
                            data: {
                                id: id,
                                action: "like",
                                ObjTypeCode: 100205
                            },
                            async: true,
                            cache: false,
                            dataType: "json",
                            success: function success(res) {//console.log(res)
                            }
                        });
                    });

                    if (!$(this).prop("zhuangtai")) {
                        $(this).mouseover(function () {
                            $(this).prop("src", "/img/cal/18.赞(18x18)_2.png");
                        }).mouseout(function () {
                            $(this).prop("src", "/img/cal/18.赞(18x18)_1.png");
                        });
                    }
                });
            }
        });
    }
}

commentsgetlist(); //删除评论

function commentdelete(id) {
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=object.comment.delete",
        async: true,
        cache: false,
        dataType: "json",
        data: {
            id: id
        },
        success: function success(res) { }
    });
} //添加评论


function commentadd() {
    $(".writecomment").click(function () {
        $(this).height(160);
        $(this).find("#comment-btn").hide();

        if ($(".comment-foot").length == 0) {
            $(this).find(".textarea").height(138).width("90%").append("<div class=\"comment-foot\"><p>\u8BC4\u8BBA</p></div>");
            $(".comment-foot p").click(function () {
                if ($(".writecomment textarea").val() != "") {
                    var url = window.location.href;
                    var id = getQueryString('id');
                    var comments = $(".writecomment textarea").val();
                    $.ajax({
                        type: "post",
                        url: "/apps/CommandProcessor.ashx?cmd=object.comment.add",
                        async: true,
                        cache: false,
                        dataType: "json",
                        data: {
                            objectid: id,
                            ObjTypeCode: 4200,
                            comments: comments
                        },
                        success: function success(res) {
                            $(".comment-main").remove();
                            commentsgetlist();
                        }
                    });
                    $(".writecomment").height(66);
                    $(".textarea").height(44).width("80%");
                    $("textarea").height(24);
                    $(".comment-foot").remove();
                    $("#comment-btn").show();
                }

                return false;
            });
        }

        $(this).find("textarea").height(80).width("90%");
    });
}

commentadd(); //分页查询

$(".comment .page>p").eq(3).find("input").val(1);
$(".comment .page>p").eq(0).click(function () {
    pageNumber--;

    if (pageNumber < 1) {
        pageNumber = 1;
    }

    commentsgetlist(pageNumber);
    $(".comment .page>p").eq(3).find("input").val(pageNumber);
});
$(".comment .page>p").eq(1).click(function () {
    if (pageNumber < $(this).attr('number')) {
        pageNumber++;
        commentsgetlist(pageNumber);
        $(".comment .page>p").eq(3).find("input").val(pageNumber);
    }
});
$(".comment .page>p").eq(4).click(function () {
    pageNumber = $(".comment .page>p").eq(3).find("input").val();
    commentsgetlist(pageNumber);
}); //人员分页
//更改状态

$(".genggai").click(function () {
    $("#popup-zhuangtaichange").show();
    $(".popup-mask").show();
    $('#popup-zhuangtaichange').find('.body-main span').html($('#statuscode').html());
    $('#popup-zhuangtaichange').find('.body-main span').attr('statuscode', $('#statuscode').attr('statuscode'));
    $(".popup-exit").click(function () {
        $(this).parent().hide();
        $(".popup-mask").hide();
    });
    $("#popup-zhuangtaichange .body-main").click(function () {
        $("#popup-zhuangtaichange .popup-popup").show();
        $("#popup-zhuangtaichange .popup-popup div").each(function () {
            $(this).click(function () {
                $("#popup-zhuangtaichange .body-main span").html($(this).html());
                $("#popup-zhuangtaichange .body-main span").attr("StatusCode", $(this).attr("StatusCode"));
                $("#popup-zhuangtaichange .popup-popup div").removeClass("active");
                $(this).addClass("active");
                $(this).parent().hide();
            });
        });
    }); //取消

    $("#popup-zhuangtaichange .popup-foot div").eq(1).click(function () {
        $("#popup-zhuangtaichange").hide();
        $(".popup-mask").hide();
    }); //确定

    $("#popup-zhuangtaichange .popup-foot div").eq(0).click(function () {
        var StatusCode = $("#popup-zhuangtaichange .body-main span").attr("StatusCode");
        changemissmion(StatusCode);
        $("#popup-zhuangtaichange").hide();
        $(".popup-mask").hide();
    });
}); //更改优先级

$(".genggai-div2 div").eq(1).click(function () {
    $('#popup-youxianjichange').find('.body-main span').html($('#prioritycode').html());
    $('#popup-youxianjichange').find('.body-main span').attr('prioritycode', $('#prioritycode').attr('prioritycode'));
    $(".genggai-div2").hide();
    $("#popup-youxianjichange").show();
    $(".popup-mask").show();
    $(".popup-exit").click(function () {
        $(this).parent().hide();
        $(".popup-mask").hide();
    });
    $("#popup-youxianjichange .body-main").click(function () {
        $("#popup-youxianjichange .popup-popup").show();
        $("#popup-youxianjichange .popup-popup div").each(function () {
            $(this).click(function () {
                $("#popup-youxianjichange .body-main span").html($(this).html());
                $("#popup-youxianjichange .body-main span").attr("PriorityCode", $(this).attr("PriorityCode"));
                $("#popup-youxianjichange .popup-popup div").removeClass("active");
                $(this).addClass("active");
                $(this).parent().hide();
            });
        });
    }); //取消

    $("#popup-youxianjichange .popup-foot div").eq(1).click(function () {
        $("#popup-youxianjichange").hide();
        $(".popup-mask").hide();
    }); //确定

    $("#popup-youxianjichange .popup-foot div").eq(0).click(function () {
        var PriorityCode = $("#popup-youxianjichange .body-main span").attr("PriorityCode");
        changemissmion2(PriorityCode);
        $("#popup-youxianjichange").hide();
        $(".popup-mask").hide();
    });
}); //更改任务优先级

function changemissmion2(PriorityCode) {
    var url = window.location.href;
    var id = getQueryString('id');
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=project.task.edit",
        data: {
            id: id,
            PriorityCode: PriorityCode,
            objTypeCode: 4200
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {//console.log(res)
        }
    });
} //编辑留言




function changemissmion3(Description) {
    var url = window.location.href;
    var id = getQueryString('id');
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=project.task.edit",
        data: {
            id: id,
            Description: Description,
            objTypeCode: 4200
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {//console.log(res)
        }
    });
} //删除任务


$(".shanchu").click(function () {
    $(".delete-mask").show();
    $(".delete-shur").show();
    $(".delete-shur-foot div").eq(0).off();
    $(".delete-shur-foot div").eq(0).click(function () {
        $(document).off(); //删除任务

        var activeid = $(".mission").attr("id");
        addTaskdelete(activeid);
        window.history.back(-1);
    });
    $(".delete-shur-foot div").eq(1).click(function () {
        $(".delete-mask").hide();
        $(".delete-shur").hide();
    });
    $(".delete-shur .popup-exit").click(function () {
        $(".delete-mask").hide();
        $(".delete-shur").hide();
    });
    return false;
});

function addTaskdelete(activeid) {
    var url = "/apps/HrProcessor.ashx?cmd=project.task.delete";
    jQuery.ajax({
        data: {
            id: activeid
        },
        async: true,
        cache: false,
        dataType: "json",
        error: function error(request, textStatus, errorThrown) { },
        success: function success(res) {//console.log(res)
        },
        url: url
    });
}

$(".popup-finish .popup-exit").click(function () {
    $(".popup-finish").hide();
    $(".popup-mask").hide();
}); //获取人员

$('.people-head li').click(function () {
    getpeople($(this).attr('statusCode'));
}); //人员分页

var pageNumber2 = 1;
$(".people .page>p").eq(3).find("input").val(1);
$(".people .page>p").eq(0).click(function () {
    pageNumber2--;

    if (pageNumber2 < 1) {
        pageNumber2 = 1;
    }

    getpeople($(this).parents('.people').find('.people-head li.active').attr('statuscode'), pageNumber2);
    $(".people .page>p").eq(3).find("input").val(pageNumber2);
});
$(".people .page>p").eq(1).click(function () {
    if (pageNumber2 < $(this).attr('number')) {
        pageNumber2++;
        getpeople($(this).parents('.people').find('.people-head li.active').attr('statuscode'), pageNumber2);
        $(".people .page>p").eq(3).find("input").val(pageNumber2);
    }
});
$(".people .page>p").eq(4).click(function () {
    pageNumber = $(".people .page>p").eq(3).find("input").val();
    getpeople($(this).parents('.people').find('.people-head li.active').attr('statusCode'), pageNumber2);
});

function getpeople(statusCode, pageNumber2) {
    var url = window.location.href;
    var id = getQueryString('id');
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=project.task.executor.getlist",
        data: {
            activityid: id,
            pageSize: 25,
            pageNumber: pageNumber2,
            statusCode: statusCode
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {
            console.log(res);
            $('.people-body ul li').remove();

            for (var i = 0; i < res.listData.length; i++) {
                var data = res.listData[i];
                var FullName = data.FullName;
                $('.people-body ul').append("<li>\n                                                <p class=\"name\">" + FullName + "</p>\n                                                <p class=\"miaoshu\"></p>\n                                            </li>");
            }

            $('.dayin span').html('打印人员' + '(' + res.listData.length + ')');
            var number2 = res.listData.length / 25;
            var number = parseInt(res.listData.length / 25);

            if (number2 != number) {
                number++;
            }

            $('.people .page p').eq(2).html('共' + number + '页');
            $('.people .page p').eq(1).attr('number', number);
        }
    });
}

function removeiframe() {
    $('#iframe').hide();
}

function addplays(userids) {
    var url = window.location.href;
    var id = getQueryString('id');
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=project.task.executor.add",
        data: {
            taskid: id,
            userids: userids
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {
            window.success('邀请参与人成功')
            $('#changeDiv').hide()
        }
    });

} //文件上传


function postFile() {
    formData.append("files", fs[i]);
}

$('.popup-finish .popup-foot div').eq(1).click(function () {
    $('.popup').hide();
    $('.popup-mask').hide();
});