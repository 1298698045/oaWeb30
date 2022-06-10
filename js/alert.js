
//验证必填项
$("#Save").click(function () {
    var that = this;
    var save = 0;
    $(".el-input__inner").each(function () {
        if ($(this).val() && $(this).val().length > 0) {
            $(this).parents(".timechook").parent().attr("save", "1");
        }
    });
    $(".form-element").each(function () {
        if ($(this).find("input").eq(0).val() && $(this).find("input").eq(0).val().length > 0) {
            $(this).attr("save", "1");
        }
    });
    $("input").each(function () {
        if ($(this).val() && $(this).val().length > 0) {
            $(this).parent().attr("save", "1");
            $(this).parent().parent().attr("save", "1");
        }
    });
    $(".required").each(function () {
        if ($(this).html() == "*") {
            if ($(this).parent().next().attr("save") == 1 || $(this).parent().next().hasClass("active")) {
                save = 1;
                $(".form-error").remove();
                $(".form-error2").remove();
                $(this).parent().next().removeClass("disstatus");
                $(this).parent().next().find("input").removeClass("disstatus");
                $(".save-status").remove();
            } else {
                $(".form-error").remove();
                $(".form-error2").remove();
                $(".save-status").remove();
                $(this).parent().parent().append('<div class="save-status">请输入此字段</div>');
                $(this).parent().next().addClass("disstatus");
                $(this).parent().next().find("input").addClass("disstatus");
                $(".modal-header").append("        <div class=\"form-error\">\u68C0\u67E5\u6B64\u9875\u9762\u4E0A\u7684\u9519\u8BEF</div>\n                <div class=\"form-error2\">\u5FC5\u987B\u586B\u5199\u8FD9\u4E9B\u5FC5\u586B\u5B57\u6BB5\n                <span></span>\n                </div>");
                save = 0;
                $(".form-error2 span").html($(this).prev().html());
                return false;
            }
        }
    });

    if (save == 1) {
        $(that).addClass("active");
    } else {
        $(that).removeClass("active");
    }
});
$(document).ready(function () {
    $("input").each(function () {
        $(this).keyup(function () {
            if ($(this).val() != "") {
                $(this).parent().attr("save", "1");
            } else {
                $(this).parent().attr("save", "0");
            }
        });
    });
    $("textarea").keyup(function () {
        if ($(this).val() != "") {
            $(this).attr("save", "1");
        } else {
            $(this).attr("save", "0");
        }
    });
    $(".uiRadioMenuItem").click(function () {
        $(this).parent().prev().prev().attr("save", "1");
    });
    //验证必填项2

    $(".save-checking").click(function () {
        $(".save-checking-input").each(function () {
            if ($(this).val() == '') {
                if ($(this).find("input").length > 0 && $(this).find("input").val().length != 0) {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(this).removeClass("disstatus");
                    $(this).find("input").removeClass("disstatus");
                    $(".save-status").remove();
                    $(".save-checking").addClass("active");
                } else if ($(this).find("textarea").length > 0 && $(this).find("textarea").val().length != 0) {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(this).removeClass("disstatus");
                    $(this).find("input").removeClass("disstatus");
                    $(".save-status").remove();
                    $(".save-checking").addClass("active");
                } else if ($(this).find(".el-tag").length > 0) {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(this).removeClass("disstatus");
                    $(this).find("input").removeClass("disstatus");
                    $(".save-status").remove();
                    $(".save-checking").addClass("active");
                } else {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(".save-status").remove();
                    $(this).parents(".divs").append('<div class="save-status">请输入此字段</div>');
                    $(this).addClass("disstatus");
                    $(this).find("input").addClass("disstatus");
                    $(".modal-header").append("        <div class=\"form-error\">\u68C0\u67E5\u6B64\u9875\u9762\u4E0A\u7684\u9519\u8BEF</div>\n                <div class=\"form-error2\">\u5FC5\u987B\u586B\u5199\u8FD9\u4E9B\u5FC5\u586B\u5B57\u6BB5\n                <span></span>\n                </div>");
                    $(".form-error2 span").html($(this).prev().html());
                    $(".save-checking").removeClass("active");
                    return false;
                }
            } else {
                $(".form-error").remove();
                $(".form-error2").remove();
                $(this).removeClass("disstatus");
                $(this).find("input").removeClass("disstatus");
                $(".save-status").remove();
                $(".save-checking").addClass("active");
            }
        });
        if ($(".save-checking").hasClass("active")) {
            $(".save-checking-inputgroup").each(function () {
                var save = 0
                $(this).find('input').each(function () {
                    if ($(this).val() != '') {
                        save = 1
                    }
                })
                if (save == 0) {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(".save-status").remove();
                    $(this).parents(".divs").append('<div class="save-status">请输入此字段</div>');
                    $(this).addClass("disstatus");
                    $(this).find("input").addClass("disstatus");
                    $(".modal-header").append("        <div class=\"form-error\">\u68C0\u67E5\u6B64\u9875\u9762\u4E0A\u7684\u9519\u8BEF</div>\n                <div class=\"form-error2\">\u5FC5\u987B\u586B\u5199\u8FD9\u4E9B\u5FC5\u586B\u5B57\u6BB5\n                <span></span>\n                </div>");
                    $(".save-checking").removeClass("active");
                    return false;
                } else {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(this).removeClass("disstatus");
                    $(".save-status").remove();
                    $(".save-checking").addClass("active");
                }
            })
        }



    });

});

