
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
}); //视图选择

$('.daytype-chook li').eq(0).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar1').show();
    $(".header-left-title-time").html(year + "年" + mon + "月" + date + "日" + ' ' + weeksday[weekday]);
    getdata('');
});
$('.daytype-chook li').eq(1).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar3').show();
    $('.header-left-title-time').html(startdate + '-' + enddate);
    getdata('');
});
$('.daytype-chook li').eq(2).click(function () {
    $('.slds-brand-band-zhou').show();
    $('.calendar').hide();
    $('.calendar2').show();
    $(".header-left-title-time").html(year + "年" + mon + "月");
    getdata('');
});
$('.daytype-chook li').eq(3).click(function () {
    window.location.href = '/scheduling/myCallist.aspx?t=eventhome&entityType=00U'
    //window.location.href = '/00U/o'
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
            return alert('请选择6点之后的时间')
        }
        $('.popup-mask').show();
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/alert_evtcal.html?time=' + time + '&day=' + year + '-' + mon + '-' + date + '&OwningUser=' + contextuserid + '&OwningUserName=' + contextname);
        // console.log(time);
    }); //新建 周
    $('.calendar3 .eventList').off()
    $('.calendar3 .eventList').click(function (e) {
        var time = '';
        $('.calendar3 .calendarKey strong').each(function () {
            if ($(this).offset().top > e.pageY) {
                time = $(this).prev().attr('time');
                return false;
            }
        });

        if (time == '') {
            return alert('请选择6点之后的时间')

        }
        var data = $('.calendar3').find('.calenderDayHeader').eq($(this).parent().index()).attr('time');
        $('.popup-mask').show();
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/alert_evtcal.html?day=' + data + '&time=' + time + '&OwningUser=' + contextuserid + '&OwningUserName=' + contextname);
    }); //新建 月
    $('.calendar2 .scroll>div').off()
    $('.calendar2 .scroll>div').click(function (e) {
        var time = $(this).attr('time');
        $('.popup-mask').show();
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/alert_evtcal.html?day=' + time + '&OwningUser=' + contextuserid + '&OwningUserName=' + contextname);
    });
    $('.newbtn').off()
    $('.newbtn').click(function () {
        //console.log(111);
        $('.popup-mask').show();
        $('#iframe').show();
        $('#iframe').attr('src', '/template/alert/alert_evtcal.html' + '?OwningUser=' + contextuserid + '&OwningUserName=' + contextname);
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
            //console.log(value);
            addlayui();
            calenderchange();
            weekindex = $('.layui-laydate-main .layui-this').parent().index();
            getcalendarshared()
        },
        change: function change(value) {
            addlayui();
            calenderchange(value);
            getdata('');
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
    if ($('.layui-laydate-content tr').eq(6).find('td').eq(0).hasClass('laydate-day-next')) {
        $('.layui-laydate-content tr').eq(6).hide()
    } else {
        $('.layui-laydate-content tr').eq(6).show()
    }


} //日期改变


function calenderchange(value) {
    if (value) {
        window.year = parseInt(value.split('-')[0]);
        window.mon = parseInt(value.split('-')[1]);
        window.date = parseInt(value.split('-')[2]);
    }

    $('.slds-brand-band-zhou .layui-laydate-main .layui-this').parent().parent().find('tr').css('background-color', '#fff');
    $('.slds-brand-band-zhou .layui-laydate-main .layui-this').parent().css('background-color', '#f8f8f8');
    $('.slds-brand-band-zhou').find('.calenderDayHeader').removeClass('presentDay');
    $('.slds-brand-band-zhou').find('.calenderDayHeader').eq($('.slds-brand-band-zhou .layui-laydate-main .layui-this').index()).addClass('presentDay');
    $('.slds-brand-band-zhou').find('.calendarDay').removeClass('checkedDay');
    $('.slds-brand-band-zhou').find('.calendarDay').eq($('.slds-brand-band-zhou .layui-laydate-main .layui-this').index()).addClass('checkedDay');
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

        var date = $('.layui-laydate-main .layui-this').parent().find('td').eq(index).attr('lay-ymd');
        $(this).attr('time', date);

        if ($(this).attr('time').split('-')[1] != window.mon) {
            $('.slds-brand-band-zhou .eventList').eq(index).css('background-color', '#f2f2f2')
        } else {
            $('.slds-brand-band-zhou .eventList').eq(index).css('background-color', '#fcfcfc')
        }
        var solar2lunardate = calendar.solar2lunar(date.split('-')[0], date.split('-')[1], date.split('-')[2])

        $('.slds-brand-band-zhou .eventList').eq(index).attr('time', date);
        date = date.split('-')[1] + '/' + date.split('-')[2] + '/';
        $(this).html(date + '(' + week + ')');
        $(this).append('<p>' + solar2lunardate.IMonthCn + solar2lunardate.IDayCn + '</p>')
        if (solar2lunardate.nWeek == 6 || solar2lunardate.nWeek == 7) {
            $(this).addClass('endweek')
        } else {
            $(this).removeClass('endweek')
        }

    });
    startdate = $('.slds-brand-band-zhou .layui-laydate-main .layui-this').parent().find('td:first').attr('lay-ymd');
    enddate = $('.slds-brand-band-zhou .layui-laydate-main .layui-this').parent().find('td:last').attr('lay-ymd');
    startdate = startdate.split('-')[0] + '年' + startdate.split('-')[1] + '月' + startdate.split('-')[2] + '日';
    enddate = enddate.split('-')[0] + '年' + enddate.split('-')[1] + '月' + enddate.split('-')[2] + '日';
    window.weekday = $('.layui-laydate-main .layui-this').index();

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月" + window.date + "日" + ' ' + weeksday[weekday]);
    }

    if ($('.daytype-chook li').eq(1).hasClass('active')) {
        $('.header-left-title-time').html(startdate + '-' + enddate);
    }

    if ($('.daytype-chook li').eq(2).hasClass('active')) {
        $(".header-left-title-time").html(year + "年" + mon + "月");
    }

    var date = $('.layui-laydate-main .layui-this').attr('lay-ymd');
    date = date.split('-')[2];
    var weeks = $('.layui-laydate-content th').eq($('.layui-laydate-main .layui-this').index()).html();
    $('.calder-content-head p').eq(0).html(date);
    $('.calder-content-head p').eq(1).html('星期' + weeks);
    $('.calendar2').find('.scroll div').remove();
    $('.layui-laydate-content td').each(function () {
        $('.calendar2').find('.scroll').append("<div time=\"" + $(this).attr('lay-ymd') + "\" class=\"\" style=\"height:124px;border:1px solid rgb(221, 219, 218);border-width:0 1px 1px 0;float:left;\">\n            <span class=\"daynumber\" style=\"margin:5px;display:inline-block\">" + $(this).html() + "</span>\n        </div>");
    });

    $('.calendar2').find('.scroll>div').each(function () {

        if ($(this).attr('time').split('-')[1] != window.mon) {
            $(this).css('background-color', '#f2f2f2')
        } else {
            $(this).css('background-color', '#fff')
        }
        if ($(this).attr('time') == $('.layui-laydate-content .tody').attr('lay-ymd')) {
            $(this).css('background-color', '#f0faff')
        }
        var solar2lunardate = calendar.solar2lunar($(this).attr('time').split('-')[0], $(this).attr('time').split('-')[1], $(this).attr('time').split('-')[2])

        if (solar2lunardate.nWeek == 6 || solar2lunardate.nWeek == 7) {
            $(this).addClass('endweek')
        } else {
            $(this).removeClass('endweek')
        }
        $(this).prepend('<span class="solar2lunardate">' + solar2lunardate.IMonthCn + solar2lunardate.IDayCn + '</span>')
    })

} //获取数据


