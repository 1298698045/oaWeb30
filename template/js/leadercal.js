
var time = ''

var contextuserid = '';
var contextname = ''; //获取年月日

var myDate = new Date();
var year = myDate.getFullYear(); //获取当前年

var mon = myDate.getMonth() + 1; //获取当前月

var date = myDate.getDate(); //获取当前日

var weekday = myDate.getDay();
var startdate = '';
var enddate = '';
var weekindex = '';
var weeksday = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
var weeksday2 = ["日", "一", "二", "三", "四", "五", "六"];
$(".header-left-title-time").html(year + "年" + mon + "月" + date + "日" + ' ' + weeksday[weekday]);
$('.rowCore').scroll(function () {
    $(this).parents('.calendar').find('.calendarKey').css('top', -$(this).scrollTop() - 1);
    $(this).parents('.calendar').find('.calendarDayHeaders').css('left', -$(this).scrollLeft() + 1);
}); //高度

$(document).ready(function () {
    var height = $(window).height() - 235;
    $('.rowCore').css('max-height',height);
}); //视图选择

$('.daytype-chook li').eq(0).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar1').show();
    $(".header-left-title-time").html(year + "年" + mon + "月" + date + "日" + ' ' + weeksday[weekday]);
    getdata();
});
$('.daytype-chook li').eq(1).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar3').show();
    $('.header-left-title-time').html(startdate + '-' + enddate);
    getdata();
});
$('.daytype-chook li').eq(2).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar2').show();
    $(".header-left-title-time").html(year + "年" + mon + "月");
    getdata();
});
$('.daytype-chook li').eq(3).click(function () {
    var fcf = getQueryString('fcf')
    window.location.href = '/scheduling/leaderCallist.aspx?entityType=025&t=LeaderCalendar' + '&fcf=' + fcf
});
function listdata(data) {
    console.log(data)
    $('#gridTable').datagrid({})
}
setlaydate(); //日历展现

$('.sort').click(function () {
    $(this).toggleClass('active');

    if ($(this).hasClass('active')) {
        $('.calendar').each(function () {
            $(this).css('width', 'calc(100% - 300px)');
            $('.calder-content').show();
        });
    } else {
        $('.calendar').each(function () {
            $(this).css('width', '100%');
            $('.calder-content').hide();
        });
    }
}); //日期切换
//上一天

$('.prev-buttonbtn').click(function () {
    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        if (date > 1) {
            date--;

            if (weekday > 0) {
                weekday--;
            } else {
                weekday = 6;
            }
        } else {
            if (mon > 1) {
                mon--;
            } else {
                year--;
                mon = 12;
            }

            date = new Date(year, mon, 0).getDate();
        }
    }  else if ($('.daytype-chook li').eq(1).hasClass('active')) {
        if (date > 7) {
            date -= 7;
        } else {
            if (mon > 1) {
                mon--;
            } else {
                year--;
                mon = 12;
            }

            date = new Date(year, mon, 0).getDate() + date - 7;
        }
    } else if ($('.daytype-chook li').eq(2).hasClass('active')) {
        if (mon > 1) {
            mon--;
        } else {
            year--;
            mon = 12;
            date = new Date(year, mon, 0).getDate();
        }
    } else {
        if (mon > 1) {
            mon--;
        } else {
            year--;
            mon = 12;
            date = new Date(year, mon, 0).getDate();
        }
    }

    time = year + '-' + mon + '-' + date;
    setlaydate(time);

    if (time == $('td.tody').attr('lay-ymd')) {
        $('.buttonbtn.tody').addClass('tody-true');
    } else {
        $('.buttonbtn.tody').removeClass('tody-true');
    }
}); //下一天