function success2(type) {
    parent.$("body").append("<div class=\"success green\">\n                <span class=\"success_icon\">\n                <i class=\"iconfont icon-duihao\"></i>\n                </span>\n                <div class=\"toastContent slds-notify__content\" style=\"flex: 1;\">\n                <div class=\"slds-align-middle slds-hyphenate\" style=\"font-size: 16px;\">\n                <span class=\"toastMessage slds-text-heading--small forceActionsText\">\u6307\u6807\n    \u5DF2\u521B\u5EFA\u3002</span>\n    </div>\n    </div>\n    <button class=\"button\">\n    <i class=\"iconfont icon-cuohao\"></i>\n    </button>\n    </div>");
    parent.$(".toastMessage").html(type);
    setTimeout(function () {
        parent.$(".success").remove();
    }, 3000);
}
function success(type) {
    if (typeof newdata == 'undefined') {
    } else {
        newdata();
    }

    $("body").append("<div class=\"success green\">\n                <span class=\"success_icon\">\n                <i class=\"iconfont icon-duihao\"><img src='/img/images/00.3.Check.png'></img></i>\n                </span>\n                <div class=\"toastContent slds-notify__content\" style=\"flex: 1;\">\n                <div class=\"slds-align-middle slds-hyphenate\" style=\"font-size: 16px;\">\n                <span class=\"toastMessage slds-text-heading--small forceActionsText\">\u6307\u6807\n    \u5DF2\u521B\u5EFA\u3002</span>\n    </div>\n    </div>\n    <button class=\"button\">\n    <i class=\"iconfont icon-cuohao\"></i>\n    </button>\n    </div>");

    if (type) {
        if (type == "delete30241") {
            $(".toastMessage").html("指标删除成功");
        } else if (type == "添加人员") {
            $(".toastMessage").html("人员添加成功");
        } else if (type == "规则") {
            $(".toastMessage").html("规则保存成功");
        } else if (type == "30216") {
            $(".toastMessage").html("考评保存成功");
        } else if (type == "30216发布") {
            $(".toastMessage").html("考评发布成功");
        } else if (type == "考评人") {
            $(".toastMessage").html("考评人已保存");
        } else if (type == "附件删除成功") {
            $(".toastMessage").html("附件删除成功");
        } else if (type == "附件添加成功") {
            $(".toastMessage").html("附件添加成功");
        } else if (type == "部门变动") {
            $(".toastMessage").html("部门变动成功");
        } else if (type == "晋升") {
            $(".toastMessage").html("晋升成功");
        } else if (type == "离职") {
            $(".toastMessage").html("离职成功");
        } else if (type == "退休") {
            $(".toastMessage").html("退休成功");
        } else if (type == "调出") {
            $(".toastMessage").html("调出成功");
        } else if (type == "转正") {
            $(".toastMessage").html("转正成功");
        } else if (type == "岗位") {
            $(".toastMessage").html("岗位设置成功");
        } else if (type == "排班删除成功") {
            $(".toastMessage").html("排班删除成功");
        } else {
            $(".toastMessage").html(type);
        }
    }

    setTimeout(function () {
        $(".success").remove();
    }, 3000);
}

function error(type) {
    //$("body").append("<div class=\"success red\">\n<span class=\"success_icon\">\n    <i class=\"iconfont icon-duihao\"></i>\n</span>\n<div class=\"toastContent slds-notify__content\" style=\"flex: 1;\">\n    <div class=\"slds-align-middle slds-hyphenate\" style=\"font-size: 16px;\">\n        <span class=\"toastMessage slds-text-heading--small forceActionsText\">\u4FDD\u5B58\u5931\u8D25</span>\n    </div>\n</div>\n<button class=\"button\">\n    <i class=\"iconfont icon-cuohao\"></i>\n</button>\n</div>");
    $("body").append('<div class="success red" style="min-width: max-content;">'
    + '    <span class="success_icon" style="background:transparent;border: 1px solid #fff;">'
    + '    <i class="iconfont icon-cuohao" style="top: -7px;position: relative;left: 4px;"></i>'
    + '    </span>'
    + '    <div class="toastContent slds-notify__content" style="flex: 1;">'
    + '    <div class="slds-align-middle slds-hyphenate" style="font-size: 16px;">'
    + '    <span class="toastMessage slds-text-heading--small forceActionsText" style="line-height: 42px;"></span>'
    + '</div>'
    + '</div>'
    + '</div>')
    if (type) {
        if (type == "delete30241") {
            $(".toastMessage").html("指标删除失败");
        } else if (type == "添加人员") {
            $(".toastMessage").html("人员添加失败");
        } else if (type == "规则") {
            $(".toastMessage").html("规则保存失败");
        } else if (type == "附件删除失败") {
            $(".toastMessage").html("附件删除失败");
        } else {
            $(".toastMessage").html(type);
        }
    }

    setTimeout(function () {
        $(".success").remove();
    }, 2000);
}

