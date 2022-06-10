"use strict";
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
    $('.rowCore').css('max-height', height);

    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar2').show();
    $(".header-left-title-time").html(year + "年" + mon + "月");
    getdata();
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
    window.location.href = '/00V/o'
    $('.calendar').hide();
    $('.slds-brand-band-zhou').hide();
    $('.calendarlist').show();
    $(".header-left-title-time").html(year + "年" + mon + "月");
    getdata();
});
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
    } else if ($('.daytype-chook li').eq(2).hasClass('active')) {
        if (mon > 1) {
            mon--;
        } else {
            year--;
            mon = 12;
            date = new Date(year, mon, 0).getDate();
        }
    } else if ($('.daytype-chook li').eq(1).hasClass('active')) {
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
    } else if ($('.daytype-chook li').eq(2).hasClass('active')) {
        if (mon < 12) {
            mon++;
        } else {
            year++;
            mon = 1;
        }
    } else if ($('.daytype-chook li').eq(1).hasClass('active')) {
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
        $('#iframe').height(620).css('margin-top', '-310px')

        $('#iframe').show();
        $('.popup-mask').show();

        $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&time=' + time + '&day=' + year + '-' + mon + '-' + date);
        //console.log(time);
    }); //新建 周

    $('.calendar3 .eventList').click(function (e) {
        var time = '';
        $('.calendar3 .calendarKey strong').each(function () {
            if ($(this).offset().top > e.pageY) {
                time = $(this).prev().attr('time');
                return false;
            }
        });

        if (time == '') {
            time = '20:00';
        }
        var data = $('.calendar3').find('.calenderDayHeader').eq($(this).parent().index()).attr('time');
        $('#iframe').show();
        $('.popup-mask').show();
        $('#iframe').height(620).css('margin-top', '-310px')

        $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + data + '&time=' + time);
    }); //新建 月

    $('.calendar2 .scroll>div').click(function (e) {
        var time = $(this).attr('time');
        $('#iframe').show();
        $('.popup-mask').show()
        $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time);
        $('#iframe').height(620).css('margin-top', '-310px')

    });
    $('.newbtn').click(function () {
        $('.popup-mask').show()
        $('#iframe').show();
        $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&');
        $('#iframe').height(620).css('margin-top', '-310px')

    });
    $('.meetingroom-message').click(function () {
        $('#iframe').height(620).css('margin-top', '-310px')

        $('.popup-mask').show()
        $('#iframe').show();
        $('#iframe').attr('src', '/alert/meeting/meetingdetail.html?entityName=MeetingRec&objectTypeCode=5000&id=' + $(this).attr('id'));
        return false;
    })
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
            //console.log(value);
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
    if ($('.layui-laydate-content tr:last td').eq(0).hasClass('laydate-day-next')) {
        //console.log($('.layui-laydate-content tr:last td').eq(0))

        $('.layui-laydate-content tr:last td').eq(0).parent().remove()
    }
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
        $('.slds-brand-band-zhou .eventList').eq(index).attr('time', date);
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

    if ($('.daytype-chook li').eq(1).hasClass('active')) {
        $('.header-left-title-time').html(startdate + '-' + enddate);
    }

    if ($('.daytype-chook li').eq(2).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月");
    }

    var date = $('.layui-this').attr('lay-ymd');
    date = date.split('-')[2];
    var weeks = $('.layui-laydate-content th').eq($('.layui-this').index()).html();
    $('.calder-content-head p').eq(0).html(date);
    $('.calder-content-head p').eq(1).html('星期' + weeks);
    $('.calendar2').find('.scroll div').remove();
    $('.layui-laydate-content td').each(function () {
        $('.calendar2').find('.scroll').append("<div time=\"" + $(this).attr('lay-ymd') + "\" class=\"\" style=\"height:116px;border:1px solid rgb(221, 219, 218);border-width:0 1px 1px 0;float:left;\">\n            <span style=\"margin:5px;display:inline-block\">" + $(this).html() + "</span>\n        </div>");
    });
    $('.calendar2').find('.scroll>div').each(function () {
        if ($(this).attr('time') == $('.layui-laydate-content .tody').attr('lay-ymd')) {
            $(this).css('background-color', '#f0faff')
        }
    })
} //获取数据


