function saveQuestion(renderCallback) {

    var url = "/survey/SurveyHandler.ashx?cmd=createquestion";
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        data:  jQuery("#createQFrm").serialize(),
        error: function (request, textStatus, errorThrown)
        {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            // debugger;
            alert("保存成功！");
            //renderCallback(data);
            window.location = "/survey/createQuestion.aspx?surveyid=" + jQuery("#surveyid").val();
        },
        type: "POST",
        url: url
    });
}
function getQuestion(id,renderCallback) {
    var url = "/survey/SurveyHandler.ashx?cmd=getquestion&id="+id;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",     
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;
            renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
function sortQuestion(id,sortOrder,direct)
{
    var url = "/survey/SurveyHandler.ashx?cmd=sortquestion&id=" + id + "&sortnumber=" + sortOrder + "&direct=" + direct;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;
            window.location.reload();
            //renderCallback(data);
        },
        type: "GET",
        url: url
    });
}
function getSurvey(id, callback) {
    var url = "/survey/SurveyHandler.ashx?cmd=getsurveyinfo&id=" + id;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
        },
        success: function (data, textStatus) {
            //debugger;
            // window.location.reload();
            if (callback)
                callback(data);
        },
        type: "POST",
        url: url
    });
}