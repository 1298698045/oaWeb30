function Evaluation(option) {
    this.evaluationId = option.evaluationId;
    this.evalTypeCode = option.evalTypeCode;
    this.evaluatorId = option.evaluatorId;
    this.evaluationId = option.evaluationId;
    this.employeeId = option.employeeId;
    this.employeeIdName = option.employeeIdName;
    this.deptIdName = option.deptIdName;
    this.busienssUnitId = option.busienssUnitId;
    this.evaluationFormId = option.evaluationFormId;
    this.tableContainer = $('#' + option.tableContainer);

    this.evaluationData = '';
    this.status = '';
    this.TotalPoints = '';
    this.ResultLevel = '';
    this.viewModel = option.viewModel;

    this.remark = '';
}

function pointchange() {
        var allpoint = 0
        $('.mypoint').each(function () {
            allpoint += Number($(this).val())
        })
        var number = $('.mypoint').eq(0).parent().index()
        $('#summaryRow td').eq(number - 2).html(allpoint)
}


/*维度*/
Evaluation.prototype.dimensionCode = "";

Evaluation.prototype.EvaluationTest = function () {
    var that = this
    var formData;
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=evaluation.form.get",
        type: 'post',
        data: {
            EvaluationId: this.evaluationId,
            EmployeeId: this.employeeId,
            EvalTypeCode: this.evalTypeCode,
            EvaluationFormId: this.evaluationFormId
        },
        dataType: 'json',
        async: false,
        success: function (data) {
            //debuggerLog(data);
            formData = data.listData;
        }
    });
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=evaluation.dimension.getlist",
        type: 'post',
        data: {
            id: this.evaluationId,
        },
        dataType: 'json',
        async: false,
        success: function (data) {
            that.dimension = data.DimensionData
            that.colspan = data.DimensionData.length + 3

        }
    });

    if (formData.length > 0) {
        formData[0].EvalTypeCode = this.evalTypeCode;
        this.evaluationData = formData;

        if (this.evalTypeCode == undefined || this.evalTypeCode == null)
            $('.labelText').text(this.evaluationData[0].Name + '-查看');
        else
            $('.labelText').text(this.evaluationData[0].Name + '-' + this.evalTypeCode);

        $('#tablediv tr:first div div:first').html(this.evaluationData[0].Name)
        this.TotalPoints = formData[0].TotalPoints;
        this.ResultLevel = formData[0].ResultLevel;
        this.remark = formData[0].Remark;
        this.AddScore = formData[0].AddScore
        this.MinuScore = formData[0].MinuScore
        this.addTotalPoints = formData[0].AddTotalPoints
        this.minTotalPoints = formData[0].MinuTotalPoints
        this.Comments = formData[0].Comments
    }

    //set status
    var currentTypeCode = this.evalTypeCode;
    var currendStatus = '';
    $(formData[0].Categories).each(function (i, categary) {

        $(categary.Indexs).each(function (i, idx) {

            var submitedScore = idx.GetScores.filter(function (item, index, array) {

                if (item.StatusCode == 1 && item.EvalTypeCode == currentTypeCode) {
                    return true;
                }

                return false;
            });
            if (submitedScore != undefined && submitedScore.length > 0) {
                currendStatus = 1;
            }
        });
    });

    this.status = currendStatus;

    RenderHeader(this.tableContainer, this.dimension);

    RenderFooter(this.tableContainer, this.dimension.length);

    RenderRows(this.tableContainer, formData, this.evalTypeCode, this.deptIdName, this.employeeIdName, this.remark, this.status, this.viewModel, this.AddScore, this.MinuScore, this.addTotalPoints, this.minTotalPoints, this.dimension, this.Comments);

    if (this.TotalPoints >= 0) {
        $('#TotalPoints').text(this.TotalPoints);
        $('#ResultLevel').text(this.ResultLevel);
    }

    if (this.viewModel == "true") {
        $('#btnSave').hide();
        $('#btnSubmit').hide();
    }
};

function RenderHeader(tableContainer, dimension) {
    var header = '<tr><th colspan="2">考评 内容</th><th>分值</th>'
    for (var i = 0; i < dimension.length; i++) {
        header += '<th>' + dimension[i].Name + '得分</th>'
    }
    header += '</tr>';
    tableContainer.find('thead').html(header);
};

function RenderFooter(tableContainer, length) {
    var footer = '<tr><td colspan="2" class="">总得分</td><td colspan="' + (length + 1) + '" style="text-align:left;" class=""><span id="TotalPoints"></span></td></tr>';
    footer += '<tr><td colspan="2" class="">考评 等级</td><td colspan="' + (length + 1) + '" class="" style="text-align:left;"><span id="ResultLevel"></span></td></tr>';
    tableContainer.find('tfoot').html(footer);
};

