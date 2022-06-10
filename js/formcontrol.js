
$(".save-checking").click(function () {
    $(".save-checking-input").each(function () {
        if ($(this).val() == 0) {
            if ($(this).find("input").length > 0 && $(this).find("input").val().length != 0) {
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
});
$(".form-element").each(function () {
    var that = this;
    $("li").click(function () {
        return false;
    });
    $("ul").click(function () {
        return false;
    });
    $(this).find("img").click(function () {
        $(this).parents(".form-element").parent().attr("status", "");
        $(that).find("input[type=text]").show();
        $(that).find("input[type=text]").prop("value", "");
        $(this).prop("src", "/img/images/02.1-1.Search_.png");
        $(that).removeClass("active");
        $(this).next().find("li").remove();
        return false;
    });
    $(this).click(function () {
        $(".form-element").removeClass("element-active");
        $(".lookup").hide();
        $(this).addClass("element-active");
        $(this).find(".lookup").show();

        function callback(data) {
            $(that).find(".lookup li").remove();
            console.log(data);

            for (var i = 0; i < data.listData.length; i++) {
                var datas = data.listData[i];
                var id = datas.ID;
                var name = datas.Name;
                $(that).find(".lookup ul").append('<li id="' + id + '">' + name + '</li>');
            }

            $(that).find(".lookup li").each(function () {
                $(this).click(function () {
                    var id = $(this).attr("id");
                    $(this).parents(".form-element").parent().attr("status", "status");
                    $(that).find("input[type=text]").val(id);
                    $(that).find("input[type=text]").hide();
                    $(that).addClass("active");
                    $(that).find("ul").append($(this));
                    $(that).find(".lookup").hide();
                    $(that).find("img").prop("src", "/img/images/Close.png");
                    $(that).find("img").click(function () {
                        $(this).parents(".form-element").parent().attr("status", "");
                        $(that).find("input[type=text]").show();
                        $(that).find("input[type=text]").val("");
                        $(this).prop("src", "/img/images/02.1-1.Search_.png");
                        $(that).removeClass("active");
                        $(this).next().find("li").remove();
                        return false;
                    });
                    if (window.lookupchosecallback) {
                        lookupchosecallback(id)
                    }
                    return false;
                });
            });
        }

        var Lktp = $(this).find("input[type=hidden]").attr("data-object");
        var lksrch;
        var d = {
            Lktp: Lktp
        };
        $(that).find("input[type=text]").off()
        $(that).find("input[type=text]").keyup(function () {
            lksrch = $(this).val();
            d = {
                Lktp: Lktp,
                lksrch: lksrch
            };
            ajaxMethodGetData("ui.entity.lookup", d, callback);
        });
        ajaxMethodGetData("ui.entity.lookup", d, callback);
        $(document).click(function (e) {
            if ($(e.target).parents(".form-element").length == 0) {
                $(that).removeClass("element-active");
                $(".lookup").hide();
            }
        });
        return false;
    });
});
$('.easyui-tree').each(function () {
    var that = this;
    $(this).tree({
        onClick: function onClick(node) {
            var li = node.target;
            $(this).parents(".form-element").parent().attr("status", "status");
            $(that).parents(".form-tree").find(".append").append('<li class="appends"></li>');
            $(that).parents(".form-tree").find(".appends").html($(li).html());
            $(that).parents(".form-tree").find(".appends").find(".tree-indent").remove();
            $(that).parents(".form-tree").find("input[type='button']").hide();
            $(that).parents(".form-tree").addClass("active");
            $(that).parents(".form-tree").find("img").prop("src", "/img/images/Close.png");
            $(that).parent().hide();
        }
    });
});
$(".form-tree").each(function () {
    var that = this;
    $(this).find("img").click(function () {
        $(this).parents(".form-element").parent().attr("status", "");
        $(that).find("input[type=button]").show();
        $(that).find("input[type=button]").prop("value", "请选择");
        $(this).prop("src", "/img/cal/20.png");
        $(that).removeClass("active");
        $(this).next().find("li").remove();
        return false;
    });
});