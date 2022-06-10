
var gridcontentheight = $(window).height() - 155

$('.treesearch input').change(function () {
    var val = $(this).val()
    $('#treePanel li').hide()
    $('#LeftTree').tree('expandAll')
    for (var i = 0; i < $('.tree-title').length; i++) {
        if ($('.tree-title').eq(i).html().indexOf(val) != -1) {
            for (var j = 0; j < $('.tree-title').eq(i).parents('li').length; j++) {
                console.log($('.tree-title').eq(i).parents('li'))
                $('.tree-title').eq(i).parents('li').eq(j).show()
            }
        }
    }
})
$('.left-show-btn').click(function () {
    $(this).hide()
    $('.left-hide-btn').show()
    $('.left-content').hide()
    $('.main-content').width($('.bodyDiv').width() - 20)
    $('#datagrid').datagrid('resize')
})
$('.left-hide-btn').click(function () {
    $(this).hide()
    $('.left-show-btn').show()
    $('.left-content').show()
    $('.main-content').width($('.bodyDiv').width() - 260)
    $('#datagrid').datagrid('resize')

})
function lookupPick(controlName1, controlName2, controlName3, controlName4, valId, valName) {
    $('#' + controlName2).val(valId)
    $('#' + controlName2).next('.layui-form-select').find('input').prop('value', valName)
}

var high = $(this).height();
var height = high - 80;
var height1 = high - 60;
var width = $(this).width();
$('.center').css("height", height + 'px');
$('.center1').css("height", height1 + 'px');
$(window).resize(function () {
    width = $(this).width();
    height = high - 80;
    height1 = high - 60;
    $('.center').css("height", height + 'px');
    $('.center1').css("height", height1 + 'px');
});

function bodyOnLoad() {
    setFocusOnLoad();
    //jQuery("#treeRootNode").height(jQuery("#lineItemView_wrapper").height());
    if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQxTkROYSx4c3dtLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fbusop%2Forderitem%2FSelectSearch%3FaddTo%3D80190000000PJyk%26retURL%3D%252F80190000000PJyk&isAjaxRequest=1&renderMode=RETRO&nocache=1437552855562'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd09DMHhPVlF3T0RveE5Eb3hOUzQyT1RSYSw2cDlmLE1HVXdaalF3"; };
}
function bodyOnBeforeUnload() {
    if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) {
        sfdcPage.executeOnBeforeUnloadQueue();
    };
}
function bodyOnFocus() {
    closePopupOnBodyFocus();
}
function bodyOnUnload() {
}