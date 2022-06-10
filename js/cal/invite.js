$(".invite").hide()
$(".send p").each(function () {
    $(this).click(function () {
        $(".send p").removeClass("active")
        $(this).addClass("active")
    })
})

function getgroup() {
    var url = window.location.href;
    var id = url.split("?")[1]
    $(".mission").attr("id", id)
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=addresslist.group.getlist",
        async: true, cache: false, dataType: "json",
        success: function (res) {
            console.log(res)
        }
    })
}