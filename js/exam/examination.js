/*
         存储每个问题所答的值
       */
function anwserValue() {

}
/*
    问题
*/
anwserValue.prototype.questionId = "";
/*
    被评估对象
*/
anwserValue.prototype.objectId = "";
/*
 10     - 部门
 30200  - 员工
 8      - 用户
*/
anwserValue.prototype.objectTypeCode = 10;
/*
   问题选值
*/
anwserValue.prototype.anwserOptionId = "";
/*
得分
*/
anwserValue.prototype.score = 0;


var anwserValues = {};

function evalExamRender(eleId, evaluationId, evaluationFormId,mode) {
    this.elementId = eleId;
    this.evaluationId = evaluationId;
    this.evaluationFormId = evaluationFormId;
    if (mode)
        this.mode = mode;
}
/*
    显示在div上
*/
evalExamRender.prototype.elementId = "";
evalExamRender.prototype.evaluationId = "";         //考评id
evalExamRender.prototype.evaluationFormId = "";     //考评表格
evalExamRender.prototype.employeeId = "",           //被评估人
evalExamRender.prototype.businessUnitId = "",       //被评估部门
evalExamRender.prototype.evalObjectType = 30200;
evalExamRender.prototype.evalResults = null;
/*
edit
view
preview
*/
evalExamRender.prototype.mode = "edit";
/*
问题
*/
evalExamRender.prototype.questions = null;
/*
被考评人
*/
evalExamRender.prototype.evalObjects = null;
/*
考评问卷
*/
evalExamRender.prototype.testPaper = null;
/*
   加载考评表
*/
evalExamRender.prototype.loadFormData = function () {
    /*
    var option = {
        evaluationId: this.evaluationId,
        evalObjectType: this.evalObjectType,
        evaluationFormId: this.evaluationFormId,
        employeeId: this.employeeId
    };
    */
    var option = {     
        id: this.evaluationFormId 
    };
    var self = this;
    ajaxMethodGetAsyncData("examinations.paper.get", option,false, function (data) {
        if (!data)
            return;
        if (data.paper) {
            self.testPaper = data.paper;
            self.questions = data.paper.questions;
        }
        //if (data.evalObjects)
        //   self.evalObjects = data.evalObjects;
    });
};
/*
    加载考评对象
*/
evalExamRender.prototype.loadEvalObjects = function () {
    var option = {
        evaluationId: this.evaluationId,
        evalObjectType: this.evalObjectType,
        /*
        evaluationFormId: this.evaluationFormId,
        employeeId: this.employeeId
        busienssUnitId: deptId      */    
    };
    var self = this;
    ajaxMethodGetAsyncData("evaluation.objectbusinessunit.getlist", option, false, function (data) {
        if(!data)
            return;
        //if (data.paper)
        //    self.questions = data.questions;
        if (data.evalObjectList)
            self.evalObjects = data.evalObjectList;
    });
};
evalExamRender.prototype.renderHeader = function (data) {
    var title = this.testPaper.name  ;// data.form.Name;
    var html = "<div class='content'><div class='title'>" + title + "</div>";
    html += ("<div class='error' id='errorTop'></div>");
    // $("#" + this.elementId).append(html);
    //render index
    var questions = this.testPaper.questions;// data.form.Indexs;
    this.questions = questions;
    var totlCols = 1;

    html += ("<table class='form'>");
    html += ("<tr>");
    html += ("<td rowSpan='3' class='gridheader' >评估对象</td>");
    for (var i = 0; i < questions.length; i++) {
        var question = questions[i];

        totlCols = question.answer_options.length;

        html += ("<th colSpan='" + totlCols + "' class='gridheader'>" + question.category + "</th>");
    }
    html += ("</tr>");
    html += ("<tr>");

    for (var i = 0; i < questions.length; i++) {
        var question = questions[i];
        totlCols = question.answer_options.length;
        html += ("<th colSpan='" + totlCols + "' class='gridheader' style='width:400px;'>" + question.text + "</th>");
    }
    html += ("</tr>");
    
    html += ("<tr>");

    for (var i = 0; i < questions.length; i++) {
        var question = questions[i];

        totlCols += question.answer_options.length;
        var options = question.answer_options;

        for (var j = 0; j < options.length; j++) {
            var opt = options[j];
            var score = opt.options.quiz_options.score;
            html += ("<th class='gridheader'>" + opt.text + "<br/>" + score + "分</th>");
            //html += ("<th class='tdcell'>" + opt.Points + "分</th>");
            //this.indexOptions.push(opt);
        }
    }
    html += ("</tr>");
    this.loadEvalObjects();
    html += this.renderEvalObjects();
    html += "</table>";
    html += ("<div class='error' id='errorBottom'></div>");
    if (this.mode == 1)
        html += "<div class='pbButtonb' id='pbButtonb' ><input type='button' name='btnDraft' value='  保存  ' class='btnSecondary' onclick=\"evalRender.saveData(1);\">&nbsp;<input type='button' name='btnSubmit' value='  提交  ' class='btnPrimary'  onclick=\"evalRender.saveData(3);\"></div>";

    html += "</div>";
    $("#" + this.elementId).append(html);
    //$("#" + this.elementId).append(html);
}
evalExamRender.prototype.renderEvalObjects = function () {
    //$("#" + this.elementId).append(html);
   
    // debugger;
    if (!this.evalObjects)
        return;
    var list = this.evalObjects;
    var html = "";
    for (var i = 0; i < list.length; i++) {
        var obj = list[i];

        var rowId = obj.objectId;

        if (i == 0 || (i % 2) == 0)
            html += "<tr id=\"" + rowId + "\" class=\"even\">";
        else
            html += "<tr id=\"" + rowId + "\" class=\"odd\">";
        html += ("<td class='nameCol'>" + obj.name + "</td>");
        for (var k = 0; k < this.questions.length; k++) {

            var q = this.questions[k];
            var options = q.answer_options;

            for (var j = 0; j < options.length; j++) {
                var opt = options[j];
                var score = opt.options.quiz_options.score;
                var cellid = obj.objectId + "_" + q.id + "_" + opt.id;
                var title = "问题：\r\n" + q.text + "\r\n选项：\r\n" + opt.text;
                html += ("<td class='celldata' title=\""+title+"\" onclick=\"cellSelected(this.id)\" questionid=\"" + q.id + "\" anwserOptionId=\"" + opt.id + "\"  score=\"" + score + "\" id=\"" + cellid + "\"></td>");
            }

        }
        html += "</tr>";
        //$("#" + this.elementId).append(html);
    }
    return html;
}
evalExamRender.prototype.render = function () {

    this.loadFormData();
    this.renderHeader(this.testPaper);
    this.renderEvalObjects();
};
evalExamRender.prototype.getResults = function ()
{
    this.evalResults = new Array();
   // debugger;
    var a = $("#" + this.elementId + ' .celldata.active');
    for (var i = 0; i < a.length; i++) {
       // var r = a[i];
       // var k = r.id.split("_");
        // result.rs.push({ q: k[0], n: k[1] });
        var id = a[i].id;
        var newAnwser = new anwserValue();
        newAnwser.objectTypeCode = this.evalObjectType;
        newAnwser.questionId = $("#" + id).attr("questionid");
        newAnwser.anwserOptionId = $("#" + id).attr("anwserOptionId");
        newAnwser.objectId = $("#" + id).parent("tr").attr("id");
        newAnwser.score = $("#" + id).attr("score");
        this.evalResults.push(newAnwser);
    }
    return this.evalResults;
};
evalExamRender.prototype.saveData = function (status) {
    /*
    1 - draft
    2 - submit
    */
    //this.evalResults = anwserValues;
   // debugger;
    var array = new Array();
    array = this.getResults();
    //for (var a in anwserValues)
    //{
    //    array.push(anwserValues[a]);
    //}
   
    var anwserCount = this.evalObjects.length * this.questions.length;
    if (array.length == 0)
    {
        this.error("请填写表格！");
        return;
    }
    if (array.length != anwserCount) {
        var notAnwser = anwserCount - array.length;
        this.error("还有<span style=\"color:red;\">" + notAnwser + "</span>个没有填写，请填写完整再提交！");
        return;
    }
    else {
        $("#errorTop").html("");
        $("#errorBottom").html("");
    }
    var vals = JSON.stringify(array);
    //console.log(vals);
    var results = "{\"rows\":"+vals+"}";
    var d = {
        evaluationId: this.evaluationId,
        statusCode: status,
        evaluationFormId: this.evaluationFormId,
        results: results
    }
    ajaxMethodPostData("evaluation.submit", d, function (data) {
        //debugger;
        if (!data) return;
        var self = this;
        if (data.data.status == 1)
        {
            var d = data.data;
            //self.error("提交成功！");
            $("#pbButtonb").hide();
            //window.close();
            //window.parent.location.reload();
            //window.location = "/eval/evalBuTest.aspx?EvaluationId=" + d.evaluationId + "&mode=2&ObjectTypeCode=0&EvaluationFormId=" + this.evaluationFormId + "&EmployeeId=&dimensionCode=";
        }
    });
};
evalExamRender.prototype.error = function (msg)
{
    $("#errorTop").html(msg);
    $("#errorBottom").html(msg);
}
function cellSelected(id) {
    var key = "";
    var newAnwser = new anwserValue();
    newAnwser.questionId = $("#" + id).attr("questionid");
    newAnwser.anwserOptionId = $("#" + id).attr("anwserOptionId");
    newAnwser.objectId = $("#" + id).parent("tr").attr("id");

    key = newAnwser.objectId + newAnwser.questionId;//+ anwser.anwserOptionId;

    var selected = $("#" + id).text("√").hasClass("active");
    if (selected) {

        $("#" + id).text("").removeClass("active");
        anwserValues[key] = null;
    }
    else {

        if (anwserValues[key]) {
            var oldAnwser = anwserValues[key];
            var oldCellId = oldAnwser.objectId + "_" + oldAnwser.questionId + "_" + oldAnwser.anwserOptionId;
            $("#" + oldCellId).text("").removeClass("active");
            //已选择
            anwserValues[key] = newAnwser;
        }
        else {
            anwserValues[key] = newAnwser;
        }

        $("#" + id).text("√").addClass("active");
    }
    //alert(id);
    //console.log(anwserValues);
    var vals = JSON.stringify(anwserValues);
    //console.log(vals);
    return; vals
}