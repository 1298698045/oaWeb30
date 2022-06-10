var clientHeight = 0;
var clientWidth = 0;

function getClientHeight() {
    if (document.body.clientHeight && document.documentElement.clientHeight) {
        clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
        clientWidth = (document.body.clientWidth > document.documentElement.clientWidth) ? document.body.clientWidth : document.documentElement.clientWidth;
    }
    else {
        clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
        clientWidth = (document.body.clientWidth < document.documentElement.clientWidth) ? document.body.clientWidth : document.documentElement.clientWidth;
    }
    return clientHeight,clientWidth;
}
var explorer = navigator.userAgent;

if (explorer.indexOf("Chrome") >= 0) {
    $(".table2 th").css({
        lineHeight:"24px"
    })
}
function preview(oper) {
    if (oper < 10) {
        bdhtml = window.document.body.innerHTML;//获取当前页的html代码
        sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域
        eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域
        prnhtml = bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html
        prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));//从结束代码向前取html
        window.document.body.innerHTML = prnhtml;
        window.print();
        window.document.body.innerHTML = bdhtml;
    } else {
        window.print();
    }
}
$(".dayinbutton").click(function () {
})

$(".gundongtiao").scroll(function (event) {
    var scrollleft1 = $(".gundongtiao").scrollLeft();
    var scrollleft2 = $(".gundongtiao").scrollTop();
    $(".table3 tbody").css({
        top: -scrollleft2 + "px"
    })
    $(".table2 tbody").css({
        left: -scrollleft1 + "px"
    });

});
getClientHeight()
setheight()
var maxw
var btnheight
var clientHeight
function setheight(){
    maxw = clientWidth;
    if ($(".jiaqi-type").height() >= 100) {
        $(".jiaqi-type>span").height($(".jiaqi-type").height())
        $(".jiaqi-type").height("100px").css("overflow", "auto")
    }
    btnheight = $(".jiaqi-type").height()
    clientHeight = $(window).height()
    if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
        clientHeight = clientHeight + 10;
    } else {
        maxw = maxw;
    }
    //console.log(clientHeight)
    $(".gundongtiao").css({
        width: maxw - 250 + "px",
        height: clientHeight - 354 - btnheight + "px",
    })
    $(".table3").css({
        maxHeight: clientHeight - 354 - btnheight + "px"
    })
    $(".table2").css({
        maxHeight: clientHeight - 354 - btnheight + "px"
    })
    $(".attendance-body-table").css({
        /*minHeight: clientHeight - 400 + "px",*/
        height: clientHeight - btnheight - 290 + "px",
        maxWidth: maxw + "px",
    })
}

//$(document).click(function () {
//    if ($(".table4").height() < clientHeight - 400) {
//        console.log($(".table4").height())
//        $(".gundongtiao").css({
//            height: $(".table4").height() + 17
//        })
//    } else {
//        $(".gundongtiao").css({
//            width: maxw - 325 + "px",
//            height: clientHeight - 390 + "px",
//        })
//    }
//})
//$(".attend-team").click(function () {
//    if ($(".table4").height() < clientHeight - 400) {
//        console.log($(".table4").height())
//        $(".gundongtiao").css({
//            height: $(".table4").height() + 17
//        })
//    } else {
//        $(".gundongtiao").css({
//            width: maxw - 325 + "px",
//            height: clientHeight - 390 + "px",
//        })
//    }
//})
var settableheightf = 0

function settableheight(){
    var btnheight = $('#attendSettings').height()
    if ($('#attendSettings').css('display') == 'none') {
        btnheight = 0
    }
    $(".attendance-body-table").css({
        /*minHeight: clientHeight - 400 + "px",*/
        height: clientHeight - btnheight - 290 + "px",
        maxWidth: maxw + "px",
    })
    settableheightf = 1
}
settableheight()

//请假选择
/*
$("#attendance .attend-team button").each(function () {
    $(this).click(function () {
        var deptId = $(this).attr("deptid");
        debugger;
        document.getElementById("unitId").value =deptId;
        editor.search('', deptId);

        $("#attendance .attend-team button").removeClass("active")
        $("#dept_" + deptId).addClass("active");
    })
})
*/
/*
$("#attendance .jiaqi-type button").each(function () {
    $(this).click(function () {
        //debugger;
        $("#attendance .jiaqi-type button").removeClass("active")
        $(this).addClass("active")
        document.getElementById("selWorkShift").value = $(this).attr("leavetype");
    })
})
*/
$("#attendance .clearchook").click(function () {
    $("#attendance .jiaqi-type button").removeClass("active")
    //$("#attendance .jiaqi-time select").val("1天");

    $("#leavetype_00").addClass("active");
})
//

//显示排班
/*
$("#attendance .spancolo2").hide();
$("#attendance .hidepaiban input").click(function () {
    $("#attendance .spancolo2").toggle();
})

//添加请假
/*
$(".table4 td").click(function () {
    if ($(".jiaqi-type").children("button.active").length == 1) {
        if ($(this).children(".qingjia").length < 2) {
            $(this).children("span").remove()
            var jiaqiTime = $("#attendance .jiaqi-time select").val() + "天"
            var jiaqiType = $("#attendance .jiaqi-type button.active").text()
            var add = '<div class="qingjia">' + jiaqiType + "(" + jiaqiTime + ")" + '</div>'
            $(this).append(add)
        }

        if ($(this).children(".qingjia").length == 2) {
            $(this).children(".qingjia").css({
                marginTop: "5px"
            })
            var index = $(this).parent().index()
            var height = $(this).height()
            var explorer = navigator.userAgent;
            if (explorer.indexOf("Firefox") >= 0) {
                $(".table3 tr").eq(index).children().height(height + 1)

            }
            else {

                $(".table3 tr").eq(index).children().height(height + 2)

            }

        }
        if ($(this).children(".qingjia").length == 1) {
            $(this).children(".qingjia").css({
                marginTop: "10px"
            })
        }
    }
   
})
*/
//

//删除
$("#attendance .inputcheck").each(function () {
    $(this).click(function () {
        $(this).children("img").toggle();
    })
})
//

var explorer = navigator.userAgent;

//ie 
if (explorer.indexOf("MSIE") >= 0) {
}
    //firefox 
else if (explorer.indexOf("Firefox") >= 0) {
    
}
    //Chrome
else if (explorer.indexOf("Chrome") >= 0) {
    //console.log(111)
    $(".table4 tr td").each(function () {
       // console.log(111)
        $(this).css({
            width:"75px"
        })
    })
   
}
    //Opera
else if (explorer.indexOf("Opera") >= 0) {
}
    //Safari
else if (explorer.indexOf("Safari") >= 0) {
}
    //Netscape
else if (explorer.indexOf("Netscape") >= 0) {
}
//console.log($(".table3").find("tr").length)
//列表高度bug调整
for (var i = 0; i < $(".table3").find("tr").length ; i++) {
    var height = $(".table4").find("tr").eq(i).height()
    $(".table3").find("tr").eq(i).css("height", height)
    $(".table3").find("tr").eq(i).find("td").css("vertical-align", "middle")
}


$("select").change(function () {
    $(this).prev().prev().find("span").html($(this).val())
})
$("select").each(function () {
    $(this).prev().prev().find("span").html($(this).val())
})
