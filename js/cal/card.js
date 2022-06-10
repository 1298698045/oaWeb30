
//获取屏幕高度
var clientHeight;

function getClientHeight() {
    if (document.body.clientHeight && document.documentElement.clientHeight) {
        clientHeight = document.body.clientHeight < document.documentElement.clientHeight ? document.body.clientHeight : document.documentElement.clientHeight;
    } else {
        clientHeight = document.body.clientHeight > document.documentElement.clientHeight ? document.body.clientHeight : document.documentElement.clientHeight;
    }

    return clientHeight;
}

$(".ppp img").prop("src", "/img/cal/22.filterList_1(14x14).png");
$(".popup-exit").click(function () {
    $(this).parent().hide();
    $(".delete-mask").hide();
});
$(".mission-hearder-right>p").click(function () {
    $("#newmission").show();
    $(".mission-header").hide();
    $(".mission-header4").show();
    $("#qqqq").hide();
    $("#allmission").hide();
    $(".mission").hide();
    $(".invite").hide();
});

function toxiangqing() {
    $(".item-main").each(function () {
        $(this).click(function () {
            var activityid = $(this).find(".miss-xiangqing").attr("activityid");
            var projectId = getQueryString('projectId')
            window.location.href = "/cal/taskView.aspx?" + "id=" + activityid + '&t=00T' + '&projectId=' + projectId;
        });
    });
}

$(".delete-shur-foot div").click(function () {
    $(".delete-mask").hide();
    $(".delete-shur").hide();
    $("#card .miss-bianji").remove();
});
$(".delete-bianji-foot div").click(function () {
    $(".delete-mask").hide();
    $(".delete-bianji").hide();
    $("#card .miss-bianji").remove();
});
$("#allmission").hide();
$("#newmission").hide();
$(".mission").hide();
$(".invite").hide();
$(".mission-header3").hide();
$(".mission-header4").hide();
$(".mission-header2").hide();
$(".mission-header2 .mission-header-right p,.yaoqingchakanzhe,.mission-header2 .mission-header-right .end").each(function () {
    $(this).click(function () {
        $(".mission-header2 .mission-header-right p,.yaoqingchakanzhe,.mission-header2 .mission-header-right .end").removeClass("active");
        $(this).addClass("active");
    });
});
var a = 0;

function chookjinjidu() {
    //选择紧急度
    $(".item-main-border").each(function () {
        $(this).click(function () {
            $(".itemborder-size").remove();
            $(this).append('<div class="itemborder-size card-popup">' + '<li><p class="itemborder-sizel" tit="item-borderl">低</p><img src="/img/cal/checkedgrey.png"></img></li>' + '<li><p class="itemborder-sizem" tit="item-borderm">中</p><img src="/img/cal/checkedgrey.png"></img></li>' + '<li><p class="itemborder-sizeh" tit="item-borderh">高</p><img src="/img/cal/checkedgrey.png"></img></li>' + '</div>');
            $(".itemborder-size li").each(function () {
                if ($(this).find("p").attr("tit") == $(this).parent().parent().attr("border")) {
                    $(this).addClass("active");
                }
            }); //点击其他区域隐藏弹出框

            $(document).mousedown(function (e) {
                if ($(e.target).parents(".itemborder-size").length == 0) {
                    $(".itemborder-size").hide();
                }
            });
            offset = $(".itemborder-size").offset();

            if (offset) {
                var top = offset.top;
                var left = offset.left;

                if ($(this).parents(".item").find(".item-sc").height() > 100) {
                    if (top > $(this).parents(".item").find(".item-sc").height() + 60) {
                        $(".itemborder-size").offset({
                            top: top - 50,
                            left: left
                        });
                    }
                } else if (top > $(this).parents(".item").find(".item-sc").height() + 50) {
                    $(this).parents(".item").find(".item-sc").css("overflow", "visible");
                }
            }

            cardbordercheck();
            $(".itemborder-size").children("li").each(function () {
                $(this).click(function () {
                    $(this).addClass("active");
                    var border = $(this).children("p").attr("tit");
                    $(this).parent().parent().removeClass();
                    $(this).parent().parent().addClass("item-main-border");
                    $(this).parent().parent().addClass(border);
                    $(this).parent().parent().attr("border", border);
                    $(this).parent().remove();
                    return false;
                });
            });
            return false;
        });
    });
}

chookjinjidu();
var b = 0;

