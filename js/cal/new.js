var clientHeight = 0;
var maxw = $(document.body).width();

function getClientHeight() {
    if (document.body.clientHeight && document.documentElement.clientHeight) {
        clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
    }
    else {
        clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
    }
    return clientHeight;
}
$(window).resize(function () {
    getClientHeight()
    $("#card").css({
        maxWidth: maxw - 30 + "px",
        height: clientHeight - 210 + "px"
    })
    $(".mission").css({
        maxWidth: maxw - 30 + "px",
        height: clientHeight - 250 + "px"
    })
    $(".item-sc").css({
        maxHeight: clientHeight - 290 + "px"
    })  
});
getClientHeight()

$(document).ready(function () {
    $("#card").css({
        maxWidth: maxw - 30 + "px",
        height: clientHeight - 200 + "px"
    })
    $(".mission").css({
        maxWidth: maxw - 30 + "px",
        height: clientHeight - 250 + "px"
    })
    $(".item-sc").css({
        maxHeight: clientHeight - 310 + "px"
    })
})




