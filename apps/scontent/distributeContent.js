var chooseCustomerDialog;


$(function () {
   
    GetSubOrgs();
})

function distributeContent(entityId) {
    
    chooseCustomerDialog.entityId = entityId;
    chooseCustomerDialog.show();
}
function GetSubOrgs() {

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.customer.suborg.list",
        type: "GET",
        async: false,
        dataType: "json",
        success: function (data) {
            
            chooseCustomerDialog = OverlayDialogElement.getDialog('choosCustomer_picker_');
            chooseCustomerDialog.isModal = true;
            chooseCustomerDialog.width = 450;// 762;
            chooseCustomerDialog.hasButtonsBar = true;
            chooseCustomerDialog.displayX = true;
            chooseCustomerDialog.allowKeyboardEsc = true;
            chooseCustomerDialog.extraClass = '';
            chooseCustomerDialog.isAbsolutePositioned = false;
            chooseCustomerDialog.refreshOnClose = false;
            chooseCustomerDialog.isMovable = true;

            chooseCustomerDialog.buttonContents = '\u003Cinput value=\" 确定 \" style=\"height:25px;\" class=\"btn\" id=\"choosCustomer_picker_save_btn_Export\" name=\"saveBtn\" onclick=\"CopyContent();\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"choosCustomer_picker__cancel_btn_Export\" name=\"cancelBtn\" onclick=\"chooseCustomerDialog.cancel();\" title=\"取消 (Esc)\" type=\"button\" style=\"height:25px;\" /\u003E';
            chooseCustomerDialog.setTitle('选择分发单位');
            chooseCustomerDialog.contents = '<div style="text-align:center;padding-left:20px;" id="orgsContainor">';
           
            if (data.listData.length > 0) {
                var html = '';

                //var html = '<select id="selectedOrg">';
                //<input type="checkbox" name="selectedOrg" value=""/>checkbox复选2
                $(data.listData).each(function (key, element) {
                    if ($(element)[0].id != null && $(element)[0].name != null && $(element)[0].name != "omssystem") {
                        //console.log($(element)[0]);
                        //html += '<option value="' + $(element)[0].id + '">';
                        //html += $(element)[0].name;
                        //html += '</option>';
                        html += '<input type="checkbox" name="selectedOrg" value="' + $(element)[0].id + '"/>';
                        html += $(element)[0].name;
                    }
                });
                //html += '</select>';
            }

            chooseCustomerDialog.contents += html;
            chooseCustomerDialog.contents += '</div>';
        }
    });
}


function CopyContent() {
    var msg = '';

    $("input:checkbox[name=selectedOrg]:checked").each(function () {
        var val = $(this).val();
        //call api copy content 
        jQuery.ajax({
            url: "/apps/CommandProcessor.ashx?cmd=content.content.copyto",
            type: "GET",
            async: false,
            data: {
                selectedOrg: val,
                contentId: chooseCustomerDialog.entityId
            },
            dataType: "json",
            success: function (data) {
                if (data.msg.length > 0)
                    msg=data.msg;
            }
        });
        
    });

    if (msg.length > 0)
        alert(msg);

    chooseCustomerDialog.hide();

}