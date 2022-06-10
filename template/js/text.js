//var sdata = [{ field: '人员编号', value: '6666666' }, { field: '姓名', value: '撒兴瑞' }, { field: '人员编号', value: '6666666' }, { field: '姓名', value: '撒兴瑞' }, { field: '人员编号', value: '6666666' }, { field: '姓名', value: '撒兴瑞' }, { field: '人员编号', value: '6666666' }, { field: '姓名', value: '撒兴瑞' }, { field: '人员编号', value: '6666666' }, { field: '姓名', value: '撒兴瑞' }, { field: '人员编号', value: '6666666' }, { field: '姓名', value: '撒兴瑞' },{ field: '人员编号', value: '6666666' }, { field: '姓名', value: '撒兴瑞' },
//{ field: '薪级工资', value: '12000' }, { field: '薪级工资', value: '12000' }, { field: '岗位工资', value: '12000' }, { field: '岗位绩效', value: '12000' }, { field: '卫生津贴', value: '10' }, { field: '护龄', value: '10' }, { field: '工龄', value: '10' }, { field: '交通费', value: '10' }, { field: '综合补助', value: '10' }, { field: '临时性补贴', value: '10' }, { field: '津贴保留', value: '10' }, { field: '岗津', value: '10' }, ]
//initFields(sdata)

