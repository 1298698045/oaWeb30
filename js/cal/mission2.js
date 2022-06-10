//新建合同
function closeIFrame() {
    $('iframe').remove();
}
function addIFrame() {
    $('iframe').remove();
    $("body").append('<iframe src="/component/popup-contractedit.html" style="width:100%;height:100%;position:absolute;top:0;left:0;z-index:200"></iframe>')
}
$(".newmissq").click(function () {
    $("body").append('<iframe src="/component/popup-contractedit.html" style="width:100%;height:100%;position:absolute;top:0;left:0;z-index:200"></iframe>')
})
$(".missionleft-head li").each(function () {
    $(this).click(function () {
        var that = this
        $(".missionleft-head li").removeClass("active")
        $(this).addClass("active")
        $(".missionleft-body>div").removeClass("active")
        $(".missionleft-body>div").eq($(that).index()).addClass("active")
    })
})
$(".people-head li").each(function () {
    $(this).click(function () {
        $(".people-head li").removeClass("active")
        $(this).addClass("active")
    })
})
$(".page p[title]").each(function () {
    $(this).click(function () {
        $(".page p[title]").removeClass("active")
        $(this).addClass("active")
    })
})
$(".mission-header2 select").click(function () {
    $(".oRight").click(function(){
        $(".genggai-div2").hide()
    })
    $(".genggai-div2").toggle()
    return false;
})
$(".popup-main .body-main").height(260)