$('.next-buttonbtn').click(function () {
    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        if (date < new Date(year, mon, 0).getDate()) {
            date++;

            if (weekday < 6) {
                weekday++;
            } else {
                weekday = 0;
            }
        } else {
            date = 1;

            if (mon < 12) {
                mon++;
            } else {
                year++;
                mon = 1;
            }
        }
    }  else if ($('.daytype-chook li').eq(1).hasClass('active')) {
        if (date < new Date(year, mon, 0).getDate() - 7) {
            date += 7;
        } else {
            date = date - new Date(year, mon, 0).getDate() + 7;

            if (mon < 12) {
                mon++;
            } else {
                year++;
                mon = 1;
            }
        }
    } else if ($('.daytype-chook li').eq(2).hasClass('active')) {
        if (mon < 12) {
            mon++;
        } else {
            year++;
            mon = 1;
        }
    } else {
        if (mon < 12) {
            mon++;
        } else {
            year++;
            mon = 1;
        }
    }

    time = year + '-' + mon + '-' + date;
    setlaydate(time);

    if (time == $('td.tody').attr('lay-ymd')) {
        $('.buttonbtn.tody').addClass('tody-true');
    } else {
        $('.buttonbtn.tody').removeClass('tody-true');
    }
}); //今天

$('.buttonbtn.tody').click(function () {
    year = myDate.getFullYear(); //获取当前年

    mon = myDate.getMonth() + 1; //获取当前月

    date = myDate.getDate(); //获取当前日

    weekday = myDate.getDay();

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月" + date + "日" + ' ' + weeksday[weekday]);
    } else if ($('.daytype-chook li').eq(2).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月");
    }

    setlaydate();
    $('.buttonbtn.tody').addClass('tody-true');
});

function newmsg() {
    //新建 日
    $('.calendar1 .eventList').click(function (e) {
        var time = '';
        $('.calendar1 .calendarKey strong').each(function () {
            if ($(this).offset().top > e.pageY) {
                time = $(this).prev().attr('time');
                return false;
            }
        });

        if (time == '') {
            time = '20:00';
        }

        var roomid = $(this).attr('roomid');
        var roomname = $(this).attr('roomname');
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/new_leader.html?time=' + time + '&day=' + year + '-' + mon + '-' + date + '&roomid=' + roomid + '&roomname=' + roomname);
        console.log(time);
    }); //新建 周

    $('.calendar3 .eventList').click(function (e) {
        var roomid = '';
        var roomname = '';
        $('.calendar3 .calendarKey strong').each(function () {
            if ($(this).offset().top > e.pageY) {
                roomid = $(this).prev().attr('roomid');
                roomname = $(this).prev().attr('roomname');
                return false;
            }
        });

        if (roomid == '') {
            roomid = $('.calendar3 .calendarKey strong:last').attr('roomid');
            roomname = $('.calendar3 .calendarKey strong:last').attr('roomname');
        }

        var time = $('.calendar3').find('.calenderDayHeader').eq($(this).parent().index()).attr('time');
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/new_leader.html?day=' + time + '&roomid=' + roomid + '&roomname=' + roomname);
    }); //新建 月

    $('.calendar2 .eventList').click(function (e) {
        var roomid = '';
        $('.calendar2 .calendarKey strong').each(function () {
            if ($(this).offset().top > e.pageY) {
                roomid = $(this).prev().attr('roomid');
                roomname = $(this).prev().attr('roomname');
                return false;
            }
        });

        if (roomid == '') {
            roomid = $('.calendar3 .calendarKey strong:last').attr('roomid');
            roomname = $('.calendar3 .calendarKey strong:last').attr('roomname');
        }

        var time = $('.calendar2').find('.calenderDayHeader').eq($(this).parent().index()).attr('time');
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/new_leader.html?day=' + time + '&roomid=' + roomid + '&roomname=' + roomname);
    });
    $('.newbtn').click(function () {
        console.log(111);
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/new_leader.html');
    });
} //周 日历


function setlaydate(time) {
    $('#time-chook').find('div').remove();
    laydate.render({
        elem: '#time-chook',
        show: true,
        position: 'static',
        showBottom: false,
        value: time,
        ready: function ready(value) {
            console.log(value);
            addlayui();
            calenderchange();
            weekindex = $('.layui-this').parent().index();
            getdata();
        },
        change: function change(value) {
            addlayui();
            calenderchange(value);
            getdata();
        }
    });
} //日历初始化样式


function addlayui() {
    $('.laydate-set-ym span').addClass('displedclick');
    $('.layui-icon.laydate-prev-m').html(' ');
    $('.layui-icon.laydate-next-m').html(' ');
    $('.layui-laydate-content').append('<div class="calender-line"></div>');
    var year = myDate.getFullYear();
    var mon = myDate.getMonth() + 1;
    var date = myDate.getDate();
    var time = year + '-' + mon + '-' + date;
    $('td[lay-ymd=' + time + ']').addClass('tody');
} //日期改变