function getdata(id) {
    $('.eventList div').remove(); //$('.calendar2 .calendarDayHeaders .calenderDayHeader').remove()
    //$('.calendar2 .scroll .calendarDay').remove()
    //var datecont = new Date(year, mon, 0).getDate()
    //var weekday2 = new Date(year, mon-1, 1).getDay()
    //for (var i = 0; i < datecont; i++) {
    //    var date = i+1
    //    if(weekday2==6||weekday2==0){
    //        $('.calendar2 .calendarDayHeaders').append(`
    //        <strong class="calenderDayHeader widthitem1" time="`+year+'-'+mon+'-'+date+`">
    //                <p class='weekend'>`+weeksday2[weekday2]+`</p>
    //                <p class='weekend'>`+date+`</p>
    //            </strong>`)
    //    }else{
    //        $('.calendar2 .calendarDayHeaders').append(`
    //        <strong class="calenderDayHeader widthitem1" time="`+year+'-'+mon+'-'+date+`">
    //                <p>`+weeksday2[weekday2]+`</p>
    //                <p>`+date+`</p>
    //            </strong>`)
    //    }
    //    $('.calendar2 .scroll').append(`
    //        <div class="calendarDay">
    //            <div class="eventList widthitem1"></div>
    //        </div>`)
    //    weekday2++
    //    if(weekday2==7){
    //        weekday2 = 0
    //    }
    //}

    if ($('.daytype-chook li').eq(0).hasClass('active')) {
        var startTime = $('.layui-laydate-main .layui-this').attr('lay-ymd');
        var endTime = $('.layui-laydate-main .layui-this').attr('lay-ymd');
    }

    if ($('.daytype-chook li').eq(1).hasClass('active')) {
        var startTime = $('.layui-laydate-main .layui-this').parent().find('td:first').attr('lay-ymd');
        var endTime = $('.layui-laydate-main .layui-this').parent().find('td:last').attr('lay-ymd');
    }

    if ($('.daytype-chook li').eq(2).hasClass('active')) {
        var startTime = $('.layui-laydate-main .layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-laydate-main .layui-this').attr('lay-ymd').split('-')[1] + '-1';
        var endTime = $('.layui-laydate-main .layui-this').attr('lay-ymd').split('-')[0] + '-' + $('.layui-laydate-main .layui-this').attr('lay-ymd').split('-')[1] + '-' + new Date(year, mon, 0).getDate();
    }

    function callback(data) {
        //console.log(data);
        contextuserid = data && data.context && data.context.userid ? data.context.userid : '';
        contextname = data && data.context && data.context.name ? data.context.name : '';
        $('#iframe').attr('contextuserid', contextuserid);
        $('#iframe').attr('contextname', contextname);
        daydata(data);
        weekdata(data);
        mondata(data);
        newmsg(); //contextuserid = data.context.userid
        //contextname = data.context.name
        //for (var i = 0; i < data.dayData.length; i++) {
        //    var time = data.dayData[i].day
        //    if(time.indexOf('-0')!=-1){
        //        time = time.split('-0').join('-')
        //    }
        //    if(time.indexOf('-0')!=-1){
        //        time = time.split('-0').join('-00')              
        //    }
        //    $('.layui-laydate-content').find('td[lay-ymd="'+time+'"]').addClass('msg-true')
        //}
    }
    var showMine = 1
    if ($('#showmycal').html() == '显示此日历') {
        showMine = 0
    }
    var d = {
        startTime: startTime,
        endTime: endTime,
        showMine: showMine,
        search: '',
        calendarId: id
    };
    ajaxMethodGetData('calendar.getlist', d, callback);
} //日视图数据