function RenderRows(tableContainer, formData, requestEvalTypeCode, deptIdName, employeeIdName, remark, status, viewModel, AddScore, MinuScore, addTotalPoints, minTotalPoints, dimension, Comments) {

    var tbody = '';
    var getScores = []
    for (var i = 0; i < dimension.length; i++) {
        getScores.push(0)
    }
    var total = 0
    if (formData != undefined && formData[0].Categories != undefined) {

        $(formData[0].Categories).each(function (i, categary) {

            $(categary.Indexs).each(function (j, Index) {
                //debugger
                var rowhtml = '<tr class="dataRow" IndexId="' + Index.ValueId + '" categaryId="' + categary.ValueId + '">';

                if (j == 0)
                    rowhtml += '<td class="genre" rowspan="' + categary.Indexs.length + '">' + Index.CategoryName + '</td>';
                rowhtml += '<td class="content">' + Index.Name + '</td>';
                rowhtml += '<td class="all-grade maxValue">' + Index.Points + '</td>';
                total += Index.Points
                for (var i = 0; i < dimension.length; i++) {
                    var name = dimension[i].Name
                    rowhtml += '<td class="grade">';
                    rowhtml += BuildScoreHTMl(name, Index.ControlType, Index.ValueOptions, Index.GetScores, requestEvalTypeCode);
                    rowhtml += '</td>';
                }


                //扣分 control
                //rowhtml += '<td class="cause"></td>';

                //console.log(Index);

                rowhtml += '</tr>';

                tbody += rowhtml;
            });

        });
    }

    var bd = $(tableContainer).find('tbody');
    bd.html(tbody);

    var dataRows = bd.children('tr.dataRow');
    dataRows.each(function () {
        for (var i = 0; i < dimension.length; i++) {
            if ($(this).find('td.grade').eq(i).find('span').length > 0) {
                getScores[i] += Number($(this).find('td.grade').eq(i).find('span').text().trim());
            } else if ($(this).find('td.grade').eq(i).find('input').length > 0) {
                getScores[i] += Number($(this).find('td.grade').eq(i).find('input').val());
            }
        }

    });

    for (var i = 0; i < getScores.length; i++) {
        if (getScores[i] == 0) {
        }
    }
    //add summary row, signature row. 签字
    var summaryRow = "<tr id='summaryRow'  class='summaryRow'><td style='padding:0;margin:0;text-align:right;' colspan='2'>实得总分</td>";
    summaryRow += '<td>' + total + '</td>';

    for (var i = 0; i < dimension.length; i++) {
        summaryRow += '<td>' + getScores[i] + '</td>';
    }

    summaryRow += '</tr>';
    $(bd).append(summaryRow);

    var signatureRow = "<tr  class='summaryRow'><td style='padding:0;margin:0;text-align:right;' colspan='3'>签字</td>";
    for (var i = 0; i < dimension.length; i++) {
        signatureRow += '<td></td>';
    }
    signatureRow += '</tr>';
    $(bd).append(signatureRow);
    $('#tablediv').after('<table id="Scoretablecontent" style="width:100%"><tbody id="Scoretable"></tbody></table>')
    $('#Scoretable').append('<tr><th colspan="5">加减分</th></tr>')
    var html = '<tr><th>加减分类型</th><th>加减分名称</th><th>加减分分数</th><th colspan="2">备注</th></tt>'
    $('#Scoretable').append(html);

    appendAddScore(AddScore, addTotalPoints, dimension.length)

    appendMinuScore(MinuScore, minTotalPoints, dimension.length)

    RenderTemplateHTML(tableContainer, deptIdName, employeeIdName, remark, status, viewModel, dimension, Comments);

};

function BuildScoreHTMl(colmnEvalTypeCode, controlType, valueOptions, getPoints, requestEvalTypeCode) {

    var controlHtml = '';

    if (getPoints != undefined && getPoints.length > 0) {//have score

        var columnTypePoint = getPoints.filter(function (item, index, array) {

            if (item.EvalTypeCode == colmnEvalTypeCode) {

                return true;
            }

            return false;
        });

        if (columnTypePoint[0] != undefined) {

            var point = columnTypePoint[0];

            if (point.StatusCode == 0 && requestEvalTypeCode == colmnEvalTypeCode) {//build edit html

                controlHtml = BuildEditHTML(controlType, valueOptions, point.Points, columnTypePoint);

            } else {//build display html
                controlHtml = BuildDisplayHTML(point.Points);
            }
        } else if (requestEvalTypeCode == colmnEvalTypeCode) {

            controlHtml = BuildEditHTML(controlType, valueOptions, '', columnTypePoint);
        }

    } else {//no score
        if (requestEvalTypeCode == colmnEvalTypeCode) {//build edit html
            controlHtml = BuildEditHTML(controlType, valueOptions, getPoints);
        }
    }
    return controlHtml;
}

