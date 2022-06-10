

var exporturl = ''
var exportpagesize=''
function createdlayout(name) {
    var that = this
    var thisself = this
    this.contractname = name

    //console.log(this)
    this.formcomponents = formcomponents
    this.init = function () {
       // console.log(this)
        this.createdlayout()
    }
    this.createdlayout = function () {
        var contractname = this.contractname
        var template = window.layoutdata[contractname].template
        $('.header-title').html(template.head.title)
        $('head title').html(template.head.title)
        $('.logo-img img').attr('src', template.head.logo)
        var btns = template.head.btns
        var that = this
        for (var i = 0; i < btns.length; i++) {
            var item = btns[i]
            if (item.label == '搜索') {
                $('.head-right-btn').append('<div onclick="reloadgrid()"  class="layui-btn layui-btn-sm ' + item.type + '">' + item.label + '</div>')
            }
            else if (item.label == '导出') {
                $('.head-right-btn').append('<div onclick="exported()"  class="layui-btn layui-btn-sm ' + item.type + '">' + item.label + '</div>')
            }
            else if (item.label == '高级搜索') {
                $('.head-right-btn').append('<div class="layui-btn layui-btn-sm ' + item.type + ' hightsearch" id="hightsearch">' + item.label + '</div>')
            }
            else {
                window[item.click.n] = item.click.f
                $('.head-right-btn').append('<div id="' + item.click.n + '" onclick="' + item.click.n + '()"  class="layui-btn layui-btn-sm ' + item.type + '">' + item.label + '</div>')
            }
        }
        
        $('.hightsearch').click(function () {
            var right = $(window).width() - $(this).offset().left - 20 - 16 - 10-24
            if ($('#hightsearch-content').length == 0) {
                $('body').append('<div id="hightsearch-content" class="hightsearch-content1"><div style="right:' + right + 'px" class="hightsearch-point"></div><div class="layui-form"></div><div style="margin:0 5px"  class="buttonbtn-group"><div class="buttonbtn heightsearch"><a>搜索</a></div></div><div class="buttonbtn-group clearsearch"><div class="buttonbtn"><a>重置</a></div></div></div>')
                getlookupfilter()
            } else {
                $('#hightsearch-content').toggle()
            }
            $('.heightsearch').click(function () {
                $('#hightsearch-content').hide()
                reloadgrid()
            })
            $('.clearsearch').click(function() {
                $('#hightsearch-content .layui-input').val('')
                $('#hightsearch-content').find('input').val('')
                $('#hightsearch-content').find('select').val('')
            })
            return false;
        })

        layui.use('upload', function () {
            var upload = layui.upload;
            var uploadInst = upload.render({
                elem: '#distinguishInvoice' //绑定元素
              , url: '/apps/CommandProcessor.ashx?c=1&cmd=contract.invoice.upload' //上传接口
              , accept: 'file'
              , done: function (res, index, upload) {
                  if (res) {
                      //console.log(res)
                                   var typea = ''
                                   if ((res.data.name).indexOf('jpg') !== -1 || (res.data.name).indexOf('jpeg') !== -1 || (res.data.name).indexOf('png') !== -1 || (res.data.name).indexOf('bmp') !== -1) {
                                       typea = 'image'
                                   }
                                   else if ((res.data.name).indexOf('pdf') !== -1) {
                                       typea = 'pdf'
                                   }
                                   else {
                                       layer.msg('仅支持image或pdf')
                                   }
                                   ajaxMethodPostData('contract.invoice.distinguish', { type: typea, path: res.data.imgPath, InvoiceId: res.data.InvoiceId }, function (data) {
                                       layer.msg(data.msg)
                                   })
                               }
                  }
            });
        });
        var tabs = template.tabs
            if (template.head.title=='合同审计') {
                ajaxMethodGetData('contract.audit.getcount', null, function (data) {
                    for (var i = 0; i < tabs.length; i++) {
                        var item = tabs[i]
                        var countdata = data.data
                        if (item) {
                        for (var j = 0; j < countdata.length; j++) {
                            if (countdata[j].Name == item.label) {
                                $('.layui-tab-title').append('<li name="' + item.name + '" ><span class="tab-title">' + item.label + '</span><span class="tab-count" style="margin-left:5px;color:rgba(255, 0, 0, 1);">' + (countdata[j].Count ? countdata[j].Count : 0) + '</span>' + '</li>')
                            }
                        }
                        }
                        //var item = JSON.parse(JSON.stringify(item))
                    }
                    //$('.layui-tab-title li').click(function () {
                    //    tabchange(tabs[$(this).index()], that)
                    //})
                    //if (getQueryString('tab')) {
                    //    var index = Number(getQueryString('tab')) ? Number(getQueryString('tab')) : 0
                    //    $('.layui-tab-title li').eq(index).addClass('layui-this')
                    //    tabchange(tabs[index], that)
                    //}
                    //else {
                    //    $('.layui-tab-title li:first').addClass('layui-this')
                    //    tabchange(tabs[0], that)
                    //}
                })
            }
            else{
                for (var i = 0; i < tabs.length; i++) {
                        var item = tabs[i]
                if (item) {
                    $('.layui-tab-title').append('<li name="' + item.name + '" >' + item.label + '</li>')
                }
            //var item = JSON.parse(JSON.stringify(item))
            }
        }

        $('.layui-tab-title li').click(function () {
            tabchange(tabs[$(this).index()], that)
        })
        if (getQueryString('tab')) {
            var index = Number(getQueryString('tab'))?Number(getQueryString('tab')):0
            $('.layui-tab-title li').eq(index).addClass('layui-this')
            if (getQueryString('tabtype')) {
                $('.search-content .layui-form-item').eq(3).find('dd[lay-value="' + getQueryString('tabtype') + '"]').addClass('layui-this')
            }
            tabchange(tabs[index], that)
        }
        else {
            $('.layui-tab-title li:first').addClass('layui-this')
            tabchange(tabs[0], that)
        }
    }
    this.getlookupfilter = function (type) {
        var searchform = []
        var GridColumns = []
        var that = this
        if (typeof this.activetab.table.filterquery == 'function') {
            var filterquery = this.activetab.table.filterquery()

        } else {
            var filterquery = ''

}
        ajaxMethodGetAsyncData('entity.lookupfilter.getlist', { objectTypeCode: this.activetab.table.objecttypecode, filterquery: filterquery }, false, function (data) {
            if (data && data.returnValue && data.returnValue.SearchFields) {
                for (var i = 0; i < data.returnValue.SearchFields.length; i++) {
                    var item = data.returnValue.SearchFields[i]
                    searchform.push({
                        label: item.Label,
                        name: item.Name,
                        placeholder: "请填写内容",
                        type: item.DataType,
                        objtypecode: item.ReferencedEntityObjectTypeCode
                    })
                }
            }
            var chosefield=''
            if (data && data.returnValue && data.returnValue.GridColumns) {
            for (var i = 0; i < data.returnValue.GridColumns.length; i++) {
                var item = data.returnValue.GridColumns[i]
                // console.log(item, '111')
                //console.log(item.Name, '111')
                GridColumns.push({
                    field: item.Name,
                    title: item.Title,
                    sortable: true,
                })
                if (item.IsNameField && that.activetab.common == true && getQueryString('readonly') != 'readonly') {
                    if (getQueryString('selecttype') == 'multi') {
                        GridColumns.unshift({
                            field: 'LIST_RECORD_ID',
                            checkbox: true
                        })
                    }
                    else {
                        chosefield = item.Name;
                        GridColumns.unshift({
                            field: 'LIST_RECORD_ID',
                            title: '操作',
                            formatter: function formatter(value, row, index) {
                                return '<a onclick="chooselookup(\'' + row.LIST_RECORD_ID + '\',\'' + row[chosefield] + '\')" style=\"color:#015ba7;font-size:13px;\" href="javascript:">选择</a>&nbsp;';
                            }
                        })
                    }
                }
            }}
        })
        if (type == 'searchform') {
            return searchform;
        } else {
            return GridColumns;
        }
    }
    this.getselect = function () {
        ajaxMethodGetAsyncData('entity.detail.get', { objtypecode: this.activetab.table.objecttypecode }, false, function (data) {
            that.select = data.context.picklistValuesMap
        })
    }
    this.getexport = function () {
        var contractname = this.contractname
        var template = window.layoutdata[contractname].template
        var template1 = $('.layui-tab-title .layui-this').text()
        //$('#datagrid').loading();
        $("#datagrid").datagrid("loading");
        $('#datagridExport').datagrid({
            columns: [that.activetab.table.columnsArray],
            fitCloumns: true,
            idField: "LIST_RECORD_ID",
            singleSelect: false,
            checkOnSelect: true,
            method: 'POST',
            rownumbers: true,
            url: window.exporturl,
            remoteSort: false,
            striped: false,
            pageSize: window.exportpagesize,
            pageList: [10, 15, 20, 25, 30, 50, 100, 200, 500, 1000],
            queryParams: {
                filterquery: that.activetab.table.filterquerystring != 'undefined' && that.activetab.table.filterquerystring != undefined ? that.activetab.table.filterquerystring : '',
                page: 0,
                rows: window.exportpagesize
            },
            onDblClickRow: function onDblClickRow(index, row) {
            },
            onLoadSuccess: function () {
                //$('#datagrid').loading({
                //    showLoading: false
                //});
                $("#datagrid").datagrid("loaded");
                $(this).datagrid('toExcel', template.head.title + (template1 ? '-' + template1 : '') + '.xls');
            },
        });

    }
    this.getsummary = function () {
        var item = that.activetab
        $('.statistics-content').html('')
        if (item.summary.length > 0) {
            for (var i = 0; i < item.summary.length; i++) {
                if (item.summary[i].label) {
                    $('.statistics-content').append('<div class="layui-card">'
                    + '  <div class="layui-card-body">'
                    + '      <div class="statistics-left">'
                    + '          <div class="statistics-name">' + item.summary[i].label + '</div>'
                    + '          <div class="statistics-count" name="' + item.summary[i].name + '">0</div>'
                    + '      </div>'
                    + '      <div class="statistics-right">'
                    + '          <div class="layui-icon ' + item.summary[i].type + '" style="color:#108def;"></div>'
                    + '      </div>'
                    + '  </div>'
                    + '</div>')
                }
                
            }
            $('.statistics-content .layui-card').width($('.statistics-content').width() / $('.statistics-content .layui-card').length - 10)



            var suurl = that.activetab.summaryurl

            for (var i = 0; i < $('.search-content .layui-form-item').length; i++) {
                if ($('.search-content .layui-form-item').eq(i).find('select').length > 0) {
                    if ($('.search-content .layui-form-item').eq(i).find('select').val() != '') {
                            var name = $('.search-content .layui-form-item').eq(i).find('select').attr('name')
                            var value = $('.search-content .layui-form-item').eq(i).find('select').val()
                            if (value == 'customize') {
                                if ($('.customize').val != '') {
                                    var value1 = $('.search-content .layui-form-item').eq(i).find('select').next().next().val().split(' - ').join(',')
                                    suurl += '&TimeFrame=' + value1
                                }
                            }
                            else {
                                if (name != '' && name != 'undefined' && name != undefined) {
                                    suurl += '&' + name + '=' + value
                                }
                            }
                    }
                } else {
                    if ($('.search-content .layui-form-item').eq(i).find('input').val() != '') {
                        var name = $('.search-content .layui-form-item').eq(i).find('input').attr('name')
                        var value = $('.search-content .layui-form-item').eq(i).find('input').val()
                        if (name == 'TimeFrame') {
                            if (value!='') {
                                suurl += '&TimeFrame=' + value
                            }
                        }
                        else {
                            if (name != '' && name != 'undefined' && name != undefined) {
                                suurl += '&' + name + '=' + value
                            }
                        }
                        
                    } 
                    
                }
            }
            var filterquery = that.activetab.table.filterquerystring != 'undefined' && that.activetab.table.filterquerystring != undefined ? that.activetab.table.filterquerystring : '';
            ajaxMethodPostData(suurl, { objtypecode: this.activetab.table.objecttypecode, filterquery: filterquery },function (data) {
                if (data.data && data.data.listData && data.data.listData.Table) {
                    for (item in data.data.listData.Table[0]) {
                        $('.statistics-count[name="' + item + '"]').html(data.data.listData.Table[0][item])
                    }
                }
                if (data.data && data.data.Table) {
                    for (item in data.data.Table[0]) {
                        $('.statistics-count[name="' + item + '"]').html(data.data.Table[0][item])
                    }
                }
            })
        }
    }
    this.getgrid = function () {

        
        $(document).ready(function () {
            var table = that.activetab.table;
            var gridcontentheight = window.gridcontentheight - $('.search-content').height() - $('.statistics-content').height()-15
            if ($('.header-right').length > 0) {
                $('.statistics-content').hide();
                $('.bodyDiv.brdPalette.brandPrimaryBrd').css({ 'padding': '0px' });
                gridcontentheight = gridcontentheight + 40;
            }
            //console.log($('.search-content').height())
            $('.gridcontent').height(gridcontentheight)
            $('.gridcontent').html('<div id="datagrid"></div><div id="datagridExport"></div>')
            $('#datagrid').height(gridcontentheight)
            $('#datagridExport').height(0)
        
        

        if (table.columnsArray) {
            var columnsArray = table.columnsArray;
        } else {
            var columnsArray = table.GridColumns;
        }

        var self = this;
        var random = Math.ceil(Math.random() * 10000);
        var data = {
            gd: '',
            entityType: '',
            objecttypecode: table.objecttypecode
        }
        var url = layoutdata.requesturl + table.cmd
        var filterquery = '';
        if ($('#hightsearch-content .layui-form-item').length) {
            for (var i = 0; i < $('#hightsearch-content .layui-form-item').length; i++) {
                if ($('#hightsearch-content .layui-form-item').eq(i).find('select').length > 0) {
                    if ($('#hightsearch-content .layui-form-item').eq(i).find('select').val() != '') {
                        var name = $('#hightsearch-content .layui-form-item').eq(i).find('select').attr('name')
                        var value = $('#hightsearch-content .layui-form-item').eq(i).find('select').val()
                        if (value == '自定义') {
                            value = $('#hightsearch-content .layui-form-item').eq(i).find('select').next().next().val()
                        }
                        var value1 = value.split(' - ')[0]
                        var value2 = value.split(' - ')[1]

                        if (value2) {
                            filterquery += '\n' + name + '\tge\t' + value1
                            filterquery += '\n' + name + '\tle\t' + value2
                        }
                        else {
                            filterquery += '\n' + name + '\teq\t' + value
                        }

                    }
                } else {
                    if ($('#hightsearch-content .layui-form-item').eq(i).find('input').val() != '') {
                        var name = $('#hightsearch-content .layui-form-item').eq(i).find('input').attr('name')
                        var value = $('#hightsearch-content .layui-form-item').eq(i).find('input').val()
                        var num = $('#hightsearch-content .layui-form-item').eq(i).find('input').attr('num')
                        var value1 = value.split(' - ')[0]
                        var value2 = value.split(' - ')[1]
                        if (value2) {
                            filterquery += '\n' + name + '\tge\t' + value1
                            filterquery += '\n' + name + '\tle\t' + value2
                        }
                        else if (num == 'ge') {
                            filterquery += '\n' + name + '\tge\t' + value
                            filterquery += '\n' + name + '\tle\t' + $('#hightsearch-content .layui-form-item').eq(i).find('input').eq(1).val()
                        }
                        else {
                            filterquery += '\n' + name + '\tcontains\t' + value
                        }
                    }
                }
            }
        }
        

        var queryParams = {
            objecttypecode: table.objecttypecode
        }
        var beginTime=''
        var endTime=''
        var state = ''
        for (var i = 0; i < $('.search-content .layui-form-item').length; i++) {
            if ($('.search-content .layui-form-item').eq(i).find('select').length > 0) {
                if ($('.search-content .layui-form-item').eq(i).find('select').val() != '') {
                    var name = $('.search-content .layui-form-item').eq(i).find('select').attr('name')
                    var value = $('.search-content .layui-form-item').eq(i).find('select').val()
                    if (name == 'state') {
                        state = value
                        url = layoutdata.requesturl + table.cmd + '&state=' + value + '&beginTime=' + beginTime + '&endTime=' + endTime
                    }
                else{
                        if (value == 'customize') {
                        value = $('.search-content .layui-form-item').eq(i).find('select').next().next().val().split(' - ').join(',')
                        filterquery += '\n' + name + '\tbetween\t' + value
                    } else if ($('.search-content .layui-form-item').eq(i).find('select').attr('lay-filters') == 'timechook') {
                        filterquery += '\n' + name + '\t' + value
                    } else {
                        filterquery += '\n' + name + '\teq\t' + value
                    }
                    if (table.filterquery != true) {
                        queryParams[name] = value
                    }
                }
                    
                }
            } else {
                if ($('.search-content .layui-form-item').eq(i).find('input').val()&&$('.search-content .layui-form-item').eq(i).find('input').val() != '') {
                    var name = $('.search-content .layui-form-item').eq(i).find('input').attr('name')
                    var value = $('.search-content .layui-form-item').eq(i).find('input').val()
                    var num = $('.search-content .layui-form-item').eq(i).find('input').attr('num')
                    if (name == 'beginTime') {
                        beginTime = value
                        url = layoutdata.requesturl + table.cmd + '&state=' + state + '&beginTime=' + value + '&endTime=' + endTime
                    }
                    else if (name == 'endTime') {
                        endTime = value
                        url = layoutdata.requesturl + table.cmd + '&state=' + state + '&beginTime=' + beginTime + '&endTime=' + value
                    }
                    else if (num == 'ge') {
                        filterquery += '\n' + name + '\tge\t' + value
                        filterquery += '\n' + name + '\tle\t' + $('.search-content .layui-form-item').eq(i).find('input').eq(1).val()
                    }
                    else{
                        filterquery += '\n' + name + '\tcontains\t' + value
                        if (table.filterquery != true) {
                            queryParams[name] = value
                        }
                    }
                   
                }
            }
        }
        if (table.filterquery == true) {
            queryParams.filterquery = filterquery
        }
        if (table.filterquery&&table.filterquery != '') {
            for (var i = 0; i < table.filterquery.length; i++) {
                filterquery += table.filterquery[i]
            }
        }
        window.webContext.objectTypeCode = that.activetab.table.objecttypecode
        that.activetab.table.filterquerystring = filterquery
        url += '&objecttypecode=' + table.objecttypecode
        window.exporturl=url
        if (table.iscommon == true) {
            ajaxMethodGetAsyncData('entitygrid.config.get', {
                objecttypecode: table.objecttypecode
            },false, function (data) {
                columnsArray = []
                for (var i = 0; i < data.DataSet.Columns.length; i++) {
                    var res = data.DataSet.Columns[i]
                    columnsArray.push({
                        field: res.Name,
                        title: res.Title,
                        sortable: true,
                    })
                }
            })
        }
        if (table.expand == 1) {
            $('#datagrid').datagrid({
                columns: [columnsArray],
                fitCloumns: true,
                idField: "LIST_RECORD_ID",
                singleSelect: false,
                checkOnSelect: true,
                method: 'POST',
                pagination: table.pag == 1 ? false : true,
                rownumbers: true,
                iconCls: 'icon-edit',
                url: url,
                remoteSort: false,
                //url: '/apps/CommandProcessor.ashx?cmd=entity.grid.search',
                striped: false,
                loadFilter: function (data) {
                    var data0 = { rows: [], tatal: 0 }
                    if (data) {
                        if (data.rows) {
                            if (data.rows.Table) {
                                data0.rows = data.rows.Table;
                            }
                            else {
                                data0.rows = data.rows;
                            }
                        }
                        if (data.data && data.data.Table) {
                            data0.rows = data.data.Table;
                        }
                        if (data.listData) {
                            data0.rows = data.listData;
                        }
                    }
                    data0.total = Number(data.total) ? Number(data.total) : data0.rows.length;
                    window.exportpagesize = Number(data.total) ? Number(data.total) : data0.rows.length;
                    return data0
                },
                pageSize: 15,
                pageList: [10, 15, 20, 25, 30, 50, 100, 200, 500, 1000],
                queryParams: {
                    filterquery: filterquery
                },
                view: detailview,
                detailFormatter: function (index, row) {
                    return '<div style="padding:5px"><table id="tbDataAuthorityItem-' + index + '"></table></div>';
                },

                onExpandRow: function (index, row) {
                    $('#tbDataAuthorityItem-' + index).datagrid({
                        data: row.Contracts,
                        fitColumns: true,
                        singleSelect: true,
                        rownumbers: true,
                        loadMsg: '',
                        height: 'auto',
                        columns: [[
                            {
                                field: 'Title',
                                title: '合同名称',
                                sortable: true,
                            }, {
                                field: 'ContractNumber',
                                title: '合同编号',
                                sortable: true,
                            }, {
                                field: 'TotalPrice',
                                title: '合同金额',
                                sortable: true,
                            }, {
                                field: 'PaidAmount',
                                title: '已付金额',
                                sortable: true,
                            }
                        ]],
                        onResize: function () {
                            $('#datagrid').datagrid('fixDetailRowHeight', index);
                        },
                        onLoadSuccess: function () {
                            setTimeout(function () {
                                $('#datagrid').datagrid('fixDetailRowHeight', index);
                            }, 0);
                        }
                    });
                    $('#datagrid').datagrid('fixDetailRowHeight', index);
                },
                onDblClickRow: function onDblClickRow(index, row) {
                },
                onLoadSuccess: function () {
                    that.layoutelement.render()
                    $('.layui-progress-bar').each(function () {
                        $(this).css('width', $(this).attr('lay-percent'))
                    })
                    layui.use(['dropdown'], function () {
                        //  console.log(123)
                        var dropdown = layui.dropdown
                        dropdown.render({
                            elem: '.editoption',
                            data: table.editoption,
                            click: function (obj) {
                                var elem = $(this.elem)
                                var Amount = elem.data('amount');
                                var Name = elem.data('name');
                                var AccountId = elem.data('accountid')
                                var Id = elem.data('id');
                                obj.f(Id, AccountId, Name, Amount)
                            }
                        });
                    });
                },
            });
        }
        else if (table.expand == 2) {
            $('#datagrid').datagrid({
                columns: [columnsArray],
                fitCloumns: true,
                idField: "LIST_RECORD_ID",
                singleSelect: false,
                checkOnSelect: true,
                method: 'POST',
                pagination: table.pag == 1 ? false : true,
                rownumbers: true,
                url: url,
                remoteSort:false,
                //url: '/apps/CommandProcessor.ashx?cmd=entity.grid.search',
                striped: false,
                loadFilter: function (data) {
                    var o1 = data.rows
                    var o2 = []
                    if (o1) {
                        for (i = 0; i < o1.length; i++) {
                            if (o1[i].Title) {
                                return data
                            } else {
                                if (o1[i].Contracts) {
                                    var res = o1[i].Contracts
                                    if (res.length > 0) {
                                        for (j = 0; j < res.length; j++) {
                                            o2.push($.extend({}, o1[i], res[j]))
                                        }
                                    }
                                    else {
                                        o2.push($.extend({}, o1[i], { Title: '', ContractNumber: '', TotalPrice: '', PaidAmount: '' }))
                                    }
                                }
                                else {
                                    o2.push($.extend({}, o1[i], { Title: '', ContractNumber: '', TotalPrice: '', PaidAmount: '' }))
                                }
                            }
                        }
                    }
                    data = o2
                    window.exportpagesize = data.length;
                    return data
                },
                pageSize: 15,
                pageList: [10, 15, 20, 25, 30, 50, 100, 200, 500, 1000],
                queryParams: {
                    filterquery: filterquery
                },
                onDblClickRow: function onDblClickRow(index, row) {
                },
                onLoadSuccess: function (data) {
                    mergeCellsByField('datagrid', 'BusinessUnitName');
                    that.layoutelement.render()
                    $('.layui-progress-bar').each(function () {
                        $(this).css('width', $(this).attr('lay-percent'))
                    })

                    layui.use(['dropdown'], function () {
                        //  console.log(123)
                        var dropdown = layui.dropdown
                        dropdown.render({
                            elem: '.editoption',
                            data: table.editoption,
                            click: function (obj) {
                                var elem = $(this.elem)
                                var Amount = elem.data('amount');
                                var Name = elem.data('name');
                                var AccountId = elem.data('accountid')
                                var Id = elem.data('id');
                                obj.f(Id, AccountId, Name, Amount)
                            }
                        });
                    });
                },
            });
        }
else{
            $('#datagrid').datagrid({
                columns: [columnsArray],
                fitCloumns: true,
                idField: "LIST_RECORD_ID",
                singleSelect: false,
                checkOnSelect: true,
                method: 'POST',
                pagination: table.pag == 1 ? false : true,
                rownumbers: true,
                url: url,
                //url: '/apps/CommandProcessor.ashx?cmd=entity.grid.search',
                remoteSort: false,
                striped: false,
                loadFilter: function (data) {
                    var data0 = { rows: [], tatal: 0 }
                    if (data) {
                        if (data.rows) {
                            if (data.rows.Table) {
                                data0.rows = data.rows.Table;
                            }
                            else {
                                data0.rows = data.rows;
                            }
                        }
                        if (data.data && data.data.Table) {
                            data0.rows = data.data.Table;
                        }
                        if (data.listData) {
                            data0.rows = data.listData;
                        }
                    }
                    data0.total = Number(data.total) ? Number(data.total) : data0.rows.length;
                    window.exportpagesize = Number(data.total) ? Number(data.total) : data0.rows.length;
                    return data0
                },
                pageSize: 15,
                pageList: [10, 15, 20, 25, 30, 50, 100, 200, 500, 1000],
                queryParams: {
                    filterquery: filterquery
                },
                onDblClickRow: function onDblClickRow(index, row) {
                },
                onLoadSuccess: function () {
                    that.layoutelement.render()
                    $('.layui-progress-bar').each(function () {
                        $(this).css('width', $(this).attr('lay-percent'))
                    })

                    layui.use(['dropdown'], function () {
                        //  console.log(123)
                        var dropdown = layui.dropdown
                        dropdown.render({
                            elem: '.editoption',
                            data: table.editoption,
                            click: function (obj) {
                                var elem = $(this.elem)
                                var Amount = elem.data('amount');
                                var Name = elem.data('name');
                                var AccountId = elem.data('accountid')
                                var Id = elem.data('id');
                                obj.f(Id, AccountId, Name, Amount)
                            }
                        });
                    });
                },
            });
    }
        })
    }
}
for (var i = 0; i < Object.keys(formcomponents).length; i++) {
    createdlayout.prototype[Object.keys(formcomponents)[i]] = formcomponents[Object.keys(formcomponents)[i]]
}
function reloadgrid() {
    mylayout.getgrid()
    mylayout.getsummary()
}
function reloadgrided() {
    mylayout.getgrid()
    mylayout.getsummary()
}
function reset() {
    $('.search-content .layui-form-item').find('select').val('');
    $('.search-content .layui-form-item').find('input').val('');
    mylayout.getgrid()
}
function zhzs(value) {

    value = value.replace(/[^\d]/g, '');
    if ('' != value) {
        value = parseInt(value);
    }
    return value;
}