function daydata(data) {
    if (data == undefined || data == null)
        return;
    if (data.returnValue == undefined || data.returnValue == null)
        return;
    if (data.returnValue.calendars.length == 0)
        return;
    for (var i = 0; i < data.returnValue.calendars.length; i++) {
        var res = data.returnValue.calendars[i];
        var name = res.calendar.Name;
        var id = res.calendar.Id;
        var color = res.calendar.Color;
        var CalendarActionsConfig = res.calendar.CalendarActionsConfig;
        var isCalendarDeletable = CalendarActionsConfig ? CalendarActionsConfig.isCalendarDeletable : '';
        var isCalendarEditable = CalendarActionsConfig ? CalendarActionsConfig.isCalendarEditable : '';
        for (var j = 0; j < res.calendarItems.length; j++) {
            //console.log(j,'j')
            var ress = res.calendarItems[j];
            var Id = ress.Id;
            var Subject = ress.Subject;
            var CreatedByName = ress.CreatedByName;
            var TelePhone = ress.TelePhone;
            var Description = ress.Description;
            var EndDateTime = ress.EndDateTime.split(' ')[1];
            var StartDateTime = ress.StartDateTime.split(' ')[1];
            var EndDateTime2 = ress.EndDateTime.split(' ').join(' ');
            var StartDateTime2 = ress.StartDateTime.split(' ').join(' ');
            var starth = StartDateTime.split(':')[0];
            var startm = StartDateTime.split(':')[1];
            var endh = EndDateTime.split(':')[0];
            var endm = EndDateTime.split(':')[1];
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
            var top = (starth - 5 + mh) * 60;
            top = parseInt(top)

            $('.calendar1').find('.rowCore .eventList').append("\n     isCalendarEditable = \"" + isCalendarEditable + "\"\n     isCalendarDeletable = \"" + isCalendarDeletable + "\"\n       <div ApproveByIds = \"" + Id + "\"\n            TelePhone=\"" + TelePhone + "\"\n            Description=\"" + Description + "\"\n            CreatedByName=\"" + CreatedByName + "\"\n            Subject = \"" + Subject + "\"\n            EndDateTime = \"" + EndDateTime2 + "\"\n            StartDateTime = \"" + StartDateTime2 + "\"\n            Id=\"" + Id + "\"\n            OwningUserName =\"" + name + "\" \n            class=\"meetingroom-message widthitem2\" \n            style='top:" + top + "px;height:" + height + "px;background-color:" + color + "'>\n                <p>" + Subject + "</p>\n                <p><span>" + StartDateTime + "</span>-<span>" + EndDateTime + "</span></p>\n                <p>" + name + "</p>\n            </div>");
        }
    }
    //$('.calendar1 .eventList').each(function () {
    //    $(this).find('div').each(function(){
    //        var date = []
    //        var that = this
    //        var height = $(this).height()
    //        var top = parseInt($(this).css('top').split('px')[0])
    //        $(this).parent().find('div').not(that).each(function(){
    //            var top2 = parseInt($(this).css('top').split('px')[0])
    //            if(top<=top2&&top2<=top+height){
    //                date.push(this)
    //            }
    //        })
    //        for (var i = 0; i < date.length; i++) {
    //            var ewidth = 0
    //            var calnumber = 1
    //            var top2 = parseInt($(this).css('top').split('px')[0])
    //            for (var k = 0; k < date.length; k++) {
    //                var height3 = $(date[k]).height()
    //                var top3 = parseInt($(date[k]).css('top').split('px')[0])
    //                if(top2<=top3&&top3<=top2+height){
    //                    calnumber ++
    //                    var width = 100/calnumber -1
    //                    var left = parseInt($(that).css('left'))
    //                    $(that).css('width',width+'%')
    //                    ewidth =$(date[k]).css('width').split('px')[0]
    //                    $(that).css('left',ewidth+'px')
    //                }else if(top3<=top2&&top3+height3>=top2){
    //                    calnumber ++
    //                    console.log(calnumber)
    //                    console.log(that)
    //                    console.log($(date[k]))
    //                    var width = 100/calnumber -1
    //                    var left = parseInt($(that).css('left'))
    //                    $(that).css('width',width+'%')
    //                    ewidth =$(date[k]).css('width').split('px')[0]
    //                    $(that).css('left',ewidth+'px')
    //                }
    //            }
    //        }
    //    })
    //})


    $('.calendar1 .eventList').each(function () {
        var that = this;
        var numberindex = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var numberindex2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        $(this).find('div').each(function () {
            var height = $(this).height();
            var top = parseInt($(this).css('top').split('px')[0]);
            var endtop = height + top;
            var startnumber = top / 30;
            var endnumber = endtop / 30;

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
            var startnumber = top / 30;
            var endnumber = endtop / 30;
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
            var startnumber = top / 30;
            var endnumber = endtop / 30;
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
    if (data == undefined || data == null)
        return;
    if (data.returnValue == undefined || data.returnValue == null)
        return;
    if (data.returnValue.calendars.length == 0)
        return;
    for (var i = 0; i < data.returnValue.calendars.length; i++) {
        var res = data.returnValue.calendars[i];
        var name = res.calendar.Name;
        var id = res.calendar.Id;
        var color = res.calendar.Color;
        var CalendarActionsConfig = res.calendar.CalendarActionsConfig;
        var isCalendarDeletable = CalendarActionsConfig ? CalendarActionsConfig.isCalendarDeletable : '';
        var isCalendarEditable = CalendarActionsConfig ? CalendarActionsConfig.isCalendarEditable : '';
        for (var j = 0; j < res.calendarItems.length; j++) {
            var ress = res.calendarItems[j];
            var Id = ress.Id;
            var Subject = ress.Subject;
            var CreatedByName = ress.CreatedByName;
            var Description = ress.Description;

            if (ress.TelePhone) {
                var TelePhone = ress.TelePhone;
            } else {
                var TelePhone = ress.TelePhone = '';
            }

            var EndDateTime = ress.EndDateTime.split(' ')[1];
            var StartDateTime = ress.StartDateTime.split(' ')[1];
            var EndDateTime2 = ress.EndDateTime.split(' ').join(' ');
            var StartDateTime2 = ress.StartDateTime.split(' ').join(' ');
            var starth = StartDateTime.split(':')[0];
            var startm = StartDateTime.split(':')[1];
            var endh = EndDateTime.split(':')[0];
            var endm = EndDateTime.split(':')[1];
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
            var top = (starth - 5 + smh) * 60;
            top = parseInt(top)

            var index = 0;
            var index2 = 0;
            var time = ress.StartDateTime.split(' ')[0];

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-');
            }

            if (time.indexOf('-0') != -1) {
                time = time.split('-0').join('-00');
            }
            var endtime = ress.EndDateTime.split(' ')[0];

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
            var startday = ress.StartDateTime.split(' ')[0]
            var endday = ress.EndDateTime.split(' ')[0]

            if (startday == endday) {
                $('.calendar3').find('.rowCore .eventList').eq(index).append("\n            <div \n   isCalendarEditable = \"" + isCalendarEditable + "\"\n     isCalendarDeletable = \"" + isCalendarDeletable + "\"\n      ApproveByIds = \"" + Id + "\"\n            TelePhone=\"" + TelePhone + "\"\n            Description=\"" + Description + "\"\n            CreatedByName=\"" + CreatedByName + "\"\n            Subject = \"" + Subject + "\"\n            EndDateTime = \"" + EndDateTime2 + "\"\n            StartDateTime = \"" + StartDateTime2 + "\"\n            OwningUserName =\"" + name + "\" \n            Id=\"" + Id + "\"\n            class=\"meetingroom-message widthitem2\" \n            style='top:" + top + "px;height:" + height + "px;background-color:" + color + "'>\n                <p>" + Subject + "</p>\n                <p><span>" + StartDateTime + "</span>-<span>" + EndDateTime + "</span></p>\n                <p>" + name + "</p>\n            </div>");
            } else {
                $('.calendar3').find('.rowCore .eventList').each(function () {
                    if ($(this).index() >= index && $(this).index() <= index2) {
                        $(this).append("\n            <div \n      isCalendarEditable = \"" + isCalendarEditable + "\"\n     isCalendarDeletable = \"" + isCalendarDeletable + "\"\n      ApproveByIds = \"" + Id + "\"\n            TelePhone=\"" + TelePhone + "\"\n            Description=\"" + Description + "\"\n            CreatedByName=\"" + CreatedByName + "\"\n            Subject = \"" + Subject + "\"\n            EndDateTime = \"" + EndDateTime2 + "\"\n            StartDateTime = \"" + StartDateTime2 + "\"\n            OwningUserName =\"" + name + "\" \n            Id=\"" + Id + "\"\n            class=\"meetingroom-message widthitem2\" \n            style='top:" + 0 + "px;height:" + height + "px;background-color:" + color + "'>\n                <p>" + Subject + "</p>\n                <p><span>" + StartDateTime2 + "</span>-<span>" + EndDateTime2 + "</span></p>\n                <p>" + name + "</p>\n            </div>");
                    }
                })
            }
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
                    $(that).after("<div class='more'style='width:20%;top:" + top3 + ";right:0;'>+" + calnumber + " \u66F4\u591A</div>");
                }
            });
        });
    });
    //if(data.returnValue.calendars.length==1){
    //    $('.calendar3 .eventList .widthitem2').css('width','calc(100% - 30px)')
    //    $('.calendar3 .eventList .widthitem2').each(function(){
    //        var top = $(this).css('top')
    //        var left = $(this).css('left')
    //        $(this).after(`<div class='more'style='top:`+top+`;left:`+left+`;'>+`+morenumber2+` 更多</div>`)
    //    })
    //}

    hover();
} //月视图数据