function calenderchange(value) {
    if (value) {
        window.year = parseInt(value.split('-')[0]);
        window.mon = parseInt(value.split('-')[1]);
        window.date = parseInt(value.split('-')[2]);
    }

    $('.slds-brand-band-zhou .layui-this').parent().parent().find('tr').css('background-color', '#fff');
    $('.slds-brand-band-zhou .layui-this').parent().css('background-color', '#f8f8f8');
    $('.slds-brand-band-zhou').find('.calenderDayHeader').removeClass('presentDay');
    $('.slds-brand-band-zhou').find('.calenderDayHeader').eq($('.slds-brand-band-zhou .layui-this').index()).addClass('presentDay');
    $('.slds-brand-band-zhou').find('.calendarDay').removeClass('checkedDay');
    $('.slds-brand-band-zhou').find('.calendarDay').eq($('.slds-brand-band-zhou .layui-this').index()).addClass('checkedDay');
    $('.slds-brand-band-zhou').find('.calenderDayHeader').each(function (index) {
        var week = '';

        if (index == 0) {
            week = '周日';
        } else if (index == 1) {
            week = '周一';
        } else if (index == 2) {
            week = '周二';
        } else if (index == 3) {
            week = '周三';
        } else if (index == 4) {
            week = '周四';
        } else if (index == 5) {
            week = '周五';
        } else if (index == 6) {
            week = '周六';
        }

        var date = $('.layui-this').parent().find('td').eq(index).attr('lay-ymd');
        $(this).attr('time', date);
        date = date.split('-')[1] + '/' + date.split('-')[2] + '/';
        $(this).html(date + '(' + week + ')');
    });
    startdate = $('.slds-brand-band-zhou .layui-this').parent().find('td:first').attr('lay-ymd');
    enddate = $('.slds-brand-band-zhou .layui-this').parent().find('td:last').attr('lay-ymd');
    startdate = startdate.split('-')[0] + '年' + startdate.split('-')[1] + '月' + startdate.split('-')[2] + '日';
    enddate = enddate.split('-')[0] + '年' + enddate.split('-')[1] + '月' + enddate.split('-')[2] + '日';
    window.weekday = $('.layui-this').index();

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月" + window.date + "日" + ' ' + weeksday[weekday]);
    }

    else if ($('.daytype-chook li').eq(1).hasClass('active')) {
        $('.header-left-title-time').html(startdate + '-' + enddate);
    }

    else if ($('.daytype-chook li').eq(2).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月");
    } else {
        $(".header-left-title-time").html(year + "年" + mon + "月");
    }

    var date = $('.layui-this').attr('lay-ymd');
    date = date.split('-')[2];
    var weeks = $('.layui-laydate-content th').eq($('.layui-this').index()).html();
    $('.calder-content-head p').eq(0).html(date);
    $('.calder-content-head p').eq(1).html('星期' + weeks);
} //获取数据