function newmission() {
    //新建任务
    $(".new").each(function () {
        $(this).click(function () {
            $(".miss-bianji").remove();
            $(".liebiaocaidan1").remove();
            $(".new").show();
            $(".new-add").remove();
            $(this).parents(".item").attr("owningid", UserId);
            $(this).parents(".item").attr("name", FullName);
            $(this).before('<div class="new-add card-popup name="' + FullName + '">' + '<p class="new-addinput"><input type="text" id="na" placeholder="任务标题"></p>' + '<p class="username">' + '<img src="/img/cal/1.png">' + '<span>' + FullName + '</span>' + '<img src="/img/cal/01.delete.png" class="hideimg"/>' + '</p>' + '<p id="asd" class="timechook1">' + '<img src="/img/cal/3.PNG">' + '<span>设置开始时间</span>' + '<img src="/img/cal/01.delete.png" class="hideimg"/>' + '</p>' + '<p class="timechook1">' + '<img src="/img/cal/3.PNG">' + '<span>设置结束时间</span>' + '<img src="/img/cal/01.delete.png" class="hideimg"/>' + '</p>' + '<p class="colocheck">' + '<img src="/img/cal/5.PNG">' + '<input type="button" value="低">' + '</p>' + '<p class="moremiss">' + '<img src="/img/cal/4.PNG">' + '<span>更多</span>' + '</p>' + '<div class="fengexian"></div>' + '<p id="chuangjian"class="newlistadd">创建</p>' + '</div>');
            var that = this;
            $(this).parent().find(".new").hide();
            var thatheight = $(that).prev().prev().height();
            getClientHeight();
            var newheight = clientHeight - thatheight - 330;
            $(document).mousedown(function (e) {
                if ($(e.target).parents(".new-add").length == 0 && $(e.target).parents(".ca").length == 0 && $(e.target).parents(".card-people").length == 0) {
                    console.log(111);
                    $(".new-add").hide();
                    $(".new").show();
                }
            });

            if (clientHeight - thatheight - 330 < 300) {
                if (newheight < 300) {
                    $(that).prev().prev().height(thatheight - 300 + newheight);

                    if (thatheight - 300 + newheight < 0) {
                        $(that).prev().prev().height(0);
                    }

                    var thatheightindex = 0;
                    $(document).mousedown(function (e) {
                        if ($(e.target).parents(".new-add").length == 0 && $(e.target).parents(".ca").length == 0 && $(e.target).parents(".card-people").length == 0) {
                            $(".new-add").hide();
                            $(".new").show();

                            if (thatheightindex == 0) {
                                if (clientHeight - thatheight - 330 < 300) {
                                    $(that).prev().prev().height(thatheight);
                                }

                                thatheightindex = 1;
                            }
                        }
                    });
                }
            } //选择时间


            $(this).parents(".item").find(".timechook1").click(function () {
                //获取当天日期
                var day2 = new Date();
                day2.setTime(day2.getTime());
                var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1) + "-" + day2.getDate();
                var that = this;
                $(this).parents(".item").append('<div class="ca"><div class="ca-head"><p class="ca-date" id="ca-date">' + s2 + '</p><div class="ca-time">' + '<select><option value="00:00">00:00</option></select></div></div>' + '<div id="schedule-box" class="boxshaw"></div><div class="ca-foot">' + '<div class="ca-clear">清除</div><div class="ca-true">确定</div></div></div>'); //日历位置

                offset = $(".new-add").offset();

                if (offset) {
                    var top = offset.top;

                    if (top > 200) {
                        if (top > $(this).parents(".item").find(".item-sc").height() + 60) {
                            $(".ca").css({
                                top: 50
                            });
                        }
                    }
                }

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
                    var time = $("#ca-date").html() + " " + $(this).parents(".item").find(".ca select").val();
                    $(that).attr("time", time);
                    $(".ca").remove();
                    $(that).find("span").html(time);
                    $(that).addClass("delete-maskp");
                    $("#asd.delete-maskp .hideimg").click(function () {
                        $(this).prev().html("设置开始时间");
                        $(this).parent().removeClass("delete-maskp");
                        return false;
                    });
                    $(".timechook1").eq(1).find(".hideimg").click(function () {
                        $(this).prev().html("设置结束时间");
                        $(this).parent().removeClass("delete-maskp");
                        return false;
                    });
                });
                return false;
            }); //选择紧急度

            var itembordercolo = 0;
            $("#card .colocheck input").each(function () {
                $(this).click(function () {
                    if ($(this).parent().find(".itemborder-size").length == 0) {
                        $(this).parent().append('<div class="itemborder-size card-popup">' + '<li><p class="itemborder-sizel" tit="item-borderl">低</p><img src="/img/cal/checkedgrey.png"></img></li>' + '<li><p class="itemborder-sizem" tit="item-borderm">中</p><img src="/img/cal/checkedgrey.png"></img></li>' + '<li><p class="itemborder-sizeh" tit="item-borderh">高</p><img src="/img/cal/checkedgrey.png"></img></li>' + '</div>');
                    } else {
                        $(this).parent().find(".itemborder-size").show();
                    }

                    cardbordercheck();
                    $(this).parent().find(".itemborder-size p").each(function () {
                        $(this).click(function () {
                            itembordercolo = $(this).attr("tit");
                            var valuee = $(this).html();
                            $(this).parent().parent().find("li").removeClass("active");
                            $(this).parent().addClass("active");
                            $(this).parent().parent().parent().find("input").val(valuee);
                            $(this).parent().parent().parent().attr("tit", itembordercolo);
                            $(this).parent().parent().parent().removeClass();
                            $(this).parent().parent().parent().addClass("colocheck");
                            $(this).parent().parent().parent().addClass(itembordercolo);
                            $(this).parent().parent().hide();
                        });
                    });
                    return false;
                });
            }); //更多

            $(".moremiss").click(function () {
                $("#newmission").show();
                $('.popup-mask').show();
                $("#newmission input").val('')
                $('.newmission-head').html('新建任务')
                $(".mission-header").hide();
                $(".mission-header4").show();
                $("#qqqq").hide();
                $("#allmission").hide();
                $(".mission").hide();
                $(".invite").hide();
            }); //分配人

            $("#card .username span").click(function () {
                var name;
                $("#card .card-people").remove();

                if ($(this).parents(".item").attr("NAME")) {
                    name = $(this).parents(".item").attr("NAME");
                }

                $(this).parent().parent().parent().append('<div class="card-people">' + '<div class="sousuo">' + '<p><input type="text" placeholder="搜索"></p>' + '</div>' + '<ul>' + '</ul>' + '<div class="peoplechooked"><div class="peoplechooked-head">被分配人</div>' + '<div class="peoplechooked-body"><img src="/img/cal/1.png"><span class="spann1">' + name + '</span></div></div>' + '<div class="peoplechooktj"><div class="peoplechooked-head">推荐</div>' + '<div class="peoplechooked-body peoplechooked-body2"></div></div>' + '<div class="peoplechookbm">按部门/组添加</div>' + '<div class="peoplechookfg"></div>' + '<div class="queding">确定</div>' + '</div>'); //最近使用成员

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
                        }

                        $(".peoplechooked-body2>div").each(function () {
                            $(this).click(function () {
                                $(".peoplechooked-body").eq(0).find("span").html($(this).find("span").html());
                                $(".peoplechooked-body").eq(0).find("img").prop("src", $(this).find("img").prop("src"));
                                $(this).parents(".item").attr("NAME", $(this).find("span").html());
                                $(this).parents(".item").attr("owningid", $(this).attr("id"));
                            });
                        });
                    }
                });
                $(document).mousedown(function (e) {
                    if ($(e.target).parents(".card-people").length == 0) {
                        $(".card-people").remove();
                    }
                });
                searchusers3();
                $(".queding").click(function () {
                    var NAME = $(this).parents(".item").attr("NAME");
                    $(this).parents(".item").find(".username span").html(NAME);
                    $(this).parents(".item").find(".username").addClass("delete-maskp");
                    $(this).parent().remove();
                    $(".username.delete-maskp .hideimg").click(function () {
                        $(this).prev().html("被分配人");
                        $(this).parent().removeClass("delete-maskp");
                        return false;
                    });
                    return false;
                });
                return false;
            });
            namer2 = setInterval(function () {
                if ($("#na").val() != "") {
                    clearInterval(namer2);
                    $("#chuangjian").click(function () {
                        $(document).off();
                        $(that).parent().find(".new").show();
                        getClientHeight();

                        if (clientHeight - thatheight - 330 < 300) {
                            if (newheight < 300) {
                                $(this).parents(".item").find(".item-sc").height(thatheight + 100);
                            }
                        }

                        var scheduledstart = "";

                        if ($(".timechook1").eq(0).attr("time")) {
                            scheduledstart = $(".timechook1").eq(0).attr("time");
                        }

                        var scheduledend = "";

                        if ($(".timechook1").eq(1).attr("time")) {
                            scheduledend = "~" + $(".timechook1").eq(1).attr("time");
                        }

                        var name = $("#na").prop("value");
                        var owningname = $(".username span").html();
                        var listid = $(this).parents(".item").attr("titl");
                        $(this).parent().prev().append('<div class="item-main">' + '<div class="item-main-border' + " " + itembordercolo + '"></div>' + '<p class="name">' + '<span class="miss-xiangqing">' + name + '</span>' + '<span class="sanjiao">' + '<img src="/img/cal/20.PNG"  />' + '</span>' + '</p>' + '<p class="img">' + '<img src="/img/cal/1.png">' + '<span>' + owningname + '</span>' + '</p>' + '<p class="time">' + scheduledstart + scheduledend + '</p>' + '</div>');
                        addTaskaddq(listid);
                        toxiangqing();
                        chookjinjidu();
                        missionbianji();
                        $(this).parent().remove(); //选择紧急度
                    });
                    $("#chuangjian").css({
                        backgroundColor: "#108af9",
                        color: "#ffffff"
                    });
                } else {
                    $("#chuangjian").css({
                        backgroundColor: "#d9d9d9",
                        color: "#ffffff"
                    });
                }
            }, 500);
            return false;
        });
    });
}