$("#title").keyup(function () {
    if ($(this).prop("value").length > 0) {
        $(this).parents(".title").attr("status", "status")
    } else {
        $(this).parents(".title").attr("status", "")
    }
})
$("#totalPrice").keyup(function () {
    if ($(this).prop("value").length > 0) {
        $(this).parents(".title").attr("status", "status")
    } else {
        $(this).parents(".title").attr("status", "")
    }
})
$("#ContactTemplateId").keyup(function () {
    if ($(this).prop("value").length > 0) {
        $(this).parents(".title").attr("status", "status")
    } else {
        $(this).parents(".title").attr("status", "")
    }
})
$(".popup-foot button").eq(0).click(function () {
    var status = ""
    $(this).parents(".popup").find("b").each(function () {
        if ($(this).html() == "*") {
            if ($(this).parent().attr("status") == "status") {
                status = "status"
                $(this).parent().find(".form-checking").remove()
                $(this).parent().css("height", "32px")
                $(this).parent().find(".pinput1").removeClass("activity")
                $(this).parent().find(".form - element").removeClass("activity")
                $(".form-error").hide()
                $(".form-error2").hide()

            } else {
                status = ""
                var formerror = $(this).parent().find("span").eq(0).html()
                $(".form-error2 span").html(formerror)
                $(this).parent().append("<div class='form-checking'>请输入此字段</div>")
                $(this).parent().css("height", "50px")
                $(this).parent().find(".pinput1").addClass("activity")
                $(this).parent().find(".form - element").addClass("activity")
                $(".form-error").show()
                $(".form-error2").show()
                return false
            }
        }       
    })
    if (status == "status") {
        parent.closeIFrame()
        openroll()
    } else {
    }
})
$(".popup-foot button").eq(2).click(function () {
    var status = ""
    $(this).parents(".popup").find("b").each(function () {
        if ($(this).html() == "*") {
            if ($(this).parent().attr("status") == "status") {
                status = "status"
                $(this).parent().find(".form-checking").remove()
                $(this).parent().css("height", "32px")
                $(this).parent().find(".pinput1").removeClass("activity")
                $(this).parent().find(".form - element").removeClass("activity")
                $(".form-error").hide()
                $(".form-error2").hide()
            } else {
                status = ""
                var formerror = $(this).parent().find("span").eq(0).html()
                
                $(".form-error2 span").html(formerror)
                $(this).parent().append("<div class='form-checking'>请输入此字段</div>")
                $(this).parent().css("height", "50px")
                $(this).parent().find(".pinput1").addClass("activity")
                $(this).parent().find(".form - element").addClass("activity")
                $(".form-error").show()
                $(".form-error2").show()
                return false
            }
        }
        
    })
    if (status == "status") {
        parent.addIFrame()
        openroll()
    } else {
    }


})
$(".popup-foot button").eq(1).click(function () {
    parent.closeIFrame()
    openroll()


})
//更改状态
$(".bianji").click(function () {
    $("body").append('<iframe src="/component/popup-contractedit.html" style="width:100%;height:100%;position:absolute;top:0;left:0;z-index:200;"></iframe>')

})
$(".genggai").click(function(){
    $("#popup-zhuangtaichange").show()
    $(".popup-mask").show()
    $(".popup-exit").click(function(){
        $(this).parent().hide()
        $(".popup-mask").hide()
        openroll()
    })
    $("#popup-zhuangtaichange .body-main").click(function(){
        $("#popup-zhuangtaichange .popup-popup").show()
        $("#popup-zhuangtaichange .popup-popup div").each(function(){
            $(this).click(function(){
                $("#popup-zhuangtaichange .body-main span").html($(this).html())
                $("#popup-zhuangtaichange .body-main span").attr("StatusCode",$(this).attr("StatusCode"))
                $("#popup-zhuangtaichange .popup-popup div").removeClass("active")
                $(this).addClass("active")
                $(this).parent().hide()
            })
        })
    })
    //取消
    $("#popup-zhuangtaichange .popup-foot div").eq(1).click(function(){
        $("#popup-zhuangtaichange").hide()
        $(".popup-mask").hide()
        openroll()

    })
    //确定
    $("#popup-zhuangtaichange .popup-foot div").eq(0).click(function(){
        var StatusCode =  $("#popup-zhuangtaichange .body-main span").attr("StatusCode")
        changemissmion(StatusCode)
        $("#popup-zhuangtaichange").hide()
        $(".popup-mask").hide()
        openroll()

    })
})
//更改优先级
$(".genggai-div2 div").eq(1).click(function(){
    $(".genggai-div2").hide()
    $("#popup-youxianjichange").show()
    $(".popup-mask").show()
    $(".popup-exit").click(function(){
        $(this).parent().hide()
        $(".popup-mask").hide()
        openroll()

    })
    $("#popup-youxianjichange .body-main").click(function(){
        $("#popup-youxianjichange .popup-popup").show()
        $("#popup-youxianjichange .popup-popup div").each(function(){
            $(this).click(function(){
                $("#popup-youxianjichange .body-main span").html($(this).html())
                $("#popup-youxianjichange .body-main span").attr("PriorityCode",$(this).attr("PriorityCode"))
                $("#popup-youxianjichange .popup-popup div").removeClass("active")
                $(this).addClass("active")
                $(this).parent().hide()
            })
        })
    })
    //取消
    $("#popup-youxianjichange .popup-foot div").eq(1).click(function(){
        $("#popup-youxianjichange").hide()
        $(".popup-mask").hide()
        openroll()

    })
    //确定
    $("#popup-youxianjichange .popup-foot div").eq(0).click(function(){
        var PriorityCode =  $("#popup-youxianjichange .body-main span").attr("PriorityCode")
        changemissmion2(PriorityCode)
        $("#popup-youxianjichange").hide()
        $(".popup-mask").hide()
        openroll()

    })
})
//删除任务
$(".shanchu").click(function () {
    $(".delete-mask").show()
    $(".delete-shur").show()
    $(".delete-shur-foot div").eq(0).off()
    $(".delete-shur-head").html("删除合同")
    $(".delete-shur-body").html("是否确定要删除此合同？")
    $(".delete-shur-foot div").eq(0).click(function () {
        $(document).off()
        //删除任务
        var activeid = $(".mission").attr("id")
        $(".delete-mask").hide()
        $(".delete-shur").hide()
        openroll()

    })
    $(".delete-shur-foot div").eq(1).click(function () {
        $(".delete-mask").hide()
        $(".delete-shur").hide()
        openroll()

    })
    $(".delete-shur .popup-exit").click(function(){
        $(".delete-mask").hide()
        $(".delete-shur").hide()

        openroll()

    })
    return false;
})