function getdata() {

    $('.eventList div').remove();

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        var startTime = $('.layui-this').attr('lay-ymd');
        var endTime = $('.layui-this').attr('lay-ymd');
    }

    if ($('.daytype-chook li').eq(1).hasClass('active')) {
        var startTime = $('.layui-this').parent().find('td:first').attr('lay-ymd');
        var endTime = $('.layui-this').parent().find('td:last').attr('lay-ymd');
    }

    if ($('.daytype-chook li').eq(2).hasClass('active') && $('.layui-this').length > 0) {
        var startTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-1';
        var endTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-' + new Date(year, mon, 0).getDate();
    }

    function callback(data) {
        //console.log(data);
        contextuserid = data.context.userid;
        contextname = data.context.name;
        $('#iframe').attr('contextuserid', contextuserid);
        $('#iframe').attr('contextname', contextname);
        weekdata(data);

        daydata(data);
        mondata(data);
        newmsg();
    }

    var d = {
        startTime: startTime,
        endTime: endTime
    };
    ajaxMethodGetData('meeting.getall', d, callback);
} //日视图数据


var contextuserid = '';
var contextname = '';

function daydata(data) {
    for (var i = 0; i < data.returnValue.meetings.length; i++) {
        var res = data.returnValue.meetings[i];
        var name = res.calendar.Name;
        var id = res.calendar.Id;
        var color = res.calendar.Color;

        for (var j = 0; j < res.meetingItems.length; j++) {
            var ress = res.meetingItems[j];
            var canApprove = ress.entityActionConfig.canApprove;
            var isEditable = ress.entityActionConfig.isEditable
            var isDeletable = ress.entityActionConfig.isDeletable
            var Id = ress.Id;
            var Subject = ress.Subject;
            var Attachs = ress.Attachs;
            var TelePhone = ress.TelePhone;
            var Description = ress.Description;
            var ScheduledEnd = ress.ScheduledEnd.split(' ')[1];
            var ScheduledStart = ress.ScheduledStart.split(' ')[1];
            var ScheduledEnd2 = ress.ScheduledEnd.split(' ').join(' ');
            var ScheduledStart2 = ress.ScheduledStart.split(' ').join(' ');
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

            var height = h * 60 - 2;
            var top = (starth - 7 + mh) * 60;
            top = parseInt(top)

            var startday = ress.ScheduledStart.split(' ')[0]
            var endday = ress.ScheduledEnd.split(' ')[0]
            if (startday != endday) {
                top = 0
                height = 58
            }
            $('.calendar1').find('.rowCore .eventList').eq(i).append("\n            <div canApprove='" + canApprove + "' isEditable='" + isEditable + "'isDeletable='" + isDeletable + "'ApproveByIds = \"" + Id + "\"\n            TelePhone=\"" + TelePhone + "\"\n            Description=\"" + Description + "\"\n            Attachs=\"" + Attachs + "\"\n            Subject = \"" + Subject + "\"\n            ScheduledEnd = \"" + ScheduledEnd2 + "\"\n            ScheduledStart = \"" + ScheduledStart2 + "\"\n            Id=\"" + Id + "\"\n            OwningUserName =\"" + name + "\" \n            class=\"meetingroom-message widthitem2\" \n            style='top:" + top + "px;height:" + height + "px;background-color:#" + color + "'>\n                <p>" + Subject + "</p>\n                <p><span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span></p>\n                <p>" + name + "</p>\n            </div>");
        }
    }



    $('.calendar1 .eventList').each(function () {
        var that = this;
        var numberindex = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var numberindex2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        $(this).find('div').each(function () {
            var height = $(this).height();
            var top = parseInt($(this).css('top').split('px')[0]);
            var endtop = height + top;
            var startnumber = top / 60;
            var endnumber = endtop / 60;

            for (var i = 0; i < endnumber - startnumber; i++) {
                numberindex[startnumber + i - 1]++;
                numberindex2[startnumber + i - 1]++;
            }
        });
        $(this).find('div').each(function () {
            var that2 = this;
            var height = $(this).height();
            var top = parseInt($(this).css('top').split('px')[0]);
            var endtop = height + top;
            var startnumber = top / 60;
            var endnumber = endtop / 60;
            var calnumber = 1;
            var calnumber2 = 1;
            var calnumber2index = 0;

            for (var i = 0; i < endnumber - startnumber; i++) {
                if (numberindex[startnumber - 1 + i] > calnumber) {
                    calnumber = numberindex[startnumber + i - 1];
                }
            }

            var width = 100 / calnumber - 1;
            $(this).css('width', width + '%');
            var left = 0;
            $(that).find('div').each(function () {
                if ($(this).attr('startnumber') <= endnumber) {
                    if ($(this).width() < $(that2).width()) {
                        width = $(this).attr('style').split('width:')[1].split(';')[0];
                        $(that2).css('width', width);
                    } else {
                        width = $(that2).attr('style').split('width:')[1].split(';')[0];
                        $(this).css('width', width);
                    }
                }

                if ($(this).attr('endnumber') >= startnumber) {
                    if ($(this).width() < $(that2).width()) {
                        width = $(this).attr('style').split('width:')[1].split(';')[0];
                        $(that2).css('width', width);
                    } else {
                        width = $(that2).attr('style').split('width:')[1].split(';')[0];
                        $(this).css('width', width);
                    }
                }
            });
            $(this).attr('startnumber', startnumber);
            $(this).attr('endnumber', endnumber);
        });
        $(this).find('div').each(function () {
            var height = $(this).height();
            var top = parseInt($(this).css('top').split('px')[0]);
            var endtop = height + top;
            var startnumber = top / 60;
            var endnumber = endtop / 60;
            var calnumber = 1;
            var calnumber2 = 1;
            var calnumber2index = 0;

            for (var i = 0; i < endnumber - startnumber; i++) {
                if (numberindex[startnumber - 1 + i] > calnumber) {
                    calnumber = numberindex[startnumber + i - 1];
                    calnumber2 = numberindex2[startnumber + i - 1];
                    calnumber2index = i;
                }
            }

            var left = 0;
            var width = $(this).attr('style').split('width:')[1].split(';')[0];
            width = Math.ceil(width.split('%')[0]);

            for (var i = 0; i < calnumber2 - 1; i++) {
                left += width;
            }

            $(this).css('left', left + '%');
            numberindex2[startnumber + calnumber2index - 1]--;
        });
    });
    hover();
} //周视图数据