function newlist() {
    //创建任务列表
    $("#newlist").click(function () {
        $(".newlist .newlistadd").off();
        $(".newlist .newlist-name3 input").val("");
        $(".newlist .newlist-name3 input").prop("placeholder", "列表名称");
        $(".newlist .newlist-add").toggle();
        $(document).mouseup(function (e) {
            if ($(e.target).parents(".newlist-add").length == 0) {
                $(".newlist-add").hide();
            }
        });
        namer3 = setInterval(function () {
            if ($(".newlist .newlist-name3 input").val() != "") {
                clearInterval(namer3);
                $(".newlist .newlistadd").off()
                $(".newlist .newlistadd").click(function () {
                    var name = $(".newlist .newlist-name3 input").val();
                    addTasklist(name);
                    $(".newlist .newlist-add").hide();
                    c = 0;
                    var name = $(".newlist .newlist-name3 input").val();
                    $(".main .newlist").before('<div class="item">' + '<div class="item-head">' + '<p class="name">' + name + '(0)</p>' + '<p class="more">...</p>' + '</div>' + '<div class="item-sc">' + '</div>' + '<div class="new">' + '<p>' + '<img src="/img/cal/2.PNG">' + '</p>' + '</div>' + '</div>');
                    $("#card .main").width($("#card .main").width() + 300);
                    newmission();
                    $(".newlist-add img").mouseover(function () {
                        $(this).attr("src", "/img/cal/closeblue.png");
                    }).mouseout(function () {
                        $(this).attr("src", "/img/cal/closegray.png");
                    }).click(function () {
                        $(".newlist-add").hide();
                    });
                    $("#card .new").mouseover(function () {
                        $(this).find("img").attr("src", "/img/cal/13.add_2(16x16).png");
                    }).mouseout(function () {
                        $(this).find("img").attr("src", "/img/cal/13.add_1(16x16).png");
                    });
                });
                $(".newlist .newlistadd").css({
                    backgroundColor: "#108af9",
                    color: "#ffffff"
                });
            } else {
                $(".newlist .newlistadd").css({
                    backgroundColor: "#d9d9d9",
                    color: "#ffffff"
                });
            }
        }, 500);
    });
}

$(".item").each(function () {
    //$(this).mouseover(function () {
    $(this).children(".item-sc").css({
        overflowY: "auto"
    }); // }).mouseout(function () {
    //    $(this).children(".item-sc").css({
    //       overflowY: "hidden"
    //   })
    // })
   
});
$("#newlist").mouseover(function () {
    $(this).find(".imgg").attr("src", "/img/cal/13.add_2(16x16).png");
}).mouseout(function () {
    $(this).find(".imgg").attr("src", "/img/cal/13.add_1(16x16).png");
});
$(".newlist-add img").mouseover(function () {
    $(this).attr("src", "/img/cal/closeblue.png");
}).mouseout(function () {
    $(this).attr("src", "/img/cal/closegray.png");
}).click(function () {
    $(".newlist-add").hide();
});
$("#card .new").mouseover(function () {
    $(this).find("img").attr("src", "/img/cal/13.add_2(16x16).png");
}).mouseout(function () {
    $(this).find("img").attr("src", "/img/cal/13.add_1(16x16).png");
});
var borderWidth1 = 1;
var borderWidth2 = 1;
$(".item-main").each(function () {
    $(this).mouseover(function () {
        borderWidth1 = $(this).find(".item-main-border").css("borderWidth");
        borderWidth2 = $(this).find(".item-main-border").css("height");
        $(this).find(".item-main-border").css({
            borderWidth: "6px",
            height: "80px"
        });
    }).mouseout(function () {
        $(this).find(".item-main-border").css({
            borderWidth: "2px",
            height: "84px"
        });

        if ($(this).find(".item-main-border").css("margin") == "1px") {
            $(this).find(".item-main-border").css({
                borderWidth: "0"
            });
        }
    });
});
$(".sousuo").each(function () {
    $(this).click(function () {
        $(".sousuo").removeClass("active");
        $(this).addClass("active");
    });
});
$(".shituu1").mouseover(function () {
    $(".shituu1 .img1").prop("src", "/img/cal/settings_2.png");
}).mouseout(function () {
    $(".shituu1 .img1").prop("src", "/img/cal/settings_1.png");
});
$(".neww").mouseover(function () {
    $(".neww img").prop("src", "/img/cal/14.refresh_2(14x14).png");
}).mouseout(function () {
    $(".neww img").prop("src", "/img/cal/refresh.png");
});
chookjinjidu();
newmission();
$(".item").each(function () {
    //$(this).mouseover(function () {
    $(this).children(".item-sc").css({
        overflowY: "auto"
    }); // }).mouseout(function () {
    //    $(this).children(".item-sc").css({
    //       overflowY: "hidden"
    //   })
    // })
});
$("#newlist").mouseover(function () {
    $(this).find(".imgg").attr("src", "/img/cal/13.add_2(16x16).png");
}).mouseout(function () {
    $(this).find(".imgg").attr("src", "/img/cal/13.add_1(16x16).png");
});
$(".newlist-add img").mouseover(function () {
    $(this).attr("src", "/img/cal/closeblue.png");
}).mouseout(function () {
    $(this).attr("src", "/img/cal/closegray.png");
}).click(function () {
    $(".newlist-add").hide();
});
$("#card .new").mouseover(function () {
    $(this).find("img").attr("src", "/img/cal/13.add_2(16x16).png");
}).mouseout(function () {
    $(this).find("img").attr("src", "/img/cal/13.add_1(16x16).png");
});
var borderWidth1 = 1;
var borderWidth2 = 1;
$(".item-main").each(function () {
    $(this).mouseover(function () {
        borderWidth1 = $(this).find(".item-main-border").css("borderWidth");
        borderWidth2 = $(this).find(".item-main-border").css("height");
        $(this).find(".item-main-border").css({
            borderWidth: "6px",
            height: "80px"
        });
    }).mouseout(function () {
        $(this).find(".item-main-border").css({
            borderWidth: "2px",
            height: "84px"
        });

        if ($(this).find(".item-main-border").css("margin") == "1px") {
            $(this).find(".item-main-border").css({
                borderWidth: "0"
            });
        }
    });
});
$(".sousuo").each(function () {
    $(this).click(function () {
        $(".sousuo").removeClass("active");
        $(this).addClass("active");
    });
});
$(".shituu1").mouseover(function () {
    $(".shituu1 .img1").prop("src", "/img/cal/settings_2.png");
}).mouseout(function () {
    $(".shituu1 .img1").prop("src", "/img/cal/settings_1.png");
});
$(".neww").mouseover(function () {
    $(".neww img").prop("src", "/img/cal/14.refresh_2(14x14).png");
}).mouseout(function () {
    $(".neww img").prop("src", "/img/cal/refresh.png");
});
listcaidan();