//更改流程
$(".end").click(function () {
    //提交审批
    var method = "wf.process.search"
    var d = {}
    d.EntityType = "1010"
    var objectTypeCode = getQueryString('objectTypeCode')
    d.EntityType = objectTypeCode;
    $(".popup-body-list ul li.hoverli").remove()
    function callback(data) {
        //console.log(data)
        for (var i = 0; i < data.listData.length; i++) {
            var datas = data.listData[i]
            var Name = datas.Name
            var ProcessId = datas.ProcessId
            $(".popup-body-list ul").append(
                        '<li class="hoverli" ProcessId="' + ProcessId + '">'
                       + '<div class="checkbox">'
                       + '<img src="/img/cal/23.check_2(12x12).png"/>'
                       + '</div>'
                       + '<span>' + Name + '</span>'
                    + '</li>')
        }
        $('.hoverli').eq(0).find('div').addClass('active')
        $('.hoverli').eq(0).find('img').addClass('active')
        if ($('.hoverli').length > 0) {
            $('.popup-foot-shur').addClass('active')
        }
        $(".popup-body-list .checkbox").each(function () {
            $(this).click(function () {
                $(".popup-body-list .checkbox").removeClass("active")
                $(this).toggleClass("active")
                $(".popup-body-list .checkbox img").removeClass("active")
                $(this).find("img").toggleClass("active")
                if ($(".popup-body-list .checkbox.active").length != 0) {
                    $("#popup-sp .popup-foot-shur").addClass("active")
                    $(".chook-number span").eq(1).html(1)
                    $(".chook-number span").css("color", "#108af9")
                }
                else {
                    $("#popup-sp .popup-foot-shur").addClass("active")
                }
            })
        })
    }
    ajaxMethodGetData(method, d, callback)
    $(".sousuoliucheng input").keyup(function () {
        d.search = $(".sousuoliucheng input").val()
        $(".popup-body-list .hoverli").remove()
        ajaxMethodGetData(method, d, callback)
    })
    $("#popup-sp").show()
    $(".popup-mask").show()
    
    //选择审批人
    $("#popup-sp .popup-foot div").eq(0).off()
    $("#popup-sp .popup-foot div").eq(0).click(function () {
        if ($(".popup-body-list .checkbox.active").length != 0) {
            $("#chockpeople").show()
            $(".popup-mask").show()
            $("#popup-sp").hide()
            $(".chookone").find("ul").addClass("active")
            var processId = $(".popup-body-list .checkbox.active").parent().attr("processid")
            
            var method = "wf.step.transition.getlist"
            var processInstanceId = window.location.href.split("?")[1].split("id=")[1]
            window.processId = processId
            window.entityId = processInstanceId
            var d = {}
            d.processInstanceId = processInstanceId
            d.processId = processId
            d.StepId = ""
            function callback(data) {
                //console.log(data)
                var SplitType = data.SplitType
                $(".people-list").html('')
                for (var i = 0; i < data.listData.length; i++) {
                    var datas = data.listData[i]
                    var Selected = datas.Selected
                    var ToActivityName = datas.ToActivityName
                    var ToActivityId = datas.ToActivityId
                    var TransitionId = datas.TransitionId
                    $(".people-list").append('<div class="chookone-input" ToActivityId="' + ToActivityId + '">'
                                        + '<input type="checkbox" name="nextTransition" TransitionId="' + TransitionId + '" id="nextTransition_' + ToActivityId + '"></input>'
                                        +'<div class="checkbox">'
                                            +'<img src="/img/cal/23.check_2(12x12).png"/>'
                                        +'</div>'
                                        + '<span>' + ToActivityName + '</span>'
                                        +'<img src="/img/cal/148.png"  class="people-listup"/>'
                                        +'<img src="/img/cal/149.png"  class="people-listdown" />'                                      
                                    +'</div>'
                                    +'<div class="chookone">'
                                        +'<div class="people-search">'
                                            +'<div class="float">'
                                            +'<div class="checkbox allcheck">'
                                                +'<img src="/img/cal/23.check_2(12x12).png"/>'
                                            +'</div>'
                                            +'<span>显示所选</span>'
                                            +'<span>0</span>'
                                            +'</div>'
                                            +'<div class="search-div">'
                                                + '<input type="text"placeholder="搜索联系人" />'
                                                +'<div class="search-chook"></div>'
                                            +'</div>'
                                            +'<div class="float">'
                                                +'<span class="margin-span1">添加</span>'
                                            +'</div>'
                                        +'</div>'
                                        +'<ul></ul>'
                                    +'</div>'
                        )
                    if (Selected) {
                        $(".chookone-input").eq(i).find(".checkbox").eq(0).addClass("active").find("img").addClass("active")
                        $(".chookone-input>input").eq(i).prop("checked", true)
                        $(".chookone-input").eq(i).find(".people-listup").eq(0).hide()
                    }                    
                    var ParticipantMember = datas.ParticipantMember
                    for (var j = 0; j < ParticipantMember.length; j++) {
                        var datas = ParticipantMember[j]
                        var BusinessUnitIdName = datas.BusinessUnitIdName
                        var FullName = datas.FullName
                        var Selected = datas.Selected
                        var OrganizationIdName = datas.OrganizationIdName
                        var UserId = datas.UserId
                        $(".chookone").eq(i).find("ul").append(
                            '<li>'
                            + '<input type="checkbox" name="participator_' + ToActivityId + '" id="participator_' + UserId + '"></input>'
                            +'<div class="checkbox">'
                            +'<img src="/img/cal/23.check_2(12x12).png"/>'
                            +'</div>'
                            + '<span>' + FullName + '</span>'
                            + '<span>' + BusinessUnitIdName + '</span>'
                            + '<span>' + OrganizationIdName + '</span>'
                            +'</li> '
                       )
                        if (Selected) {
                            $(".chookone").eq(i).find(".checkbox").eq(j+1).addClass("active")
                            $(".chookone").eq(i).find(".checkbox img").eq(j + 1).addClass("active")
                            $(".chookone").eq(i).find(".checkbox").eq(j + 1).prev().prop("checked", true)
                            $(".allcheck").eq(i).next().css("color", "#2a82e4").next().css("color", "#2a82e4")
                        }
                    }
                    $(".allcheck").eq(i).next().next().html($(".chookone").eq(i).find(".checkbox.active").length)
                }
                $(".search-div input").click(function () {
                    $(this).parent().find(".search-chook").show()
                    $(document).click(function (e) {
                        if ($(e.target).parents(".search-div").length == 0) {
                            $(".search-chook").hide()
                        }
                    })
                })
                $(".margin-span1").each(function () {
                    $(this).click(function () {
                        if ($(this).parent().prev().find("input").val() && $(this).parent().prev().find("input").val()!=""){
                            var UserId = $(this).parent().prev().find("input").attr("systemuserid")
                        var FullName = $(this).parent().prev().find("input").val()
                        var BusinessUnitIdName = $(this).parent().prev().find("input").attr("BusinessUnitIdName")
                        var ToActivityId = $(this).parents(".chookone-input").attr("ToActivityId")
                        $(this).parents(".people-search").next().append(
                                '<li>'
                            + '<input type="checkbox" name="participator_' + ToActivityId + '" id="participator_' + UserId + '"></input>'
                            + '<div class="checkbox">'
                            + '<img src="/img/cal/23.check_2(12x12).png"/>'
                            + '</div>'
                            + '<span>' + FullName + '</span>'
                            + '<span>' + BusinessUnitIdName + '</span>'
                            + '<span></span>'
                            + '</li> '
                            )
                        $(this).parent().prev().find("input").val("")
                        $(this).parents(".people-search").next().find("li:last .checkbox").click(function () {
                            $(this).toggleClass("active").find("img").toggleClass("active")
                            var a = $(this).prev().prop("checked")
                            $(this).prev().prop("checked", !a)
                            if ($(this).find(".active").length != 0) {
                                $(this).parents(".chookone").prev().find(".checkbox").addClass("active").find("img").addClass("active")
                                $(this).parents(".chookone").prev().find(".checkbox").prev().prop("checked",true)
                            }
                         })
                    }
                  })
                     
                })
                $(".search-div input").keyup(function () {
                    var that = this
                    //console.log($(this).val())
                    var search = $(this).val()
                    var method = "sys.user.search"
                    var d = {}
                    d.search = search
                    function callback(data) {
                        //console.log(data)
                        $(".people-add").remove()
                        for (var i = 0; i < data.listData.length; i++) {
                            var datas = data.listData[i]
                            var userName = datas.fullName
                            var systemUserId = datas.systemUserId
                            var BusinessUnitIdName = datas.BusinessUnitIdName
                            var fullName = datas.userName
                            $(that).next().append('<li class="people-add" BusinessUnitIdName="' + BusinessUnitIdName
                                + '"systemUserId="' + systemUserId + '"><span class="srarch-span">' + userName + '</span><span class="srarch-span">' + BusinessUnitIdName + "</span>" + fullName + '</li>')
                        }
                        $(".people-add").each(function () {
                            $(this).click(function () {
                                $(that).val($(this).find("span").eq(0).html())
                                $(that).attr("systemUserId", $(this).attr("systemUserId"))
                                $(that).attr("BusinessUnitIdName", $(this).attr("BusinessUnitIdName"))
                                $(that).next().hide()
                            })
                        })                     
                    }
                    if (search.length > 0) {
                        ajaxMethodGetData(method, d, callback)
                    }
                })

                checkchoose()
                function checkchoose() {
                    $("#chockpeople ul .checkbox").off()
                    $("#chockpeople ul .checkbox").each(function () {
                        $(this).click(function () {
                            $(this).toggleClass("active")
                            $(this).find("img").toggleClass("active")
                            var a = !$(this).prev().prop("checked")
                            $(this).prev().prop("checked", a)
                            if ($(this).find(".active").length != 0) {
                                $(this).parents(".chookone").prev().find(".checkbox").addClass("active").prev().prop("checked", true)
                                $(this).parents(".chookone").prev().find(".checkbox").find("img").addClass("active")
                            } else {
                            }
                            if ($(this).parents(".chookone").find("ul .checkbox.active").length != 0) {
                                $(this).parents(".chookone").find(".allcheck").next().css("color", "#2a82e4").next().css("color", "#2a82e4").html($(this).parents(".chookone").find("ul .checkbox.active").length)

                            } else {
                                $(this).parents(".chookone").find(".allcheck").next().css("color", "#ababab").next().css("color", "#ababab").html($(this).parents(".chookone").find("ul .checkbox.active").length)

                            }
                        })
                    })
                }
                $(".chookone-input>.checkbox").each(function () {
                    if (SplitType == "and") {
                        $(this).click(function () {
                            $(this).toggleClass("active")
                            $(this).find("img").toggleClass("active")
                            var a = !$(this).prev().prop("checked")
                            $(this).prev().prop("checked", a)
                            if ($(this).find(".active").length == 0) {
                                $(this).parent().next().find(".checkbox").removeClass("active").find("img").removeClass("active")
                                $(this).parent().next().find(".checkbox").prev().prop("checked", false)
                                $(this).parent().next().find(".allcheck").next().css("color", "#ababab").next().css("color", "#ababab").html(0)
                            } else {
                            }
                        })
                    } else {
                        $(this).click(function () {
                            $(".chookone-input>.checkbox").removeClass("active").find("img").removeClass("active")
                            $(".chookone-input>.checkbox").prev().prop("checked", false)
                            $(".chookone-input>.checkbox").parent().next().find(".checkbox").removeClass("active").find("img").removeClass("active")
                            $(".chookone-input>.checkbox").parent().next().find(".checkbox").prev().prop("checked", false)
                            $(".chookone-input>.checkbox").parent().next().find(".allcheck").next().css("color", "#ababab").next().css("color", "#ababab").html(0)
                            $(this).addClass("active").find("img").addClass("active")
                            $(this).prev().prop("checked", true)
                        })
                    }
                    
                })
                //全选
                $(".allcheck").each(function () {
                    $(this).click(function () {
                        $(this).toggleClass("active").find("img").toggleClass("active")
                        if ($(this).find(".active").length != 0) {
                            $(this).parents(".chookone").find("ul .checkbox").addClass("active").find("img").addClass("active")
                            $(this).parents(".chookone").find("ul .checkbox").prev().prop("checked", true)
                            $(this).parents(".chookone").prev().find(".checkbox").addClass("active").prev().prop("checked", true)
                            $(this).parents(".chookone").prev().find(".checkbox").find("img").addClass("active")
                            $(this).next().css("color", "#2a82e4").next().css("color", "#2a82e4").html($(this).parents(".chookone").find("ul .checkbox.active").length)
                        } else {
                            $(this).parents(".chookone").find("ul .checkbox").removeClass("active").find("img").removeClass("active")
                            $(this).parents(".chookone").find("ul .checkbox").prev().prop("checked", false)
                            $(this).next().css("color", "#ababab").next().css("color", "#ababab").html("0")
                        }
                    })
                })
                //收起
                $(".people-listup").each(function () {
                    $(this).click(function () {
                        $(this).parent().find(".people-listdown").show()
                        $(this).parent().next().show()
                        $(this).hide()
                    })
                })
                //展开
                $(".people-listdown").each(function () {
                    $(this).click(function () {
                        $(this).parent().find(".people-listup").show()
                        $(this).parent().next().hide()
                        $(this).hide()
                    })
                })
            }
            ajaxMethodGetData(method, d, callback)                     
        }
    })
    $("#chockpeople .checkbox").each(function () {
        $(this).click(function () {
            if ($(this).parents("ul").attr("class") == "active") {
                $(this).toggleClass("active")
                $(this).find("img").toggleClass("active")
                $(this).parents("ul").prev().find("span").eq(1).html($(this).parents("ul").find("img.active").length)
                if ($(this).parents("ul").find("img.active").length != 0) {
                    $(this).parents("ul").prev().find("span").eq(1).css("color", "#2a82e4")
                    $(this).parents("ul").prev().find("span").eq(0).css("color", "#2a82e4")
                } else {
                    $(this).parents("ul").prev().find("span").eq(1).css("color", "#999")
                    $(this).parents("ul").prev().find("span").eq(0).css("color", "#999")
                }
                $(this).parents("ul").parent().find(".checkbox").eq(0).removeClass("active")
                $(this).parents("ul").parent().find(".checkbox img").eq(0).removeClass("active")
            }
        })
    })
    
    $("#chockpeople .popup-body>div").width($("#chockpeople .popup-body").width() - 40)
    $(window).resize(function () {
        $("#chockpeople .popup-body>div").width($("#chockpeople .popup-body").width() - 40)
    });
    $(".popup-exit").click(function () {
        $(this).parent().hide()
        $(".popup-mask").hide()
        $(".checkbox").removeClass("active").off().find("img").removeClass("active")
        $(".people-listup").off()
        $(".chook-number").find("span").css("color", "#333").eq(1).html(0)
        $(".float").each(function () {
            $(this).find("span").css("color", "#999").eq(1).html(0)
        })
        $(".people-list div").remove()
        $("#popup-sp .popup-foot-shur").removeClass("active")
        $(".chookone-input").eq(0).find(".checkbox").addClass("active").find("img").addClass("active")
        $(".chookone-input").eq(1).find(".checkbox").find("img").addClass("active")
        openroll()
    })
    //取消
    $("#chockpeople .popup-foot div").eq(2).click(function () {
        $("#chockpeople").hide()
        $(".popup-mask").hide()
        $(".checkbox").removeClass("active").off().find("img").removeClass("active")
        $(".people-listup").off()
        $(".chook-number").find("span").css("color", "#333").eq(1).html(0)
        $(".float").each(function () {
            $(this).find("span").css("color", "#999").eq(1).html(0)
        })
        $(".people-list div").remove()


        $("#popup-sp .popup-foot-shur").removeClass("active")
        $(".chookone-input").eq(0).find(".checkbox").addClass("active").find("img").addClass("active")
        $(".chookone-input").eq(1).find(".checkbox").find("img").addClass("active")



        openroll()
    })
    //确定
    $("#chockpeople .popup-foot div").eq(0).off()
    $("#chockpeople .popup-foot div").eq(0).click(function () {
        //$("#chockpeople").hide()
        //$(".popup-mask").hide()
        //$(".checkbox").removeClass("active").off().find("img").removeClass("active")
        //$(".people-listup").off()
        //$(".chook-number").find("span").css("color", "#333").eq(1).html(0)
        //$(".float").each(function () {
        //    $(this).find("span").css("color", "#999").eq(1).html(0)
        //})
        //$("#popup-sp .popup-foot-shur").removeClass("active")
        //$(".chookone-input").eq(0).find(".checkbox").addClass("active").find("img").addClass("active")
        //$(".chookone-input").eq(1).find(".checkbox").find("img").addClass("active")
        //openroll()
        //$(".end").addClass("active").find("span").html("已提交")
        //$(".end").off()
        function callback(data) {
            $("#chockpeople").hide()
            $(".popup-mask").hide()
            if (data.status == 1) {
                parent.success(data.msg)
            } else {
                parent.error(data.msg)
            }
        }
        if ($('.chookone ul input:checked').length == 0) {
            alert('请至少选择一名办理人员')
        } else {
            var name = $('.mission-header-leftlogo>div').next().html()
            //console.log(name)
            var steps = []
            $('.chookone-input>.checkbox').each(function () {
                if ($(this).hasClass('active')) {
                    var stepsitem = {
                        ToActivityId: '',
                        TransitionId: '',
                        participators: []
                    }
                    stepsitem.ToActivityId = $(this).prev().attr('id').split('nextTransition_')[1]
                    stepsitem.TransitionId = $(this).prev().attr('TransitionId')
                    $(this).parent().next().find('li .checkbox').each(function () {
                        if ($(this).hasClass('active')) {
                            var id = $(this).prev().attr('id').split('participator_')[1]
                            stepsitem.participators.push(id)
                        }
                    })
                }
                steps.push(stepsitem)
            })
            var d = {
                "actions": [{
                    "params": {
                        "processId": window.processId,
                        "name": $('#Subject').html(),
                        "processInstanceId": window.entityId,
                        "objectTypeCode": getQueryString('objectTypeCode'),
                        "transitions": steps
                    }
                }]
            }
            //console.log(d)
            d = JSON.stringify(d)
            ajaxMethodPostData("wf.instance.entity.create", { message: d }, callback);
        }
        
        
    })
    $("#chockpeople .popup-foot div").eq(1).off()
    $("#chockpeople .popup-foot div").eq(1).click(function () {

        $("#chockpeople").hide()
        $("#popup-sp").show()
        $(".people-list div").remove()

    })
    $(".popup-exit").click(function () {
        $(this).parent().hide()
        $(".popup-mask").hide()
        openroll()
    })
    $("#popup-sp .body-main").click(function () {
        $("#popup-sp .popup-popup").show()
        $("#popup-sp .popup-popup div").each(function () {
            $(this).click(function () {
                $("#popup-sp .body-main span").html($(this).html())
                $("#popup-sp .body-main span").attr("PriorityCode", $(this).attr("PriorityCode"))
                $("#popup-sp .popup-popup div").removeClass("active")
                $(this).addClass("active")
                $(this).parent().hide()
            })
        })
    })
    //取消
    $("#popup-sp .popup-foot div").eq(1).click(function () {
        $("#popup-sp").hide()
        $(".popup-mask").hide()
        $(".checkbox").removeClass("active").off().find("img").removeClass("active")
        $(".people-listup").off()
        $(".chook-number").find("span").css("color", "#333").eq(1).html(0)
        $(".float").each(function () {
            $(this).find("span").css("color", "#999").eq(1).html(0)
        })
        $("#popup-sp .popup-foot-shur").removeClass("active")
        $(".chookone-input").eq(0).find(".checkbox").addClass("active").find("img").addClass("active")
        $(".chookone-input").eq(1).find(".checkbox").find("img").addClass("active")

        openroll()

    })
})