function weekdata(data) {
    var res = data.returnValue.meetings[0];
    var name = res.calendar.Name;
    var id = res.calendar.Id;
    var color = res.calendar.Color;

    for (var j = 0; j < res.meetingItems.length; j++) {
        var ress = res.meetingItems[j];
        var Id = ress.Id;
        var Subject = ress.Subject;
        var Attachs = ress.Attachs;
        var Description = ress.Description;

        if (ress.TelePhone) {
            var TelePhone = ress.TelePhone;
        } else {
            var TelePhone = ress.TelePhone = '';
        }
        var canApprove = ress.entityActionConfig.canApprove;
        var isEditable = ress.entityActionConfig.isEditable
        var isDeletable = ress.entityActionConfig.isDeletable

        var ScheduledEnd = ress.ScheduledEnd.split(' ')[1];
        var ScheduledStart = ress.ScheduledStart.split(' ')[1];
        var ScheduledEnd2 = ress.ScheduledEnd.split(' ').join(' ');
        var ScheduledStart2 = ress.ScheduledStart.split(' ').join(' ');
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
        var smh = 0;

        if (endm == '30') {
            mh = 0.5;
        }

        if (startm == '30') {
            smh = 0.5;
        }

        var height = h * 60 - 1;
        var top = (starth - 7 + smh) * 60;
        var index = 0;
        var index2 = 6;
        var time = ress.ScheduledStart.split(' ')[0];

        if (time.indexOf('-0') != -1) {
            time = time.split('-0').join('-');
        }

        if (time.indexOf('-0') != -1) {
            time = time.split('-0').join('-00');
        }
        var endtime = ress.ScheduledEnd.split(' ')[0];

        if (endtime.indexOf('-0') != -1) {
            endtime = endtime.split('-0').join('-');
        }

        if (endtime.indexOf('-0') != -1) {
            endtime = endtime.split('-0').join('-00');
        }

        $('.calendar3 .calenderDayHeader').each(function () {
            if ($(this).attr("time") == time) {
                index = $(this).index();
            }
            if ($(this).attr("time") == endtime) {
                index2 = $(this).index();
            }
        });

        var startday = ress.ScheduledStart.split(' ')[0]
        var endday = ress.ScheduledEnd.split(' ')[0]

        if (startday == endday) {
            $('.calendar3').find('.rowCore .eventList').eq(index).append("\n            <div \n  canApprove='" + canApprove + "'  isEditable='" + isEditable + "'isDeletable='" + isDeletable + "'       ApproveByIds = \"" + Id + "\"\n            TelePhone=\"" + TelePhone + "\"\n            Description=\"" + Description + "\"\n            Attachs=\"" + Attachs + "\"\n            Subject = \"" + Subject + "\"\n            ScheduledEnd = \"" + ScheduledEnd2 + "\"\n            ScheduledStart = \"" + ScheduledStart2 + "\"\n            OwningUserName =\"" + name + "\" \n            Id=\"" + Id + "\"\n            class=\"meetingroom-message widthitem2\" \n            style='top:" + top + "px;height:" + height + "px;background-color:#" + color + "'>\n                <p>" + Subject + "</p>\n                <p><span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span></p>\n                <p>" + name + "</p>\n            </div>");
        } else {
            height = 59
            $('.calendar3').find('.rowCore .eventList').each(function () {
                if ($(this).parent().index() >= index && $(this).parent().index() <= index2) {
                    $(this).append("\n            <div \n  canApprove='" + canApprove + "'   isEditable='" + isEditable + "'isDeletable='" + isDeletable + "'       ApproveByIds = \"" + Id + "\"\n            TelePhone=\"" + TelePhone + "\"\n            Description=\"" + Description + "\"\n            Attachs=\"" + Attachs + "\"\n            Subject = \"" + Subject + "\"\n            ScheduledEnd = \"" + ScheduledEnd2 + "\"\n            ScheduledStart = \"" + ScheduledStart2 + "\"\n            OwningUserName =\"" + name + "\" \n            Id=\"" + Id + "\"\n            class=\"meetingroom-message widthitem2\" \n            style='top:" + 0 + "px;height:" + height + "px;background-color:#" + color + "'>\n                <p>" + Subject + "</p>\n                <p><span>" + ScheduledStart2 + "</span>-<span>" + ScheduledEnd2 + "</span></p>\n                <p>" + name + "</p>\n            </div>");
                }
            })
        }
    }
    $('.calendar3 .eventList').each(function () {
        $(this).find('div').each(function () {
            var that = this;
            var height = $(this).height();
            var top = parseInt($(this).css('top').split('px')[0]);
            var calnumber = 0;
            $(this).parent().find('div').not(that).each(function () {
                var top2 = parseInt($(this).css('top').split('px')[0]);

                if (top <= top2 && top2 <= top + height) {
                    calnumber++;
                    $(this).remove();
                    $(that).css('width', '80%');
                    var top3 = $(that).css('top');
                    $(that).next('.more').remove();
                    $(that).after("<div class='more'style='width:20%;top:" + top3 + ";right:0;'>" + '+' + calnumber + "\u66F4\u591A</div>");
                }
            });
        });
    });


    hover();
} //月视图数据