function listcaidan() {
    $("#card .more").each(function () {
        $(this).click(function () {
            //more click
            if ($(this).parents(".item").find(".liebiaocaidan1").length == 0) {
                $(this).parent().parent().append('<div class="liebiaocaidan liebiaocaidan1 card-popup">' + '<div class="liebiaocaidan-head">' + '<span>列表菜单</span>' + '<img src="/img/cal/closegray.png" class="exit" alt="" style="width: 14px;height:14px;">' + '</div>' + '<div class="liebiaocaidan-body">' + '<li><img src="/img/cal/12.edit_1(14x14).png" alt="" style="width: 14px;height:14px;">' + '<span>编辑列表</span></li>' + '<li><img src="/img/cal/13.add_1(16x16).png" alt="" style="width: 14px;height:14px;">' + '<span>在此后添加新列表</span></li>' + '<li><img src="/img/cal/23.111(18x18)_1.png" alt="" style="width: 14px;height:14px;">' + '<span>删除列表</span></li>' + '</div>' + '</div>');
                $(document).mouseup(function (e) {
                    if ($(e.target).parents(".liebiaocaidan").length == 0 && $(e.target).parents(".more").length == 0) {
                        $(".liebiaocaidan").hide();
                    }
                });
                $(".liebiaocaidan-head .exit").mouseover(function () {
                    $(this).attr("src", "/img/cal/closeblue.png");
                }).mouseout(function () {
                    $(this).attr("src", "/img/cal/closegray.png");
                });
            } else {
                $(this).parents(".item").find(".liebiaocaidan1").show();
            } //删除功能


            $(this).parent().parent().find(".exit").click(function () {
                $(".liebiaocaidan").hide();
                return false;
            }); //编辑功能

            $(this).parent().parent().find(".liebiaocaidan-body li").eq(0).click(function () {
                var listname = $(this).parents(".item").attr("listname");
                $(".liebiaocaidan1").hide();

                if ($(this).parents(".item").find(".liebiaocaidan2").length == 0) {
                    $(this).parents(".item").append('<div class="liebiaocaidan liebiaocaidan2 card-popup">' + '<div class="liebiaocaidan-head">' + '<img src="/img/cal/return.png" class="returnimg" alt="" style="width: 14px;height:14px;">' + '<span>编辑列表</span>' + '<img src="/img/cal/closegray.png" class="exit" alt="" style="width: 14px;height:14px;">' + '</div>' + '<div class="bianjiliebiao-body">' + '<p><input type="text" value="' + listname + '"></p>' + '</div><div class="bianjiliebiao-save">' + '<p><input type="button" value="保存"></p>' + '</div>' + '</div>');
                } else {
                    $(this).parents(".item").find(".liebiaocaidan2").show();
                }

                $(".liebiaocaidan-head .exit").mouseover(function () {
                    $(this).attr("src", "/img/cal/closeblue.png");
                }).mouseout(function () {
                    $(this).attr("src", "/img/cal/closegray.png");
                });
                $(".returnimg").off();
                $(".returnimg").click(function () {
                    $(this).parents(".item").find(".liebiaocaidan1").show();
                    $(".liebiaocaidan2").hide();
                    $(".liebiaocaidan3").hide();
                    $(".liebiaocaidan4").hide();
                });
                $(this).parents(".item").find(".exit").click(function () {
                    $(".liebiaocaidan").hide();
                    return false;
                }); //编辑保存

                timer = setInterval(function () {
                    if ($(".bianjiliebiao-body p input").eq(0).val() != "") {
                        $(".bianjiliebiao-save p").css({
                            backgroundColor: "#108af9",
                            color: "#ffffff"
                        });
                        $(".bianjiliebiao-save").click(function () {
                            clearInterval(timer);
                            var name4 = $(this).parent().find(".bianjiliebiao-body p input").val();
                            $(this).parent().parent().children(".item-head").children(".name").text(name4);
                            $(this).parent().remove();
                            return false;
                        });
                    } else {
                        $(".bianjiliebiao-save p").css({
                            backgroundColor: "#d9d9d9",
                            color: "#ffffff"
                        });
                    }
                }, 500);
                $(".bianjiliebiao-save").off()
                $(".bianjiliebiao-save").click(function () {
                    var name = $(this).parents(".liebiaocaidan2").find(".bianjiliebiao-body p input").val();
                    console.log(name)
                    var id = $(this).parents(".item").attr("titl");
                    addTasklist2(id, name);
                });
                return false;
            }); //删除列表

            $(this).parent().parent().find(".liebiaocaidan-body li").eq(2).click(function () {
                $(".liebiaocaidan1").hide();
                var that = this;

                if ($(this).parents(".item").find(".liebiaocaidan3").length == 0) {
                    $(this).parents(".item").append('<div class="liebiaocaidan liebiaocaidan3 card-popup">' + '<div class="liebiaocaidan-head">' + '<img src="/img/cal/return.png" class="returnimg" alt="" style="width: 14px;height:14px;">' + '<span>删除列表</span>' + '<img src="/img/cal/closegray.png" class="exit" alt="" style="width: 14px;height:14px;">' + '</div>' + '<div class="bianjiliebiao-body bianjiliebiao-body2">' + '<span>删除列表将彻底清空此列表上的所有任务，请确定是否要删除整个列表?</span>' + '</div><div class="bianjiliebiao-save bianjiliebiao-save2">' + '<p><input type="button" value="确定"></p>' + '</div>' + '</div>');
                } else {
                    $(this).parents(".item").find(".liebiaocaidan3").show();
                }

                $(".liebiaocaidan-head .exit").mouseover(function () {
                    $(this).attr("src", "/img/cal/closeblue.png");
                }).mouseout(function () {
                    $(this).attr("src", "/img/cal/closegray.png");
                });
                $(".returnimg").off();
                $(".returnimg").click(function () {
                    $(this).parents(".item").find(".liebiaocaidan1").show();
                    $(".liebiaocaidan2").hide();
                    $(".liebiaocaidan3").hide();
                    $(".liebiaocaidan4").hide();
                });
                $(this).parents(".item").find(".exit").click(function () {
                    $(".liebiaocaidan").hide();
                    return false;
                });
                $(".bianjiliebiao-save2 p").click(function () {
                    var id = $(this).parents(".item").attr("titl");
                    deleteTasklist(id);
                    $(this).parents(".item").remove();
                });
                return false;
            }); //添加新列表
            $(this).parent().parent().find(".liebiaocaidan-body li").eq(1).click(function () {
                $(".liebiaocaidan1").hide();
                var that = this;

                if ($(this).parents(".item").find(".liebiaocaidan4").length == 0) {
                    $(this).parents(".item").append(`<div class=" liebiaocaidan newlist-add liebiaocaidan4 card-popup">
                        <p class="newlist-name2">新建任务列表
                            <img src="/img/cal/closegray.png" style="width: 14px; height:14px;margin-top: 5px;margin-right:20px">
                        </p>
                        <p class="newlist-name3"><input type="text" placeholder="列表名称"></p>
                        <div class="fengexian"></div>
                        <p class="newlistadd" style="background-color: rgb(217, 217, 217); color: rgb(255, 255, 255);">创建</p>
                    </div>`);
                    $(this).parents(".item").find('.liebiaocaidan4').show()
                    $(this).parents(".item").find('.liebiaocaidan4 .newlist-name2 img').click(function () {
                        $(this).parents(".item").find('.liebiaocaidan4').hide()
                    })
                    $(this).parents(".item").find('.liebiaocaidan4 .newlist-name3 input').keyup(function () {
                        if ($(this).val().length!=0) {
                            $(this).parent().next().next().css({
                                backgroundColor: "#108af9",
                                color: "#ffffff"
                            });
                            $(this).parent().next().next().click(function () {
                                var name4 = $(this).prev().prev().find('input').val();

                                return false;
                            });
                        } else {
                            $(this).parent().next().next().off()
                            $(this).parent().next().next().css({
                                backgroundColor: "#d9d9d9",
                                color: "#ffffff"
                            });
                        }
                    })
                    $(this).parents(".item").find('.liebiaocaidan4 .newlistadd').click(function () {
                        var name = $(this).parents(".item").find('.liebiaocaidan4 .newlist-name3 input').val()
                        if (name.length > 0) {
                            var Position = $(this).parents(".item").index()+1
                            addTasklist(name, Position);
                        }
                        })
                } else {
                    $(this).parents(".item").find(".liebiaocaidan4").show();
                }

                return false;
                
            }); //more click--end

            return false;
        });
    });
}

