var noticeforreading = false //阅读须知


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
    $('.table-flexleft').css('top', -$(this).scrollTop());
}); //高度

$(document).ready(function () {
    var height = $(window).height() - 235;
    $('.rowCore').css('max-height', height);
    $('.calendar3 .calendarRow').css('max-height', height);
}); //视图选择

$('.daytype-chook li').eq(0).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar1').show();
    $('.calderlist').hide();

    $(".header-left-title-time").html(year + "年" + mon + "月" + date + "日" + ' ' + weeksday[weekday]);
    getdata();
});
$('.daytype-chook li').eq(1).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar3').show();
    $('.calderlist').hide();

    $('.header-left-title-time').html(startdate + '-' + enddate);
    getdata();
});
$('.daytype-chook li').eq(2).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar2').show();
    $('.calderlist').hide();

    $(".header-left-title-time").html(year + "年" + mon + "月");
    getdata();
});
$('.daytype-chook li').eq(3).click(function () {
    $('.calendar').hide();
    $('.slds-brand-band-zhou').hide();
    $('.calderlist').show();
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
    $('.calendar1 .eventList').off()
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
        $('#iframe').show().height(620);
        $('.popup-mask').show()
        if (noticeforreading) {
            var nexturl = '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&time=' + time + '%26day=' + year + '-' + mon + '-' + date + '%26roomid=' + roomid + '%26roomname=' + roomname
            $('#iframe').attr('src', '/template/alert/noticeforreading.html?nexturl=' + nexturl)
        } else {
            $('#iframe').attr('src', '/alert/meeting/newmeeting.html?time=' + time + '&day=' + year + '-' + mon + '-' + date + '&roomid=' + roomid + '&roomname=' + roomname);

        }

        $('.meetingroom-message').click(function () {
            $('#iframe').height(620).css('margin-top', '-310px')

            $('.popup-mask').show()
            $('#iframe').show();
            $('#iframe').attr('src', '/alert/meeting/meetingdetail.html?entityName=MeetingRec&objectTypeCode=5000&id=' + $(this).attr('id'));
            return false;
        })
        //console.log(time);
    });

    //新建 周
    $('.calendar3 td').off()
    $('.calendar3 td').click(function (e) {
        var roomid = $(this).parent().attr('roomid');
        var roomname = $(this).parent().attr('roomname');




        var time = $('.calendar3').find('.calenderDayHeader').eq($(this).index() - 1).attr('time');

        var d = new Date();
        var currentdate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
        var d1 = new Date(time.replace(/\-/g, "\/"));
        var d2 = new Date(currentdate.replace(/\-/g, "\/"));
        if (d2 > d1) {
            alert("您预约的时间不合理，只能预约当前及未来日期!");
        }
        else {
            var that = this;
            //var d = {
            //    SelectDate: time,
            //    ResourceId: roomid,
            //}
            //function callback(data) {
            //    if (data.code == 1) {
            //        $('#iframe').show().height(620);
            //        $('.popup-mask').show()
            //        if (that.noticeforreading) {
            //            var nexturl = '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '%26roomid=' + roomid + '%26roomname=' + roomname
            //            $('#iframe').attr('src', '/template/alert/noticeforreading.html?nexturl=' + nexturl)
            //        } else {
            //            $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '&roomid=' + roomid + '&roomname=' + roomname);
            //        }
            //    }
            //    else {
            //        alert(data.msg)
            //    }
            //}
            //ajaxMethodPostData("meetingroom.reservation.isappointment", d, callback);
            $('#iframe').show().height(620);
            $('.popup-mask').show();
            if (that.noticeforreading) {
                var nexturl = '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '%26roomid=' + roomid + '%26roomname=' + roomname
                $('#iframe').attr('src', '/template/alert/noticeforreading.html?nexturl=' + nexturl)
            } else {
                $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '&roomid=' + roomid + '&roomname=' + roomname);
            }

        }
        $('.meetingroom-message').click(function () {
            $('#iframe').height(620).css('margin-top', '-310px')

            $('.popup-mask').show();
            $('#iframe').show();
            $('#iframe').attr('src', '/alert/meeting/meetingdetail.html?entityName=MeetingRec&objectTypeCode=5000&id=' + $(this).attr('id'));
            return false;
        })
    }); //新建 月
    addcalendar2()
    function addcalendar2() {
        $('.calendar2 td').off()
        $('.calendar2 td').click(function (e) {
            var roomid = '';
            var roomname = '';
            roomid = $(this).parent().attr('roomid');
            roomname = $(this).parent().attr('roomname');

            if (roomid == '') {
                roomid = $('.calendar3 .calendarKey strong:last').attr('roomid');
                roomname = $('.calendar3 .calendarKey strong:last').attr('roomname');
            }

            var time = $('.calendar2').find('.calenderDayHeader').eq($(this).index() - 1).attr('time');

            var d = new Date();
            var currentdate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
            var d1 = new Date(time.replace(/\-/g, "\/"));
            var d2 = new Date(currentdate.replace(/\-/g, "\/"));
            if (d2 > d1) {
                alert("您预约的时间不合理，只能预约当前及未来日期!");
            }
            else {
                var that = this;
                //var d = {
                //    SelectDate: time,
                //    ResourceId: roomid,
                //}
                //function callback(data) {
                //    if (data.code == 1) {
                //        $('#iframe').show();
                //        $('.popup-mask').show()
                //        if (that.noticeforreading) {
                //            var nexturl = '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '%26roomid=' + roomid + '%26roomname=' + roomname
                //            $('#iframe').attr('src', '/template/alert/noticeforreading.html?nexturl=' + nexturl)
                //        } else {
                //            $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '&roomid=' + roomid + '&roomname=' + roomname);
                //        }
                //    }
                //    else {
                //        alert(data.msg)
                //    }
                //}
                //ajaxMethodPostData("meetingroom.reservation.isappointment", d, callback);
                $('#iframe').show().height(620);
                $('.popup-mask').show();
                if (that.noticeforreading) {
                    var nexturl = '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '%26roomid=' + roomid + '%26roomname=' + roomname
                    $('#iframe').attr('src', '/template/alert/noticeforreading.html?nexturl=' + nexturl)
                } else {
                    $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&day=' + time + '&roomid=' + roomid + '&roomname=' + roomname);
                }
            }

        });
        $('.newbtn').off()
        $('.newbtn').click(function () {
            $('#iframe').show().height(620);
            $('.popup-mask').show();
            if (noticeforreading) {
                var nexturl = '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000'
                $('#iframe').attr('src', '/template/alert/noticeforreading.html?nexturl=' + nexturl)
            } else {
                $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000');

            }
        });
        $('.batch_newbtn').off()
        $('.batch_newbtn').click(function () {
            $('#iframe').show().height(620);
            $('.popup-mask').show();
            if (noticeforreading) {
                var nexturl = '/alert/meeting/batch_newmeeting.html?entityName=MeetingRec&objectTypeCode=5000'
                $('#iframe').attr('src', '/template/alert/noticeforreading.html?nexturl=' + nexturl)
            } else {
                $('#iframe').attr('src', '/alert/meeting/batch_newmeeting.html?entityName=MeetingRec&objectTypeCode=5000');

            }
        });
        $('.meetingroom-message').click(function () {
            $('#iframe').height(620).css('margin-top', '-310px')

            $('.popup-mask').show()
            $('#iframe').show();
            $('#iframe').attr('src', '/alert/meeting/meetingdetail.html?entityName=MeetingRec&objectTypeCode=5000&id=' + $(this).attr('id'));
            return false;
        })
    }

}
//周 日历


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

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月" + window.date + "日" + ' ' + '星期' + weeks);
    }

    window.weekday = $('.layui-this').index();
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

        weekday2++;

        if (weekday2 == 7) {
            weekday2 = 0;
        }
    }

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        var startTime = $('.layui-this').attr('lay-ymd');
        var endTime = $('.layui-this').attr('lay-ymd');
    }

    if ($('.daytype-chook li').eq(1).hasClass('active')) {
        var startTime = $('.layui-this').parent().find('td:first').attr('lay-ymd');
        var endTime = $('.layui-this').parent().find('td:last').attr('lay-ymd');
    }

    if ($('.daytype-chook li').eq(2).hasClass('active')) {
        var startTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-1';
        var endTime = $('.layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-this').attr('lay-ymd').split('-')[1] + '-' + new Date(year, mon, 0).getDate();
    }

    function callback(data) {
        //console.log(data);
        daydata(data);
        renderdata(data);
        weekdata(data);
        mondata(data);
        newmsg();
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
        endTime: endTime
    };
    ajaxMethodGetData('meetingroom.reservation.getlist2', d, callback);
} //日视图数据


