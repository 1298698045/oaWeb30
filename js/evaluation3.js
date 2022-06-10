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
var data0 = '';
var that = this


//验证字符串是否是数字
function checkNumber(theObj) {
    var reg = /^[0-9]+.?[0-9]*$/;
    if (reg.test(theObj)) {
        return true;
    }
    return false;
}

function pointchange(obj) {
    var selfpoint = 0
    var addpoint = 0
    var deductpoint = 0
    var allpoint = 0
    var pointscore = 0
    var addscore = 0
    var deductscore = 0
    var score=0
    function count() {
        selfpoint = 0
        addpoint = 0
        deductpoint = 0
        allpoint = 0
        score = 0
        pointscore = Number($(obj).parent().parent().find('td.maxValue').text()) ? Number($(obj).parent().parent().find('td.maxValue').text()) : 0
        addscore = Number($(obj).parent().parent().find('td.addscore .mypoint').val()) ? Number($(obj).parent().parent().find('td.addscore .mypoint').val()) : 0
        deductscore = Number($(obj).parent().parent().find('td.deductscore .mypoint').val()) ? Number($(obj).parent().parent().find('td.deductscore .mypoint').val()) : 0
        
        score = pointscore + addscore - deductscore
        if (score >= 0 && score<=100) {
            $(obj).parent().parent().find('td.selfscore .mypoint').val(score)
        }
        else if (score > 100) {
            alert("得分不能超过100！");
            obj.value = ''
            count()
        }
        else {
            alert("得分不能小于0！");
            obj.value = ''
            count()
        }
        $('.selfscore .mypoint').each(function () {
            var ite=$(this).val()
            if (Number($(this).parent().parent().find('td.addscore .mypoint').val()) || Number($(this).parent().parent().find('td.deductscore .mypoint').val())) {
                ite = Number($(this).parent().parent().find('td.maxValue').text()) + Number($(this).parent().parent().find('td.addscore .mypoint').val()) - Number($(this).parent().parent().find('td.deductscore .mypoint').val())
                $(this).val(ite)
            }
            else {
                ite = Number($(this).parent().parent().find('td.maxValue').text())
                $(this).val(Number($(this).parent().parent().find('td.maxValue').text()))
            }
            selfpoint += Number(ite)
        })
        $('.addscore .mypoint').each(function () {
            addpoint += Number($(this).val())
        })
        $('.deductscore .mypoint').each(function () {
            deductpoint += Number($(this).val())
        })
        allpoint = selfpoint
        $('#summaryRow td').eq(2).html(addpoint)
        $('#summaryRow td').eq(3).html(deductpoint)
        $('#summaryRow td').eq(4).html(selfpoint)
        $('#SelfPoints').text(allpoint);
        $('#TotalPoints').text(allpoint);
    }
    count()
    var totalscore = Number($('#summaryRow td').eq(4).text())
    if (allpoint >= 0 && allpoint <= 100 && obj.value >= 0 && totalscore <= 100 && totalscore>=0) {
    }
    else {
        if (obj.value < 0) {
            alert("请输入正数！");
        }
        else if (allpoint > 100) {
            alert('总分数不能超过100！')
        }
        else if (allpoint < 0) {
            alert('总分数不能小于0！')
        }
        else if (!checkNumber(allpoint)) {
            alert("请输入正确数字！");
        }
        obj.value = ''
        count()
    }
    

    
}


/*维度*/
Evaluation.prototype.dimensionCode = "";