function initFields(sdata)
{
    var sections = [
        {
            title: "基本信息",
            fields: [
                {
                    name: '',
                    title: "人员编号"
                },
                {
                    name: '',
                    title: "姓名"
                },
                {
                    name: '',
                    title: "部门"
                },
                {
                    name: '',
                    title: "年份"
                },
                {
                    name: '',
                    title: "月份"
                },
            ]
        },
        {
            title: "应发合计",
            fields: [
                {
                    title: "薪级工资",
                    value: '',
                }, {
                    title: "浮动薪级",
                    value: '',

                }, {
                    value: '',
                    title: "岗位工资"
                }, {
                    value: '',
                    title: "岗位绩效"
                }, {
                    value: '',
                    title: "卫生津贴"
                }, {
                    value: '',
                    title: "岗津"
                }, {
                    value: '',
                    title: "津贴保留"
                }, {
                    value: '',
                    title: "临时性补贴"
                }, {
                    value: '',
                    title: "综合补助"
                }, {
                    value: '',
                    title: "交通费"
                }, {
                    value: '',
                    title: "护龄"
                }, {
                    value: '',
                    title: "工龄"
                }, {
                    value: '',
                    title: "书报费"
                }, {
                    value: '',
                    title: "洗理费"
                }, {
                    value: '',
                    title: "回托补"
                }, {
                    value: '',
                    title: "物价"
                }, {
                    value: '',
                    title: "提租补贴"
                }, {
                    value: '',
                    title: "通讯补"
                }, {
                    value: '',
                    title: "其他"
                }, {
                    value: '',
                    title: "其他1"
                }, {
                    value: '',
                    title: "补发核增绩效"
                }, {
                    value: '',
                    title: "节假日补贴"
                }, {
                    value: '',
                    title: "咨询治疗费"
                }, {
                    value: '',
                    title: "年终绩效奖励"
                }, {
                    value: '',
                    title: "奖金"
                }, {
                    value: '',
                    title: "物业费"
                }, {
                    value: '',
                    title: "十三月工资"
                }, {
                    value: '',
                    title: "药费"
                }, {
                    value: '',
                    title: "门诊提成"
                }, {
                    value: '',
                    title: "上月劳务"
                }, {
                    value: '',
                    title: "伙食补助"
                }, {
                    value: '',
                    title: "住房补贴"
                }, {
                    value: '',
                    title: "其他应收款"
                }
            ]
        }, {
            title: "扣款合计",
            fields: [
                {
                    title: "扣津贴",
                    value: '',
                }, {
                    title: "扣房积",
                    value: '',

                }, {
                    value: '',
                    title: "扣养老"
                }, {
                    value: '',
                    title: "扣职业年金"
                }, {
                    value: '',
                    title: "补扣税"
                }, {
                    value: '',
                    title: "扣房租"
                }, {
                    value: '',
                    title: "扣医疗保险"
                }, {
                    value: '',
                    title: "扣绩效核减"
                }, {
                    value: '',
                    title: "扣医保拒付款"
                }, {
                    value: '',
                    title: "扣工会会费"
                }, {
                    value: '',
                    title: "代扣税"
                }, {
                    value: '',
                    title: "扣款合计"
                }
            ]
        }, {
            title: "其他信息",
            fields: [
                {
                    title: "应纳税所得",
                    value: '',
                }, {
                    title: "子女教育",
                    value: '',

                }, {
                    value: '',
                    title: "继续教育"
                }, {
                    value: '',
                    title: "住房贷款利息"
                }, {
                    value: '',
                    title: "住房租金"
                }, {
                    value: '',
                    title: "老人赡养费"
                }, {
                    value: '',
                    title: "其他合法扣除"
                },
            ]
        },
    ];

    //source data
    var cols = 10;
    var colCount = 0;
    var count = 0;
    var html = "";
    var html1 = "";
    var html2 = "";
    for (var r = 0; r < sdata.length; r++) {
        var colCount = 0;
        var row = sdata[r];
        html += "<br/><br/>";
        html += "<table class=\"list\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
        for (var i = 0; i < sections.length; i++) {
            var section = sections[i];
            var rownumber = 0
            html += ('<tr><th class="    " style="background: #f2f3f3 none repeat scroll 0 0;color:red;" colspan="10">' + section.title + '</th></tr>');
            //$('#gridContainer tbody').append('<tr></tr>')
            //$('#gridContainer tbody').append('<tr></tr>')
            if (colCount == 0) {
                html1 += "<tr class='dataRow '>";
                html2 += "<tr class='dataRow '>";
            }
            for (var j = 0; j < section.fields.length; j++) {
                //if (rownumber == 10) {
                //    rownumber = 0
                 //   count += 2;
                 //   $('#gridContainer tbody').append('<tr></tr>')
                //    $('#gridContainer tbody').append('<tr></tr>')
                //}
                if (colCount >= 10) {
                    html1 += "</tr>";
                    html2 += "<tr><td style='height:10px;'></td></tr>";
                    html2 += "</tr>";
                    html += html1;
                    html += html2;
                    colCount = 0;
                    html1 = "";
                    html2 = "";
                }
                var f = section.fields[j];
                var field = f.field;
                //getfielddata(sdata, field, count);
                var fieldvalue = getFieldvalue(row, field);
                html1 += "<th class='  dataCell  ' style='background: #f2f3f3 none repeat scroll 0 0;'>" + field + "</th>";
                html2 += "<td class='  dataCell ' style='font-size:14px;'>" + fieldvalue + "</td>";
                colCount++;
                rownumber++
            }
            if (colCount >= 0) {
                html1 += "</tr>";
                html2 += "</tr>";
                html += html1;
                html += html2;
                colCount = 0;
                html1 = "";
                html2 = "";
            }

            //html += "</tr>";                                                       
            //html += "</table>";
            //count += 3;
        }
        html += "</table>";
    }
    $("#gridContainer").html(html);
}

function getFieldvalue(sdata, title, count) {
    for (var i = 0; i < sdata.length; i++) {
        var field = sdata[i].field
        //console.log(field)
        //console.log(title)
        if (field == title) {
            var value = sdata[i].value;
           // $('#gridContainer tbody tr').eq(count + 1).append('<th class="  dataCell  " style="background: #f2f3f3 none repeat scroll 0 0;">' + field + '</th>')
            // $('#gridContainer tbody tr').eq(count + 2).append('<th class="  dataCell  " >' + value + '</th>')
            return value;
        }
    }
    return "";
}


function getfielddata(sdata,title,count) {
    for (var i = 0; i < sdata.length; i++) {
        var field = sdata[i].field
        //console.log(field)
        //console.log(title)
        if (field == title) {
            var value = sdata[i].value
            $('#gridContainer tbody tr').eq(count+1).append('<th class="  dataCell  " style="background: #f2f3f3 none repeat scroll 0 0;">' + field + '</th>')
            $('#gridContainer tbody tr').eq(count + 2).append('<th class="  dataCell  " >' + value + '</th>')
        }
    }
}