function add() {
    $('#changeDiv').show();
} //下拉框相关


function popupselect() {
    //弹出框点击其他位置消失
    $(document).click(function (e) {
        $(".scrollable_ul").hide();
    }); //

    $('.Select').click(function () {
        $(this).next().next('.scrollable_ul').toggle();
        var height = $(this).next().next('.scrollable_ul').height();
        $(".modal-body.scrollable").scrollTop($(".modal-body.scrollable").scrollTop() + height);
        $('.option').click(function () {
            $(this).parent('ul').prev().prev().html($(this).children('a').html());
            $(this).parent('ul').prev().val($(this).children('a').html());

            if ($(this).parent('ul').parent("#StatusCode").length != 0) {
                var StatusCode = $(this).find("a").html();
                var StatusCode1 = "";

                if (StatusCode == "草稿") {
                    StatusCode1 = "0";
                }

                if (StatusCode == "发布") {
                    StatusCode1 = "1";
                }

                if (StatusCode == "已完成") {
                    StatusCode1 = "3";
                }

                $(this).parent().prev().val(StatusCode1);
            }

            $('.scrollable_ul').hide();
        });

        if ($(this).attr("type") != "search") {
            return false;
        }
    });
}

function searchpeople() {
    //搜索
    $(".search").keyup(function () {
        var that = this;
        $(this).next().next(".scrollable_ul").show();
        $(this).next().next(".scrollable_ul").find("li").remove();
        $(this).next().next(".scrollable_ul").find("li").click(function () {
            $(this).parent().hide();
            $(this).parent().prev().val($(this).prop("id"));
            $(that).val($(this).find("a").html());
        });

        function callback(data) {
            console.log(data);
            $(that).parent().parent().next().next(".scrollable_ul").find("li").remove();

            for (var i = 0; i < data.listData.length; i++) {
                var datas = data.listData[i];
                var id = datas.ID;
                var name = datas.Name;
                $(that).next().next(".scrollable_ul").append("\n                    <li class=\" uiRadioMenuItem\" id=\"" + id + "\">\n                        <a href=\"javascript:void(0);\" title=\"In Progress\">" + name + "</a>\n                    </li>\n                    ");
                $(that).next().next(".scrollable_ul").find("li").click(function () {
                    $(this).parent().hide();
                    $(this).parent().prev().val($(this).prop("id"));
                    $(that).val($(this).find("a").html());
                });
            }

            var height = $(that).next().next('.scrollable_ul').height();
            console.log(height);
            $(".modal-body.scrollable").scrollTop($(".modal-body.scrollable").scrollTop() + height);
        }

        var lksrch = $(this).val();
        var Lktp = $(this).attr("objectypecode");
        d = {
            Lktp: Lktp,
            lksrch: lksrch
        };
        ajaxMethodGetData("ui.entity.lookup", d, callback);
    });
    $(".search").click(function () {
        var that = this;

        function callback(data) {
            console.log(data);
            $(that).parent().parent().next().next(".scrollable_ul").find("li").remove();

            for (var i = 0; i < data.listData.length; i++) {
                var datas = data.listData[i];
                var id = datas.ID;
                var name = datas.Name;
                $(that).next().next(".scrollable_ul").append("\n                    <li class=\" uiRadioMenuItem\" id=\"" + id + "\">\n                        <a href=\"javascript:void(0);\" title=\"In Progress\">" + name + "</a>\n                    </li>\n                    ");
                $(that).next().next(".scrollable_ul").find("li").click(function () {
                    $(this).parent().hide();
                    $(this).parent().prev().val($(this).prop("id"));
                    $(that).val($(this).find("a").html());
                });
            }
        }

        var lksrch = $(this).val();
        var Lktp = $(this).attr("objectypecode");
        d = {
            Lktp: Lktp,
            lksrch: ""
        };

        if ($(this).val() == "") {
            ajaxMethodGetData("ui.entity.lookup", d, callback);
        }
    });
} //关闭            


$("#closeds").click(function () {
    parent.$("#iframe").hide();
    parent.$(".popup-mask").hide();
    parent.$('#changeDiv').hide();
});
$("#closedsa").click(function () {
    parent.$("#iframe").hide();
    parent.$(".popup-mask").hide();
    parent.$('#changeDiv').hide();
});

function error3(name) {
    $("body").append('<div class="success red" style="min-width: max-content;">'
    + '    <span class="success_icon" style="background:transparent;border: 1px solid #fff;">'
    + '    <i class="iconfont icon-cuohao" style="top: -7px;position: relative;left: 4px;"></i>'
    + '    </span>'
    + '    <div class="toastContent slds-notify__content" style="flex: 1;">'
    + '    <div class="slds-align-middle slds-hyphenate" style="font-size: 16px;">'
    + '    <span class="toastMessage slds-text-heading--small forceActionsText" style="line-height: 42px;">' + name + '</span>'
    + '</div>'
    + '</div>'
    + '</div>')
    setTimeout(function () {
        $(".success").remove()
    }, 2000)
}