Evaluation.prototype.EvaluationTest = function () {
    
    var formData;
    var Data0;
    var dimension;
    var colspan;
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=evaluation.employee.form.get2",
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
            Data0 = data;
            formData = data.form;
        }
    });
    //$.ajax({
    //    url: "/apps/CommandProcessor.ashx?cmd=evaluation.dimension.getlist",
    //    type: 'post',
    //    data: {
    //        id: this.evaluationId,
    //    },
    //    dataType: 'json',
    //    async: false,
    //    success: function (data) {
    //        //that.dimension = data.DimensionData
    //        dimension = [{ Name: "自评", ClassName: 'selfscore' }, { Name: "加分", ClassName: 'addscore' }, { Name: "减分", ClassName: 'deductscore' }]
    //        colspan = 6

    //    }
    //});
    dimension = [{ Name: "加分", ClassName: 'addscore' }, { Name: "减分", ClassName: 'deductscore' }, { Name: "自评", ClassName: 'selfscore' }, ]
    colspan = 6
    that.data0 = Data0;
    if (formData) {
        formData.EvalTypeCode = this.evalTypeCode;
        //this.evaluationData = formData;
        //if (this.evalTypeCode == undefined || this.evalTypeCode == null)
        //    $('.labelText').text(this.evaluationData[0].Name + '-查看');
        //else
        //    $('.labelText').text(this.evaluationData[0].Name + '-' + this.evalTypeCode);

        //$('#tablediv tr:first div div:first').html(this.evaluationData[0].Name)
        this.TotalPoints = formData.TotalPoints;
        this.ResultLevel = formData.ResultLevel;
        this.remark = formData.Remark;
        this.AddScore = formData.AddScore
        this.MinuScore = formData.MinuScore
        this.addTotalPoints = formData.AddTotalPoints
        this.minTotalPoints = formData.MinuTotalPoints
        this.Comments = formData.Comments
    }

    //set status
    //var currentTypeCode = this.evalTypeCode;
    var currendStatus = '';
    $(formData.Categories).each(function (i, categary) {

        $(categary.Indexs).each(function (i, idx) {

            var submitedScore = idx.GetScores.filter(function (item, index, array) {

                if (item.StatusCode == 1) {
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

    //RenderHeader(this.tableContainer, dimension);

    //RenderFooter(this.tableContainer, dimension.length);
    if (formData.EvaluationFormIdName) {
        $('#labelText').text(formData.EvaluationFormIdName);
       
    }
    if (this.deptIdName) {
        $('#DeptName').text(this.deptIdName);
       
    }

    RenderRows(this.tableContainer, formData, this.evalTypeCode, this.deptIdName, this.employeeIdName, this.remark, this.status, this.viewModel, this.AddScore, this.MinuScore, this.addTotalPoints, this.minTotalPoints, dimension, this.Comments);
    if (that.data0 && that.data0.context && that.data0.context.name) {
        $('#Name').text(this.employeeIdName);
        $('#FullName').text(this.employeeIdName);
    }
    if (Number(this.TotalPoints) >= 0) {
        $('#TotalPoints').text(this.TotalPoints);
        $('#ResultLevel').val(this.ResultLevel);
        $('#ResultLevelVal').text(this.ResultLevel);
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
    
    if (formData != undefined && formData.Categories != undefined) {

        $('#AddScoreReason').val(formData.AddScoreReason);
        $('#DeductScoreReason').val(formData.DeductScoreReason);
        $('#PeriodSummary').val(formData.PeriodSummary);
        $('#SelfPoints').text(formData.SelfPoints);
        $('#ApproveOfPersonal').text(formData.ApproveOfPersonal);
        $('#ApproveOfDept').val(formData.ApproveOfDept);
        $('#ApproveOfDeptSign').text(formData.ApproveOfDeptSign);
        $('#ApproveOfPartyHeader').val(formData.ApproveOfPartyHeader);
        $('#ApproveOfPartyHeaderSign').text(formData.ApproveOfPartyHeaderSign);
        
        var dimensionCode = getQueryString('dimensionCode');
        var EvaluatorIdName=getQueryString('EvaluatorIdName');
        if (dimensionCode == '自评') {
            $('#ApproveOfPersonal').text(employeeIdName);
        }
        else if (dimensionCode == '部门' || dimensionCode == '大科') {
            $('#ApproveOfDeptSign').text(EvaluatorIdName);
        }
        else if (dimensionCode == '党总支') {
            $('#ApproveOfPartyHeaderSign').text(EvaluatorIdName);
        }

        $(formData.Categories).each(function (inx, categary) {

            $(categary.Indexs).each(function (j, Index) {
                //debugger
                var rowhtml = '<tr class="dataRow notdept notresult notparty" IndexId="' + Index.ValueId + '" categaryId="' + categary.ValueId + '">';

                if (j == 0)
                rowhtml += '<td class="genre" rowspan="' + categary.Indexs.length + '">' + Index.CategoryName + '</td>';
                rowhtml += '<td class="content" categaryIndex="' + inx + '" rowIndex="' + j + '">' + Index.Name + '</td>';
                rowhtml += '<td class="all-grade maxValue">' + Index.Points + '</td>';
                total += Index.Points
                for (var i = 0; i < dimension.length; i++) {
                    var name = dimension[i].Name
                    var classname = dimension[i].ClassName
                    rowhtml += '<td class="grade ' + classname + '">';
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
    var summaryRow = "<tr id='summaryRow'  class='summaryRow'><td style='padding:0;margin:0;' colspan='2'>合计</td>";
    summaryRow += '<td>' + total + '</td>';

    for (var i = 0; i < dimension.length; i++) {
        summaryRow += '<td>' + getScores[i] + '</td>';
    }

    summaryRow += '</tr>';
    $(bd).append(summaryRow);

    //var signatureRow = "<tr  class='summaryRow'><td style='padding:0;margin:0;text-align:right;padding-right:25px;' colspan='3'>签字</td>";
    //for (var i = 0; i < dimension.length; i++) {
    //    signatureRow += '<td></td>';
    //}
    //signatureRow += '</tr>';
    //$(bd).append(signatureRow);
    //$('#tablediv').after('<table id="Scoretablecontent" style="width:100%"><tbody id="Scoretable"></tbody></table>')
    //$('#Scoretable').append('<tr><th colspan="6" style="position: relative;">加减分<span class="scorebtn" onclick="addscore()" id="scorebtn">添加加分<span></th></tr>')
    //var html = '<tr><th>加减分类型</th><th>加减分名称</th><th>加减分分数</th><th>备注</th><th>操作</th></tt>'
    //$('#Scoretable').append(html);

    //RenderTemplateHTML(tableContainer, deptIdName, employeeIdName, remark, status, viewModel, dimension, Comments);
    hidebtn()
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
            if (point.StatusCode == 0 || point.StatusCode == 1) {//build edit html
                controlHtml = BuildEditHTML(controlType, valueOptions, point.Points, columnTypePoint);

            } else {//build display html
                controlHtml = BuildDisplayHTML(point.Points);
            }
        } else {
            controlHtml = BuildEditHTML(controlType, valueOptions, '', columnTypePoint);
        }

    } else {//no score
        controlHtml = BuildEditHTML(controlType, valueOptions, getPoints);
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
        controlHtml = '<input class="mypoint" onchange="pointchange(this)" value="' + point + '" type="text" style=\"width:80px;height:20px;text-align:center;\" />';
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

                //headerText = headerText.replace('$DeptName$', deptIdName);
                //headerText = headerText.replace('$UserName$', employeeIdName);
                //headerText = headerText.replace('$JobTitle$', JobTitle);
                //headerText = headerText.replace('$ProfessionTitle$', ProfessionTitle);

            })


            //$(thead).prepend("<tr><td style='padding:0;margin:0;text-align:center;' colspan='" + (dimension.length + 3) + "'>" + headerText + "</td></tr>");

            $(tfoot).append("<tr><td style='padding:0;margin:0;text-align:center;' colspan='" + (dimension.length + 3) + "'>" + footerText + "</td></tr>");
            //for (var i = 0; i < dimension.length; i++) {
            //    $(tfoot).find('tr:first').before("<tr><td colspan='1'>" + dimension[i].Name + "</td><td dimensioncode='" + dimension[i].Name + "' style='text-align:left;' colspan='" + (dimension.length + 2) + "'></td></tr>")
            //}
            var StatusCode = getQueryString('StatusCode')
            var EvalTypeCode = getQueryString('EvalTypeCode')
            //if (StatusCode != 3) {
            //    $('td[dimensioncode="' + EvalTypeCode + '"]').html("<textarea id='commentextarea'  style='width:100%;height:70px'></textarea>")
            //}
            //for (var i = 0; i < Comments.length; i++) {
            //    if (Comments[i].canEdit) {

            //        $('td[dimensioncode="' + Comments[i].dimensionCode + '"]').html("<textarea id='commentextarea'  style='width:100%;height:70px' value=" + Comments[i].comment + ">" + Comments[i].comment + "</textarea>")
            //    } else {
            //        $('td[dimensioncode="' + Comments[i].dimensionCode + '"]').html(Comments[i].comment)
            //    }
            //}
            //$(tfoot).prepend("<tr><td colspan='1'>维度</td><td style='text-align:center;' colspan='" + (dimension.length + 2) + "'>意见</td>")


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
            //$('#labelText').html($('.labelText').html().split('-')[0])
            //hidebtn()

        }
    });
}

Evaluation.prototype.RevertEvaluation = function () {
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=evaluation.employee.form.reject2",
        type: 'post',
        data: {
            EvaluationId: this.evaluationId,
            EmployeeId: getQueryString('EmployeeId')
        },
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data && data.status == 1) {
                success2('已驳回');
                setTimeout(function () {
                    window.location.href = '/eval/evalTestlst.aspx'
                }, 1000)
            } else {
                alert('驳回失败');
            }
        }
    });
}
Evaluation.prototype.SubmitEvaluation = function (onlySave) {

    //if (this.status == 1) {
    //    alert("不可以重复提交");
    //    return;
    //}
    //var evalTypeCode = this.evalTypeCode;
    //var EvaluationResults = [];//IndexId EvalType PointsOrString

    //var invalidateIndexs = [];

    ////get control data,build post data.
    $(this.tableContainer).find('tbody').children('tr').each(function (i, e) {
        var dimensionCode = getQueryString('dimensionCode');
        if (dimensionCode == '自评') {
            var row = [
            {
                "Points": $(this).find('td.selfscore input').val()?$(this).find('td.selfscore input').val():0,
                "EvalTypeCode": "自评",
                "DimensionCode": "自评",
            },
            {
                "Points": $(this).find('td.addscore input').val()?$(this).find('td.addscore input').val():0,
                "EvalTypeCode": "加分",
                "DimensionCode": "自评",
            },
            {
                "Points": $(this).find('td.deductscore input').val()?$(this).find('td.deductscore input').val():0,
                "EvalTypeCode": "减分",
                "DimensionCode": "自评",
            },
            ]
        }
        else {
            var row = [
            {
                "Points": $(this).find('td.selfscore').text()?$(this).find('td.selfscore').text():0,
                "EvalTypeCode": "自评",
                "DimensionCode": "自评",
            },
            {
                "Points": $(this).find('td.addscore').text()?$(this).find('td.addscore').text():0,
                "EvalTypeCode": "加分",
                "DimensionCode": "自评",
            },
            {
                "Points": $(this).find('td.deductscore').text()?$(this).find('td.deductscore').text():0,
                "EvalTypeCode": "减分",
                "DimensionCode": "自评",
            },
            ]
        }
        var categaryIndex = $(this).find('td.content').attr('categaryIndex')
        var rowIndex = $(this).find('td.content').attr('rowIndex')
        if (that.data0 && that.data0.form && that.data0.form.Categories && that.data0.form.Categories[Number(categaryIndex)] && that.data0.form.Categories[Number(categaryIndex)].Indexs && that.data0.form.Categories[Number(categaryIndex)].Indexs[Number(rowIndex)]) {
            that.data0.form.Categories[Number(categaryIndex)].Indexs[Number(rowIndex)].GetScores = row
        }
    });

    //if (invalidateIndexs.length > 0) {
    //    alert("请输入大于0且小于等于该项分值的分数。");
    //    return;
    //}
    var d = that.data0.form;
    d.AddScoreReason=$('#AddScoreReason').val();
    d.DeductScoreReason=$('#DeductScoreReason').val();
    d.PeriodSummary=$('#PeriodSummary').val();
    d.SelfPoints=$('#SelfPoints').text();
    d.ApproveOfPersonal=$('#ApproveOfPersonal').text();
    d.ApproveOfDept=$('#ApproveOfDept').val();
    d.ApproveOfDeptSign=$('#ApproveOfDeptSign').text();
    d.ApproveOfPartyHeader=$('#ApproveOfPartyHeader').val();
    d.ApproveOfPartyHeaderSign = $('#ApproveOfPartyHeaderSign').text();
    d.ResultLevel = $('#ResultLevel').val();
    d.TotalPoints = Number($('#SelfPoints').text());
    d.EvaluationId=this.evaluationId;
    d.EmployeeId=this.employeeId;
    d.DeptId=this.busienssUnitId;
    d.EvaluatorId=this.evaluatorId;
    d.EvalTypeCode=this.evalTypeCode;
    d.EvaluationFormId = this.evaluationFormId;
    if(onlySave){
        d.StatusCode = '1';
    }
    else {
        d.StatusCode = '3';
    }
   
    $.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=evaluation.employee.form.submit2",
        type: 'post',
        data: {
            Message: JSON.stringify(d)
        },
        dataType: 'json',
        async: false,
        success: function (data) {
            if (data&&data.status == 1) {
                if (onlySave) {
                    success2('保存成功');
                    setTimeout(function () {
                        window.location.href = changeUrlArg(window.location.href, 'StatusCode', 1)
                    },1000)
                }
                else {
                    success2("提交成功");
                    $('#btnSave').hide()
                    $('#btnSubmit').hide()
                    $('#btnRevert').hide()
                    setTimeout(function () {
                        window.location.href = changeUrlArg(window.location.href, 'StatusCode', 3)
                    },1000)
                }
                //window.close();
            } else {
                alert('保存失败');
            }
        }
    });
};
function changeUrlArg(url, arg, val) {
    var pattern = arg + '=([^&]*)';
    var replaceText = arg + '=' + val;
    return url.match(pattern) ? url.replace(eval('/(' + arg + '=)([^&]*)/gi'), replaceText) : (url.match('[\?]') ? url + '&' + replaceText : url + '?' + replaceText);
}
function hidebtn() {
    var StatusCode = getQueryString('StatusCode')
    var dimensionCode = getQueryString('dimensionCode');
    if (StatusCode != '0' && StatusCode != '1') {
        $('#btnSave').remove()
        $('#btnSubmit').remove()
        $('#btnRevert').remove()
        $('input').each(function () {
            $(this).parent().append($(this).val())
        })
        $('textarea').each(function () {
            $(this).parent().append($(this).val())
        })
        $('input').hide()
        $('textarea').hide()
        $('#ResultLevelCon').text((that.data0.form.ResultLevel?that.data0.form.ResultLevel:'_____'))
    }
    else {
        if (dimensionCode == '自评') {
            $('#btnRevert').remove()
            $('.notself input').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notself textarea').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notself input').hide()
            $('.notself textarea').hide()
            $('#ResultLevelCon').text((that.data0.form.ResultLevel ? that.data0.form.ResultLevel : '_____'))
        }
        else if (dimensionCode == '部门' || dimensionCode == '大科') {
            $('.notdept input').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notdept textarea').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notdept input').hide()
            $('.notdept textarea').hide()
            $('#ResultLevelCon').text((that.data0.form.ResultLevel ? that.data0.form.ResultLevel : '_____'))
        }
        else if (dimensionCode == '党总支') {
            $('.notparty input').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notparty textarea').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notparty input').hide()
            $('.notparty textarea').hide()
            $('#ResultLevelCon').text((that.data0.form.ResultLevel ? that.data0.form.ResultLevel : '_____'))
        }
        else if (dimensionCode == '纪委') {
            $('.notresult input').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notresult textarea').each(function () {
                $(this).parent().append($(this).val())
            })
            $('.notresult input').hide()
            $('.notresult textarea').hide()
        }
        else {
            $('input').each(function () {
                $(this).parent().append($(this).val())
            })
            $('textarea').each(function () {
                $(this).parent().append($(this).val())
            })
            $('input').hide()
            $('textarea').hide()
            $('#ResultLevelCon').text((that.data0.form.ResultLevel ? that.data0.form.ResultLevel : '_____'))
        }
    }
}