function daydata(data) {
    $('.calendar1').find('.calendarDayHeaders .calenderDayHeader').remove();
    $('.calendar1').find('.rowCore .scroll .calendarDay').remove();
    $('.calendar1').find('.calendarDayHeaders').css('width', 220 * data.listData.length);
    $('.calendar1').find('.rowCore .scroll').css('width', 220 * data.listData.length);

    for (var i = 0; i < data.listData.length; i++) {
        var res = data.listData[i];
        var name = res.Name;
        var id = res.ResourceId;
        var ApproveByIds = res.ApproveByIds;
        $('.calendar1').find('.calendarDayHeaders').append("<strong class=\"calenderDayHeader\" >" + name + "</strong>");
        $('.calendar1').find('.rowCore .scroll').append("<div class=\"calendarDay \">\n        <div class=\"eventList\" roomname = \"" + name + "\"id=\"" + id + "\"roomid=\"" + id + "\"></div>\n            </div>");

        for (var j = 0; j < res.Reserves.length; j++) {
            var ress = res.Reserves[j];
            var ActionsConfig = ress.Room.ActionsConfig
            var canApprove = ActionsConfig.canApprove
            var canBusinessUnitApprove = ress.canBusinessUnitApprove
            var BusinessApproveStateCode = ress.BusinessApproveStateCode
            var canShow = ActionsConfig.canShow
            var isDeletable = ActionsConfig.isDeletable
            var isEditable = ActionsConfig.isEditable
            var isOwner = ActionsConfig.isOwner
            var isShareable = ActionsConfig.isShareable
            var Id = ress.Id;
            var MeetingId = ress.MeetingId;
            var CreatedByName = ress.CreatedByName;
            var OwningUser = ress.OwningUser
            var Subject = ress.Subject;
            var Roomname = ress.Room.Name;
            var StateCode = ress.StateCode + 1;
            var Attachs = ress.Attachs;
            var TelePhone = ress.TelePhone;
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

            var height = h * 60 - 1;

            var top = parseInt((starth - 7 + mh) * 60);

            if (BusinessApproveStateCode == 2) {
                StateCode = 3
            }

            $('.calendar1').find('.rowCore .eventList').eq(i).append("\n        <div BusinessApproveStateCode=\"" + BusinessApproveStateCode + "\" canBusinessUnitApprove=\"" + canBusinessUnitApprove + "\" canApprove = \"" + canApprove + "\"\n    <div isShareable = \"" + isShareable + "\"\n isOwner = \"" + isOwner + "\"\n isEditable = \"" + isEditable + "\"\n isDeletable = \"" + isDeletable + "\"\n canShow = \"" + canShow + "\"\n ApproveByIds = \"" + ApproveByIds + "\"\n            TelePhone=\"" + TelePhone + "\"\n           Description=\"" + Description + "\"\n         OwningUser=\"" + OwningUser + "\"\n            Attachs=\"" + Attachs + "\"\n            Roomname =\"" + Roomname + "\" \n            Subject = \"" + Subject + "\"\n            ScheduledEnd = \"" + ScheduledEnd2 + "\"\n            ScheduledStart = \"" + ScheduledStart2 + "\"\n            CreatedByName =\"" + CreatedByName + "\" \n     MeetingId=\"" + MeetingId + "\"\n       Id=\"" + Id + "\"\n            class=\"meetingroom-message meetingroom-message" + StateCode + "\" \n            style='top:" + top + "px;height:" + height + "px'>\n                <p>" + Subject + "</p>\n                <p><span>" + ScheduledStart + "</span>-<span>" + ScheduledEnd + "</span></p>\n                <p>\u5DF2\u88AB" + CreatedByName + "\u9884\u7EA6</p>\n\n            </div>");
        }
    }

    hover();
}
//周视图数据