function mondata(data) {
    $('.calendar2').find('.scroll>div div').remove();
    $('.calendar2 .scroll>div').each(function () {
        $(this).attr('calnumber', 0)
    })
    if (data == undefined || data == null)
        return;
    if (data.returnValue == undefined || data.returnValue == null)
        return;
    if (data.returnValue.calendars.length == 0)
        return;
    for (var i = 0; i < data.returnValue.calendars.length; i++) {
        var res = data.returnValue.calendars[i];
        var name = res.Name;
        var id = res.ResourceId;
        var ApproveByIds = res.ApproveByIds;
        var Color = res.calendar.Color;
        var name = res.calendar.Name;
        var CalendarActionsConfig = res.calendar.CalendarActionsConfig;
        var isCalendarDeletable = CalendarActionsConfig ? CalendarActionsConfig.isCalendarDeletable : '';
        var isCalendarEditable = CalendarActionsConfig ? CalendarActionsConfig.isCalendarEditable : '';
        for (var j = 0; j < res.calendarItems.length; j++) {
            var ress = res.calendarItems[j];
            var Id = ress.Id;
            var OwningUserName = ress.OwningUserName;
            var Subject = ress.Subject;
            var Roomname = ress.Room;
            var StateCode = ress.StateCode + 1;
            var CreatedByName = ress.CreatedByName;
            if (ress.TelePhone) {
                var TelePhone = ress.TelePhone;
            } else {
                var TelePhone = ress.TelePhone = '';
            }
            var Description = ress.Description;
            var EndDateTime = ress.EndDateTime.split(' ')[1];
            var StartDateTime = ress.StartDateTime.split(' ')[1];
            var EndDateTime2 = ress.EndDateTime.split(' ').join(' ');
            var StartDateTime2 = ress.StartDateTime.split(' ').join(' ');
            var StartDateTime3 = ress.StartDateTime.split(' ')[0];
            var EndDateTime3 = ress.EndDateTime.split(' ')[0];
            var starth = StartDateTime.split(':')[0];
            var startm = StartDateTime.split(':')[1];
            var endh = EndDateTime.split(':')[0];
            var endm = EndDateTime.split(':')[1];
            var key = 0;
            var time = StartDateTime3;
            var endtime = EndDateTime3;
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
                        $(this).append("\n                           <div\n           isCalendarEditable = \"" + isCalendarEditable + "\"\n     isCalendarDeletable = \"" + isCalendarDeletable + "\"\n                ApproveByIds = \"" + Id + "\"\n                           TelePhone=\"" + TelePhone + "\"\n                           Description=\"" + Description + "\"\n                           CreatedByName=\"" + CreatedByName + "\"\n                           Subject = \"" + Subject + "\"\n                           EndDateTime = \"" + EndDateTime2 + "\"\n                           StartDateTime = \"" + StartDateTime2 + "\"\n                           OwningUserName =\"" + OwningUserName + "\" \n                           Id=\"" + Id + "\"\n                           class=\"meetingroom-message widthitem2\"\n                           style='background-color:" + Color + "'>\n                           <p>" + Subject + "</p>\n                           <p><span>" + StartDateTime + "</span>-<span>" + EndDateTime + "</span>\n                           " + OwningUserName + "</p>\n                       </div>");
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
    $('.meetingroom-message').click(function () {
        var id = $(this).attr('id')
        $('#changeDiv').show()
        $('#iframe1').show().attr('src', '/alert/meeting/new_programme.html?id=' + id)
        $('.meetingroom-message-hover').hide()
        $('.card-hover-point').hide()
        return false
    })
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

            if ($(this).attr('ApproveByIds') == contextuserid) {
                $('.meetingroom-message-hover-foot-right div').eq(0).hide();
            } else {
                $('.meetingroom-message-hover-foot-right div').eq(0).attr('Id', $(this).attr('Id'));
            }

            if ($(this).attr('isCalendarDeletable') == 'false') {
                $('.meetingroom-message-hover-foot-right div').eq(1).hide();
            }
            if ($(this).attr('isCalendarEditable') == 'false') {
                $('.meetingroom-message-hover-foot-right div').eq(0).hide();
            }
            $('.meetingroom-message-hover1').find('.header-left-title-name').html($(this).attr('Subject'));
            $('.meetingroom-message-hover1').find('.OwningUserName').html($(this).attr('OwningUserName'));
            $('.meetingroom-message-hover1').find('.Roomname').html($(this).attr('Roomname'));
            $('.meetingroom-message-hover1').find('.ScheduledStart').html($(this).attr('startdatetime'));
            $('.meetingroom-message-hover1').find('.ScheduledEnd').html($(this).attr('enddatetime'));
            $('.meetingroom-message-hover1').find('.CreatedByName').html($(this).attr('CreatedByName'));
            $('.meetingroom-message-hover1').find('.TelePhone').html($(this).attr('TelePhone'));
            $('.meetingroom-message-hover1').find('.Description').html($(this).attr('Description'));
        }
    }).mouseleave(function (e) {
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

            for (var j = 0; j < data.returnValue.calendars.length; j++) {
                var res = data.returnValue.calendars[j];
                var Color = res.calendar.Color;
                var name = res.calendar.Name;

                for (var i = 0; i < data.returnValue.calendars[j].calendarItems.length; i++) {
                    var res = data.returnValue.calendars[j].calendarItems[i];
                    var OwningUserName = res.OwningUserName;
                    var StartDateTimeTime = res.StartDateTimeTime;
                    var EndDateTimeTime = res.EndDateTimeTime;
                    var Subject = res.Subject;
                    var OwningUserName = res.OwningUserName;
                    var EndDateTime = res.EndDateTime.split(' ')[1];
                    var StartDateTime = res.StartDateTime.split(' ')[1];
                    var EndDateTime2 = res.EndDateTime.split(' ').join(' ');
                    var StartDateTime2 = res.StartDateTime.split(' ').join(' ');
                    var CreatedByName = res.CreatedByName;
                    var Description = res.Description;
                    if (res.TelePhone) {
                        var TelePhone = res.TelePhone;
                    } else {
                        var TelePhone = res.TelePhone = '';
                    }
                    $('.meetingroom-message-hover2 .meetingroom-message-hover-body').append("\n                    <div \n                    TelePhone=\"" + TelePhone + "\"\n                    Description=\"" + Description + "\"\n                    CreatedByName=\"" + CreatedByName + "\" \n                    Subject = \"" + Subject + "\"\n                    EndDateTime = \"" + EndDateTime2 + "\"\n                    StartDateTime = \"" + StartDateTime2 + "\"\n                    OwningUserName =\"" + OwningUserName + "\" \n                    class=\"meetingroom-message meetingroom-message1 meetingroom-moremessage\"\n                    style='background-color:" + Color + "'>\n                    <p>" + OwningUserName + "                    <span>" + StartDateTime + "</span>-<span>" + EndDateTime + "</span>\n                    <span>" + Subject + "</span>\n                </p>\n                </div>");
                }
            }

            hover1();
        }

        var time = $(this).parent().attr('time');
        var d = {
            startTime: time,
            endTime: time
        };
        ajaxMethodGetData('calendar.getlist', d, callback);
        return false;
    });
} //编辑