function getdata() {
    $('.calendar2 .calendarDayHeaders .calenderDayHeader').remove();
    $('.calendar2 .scroll .calendarDay').remove();
    var datecont = new Date(year, mon, 0).getDate();
    var weekday2 = new Date(year, mon - 1, 1).getDay();

    for (var i = 0; i < datecont; i++) {
        var date = i + 1;

        if (weekday2 == 6 || weekday2 == 0) {
            $('.calendar2 .calendarDayHeaders').append("\n            <strong class=\"calenderDayHeader widthitem1\" time=\"" + year + '-' + mon + '-' + date + "\">\n                    <p class='weekend'>" + weeksday2[weekday2] + "</p>\n                    <p class='weekend'>" + date + "</p>\n                </strong>");
        } else {
            $('.calendar2 .calendarDayHeaders').append("\n            <strong class=\"calenderDayHeader widthitem1\" time=\"" + year + '-' + mon + '-' + date + "\">\n                    <p>" + weeksday2[weekday2] + "</p>\n                    <p>" + date + "</p>\n                </strong>");
        }

        $('.calendar2 .scroll').append("\n            <div class=\"calendarDay\">\n                <div class=\"eventList widthitem1\"></div>\n            </div>");
        weekday2++;

        if (weekday2 == 7) {
            weekday2 = 0;
        }
    }

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        var startTime = $('.layui-this').attr('lay-ymd');
        var endTime = $('.layui-this').attr('lay-ymd');
    }

    else if ($('.daytype-chook li').eq(1).hasClass('active')) {
        var startTime = $('.layui-this').parent().find('td:first').attr('lay-ymd');
        var endTime = $('.layui-this').parent().find('td:last').attr('lay-ymd');
    }

    else if ($('.daytype-chook li').eq(2).hasClass('active')) {
        var startTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-1';
        var endTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-' + new Date(year, mon, 0).getDate();
    } else {
        var startTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-1';
        var endTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-' + new Date(year, mon, 0).getDate();
    }

    function callback(data) {
        console.log(data);
        daydata(data);
        weekdata(data);
        mondata(data);
        newmsg();
        listdata(data)
        contextuserid = data.context.userid;
        contextname = data.context.name;
        $('#iframe').attr('contextuserid', contextuserid);
        $('#iframe').attr('contextname', contextname);

        for (var i = 0; i < data.dayData.length; i++) {
            var time = data.dayData[i].day;

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-');
            }

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-00');
            }

            $('.layui-laydate-content').find('td[lay-ymd="' + time + '"]').addClass('msg-true');
        }
    }

    var d = {
        startTime: startTime,
        endTime: endTime,
        filterId: getQueryString('fcf')
    };
    window.startTime = startTime
    window.endTime = endTime
    ajaxMethodGetData('calendar.leader.getlist', d, callback);
} //日视图数据
var startTime = ''
var endTime = ''
$('.printbtn').click(function () {
    window.open('/apps/CommandProcessor.ashx?c=1&cmd=calendar.leader.export&startTime=' + startTime + '&endTime=' + endTime + '&filterId=' + getQueryString('fcf'))
})
function daydata(data) {
    $('.calendar1').find('.calendarDayHeaders .calenderDayHeader').remove();
    $('.calendar1').find('.rowCore .scroll .calendarDay').remove();
    $('.calendar1').find('.calendarDayHeaders').css('width', 221 * data.listData.length);
    $('.calendar1').find('.rowCore .scroll').css('width', 221 * data.listData.length);

    for (var i = 0; i < data.listData.length; i++) {
        var res = data.listData[i];
        var name = res.Name;
        var id = res.SystemUserId;
        var ApproveByIds = res.ApproveByIds;
        $('.calendar1').find('.calendarDayHeaders').append("<strong class=\"calenderDayHeader\" >" + name + "</strong>");
        $('.calendar1').find('.rowCore .scroll').append("<div class=\"calendarDay \">\n        <div class=\"eventList\" roomname = \"" + name + "\"id=\"" + id + "\"roomid=\"" + id + "\"></div>\n        </div>");

        for (var j = 0; j < res.Activities.length; j++) {
            var ress = res.Activities[j];
            var Id = ress.ActivityId;
            var OwningUserName = ress.CreatedByName;
            var Subject = ress.Subject;
            var Roomname = ress.Location;
            var StateCode = ress.StateCode + 1;
            var Attachs = ress.Attachs;

            if (ress.TelePhone) {
                var TelePhone = ress.TelePhone;
            } else {
                var TelePhone = ress.TelePhone = '';
            }

            var Description = ress.Description;
            var ScheduledEnd = ress.ScheduledEnd.split('T')[1];
            var ScheduledStart = ress.ScheduledStart.split('T')[1];
            var ScheduledEnd2 = ress.ScheduledEnd.split('T').join(' ');
            var ScheduledStart2 = ress.ScheduledStart.split('T').join(' ');
            var starth = ScheduledStart.split(':')[0];
            var startm = ScheduledStart.split(':')[1];
            var endh = ScheduledEnd.split(':')[0];
            var endm = ScheduledEnd.split(':')[1];
            var m = endm - startm;
            var h = endh - starth;

            if (m == 30) {
                h += 0.5;
            }

            if (m == -30) {
                h -= 0.5;
            }

            var mh = 0;

            if (endm == '30') {
                mh = 0.5;
            }

            var height = h * 60;
            var top = (starth - 7 + mh) * 60;
            top = parseInt(top)
            $('.calendar1').find('.rowCore .eventList').eq(i).append("\n            <div ApproveByIds = \"" + ApproveByIds + "\"\n            TelePhone=\"" + TelePhone + "\"\n            Description=\"" + Description + "\"\n            Attachs=\"" + Attachs + "\"\n            Roomname =\"" + name + "\" \n            Subject = \"" + Subject + "\"\n            ScheduledEnd = \"" + ScheduledEnd2 + "\"\n            ScheduledStart = \"" + ScheduledStart2 + "\"\n            OwningUserName =\"" + OwningUserName + "\" \n            Id=\"" + Id + "\"\n            class=\"meetingroom-message meetingroom-message" + StateCode + "\" \n            style='top:" + top + "px;height:" + height + "px'>\n                <p>" + Subject + "</p>\n                <p><span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span></p>\n                <p>" + OwningUserName + "\u5206\u914D\u7684</p>\n            </div>");
        }
    }

    hover();
} //周视图数据