function mondata(data) {
    $('.calendar2').find('.scroll>div div').remove();
    $('.calendar2 .scroll>div').each(function () {
        $(this).attr('calnumber', 0)
    })
    for (var i = 0; i < data.returnValue.meetings.length; i++) {
        var res = data.returnValue.meetings[i];
        var name = res.Name;
        var id = res.ResourceId;
        var ApproveByIds = res.ApproveByIds;
        var Color = res.calendar.Color;
        var name = res.calendar.Name;

        for (var j = 0; j < res.meetingItems.length; j++) {
            var ress = res.meetingItems[j];
            var Id = ress.Id;
            var OwningUserName = ress.OwningUserName;
            var Subject = ress.Subject;
            var Location = ress.Location;
            var Roomname = ress.RoomIdName;
            var OwningBusinessUnitName = ress.OwningBusinessUnitName;
            var StateCode = ress.StateCode + 1;
            var Attachs = ress.Attachs;
            var TelePhone = ress.MeetingContent;
            var Description = ress.Description;
            var ScheduledEnd = ress.ScheduledEnd.split(' ')[1];
            var ScheduledStart = ress.ScheduledStart.split(' ')[1];
            var ScheduledEnd2 = ress.ScheduledEnd.split(' ').join(' ');
            var ScheduledStart2 = ress.ScheduledStart.split(' ').join(' ');
            var ScheduledStart3 = ress.ScheduledStart.split(' ')[0];
            var ScheduledEnd3 = ress.ScheduledEnd.split(' ')[0];
            var starth = ScheduledStart.split(':')[0];
            var startm = ScheduledStart.split(':')[1];
            var endh = ScheduledEnd.split(':')[0];
            var endm = ScheduledEnd.split(':')[1];
            var key = 0;
            var time = ScheduledStart3;
            var endtime = ScheduledEnd3;
            var canApprove = ress.entityActionConfig.canApprove;
            var isEditable = ress.entityActionConfig.isEditable
            var isDeletable = ress.entityActionConfig.isDeletable
            var index = '';
            var calnumber = 0;

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-');
            }

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-00');
            }

            if (endtime.indexOf('-0') != -1) {
                endtime = endtime.split('-0').join('-');
            }

            if (endtime.indexOf('-0') != -1) {
                endtime = endtime.split('-0').join('-00');
            }
            $('.calendar2 .scroll>div').each(function () {
                if ($(this).attr("time") == time) {
                    key = 1;
                }
                if (key == 1) {
                    calnumber++;

                    if ($(this).find('div').length < 2) {
                        //$(this).append("\n                           <div\n canApprove='" + canApprove + "'      isEditable='" + isEditable + "'isDeletable='" + isDeletable + "'      Roomname = \"" + Roomname + "\"\n              ApproveByIds = \"" + Id + "\"\n                           TelePhone=\"" + TelePhone + "\"\n                           Description=\"" + Description + "\"\n                           Attachs=\"" + Attachs + "\"\n                           Subject = \"" + Subject + "\"\n                           ScheduledEnd = \"" + ScheduledEnd2 + "\"\n                           ScheduledStart = \"" + ScheduledStart2 + "\"\n                           OwningUserName =\"" + name + "\" \n                           Id=\"" + Id + "\"\n                           class=\"meetingroom-message widthitem2\"\n                           style='background-color:#" + Color + "'>\n                           <p>" + Subject + "</p>\n                           <p><span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span>\n                           " + name + "\u5206\u914D\u7684</p>\n                       </div>");
                        $(this).append("\n                           <div\n  canApprove='" + canApprove + "'     isEditable='" + isEditable + "'isDeletable='" + isDeletable + "'      Roomname = \"" + Roomname + "\"\n              ApproveByIds = \"" + Id + "\"\n                           TelePhone=\"" + TelePhone + "\"\n                           Description=\"" + Description + "\"\n                           Attachs=\"" + Attachs + "\"\n                           Subject = \"" + Subject + "\"\n                           ScheduledEnd = \"" + ScheduledEnd2 + "\"\n                           ScheduledStart = \"" + ScheduledStart2 + "\"\n                           OwningUserName =\"" + name + "\" \n                           Id=\"" + Id + "\"\n                           class=\"meetingroom-message widthitem2\"\n                           style='background-color:#" + Color + "'>\n                           <p style='margin-bottom:2px;'>" + (Location ? Location + '&nbsp;&nbsp;&nbsp;' : '') + (Roomname ? Roomname + '&nbsp;&nbsp;&nbsp;' : '') + name + "</p>\n                           <p>" + (OwningBusinessUnitName ? OwningBusinessUnitName + '&nbsp;&nbsp;&nbsp;' : '') + (Subject ? Subject + '&nbsp;&nbsp;&nbsp;' : '') + "<span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span></p>\n                       </div>");
                    } else {
                        $(this).attr('calnumber', parseInt($(this).attr('calnumber')) + 1)
                    }
                    if ($(this).attr("time") == endtime) {
                        key = 0;
                    }
                }
            });
        }
    }
    $('.calendar2 .scroll>div').each(function () {
        if ($(this).attr('calnumber') > 0) {
            $(this).append("<div style='position:static ;'class='more'>+" + $(this).attr('calnumber') + " \u66F4\u591A</div>");

        }
    })


    hover();
    var width = 0;
    $('.calendar2 .calendarDayHeaders strong').each(function () {
        width += $(this).width() + 1;
    }); //$('.calendar2 .scroll').width(width)
} //悬浮详情