$('.meetingroom-message-hover-foot-right div').eq(0).click(function () {
    $('.popup-mask').show();
    $('#iframe').show();
    var Id = $(this).attr('id');
    $('#iframe').attr('src', '/template/alert/alert_evtcal.html?msgid=' + Id + '&OwningUser=' + contextuserid + '&OwningUserName=' + contextname);
}); //删除

$('.meetingroom-message-hover-foot-right div').eq(1).click(function () {
    $('#iframe').show();
    var Id = $(this).prev().attr('id');
    $('#iframe').attr('src', '/template/alert/delete_meetingroommsg.html?msgid=' + Id + '&name=日程' + '&ObjTypeCode=4200');
});

$(document).click(function () {
    $('.selectlist2').hide();
}); //颜色选择

$('.colorItem').click(function () {
    $(this).parents('.calendarListPanel-item-body').find('.item-color').css('background-color', $(this).css('background-color'));
});
$(document).ready(function () {
    var heighe = $(window).height() - 520;
    $('.calendarListPanel').css('height', heighe);
});
//共享日历

$('.sharecal').click(function () {
    $('#iframe').show().attr('src', '/template/alert/share_cal.html');
    $('.popup-mask').show();
});

$('.addcal').click(function () {
    $('#iframe').show().attr('src', '/template/alert/add_cal.html');
});
//获取分享日历内容
getcalendarshareditem()
function getcalendarshareditem() {
    ajaxMethodGetData('calendar.usershared.search', null, function (data) {

    })
}