function weekdata(data) {
    var height = data.listData.length * 130;
    $('.calendar3').find('.eventList').each(function () {
        $(this).css('height', height);
    });
    $('.calendar3').find('.calendarDay').each(function () {
        $(this).css('height', height);
    });
    $('.calendar3').find('.calendarKey strong').remove();
    $('.calendar3 .more').remove();
    $('.calendar3 .meetingroom-message').remove();

    for (var i = 0; i < data.listData.length; i++) {
        var res = data.listData[i];
        var name = res.Name;
        var id = res.SystemUserId;
        var ApproveByIds = res.ApproveByIds;
        $('.calendar3').find('.calendarKey').append("<strong roomname=\"" + name + "\"roomid=\"" + id + "\"><span>" + name + "</span></strong>");

        for (var j = 0; j < res.Activities.length; j++) {
            var ress = res.Activities[j];
            var Id = ress.ActivityId;
            var OwningUserName = ress.CreatedByName;
            var Subject = ress.Subject;
            var Roomname = res.Name;
            var StateCode = ress.StateCode + 1;
            var Attachs = ress.Attachs;

            if (ress.TelePhone) {
                var TelePhone = ress.TelePhone;
            } else {
                var TelePhone = ress.TelePhone = '';
            }

            var Description = ress.Description;
            var ScheduledEnd = ress.ScheduledEnd.split('T')[1];
            var ScheduledStart = ress.ScheduledStart.split('T')[1];
            var ScheduledEnd2 = ress.ScheduledEnd.split('T').join(' ');
            var ScheduledStart2 = ress.ScheduledStart.split('T').join(' ');
            var ScheduledStart3 = ress.ScheduledStart.split('T')[0];
            var starth = ScheduledStart.split(':')[0];
            var startm = ScheduledStart.split(':')[1];
            var endh = ScheduledEnd.split(':')[0];
            var endm = ScheduledEnd.split(':')[1];
            var time = ScheduledStart3;
            var index = '';

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-');
            }

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-00');
            }

            $('.calendar3 .calenderDayHeader').each(function () {
                if ($(this).attr("time") == time) {
                    index = $(this).index();
                }
            });
            var top = $('.calendar3').find('.calendarKey strong:last').offset().top - 228 + $('.calendar3 .rowCore').scrollTop() + 'px';
            top = parseInt(top)

            var morenumber = 0;
            var morenumber2 = 0;
            $('.calendar3').find('.rowCore .eventList').eq(index).find('div').each(function () {
                if ($(this).css('top') == top) {
                    morenumber++;
                    top = $('.calendar3').find('.calendarKey strong:last').offset().top - 228 + 55 + $('.calendar3 .rowCore').scrollTop() + 'px';
                    top = parseInt(top)

                    var moretop = $('.calendar3').find('.calendarKey strong:last').offset().top - 228 + 110 + $('.calendar3 .rowCore').scrollTop() + 'px';
                    moretop = parseInt(moretop)

                    if (morenumber > 1) {
                        morenumber2 = morenumber - 2;
                        $(this).parent().find('.more').remove();
                        $(this).parent().append("<div ResourceId='" + id + "'class='more'style='top:" + moretop + "'>+" + morenumber2 + " \u66F4\u591A</div>");
                    }
                }
            });

            if (morenumber < 2) {
                $('.calendar3').find('.rowCore .eventList').eq(index).append("\n                <div Roomname =\"" + Roomname + "\" \n                Subject = \"" + Subject + "\"\n                ScheduledEnd = \"" + ScheduledEnd2 + "\"\n                ScheduledStart = \"" + ScheduledStart2 + "\"\n                OwningUserName =\"" + OwningUserName + "\" \n                Attachs =\"" + Attachs + "\" \n                TelePhone =\"" + TelePhone + "\" \n                Description =\"" + Description + "\" \n                ApproveByIds = \"" + ApproveByIds + "\"\n                Id=\"" + Id + "\"\n                class=\"meetingroom-message meetingroom-message" + StateCode + " widthitem2\"\n                style=\"top:" + top + "px\">\n                <p>" + Subject + "</p>\n                <p><span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span></p>\n                <p>" + OwningUserName + "\u5206\u914D\u7684</p>\n            </div>");
            }
        }
    }

    hover();
} //月视图数据