$(document).click(function (e) {

    if ($(e.target).parents('#hightsearch-content').length == 0) {
        if (!$(e.target).hasClass('layui-input')) {

            $('#hightsearch-content').hide()
        }
    }
})
$(document).ready(function () {
    $('body').on('keyup', '.layui-input-block input', function (event) {
        if (event.keyCode == '13') {
            reloadgrid()
        }
    });
});
function exported() {
    mylayout.getexport()
}
function edited(entityname, id) {
    $('.popup-mask').show()
    var url = '/layouteditor/add_layout_ie8.html?entityname=' + entityname + '&id=' + id;
    $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
}
function deleted(objtypecode, id) {
    $('.popup-mask').show()
    var url = '/alert/delete_ie8.html?objtypecode=' + objtypecode + '&id=' + id;
    $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
}
function mergeCellsByField(tableID, colList) {
    var ColArray = colList.split(",");
    var tTable = $("#" + tableID);
    var TableRowCnts = tTable.datagrid("getRows").length;
    var tmpA;
    var tmpB;
    var PerTxt = "";
    var CurTxt = "";
    var alertStr = "";
    for (j = ColArray.length - 1; j >= 0; j--) {
        PerTxt = "";
        tmpA = 1;
        tmpB = 0;

        for (i = 0; i <= TableRowCnts; i++) {
            if (i == TableRowCnts) {
                CurTxt = "";
            } else {
                CurTxt = tTable.datagrid("getRows")[i][ColArray[j]];
            }
            if (PerTxt == CurTxt) {
                tmpA += 1;
            } else {
                tmpB += tmpA;

                tTable.datagrid("mergeCells", {
                    index: i - tmpA,
                    field: ColArray[j],　　//合并字段
                    rowspan: tmpA,
                    colspan: null
                });

                tTable.datagrid("mergeCells", { //根据ColArray[j]进行合并
                    index: i - tmpA,
                    field: "fiveMinutesAvg",
                    rowspan: tmpA,
                    colspan: null
                });

                tmpA = 1;
            }
            PerTxt = CurTxt;
        }
    }
}
function tabchange(item, that) {
    that.activetab = item;
    //debugger;
    if (item.issearchform) {
    } else {
        item.searchform = that.getlookupfilter('searchform')
    }
    item.table.GridColumns = that.getlookupfilter('GridColumns')
    that.getselect()
    that.getsummary()
    
    $('.search-content .layui-form').html('')
    for (var i = 0; i < item.searchform.length; i++) {
        var res = item.searchform[i]
        var html = '<div class="layui-form-item">'
                    + '<label class="layui-form-label">' + res.label + '：</label>'
                    + '<div class="layui-input-block">'
        if (res.type == 'S') {
            html += '<input type="text" name="'+res.name+'" placeholder="' + res.placeholder + '" autocomplete="off" class="layui-input">'
        } else if (res.type == 'L' || res.type == 'LT' || res.type == 'DT') {
            html += '<select  name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            if (that.select[res.name]) {
                for (var j = 0; j < that.select[res.name].length; j++) {
                    var option = that.select[res.name][j]
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                }
            }
            html += '</select>'
        } else if (res.type == 'D' || res.type == 'F') {
            html += '<select lay-filters="timechook" name="' + res.name + '" lay-verify="" >'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < timeoperator.length; j++) {
                var option = timeoperator[j]
                if (option) {
                   // if (option.value == 'this-year' && window.entityname != 'common') {
                   //     html += '<option selected value="' + option.value + '">' + option.label + '</option>'
                   // } else {
                        html += '<option value="' + option.value + '">' + option.label + '</option>'
                   //  }
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '<option value="customize">自定义</option>'
            html += '</select>'
            html += '<input style="display:none;width:300px" placeholder="请选择时间" datatype="' + res.type + '" id="laydate' + item.name + i + '" class="laydate layui-input customize"  name="TimeFrame" />'
        }
        else if (res.type == 'K') {
            html += '<input style="width:240px;margin-left:0;" autocomplete="off" placeholder="' + res.placeholder + '" datatype="K" id="laydate' + item.name + i + '" class="laydate layui-input"  name="' + res.name + '" />'
        }
        else if (res.type == 'M') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < stateoperator.length; j++) {
                var option = stateoperator[j]
                if (option) {
                  //  if (option.value == 'this-year' && window.entityname != 'common') {
                        html += '<option selected value="' + option.value + '">' + option.label + '</option>'
                  //  } else {
                        html += '<option value="' + option.value + '">' + option.label + '</option>'
                  //  }
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'I') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < instanceoperator.length; j++) {
                var option = instanceoperator[j]
                if (option) {
                    html += '<option value="' + option.label + '">' + option.label + '</option>'
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'cntrplan') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < planoperator.length; j++) {
                var option = planoperator[j]
                if (option) {
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'StateCode') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < StateCodeOption.length; j++) {
                var option = StateCodeOption[j]
                if (option) {
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'cntrtype') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < contractType.length; j++) {
                var option = contractType[j]
                if (option) {
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'CategoryCodeName') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < CategoryCodeName.length; j++) {
                var option = CategoryCodeName[j]
                if (option) {
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'expiretype') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < expiretype.length; j++) {
                var option = expiretype[j]
                if (option) {
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'centralizedDept') {
            html += '<select lay-filter="state" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
            for (var j = 0; j < centralizedDept.length; j++) {
                var option = centralizedDept[j]
                if (option) {
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                } else {
                    html += '<option value=""></option>'
                }
            }
            html += '</select>'
        }
        else if (res.type == 'O' || res.type == 'Y' || res.type == 'U' || res.type == 'Y_MD') {
            html += '<div Lktp="' + res.objtypecode + '" class="layui-input-block searchselect">'
                + '<select id="select' + item.name+res.name + '" lay-search lay-verify="" name="' + res.name + '"><option value="">请选择</option></select>'
            html += ' <img title="'+res.label+'" class="searchimg" src="/img/images/02.1-1.Search_.png" />'
        } else if (res.type == 'N') {
            html += '<input style="width:90px;display:inline-block;" type="text" name="' + res.name + '" placeholder="请输入"  onkeyup="value=zhzs(this.value)" lay-verify="required|number"  class="layui-input" autocomplete="off" pattern="\d" maxlength="9" num="ge" />'
            html += '&nbsp;&nbsp;至&nbsp;&nbsp;<input style="width:90px;display:inline-block;" type="text" name="' + res.name + '" placeholder="请输入"  onkeyup="value=zhzs(this.value)" lay-verify="required|number"  class="layui-input" autocomplete="off" pattern="\d" maxlength="9" num="le" />'
        } else {
            html += '<input type="text" name="' + res.name + '" placeholder="' + res.placeholder + '" autocomplete="off" class="layui-input">'
        }
        html += '</div>'
                + '</div>'

        $('.search-content .layui-form').append(html)
        
    }
    if ($('.layui-form-item').length > 0 && !$('.header-right').length && !$('.hightsearch-shur').length) {
        $('.search-content .layui-form').append('<div class="layui-form-item"><div style="margin-top:20px;margin-left:0;" onclick="reloadgrid()" class="layui-btn layui-btn-sm layui-btn-normal formitem-searchbtn">搜索</div></div>')
        $('.search-content .layui-form').append('<div class="layui-form-item"><div style="margin-top:20px;margin-left:0;" onclick="reset()" class="layui-btn layui-btn-sm layui-btn-normal formitem-searchbtn">重置</div></div>')

    }
    $('.searchimg').click(function () {
        that.formcomponents.chooselookup($(this).parents('.searchselect').attr('Lktp'), $(this).parents('.searchselect').find('select').attr('id'), $(this).attr('title'))
    })
    


    that.layoutform.render()
    that.layoutform.on('select', function (data) {
        if (typeof reloadgrid != 'undefined') {
            reloadgrid()
        }
    });
    that.layoutform.on('input', function (data) {
        if (typeof reloadgrid != 'undefined') {
            reloadgrid()
        }
    });
    that.layoutform.on('select', function (data) {
        if (data.value == 'customize') {
            $(data.othis).next().show()
        } else {
            $(data.othis).next().hide()
        }
    });
    that.formcomponents.getlookup(that)
    $('.laydate').each(function () {
        var id = $(this).attr('id')
        var datatype = $(this).attr('datatype')
        if (datatype == 'D') {
            laydate.render({
                elem: '#' + id,
                format: 'yyyy-MM-dd',
                trigger: 'click',
                range: true,
                done: function (value) {
                    if (typeof reloadgrid != 'undefined') {
                        setTimeout(function () {
                            //console.log(value)
                            $('.customize').val=value
                            reloadgrid()
                        }, 0)
                    }
                }
            });
        } else if (datatype == 'K') {
            laydate.render({
                elem: '#' + id,
                format: 'yyyy-MM-dd',
                trigger: 'click',
                range: false,
                done: function (value) {
                    if (typeof reloadgrid != 'undefined') {
                        setTimeout(function () {
                            reloadgrid()
                        }, 0)
                    }
                }
            });
        } else if (datatype == 'F') {
            laydate.render({
                elem: '#' + id,
                type: 'datetime',
                format: 'yyyy-MM-dd HH:mm:ss',
                trigger: 'click',
                range: true,
                done: function (value) {
                    if (typeof reloadgrid != 'undefined') {
                        setTimeout(function () {
                            reloadgrid()
                        }, 0)
                    }
                }
            });
        } else if (datatype == 'Year') {
            laydate.render({
                elem: '#' + id,
                type: 'year',
                format: 'yyyy',
                trigger: 'click',

                done: function (value) {
                    if (typeof reloadgrid != 'undefined') {
                        setTimeout(function () {
                            reloadgrid()
                        }, 0)
                    }
                }
            });
        } else if (datatype == 'Month') {
            laydate.render({
                elem: '#' + id,
                type: 'month',
                format: 'yyyy-MM',
                trigger: 'click',

                done: function (value) {
                    if (typeof reloadgrid != 'undefined') {
                        setTimeout(function () {
                            reloadgrid()
                        }, 0)
                    }
                }
            });
        }
    })
    that.getgrid()
    that.getsummary()
}
