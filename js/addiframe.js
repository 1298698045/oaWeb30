if ($('.popup-mask').length == 0) {
    $('body').append('<div class="popup-mask"></div><iframe id="iframe" frameborder="0"></iframe><style>.popup-mask {position: fixed;background: url(/img/bgOverlayDialogBackground.png);background-color: transparent;top: 0;left: 0;width: 100%;height: 100%;display: none;z-index: 100;}body #iframe {position: fixed;z-index: 101;background-color: white;width: 80%;left: 10%;top: 50%;margin-top: -310px;border-radius: 7px;display: none;height: 620px;border: 0;}</style>')
}
function lookupPicker(id, name, lktp) {
    $('.popup-mask').hide()
    $('#iframe').hide()
    $('#' + lktp + '_lkid').val(id)
    $('#' + lktp + '_lkold').val(name)
    $('#' + lktp).val(name)
}