function mondata(data) {
    var height = data.listData.length * 130;
    $('.calendar2').find('.eventList').each(function () {
        $(this).css('height', height);
    });
    $('.calendar2').find('.calendarDay').each(function () {
        $(this).css('height', height);
    });
    $('.calendar2').find('.calendarKey strong').remove();
    $('.calendar2 .more').remove();
    $('.calendar2 .meetingroom-message').remove();

    for (var i = 0; i < data.listData.length; i++) {
        var res = data.listData[i];
        var name = res.Name;
        var id = res.SystemUserId;
        var ApproveByIds = res.ApproveByIds;
        $('.calendar2').find('.calendarKey').append("<strong roomname=\"" + name + "\" roomid=\"" + id + "\"><span>" + name + "</span></strong>");

        for (var j = 0; j < res.Activities.length; j++) {
            var ress = res.Activities[j];
            var Id = ress.ActivityId;
            var OwningUserName = ress.CreatedByName;
            var Subject = ress.Subject;
            var Roomname = res.Name;
            var StateCode = ress.StateCode + 1;
            var Attachs = ress.Attachs;

            if (ress.TelePhone) {
                var TelePhone = ress.TelePhone;
            } else {
                var TelePhone = ress.TelePhone = '';
            }

            var Description = ress.Description;
            var ScheduledEnd = ress.ScheduledEnd.split('T')[1];
            var ScheduledStart = ress.ScheduledStart.split('T')[1];
            var ScheduledEnd2 = ress.ScheduledEnd.split('T').join(' ');
            var ScheduledStart2 = ress.ScheduledStart.split('T').join(' ');
            var ScheduledStart3 = ress.ScheduledStart.split('T')[0];
            var starth = ScheduledStart.split(':')[0];
            var startm = ScheduledStart.split(':')[1];
            var endh = ScheduledEnd.split(':')[0];
            var endm = ScheduledEnd.split(':')[1];
            var time = ScheduledStart3;
            var index = '';

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-');
            }

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-00');
            }

            $('.calendar2 .calenderDayHeader').each(function () {
                if ($(this).attr("time") == time) {
                    index = $(this).index();
                    $(this).width(150);
                    $('.calendar2').find('.rowCore .eventList').eq(index).width(150);
                }
            });
            var top = $('.calendar2').find('.calendarKey strong:last').offset().top - 228 + $('.calendar2 .rowCore').scrollTop() + 'px';
            top = parseInt(top)

            var morenumber = 0;
            var morenumber2 = 0;
            $('.calendar2').find('.rowCore .eventList').eq(index).find('div').each(function () {
                if ($(this).css('top') == top) {
                    morenumber++;
                    top = $('.calendar2').find('.calendarKey strong:last').offset().top - 228 + 55 + $('.calendar2 .rowCore').scrollTop() + 'px';
                    top = parseInt(top)

                    var moretop = $('.calendar2').find('.calendarKey strong:last').offset().top - 228 + 110 + $('.calendar2 .rowCore').scrollTop() + 'px';
                    moretop = parseInt(moretop)

                    if (morenumber>1) {
                        morenumber2 = morenumber - 1;
                        $(this).parent().find('.more').remove();
                        $(this).parent().append("<div ResourceId='" + id + "'class='more'style='top:" + moretop + "'>+" + morenumber2 + " \u66F4\u591A</div>");
                    }
                }
            });

            if (morenumber < 2) {
                $('.calendar2').find('.rowCore .eventList').eq(index).append("\n                <div Roomname =\"" + Roomname + "\" \n                Subject = \"" + Subject + "\"\n                ScheduledEnd = \"" + ScheduledEnd2 + "\"\n                ScheduledStart = \"" + ScheduledStart2 + "\"\n                OwningUserName =\"" + OwningUserName + "\" \n                Attachs =\"" + Attachs + "\" \n                TelePhone =\"" + TelePhone + "\" \n                Description =\"" + Description + "\" \n                ApproveByIds = \"" + ApproveByIds + "\"\n                Id=\"" + Id + "\"\n                class=\"meetingroom-message meetingroom-message" + StateCode + " widthitem2\"\n                style=\"top:" + top + "px\">\n                <p>" + OwningUserName + "\u5206\u914D\u7684</p>\n                <p><span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span>\n                " + Subject + "</p>\n            </div>");
            }
        }
    }
    hover();
    var width = 0;
    $('.calendar2 .calendarDayHeaders strong').each(function () {
        console.log($(this).width());
        width += $(this).width() + 1;
    });
    $('.calendar2 .scroll').width(width);
} //悬浮详情