function BuildEditHTML(controlType, valueOptions, point, columnTypePoint) {
    var controlHtml = '';

    if (controlType == '下拉选择') {

        var options;

        if (valueOptions.indexOf('\n') > 0)
            options = valueOptions.split('\n');
        else
            options = valueOptions.split('  ');

        var selectControl = $('<select>');

        for (var i = 0; i < options.length; i++) {

            if (columnTypePoint != undefined && point == options[i])
                selectControl.append($("<option selected = 'selected'>").attr('value', options[i]).text(options[i]));
            else
                selectControl.append($("<option>").attr('value', options[i]).text(options[i]));
        }

        controlHtml = selectControl.prop("outerHTML");

    }
    else {
        controlHtml = '<input class="mypoint" onchange="pointchange()" value="' + point + '" type="text" style=\"width:80px;height:20px;text-align:center;\" />';
    }




    return controlHtml;
}

function BuildDisplayHTML(point) {
    var resultHTML = '<span>';
    if (point != undefined)
        resultHTML += point;
    resultHTML += '</span>';

    return resultHTML
}

function RenderTemplateHTML(tableContainer, deptIdName, employeeIdName, remarks, status, viewModel, dimension, Comments) {
    var href = '/eval/templates/evalTestTemplate.html';
    $.ajax({
        url: href,
        type: 'GET',
        success: function (data) {
            var headerText = $(data).children('#header').html();
            var footerText = $(data).children('#footer').html();

            var remarkhtml = $(data).children('#Remark').html();

            var tfoot = $(tableContainer).find('tfoot');
            var thead = $(tableContainer).find('thead');

            ajaxMethodGetAsyncData('entity.detail.get', { objtypecode: 30020, id: getQueryString('EmployeeId') }, false, function (data) {
                var deptIdName = data.record.DeptId.Name
                var employeeIdName = data.record.FullName
                var JobTitle = data.record.JobTitle
                var ProfessionTitle = data.record.ProfessionTitle

                headerText = headerText.replace('$DeptName$', deptIdName);
                headerText = headerText.replace('$UserName$', employeeIdName);
                headerText = headerText.replace('$JobTitle$', JobTitle);
                headerText = headerText.replace('$ProfessionTitle$', ProfessionTitle);

            })


            $(thead).prepend("<tr><td style='padding:0;margin:0;text-align:center;' colspan='" + (dimension.length + 3) + "'>" + headerText + "</td></tr>");

            $(tfoot).append("<tr><td style='padding:0;margin:0;text-align:center;' colspan='" + (dimension.length + 3) + "'>" + footerText + "</td></tr>");
            for (var i = 0; i < dimension.length; i++) {
                $(tfoot).find('tr:first').before("<tr><td colspan='1'>" + dimension[i].Name + "</td><td dimensioncode='" + dimension[i].Name + "' style='text-align:left;' colspan='" + (dimension.length + 2) + "'></td></tr>")
            }
            var StatusCode = getQueryString('StatusCode')
            var EvalTypeCode = getQueryString('EvalTypeCode')
            if (StatusCode != 3) {
                $('td[dimensioncode="' + EvalTypeCode + '"]').html("<textarea id='commentextarea'  style='width:100%;height:70px'></textarea>")
            }
            for (var i = 0; i < Comments.length; i++) {
                if (Comments[i].canEdit) {

                    $('td[dimensioncode="' + Comments[i].dimensionCode + '"]').html("<textarea id='commentextarea'  style='width:100%;height:70px' value=" + Comments[i].comment + ">" + Comments[i].comment + "</textarea>")
                } else {
                    $('td[dimensioncode="' + Comments[i].dimensionCode + '"]').html(Comments[i].comment)
                }
            }
            $(tfoot).prepend("<tr><td colspan='1'>维度</td><td style='text-align:center;' colspan='" + (dimension.length + 2) + "'>意见</td>")


            //if (viewModel == "true") {
            //    $(tfoot).prepend("<tr><td colspan='1'>备注（加减分原因）</td><td style='text-align:left;' colspan='" + (dimension.length + 2) + "'>" + remarks + "</td></tr>");
            //}
            //else {
            //    if (status == 1) {
            //        $(tfoot).prepend("<tr><td colspan='1'>备注（加减分原因）</td><td style='text-align:left;' colspan='" + (dimension.length + 2) + "'>" + remarks + "</td></tr>");
            //    } else {
            //        $(tfoot).prepend("<tr><td colspan='1'>备注（加减分原因）</td><td style='text-align:left;' colspan='" + (dimension.length+2) + "'>" + remarkhtml + "</td></tr>");
            //        $('#remarks').val(remarks);
            //    }

            //}
            $('#labelText').html($('.labelText').html().split('-')[0])
            hidebtn()

        }
    });
}
function appendAddScore(AddScore, addTotalPoints, length) {
    var html = '<tr>'
    for (var i = 0; i < AddScore.length; i++) {
        var xname = AddScore[i].xname
        var addpoint = AddScore[i].addpoint
        var remark = AddScore[i].addremark
        html += '<tr>'
        html += '<td>加分</td><td>' + xname + '</td><td>' + addpoint + '</td><td colspan="2">' + remark + '</td>'
        html += '</tr>'
    }
    html += '<tr>'
    html += '<td>合计</td><td></td><td>' + addTotalPoints + '</td><td colspan="2"></td>'
    html += '</tr>'
    $('#Scoretable').append(html)
}
function appendMinuScore(MinuScore, minTotalPoints, length) {
    var html = '<tr>'
    for (var i = 0; i < MinuScore.length; i++) {
        var xname = MinuScore[i].xname
        var minupoint = MinuScore[i].minupoint
        var remark = MinuScore[i].minuremark
        html += '<tr>'
        html += '<td>减分</td><td>' + xname + '</td><td>' + minupoint + '</td><td colspan="' + length + '">' + remark + '</td>'
        html += '</tr>'
        html += '<tr>'
        html += '<td>合计</td><td></td><td>' + minTotalPoints + '</td><td colspan="' + length + '"></td>'
        html += '</tr>'
    }
    $('#Scoretable').append(html)

}
Evaluation.prototype.SubmitEvaluation = function (onlySave) {

    if (this.status == 1) {
        alert("不可以重复提交");
        return;
    }
    var evalTypeCode = this.evalTypeCode;
    var EvaluationResults = [];//IndexId EvalType PointsOrString

    var invalidateIndexs = [];

    //get control data,build post data.
    $(this.tableContainer).find('tbody').children('tr').each(function (i, e) {

        var row = {};
        var inputValue = '';
        var maxValue = 1;

        maxValue = $(this).children('td.maxValue').text();
        var control = $(this).find('select');
        if (control == undefined || control.length == 0) {

            control = $(this).find('input');
            $(control).attr("style", "border:solid gray 1px");
        }
        inputValue = $(control).val();
        row.IndexId = $(this).attr('indexid');
        row.EvalType = evalTypeCode;
        row.Name = $(this).find('td.content').html();
        row.PointsOrString = inputValue;
        EvaluationResults.push(row);

        if (Number(inputValue) < 0 || Number(inputValue) > Number(maxValue)) {
            invalidateIndexs.push(i);
            $(control).attr("style", "border:solid red 1px");
        }

    });

    if (invalidateIndexs.length > 0) {
        alert("请输入大于0且小于等于该项分值的分数。");
        return;
    }
    var remark = $('#remarks').val();
    var commentextarea = $('#commentextarea').val()
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=evaluation.response.submit",
        type: 'post',
        data: {
            EvaluationId: this.evaluationId,
            EmployeeId: this.employeeId,
            BusienssUnitId: this.busienssUnitId,
            EvaluatorId: this.evaluatorId,
            EvalTypeCode: this.evalTypeCode,
            EvaluationFormId: this.evaluationFormId,
            EvaluationResults: JSON.stringify(EvaluationResults),
            Remark: remark,
            OnlySave: onlySave,
            Comments: commentextarea
            //do not change status
        },
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data.status == 1) {
                if (onlySave) {
                    alert('保存成功');
                    location.reload();
                }
                else {
                    alert("提交成功");
                    $('#btnSave').hide()
                    $('#btnSubmit').hide()
                    //location.reload();
                    opener.location.reload()
                    parnet.location.reload()
                }
                //window.close();
            } else {
                alert('保存失败');
            }
        }
    });
};
function hidebtn() {
    var StatusCode = getQueryString('StatusCode')
    if (StatusCode != '0'&&StatusCode != '1') {
        $('#btnSave').remove()
        $('#btnSubmit').remove()
        $('input').each(function () {
            $(this).parent().append($(this).val())
        })
        $('textarea').each(function () {
            $(this).parent().append($(this).val())
        })
        $('input').hide()
        $('textarea').hide()
    }
}