//添加合同付款
function addpay() {
    $(".related-item-pay").click(function () {
        //console.log(111)
        $("#popup-contpay").show()
        $(".popup-mask").show()
        $(".popup-exit").click(function () {
            $(this).parent().hide()
            $(".popup-mask").hide()
            openroll()

        })
        //取消
        $("#popup-contpay .popup-foot div").eq(1).click(function () {
            $("#popup-contpay").hide()
            $(".popup-mask").hide()
            openroll()

        })
        //确定
        $("#popup-contpay .popup-foot div").eq(0).click(function () {
            $("#popup-contpay").hide()
            $(".popup-mask").hide()
            openroll()

        })
    })
}
addpay()




missionbianji()
function missionbianji() {
    $(".sanjiao").off()
    $(".sanjiao").click(function () {
        var that = this
        if ($(".miss-bianji").length != 0) {
            $(".miss-bianji").remove()
        } else {
            $(this).append(
                '<div class="miss-bianji">'
                + '<div class="miss-bianji1">编辑</div>'
                + '<div class="miss-bianji1">移动</div>'
                + '<div>删除</div>'
                + '</div>'
            )
            $(document).mouseup(function (e) {
                if ($(e.target).parents(".sanjiao").length == 0 && $(e.target).parents(".delete-shur").length == 0) {
                    $(".miss-bianji").remove();
                }
            })
        }
        offset = $(".miss-bianji").offset()
        if (offset) {
            var top = offset.top
            var left = offset.left
            if ($(this).parents(".item").find(".item-sc").height() > 100) {
                if (top > $(this).parents(".item").find(".item-sc").height() + 100) {
                    $(".miss-bianji").offset({
                        top: top - 100,
                        left: left
                    })
                }
            }
        }
        $(".miss-bianji div").eq(2).click(function () {
            var that = this
            $(".delete-mask").show()
            $(".delete-shur").show()
            $(".delete-shur-foot div").eq(0).off()
            $(".popup-exit").click(function () {
                $(".miss-bianji").remove()
                $(".delete-mask").hide()
                $(".delete-shur").hide()
                openroll()

            })
            $(".delete-shur-foot div").eq(0).click(function () {
                $(document).off()
                //删除任务
                //var activeid = $(that).parents(".name").find(".miss-xiangqing").attr("activityid")
                //addTaskdelete(activeid)
                $(".miss-bianji div").parent().parent().parent().remove()
                $(".miss-bianji").remove()
                $(".delete-mask").hide()
                openroll()

                $(".delete-shur").hide()
            })
            $(".delete-shur-foot div").eq(1).click(function () {
                $(document).off()
                $(".miss-bianji").remove()
                $(".delete-mask").hide()
                $(".delete-shur").hide()
                openroll()

            })
            return false;
        })
        //$(".miss-bianji div").eq(1).click(function () {
        //    var that = this
        //    $(".delete-mask").show()
        //    $(".delete-bianji").show()
        //    //移动任务
        //    $(".delete-liebiaochook").click(function () {
        //        $(".bianji-liebiaochook").show()
        //        $(".bianji-liebiaochook").find("li").each(function () {
        //            $(this).click(function () {
        //                $(that).parents(".name").find(".miss-xiangqing").attr("listid", $(this).attr("listid"))
        //                $(".delete-liebiaochook>div").find("span").html($(this).text())
        //                $(".bianji-liebiaochook").hide()
        //                return false;
        //            })
        //        })
        //    })
        //    $(".delete-bianji-foot").find("div").eq(1).click(function () {
        //        $(".delete-bianji").hide()
        //    })
        //    $(".delete-bianji-foot div").eq(0).off()
        //    $(".delete-bianji-foot div").eq(0).click(function () {
        //        var activeid = $(that).parents(".name").find(".miss-xiangqing").attr("activityid")
        //        var listid = $(that).parents(".name").find(".miss-xiangqing").attr("listid")

        //        $("#card .miss-bianji").remove()
        //        $(".delete-mask").hide()
        //        $(".delete-bianji").hide()
        //        location.reload()
        //    })
        //    return false;
        //})
        $(".miss-bianji div").eq(0).click(function () {
            var id = $(this).parents(".sanjiao").prev(".miss-xiangqing").attr("activityid")
            $("#newmission").show()
            $(".mission-header").hide()
            $(".mission-header4").show()
            $("#qqqq").hide()
            $("#allmission").hide()
            $(".mission").hide()
            $(".invite").hide()
            window.location.href = "/cntrt/contractedit.aspx?" + "id=" + id;
            getmiss2(id)
        })
        return false
    })
}