var hoverindex = 0;

function hover1() {
    $('.meetingroom-message').mouseenter(function (e) {
        if (hoverindex != 1) {
            hoverindex = 0;
            $('.card-hover-point').show();
            var top = $(this).offset().top;
            var top2 = $(this).offset().top;
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

            if (left < 0) {
                left = 367;
                top -= 50;
                $('.card-hover-point').css({
                    top: top + 60,
                    left: left - 10
                });
            }

            $('.meetingroom-message-hover1').show().css({
                top: top,
                left: left
            });
            //$('.meetingroom-message-hover-foot-right div').eq(0).attr('Id', $(this).attr('Id'));

            //if ($(this).attr('iseditable') != 'true') {
            //    $('.meetingroom-message-hover-foot-right div').eq(0).hide();
            //} 
            //if ($(this).attr('isdeletable') != 'true') {
            //    $('.meetingroom-message-hover-foot-right div').eq(1).hide();
            //}
            $('.meetingroom-message-hover-foot-right div').eq(1).attr('Id', $(this).attr('Id'));
            $('.meetingroom-message-hover-foot-right div').eq(2).attr('Id', $(this).attr('Id'));
            $('.meetingroom-message-hover-foot-right div').eq(3).attr('Id', $(this).attr('Id'));
            $('.meetingroom-message-hover-foot-right div').hide();
            if ($(this).attr('canApprove') != 'false') {
                $('.meetingroom-message-hover-foot-right div').eq(1).show();
            }
            if ($(this).attr('isEditable') != 'false') {
                $('.meetingroom-message-hover-foot-right div').eq(2).show();
            }
            if ($(this).attr('isDeletable') != 'false') {
                $('.meetingroom-message-hover-foot-right div').eq(3).show();
            }
            $('.meetingroom-message-hover-foot-right div').eq(1).hide();
            $('.meetingroom-message-hover-foot-right div').eq(0).hide();
            //if ($(this).attr('canBusinessUnitApprove') != 'false') {
            //    $('.meetingroom-message-hover-foot-right div').eq(0).show();
            //}
            //$('.meetingroom-message-hover-foot-right>span').remove()
            //if ($(this).attr('businessapprovestatecode') == '1') {
            //    $('.meetingroom-message-hover-foot-right').prepend('<span style="float:left;line-height:32px;">部门审批通过</span>')
            //}
            //if ($(this).attr('businessapprovestatecode') == '2') {
            //    $('.meetingroom-message-hover-foot-right').prepend('<span style="float:left;line-height:32px;">部门审批拒绝</span>')
            //}

            $('.meetingroom-message-hover1').find('.header-left-title-name').html($(this).attr('Subject'));
            $('.meetingroom-message-hover1').find('.OwningUserName').html($(this).attr('OwningUserName'));
            $('.meetingroom-message-hover1').find('.Roomname').html($(this).attr('Roomname'));
            $('.meetingroom-message-hover1').find('.ScheduledStart').html($(this).attr('ScheduledStart'));
            $('.meetingroom-message-hover1').find('.ScheduledEnd').html($(this).attr('ScheduledEnd'));
            $('.meetingroom-message-hover1').find('.Attachs').html($(this).attr('Attachs'));
            $('.meetingroom-message-hover1').find('.TelePhone').html($(this).attr('TelePhone'));
            $('.meetingroom-message-hover1').find('.Description').html($(this).attr('Description'));
        }
    }).mouseleave(function (e) {
        //console.log(e)
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

$('.meetingroom-message-hover .close').click(function (e) {
    $('.card-hover-point').hide();
    $('.meetingroom-message-hover').hide();

    if (hoverindex == 0) {
        hoverindex = 1;
    }

    return false;
});

function hover() {
    $('.more').off();
    hover1();
    $(document).click(function () {
        $('.meetingroom-message-hover').hide();
        $('.card-hover-point').hide();
    });
    $('.more').click(function () {
        $('.card-hover-point').hide();
        $('.meetingroom-message-hover').hide();
        var time = $(this).parent().attr('time');
        var m = time.split('-')[1];
        var d = time.split('-')[2];
        var week = time.split('/')[2];
        m = mon;
        d = time.split('-')[2];
        week = new Date(year, mon - 1, d).getDay();

        switch (week) {
            case 0:
                week = '星期日';

            case 1:
                week = '星期一';

            case 2:
                week = '星期二';

            case 3:
                week = '星期三';

            case 4:
                week = '星期四';

            case 5:
                week = '星期五';

            case 6:
                week = '星期六';
        }

        $('.meetingroom-message-hover2').find('.header-left-title-name').html(week + ',' + m + '月' + d);
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
            //console.log(data);
            $('.meetingroom-message-hover2 .meetingroom-message-hover-body .meetingroom-message').remove();

            for (var j = 0; j < data.returnValue.meetings.length; j++) {
                var res = data.returnValue.meetings[j];
                var Color = res.calendar.Color;
                var name = res.calendar.Name;

                for (var i = 0; i < data.returnValue.meetings[j].meetingItems.length; i++) {
                    var res = data.returnValue.meetings[j].meetingItems[i];
                    var OwningUserName = res.OwningUserName;
                    var ScheduledStartTime = res.ScheduledStartTime;
                    var ScheduledEndTime = res.ScheduledEndTime;
                    var Subject = res.Subject;
                    var OwningUserName = res.OwningUserName;
                    var ScheduledEnd = res.ScheduledEnd.split(' ')[1];
                    var ScheduledStart = res.ScheduledStart.split(' ')[1];
                    var ScheduledEnd2 = res.ScheduledEnd.split(' ').join(' ');
                    var ScheduledStart2 = res.ScheduledStart.split(' ').join(' ');
                    var Attachs = res.Attachs;
                    var Description = res.Description;
                    var TelePhone = res.TelePhone;
                    var canApprove = res.entityActionConfig.canApprove;
                    var isEditable = res.entityActionConfig.isEditable
                    var isDeletable = res.entityActionConfig.isDeletable
                    var Id = res.Id
                    $('.meetingroom-message-hover2 .meetingroom-message-hover-body').append("\n                    <div \n  Id=\"" + Id + "\"\n  canApprove='" + canApprove + "'  isEditable=\"" + isEditable + "\"\n isDeletable=\"" + isDeletable + "\"\n                TelePhone=\"" + TelePhone + "\"\n                    Description=\"" + Description + "\"\n                    Attachs=\"" + Attachs + "\" \n                    Subject = \"" + Subject + "\"\n                    ScheduledEnd = \"" + ScheduledEnd2 + "\"\n                    ScheduledStart = \"" + ScheduledStart2 + "\"\n                    OwningUserName =\"" + name + "\" \n                    class=\"meetingroom-message meetingroom-message1 meetingroom-moremessage\"\n                    style='background-color:#" + Color + "'>\n                    <p>" + name + "\u5206\u914D\u7684\n                    <span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span>\n                    <span>" + Subject + "</span>\n                </p>\n                </div>");
                }
            }

            hover1();
        }

        var time = $(this).parent().attr('time');
        var d = {
            startTime: time,
            endTime: time
        };
        ajaxMethodGetData('meeting.getall', d, callback);
        return false;
    });
}


//部门审批
$('.meetingroom-message-hover-foot-right div').eq(0).click(function () {

    var Id = $(this).next().attr('Id');
    $('#iframe').attr('src', '/template/alert/meetingroommsg_deptsp.html?id=' + Id);
    setTimeout(function () {
        $('#iframe').show();
        $('.popup-mask').show()
    }, 100);
});

//管理员审批
$('.meetingroom-message-hover-foot-right div').eq(1).click(function () {
    var Id = $(this).attr('Id');
    $('#iframe').attr('src', '/template/alert/meetingroommsg_sp.html?id=' + Id);
    setTimeout(function () {
        $('#iframe').show();
        $('.popup-mask').show()
    }, 100);
});

//编辑
$('.meetingroom-message-hover-foot-right div').eq(2).click(function () {
    $('#iframe').show();
    $('.popup-mask').show();
    var Id = $(this).attr('id');
    $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&id=' + Id);
    $('#iframe').height(620).css('margin-top', '-310px')

});

//删除
$('.meetingroom-message-hover-foot-right div').eq(3).click(function () {
    $('#iframe').show();
    $('.popup-mask').show();
    var Id = $(this).prev().attr('id');
    $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + Id + '&objTypeCode=5000').height(280).css('margin-top', '-140px');
});

$('.selectlist2').parent().click(function () {
    $('.selectlist2').not($(this).find('.selectlist2')).hide();

    if ($(this).find('.selectlist2').css('display') == 'none') {
        $(this).find('.selectlist2').show();
        $(this).find('.selectlist2').css('margin-top', '25px');

        if ($(this).find('.selectlist2').offset().top + $(this).find('.selectlist2').height() > $(window).height()) {
            var top = $(this).find('.selectlist2').height() + 20;
            $(this).find('.selectlist2').css('margin-top', '-' + top + 'px');
        }
    } else {
        $(this).find('.selectlist2').hide();
    }

    return false;
});
$(document).click(function () {
    $('.selectlist2').hide();
}); //颜色选择

$('.colorItem').click(function () {
    $(this).parents('.calendarListPanel-item-body').find('.item-color').css('background-color', $(this).css('background-color'));
});
$(document).ready(function () {
    var heighe = $(window).height() - 640;
    $('.calendarListPanel').css('height', heighe);
}); //共享日历

$('.sharecal').click(function () {
    $('#iframe').show().attr('src', '/template/alert/share_cal.html');
    $('#iframe').height(620).css('margin-top', '-310px')

});
$('.addcal').click(function () {
    $('#iframe').show().attr('src', '/template/alert/add_cal.html');
    $('#iframe').height(620).css('margin-top', '-310px')

});
//详情页
$('.meetingroom-message-hover-left').click(function () {
    var id = $(this).next().find('div').eq(0).attr('id')
    window.location.href = '/00V/detail?id=' + id + '&objectTypeCode=5000'
})