$("#card .sanjiao").click(function () {
    if ($(this).parents(".item-sc").find("item-main")) { }
});

function missionbianji() {
    $(".sanjiao").off();
    $(".sanjiao").click(function () {
        var that = this;

        if ($(".miss-bianji").length != 0) {
            $(".miss-bianji").remove();
        } else if ($(this).attr("power") == "power") {
            $(this).append('<div class="miss-bianji card-popup">' + '<div class="miss-bianji1 finishend">标记完成</div>' + '<div class="miss-bianji1">编辑</div>' + '<div class="miss-bianji1">移动</div>' + '<div class="miss-bianji1">更改状态</div>' + '<div>删除</div>' + '</div>');

            $(document).mouseup(function (e) {
                $(".item .item-sc").css("overflow-y", "auto");
                $(".item .item-sc").css("overflow-x", "hidden");

                if ($(e.target).parents(".miss-bianji").length == 0 && $(e.target).parents(".delete-shur").length == 0) {
                    $(".miss-bianji").remove();
                }
            });
            offset = $(".miss-bianji").offset();

            if (offset) {
                var top = offset.top;
                var left = offset.left;

                if ($(this).parents(".item").find(".item-sc").height() > 200) {
                    if (top > $(this).parents(".item").find(".item-sc").height() + 60) {
                        $(".miss-bianji").offset({
                            top: top - 180,
                            left: left
                        });
                    } else if (top > $(this).parents(".item").find(".item-sc").height()) {
                        $(this).parents(".item").find(".item-sc").css("overflow", "visible");
                    }
                } else if (top > $(this).parents(".item").find(".item-sc").height() + 50) {
                    $(this).parents(".item").find(".item-sc").css("overflow", "visible");
                }
            }
        } else {
            $(this).append('<div class="miss-bianji card-popup">' + '<div class="miss-bianji1">编辑</div>' + '<div class="miss-bianji1">编辑</div>' + '<div class="miss-bianji1">移动</div>' + '<div class="miss-bianji1">更改状态</div>' + '<div>删除</div>' + '</div>');
            $(".miss-bianji div").eq(0).hide();
            $(".miss-bianji div").eq(3).hide();
            $(".miss-bianji").height(100);
            $(document).mouseup(function (e) {
                $(".item .item-sc").css("overflow-y", "auto");
                $(".item .item-sc").css("overflow-x", "hidden");

                if ($(e.target).parents(".sanjiao").length == 0 && $(e.target).parents(".delete-shur").length == 0) {
                    $(".miss-bianji").remove();
                }
            });
            offset = $(".miss-bianji").offset();

            if (offset) {
                var top = offset.top;
                var left = offset.left;

                if ($(this).parents(".item").find(".item-sc").height() > 200) {
                    if (top > $(this).parents(".item").find(".item-sc").height() + 60) {
                        $(".miss-bianji").offset({
                            top: top - 80,
                            left: left
                        });
                    }
                } else if (top > $(this).parents(".item").find(".item-sc").height() + 50) {
                    $(this).parents(".item").find(".item-sc").css("overflow", "visible");
                }
            }
        }

        $(".miss-bianji div").eq(4).click(function () {
            var that = this;
            $(".delete-mask").show();
            $(".delete-shur").show();
            $(".delete-shur-foot div").eq(0).off();
            $(".delete-shur-foot div").eq(0).click(function () {
                $(document).off(); //删除任务

                var activeid = $(that).parents(".name").find(".miss-xiangqing").attr("activityid");
                addTaskdelete(activeid);
                $(".miss-bianji div").parent().parent().parent().parent().remove();
                $(".miss-bianji").remove();
                $(".delete-mask").hide();
                $(".delete-shur").hide();
            });
            return false;
        }); //更改状态

        $(".miss-bianji div").eq(3).click(function () {
            $("#popup-zhuangtaichange").show();
            $(".popup-mask").show();
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
                var id = $(that).prev().attr("activityid");
                var StatusCode = $("#popup-zhuangtaichange .body-main span").attr("StatusCode");
                changemissmionzt(StatusCode, id);
                $("#popup-zhuangtaichange").hide();
                $(".popup-mask").hide();
            });
        });
        $(".miss-bianji div").eq(2).click(function () {
            var that = this;
            $(".delete-mask").show();
            $(".delete-bianji").show();
            var activeid = $(this).parents(".item-main").find(".miss-xiangqing").attr("activityid");
            var activename = $(this).parents(".item-main").find(".miss-xiangqing").html();
            $('.delete-bianji-title div').html(activename)
            var listid; //移动任务

            $(".delete-liebiaochook").click(function () {
                $(".bianji-liebiaochook").show();
                $(".bianji-liebiaochook").find("li").each(function () {
                    $(this).click(function () {
                        $(".bianji-liebiaochook li").removeClass("active");
                        $(this).addClass("active");
                        listid = $(this).attr("listid");
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
                console.log(listid);
                var url = "/apps/CommandProcessor.ashx?cmd=project.task.changelist";
                jQuery.ajax({
                    data: {
                        activityid: activeid,
                        listid: listid
                    },
                    async: true,
                    cache: false,
                    dataType: "json",
                    error: function error(request, textStatus, errorThrown) { },
                    success: function success(res) {
                        //console.log(res)
                        location.reload();
                    },
                    url: url
                });
            });
            return false;
        });
        $(".miss-bianji div").eq(1).click(function () {
            var id = $(this).parents(".sanjiao").prev(".miss-xiangqing").attr("activityid");
            $('#newmission').attr('missionid',id)
            $('.popup-mask').show()
            $('#newmission').show()
            getmiss2(id);
            $('.newmission-foot .save div').eq(0).hide()
            $('.newmission-head').html('编辑任务')
        });
        finishend()
        $(".miss-bianji div").eq(0).click(function () {
            var id = $(this).parents(".sanjiao").prev(".miss-xiangqing").attr("activityid");
            $(".popup-finish").show();
            $(".mission-header").hide();
            $(".mission-header4").show();
            $("#qqqq").hide();
            $("#allmission").hide();
            $(".mission").hide();
            $(".invite").hide();
            $('.popup-mask').show();
        });
        return false;
    });
} //选择紧急度


function cardbordercheck() {
    $("#card .itemborder-size img").eq(a).hide();
    var a = $("#card .itemborder-size").siblings(".item-main-border").prop("className");

    if (a == "item-main-border item-borderl") {
        a = 0;
    }

    if (a == "item-main-border item-borderm") {
        a = 1;
    }

    if (a == "item-main-border item-borderh") {
        a = 2;
    }

    $("#card .itemborder-size img").eq(a).show();
}

var shitusrc;
$(".shituu2").click(function () {
    $(".card-table").toggle();
});
$(".card-table-div2").click(function () {
    $(".shituu2").prop("title", "显示为 表");
    $(".ppp").prop("title", "显示筛选");
    $(".ppp").css("cursor", "pointer");
    pageNumber = 1;
    taskssearch(pageNumber);
    $(this).addClass("active");
    $(".card-table-div3").removeClass("active");
    $(this).append('<img src="/img/cal/checkedgrey.png" class="img2" />');
    $(".card-table-div3 .img2").remove();
    shitusrc = "/img/cal/20.table_1(14x14).png";
    $(".shituu2 .img1").prop("src", shitusrc).addClass("posi");
    $(".card-table").toggle();
    $("#allmission").show();
    $("#qqqq").hide();
    $(".ppp img").prop("src", "/img/cal/22.filterList_2(14x14).png");
    $(".main-head div").eq(0).hide();
    $(".main-head div").eq(1).hide();
    $(".main-head div").eq(2).hide();
    $(".main-head div").eq(3).hide();
    $(".main-head div").eq(4).hide();
    $(".main-head div").eq(5).hide();
    $(".ppp").click(function () {
        $(".main-head div").eq(0).toggle();
        $(".main-head div").eq(1).toggle();
        $(".main-head div").eq(5).toggle();

        if ($(".ppp img").attr("src") == "/img/cal/22.filterList_3(14x14).png") {
            $(".ppp img").prop("src", "/img/cal/22.filterList_2(14x14).png");
        } else {
            $(".ppp img").prop("src", "/img/cal/22.filterList_3(14x14).png");
        }

        $("#allmission .body-main").height(clientHeight - 380 - $(".main-head").height());
    });
    $(".up").click(function () {
        $(".main-head div").eq(2).toggle();
        $(".main-head div").eq(3).toggle();
        $(".main-head div").eq(4).toggle();

        if ($(this).html() == "收起") {
            $(this).html("展开");
            $(this).removeClass("active");
        } else {
            $(this).html("收起");
        }

        $("#allmission .body-main").height(clientHeight - 380 - $(".main-head").height());
    });
});
$(".card-table-div3").click(function () {
    $(".shituu2").prop("title", "显示为 看板");
    $(".ppp").css("cursor", "default");
    $(this).addClass("active");
    $(".card-table-div2").removeClass("active");
    $(".card-table-div2 .img2").remove();
    $(this).append('<img src="/img/cal/checkedgrey.png" class="img2" />');
    shitusrc = "/img/cal/20.kanban_1(14x14).png";
    $(".shituu2 .img1").prop("src", shitusrc).addClass("posi");
    $(".card-table").toggle();
    $("#allmission").hide();
    $("#qqqq").show();
    $(".ppp img").prop("src", "/img/cal/22.filterList_1(14x14).png");
}); //获取任务列表

function editTasklist() {
    var id = getQueryString('projectId')
    var url = "/apps/HrProcessor.ashx?cmd=project.tasklist.getlist&projectId="+id;
    jQuery.ajax({
        async: true,
        cache: false,
        dataType: "json",
        error: function error(request, textStatus, errorThrown) {//errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function success(data) {
            //console.log(data)
            $('.bianji-liebiaochook.bianji-liebiaochook3 li').remove()
            for (var i = 0; i < data.listData.length; i++) {
                $("#card .main").width($("#card .main").width() + 300);
                var data2 = data.listData[i];
                var Name = data2.Name;
                var ListId = data2.ListId;
                var taskstatus = data2.taskstatus;
                $(".main .newlist").before('<div class="item purps">' + '<div class="item-head">' + '<p class="name">' + Name + '<span class="length"></span></p>' + '<p class="more">...</p>' + '</div>' + '<div class="item-sc">' + '</div>' + '<div class="new">' + '<p>' + '<img src="/img/cal/2.PNG">' + '</p>' + '</div>' + '</div>');
                $(".item").eq(i).attr("titl", ListId);
                $(".item").eq(i).attr("listname", Name);
                $(".item").eq(i).attr("taskstatus", taskstatus);
                $('.bianji-liebiaochook.bianji-liebiaochook3').append('<li listid="' + ListId + '"><img src="/img/cal/checkedgrey.png">' + Name + '</li>')
            }

            listcaidan();
            newmission();
            newlist();
            addTasklist3();

            $("#card").css({
                maxWidth: maxw - 30 + "px",
                height: clientHeight - 200 + "px"
            })
            $(".mission").css({
                maxWidth: maxw - 30 + "px",
                height: clientHeight - 250 + "px"
            })
            $(".item-sc").css({
                maxHeight: clientHeight - 310 + "px"
            })
        },
        url: url
    });
}

editTasklist(); //添加任务列表

function addTasklist(name,Position) {
    var projectId = getQueryString('projectId')
    var url = "/apps/HrProcessor.ashx?cmd=project.tasklist.add" + "&name=" + name + '&projectId=' + projectId + '&Position=' + Position;
    jQuery.ajax({
        async: true,
        cache: false,
        dataType: "json",
        error: function error(request, textStatus, errorThrown) {//errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function success(data, textStatus) {//debugger;
            //if (callback)
            //    callback(data);
            window.location.reload();
        },
        type: "POST",
        url: url
    });
} //删除任务列表


function deleteTasklist(id) {
    var projectId = getQueryString('projectId')
    var url = "/apps/HrProcessor.ashx?cmd=project.tasklist.delete" + "&TaskListId=" + id + '&projectId=' + projectId;
    jQuery.ajax({
        async: true,
        cache: false,
        dataType: "json",
        error: function error(request, textStatus, errorThrown) {//errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function success(data, textStatus) {//debugger;
            //if (callback)
            //    callback(data);
        },
        type: "POST",
        url: url
    });
} //编辑任务列表


function addTasklist2(id, name) {
    var projectId = getQueryString('projectId')
    var url = "/apps/HrProcessor.ashx?cmd=project.status.edit" + "&TaskId=" + id + "&Name=" + name + "&projectId=" + projectId;
    jQuery.ajax({
        async: true,
        cache: false,
        dataType: "json",
        error: function error(request, textStatus, errorThrown) {//errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function success(data, textStatus) {//debugger;
            //if (callback)
            //    callback(data);
        },
        type: "POST",
        url: url
    });
} //获取任务


var FullName;
var UserId;
$('.sousuo input').keyup(function (evevt) {
    if (event.keyCode == "13") {
        var search = $(this).val()
        addTasklist3(search)
    }
})
function addTasklist3(search) {
    var d = {}
    if (search) {
        d.search = search
    }
    var projectId = getQueryString('projectId');
    var url = "/apps/HrProcessor.ashx?cmd=project.task.getlist&projectId=" + projectId;
    jQuery.ajax({
        async: true,
        cache: false,
        dataType: "json",
        data: d,
        error: function error(request, textStatus, errorThrown) {//errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function success(res) {
            console.log(res);
            $('.item-main').remove()
            FullName = res.context.FullName;
            UserId = res.context.UserId;
            $("#aaa").attr("name", FullName);
            $("#aaa").attr("owningid", UserId);

            for (var i = 0; i < res.listData.length; i++) {
                var data = res.listData[i];
                var ListId = data.ListId;
                $(".item").each(function () {
                    var id = $(this).attr("titl");

                    if (ListId == id) {
                        var length = data.Tasks.length;
                        $(this).find(".length").html("(" + length + ")");

                        for (var l = 0; l < data.Tasks.length; l++) {
                            var Tasks = data.Tasks[l];
                            var CreatedBy = Tasks.CreatedBy;
                            var activityid = Tasks.ActivityId;
                            var name = Tasks.Subject;
                            var OwningUserName = Tasks.OwningUserName;
                            var ScheduledEnd = Tasks.ScheduledEnd;

                            if (ScheduledEnd) {
                                ScheduledEnd = "~" + ScheduledEnd;
                            }

                            var ScheduledStart = Tasks.ScheduledStart;
                            var itembordercolo;
                            var PriorityCode = Tasks.PriorityCode;

                            if (PriorityCode == 0) {
                                itembordercolo = "item-borderl";
                            }

                            if (PriorityCode == 1) {
                                itembordercolo = "item-borderm";
                            }

                            if (PriorityCode == 2) {
                                itembordercolo = "item-borderh";
                            }

                            var power = " ";

                            if (CreatedBy == UserId) {
                                power = "power";
                            }

                            $(this).find(".item-sc").append('<div class="item-main">' + '<div class="item-main-border' + " " + itembordercolo + '"border="' + itembordercolo + '"></div>' + '<p class="name">' + '<span class="miss-xiangqing" activityid="' + activityid + '">' + name + '</span>' + '<span class="sanjiao " power = "' + power + '">' + '<img src="/img/cal/20.PNG"  />' + '</span>' + '</p>' + '<p class="img">' + '<img src="/img/cal/1.png">' + '<span>' + OwningUserName + '</span>' + '</p>' + '<p class="time"> ' + ScheduledStart + ScheduledEnd + '</p>' + '</div>');
                        }
                    }
                });
            } //任务编辑


            missionbianji();
            chookjinjidu();
            toxiangqing(); //debugger;
            //if (callback)
            //    callback(data);
        },
        url: url
    });
} //删除任务


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
} //新建任务


function addTaskaddq(listid) {
    var scheduledstart = $(".timechook1").eq(0).attr("time");
    var scheduledend = $(".timechook1").eq(1).attr("time");
    var subject = $(".new-addinput input").val();
    var OwningUser = $(".username").parents(".item").attr("owningid");
    var PriorityCode = "";

    if ($(".colocheck").attr("tit")) {
        PriorityCode = $(".colocheck").attr("tit");
    }

    if (PriorityCode == "item-borderh") {
        PriorityCode = 2;
    }

    if (PriorityCode == "item-borderm") {
        PriorityCode = 1;
    }

    if (PriorityCode == "item-borderl") {
        PriorityCode = 0;
    }

    var url = "/apps/HrProcessor.ashx?cmd=project.task.edit";
    var RegardingObjectId = getQueryString('projectId')
    jQuery.ajax({
        data: {
            RegardingObjectTypeCode: 20290,
            RegardingObjectId:RegardingObjectId,
            subject: subject,
            scheduledend: scheduledend,
            scheduledstart: scheduledstart,
            PriorityCode: PriorityCode,
            listid: listid,
            OwningUser: OwningUser,
            ActivityTypeCode: 4022,
            objTypeCode: 4200
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

function searchusers3() {
    //搜索分配人
    var url = "/SecurityProcessor.ashx?cmd=searchusers";
    $(".card-people .sousuo input").keyup(function () {
        var search = $(".card-people .sousuo input").val();
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
                $(".card-people ul").append('<p class="sousuojieguo">共 <span>' + res.length + '</span> 条搜索结果</p>');

                for (var i = 0; i < res.length; i++) {
                    var data = res[i];
                    var name = data.name;
                    var id = data.id;
                    $(".card-people ul").append('<li tit="' + id + '"><p class="checkboxinput"></p><p><img src="/img/cal/15.png"></p><span>' + name + '</span></li>');
                }

                $("#card .card-people li").each(function () {
                    $(this).click(function () {
                        $(".checkboxinput").removeClass("active");
                        $(this).children(".checkboxinput").addClass("active");
                        var id = $(this).attr("tit");
                        NAME = $(this).find("span").html();
                        $(this).parents(".item").attr("NAME", NAME);
                        $(this).parents(".item").attr("owningid", id);
                    });
                });
            },
            url: url
        });
    });
}

$(".asd").click(function () {
    $(".mission-hearder-right .sousuo").removeClass("active");
    $(".sousuo-tishi").hide();
    $(".sousuo-tishi1").hide();
    return false;
});
$(".mission-hearder-right .sousuo").click(function () {
    $(this).addClass("active");
    $(".sousuo-tishi").show();
    $(".sousuo-tishi1").show();
    $(document).mouseup(function (e) {
        if ($(e.target).parents(".sousuo").length == 0) {
            $(".sousuo").removeClass("active");
            $(".sousuo-tishi").hide();
            $(".sousuo-tishi1").hide();
        }
    });
    return false;
}); //刷新页面

var degn = 0;
$(".neww").click(function () {
    degn = degn + 360;
    $(".neww").children("img").css("transform", "rotate(" + degn + "deg)");
    $(".neww").children("img").css("-webkit-transform", "rotate(" + degn + "deg)");
    $(".neww").children("img").css("-o-transform", "rotate(" + degn + "deg)");
    $(".neww").children("img").css(" -moz-transform", "rotate(" + degn + "deg)");
    location.reload();
}); //进人任务编辑页面

var url = window.location.href;
var id = getQueryString('id');



function getmiss() {
    var url = window.location.href;
    var id = getQueryString('id');
    $(".mission").attr("id", id);
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
            ScheduledEnd1 = ScheduledEnd.split(" ")[0];
            ScheduledEnd2 = ScheduledEnd.split(" ")[1];
            var ScheduledStart = data.ScheduledStart;
            var ScheduledStart1 = ScheduledStart.split(" ")[0];
            var ScheduledStart2 = ScheduledStart.split(" ")[1];
            var OwningUserName = data.OwningUserName;
            var PriorityCodeName = data.PriorityCodeName;
            var StatusCodeName = data.StatusCodeName;
            var ReminderTime = data.ReminderTime;
            var PriorityCode = data.PriorityCode;
            ReminderTime2 = "截止前" + ReminderTime + "分钟";
            var CreatedByName = data.CreatedByName;
            var CreatedOn = data.CreatedOn;
            var Description = data.Description;
            var StatusCode = data.StatusCode;
            var Description = data.Description;
            var ReminderTime = data.ReminderTime;

            if (ReminderTime != '') {
                $('.tixingcheck').addClass('active');
                $('.tixingcheck').parent().next('.hidediv').show();
                $('#ReminderTime').html(ReminderTime2);
            }

            $('#description').val(Description);
            $(".pinput3").eq(0).attr("time", ScheduledStart);
            $(".pinput3").eq(1).attr("time", ScheduledEnd);
            $(".missmessage-body input").eq(0).val(Subject);
            $(".missmessage-body .starttime input").eq(0).val(ScheduledStart1);
            $(".missmessage-body .starttime2 select").eq(0).val(ScheduledStart2);
            $(".missmessage-body .starttime input").eq(1).val(ScheduledEnd1);
            $(".missmessage-body .starttime2 select").eq(1).val(ScheduledEnd2);
            $(".peoplechook input").val(OwningUserName);
            $(".missmessage-bodyright #sex").prev().find('span').html(PriorityCodeName);
            $(".missmessage-bodyright #Select3").prev().find('span').html(StatusCodeName);
            $(".textarea-div textarea").val(Description);
        }
    });
}

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
            console.log(res)
            console.log('res=' + res)
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
            $(".missmessage-bodyright #sex").children("li").eq(PriorityCode).addClass('active');
            $(".missmessage-bodyright #Select3").children("li").eq(StatusCode).addClass('active');
            $(".textarea-div textarea").val(Description);
        }
    });
}

$(".shituu2").prop("title", "显示为 看板");
$(".ppp").css("cursor", "default"); //更改任务状态

function changemissmionzt(StatusCode, id) {
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=entity.save",
        data: {
            id: id,
            statusCode: StatusCode,
            objTypeCode: 4200
        },
        async: true,
        cache: false,
        dataType: "json",
        success: function success(res) {//console.log(res)
        }
    });
} //设置弹出框位置


$(window).resize(function () {
    $(".popup").each(function () {
        var width = $(window).width() - $(this).width();
        width = width / 2;
        var height = $(window).height() - $(this).height();
        height = height / 2;
        $(this).css({
            left: width,
            marginLeft: 0,
            top: height,
            marginTop: 0
        });
    });
});
$(window).ready(function () {
    $(".popup").each(function () {
        var width = $(window).width() - $(this).width();
        width = width / 2;
        var height = $(window).height() - $(this).height();
        height = height / 2;
        $(this).css({
            left: width,
            marginLeft: 0,
            top: height,
            marginTop: 0
        });
    });
});
var id = getQueryString('projectId')
ajaxMethodGetData('entity.detail.get', { ObjTypeCode: 20290, id: id }, function (data) {
    $('.head-title').html(data.record.Name)
})