var hoverindex = 0;

function hover1() {
    $('.meetingroom-message').hover(function () {
        $('.card-hover-point').show();
        var top = $(this).offset().top;
        var left = $(this).offset().left + $(this).width() + 15;

        if ($('.calendar1').css('display') == 'block') {
            left += 10;
        }

        if ($('.meetingroom-message-hover2').css('display') == 'block') {
            left += 10;
        }

        $('.card-hover-point').css({
            top: top + 10,
            left: left - 10
        });

        if (top + 220 > $(window).height()) {
            top = $(window).height() - 220;
        }

        if (left + 380 > $(window).width() - 300) {
            left = left - 380 - $(this).width() - 25;
            $('.card-hover-point').css({
                left: left + 367
            });
        }

        $('.meetingroom-message-hover1').show().css({
            top: top,
            left: left
        });

        if ($(this).attr('ApproveByIds') == contextuserid) {
            $('.meetingroom-message-hover-foot-right div').eq(0).hide();
        } else {
            $('.meetingroom-message-hover-foot-right div').eq(0).attr('Id', $(this).attr('Id'));
        }

        $('.meetingroom-message-hover1').find('.header-left-title-name').html($(this).attr('Subject'));
        $('.meetingroom-message-hover1').find('.OwningUserName').html($(this).attr('OwningUserName'));
        $('.meetingroom-message-hover1').find('.Roomname').html($(this).attr('Roomname'));
        $('.meetingroom-message-hover1').find('.ScheduledStart').html($(this).attr('ScheduledStart'));
        $('.meetingroom-message-hover1').find('.ScheduledEnd').html($(this).attr('ScheduledEnd'));
        $('.meetingroom-message-hover1').find('.Attachs').html($(this).attr('Attachs'));
        $('.meetingroom-message-hover1').find('.TelePhone').html($(this).attr('TelePhone'));
        $('.meetingroom-message-hover1').find('.Description').html($(this).attr('Description'));
    }, function (e) {
        var dom = ''
        if (e.toElement) {
            dom = e.toElement
        } else if (e.relatedTarget) {
            dom = e.relatedTarget
        }
        if (!$(dom).hasClass('card-hover-point') && !$(dom).hasClass('meetingroom-message-hover1')) {
            $('.meetingroom-message-hover1').hide()
            $('.card-hover-point').hide()
        }
        hoverindex = 2;
    });
    $(document).mousemove(function () {
        hoverindex = 0;
    });
    }
    $('.meetingroom-message-hover1').mouseleave(function () {
        $('.meetingroom-message-hover1').hide()
        $('.card-hover-point').hide()
    })

