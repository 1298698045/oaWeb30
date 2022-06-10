var filterobject = {
    filterrowhtml: '',
    entityattribute: {},
    entityattributeselecthtml: '',
    rowdata: [],
    domid:''
}
var self
function gridFilter(id) {
    self = this
    var that = this
    this.init = function () {
        this.getentityattribute()
    }
    this.domid = id//id名
    this.rowdata = []//数据
    this.entityattribute = {} //可选字段
    this.filterrowhtml = '' //单行dom
    this.entityattributeselecthtml = '' //字段dom
    this.checkedattribute = ''     //运算符数据
    this.getentityattribute = function () {
        //获取所有字段
        ajaxMethodGetAsyncData('process.entity.attribute.getlist', { ProcessId: getQueryString('ProcessId') }, false,function (data) {
            that.entityattribute = data.returnValue.Entities
            for (var i = 0; i < that.entityattribute.length; i++) {
                that.entityattributeselecthtml += '<optgroup label="' + that.entityattribute[i].label + '">'
                for (var j = 0; j < that.entityattribute[i].attributes.length; j++) {
                    that.entityattributeselecthtml += '<option value="' + that.entityattribute[i].name+'.'+that.entityattribute[i].attributes[j].name + '">' + that.entityattribute[i].attributes[j].label + '</option>'
                }
                that.entityattributeselecthtml += '</optgroup>'
            }
            that.getrowhtml()
        })
    }
    //获取数据
    this.getfilter = function (data) {
        if (data&&data.length>0) {
            for (var i = 0; i < data.length; i++) {
                this.addrow(data[i])
            }
        }else if ($('#'+id).find('.filter-row').length == 0) {
            this.addrow()
            this.addrow()
        }
    }
    this.getrowhtml = function () {
        
        //创建初始行
        this.filterrowhtml = '<tr class="filter-row">'
            + '              <td>'
        + '                <div class="addfiltercontent-logicia">'
        + '                    <select lay-filter="attributeschook" lay-verify="required" class="attributeschook" name="city" lay-search>'
        + '                        <option value="">请选择</option>'
        + '<option value="AND">与</option>'
        + '<option value="OR">或</option>'
        + '                    </select>'
        + '                </div>'
        + '                  </td>'
        + '              <td>'
        + '                <div class="addfiltercontent-attributes">'
        + '                    <select lay-filter="attributeschook" lay-verify="required" class="attributeschook" name="city" lay-search>'
        + '                        <option value="">请选择</option>'
        + this.entityattributeselecthtml
        + '                    </select>'
        + '                </div>'
        + '                  </td>'
        + '              <td>'

        + '                <div class="addfiltercontent-operator">'
        + '                    <select lay-filter="operatorchook" lay-verify="required" class="operatorchook" name="city" lay-search>'
        + '                        <option value="">请选择</option>'
        + '                    </select>'
        + '                </div>'
        + '                  </td>'
        + '              <td>'

        + '                <div class="addfiltercontent-value">'
        + '                    <div class="addfiltercontent-text">'
        + '                        <input type="text" name="title" required lay-verify="required" placeholder="请输入值" autocomplete="off" class="layui-input">'
        + '                    </div>'
        + '                    <div class="addfiltercontent-datetime">'
        + '                        <input type="text" class="layui-input addfiltercontent-time1">'
        + '                    </div>'
        + '                    <div class="addfiltercontent-date">'
        + '                        <input type="text" class="layui-input addfiltercontent-time2">'
        + '                    </div>'
        + '                    <div class="addfiltercontent-scopedatetime">'
        + '                        <input type="text" class="layui-input addfiltercontent-time3">'
        + '                    </div>'
        + '                    <div class="addfiltercontent-year">'
        + '                        <input type="text" class="layui-input addfiltercontent-time4">'
        + '                    </div>'
        + '                    <div class="addfiltercontent-month">'
        + '                        <input type="text" class="layui-input addfiltercontent-time5">'
        + '                    </div>'
        + '                    <div class="addfiltercontent-Picklist">'
        + '                        <div></div>'
        + '                    </div>'
        + '                    <div class="addfiltercontent-DroplistText">'
        + '                        <div class="DroplistTextvalue">'
        + '                            <span></span>'
        + '                        </div>'
        + '                        <div class="DroplistTextoptions">'
        + '                            <ul>'
        + '                            </ul>'
        + '                        </div>'
        + '                    </div>'
        + '                    <div class="addfiltercontent-searchDroplistText">'
        + '                        <div class="searchDroplistTextvalue">'
        + '                            <span style="display:none"></span>'
        + '                            <input></input>'
        + '<img style="display:none" title="创建人" onclick=chooselookup(this) class="searchimg" src="/img/images/02.1-1.Search_.png">'
        + '<div class="checkedlist"></div>'
        + '                        </div>'
        + '                        <div class="searchDroplistTextoptions">'
        + '                            <ul>'
        + '                            </ul>'
        + '                        </div>'
        + '                    </div>'
        + '                     <div class="addfiltercontent-checkbox">'
    + '                        <div style="padding-left:10px;"><input class="radioinput" name="radio" value="1" type="radio" lay-ignore />是<input class="radioinput"value="0" name="radio" type="radio" lay-ignore />否</div>'
    + '                    </div>'
        + '                </div>'
        + '                  </td>'
        + '<td>'
        + '    <div class="filter-rowdelete-btn">'
        + '        <img src="/img/cal/23.111(18x18)_1.png" alt="" />'
        + '    </div>'
        + '</td>'
        + '            </tr>'
    }
    //选择字段
    this.attributeschookchange = function (data) {
       // console.log(data)
        if (data.elem) {
            this.editrow = $(data.elem).parents('.filter-row')
        } else {
            this.editrow = $('#'+this.domid).find('.filter-row:last')
        }
        for (var i = 0; i < this.entityattribute.length; i++) {
            for (var j = 0; j < this.entityattribute[i].attributes.length; j++) {
                if (data.value == this.entityattribute[i].name+'.'+this.entityattribute[i].attributes[j].name) {
                  //  console.log(this.entityattribute[i].attributes[j])
                    this.checkedattribute = this.entityattribute[i].attributes[j]
                    this.setoperator(this.editrow)
                    break
                }
            }
            
        }
        $(data.elem).parents('.filter-row').find('.searchDroplistTextoptions ul').html('')
        $(data.elem).parents('.filter-row').find('.searchDroplistTextvalue span').html('')
        $(data.elem).parents('.filter-row').find('.searchDroplistTextvalue span').attr('name', '')
        this.createdtimecontent()

    }
    //创建运算符
    this.setoperator = function (dom) {
        dom.find('.addfiltercontent-value>div').hide()
        dom.find('.addfiltercontent-text').show()
        dom.find('.addfiltercontent-value input').val('')
        dom.find('.DroplistTextvalue span').attr('value', '').html('')
        dom.find('.operatorchook').html('<option value="">请选择</option>')
        //console.log(this.checkedattribute.operator,123)
        for (var i = 0; i < this.checkedattribute.operator.length; i++) {
            var res = this.checkedattribute.operator[i]
            dom.find('.operatorchook').append('<option operatorType="' + res.operatorType + '" value="' + res.operator + '">' + res.label + '</option>')
        }
        form.render();
    }
    //选择运算符
    this.operatorchookchange = function (data) {
        var dom = this.editrow;
        $(dom).find('.valuecontnet').removeClass('valuecontnet')
        dom.find('.addfiltercontent-value>div').hide()
        if (this.checkedattribute.dType == 'L' || this.checkedattribute.dType == 'DT' || this.checkedattribute.dType == 'MC' || this.checkedattribute.dType == 'Q') {
            //L 选项列表(存数值)，DT - 选项列表(存文字); MC-多项选择 Q - 左右选
            dom.find('.DroplistTextoptions ul').html('')
            dom.find('.addfiltercontent-DroplistText').show()
            dom.find('.addfiltercontent-DroplistText').find('span').addClass('valuecontnet')
            for (var i = 0; i < this.checkedattribute.filterValues.length; i++) {
                dom.find('.DroplistTextoptions ul').append('<li valuee="' + this.checkedattribute.filterValues[i].name + '"><span>' + this.checkedattribute.filterValues[i].label + '</span><img src="/img/cal/checked.png"/></li>')
            }
            this.choosevalue()
        } else if (this.checkedattribute.dType == 'F') {
            dom.find('.addfiltercontent-datetime').show()
            dom.find('.addfiltercontent-datetime input').addClass('valuecontnet')
        } else if (this.checkedattribute.dType == 'D') {
            dom.find('.addfiltercontent-date').show()
            dom.find('.addfiltercontent-date input').addClass('valuecontnet')
        } else if (this.checkedattribute.dType == 'Year') {
            dom.find('.addfiltercontent-year').show()
            dom.find('.addfiltercontent-year input').addClass('valuecontnet')
        } else if (this.checkedattribute.dType == 'Month') {
            dom.find('.addfiltercontent-month').show()
            dom.find('.addfiltercontent-month input').addClass('valuecontnet')
        } else if (this.checkedattribute.dType == 'B' ) {
           
            dom.find('.addfiltercontent-checkbox').show()
            dom.find('.addfiltercontent-checkbox input').addClass('valuecontnet')
            var random = Math.ceil(Math.random() * 10000000);
            dom.find('.addfiltercontent-checkbox input').attr('name', 'radio' + random)
            dom.find('.addfiltercontent-checkbox input').eq(0).attr('value', '1')
            dom.find('.addfiltercontent-checkbox input').eq(1).attr('value', '0')
        } else if (this.checkedattribute.dType == 'Y_MD' || this.checkedattribute.dType == 'Y' || this.checkedattribute.dType == 'O' || this.checkedattribute.dType == 'U') {
            dom.find('.addfiltercontent-searchDroplistText').show()
            dom.find('.addfiltercontent-searchDroplistText input').addClass('valuecontnet').attr('Lktp', this.checkedattribute.referencedEntityObjectTypeCode).click(function () {
                dom.find('.searchDroplistTextoptions').show()
                that.getlookup(dom)
                return false;
            });
            dom.find('.searchDroplistTextvalue .downimg').click(function () {
                dom.find('.searchDroplistTextoptions').show()
                dom.find('.addfiltercontent-searchDroplistText input').focus();
                that.getlookup(dom)
                return false;
            })
            dom.find('.searchDroplistTextvalue>input').keyup(function (e) {
                if (e.keyCode == '13') {
                    that.getlookup(dom)
                }
            })
            if (this.checkedattribute.dType == 'O') {
                dom.find('.searchimg').show()
            }
        } else {
            dom.find('.addfiltercontent-text').show()
            dom.find('.addfiltercontent-text input').addClass('valuecontnet')
        }
        
        if (this.checkedattribute.dType == 'D' || this.checkedattribute.dType == 'F') {
           // console.log(data.elem)
            var operatortype = $(data.elem).find('option[value="' + data.value + '"]').attr('operatortype')
           // console.log(operatortype)
            if (operatortype == '0') {
                $(data.elem).parents('.filter-row').find('.valuecontnet').hide()
            }
            if (data.value == 'between')
            if (data.value == 'between') {
                $(dom).find('.valuecontnet').removeClass('valuecontnet')
                dom.find('.addfiltercontent-value>div').hide()
                dom.find('.addfiltercontent-scopedatetime').show()
                dom.find('.addfiltercontent-scopedatetime input').addClass('valuecontnet')
            }
        }
    }

    //添加行
    this.addrow = function (data) {
        //console.log(this.domid)
        $('#' + this.domid).find('.filter-main table').append(that.filterrowhtml)
        
        $('#' + this.domid).find('.filter-rowdelete-btn').click(function () {
            $(this).parents('tr').remove()
        })
        form.on('select(attributeschook)', function (data) {
            that.attributeschookchange(data)
        });
        form.on('select(operatorchook)', function (data) {
            that.operatorchookchange(data)
        });
        if (data) {
            $('#' + this.domid).find('.attributeschook:last').val(data.attribute)
            $('#' + this.domid).find('.addfiltercontent-logicia:last select').val(data.logical)
            this.attributeschookchange({ value: data.attribute})
            $('#' + this.domid).find('.operatorchook:last').val(data.operator)
            this.operatorchookchange({ value: data.operator, elem: $('#' + this.domid).find('.operatorchook:last') })
            data.operands = data.operands

            //console.log(data, 555)
            var html = []
            
            if (data.dataType == 'Y_MD' || data.dataType == 'Y' || data.dataType == 'O' || data.dataType == 'U') {
                $('#' + this.domid).find('.valuecontnet:last').parent().find('span').attr('name', data.operands.join(','))
                var picklistValues = []
                if (data.picklistValues) {
                    for (var i = 0; i < data.picklistValues.length; i++) {
                        picklistValues.push(data.picklistValues[i].label)
                        $('#' + this.domid).find('.valuecontnet:last').parent().find('.checkedlist').append('<div ename="' + data.picklistValues[i].label + '" name="' + data.operands[i] + '" class="checkedlistitem">' + data.picklistValues[i].label + '<div onclick="checkedlistitemdelete(\'' + data.operands[i] + '\',this)" class="checkedlistitemdelete layui-icon layui-icon-close"></div></div>')

                    }
                    $('#' + this.domid).find('.valuecontnet:last').parent().find('span').attr('ename', picklistValues.join(',')).html(picklistValues.join(','))
                }
            } else if (data.dataType == 'B') {
                $('#' + this.domid).find('.valuecontnet:last').attr('value', '0')
                $('#' + this.domid).find('.valuecontnet:last').prev().attr('value', '1')
                $('#' + this.domid).find('.valuecontnet[value="' + data.operands[0] + '"]:last').prop('checked', 'checked')
            }
            else if (data.dataType == 'MC') {
                $('#' + this.domid).find('.valuecontnet:last').attr('valuee', data.operands.join(','))
                $('#' + this.domid).find('.valuecontnet:last').html(data.operands.join(','))
                if (this.checkedattribute.filterValues) {
                    for (var j = 0; j < data.operands.length; j++) {
                        for (var i = 0; i < this.checkedattribute.filterValues.length; i++) {
                            if (this.checkedattribute.filterValues[i].name == data.operands[j]) {
                                html.push(this.checkedattribute.filterValues[i].label)
                                break;
                            }
                        }
                        if ($('#' + this.domid).find('.valuecontnet:last').parent().next('.DroplistTextoptions')) {
                            $('#' + this.domid).find('.valuecontnet:last').parent().next('.DroplistTextoptions').find('li[valuee="' + data.operands[j] + '"]').addClass('active')
                        }
                    }
                }
            }
            else {
                $('#' + this.domid).find('.valuecontnet:last').attr('valuee', data.operands.join(','))
                if (this.checkedattribute.filterValues) {
                    for (var j = 0; j < data.operands.length; j++) {
                        for (var i = 0; i < this.checkedattribute.filterValues.length; i++) {
                            if (this.checkedattribute.filterValues[i].name == data.operands[j]) {
                                html.push(this.checkedattribute.filterValues[i].label)
                                break;
                            }
                        }
                        if ($('#' + this.domid).find('.valuecontnet:last').parent().next('.DroplistTextoptions')) {
                            $('#' + this.domid).find('.valuecontnet:last').parent().next('.DroplistTextoptions').find('li[valuee="' + data.operands[j] + '"]').addClass('active')
                        }
                    }
                }
                if (html.length == 0) {
                    html = data.operands
                }
                html = html.join(',')
                $('#' + this.domid).find('.valuecontnet:last').html(html).val(html)
            }
        }
        form.render();

    }
    $('.filter-addbtn').click(function () {
        that.addrow()
    })
    //初始化时间控件
    this.createdtimecontent = function () {
        //console.log(that.editrow.find('.addfiltercontent-time2')[0])
        layui.use('laydate', function () {
            var laydate = layui.laydate
            laydate.render({
                elem:that.editrow.find('.addfiltercontent-time1')[0],
                type: 'datetime',
                format: 'yyyy-MM-dd HH-mm-ss'
                , trigger: 'click'
            });
            laydate.render({
                elem: that.editrow.find('.addfiltercontent-time2')[0],
                type: 'date',
                format: 'yyyy-MM-dd', trigger: 'click'

            });
            laydate.render({
                elem: that.editrow.find('.addfiltercontent-time3')[0],
                type: 'datetime',
                format: 'yyyy-MM-dd HH-mm-ss',
                range: true, trigger: 'click'
            });
            laydate.render({
                elem: that.editrow.find('.addfiltercontent-time4')[0],
                type: 'year',
                format: 'yyyy', trigger: 'click'
            });
            laydate.render({
                elem: that.editrow.find('.addfiltercontent-time5')[0],
                type: 'month',
                format: 'yyyy-mm'
                , trigger: 'click'
            });

        });
    }
    //下拉选择
    this.choosevalue = function () {
        var dom = this.editrow
        dom.find('.DroplistTextoptions li').click(function () {
            var that = this
            $(that).toggleClass('active')
            var items = $(that).parent().find('li.active')
            var names = []
            var values = []
            for (var i = 0; i < $(that).parent().find('li.active').length; i++) {
                values.push($(that).parent().find('li.active').eq(i).attr('valuee'))
                names.push($(that).parent().find('li.active').eq(i).find('span').html())
                console.log($(that).parent().find('li.active').eq(i).attr('valuee'))
            }
            dom.find('.DroplistTextvalue span').html()
            dom.find('.DroplistTextvalue span').html(names.join(','))
            dom.find('.DroplistTextvalue span').attr('valuee', values.join(','))
            return false;
        })
        dom.find('.DroplistTextvalue').click(function () {
            dom.find('.DroplistTextoptions').show()
            dom.find('.DroplistTextoptions').css('top', -dom.find('.DroplistTextoptions').height() - 5 + 'px')
            return false
        })
    }
    //搜索类型
    this.getlookup = function (dom) {
        var lksrch = dom.find('.valuecontnet').val()
        var Lktp = dom.find('.valuecontnet').attr('Lktp')
        ajaxMethodGetAsyncData('ui.entity.lookup', {
            Lktp: Lktp,
            lksrch: lksrch,
        },false, function (data) {
            dom.find('.searchDroplistTextoptions ul li').remove()
            dom.find('.searchDroplistTextoptions ul li').off()
            for (var i = 0; i < data.listData.length; i++) {
                var res = data.listData[i]
                if (dom.find('.searchDroplistTextoptions ul li.active').length > 0) {
                    for (var j = 0; j < dom.find('.searchDroplistTextoptions ul li.active').length; j++) {
                        if (dom.find('.searchDroplistTextoptions ul li.active').eq(j).attr('name') == res.ID) {
                            break
                        }
                        if (j == dom.find('.searchDroplistTextoptions ul li.active').length - 1) {
                            dom.find('.searchDroplistTextoptions ul').append('<li name="' + res.ID + '"><span>' + res.Name + '</span><img src="/img/cal/checked.png"></li>')
                        }
                    }
                } else {
                    dom.find('.searchDroplistTextoptions ul').append('<li name="' + res.ID + '"><span>' + res.Name + '</span><img src="/img/cal/checked.png"></li>')
                }
            }
            if (dom.find('.searchDroplistTextvalue span').attr('name')) {
                var checkedids = dom.find('.searchDroplistTextvalue span').attr('name').split(',')
                var checkedlabels = dom.find('.searchDroplistTextvalue span').attr('ename').split(',')
                for (var i = 0; i < checkedids.length; i++) {
                    if (JSON.stringify(data.listData).indexOf(checkedids[i]) == -1) {
                        dom.find('.searchDroplistTextoptions ul').append('<li name="' + checkedids[i] + '"><span>' + checkedlabels[i] + '</span><img src="/img/cal/checked.png"></li>')
                    }
                    dom.find('.searchDroplistTextoptions ul li[name="' + checkedids[i] + '"]').addClass('active')
                }
            }
            dom.find('.searchDroplistTextoptions').css('top', -dom.find('.searchDroplistTextoptions').height() - 5 + 'px')

            that.chosesearchvalue(dom)
        })
    }
    this.chosesearchvalue = function (dom) {
        dom.find('.searchDroplistTextoptions li').click(function () {
            var that = this
            $(that).toggleClass('active')


            var items = $(that).parent().find('li.active')
            var names = []
            var values = []
            for (var i = 0; i < $(that).parent().find('li.active').length; i++) {
                values.push($(that).parent().find('li.active').eq(i).attr('name'))
                names.push($(that).parent().find('li.active').eq(i).find('span').html())
            }
            var name = $(this).find('span').html()
            var value = $(this).attr('name')
            if ($(this).hasClass('active')) {
                
                dom.find('.checkedlist').append('<div name="' + value + '" class="checkedlistitem" ename="'+name+'">' + name + '<div onclick="checkedlistitemdelete(\''+value+'\',this)" class="checkedlistitemdelete layui-icon layui-icon-close"></div></div>')
            } else {
                console.log(dom.find('.checkedlist div[name="' + value + '"]'))
                dom.find('.checkedlist div[name="' + value + '"]').remove()
            }
            

            if (names.length > 1) {
                dom.find('.searchDroplistTextvalue>span').html('已选择数量：' + names.length)
            } else {
                dom.find('.searchDroplistTextvalue>span').html(names.join(','))
            }
            
            dom.find('.searchDroplistTextvalue>span').attr('name', values.join(','))
            dom.find('.searchDroplistTextvalue>span').attr('ename', names.join(','))
            
            return false;
        })
    },
    //获取保存数据
    this.getrowdata = function () {
        this.rowdata = []
        $('#' + this.domid).find('.filter-row').each(function (index) {
            var label =  $(this).find('.addfiltercontent-attributes').find('input').val()
            var attribute = $(this).find('.addfiltercontent-attributes').find('select').val()
            var dataType = ''
            var logical = $(this).find('.addfiltercontent-logicia').find('select').val()
            
            for (var i = 0; i < that.entityattribute.length; i++) {
                for (var j = 0; j < that.entityattribute[i].attributes.length; j++) {
                    if (that.entityattribute[i].name+'.'+that.entityattribute[i].attributes[j].name == attribute) {
                        dataType = that.entityattribute[i].attributes[j].dType
                    }
                }
                
            }
            //console.log(dataType)
            var operator = $(this).find('.operatorchook').val()
            var picklistValues = []
            var operands = ''
            console.log($(this).find('.valuecontnet').val())
            console.log($(this).find('.valuecontnet'))
            if ($(this).find('.valuecontnet').html()!=null&&$(this).find('.valuecontnet').html()!='') {
                if ($(this).find('.valuecontnet').html().indexOf(',' != -1)) {
                    operands = $(this).find('.valuecontnet').attr('valuee').split(',')
                } else {
                    operands = [$(this).find('.valuecontnet').attr('valuee')]
                }
            } else {
                operands = [$(this).find('.valuecontnet').val()]
            }
            
            if (operands.length == 0) {
                operands = picklistValues
            }
            if ($(this).find('.addfiltercontent-searchDroplistText .valuecontnet').length > 0) {
                if($(this).find('.addfiltercontent-searchDroplistText .valuecontnet').prev().attr('name').indexOf(',' != -1)){
                    operands = $(this).find('.addfiltercontent-searchDroplistText .valuecontnet').prev().attr('name').split(',')
                } else {
                    operands = [$(this).find('.addfiltercontent-searchDroplistText .valuecontnet').prev().attr('name')]
                }
                for (var i = 0; i < operands.length; i++) {
                    picklistValues.push({
                        label: $(this).find('.addfiltercontent-searchDroplistText .valuecontnet').prev().attr('ename').split(',')[i],
                        value: operands[i]
                    })
                }
            }
            if ($(this).find('.addfiltercontent-checkbox .valuecontnet').length > 0) {
                operands = [$(this).find('.addfiltercontent-checkbox input::checked').val()]
            }
            if (attribute && attribute != '') {
                that.rowdata.push(
                  {
                      "id": index,
                      "sort": index,
                      "label": label,
                      "column": attribute,
                      "attribute": attribute,
                      "dataType": dataType,
                      "logical": logical,
                      "picklistValues": picklistValues,
                      "operator": operator,
                      "isEditable": false,
                      "operands": operands
                  })
            }
            
        })
    }
}
$(document).click(function () {
    $('.DroplistTextoptions').hide()
    $('.searchDroplistTextoptions').hide()
})
function checkedlistitemdelete(id, that) {
    var names = []
    var labels = []
    var dom = $(that).parents('.addfiltercontent-searchDroplistText')
    $(that).parents('.checkedlistitem').remove()

    for (var i = 0; i < dom.find('.checkedlistitem').length; i++) {
        names.push(dom.find('.checkedlistitem').eq(i).attr('name'))
        labels.push(dom.find('.checkedlistitem').eq(i).attr('ename'))
    }
    dom.find('li[name="' + id + '"]').removeClass('active')
    dom.find('span').attr('name', names.join(','))
    dom.find('span').attr('ename', labels.join(','))
    dom.find('span').html(labels.join(','))

}
var chooselookupdom
var chooselookupdomids
var chooselookupdomnames
function chooselookup(that) {
    chooselookupdom = that
    chooselookupdomnames = $(chooselookupdom).parent().find('span').attr('ename')
    chooselookupdomids = $(chooselookupdom).parent().find('span').attr('name')
    $('#iframe').attr('src', '/alert/deptchose.html?type=parentchose&lknm=' + name).show()
    $('.popup-mask').show()
}
function choosedept(ids, names) {
    $(chooselookupdom).parent().find('span').attr('name', ids).attr('ename', names).html(names)
    $(chooselookupdom).parent().find('.checkedlist div').remove()
    for (var i = 0; i < ids.split(',').length; i++) {
       $(chooselookupdom).parent().find('.checkedlist').append('<div ename="' + names.split(',')[i] + '" name="' + ids.split(',')[i] + '" class="checkedlistitem">' + names.split(',')[i] + '<div onclick="checkedlistitemdelete(\'' + ids.split(',') + '\',this)" class="checkedlistitemdelete layui-icon layui-icon-close"></div></div>')
    }
}