function renderdata(data) {
    for (var i = 0; i < data.listData.length; i++) {
        var res = data.listData[i];
        var newarr = []
        for (var j = 0; j < res.Reserves.length; j++) {
            var reserve = res.Reserves[j]
            if (reserve.ScheduledEndDate != reserve.ScheduledStartDate) {
                var copyreserve = JSON.parse(JSON.stringify(reserve))
                var days = (new Date(reserve.ScheduledEndDate) - new Date(reserve.ScheduledStartDate)) / (1000 * 60 * 60 * 24)
                res.Reserves[j].ScheduledEnd = res.Reserves[j].ScheduledEndDate + 'T' + '24:00:00'
                for (var k = 0; k < days; k++) {
                    var newreserve = JSON.parse(JSON.stringify(copyreserve))
                    var step = (1000 * 60 * 60 * 24) * (k + 1)
                    var newdate = new Date(new Date(reserve.ScheduledStartDate) - 1 + 1 + step)

                    var ScheduledStartDate = newdate.getFullYear() + '-' + (newdate.getMonth() + 1) + '-' + newdate.getDate()
                    //newreserve.ScheduledStart = newreserve.ScheduledStartDate + 'T' + '00:00:00'
                    newreserve.Starttime = ScheduledStartDate

                    //if (k != days - 1) {
                    //    newreserve.ScheduledEnd = newreserve.ScheduledEndDate + 'T' + '24:00:00'
                    //} else {
                    //    console.log(k, 'k')
                    //    console.log(days, 'days')
                    //    console.log(newreserve.ScheduledEnd)
                    //}
                    newarr.push(newreserve)
                }
            }
        }
        data.listData[i].Reserves = data.listData[i].Reserves.concat(newarr)
    }
    return data
}
function weekdata(data) {
    $('#zhoucaltable tr').remove()

    for (var i = 0; i < data.listData.length; i++) {
        var res = data.listData[i];

        var name = res.Name;
        var id = res.ResourceId;
        var ApproveByIds = res.ApproveByIds;
        $('#zhoucaltable').append('<tr roomname="' + name + '" roomid="' + id + '"><td>' + name + '</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>')
        for (var j = 0; j < res.Reserves.length; j++) {
            var ress = res.Reserves[j];
            var ActionsConfig = ress.Room.ActionsConfig
            var canApprove = ActionsConfig.canApprove
            var canBusinessUnitApprove = ress.canBusinessUnitApprove
            var BusinessApproveStateCode = ress.BusinessApproveStateCode

            var canShow = ActionsConfig.canShow
            var isDeletable = ActionsConfig.isDeletable
            var isEditable = ActionsConfig.isEditable
            var isOwner = ActionsConfig.isOwner
            var isShareable = ActionsConfig.isShareable
            var Id = ress.Id;
            var MeetingId = ress.MeetingId;
            var CreatedByName = ress.CreatedByName;
            var OwningUser = ress.OwningUser;
            var Subject = ress.Subject;
            var Roomname = ress.Room.Name;
            var StateCode = ress.StateCode + 1;
            var Attachs = ress.Attachs;
            var TelePhone = ress.TelePhone;
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
            if (ress.Starttime) {
                time = ress.Starttime
            }
            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-');
            }

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-00');
            }
            if (BusinessApproveStateCode == 2) {
                StateCode = 3
            }
            $('.calendar3 .calenderDayHeader').each(function () {
                if ($(this).attr("time") == time) {
                    index = $(this).index();
                }
            });
            if (index !== '') {
                $('.calendar3').find('tr:last td').eq(index + 1).append("\n  <div BusinessApproveStateCode=\"" + BusinessApproveStateCode + "\" canBusinessUnitApprove=\"" + canBusinessUnitApprove + "\" canApprove = \"" + canApprove + "\"\n isShareable = \"" + isShareable + "\"\n isOwner = \"" + isOwner + "\"\n isEditable = \"" + isEditable + "\"\n isDeletable = \"" + isDeletable + "\"\n canShow = \"" + canShow + "\"\n Roomname =\"" + Roomname + "\" \n                Subject = \"" + Subject + "\"\n                ScheduledEnd = \"" + ScheduledEnd2 + "\"\n                ScheduledStart = \"" + ScheduledStart2 + "\"\n                CreatedByName =\"" + CreatedByName + "\" \n    OwningUser =\"" + OwningUser + "\" \n                Attachs =\"" + Attachs + "\" \n                TelePhone =\"" + TelePhone + "\" \n                Description =\"" + Description + "\" \n                ApproveByIds = \"" + ApproveByIds + "\"\n      MeetingId=\"" + MeetingId + "\"\n          Id=\"" + Id + "\"\n                class=\"meetingroom-message meetingroom-message" + StateCode + " widthitem2\"\n              >\n                <p>" + Subject + "</p>\n                <p><span>" + starth + ":" + startm + "</span>-<span>" + endh + ":" + endm + "</span>\n                " + CreatedByName + "\u9884\u7EA6</p>\n\n            </div>");

            }
        }
    }

    hover();
} //月视图数据


