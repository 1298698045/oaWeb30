
var attendempdaily = {}
var timeInterval
getempdaily()
function getempdaily() {
    ajaxMethodGetData('hr.attend.empdaily.get', null, function (data) {
        $('.attendData div').remove()
        var res = data.data.attendData
        for (var i = 0; i < res.length; i++) {
            var html = ''
            if (res[i].CheckType == 0 || res[i].CheckType == 3) {
                var name = '上班'
            } else {
                var name = '下班'
            }
            var OnTime = res[i].OnTime
            var AbnormalCode = res[i].AbnormalCode
            var AbnormalCodeName = ''
            var classname = ''
            var classname2 = ''
            if (AbnormalCode == 0) {
                AbnormalCodeName = '正常'
                classname = 'clockstatus3'
                classname2 = 'clockstatus1'
                OnTime = res[i].CheckTime
            } else if (AbnormalCode == 1) {
                AbnormalCodeName = '迟到'
                classname = 'clockstatus5'
            } else if (AbnormalCode == 2) {
                AbnormalCodeName = '早退'
                classname = 'clockstatus5'
            } else if (AbnormalCode == 3) {
                AbnormalCodeName = '缺卡'
                classname = 'clockstatus5'
            } else if (AbnormalCode == -1) {
                AbnormalCodeName = ''
                attendempdaily = res[i]
            }
            if (i % 2 == 0) {
                $('.attendData').append('<div style="float:left"></div>')
            }
            $('.attendData>div:last').append('<div class="clockstatus2">' + name + '：<span class="' + classname2 + '">' + OnTime + '</span>&nbsp&nbsp'
                + '<span style="margin-left:10px;" class="' + classname + '"><span style="width:30px;display:inline-block;">' + AbnormalCodeName + '</span></div>')
            if (i!=0&&i % 2 == 0) {
                $('.attendData').append('<div style="float:left">'
                    + '<div class="clockstatus2">|</div><div class="clockstatus2">|</div>'
                    + '</div>')
            }
        }




    })
}

$('.attendclockbtn').click(function () {
    var checkType = attendempdaily.CheckType
    var OnTime = attendempdaily.OnTime
    var CheckTime = $('.nowtime').html()
    console.log(CheckTime)
    var WorkShiftId = attendempdaily.WorkShiftId
    var AttendDate = attendempdaily.AttendDate
    ajaxMethodGetData('hr.attend.work.checkin', {
        checkType: checkType,
        WorkShiftId: WorkShiftId,
        OnTime: OnTime,
        CheckTime: CheckTime,
        AttendDate: AttendDate
    }, function (data) {
        getempdaily()
    })
})

timeInterval = setInterval(function () {
    var time = new Date()
    var t = time.getHours() + ":" + time.getMinutes() + ":" + time.getSeconds();
    $('.nowtime').html(t)
}, 1000)