/*获取外出参加学术会规则*/
function AcademicEventRuleBaseCount(ProfessionTitle) {
    $('#ProfessionTitle').off()
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
        },
        success: function (data, textStatus) {
                if (data.status>0) {
                    $("#InProvicine").val(data.InProvicine);
                    $("#OutProvicine").val(data.OutProvicine);
                }
        },
        type: "Get",
        url: "/apps/HrProcessor.ashx?cmd=process.academiceventrulebase.count&ProfessionTitle=" + ProfessionTitle
    });
    ProcessAcademicEventCount();
}
/*获取*/
function ProcessAcademicEventCount(ProfessionTitle) {
    //var EmployeeId = $("#EmployeeId_lkid").val();
    var EmployeeId = "231560B8-3B6C-4D46-952D-31D6221AEC80";
    var Provicine = $("#Provicine").val();
    var url = "/apps/HrProcessor.ashx?cmd=process.academicevent.count&ProfessionTitle=" + ProfessionTitle + "&EmployeeId=" + EmployeeId + "&Provicine=" + Provicine;
    if (Provicine!="") {
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            error: function (request, textStatus, errorThrown) {
            },
            success: function (data, textStatus) {
                if (data.status > 0) {
                    if ('InProvicine' in data) {
                        if (data.InProvicine < $("#InProvicine").val()) {
                            $("#ProvinceInOver").val('1')
                            $("#ProvinceOutOver").val('1')
                        }
                        else {
                            $("#ProvinceInOver").val('0');
                            $("#ProvinceOutOver").val('1');
                        }
                    }
                    if ('OutProvicine' in data) {
                        if (data.OutProvicine < $("#OutProvicine").val()) {
                            $("#ProvinceOutOver").val('1')
                            $("#ProvinceInOver").val('1')
                        }
                        else {
                            $("#ProvinceOutOver").val('0');
                            $("#ProvinceInOver").val('1')
                        }
                    }

                }
            },
            type: "Get",
            url: url
        });
    }
   
}

jQuery(document).ready(function () {
    $("#InProvicine").attr("readonly", "readonly");
    $("#OutProvicine").attr("readonly", "readonly");
    $("#ProvinceOutOver").css('pointer-events', 'none')
    $("#ProvinceInOver").css('pointer-events', 'none')
    ProfessionTitlechange()
    function ProfessionTitlechange() {
        jQuery("#ProfessionTitle").off()
        jQuery("#ProfessionTitle").change(function (ele) {
            var ProfessionTitle = jQuery("#ProfessionTitle").val();
            if (ProfessionTitle != "4" && ProfessionTitle != "") {
                AcademicEventRuleBaseCount(ProfessionTitle);
            }
            else {
                $("#InProvicine").val('0');
                $("#OutProvicine").val('0');
            }
            ProfessionTitlechange()

        });
    }

    jQuery("#Provicine").change(function () {
        var ProfessionTitle = jQuery("#ProfessionTitle").val();
        if (ProfessionTitle=="") {
            alert("请先选择职称");
            return;
        }
        ProcessAcademicEventCount(ProfessionTitle);
    });
    ///保存按钮事件
    parent.$('[name="edit"]').click(function(){
        if( $("#ProvinceOutOver").val()==0||$("#ProvinceInOver").val()==0){
            alert('不能超过次数');
            isValidated = false;
            //return return;
        }
    })
});