$(".save div").each(function () {
    $(this).click(function () {
        //console.log(111)
        window.history.go(-1);
    })
})

$(".chooktwo").hide()

$(window).resize(function () {
    $(".popup").each(function () {
        var width = $(window).width() - $(this).width()
        width = width / 2
        var height = $(window).height() - $(this).height()
        height = height / 2
        $(this).css({
            left: width,
            marginLeft: 0,
            top: height,
            marginTop: 0
        })
    })
    $(".delete-shur").each(function () {
        var width = $(window).width() - $(this).width()
        width = width / 2
        var height = $(window).height() - $(this).height()
        height = height / 2
        $(this).css({
            left: width,
            marginLeft: 0,
            top: height,
            marginTop: 0
        })
    })
});

$(window).ready(function () {
    $(".popup").each(function () {
        var width = $(window).width() - $(this).width()
        width = width / 2
        var height = $(window).height() - $(this).height()
        height = height / 2
        $(this).css({
            left: width,
            marginLeft: 0,
            top: height,
            marginTop: 0
        })
    })
    $(".delete-shur").each(function () {
        var width = $(window).width() - $(this).width()
        width = width / 2
        var height = $(window).height() - $(this).height()
        height = height / 2
        $(this).css({
            left: width,
            marginLeft: 0,
            top: height,
            marginTop: 0
        })
    })
})
//点击出现遮罩层，禁止滚动
$(".popup-show").click(function () {
    if ($(".popup-mask").length != 0) {
        $("body").css("overflow","hidden")
    }
})
//取消弹窗，开启滚动
function openroll() {
    $("body").css("overflow", "")
}
//合同类型
$("#sex").prev().click(function () {
    $("#sex").show()
    $("#sex li").each(function () {
        $(this).click(function () {
            $("#sex li").removeClass("active")
            $(this).addClass("active")
            $("#sex").prev().find("span").html($(this).find("span").html())
        })
    })
    $(document).click(function () {
        $("#sex").hide()
    })
    return false;
})
//合同状态
$("#Select3").prev().click(function () {
    $("#Select3").show()
    $("#Select3 li").each(function () {
        $(this).click(function () {
            $(this).parents(".title").attr("status", "status")
            $("#Select3 li").removeClass("active")
            $(this).addClass("active")
            $("#Select3").prev().find("span").html($(this).find("span").html())
            $("#Select3").next().find("span").prop("value",$(this).find("span").html())
            $("#Select3").hide()
        })
    })
    $(document).click(function () {
        $("#Select3").hide()
    })
    return false;
})
//时间
$(".boxshaw").each(function(){
    $(this).prev().click(function () {   
        $(this).next().show()
        var that = this
        $(this).next().find(".dayStyle").each(function(){
            $(this).click(function () {
                $(that).find("input").val($(this).attr("title"))
            })
        })
        $(document).click(function () {
            $(".boxshaw").hide()
        })
        return false;

    })
})
function callback(data) {
    //console.log(data)
}
var d = { Lktp: 1 ,lksrch:1}
ajaxMethodGetData("ui.entity.lookup", d, callback)

$(".file-preview-download")