function mondata(data) {
    $('#yuecaltable tr').remove()
    $('.table-flexleft').html('')
    for (var i = 0; i < data.listData.length; i++) {
        var res = data.listData[i];
        var name = res.Name;
        var id = res.ResourceId;
        var ApproveByIds = res.ApproveByIds;
        $('#yuecaltable').append('<tr roomname="' + name + '" roomid="' + id + '"><td style="padding:5px;background-color:#f5f6f9" width="69">' + name + '</td></tr>')
        $('.table-flexleft').append('<div style="width:81px;">' + name + '</div>')
        $('.calendar2 .calendarDayHeaders strong').each(function (index, dom) {
            $('#yuecaltable tr:last').append('<td width="49"></td>')
        })
        for (var j = 0; j < res.Reserves.length; j++) {
            var ress = res.Reserves[j];
            var ActionsConfig = ress.Room.ActionsConfig
            var canApprove = ActionsConfig.canApprove
            var canBusinessUnitApprove = ress.canBusinessUnitApprove
            var BusinessApproveStateCode = ress.BusinessApproveStateCode
            var canShow = ActionsConfig.canShow
            var isDeletable = ActionsConfig.isDeletable
            var isEditable = ActionsConfig.isEditable
            var isOwner = ActionsConfig.isOwner
            var isShareable = ActionsConfig.isShareable
            var Id = ress.Id;
            var MeetingId = ress.MeetingId;
            var CreatedByName = ress.CreatedByName;
            var OwningUser = ress.OwningUser;
            var Subject = ress.Subject;
            var Roomname = ress.Room.Name;
            var StateCode = ress.StateCode + 1;
            var Attachs = ress.Attachs;
            var TelePhone = ress.TelePhone;
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
            if (ress.Starttime) {
                time = ress.Starttime
            }
            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-');
            }

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-00');
            }
            if (BusinessApproveStateCode == 2) {
                StateCode = 3
            }
            $('.calendar2 .calenderDayHeader').each(function () {
                if ($(this).attr("time") == time) {
                    index = $(this).index();
                    $(this).width(150);
                    $('.calendar2').find('tr:last td').eq(index + 1).width(149);
                }
            });
            if (index !== '') {
                $('.calendar2').find('tr:last td').eq(index + 1).append("\n  <div  canBusinessUnitApprove=\"" + canBusinessUnitApprove + "\"   BusinessApproveStateCode=\"" + BusinessApproveStateCode + "\" canApprove = \"" + canApprove + "\"\n    <div isShareable = \"" + isShareable + "\"\n isOwner = \"" + isOwner + "\"\n isEditable = \"" + isEditable + "\"\n isDeletable = \"" + isDeletable + "\"\n canShow = \"" + canShow + "\"\n           <div Roomname =\"" + Roomname + "\" \n                Subject = \"" + Subject + "\"\n                ScheduledEnd = \"" + ScheduledEnd2 + "\"\n                ScheduledStart = \"" + ScheduledStart2 + "\"\n                CreatedByName =\"" + CreatedByName + "\" \n    OwningUser =\"" + OwningUser + "\" \n                Attachs =\"" + Attachs + "\" \n                TelePhone =\"" + TelePhone + "\" \n                Description =\"" + Description + "\" \n                ApproveByIds = \"" + ApproveByIds + "\"\n     MeetingId=\"" + MeetingId + "\"\n           Id=\"" + Id + "\"\n                class=\"meetingroom-message meetingroom-message" + StateCode + " widthitem2\"\n >\n                <p>" + Subject + "</p>\n                <p><span>" + starth + ":" + startm + "</span>-<span>" + endh + ":" + endm + "</span>\n                " + CreatedByName + "\u9884\u7EA6</p>\n            </div>");
            }
        }

    }

    hover();
    var width = 81;
    $('.calendar2 .calendarDayHeaders strong').each(function () {
        //console.log($(this).width())
        width += $(this).width() + 1;
    });
    $('.calendar2 .scroll').width(width);
    setTimeout(function () {
        $('.table-flexleft>div').each(function () {
            //console.log($('#yuecaltable tr').eq($(this).index()))
            //console.log($('#yuecaltable tr').eq($(this).index()).height())
            $(this).height($('#yuecaltable tr').eq($(this).index()).height())
        })
    }, 0)

} //悬浮详情