//获取日历

function getcalendarshared() {
    ajaxMethodGetData('calendar.follow.getlist', null, function (data) {
        getdata('')
        //$('.calendarListPanel-item-body').not($('.calendarListPanel-item-body').eq(0)).remove()
        $('.peoplelist').html('')
        if (data && data.data) {
            for (var i = 0; i < data.data.length; i++) {
                var res = data.data[i]
                var name = res.Name
                var id = res.CalendarId
                var BusinessUnitIdName = res.businessunitIdName ? res.businessunitIdName : ''
                var IsDisplay = res.IsDisplay
                var html = ''
                var SharedRights = res.SharedRights
                var Color = res.Color
                var active = ''
                if (IsDisplay == false) {
                    html = '显示此日历'
                } else {
                    html = '隐藏此日历'
                    //active = 'active'
                }
                $('.peoplelist').append('<li class="' + active + '">'
                                  + '    <div class="peoplelist-left">'
                                  + '        <img src="/img/cal/1.png"/>'
                                  + '    </div>'
                                  + '    <div class="peoplelist-right">'
                                  + '        <div class="people-name">'
                                  + '            ' + name
                                  + '        </div>'
                                  + '        <div class ="people-dept"> ' + BusinessUnitIdName + ' </div>'
                                  + '    </div>'
                                  + '    <div class ="peoplelist-edit" name="' + name + '" id= "' + id + '" >'
                                  + '        <div class ="calendarListPanel-item-body-right"><div class ="selectlist2" style="margin-top: 25px;"><ul class ="scrollable">'
                                  + '        <li class ="showcal" isdisplay= "' + IsDisplay + '" ><span>' + html + '</span></li><li class ="SharedRights"></li><li style="border-top: 1px solid #cccccc;height:1px;"></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #e1b4e8;"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #c2c9e7;"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #a6d5f8"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #96dfd3"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #96e9b9"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #f9ea93"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #f9ce94"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #bc35bc"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #5679c1"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #3e8ede"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #00aea9"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #3eba4d"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #f6bc26"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #f7931e"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #570d8c"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #001970"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #0b2399"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #0a7476"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #0a6b51"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #b67d11"></span></li><li class ="calendarCalendarColorMenuItem"><span class ="colorItem" style="background-color: #b75d0d"></span></li><li style="clear:both;height:0px"></li><li>选择自定义颜色</li><li class ="cancelfollow" onclick=\'Follow("' + id + '","' + name + '",2)\'>取消关注</li></ul></div></div>'
                                  + '    </div>'
                                  + '    <div class ="item-color" style= "background-color:' + Color + '" ></div>'
                                  + '</li>')
                //    $('.calendarListPanel-item').append('<div class="calendarListPanel-item-body" id="' + res.CalendarShareId + '">'
                //                + '<div class="calendarListPanel-item-body-left">'
                //                    + '<div class="item-color"style="background-color:' + Color + '"></div>'
                //                    + '<div class="calendarlist-item-name">' + name + '</div>'
                //                + '</div>'
                //                + '<div class="calendarListPanel-item-body-right">'
                //                   + '<div class="selectlist2" style="display: none;">'
                //                        + '<ul class="scrollable">'
                //                            + '<li class="showcal" IsDisplay="' + IsDisplay + '">'
                //                                + '<span>' + html + '</span>'
                //                            + '</li>'
                //                            + '<li class="SharedRights">'
                //                               + '添加事件'
                //                            + '</li>'
                //                            + '<li style="border-top: 1px solid #cccccc;height:1px;"></li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #e1b4e8;"></span>'
                //                            + '</li>'
                //                           + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #c2c9e7;"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #a6d5f8"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #96dfd3"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #96e9b9"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #f9ea93"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #f9ce94"></span>'
                //                            + '</li>'
                //                          + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #bc35bc"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #5679c1"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #3e8ede"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #00aea9"></span>'
                //                           + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #3eba4d"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #f6bc26"></span>'
                //                           + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #f7931e"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #570d8c"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #001970"></span>'
                //                           + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #0b2399"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #0a7476"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #0a6b51"></span>'
                //                           + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                   + '<span class="colorItem" style="background-color: #b67d11"></span>'
                //                            + '</li>'
                //                            + '<li class="calendarCalendarColorMenuItem">'
                //                                    + '<span class="colorItem" style="background-color: #b75d0d"></span>'
                //                            + '</li>'
                //                            + '<li style="clear:both;height:0px"></li>'
                //                            + '<li>'
                //                                + '选择自定义颜色'
                //                            + '</li>'
                //                        + '</ul>'
                //                    + '</div>'
                //                + '</div>'
                //            + '</div>')
            }
        }
        if (SharedRights == 4) {
            $('.SharedRights:last').show().click(function () {
                $('.popup-mask').show();
                $('#iframe').show();
                $('#iframe').attr('src', '/template/alert/alert_evtcal.html?OwningUser=' + $(this).parents('.peoplelist-edit').attr('id') + '&OwningUserName=' + $(this).parents('.peoplelist-edit').attr('name'));
            })
        } else {
            $('.SharedRights:last').hide()
        }
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
        //设置颜色
        $('.calendarCalendarColorMenuItem').click(function () {
            var id = $(this).parents('.peoplelist-edit').attr('id')
            var color = $(this).find('span').css('background-color')
            var message = {
                "actions": [{
                    "params": {
                        "CalendarShareId": id,
                        "color": color
                    }
                }]
            }
            message = JSON.stringify(message)
            ajaxMethodPostData('calendar.shared.color', { message: message }, function (data) {
                getcalendarshared()
            })
            return false;

        })
        //显示
        $('.showcal').click(function () {
            var CalendarShareId = $(this).parents('.peoplelist-edit').attr('id')
            var message = {
                "actions": [{
                    "params": {
                        "CalendarShareId": CalendarShareId
                    }
                }]
            }
            message = JSON.stringify(message)
            var data = { message: message };
            if ($(this).find('span').html() == '显示此日历') {
                ajaxMethodPostData('calendar.shared.display', data, function (data) {
                    success('显示成功')
                    getcalendarshared()
                })
            } else {
                ajaxMethodPostData('calendar.shared.hide', data, function (data) {
                    success('隐藏成功')
                    getcalendarshared()
                })
            }
            return false;
        })
        $('.peoplelist>li').click(function () {
            //$(this).find('.showcal').trigger('click')
            $('.peoplelist>li').removeClass('active');
            $(this).addClass('active');
            var id = $(this).find('.peoplelist-edit').attr('id');
            $('.meetingroom-message').remove();
            getdata(id);
        })
    });
}