function hover() {
    $('.more').off();
    hover1();
    $('.meetingroom-message-hover .close').click(function () {
        $('.card-hover-point').hide();
        $('.meetingroom-message-hover').hide();

        if (hoverindex == 0) {
            hoverindex = 1;
        }

        return false;
    });
    $(document).click(function () {
        $('.meetingroom-message-hover').hide();
        $('.card-hover-point').hide();
    });
    $('.more').click(function () {
        $('.card-hover-point').hide();
        $('.meetingroom-message-hover').hide();
        var time = $(this).parents('.calendar').find('.calenderDayHeader').eq($(this).parent().parent().index()).html();
        var m = time.split('/')[0];
        var d = time.split('/')[1];
        var week = time.split('/')[2].slice(2, 3);

        if ($('.calendar2').css('display') == 'block') {
            m = mon;
            d = $(this).parents('.calendar').find('.calenderDayHeader').eq($(this).parent().parent().index()).find('p').eq(1).html();
            week = $(this).parents('.calendar').find('.calenderDayHeader').eq($(this).parent().parent().index()).find('p').eq(0).html();
        } else {
            m = time.split('/')[0];
            d = time.split('/')[1];
            week = time.split('/')[2].slice(2, 3);
        }

        $('.meetingroom-message-hover2').find('.header-left-title-name').html('星期' + week + ',' + m + '月' + d);
        var top = $(this).offset().top;
        var left = $(this).offset().left + $(this).width() + 25;

        if (top + 220 > $(window).height()) {
            top = $(window).height() - 220;
        }

        if (left + 380 > $(window).width() - 300) {
            left = left - 380 - $(this).width() - 25;
        }

        if ($('.calendar3').css('display') == 'block') {
            left -= 10;
        }

        $('.meetingroom-message-hover2').show().css({
            top: top,
            left: left
        });

        function callback(data) {
            console.log(data);
            $('.meetingroom-message-hover2 .meetingroom-message-hover-body .meetingroom-message').remove();

            for (var i = 0; i < data.reserves.length; i++) {
                var res = data.reserves[i];
                var OwningUserName = res.OwningUserName;
                var ScheduledStartTime = res.ScheduledStartTime;
                var ScheduledEndTime = res.ScheduledEndTime;
                var Subject = res.Subject;
                var CreatedByName = res.CreatedByName;
                var Roomname = res.Room.Name;
                var ScheduledEnd = res.ScheduledEnd.split('T')[1];
                var ScheduledStart = res.ScheduledStart.split('T')[1];
                var ScheduledEnd2 = res.ScheduledEnd.split('T').join(' ');
                var ScheduledStart2 = res.ScheduledStart.split('T').join(' ');
                var Attachs = res.Attachs;
                var Description = res.Description;
                var TelePhone = res.TelePhone;
                $('.meetingroom-message-hover2 .meetingroom-message-hover-body').append("\n                <div TelePhone=\"" + TelePhone + "\"Description=\"" + Description + "\"Attachs=\"" + Attachs + "\"Roomname =\"" + Roomname + "\" Subject = \"" + Subject + "\"ScheduledEnd = \"" + ScheduledEnd2 + "\"ScheduledStart = \"" + ScheduledStart2 + "\"OwningUserName =\"" + OwningUserName + "\" class=\"meetingroom-message meetingroom-message1 meetingroom-moremessage\">\n                <p>" + CreatedByName + "\u5206\u914D\u7684\n                <span>" + ScheduledStartTime + "</span>-<span>" + ScheduledEndTime + "</span>\n                <span>" + Subject + "</span>\n            </p>\n            </div>");
            }

            hover1();
        }

        var resourceid = $(this).attr('resourceid');
        var index = $(this).parent().parent().index();
        var time = $(this).parents('.calendar').find('.calendarDayHeaders strong').eq(index).attr('time');
        var d = {
            startTime: time,
            endTime: time,
            resourceid: resourceid
        };
        ajaxMethodGetData('calendar.leader.getlist', d, callback);
        return false;
    });
} //审批
//$('.meetingroom-message-hover-foot-right div').eq(0).click(function(){
//    $('#iframe').show()
//    var Id = $(this).attr('Id')
//    $('#iframe').attr('src', '/template/alert/meetingroommsg_sp.html?id='+Id)
//})
//编辑


$('.meetingroom-message-hover-foot-right div').eq(0).click(function () {
    $('#iframe').show();
    var Id = $(this).attr('id');
    $('#iframe').attr('src', '/template/alert/new_leader.html?msgid=' + Id);
});
//删除

$('.meetingroom-message-hover-foot-right div').eq(1).click(function () {
    $('#iframe').show();
    var Id = $(this).prev().attr('id');
    $('#iframe').attr('src', '/template/alert/delete_meetingroommsg.html?msgid=' + Id + '&name=日程' + '&ObjTypeCode=4200');
});