var hoverindex = 0;

function hover1() {
    $('.meetingroom-message').hover(function () {
        if (hoverindex != 1) {
            hoverindex = 0;
        }

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
        if ($(this).attr('canBusinessUnitApprove') != 'false') {
            $('.meetingroom-message-hover-foot-right div').eq(0).show();
        }
        $('.meetingroom-message-hover-foot-right>span').remove()
        if ($(this).attr('businessapprovestatecode') == '1') {
            $('.meetingroom-message-hover-foot-right').prepend('<span style="float:left;line-height:32px;">部门审批通过</span>')
        }
        if ($(this).attr('businessapprovestatecode') == '2') {
            $('.meetingroom-message-hover-foot-right').prepend('<span style="float:left;line-height:32px;">部门审批拒绝</span>')
        }
        $('.meetingroom-message-hover1').find('.header-left-title-name').html($(this).attr('Subject'));
        $('.meetingroom-message-hover1').find('.CreatedByName').html($(this).attr('CreatedByName'));
        $('.meetingroom-message-hover1').find('.Roomname').html($(this).attr('Roomname'));
        $('.meetingroom-message-hover1').find('.ScheduledStart').html($(this).attr('ScheduledStart'));
        $('.meetingroom-message-hover1').find('.ScheduledEnd').html($(this).attr('ScheduledEnd'));
        $('.meetingroom-message-hover1').find('.attachs').html($(this).attr('Attachs'));
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
    $('.meetingroom-message').click(function () {
        return false;
    })
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
            //console.log(data);
            $('.meetingroom-message-hover2 .meetingroom-message-hover-body .meetingroom-message').remove();

            for (var i = 0; i < data.reserves.length; i++) {
                var res = data.reserves[i];
                var CreatedByName = res.CreatedByName;
                var OwningUser = res.OwningUser;
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

                var canApprove = res.Room.ActionsConfig.canApprove
                var canBusinessUnitApprove = res.canBusinessUnitApprove
                var BusinessApproveStateCode = res.BusinessApproveStateCode
                var canShow = res.Room.ActionsConfig.canShow
                var isDeletable = res.Room.ActionsConfig.isDeletable
                var isEditable = res.Room.ActionsConfig.isEditable
                var isOwner = res.Room.ActionsConfig.isOwner
                var isShareable = res.Room.ActionsConfig.isShareable
                $('.meetingroom-message-hover2 .meetingroom-message-hover-body').append("\n <div BusinessApproveStateCode=\"" + BusinessApproveStateCode + "\" canBusinessUnitApprove=\"" + canBusinessUnitApprove + "\" isShareable='" + isShareable + "' isOwner='" + isOwner + "' isEditable='" + isEditable + "' isDeletable='" + isDeletable + "' canApprove='" + canApprove + "' canShow='" + canShow + "' TelePhone=\"" + TelePhone + "\"OwningUser=\"" + OwningUser + "\"Description=\"" + Description + "\"Attachs=\"" + Attachs + "\"Roomname =\"" + Roomname + "\" Subject = \"" + Subject + "\"ScheduledEnd = \"" + ScheduledEnd2 + "\"ScheduledStart = \"" + ScheduledStart2 + "\"CreatedByName =\"" + CreatedByName + "\" class=\"meetingroom-message meetingroom-message1 meetingroom-moremessage\">\n                <p>\u5DF2\u88AB" + CreatedByName + "\u9884\u7EA6\n                <span>" + ScheduledStartTime + "</span>-<span>" + ScheduledEndTime + "</span>\n                <span>" + Subject + "</span>\n            </p>\n            </div>");
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
        ajaxMethodGetData('meetingroom.reservation.get', d, callback);
        return false;
    });
} //审批
$('.meetingroom-message-hover-foot-right .buttonbtn').eq(1).click(function () {
    var Id = $(this).attr('Id');
    $('#iframe').attr('src', '/template/alert/meetingroommsg_sp.html?id=' + Id).height(550);
    setTimeout(function () {
        $('#iframe').show();
        $('.popup-mask').show()
    }, 100);
}); //编辑

$('.meetingroom-message-hover-foot-right .buttonbtn').eq(2).click(function () {

    var Id = $(this).prev().attr('Id');
    $('#iframe').attr('src', '/alert/meeting/newmeeting.html?entityName=MeetingRec&objectTypeCode=5000&id=' + Id).height(620);
    setTimeout(function () {
        $('#iframe').show();
        $('.popup-mask').show()
    }, 100);
}); //删除

$('.meetingroom-message-hover-foot-right .buttonbtn').eq(3).click(function () {

    var Id = $(this).prev().prev().attr('Id');
    $('#iframe').attr('src', '/template/alert/delete_meetingroommsg.html?msgid=' + Id + '&name=会议室预约').height(210).addClass('deleteiframe');
    setTimeout(function () {
        $('#iframe').show();
        $('.popup-mask').show();
    }, 100);
});
//部门审批
$('.meetingroom-message-hover-foot-right .buttonbtn').eq(0).click(function () {

    var Id = $(this).next().attr('Id');
    $('#iframe').attr('src', '/template/alert/meetingroommsg_deptsp.html?id=' + Id).height(550);
    setTimeout(function () {
        $('#iframe').show();
    }, 100);
});
//编辑
