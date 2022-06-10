var layoutdata = {
    requesturl: '/apps/CommandProcessor.ashx?cmd=',
    common:{
        template: {
            head: {
                title: '查询',
                logo: '/template/hearder/logo.png',
                btns: []
            },
            tabs: [{
                common:true,
                label: '所有',
                name: 'caigouContract',
                searchform: [],
                summary: [],
                table: {
                    GridColumns: [],
                    cmd: 'entity.lookup.search&lookupName='+getQueryString('lookupName'),
                    objecttypecode: getQueryString('objtypecode'),
                    filterquery: function () {
                        var t = getQueryString('filterquery');
                        if (t != undefined)
                            return t.split('//').join('\t');
                    },
                    formatOper: function (value, row, index) {
                        return formatOper(value, row, index)
                    }
                }
            }],
        },
    },
    advSearchlst: {
        template: {
            head: {
                title: '查询',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },{
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=filter.exportfile'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exportcontract'
                }
            }]
            },
            tabs: [{
                common: false,
                label: '所有',
                name: 'caigouContract',
                searchform: [],
                summary: [],
                table: {
                    iscommon: true,
                    GridColumns: [],
                    cmd: 'entitygrid.list',
                    objecttypecode: getQueryString('objtypecode'),
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return formatOper(value, row, index)
                    }
                }
            }],
        },
    },
    // 发票
    mineInvoice: {
        template: {
            head: {
                title: '我的发票',
                logo: '/template/hearder/logo.png',
                btns: [
                    {
                        label: '手动添加',
                        type: 'layui-btn-normal',
                        click: {
                            //f: function () {
                            //    $('.popup-mask').show()
                            //    var url = '/layouteditor/add_invoice.html?entityName=Invoice'
                            //    $('#iframe').show().attr('src', url).height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "660px" })
                            //},
                            //n: 'addInvoice'
                            f: function () {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layoutandupload.html?entityName=Invoice&dataname=InvoiceDirection&datavalue=1'
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "620px" })
                            },
                            n: 'addInvoice'
                        }
                    },
                    {
                        label: '发票识别',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {
                                
                                
                            },
                            n: 'distinguishInvoice'
                        }
                    },
                    {
                        label: '电票打印',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {
                                var ids = [];
                                var rows = $('#datagrid').datagrid('getChecked');
                                for (var i = 0; i < rows.length; i++) {
                                    ids.push(rows[i].InvoiceId);
                                }
                                if (ids.length > 0) {
                                    window.open('/js/pdfjs/web/viewer.html?file=20210820-6576E84A65b949AdB6b40d69d0489314.pdf', 'PDF', '');
                                    //var newWin = window.open('/layouteditor/add_invoice.html?entityName=Invoice&id=' + ids[0]);
                                    //newWin.focus();//在IE浏览器中使用必须添加这一句
                                    //newWin.print();
                                }
                                else {
                                    layer.msg('请选择发票')
                                }
                            },
                            n: 'Invoiceprinting'
                        }
                    },
                    {
                        label: '搜索',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {

                            },
                            n: 'reloadgrided'
                        }
                    }, {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var url = '/apps/CommandProcessor.ashx?cmd=filter.exportfile'
                            var data = {}
                            var filterQuery = mylayout.activetab.table.filterquerystring
                            if (filterQuery) {
                                data.filterQuery = filterQuery
                            }
                            openWindowWithPost(url, data)
                        },
                        n: 'exported'
                    }
                }]
            },
            tabs: [{
                common: false,
                label: '所有',
                name: 'caigouContract',
                searchform: [{
                    label: '发票类型',
                    name: 'InvoiceType',
                    placeholder: "请选择类型",
                    type: 'L',
                    objtypecode: 1010
                }, {
                    label: '开票日期',
                    name: 'IssueDate',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '销售方名称',
                    name: 'AccountIdName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发票号码',
                    name: 'InvoiceNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }],
                issearchform: true,
                summary: [],
                table: {
                    GridColumns: [],
                    cmd: 'invoice.owner.getlist',
                    objecttypecode: getQueryString('objtypecode'),
                    filterquery:'',
                    formatOper: function (value, row, index) {
                        return formatOper(value, row, index)
                    }, columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.InvoiceId + '" data-id="' + row.InvoiceId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'InvoiceType',
                        title: '发票类型',
                        sortable: true
                    }, {
                        field: 'IssueDate',
                        title: '开票日期',
                        sortable: true
                    }, {
                        field: 'InvoiceNumber',
                        title: '发票号码',
                        sortable: true
                    }, {
                        field: 'AccountIdName',
                        title: '销售方',
                        sortable: true
                    }, {
                        field: 'TotalAmount',
                        title: '价税合计',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'invoiceSource',
                        title: '发票来源',
                        sortable: true
                    }, {
                        field: 'authenticityspan',
                        title: '发票真伪',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '添加日期',
                        sortable: true
                    }, {
                        field: 'ReimburseStatusName',
                        title: '发票状态',
                        sortable: true
                    },
                    {
                        field: 'ProcessInstanceNumber',
                        title: '报销流程编号',
                        sortable: true
                    }
                    ],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1090)
                                $('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
},
                        {
                            title: '查看原始图片',
                            f: function (id) {
                                window.open('/js/pdfjs/web/viewer.html?file=20210820-6576E84A65b949AdB6b40d69d0489314.pdf', 'PDF', 'width:50%,height:50%');
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_invoice.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "660px" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=1090&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                            },
                        },
                    ]
                }
            },
            {
                common: false,
                label: '未报销',
                name: 'caigouContract',
                searchform: [{
                    label: '发票类型',
                    name: 'InvoiceType',
                    placeholder: "请选择类型",
                    type: 'L',
                    objtypecode: 1010
                }, {
                    label: '开票日期',
                    name: 'IssueDate',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '销售方名称',
                    name: 'AccountIdName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发票号码',
                    name: 'InvoiceNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }],
                issearchform: true,
                summary: [],
                table: {
                    GridColumns: [],
                    cmd: 'invoice.owner.getlist&ReimburseStatus=0',
                    objecttypecode: getQueryString('objtypecode'),
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return formatOper(value, row, index)
                    }, columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.InvoiceId + '" data-id="' + row.InvoiceId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'InvoiceType',
                        title: '发票类型',
                        sortable: true
                    }, {
                        field: 'IssueDate',
                        title: '开票日期',
                        sortable: true
                    }, {
                        field: 'InvoiceNumber',
                        title: '发票号码',
                        sortable: true
                    }, {
                        field: 'AccountIdName',
                        title: '销售方',
                        sortable: true
                    }, {
                        field: 'TotalAmount',
                        title: '价税合计',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'invoiceSource',
                        title: '发票来源',
                        sortable: true
                    }, {
                        field: 'authenticityspan',
                        title: '发票真伪',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '添加日期',
                        sortable: true
                    }, {
                        field: 'ReimburseStatusName',
                        title: '发票状态',
                        sortable: true
                    },
                    {
                        field: 'ProcessInstanceNumber',
                        title: '报销流程编号',
                        sortable: true
                    }
                    ],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1090)
                                $('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_invoice.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "660px" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=1090&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                            },
                        },
                    ]
                }
            },
            {
                common: false,
                label: '报销中',
                name: 'caigouContract',
                searchform: [{
                    label: '发票类型',
                    name: 'InvoiceType',
                    placeholder: "请选择类型",
                    type: 'L',
                    objtypecode: 1010
                }, {
                    label: '开票日期',
                    name: 'IssueDate',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '销售方名称',
                    name: 'AccountIdName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发票号码',
                    name: 'InvoiceNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }],
                issearchform: true,
                summary: [],
                table: {
                    GridColumns: [],
                    cmd: 'invoice.owner.getlist&ReimburseStatus=1',
                    objecttypecode: getQueryString('objtypecode'),
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return formatOper(value, row, index)
                    }, columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.InvoiceId + '" data-id="' + row.InvoiceId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'InvoiceType',
                        title: '发票类型',
                        sortable: true
                    }, {
                        field: 'IssueDate',
                        title: '开票日期',
                        sortable: true
                    }, {
                        field: 'InvoiceNumber',
                        title: '发票号码',
                        sortable: true
                    }, {
                        field: 'AccountIdName',
                        title: '销售方',
                        sortable: true
                    }, {
                        field: 'TotalAmount',
                        title: '价税合计',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'invoiceSource',
                        title: '发票来源',
                        sortable: true
                    }, {
                        field: 'authenticityspan',
                        title: '发票真伪',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '添加日期',
                        sortable: true
                    }, {
                        field: 'ReimburseStatusName',
                        title: '发票状态',
                        sortable: true
                    },
                    {
                        field: 'ProcessInstanceNumber',
                        title: '报销流程编号',
                        sortable: true
                    }
                    ],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1090)
                                $('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_invoice.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "660px" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=1090&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                            },
                        },
                    ]
                }
            }, {
                common: false,
                label: '已报销',
                name: 'caigouContract',
                searchform: [{
                    label: '发票类型',
                    name: 'InvoiceType',
                    placeholder: "请选择类型",
                    type: 'L',
                    objtypecode: 1010
                }, {
                    label: '开票日期',
                    name: 'IssueDate',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '销售方名称',
                    name: 'AccountIdName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发票号码',
                    name: 'InvoiceNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }],
                issearchform: true,
                summary: [],
                table: {
                    GridColumns: [],
                    cmd: 'invoice.owner.getlist&ReimburseStatus=3',
                    objecttypecode: getQueryString('objtypecode'),
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return formatOper(value, row, index)
                    }, columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.InvoiceId + '" data-id="' + row.InvoiceId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'InvoiceType',
                        title: '发票类型',
                        sortable: true
                    }, {
                        field: 'IssueDate',
                        title: '开票日期',
                        sortable: true
                    }, {
                        field: 'InvoiceNumber',
                        title: '发票号码',
                        sortable: true
                    }, {
                        field: 'AccountIdName',
                        title: '销售方',
                        sortable: true
                    }, {
                        field: 'TotalAmount',
                        title: '价税合计',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'invoiceSource',
                        title: '发票来源',
                        sortable: true
                    }, {
                        field: 'authenticityspan',
                        title: '发票真伪',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '添加日期',
                        sortable: true
                    }, {
                        field: 'ReimburseStatusName',
                        title: '发票状态',
                        sortable: true
                    },
                    {
                        field: 'ProcessInstanceNumber',
                        title: '报销流程编号',
                        sortable: true
                    }
                    ],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1090)
                                $('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_invoice.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "660px" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=1090&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                            },
                        },
                    ]
                }
            }],
        }
    },
    currency: {
        template: {
            head: {
                title: '公用页面',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {  },
                        n: 'searchcontract'
                    }
                }]
            },
            tabs: [{
                label: '公用表格',
                name: 'caigouContract',
                searchform: [],
                summary: [],
                table: {
                    GridColumns: [],
                    cmd: 'entity.lookup.search',
                    objecttypecode: getQueryString('objtypecode'),
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return formatOper(value, row, index)
                    }
                }
            }],
        },
    },
    paymentOwner: {
        template: {
            head: {
                title: '付款管理',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                },]
            },
            tabs: [{
                label: '付款记录',
                name: 'fukuanjilu',
                searchform: [],
                summaryurl: 'contract.summary.statistics.get&Type=1',
                summary: [{
                    label: '应付款金额',
                    name: 'TotalAmount',
                    type: 'account'
                }, {
                    label: '实际付款金额',
                    name: 'PaidAmount',
                    type: 'account'
                }],
                table: {
                    iscommon:false,
                    objecttypecode: 10182,
                    cmd: 'entitygrid.list',
                    filterquery: '\nContractType\teq\t2',
                    formatOper: function (value, row, index) {
                        return '<ul class="layui-nav" lay-filter="">'
                                + '  <li class="layui-nav-item">'
                                + '    <a href="javascript:;">更多操作</a>'
                                + '    <dl class="layui-nav-child">'
                                + '      <dd><a href="">操作1</a></dd>'
                                + '      <dd><a href="">操作2</a></dd>'
                                + '      <dd><a href="">操作3</a></dd>'
                                + '    </dl>'
                                + '  </li>'
                                + '</ul>'
                    },
                    columnsArray: [{
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'Name',
                        title: '付款单名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;') {
                                return '<a style="color:blue;" href="' + $(value).attr('href') + '" target="_blank">' + $(value).html() + '</a>'
                            }
                            return ''
                        },
                        sortable: true
                    }, {
                        field: 'BillNo',
                        title: '付款单号',
                        sortable: true
                    }, {
                        field: 'ContractId',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;') {
                                return '<a style="color:blue;" href="' + $(value).attr('href') + '&objectTypeCode=1010" target="_blank">' + $(value).html() + '</a>'
                            }
                            return ''
                        },
                        sortable: true
                    },
                    {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true
                    },
                    {
                        field: 'Amount',
                        title: '付款金额',
                        sortable: true
                    },
                    {
                        field: 'DeptId',
                        title: '申请部门',
                        sortable: true
                    },
                    {
                        field: 'ApplyDate',
                        title: '申请日期',
                        sortable: true
                    },
                    {
                        field: 'OwningUser',
                        title: '申请人',
                        sortable: true
                    }, {
                        field: 'StatusCode',
                        title: '审批状态',
                        sortable: true
                    }, {
                        field: 'PaymentCategory',
                        title: '款项类别',
                        sortable: true
                    }, {
                        field: 'PaymentMethod',
                        title: '付款方式',
                        sortable: true
                    }, {
                        field: 'ContractPlanId',
                        title: '付款计划',
                        sortable: true
                    }, {
                        field: 'InvoiceId',
                        title: '相关发票',
                        sortable: true
                    }, {
                        field: 'AccountName',
                        title: '收款单位全称',
                        sortable: true
                    }, {
                        field: 'PayedOn',
                        title: '付款日期',
                        sortable: true
                    }, {
                        field: 'AccountId',
                        title: '付款单位',
                        sortable: true
                    }, {
                        field: 'BankName',
                        title: '收款单位开户行',
                        sortable: true
                    },
                    {
                        field: 'BankNumber',
                        title: '收款单位银行账号',
                        sortable: true
                    }],
                    editoption: [
                        /*{
                            title: '查看合同',
                            f: function (id, AccountId) {
                                window.open('/800/detail?objectTypeCode=1010&id=' + id)
                            },
                        },*/
                        {
                            title: '查看审批单',
                            f: function (id) {
                                window.open('/a0M/e?source=i&id=' + id)
                            }
                        }
                    ]
                }
            }, {
                label: '收票未付款',
                name: 'shoupiaoweifukuan',
                searchform: [],
                summaryurl: 'contract.summary.statistics.get&Type=2',
                summary: [{
                    label: '收票总额',
                    name: 'TotalAmount',
                    type: 'TotalAmount'
                }, {
                    label: '收票未付款总额',
                    name: 'UnPaidAmount',
                    type: 'account'
                }],
                table: {
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.InvoiceId + '" data-id="' + row.LIST_RECORD_ID + '">付款<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'InvoiceNumber',
                        title: '发票票号',
                        sortable: true
                    }, {
                        field: 'AccountIdName',
                        title: '开票单位',
                        sortable: true
                    }, {
                        field: 'TotalAmount',
                        title: '发票金额',
                        sortable: true
                    }, {
                        field: 'ContractTitle',
                        title: '相关合同',
                        sortable: true
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true
                    }, {
                        field: 'ContractTotalAmount',
                        title: '合同总金额',
                        sortable: true
                    }, {
                        field: 'IssueDate',
                        title: '开票时间',
                        sortable: true
                    },
                    {
                        field: 'CreatedOn',
                        title: '收票时间',
                        sortable: true
                    },
                    {
                        field: 'ProcessInstanceName',
                        title: '付款流程',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceName',
                        title: '相关流程',
                        sortable: true,
                    }],
                    cmd: 'contract.invoice.notpay.getlist',
                    objecttypecode: 1090,
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<a style="color:#015ba7;font-size:13px;" onclick="showEditDialog()">付款</a>'
                    },
                }
            }, {
                label: '应付计划表',
                name: 'yingfujihuabiao',
                summaryurl: 'contract.summary.statistics.get&Type=3',
                searchform: [],
                summary: [{
                    label: '已付款总金额',
                    name: 'TotalAmount',
                    type: 'account'
                }, {
                    label: '申请付款总金额',
                    name: 'PaymentAmount',
                    type: 'account'
                }, {
                    label: '本月收票总额',
                    name: 'MonthAmount',
                    type: 'account'
                },  {
                    label: '本月付款总额',
                    name: 'MonthPaymentAmount',
                    type: 'account'
                }],
                table: {
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'Name',
                        title: '阶段名称',
                        sortable: false
                    }, {
                        field: 'ContractNumber',
                        title: '合同号',
                        sortable: true
                    }, {
                        field: 'ContractIdTitle',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;') {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sortable: true
                    }, {
                        field: 'Rate',
                        title: '比例',
                        sortable: false
                    } , {
                        field: 'Amount',
                        title: '应付金额',
                        sortable: true
                    }, {
                        field: 'PlanPayOn',
                        title: '计划付款时间',
                        sortable: true
                    },{
                        field: 'StatusCodeName',
                        title: '付款状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'OwningUserName',
                        title: '执行人',
                        sortable: true
                    }, {
                        field: 'AccountIdName',
                        title: '供应商名称',
                        sortable: true
                    }],
                    cmd: 'contract.plan.getlist',
                    objecttypecode: 1012,
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return ''
                    },
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1012)
                                $('#iframe').height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            }
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            }
                        },
                        {
                            title: '付款申请',
                            f: function (id) {
                                alert("待升级");
                            }
                        }
                  ]
                }
            },{
            label: '合同付款',
            name: 'yingfujihuabiao',
            searchform: [],
            summary: [],
            table: {
                columnsArray: [{
                    field: 'ids',
                    checkbox: true
                }, {
                    field: "Action",
                    title: "操作",
                    formatter: function formatter(value, row, index) {
                        return '<div class="editoption"  data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    }
                }, {
                    field: 'ContractNumber',
                    title: '合同号',
                    sortable: true,
                }, {
                    field: 'Title',
                    title: '合同名称',
                    sortable: true,
                    //formatter: function formatter(value, row, index) {
                    //    return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'1010\')">' + value + '</a>'
                    //}
                    formatter: function formatter(value, row, index) {
                        //return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'1010\')">' + value + '</a>'
                        return '<a style="color:blue; cursor:pointer;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                    }
                }, {
                    field: 'AccountIdName',
                    title: '供应商名称',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        var filterquery = 'Account//eq//' + row.AccountId
                        return '<a style="color:blue; cursor:pointer;" onclick=\'formcomponents.chooselookup("10182","","","","' + filterquery + '","readonly")\'>' + row.AccountIdName + '</a>'
                    }
                }, {
                    field: 'contractTotalAmount',
                    title: '合同金额',
                    sortable: true,
                }, {
                    field: 'invoiceAmount',
                    title: '已开票金额',
                    sortable: true,
                }, {
                    field: 'PaidAmount',
                    title: '已付金额',
                    sortable: true,
                }, {
                    field: 'UnpaidAmount',
                    title: '未付金额',
                    sortable: true,
                },{
                    field: 'paymentProgress',
                    title: '付款进度',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        return formatOperprogeress(value, row, index);
                    }
                }, {
                    field: 'Invoices',
                    title: '相关发票',
                    formatter: function formatter(value, row, index) {
                        var filterquery = 'ContractId//eq//' + row.ContractId
                        return '<a style="color:blue;cursor:pointer;" onclick=\'formcomponents.chooselookup("1090","","","","' + filterquery + '","readonly")\'>相关发票</a>'
                    }
                }, {
                    field: 'Payments',
                    title: '付款记录',
                    formatter: function formatter(value, row, index) {
                        var filterquery = 'ContractId//eq//' + row.ContractId
                        return '<a style="color:blue;cursor:pointer;" onclick=\'formcomponents.chooselookup("10182","","","","' + filterquery + '","readonly")\'>付款记录</a>'
                    }
                }],
                cmd: 'contract.payment.getlist',
                objecttypecode: 1010,
                filterquery: '',
                formatOper: function (value, row, index) {
                    return ''
                },
                editoption: [
                        /*{
                            title: '查看合同',
                            f: function (id, AccountId) {
                                window.open('/800/detail?objectTypeCode=1010&id=' + id)
                            },
                        },*/
                        {
                            title: '查看审批单',
                            f: function (id) {
                                window.open('/a0M/e?source=i&id=' + id)
                            }
                        }
                ]
            }
            },
            {
            label: '付款未开发票',
            name: 'fukuanweikaifapiao',
            searchform: [],
            summaryurl: 'contract.summary.statistics.get&Type=1',
            summary: [],
            table: {
                cmd: 'contract.payment.not.invoice.list',
                objecttypecode: 10182,
                filterquery: '',
                formatOper: function (value, row, index) {
                    return ''
                },
                columnsArray: [
                //{
                //    field: "Action",
                //    title: "操作",
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption"  data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                //    }
                //},
                {
                    field: 'Name',
                    title: '付款单名称',
                    sortable: true,
                }, {
                    field: 'BillNo',
                    title: '付款单号',
                    sortable: true,
                }, {
                    field: 'Amount',
                    title: '付款金额',
                    sortable: true,
                }, {
                    field: 'ContractNumber',
                    title: '合同编号',
                    sortable: true,
                }, {
                    field: 'ContractIdTitle',
                    title: '合同名称',
                    formatter: function formatter(value, row, index) {
                        if (value && value != '&nbsp;') {
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                        return ''
                    },
                    sortable: true,
                }, {
                    field: 'StatusCodeName',
                    title: '付款状态',
                    sortable: true,
                }, {
                    field: 'PaymentMethod',
                    title: '付款方式',
                    sortable: true,
                }, {
                    field: 'PlanName',
                    title: '付款计划',
                    sortable: true,
                }, {
                    field: 'PayedOn',
                    title: '付款日期',
                    sortable: true,
                }, {
                    field: 'AccountName',
                    title: '付款单位',
                    sortable: true,
                }],
                editoption: [
                ]
            }
        }, 
            ],
        }
    },
    receiptOwner: {
        template: {
            head: {
                title: '收款管理',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '新建到款记录',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layout_ie8.html?entityName=ContractReceipt'
                            $('#iframe').show().attr('src', url)
                        },
                        n: 'addContractReceipt'
                    }
                }, {
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                }, ]
            },
            tabs: [{
                label: '到款记录',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=4',
                searchform: [],
                summary: [{
                    label: '到款总金额',
                    name: 'Amount',
                    type: 'account'
                }, {
                    label: '本月到款总金额',
                    name: 'MonthReceiptAmount',
                    type: 'account'
                }, {
                    label: '已经匹配总金额',
                    name: 'Amount1',
                    type: 'account'
                }, {
                    label: '未认领金额',
                    name: 'Amount1',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 10183,
                    iscommon: false,
                    cmd: 'entitygrid.list',
                    filterquery: ['\nContractType\teq\t1'],
                    formatOper: function (value, row, index) {
                        return '<ul class="layui-nav" lay-filter="">'
                                + '  <li class="layui-nav-item">'
                                + '    <a href="javascript:;">更多操作</a>'
                                + '    <dl class="layui-nav-child">'
                                + '      <dd><a href="">操作1</a></dd>'
                                + '      <dd><a href="">操作2</a></dd>'
                                + '      <dd><a href="">操作3</a></dd>'
                                + '    </dl>'
                                + '  </li>'
                                + '</ul>'
                    },
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'Name',
                        title: '名称',
                        sortable: true
                    }, {
                        field: 'ContractId',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value!='&nbsp;') {
                                return '<a href="' + $(value).attr('href') + '&objectTypeCode=1010" target="_blank">' + $(value).html() + '</a>'
                            }
                            return ''
                        },
                        sortable: true
                    }, {
                        field: 'ReceiptDate',
                        title: '收款日期',
                        sortable: true
                    }, {
                        field: 'AccountId',
                        title: '付款单位',
                        sortable: true
                    }, {
                        field: 'Amount',
                        title: '金额',
                        sortable: true
                    }, {
                        field: 'PaymentMethod',
                        title: '付款方式',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    },
                    {
                        field: 'ModifiedBy',
                        title: '上次修改人',
                        sortable: true
                    },
                    {
                        field: 'StatusCode',
                        title: '状态',
                        sortable: true
                    }],
                    editoption: [
                        {
                            title: '认领',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractReceipt&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                    ]
                }
            }, {
                label: '开票未到款',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [],
                summary: [{
                    label: '开票总金额',
                    name: 'TotalAmount',
                    type: 'account'
                }, {
                    label: '开票未到款金额',
                    name: 'PaymentAmount',
                    type: 'account'
                }, {
                    label: '本月开票未到款金额',
                    name: 'MonthPaymentAmount',
                    type: 'account'
                }],
                table: {
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'InvoiceNumber',
                        title: '发票票号',
                        sortable: true
                    }, {
                        field: 'AccountIdName',
                        title: '开票单位',
                        sortable: true
                    }, {
                        field: 'TotalAmount',
                        title: '发票金额',
                        sortable: true
                    }, {
                        field: 'ContractTitle',
                        title: '相关合同',
                        sortable: true
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true
                    }, {
                        field: 'ContractTotalAmount',
                        title: '合同总金额',
                        sortable: true
                    }, {
                        field: 'IssueDate',
                        title: '开票时间',
                        sortable: true
                    },
                    {
                        field: 'CreatedOn',
                        title: '收票时间',
                        sortable: true
                    },
                    {
                        field: 'ProcessInstanceName',
                        title: '付款流程',
                        sortable: true
                    }],
                    objecttypecode: 1090,
                    cmd: 'contract.collect.invoice.receipt.getlist',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<a style="color:#015ba7;font-size:13px;" onclick="showEditDialog()">付款</a>'
                    },
                    editoption: [
                        {
                            title: '付款',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractReceipt&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                    ]
                }
            }],
        },
    },
    invoiceOwner: {
        template: {
            head: {
                title: '发票管理',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '新建收票',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layoutandupload.html?entityName=Invoice&dataname=InvoiceDirection&datavalue=1'
                            $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                        n: 'addInvoice'
                    }
                },{
                    label: '新建开票',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layoutandupload.html?entityName=Invoice&dataname=InvoiceDirection&datavalue=2'
                            $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                        n: 'addInvoice2'
                    }
                },
                {
                    label: '批量添加发票',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/batch_add_invoice.html'
                            $('#iframe').show().attr('src', url).height(590).css({ "left": "27%", "background-color": "white", "width": "43%", "max-height": "640px" })
                        },
                        n: 'batchaddInvoice'
                    }
                },
                {
                    label: '发票识别',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            
                        },
                        n: 'distinguishInvoice'
                    }
                }
                , {
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                }, ]
            },
            tabs: [{
                label: '收票记录',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=7',
                searchform: [],
                summary: [{
                    label: '收票总金额',
                    name: 'TotalAmount',
                    type: 'account'
                },{
                    label: '退票总额',
                    name: 'RefundAmount',
                    type: 'account'
                },{
                    label: '本月收票总额',
                    name: 'MonthTotalAmount',
                    type: 'account'
                },{
                    label: '本月退票总额',
                    name: 'MonthRefundAmount',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 1090,
                    iscommon: false,
                    cmd: 'entitygrid.list',
                    filterquery: '\nInvoiceDirection\teq\t1',
                    formatOper: function (value, row, index) {
                        return '<ul class="layui-nav" lay-filter="">'
                                + '  <li class="layui-nav-item">'
                                + '    <a href="javascript:;">更多操作</a>'
                                + '    <dl class="layui-nav-child">'
                                + '      <dd><a href="">操作1</a></dd>'
                                + '      <dd><a href="">操作2</a></dd>'
                                + '      <dd><a href="">操作3</a></dd>'
                                + '    </dl>'
                                + '  </li>'
                                + '</ul>'
                    },
                    columnsArray: [
                        {
                            field: "Action",
                            title: "操作",
                            formatter: function formatter(value, row, index) {
                                return '<div class="editoption"  data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                            }
                        },
                        {
                        field: 'InvoiceNumber',
                        title: '发票号',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.LIST_RECORD_ID + '\',\'1090\')">' + value + '</a>'
                        }
                    }, {
                        field: 'Name',
                        title: '发票抬头',
                        sortable: true,
                    }, {
                        field: 'InvoiceType',
                        title: '发票类型',
                        sortable: true,
                    }, {
                        field: 'AccountId',
                        title: '开票单位',
                        sortable: true,
                    }, {
                        field: 'IssueDate',
                        title: '开票日期',
                        sortable: true,
                    }, {
                        field: 'TotalAmount',
                        title: '总金额',
                        sortable: true,
                    }, {
                        field: 'StateCode',
                        title: '发票状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'ContractIdName',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;' && value != undefined) {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sortable: true,
                    }, {
                        field: 'TaxRate',
                        title: '税点',
                        sortable: true,
                    },
                    {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true,
                    },
                    {
                        field: 'ModifiedBy',
                        title: '上次修改人',
                        sortable: true,
                    },
                    {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true,
                    },
                    {
                        field: 'InvoiceDirection',
                        title: '发票方向',
                        sortable: true,
                    },
                    {
                        field: 'StatusCode',
                        title: '审批状态',
                        sortable: true,
                        //formatter: function formatter(value, row, index) {
                        //    return formatOperstatecode(value, row, index);
                        //}
                    },
                    ],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1090)
                            },
                        },
                        {
                            title: '退票',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=1090&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                    ]
                }
            }, {
                label: '开票记录',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=8',
                searchform: [],
                summary: [{
                    label: '已开票总金额',
                    name: 'TotalAmount',
                    type: 'account'
                }, {
                    label: '已废止发票总金额',
                    name: 'StopTotalAmount',
                    type: 'account'
                }, {
                    label: '本月开票金额',
                    name: 'MonthStopTotalAmount',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 1090,
                    iscommon: false,
                    cmd: 'entitygrid.list',
                    filterquery: '\nInvoiceDirection\teq\t2',
                    formatOper: function (value, row, index) {
                        return '<a style="color:#015ba7;font-size:13px;" onclick="showEditDialog()">付款</a>'
                    },
                    columnsArray: [
                        {
                            field: "Action",
                            title: "操作",
                            formatter: function formatter(value, row, index) {
                                return '<div class="editoption"  data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                            }
                        },
                        {
                            field: 'InvoiceNumber',
                            title: '发票号',
                            sortable: true,
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.LIST_RECORD_ID + '\',\'1090\')">' + value + '</a>'
                            }
                        }, {
                            field: 'Name',
                            title: '发票抬头',
                            sortable: true,
                        }, {
                            field: 'InvoiceType',
                            title: '发票类型',
                            sortable: true,
                        }, {
                            field: 'AccountId',
                            title: '开票单位',
                            sortable: true,
                        }, {
                            field: 'IssueDate',
                            title: '开票日期',
                            sortable: true,
                        }, {
                            field: 'TotalAmount',
                            title: '总金额',
                            sortable: true,
                        }, {
                            field: 'StateCode',
                            title: '发票状态',
                            sortable: true,
                            formatter: function formatter(value, row, index) {
                                return formatOperstatecode(value, row, index);
                            }
                        }, {
                            field: 'ContractIdName',
                            title: '合同名称',
                            formatter: function formatter(value, row, index) {
                                if (value && value != '&nbsp;' && value != undefined) {
                                    return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                                }
                                return ''
                            },
                            sortable: true,
                        }, {
                            field: 'TaxRate',
                            title: '税点',
                            sortable: true,
                        },
                    {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true,
                    },
                    {
                        field: 'ModifiedBy',
                        title: '上次修改人',
                        sortable: true,
                    },
                    {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true,
                    },
                    {
                        field: 'InvoiceDirection',
                        title: '发票方向',
                        sortable: true,
                    },
                    {
                        field: 'StatusCode',
                        title: '审批状态',
                        sortable: true,
                        //formatter: function formatter(value, row, index) {
                        //    return formatOperstatecode(value, row, index);
                        //}
                    },
                    ],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1090)
                            },
                        },
                        {
                            title: '退票',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=Invoice&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=1090&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                    ]
                }
            }]
        }
    },
    mycontract: {
        template: {
            head: {
                title: '我的合同',
                logo: '/template/hearder/logo.png',
                btns: [
                    {
                        label: '新建合作方',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=Account'
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                            n: 'addhezuofang'
                        }
                    },
                    {
                        label: '批量归档',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {
                                var ids = [];
                                var rows = $('#datagrid').datagrid('getChecked');
                                for (var i = 0; i < rows.length; i++) {
                                    //if (rows[i].StateCodeName == '已完成') {
                                    //    ids.push(rows[i].ContractId);
                                    //}
                                    //else {
                                    //    layer.msg('请选择已完成状态合同')
                                    //    return 
                                    //}
                                    ids.push(rows[i].ContractId);
                                }
                                var cid = ids.join(',');
                                if (cid&&cid.length > 0) {
                                    ajaxMethodPostData('contract.archived.bulk.add', { Contractids: cid }, function (data) {
                                        layer.msg(data.msg)
                                        $('#datagrid').datagrid('reload')
                                    })
                                }
                                else {
                                    layer.msg('请选择合同')
                                }
                            },
                            n: 'archived'
                        }
                    },
                    //{
                    //    label: '搜索',
                    //    type: 'layui-btn-normal',
                    //    click: {
                    //        f: function () {

                    //        },
                    //        n: 'reloadgrided'
                    //    }
                    //},
                    {
                        label: '高级搜索',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {

                            },
                            n: 'hightsearch'
                        }
                    }, ]
            },
            tabs: [{
                label: '付款类合同',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0&ContractType=2',
                searchform: [],
                summary: [{
                    label: '合同总数',
                    name: 'ContractNumber',
                    type: 'wancheng'
                }, {
                    label: '合同总金额',
                    name: 'Total',
                    type: 'account'
                }, {
                    label: '履行中金额',
                    name: 'ImplementTotal',
                    type: 'account'
                }, {
                    label: '暂停合同总金额',
                    name: 'StopTotal',
                    type: 'account'
                }, {
                    label: '解除合同总金额', 
                    name: 'SuspendedTotal',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 1010,
                    cmd: 'contract.owner.getlist&ContractType=2',
                    filterquery: ['\nContractType\teq\t2'],
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-amount="' + row.TotalPrice + '" data-name="' + row.Title + '" data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'Title',
                        title: '合同名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            //return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'1010\')">' + value + '</a>'
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    }, {
                        field: 'AccountIdName',
                        title: '合作方',
                        sortable: true,
                    }, {
                        field: 'ActiveOn',
                        title: '开始日期',
                        sortable: true,
                    }, {
                        field: 'ExpiresOn',
                        title: '截止日期',
                        sortable: true,
                    }, {
                        field: 'TotalPrice',
                        title: '合同总额',
                        sortable: true,
                    }, {
                        field: 'PaidAmount',
                        title: '已付金额',
                        sortable: true,
                    }, {
                        field: 'UnpaidAmount',
                        title: '未付金额',
                        sortable: true,
                    }, {
                        field: 'StateCodeName', 
                        title: '合同状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    },{
                        field: 'WfprocessinstancesStateCodeName',
                        title: '审批状态',
                        sortable: true,
                    },{
                        field: 'PaymentPercentage',
                        title: '付款进度',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperprogeress(value, row, index);
                        }
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true,
                    }, {
                        field: 'IsArchived',
                        title: '是否归档',
                        sortable: true
                    }, {
                        field: 'ArchivedOn',
                        title: '归档日期',
                        sortable: true
                    }],
                    editoption: [{
                        title: '查看合同',
                        f: function (id) {
                            window.open('/800/detail?objectTypeCode=1010&id=' + id)
                        },
                    }, {
                        title: '新建收票',
                        f: function (id, AccountId) {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layoutandupload.html?entityName=Invoice&type=related&dataname=InvoiceDirection&datavalue=2'
                            url += '&relatedObjectAttributeName=AccountId,ContractId&inContextOfRecordId=' + AccountId + ',' + id
                            $('#iframe').show().attr('src', url)
                        },
                    }, {
                        title: '设置计划',
                        f: function (id,AccountId,name,amount) {
                            //$('.popup-mask').show()
                            //var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&type=related'
                            //url += '&relatedObjectAttributeName=ContractId&inContextOfRecordId=' + ContractId
                            //$('#iframe').show().attr('src', url)
                            $('.popup-mask').show()
                            $('#iframe').attr('src', '/alert/cntrt/batch_add_cntrplan.html?pid=' + id + '&pname=' + name + '&pamount=' + amount).height(620).css('margin-top', '-300px');
                            $('#iframe').show();
                        },
                    }, {
                        title: '查看会签单',
                        f: function (id) {
                            window.open('/a0M/e?source=i&id=' + id)
                        },

                    },
                    {
                        title: '上传签章版',
                        f: function (id, AccountId, name, amount) {
                            //$('.popup-mask').show()
                            //var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&type=related'
                            //url += '&relatedObjectAttributeName=ContractId&inContextOfRecordId=' + ContractId
                            //$('#iframe').show().attr('src', url)
                            $('.popup-mask').show()
                            $('#iframe').attr('src', '/alert/contract/add_contractupload.html?id=' + id).height(360);
                            $('#iframe').show();
                        },
                    },
                    //{
                    //    title: '新建付款',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同暂停',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同变更',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同解除',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同终止',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同结项',
                    //    f: function (id) {
                    //    },
                    //}
                    ]
                }
            }, {
                label: '收款类合同',
                name: 'xiaoshouContract',
                searchform: [],
                summaryurl: 'contract.summary.statistics.get&Type=0&ContractType=1',
                summary: [{
                    label: '合同总数',
                    name: 'ContractNumber',
                    type: 'wancheng'
                }, {
                    label: '合同总金额',
                    name: 'Total',
                    type: 'account'
                }, {
                    label: '履行中金额',
                    name: 'ImplementTotal',
                    type: 'account'
                }, {
                    label: '暂停合同总金额',
                    name: 'StopTotal',
                    type: 'account'
                }, {
                    label: '解除合同总金额',
                    name: 'SuspendedTotal',
                    type: 'account'
                }
                ],
                table: {
                    objecttypecode: 1010,
                    cmd: 'contract.owner.getlist&ContractType=1',
                    filterquery: ['\nContractType\teq\t1'],
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-amount="' + row.TotalPrice + '" data-name="' + row.Title + '" data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'Title',
                        title: '合同名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            //return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'1010\')">' + value + '</a>'
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    }, {
                        field: 'AccountIdName',
                        title: '合作方',
                        sortable: true,
                    }, {
                        field: 'ActiveOn',
                        title: '开始日期',
                        sortable: true,
                    }, {
                        field: 'ExpiresOn',
                        title: '截止日期',
                        sortable: true,
                    }, {
                        field: 'TotalPrice',
                        title: '合同总额',
                        sortable: true,
                    }, {
                        field: 'PaidAmount',
                        title: '已付金额',
                        sortable: true,
                    }, {
                        field: 'UnpaidAmount',
                        title: '未付金额',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '合同状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'WfprocessinstancesStateCodeName',
                        title: '审批状态',
                        sortable: true,
                    }, {
                        field: 'PaymentPercentage',
                        title: '付款进度',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperprogeress(value, row, index);
                        }
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true,
                    }, {
                        field: 'IsArchived',
                        title: '是否归档',
                        sortable: true
                    }, {
                        field: 'ArchivedOn',
                        title: '归档日期',
                        sortable: true
                    }],
                    editoption: [{
                        title: '查看合同',
                        f: function (id) {
                            window.open('/800/detail?objectTypeCode=1010&id=' + id)
                        },
                    }, {
                        title: '新建收票',
                        f: function (id, AccountId) {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layoutandupload.html?entityName=Invoice&type=related&dataname=InvoiceDirection&datavalue=1'
                            url += '&relatedObjectAttributeName=AccountId,ContractId&inContextOfRecordId=' + AccountId + ',' + id
                            $('#iframe').show().attr('src', url)
                        },
                    }, {
                        title: '设置计划',
                        f: function (id, AccountId,name,amount) {
                            //$('.popup-mask').show()
                            //var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&type=related'
                            //url += '&relatedObjectAttributeName=ContractId&inContextOfRecordId=' + ContractId
                            //$('#iframe').show().attr('src', url)
                            $('.popup-mask').show()
                            $('#iframe').attr('src', '/alert/cntrt/batch_add_cntrplan.html?pid=' + id + '&pname=' + name + '&pamount=' + amount).height(620).css('margin-top', '-300px');
                            $('#iframe').show();
                        },
                    }, {
                        title: '查看会签单',
                        f: function (id) {
                            window.open('/a0M/e?source=i&id=' + id)
                        },
                    },
                    {
                        title: '上传签章版',
                        f: function (id, AccountId, name, amount) {
                            //$('.popup-mask').show()
                            //var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&type=related'
                            //url += '&relatedObjectAttributeName=ContractId&inContextOfRecordId=' + ContractId
                            //$('#iframe').show().attr('src', url)
                            $('.popup-mask').show()
                            $('#iframe').attr('src', '/alert/contract/add_contractupload.html?id=' + id).height(360);
                            $('#iframe').show();
                        },
                    },
                    //{
                    //    title: '新建付款',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同暂停',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同变更',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同解除',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同终止',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同结项',
                    //    f: function (id) {
                    //    },
                    //},
                    ]
                }
            },  {
                label: '其他',
                name: 'qitaContract',
                searchform: [],
                summaryurl: 'contract.summary.statistics.get&Type=0&ContractType=3',
                summary: [{
                    label: '合同总数',
                    name: 'ContractNumber',
                    type: 'wancheng'
                }, {
                    label: '合同总金额',
                    name: 'Total',
                    type: 'account'
                }, {
                    label: '履行中金额',
                    name: 'ImplementTotal',
                    type: 'account'
                }, {
                    label: '暂停合同总金额',
                    name: 'StopTotal',
                    type: 'account'
                }, {
                    label: '解除合同总金额',
                    name: 'SuspendedTotal',
                    type: 'account'
                }
                ],
                table: {
                    objecttypecode: 1010,
                    cmd: 'contract.owner.getlist',
                    filterquery: ['\nContractType\teq\t3'],
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'Title',
                        title: '合同名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            //return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'1010\')">' + value + '</a>'
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    }, {
                        field: 'AccountIdName',
                        title: '合作方',
                        sortable: true,
                    }, {
                        field: 'ActiveOn',
                        title: '开始日期',
                        sortable: true,
                    }, {
                        field: 'ExpiresOn',
                        title: '截止日期',
                        sortable: true,
                    }, {
                        field: 'TotalPrice',
                        title: '合同总额',
                        sortable: true,
                    }, {
                        field: 'PaidAmount',
                        title: '已付金额',
                        sortable: true,
                    }, {
                        field: 'UnpaidAmount',
                        title: '未付金额',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '合同状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'PaymentPercentage',
                        title: '付款进度',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperprogeress(value, row, index);
                        }
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true,
                    }, {
                        field: 'IsArchived',
                        title: '是否归档',
                        sortable: true
                    }, {
                        field: 'ArchivedOn',
                        title: '归档日期',
                        sortable: true
                    }],
                    editoption: [{
                        title: '查看合同',
                        f: function (ContractId) {
                            window.open('/800/detail?objectTypeCode=1010&id=' + ContractId)
                        },
                    }, {
                        title: '新建收票',
                        f: function (ContractId, AccountId) {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layoutandupload.html?entityName=Invoice&type=related&dataname=InvoiceDirection&datavalue=1'
                            url += '&relatedObjectAttributeName=AccountId,ContractId&inContextOfRecordId=' + AccountId + ',' + ContractId
                            $('#iframe').show().attr('src', url)
                        },
                    }, {
                        title: '设置计划',
                        f: function (ContractId) {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&type=related'
                            url += '&relatedObjectAttributeName=ContractId&inContextOfRecordId=' + ContractId
                            $('#iframe').show().attr('src', url)
                        },
                    }, {
                        title: '查看会签单',
                        f: function (ContractId) {
                            window.open('/a0M/e?source=i&id=' + ContractId)
                        },
                    },
                    {
                        title: '上传签章版',
                        f: function (ContractId) {
                            $('.popup-mask').show()
                            $('#iframe').attr('src', '/alert/contract/add_contractupload.html?id=' + ContractId).height(360);
                            $('#iframe').show();
                        },
                    },
                    //{
                    //    title: '新建付款',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同暂停',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同变更',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同解除',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同终止',
                    //    f: function (id) {
                    //    },
                    //}, {
                    //    title: '合同结项',
                    //    f: function (id) {
                    //    },
                    //},
                    ]
                }
            },
            {
                label: '合作方',
                name: 'hezuofangContract',
                searchform: [],
                summaryurl: '',
                summary: [
                ],
                table: {
                    objecttypecode: 1,
                    cmd: 'entitygrid.list&entityType=001',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    }, {
                        field: 'Name',
                        title: '名称',
                        sortable: true,
                    }, {
                        field: 'Telephone1',
                        title: '联系电话',
                        sortable: true,
                    }, {
                        field: 'LegalPersonName',
                        title: '法人',
                        sortable: true,
                    }, {
                        field: 'CreatedBy',
                        title: '创建人',
                        sortable: true,
                    }, {
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    }],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 1)
                                $('#iframe').height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            }
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=Account&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            }
                        }
                    ]
                }
            },
            {
                label: '执行计划',
                name: 'payplan',
                searchform: [{
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请选择",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '计划名称',
                    name: 'Name',
                    placeholder: "请输入",
                    type: 'S',
                },{
                    label: '计划状态',
                    name: 'StatusCode',
                    placeholder: "请选择",
                    type: 'cntrplan',
                },{
                    label: '计划时间',
                    name: 'PlanPayOn',
                    placeholder: "请选择",
                    type: 'D',
                }],
                issearchform: true,
                summaryurl: '',
                summary: [
                ],
                table: {
                    objecttypecode: 1010,
                    cmd: 'contract.payment.plan.owner.list',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    },
                    {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption"  data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        }
                    },
                    {
                        field: 'ContractIdName',
                        title: '合同名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            //return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'1010\')">' + value + '</a>'
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                    },
                    {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    },
                    {
                        field: 'ContractAmount',
                        title: '合同金额',
                        sortable: true,
                    },
                    {
                        field: 'Name',
                        title: '计划名称',
                        sortable: true,
                    }, {
                        field: 'Amount',
                        title: '金额',
                        sortable: true,
                    }, {
                        field: 'Rate',
                        title: '比例',
                        sortable: true,
                    }, {
                        field: 'OwningUserName',
                        title: '执行人',
                        sortable: true,
                    }, {
                        field: 'StatusCodeName',
                        title: '计划状态',
                        sortable: true,
                    },{
                        field: 'PlanPayOn',
                        title: '计划时间',
                        sortable: true,
                    },
                    {
                        field: 'ActualPay',
                        title: '实际付款日期',
                        sortable: true,
                    },],
                    editoption: [
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            }
                        },
                         {
                             title: '删除',
                             f: function (id) {
                                 $('.popup-mask').show()
                                 var url = '/alert/delete_ie8.html?objtypecode=1012&id=' + id;
                                 $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                             },
                         },
                    ]
                }
            },
            ],
        },
    },
    contractChange: {
        template: {
            head: {
                title: '合同变更',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '新建合同变更',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layout_ie8.html?entityName=ContractChange'
                            $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                        n: 'btnContractChange'
                    }
                }, {
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                }, {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var url = '/apps/CommandProcessor.ashx?cmd=workshift.deptgroup.employee.sumreport.export'
                            var data = {}
                            var filterQuery = mylayout.activetab.table.filterquerystring
                            if (filterQuery) {
                                data.filterQuery = filterQuery
                            }
                            openWindowWithPost(url, data)
                        },
                        n: 'exported'
                    }
                }]
            },
            tabs: [{
                label: '采购类合同',
                name: 'caigouContract',
                summaryurl: 'contract.change.summary.get&type=1',
                searchform: [{
                    label: '变更合同名称',
                    name: 'ContractNameChange',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '合同编号',
                    name: 'ContractNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '变更日期',
                    name: 'ApplyOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '合同状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'StateCode',
                }],
                issearchform: true,
                summary: [{
                    label: '内容变更总金额',
                    name: 'ContentAmount',
                    type: 'account'
                }, {
                    label: '暂停合同总金额',
                    name: 'SuspendAmount',
                    type: 'account'
                }, {
                    label: '终止合同总金额',
                    name: 'TerminationAmount',
                    type: 'account'
                }, {
                    label: '解除合同总金额',
                    name: 'RelieveAmount',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 10189,
                    cmd: 'contract.change.getlist&type=1',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                        {
                            field: 'ValueId',
                            checkbox: true
                        },
                        {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    }, {
                        field: 'ContractNameChange',
                        title: '变更后合同名称',
                        sortable: true,
                    }, {
                        field: 'ApplyOn',
                        title: '变更日期',
                        sortable: true,
                    }, {
                        field: 'Description',
                        title: '变更事由',
                        sortable: true,
                    }, {
                        field: 'pocessInstanceIdName',
                        title: '变更相关流程',
                        sortable: true,
                    }, {
                        field: 'ChangeTypeCodeName',
                        title: '变更类型',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }],
                    editoption: [
                    ]
                }
            },
            {
                label: '销售类合同',
                name: 'xiaoshouContract',
                summaryurl: 'contract.change.summary.get&type=2',
                searchform: [{
                    label: '变更合同名称',
                    name: 'ContractNameChange',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '合同编号',
                    name: 'ContractNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '变更日期',
                    name: 'ApplyOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '合同状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'StateCode',
                }],
                issearchform: true,
                summary: [{
                    label: '内容变更总金额',
                    name: 'ContentAmount',
                    type: 'account'
                }, {
                    label: '暂停合同总金额',
                    name: 'SuspendAmount',
                    type: 'account'
                }, {
                    label: '终止合同总金额',
                    name: 'TerminationAmount',
                    type: 'account'
                }, {
                    label: '解除合同总金额',
                    name: 'RelieveAmount',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 10189,
                    cmd: 'contract.change.getlist&type=2',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                        {
                            field: 'ValueId',
                            checkbox: true
                        },
                        {
                            field: 'ContractNumber',
                            title: '合同编号',
                            sortable: true,
                        }, {
                            field: 'ContractNameChange',
                            title: '变更后合同名称',
                            sortable: true,
                        }, {
                            field: 'ApplyOn',
                            title: '变更日期',
                            sortable: true,
                        }, {
                            field: 'Description',
                            title: '变更事由',
                            sortable: true,
                        }, {
                            field: 'pocessInstanceIdName',
                            title: '变更相关流程',
                            sortable: true,
                        }, {
                            field: 'ChangeTypeCodeName',
                            title: '变更类型',
                            sortable: true,
                            formatter: function formatter(value, row, index) {
                                return formatOperstatecode(value, row, index);
                            }
                        }],
                    editoption: [
                    ]
                }
            }]
        }
    },
    shiftdept: {
        template: {
            head: {
                title: '门诊、住院排班汇总报表',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                }, {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var url = '/apps/CommandProcessor.ashx?cmd=workshift.deptgroup.employee.sumreport.export'
                            var data = {}
                            var filterQuery = mylayout.activetab.table.filterquerystring
                            if (filterQuery) {
                                data.filterQuery = filterQuery
                            }
                            openWindowWithPost(url, data)
                        },
                        n: 'exported'
                    }
                }]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [{
                    label: '排班日期',
                    name: 'WorkDay',
                    placeholder: "请填写内容",
                    type: 'D',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode:10
                }, {
                    label: '姓名',
                    name: 'EmployeeId',
                    placeholder: "请填写内容",
                    type: 'Y',
                    objtypecode:30020
                }, {
                    label: '班次',
                    name: 'WorkShiftId',
                    placeholder: "选择",
                    type: 'Y',
                    objtypecode: 30040
                }],
                issearchform:true,
                summary: [],
                table: {
                    objecttypecode: 30043,
                    cmd: 'workshift.deptgroup.employee.sumreport',
                    filterquery:'',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.ContractId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'BusinessUnitIdName',
                        title: '部门',
                        sortable: true,
                    }, {
                        field: 'GroupIdName',
                        title: '组',
                        sortable: true,
                    }, {
                        field: 'EmployeeIdName',
                        title: '姓名',
                        sortable: true,
                    }, {
                        field: 'EmployeeNo',
                        title: '工号',
                        sortable: true,
                    }, {
                        field: 'OutPatientDays',
                        title: '门诊/天',
                        sortable: true,
                    }, {
                        field: 'InPatientDays',
                        title: '住院/天',
                        sortable: true,
                    }, {
                        field: 'OtherDays',
                        title: '其他/天',
                        sortable: true,
                    }],
                    editoption: [{
                        title: '查看',
                        f: function (ContractId) {
                            window.open('/800/detail?objectTypeCode=30043&id=' + ContractId)
                        },
                    }, {
                        title: '新建收票',
                        f: function (ContractId, AccountId) {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layoutandupload.html?entityName=Invoice&type=related&dataname=InvoiceDirection&datavalue=1'
                            url += '&relatedObjectAttributeName=AccountId,ContractId&inContextOfRecordId=' + AccountId + ',' + ContractId
                            $('#iframe').show().attr('src', url)
                        },
                    }, {
                        title: '设置计划',
                        f: function (ContractId) {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layout_ie8.html?entityName=ContractPlan&type=related'
                            url += '&relatedObjectAttributeName=ContractId&inContextOfRecordId=' + ContractId
                            $('#iframe').show().attr('src', url)
                        },
                    }, {
                        title: '查看会签单',
                        f: function (ContractId) {
                            window.open('/a0M/e?id=' + ContractId)
                        },
                    },
                    ]
                }
            }],
        },
    },
    dutyShiftQuery: {
        template: {
            head: {
                title: '值班统计表',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                }, {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var url = '/apps/CommandProcessor.ashx?cmd=dutyshift.dept.statistical.export'
                            var data = {}
                            var filterQuery = mylayout.activetab.table.filterquerystring
                            if (filterQuery) {
                                data.filterQuery = filterQuery
                            }
                            openWindowWithPost(url, data)
                        },
                        n: 'exported'
                    }
                }]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [{
                    label: '排班日期',
                    name: 'WorkDay',
                    placeholder: "请填写内容",
                    type: 'D',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '姓名',
                    name: 'EmployeeId',
                    placeholder: "请填写内容",
                    type: 'Y',
                    objtypecode: 30020
                }, {
                    label: '班次',
                    name: 'WorkShiftId',
                    placeholder: "选择",
                    type: 'Y',
                    objtypecode: 30040
                }],
                issearchform: true,
                summary: [],
                table: {
                    objecttypecode: 20451,
                    cmd: 'dutyshift.dept.statistical',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'BusinessUnitIdName',
                        title: '部门名称',
                        sortable: true,
                    }, {
                        field: 'EmployeeIdName',
                        title: '姓名',
                        sortable: true,
                    }, {
                        field: 'SalaryNo',
                        title: '工资号',
                        sortable: true,
                    }, {
                        field: 'EmployeeNo',
                        title: '工号',
                        sortable: true,
                    }, {
                        field: 'ContractTypeCodeName',
                        title: '编制情况',
                        sortable: true,
                    }, {
                        field: 'WorkDay',
                        title: '值班日期',
                        sortable: true,
                    }, {
                        field: 'WorkShiftIdName',
                        title: '班次',
                        sortable: true,
                    }, {
                        field: 'TotalDays',
                        title: '调休天数',
                        sortable: true,
                    }],
                    editoption: [
                    ]
                }
            }]
        }
    },
    auditReport: {
        template: {
            head: {
                title: '合同审计',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '新增审计合同',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/addAuditContract.html?ishighsearch=1&selecttype=multi&objtypecode=1010&lknm=ContractId&title=合同&search=';
                            $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white","width":"60%"})
                        },
                        n: 'btnAddContractAudit'
                    }
                },{
                    label: '批量删除',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请先选择审计')
                            } else {
                                var type = 0
                                var title = $('.layui-tab-title .layui-this .tab-title').eq(0).html()
                                if (title == '流转中审计') {
                                    layer.msg('流转中审计不允许删除')
                                    return
                                }
                                if (title == '审计报告') {
                                    type = 1
                                }
                                $('.popup-mask').show()
                                var url = '/alert/batchdelete1.html?type='+type;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            }
                        },
                        n: 'batchdelete1'
                    }
                },{
                    label: '审计抽查',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/alert/cntrt/auditTest.html'
                            $('#iframe').show().attr('src', url).height(680).width(600).css({"left":"35%","background-color":"transparent"})
                        },
                        n: 'AuditTest'
                    }
                }, {
                    label: '生成审计报告',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var ids = [];
                            var rows = $('#datagrid').datagrid('getChecked');
                            for (var i = 0; i < rows.length; i++) {
                                if(rows[i].ProcessInstanceStateCodeName!='审批完成'){
                                    layer.msg('请选择审批完成状态合同')
                                    return
                                }
                                //if (rows[i].AuditReportName) {
                                //    layer.msg('请选择未生成审计报告合同')
                                //    return
                                //}
                                ids.push(rows[i].LIST_RECORD_ID);
                            }
                            var cid = ids.join(',');

                            if (cid) {
                                //ajaxMethodPostData('contract.auditreport.post', { contractAuditIds:cid,name:''}, function (data) {
                                //    if (data.returnValue) {
                                //        $('.popup-mask').show()
                                //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAuditReport&id=' + data.returnValue.ReportId
                                //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                                //    }
                                //    else {
                                //        layer.msg('未获得所选择合同id')
                                //    }
                                //})

                                $('.popup-mask').show()
                                var url = '/cntrt/cntrtAuditRpt.html?cid=' + cid
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "30%", "background-color": "white", "width": "40%" })
                            }
                            else {
                                layer.msg('请选择审批完成状态合同')
                            }
                            
                        },
                        n: 'ContractAuditReport'
                    }
                }, {
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                }, {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var url = '/apps/CommandProcessor.ashx?cmd=dutyshift.dept.statistical.export'
                            var data = {}
                            var filterQuery = mylayout.activetab.table.filterquerystring
                            if (filterQuery) {
                                data.filterQuery = filterQuery
                            }
                            openWindowWithPost(url, data)
                        },
                        n: 'exported'
                    }
                }]
            },
            tabs: [{
                label: '待审批审计',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [{
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '审计报告',
                    name: 'AuditReportId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10186
                }, {
                    label: '抽查时间',
                    name: 'AuditedOn',
                    placeholder: "请填写内容",
                    type: 'D',
                    objtypecode: 30020
                }],
                issearchform: true,
                summary: [],
                table: {
                    objecttypecode: 10185,
                    cmd: 'contract.audit.getlist&type=1',
                    //filterquery: ['\nProcessInstanceStateCode\teq\t3', '\nStatusCode\teq\t1'],
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-name="' + $(row.Name).html() + '" data-accountid="' + row.ProcessInstanceStateCode + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    }, {
                        field: 'ContractTitle',
                        title: '合同名称',
                        sortable: true,
                        //formatter: function formatter(value, row, index) {
                        //    return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.LIST_RECORD_ID + '\',\'10185\')">' + $(value).html() + '</a>'
                        //}
                        //formatter: function formatter(value, row, index) {
                        //    if (value && value!='&nbsp;') {
                        //        return '<a style="color:blue;" href="' + $(value).attr('href') + '&objectTypeCode=1010" target="_blank">' + $(value).html() + '</a>'
                        //    }
                        //    return ''
                        //}
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;') {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true
                    }, {
                        field: 'ContractTotalPrice',
                        title: '合同金额',
                        sortable: true
                    }, {
                        field: 'StatusCodeName',
                        title: '审计状态',
                        sortable: true
                    }, {
                        field: 'AuditedByName',
                        title: '审计人',
                        sortable: true
                    }, {
                        field: 'AuditedOn',
                        title: '审计日期',
                        sortable: true
                    }, {
                        field: 'AuditReportName',
                        title: '审计报告名称',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceStateCodeName',
                        title: '审批状态',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'Rate',
                        title: '评分',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }],
                    editoption: [
                        {
                            title: '审批',
                            f: function (LIST_RECORD_ID, ProcessInstanceStateCode, Name) {
                                window.open('/a0M/e?source=i&id=' + LIST_RECORD_ID + '&retURL=')

                               //debugger;
                                // if (ProcessInstanceStateCode == '' || ProcessInstanceStateCode=="0") {
                                    //var processId = "D387BEC8-5068-44C6-A57A-E5990EE5AF1F"
                                    //processEntityIntanceSubmit(LIST_RECORD_ID, processId, Name)
                                //}
                                //else{
                                //    layer.msg('审批流程已提交，请勿重复提交')
                                //}
                            },
                        },
                        //{
                        //    title: '查看审批单',
                        //    f: function (LIST_RECORD_ID, ProcessInstanceStateCode) {
                        //        // if (ProcessInstanceStateCode != '0'&& ProcessInstanceStateCode != '') {
                        //        window.open('/a0M/e?source=i&id=' + LIST_RECORD_ID + '&retURL=%2f123%2fo')
                        //       // }
                        //       // else {
                        //       //     layer.msg('审批流程未提交，无法查看流程')
                        //       // }
                        //    },
                        //},
                        {
                            title: '查看',
                            f: function (Id) {
                                //window.open('/C85/detail?objectTypeCode=10185&id=' + Id)
                                lookupFieldView(Id, 10185)
                                $('#iframe').height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (Id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAudit&id=' + Id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (Id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete1.html?id=' + Id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                    ]
                }
            }, {
                label: '流转中审计',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [{
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '审计报告',
                    name: 'AuditReportId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10186
                }, {
                    label: '抽查时间',
                    name: 'AuditedOn',
                    placeholder: "请填写内容",
                    type: 'D',
                    objtypecode: 30020
                }],
                issearchform: true,
                summary: [],
                table: {
                    objecttypecode: 10185,
                    cmd: 'contract.audit.getlist&type=2',
                    //filterquery: ['\nProcessInstanceStateCode\teq\t3', '\nStatusCode\teq\t1'],
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-name="' + $(row.Name).html() + '" data-accountid="' + row.ProcessInstanceStateCode + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    }, {
                        field: 'ContractTitle',
                        title: '合同名称',
                        sortable: true,
                        //formatter: function formatter(value, row, index) {
                        //    return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.LIST_RECORD_ID + '\',\'10185\')">' + $(value).html() + '</a>'
                        //}
                        //formatter: function formatter(value, row, index) {
                        //    if (value && value != '&nbsp;') {
                        //        return '<a style="color:blue;" href="' + $(value).attr('href') + '&objectTypeCode=1010" target="_blank">' + $(value).html() + '</a>'
                        //    }
                        //    return ''
                        //}
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;') {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true
                    }, {
                        field: 'ContractTotalPrice',
                        title: '合同金额',
                        sortable: true
                    }, {
                        field: 'StatusCodeName',
                        title: '审计状态',
                        sortable: true
                    }, {
                        field: 'AuditedByName',
                        title: '审计人',
                        sortable: true
                    }, {
                        field: 'AuditedOn',
                        title: '审计日期',
                        sortable: true
                    }, {
                        field: 'AuditReportName',
                        title: '审计报告名称',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceStateCodeName',
                        title: '审批状态',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'Rate',
                        title: '评分',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }],
                    editoption: [
                        {
                            title: '审批',
                            f: function (LIST_RECORD_ID, ProcessInstanceStateCode, Name) {
                                window.open('/a0M/e?source=i&id=' + LIST_RECORD_ID + '&retURL=')

                                //debugger;
                                // if (ProcessInstanceStateCode == '' || ProcessInstanceStateCode=="0") {
                                //var processId = "D387BEC8-5068-44C6-A57A-E5990EE5AF1F"
                                //processEntityIntanceSubmit(LIST_RECORD_ID, processId, Name)
                                //}
                                //else{
                                //    layer.msg('审批流程已提交，请勿重复提交')
                                //}
                            },
                        },
                        //{
                        //    title: '查看审批单',
                        //    f: function (LIST_RECORD_ID, ProcessInstanceStateCode) {
                        //        // if (ProcessInstanceStateCode != '0'&& ProcessInstanceStateCode != '') {
                        //        window.open('/a0M/e?source=i&id=' + LIST_RECORD_ID + '&retURL=%2f123%2fo')
                        //        // }
                        //        // else {
                        //        //     layer.msg('审批流程未提交，无法查看流程')
                        //        // }
                        //    },
                        //},
                        {
                            title: '查看',
                            f: function (Id) {
                                //window.open('/C85/detail?objectTypeCode=10185&id=' + Id)
                                lookupFieldView(Id, 10185)
                                $('#iframe').height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (Id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAudit&id=' + Id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        //{
                        //    title: '删除',
                        //    f: function (Id) {
                        //        $('.popup-mask').show()
                        //        var url = '/alert/delete1.html?id=' + Id;
                        //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                        //    },
                        //},
                    ]
                }
            }, {
                label: '审批完成审计',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [{
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '审计报告',
                    name: 'AuditReportId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10185
                }, {
                    label: '审计时间',
                    name: 'AuditedOn',
                    placeholder: "请填写内容",
                    type: 'D',
                    objtypecode: 30020
                }],
                issearchform: true,
                summary: [],
                table: {
                    objecttypecode: 10185,
                    cmd: 'contract.audit.getlist&type=3',
                    //filterquery: ['\nProcessInstanceStateCode\teq\t3', '\nStatusCode\teq\t3'],
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.ValueId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    },{
                        field: 'ContractTitle',
                        title: '合同名称',
                        sortable: true,
                        //formatter: function formatter(value, row, index) {
                        //    //return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'10185\')">' + value + '</a>'
                        //    return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        //}
                        //formatter: function formatter(value, row, index) {
                        //    if (value && value!='&nbsp;') {
                        //        return '<a style="color:blue;" href="' + $(value).attr('href') + '&objectTypeCode=1010" target="_blank">' + $(value).html() + '</a>'
                        //    }
                        //    return ''
                        //}
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;') {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    }, {
                        field: 'ContractTotalPrice',
                        title: '合同金额',
                        sortable: true,
                    }, {
                        field: 'StatusCodeName',
                        title: '审计状态',
                        sortable: true,
                    }, {
                        field: 'AuditedByName',
                        title: '审计人',
                        sortable: true,
                    }, {
                        field: 'AuditedOn',
                        title: '审计日期',
                        sortable: true,
                    }, {
                        field: 'AuditReportName',
                        title: '审计报告名称',
                        sortable: true,
                    }, {
                        field: 'ProcessInstanceStateCodeName',
                        title: '审批状态',
                        sortable: true
                    }, {
                        field: 'Rate',
                        title: '评分',
                        sortable: true,
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true,
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true,
                    }],
                    editoption: [
                        {
                            title: '查看审批单',
                            f: function (id) {
                                window.open('/a0M/e?source=i&id=' + id)
                            }
                        },
                        {
                            title: '查看',
                            f: function (id) {
                                //window.open('/C85/detail?objectTypeCode=10185&id=' + id)
                                lookupFieldView(id, 10185)
                                $('#iframe').height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAudit&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=10185&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                    ]
                }
            },
            {
                label: '未生成报告审计',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [{
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '审计报告',
                    name: 'AuditReportId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10186
                }, {
                    label: '抽查时间',
                    name: 'AuditedOn',
                    placeholder: "请填写内容",
                    type: 'D',
                    objtypecode: 30020
                }],
                issearchform: true,
                summary: [],
                table: {
                    objecttypecode: 10185,
                    cmd: 'contract.audit.getlist&type=4',
                    //filterquery: ['\nProcessInstanceStateCode\teq\t3', '\nStatusCode\teq\t1'],
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-name="' + $(row.Name).html() + '" data-accountid="' + row.ProcessInstanceStateCode + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    }, {
                        field: 'ContractTitle',
                        title: '合同名称',
                        sortable: true,
                        //formatter: function formatter(value, row, index) {
                        //    return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.LIST_RECORD_ID + '\',\'10185\')">' + $(value).html() + '</a>'
                        //}
                        //formatter: function formatter(value, row, index) {
                        //    if (value && value != '&nbsp;') {
                        //        return '<a style="color:blue;" href="' + $(value).attr('href') + '&objectTypeCode=1010" target="_blank">' + $(value).html() + '</a>'
                        //    }
                        //    return ''
                        //}
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;') {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true
                    }, {
                        field: 'ContractTotalPrice',
                        title: '合同金额',
                        sortable: true
                    }, {
                        field: 'StatusCodeName',
                        title: '审计状态',
                        sortable: true
                    }, {
                        field: 'AuditedByName',
                        title: '审计人',
                        sortable: true
                    }, {
                        field: 'AuditedOn',
                        title: '审计日期',
                        sortable: true
                    }, {
                        field: 'AuditReportName',
                        title: '审计报告名称',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceStateCodeName',
                        title: '审批状态',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'Rate',
                        title: '评分',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }],
                    editoption: [
                        {
                            title: '审批',
                            f: function (LIST_RECORD_ID, ProcessInstanceStateCode, Name) {
                                window.open('/a0M/e?source=i&id=' + LIST_RECORD_ID + '&retURL=')

                                //debugger;
                                // if (ProcessInstanceStateCode == '' || ProcessInstanceStateCode=="0") {
                                //var processId = "D387BEC8-5068-44C6-A57A-E5990EE5AF1F"
                                //processEntityIntanceSubmit(LIST_RECORD_ID, processId, Name)
                                //}
                                //else{
                                //    layer.msg('审批流程已提交，请勿重复提交')
                                //}
                            },
                        },
                        {
                            title: '查看审批单',
                            f: function (LIST_RECORD_ID, ProcessInstanceStateCode) {
                                // if (ProcessInstanceStateCode != '0'&& ProcessInstanceStateCode != '') {
                                window.open('/a0M/e?source=i&id=' + LIST_RECORD_ID + '&retURL=%2f123%2fo')
                                // }
                                // else {
                                //     layer.msg('审批流程未提交，无法查看流程')
                                // }
                            },
                        },
                        {
                            title: '查看',
                            f: function (Id) {
                                //window.open('/C85/detail?objectTypeCode=10185&id=' + Id)
                                lookupFieldView(Id, 10185)
                                $('#iframe').height(640).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (Id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAudit&id=' + Id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (Id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete1.html?id=' + Id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                    ]
                }
            },
            {
                label: '审计报告',
                name: 'contractAuditReport',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [{
                    label: '报告名称',
                    name: 'LIST_RECORD_ID',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10186
                }, {
                    label: '审计状态',
                    name: 'StatusCode',
                    placeholder: "请填写内容",
                    type: 'S'
                }, {
                    label: '审批状态',
                    name: 'ProcessInstanceStateCodeName',
                    placeholder: "请填写内容",
                    type: 'S'
                }, {
                    label: '审计时间',
                    name: 'AuditedOn',
                    placeholder: "请填写内容",
                    type: 'D',
                    objtypecode: 30020
                }],
                issearchform: true,
                summary: [],
                table: {
                    objecttypecode: 10186,
                    cmd: 'contract.auditreport.getlist',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.ValueId + '" data-id="' + row.ValueId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    }, {
                        field: 'Name',
                        title: '报告名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a style="color:blue;" href="javascript:lookupFieldView(\'' + row.ContractId + '\',\'10186\')">' + value + '</a>'
                        }
                    }, {
                        field: 'ApplyIdName',
                        title: '申请人',
                        sortable: true
                    }, {
                        field: 'AuditedOn',
                        title: '审计日期',
                        sortable: true
                    }, {
                        field: 'StatusCode',
                        title: '审计状态',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    },
                    {
                        field: 'AuditedOn',
                        title: '审计日期',
                        sortable: true
                    },
                    {
                        field: 'AuditScope',
                        title: '审计范围',
                        sortable: true
                    },
                    {
                        field: 'ProcessInstanceStateCodeName',
                        title: '审批状态',
                        sortable: true
                    },
                    {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }],
                    editoption: [
                        {
                            title: '查看报告',
                            f: function (id) {
                                window.open('/a0M/e?source=i&id=' + id)
                            }
                        },
                        //{
                        //    title: '查看报告',
                        //    f: function (id) {
                        //        window.open('/C86/detail?objectTypeCode=10186&id=' + id)
                        //    },
                        //},
                        {
                            title: '编辑报告',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAuditReport&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                        {
                            title: '删除报告',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=10186&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%" })
                            },
                        },
                    ]
                }
            }]
        }
    },
    mineLoan: {
        template: {
            head: {
                title: '我的借款',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '新建借款单',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAudit'
                            $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                        n: 'btnAddContractAudit'
                    }
                }, {
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                },
                {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var url = '/apps/CommandProcessor.ashx?cmd=dutyshift.dept.statistical.export'
                            var data = {}
                            var filterQuery = mylayout.activetab.table.filterquerystring
                            if (filterQuery) {
                                data.filterQuery = filterQuery
                            }
                            openWindowWithPost(url, data)
                        },
                        n: 'exported'
                    }
                }]
            }
        }
    },
    MineReimburse: {
        template: {
            head: {
                title: '我的报销',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '新建差旅费报销',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            $('.popup-mask').show()
                            var url = '/layouteditor/add_layout_ie8.html?entityName=ReimburseBill'
                            $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                        n: 'btnReimburseBill'
                    }
                }, {
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {

                        },
                        n: 'reloadgrided'
                    }
                },
                {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var url = '/apps/CommandProcessor.ashx?cmd=reimbursebill.owner.getlist'
                            var data = {}
                            var filterQuery = mylayout.activetab.table.filterquerystring
                            if (filterQuery) {
                                data.filterQuery = filterQuery
                            }
                            openWindowWithPost(url, data)
                        },
                        n: 'exported'
                    }
                }]
            },
            tabs: [{
                label: '全部',
                name: 'all',
                summaryurl: 'reimbursebill.summary.statistics.get&ProcessInstanceStatusCode=',
                searchform: [{
                    label: '流程编号',
                    name: 'ProcessInstanceNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '相关项目',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '报销日期',
                    name: 'ApplyDate',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '报销金额',
                    name: 'TotalAmount',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '当前节点',
                    name: 'CurrentStepName',
                    placeholder: "请填写内容",
                    type: 'S',
                }],
                issearchform: true,
                summary: [{
                    label: '报销金额合计',
                    name: 'TotalAmount',
                    type: 'account'
                }, {
                    label: '已付款金额',
                    name: 'PaidAmount',
                    type: 'account'
                }, {
                    label: '未报销金额',
                    name: 'UnpadiAmount',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 7001,
                    cmd: 'reimbursebill.owner.getlist&ProcessInstanceStatusCode=',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    }, {
                        field: 'ProcessInstanceNumber',
                        title: '流程编号',
                        sortable: true,
                    }, {
                        field: 'ProcessInstanceIdName',
                        title: '流程标题',
                        sortable: true,
                    }, {
                        field: 'TotalAmount',
                        title: '报销金额',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'ApplyDate',
                        title: '报销日期',
                        sortable: true,
                    }, {
                        field: 'ApplyUserIdName',
                        title: '报销人',
                        sortable: true,
                    }, {
                        field: 'DeptIdName',
                        title: '报销部门',
                        sortable: true,
                    }, {
                        field: 'ContractName',
                        title: '相关项目',
                        sortable: true,
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前节点',
                        sortable: true,
                    },
                    {
                        field: 'ProcessInstanceStateCodeName',
                        title: '流程状态',
                        formatter: function formatter(value, row, index) {
                            return value
                        },
                        sortable: true,
                    }],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 7001)
                                $('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ReimburseBill&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=7001&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                            },
                        },
                    ]
                }
            }, {
                label: '审批中',
                name: 'examine',
                summaryurl: 'reimbursebill.summary.statistics.get&ProcessInstanceStatusCode=1',
                searchform: [{
                    label: '流程编号',
                    name: 'ProcessInstanceNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '相关项目',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '报销日期',
                    name: 'ApplyDate',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '报销金额',
                    name: 'TotalAmount',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '当前节点',
                    name: 'CurrentStepName',
                    placeholder: "请填写内容",
                    type: 'S',
                }],
                issearchform: true,
                summary: [{
                    label: '报销金额合计',
                    name: 'TotalAmount',
                    type: 'account'
                }, {
                    label: '已付款金额',
                    name: 'PaidAmount',
                    type: 'account'
                }, {
                    label: '未报销金额',
                    name: 'UnpadiAmount',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 7001,
                    cmd: 'reimbursebill.owner.getlist&ProcessInstanceStatusCode=1',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.ValueId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    }, {
                        field: 'ProcessInstanceNumber',
                        title: '流程编号',
                        sortable: true,
                    }, {
                        field: 'ProcessInstanceIdName',
                        title: '流程标题',
                        sortable: true,
                    }, {
                        field: 'TotalAmount',
                        title: '报销金额',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'ApplyDate',
                        title: '报销日期',
                        sortable: true,
                    }, {
                        field: 'ApplyUserIdName',
                        title: '报销人',
                        sortable: true,
                    }, {
                        field: 'DeptIdName',
                        title: '报销部门',
                        sortable: true,
                    }, {
                        field: 'ContractName',
                        title: '相关项目',
                        sortable: true,
                    },
                     {
                         field: 'CurrentStepName',
                         title: '当前节点',
                         sortable: true,
                     },
                     {
                         field: 'ProcessInstanceStateCodeName',
                         title: '流程状态',
                         formatter: function formatter(value, row, index) {
                             return value
                         },
                         sortable: true,
                     }],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 7001)
                                $('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ReimburseBill&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=7001&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                            },
                        },
                    ]
                }
            }, {
                label: '已支付',
                name: 'tobepaid',
                summaryurl: 'reimbursebill.summary.statistics.get&ProcessInstanceStatusCode=3',
                searchform: [{
                    label: '流程编号',
                    name: 'ProcessInstanceNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '相关项目',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                }, {
                    label: '报销日期',
                    name: 'ApplyDate',
                    placeholder: "请选择日期",
                    type: 'D',
                }, {
                    label: '报销金额',
                    name: 'TotalAmount',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '当前节点',
                    name: 'CurrentStepName',
                    placeholder: "请填写内容",
                    type: 'S',
                }],
                issearchform: true,
                summary: [{
                    label: '报销金额合计',
                    name: 'TotalAmount',
                    type: 'account'
                }, {
                    label: '已付款金额',
                    name: 'PaidAmount',
                    type: 'account'
                }, {
                    label: '未报销金额',
                    name: 'UnpadiAmount',
                    type: 'account'
                }],
                table: {
                    objecttypecode: 7001,
                    cmd: 'reimbursebill.owner.getlist&ProcessInstanceStatusCode=3',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.ValueId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                        }
                    }, {
                        field: 'ProcessInstanceNumber',
                        title: '流程编号',
                        sortable: true,
                    }, {
                        field: 'ProcessInstanceIdName',
                        title: '流程标题',
                        sortable: true,
                    }, {
                        field: 'TotalAmount',
                        title: '报销金额',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'ApplyDate',
                        title: '报销日期',
                        sortable: true,
                    }, {
                        field: 'ApplyUserIdName',
                        title: '报销人',
                        sortable: true,
                    }, {
                        field: 'DeptIdName',
                        title: '报销部门',
                        sortable: true,
                    }, {
                        field: 'ContractName',
                        title: '相关项目',
                        sortable: true,
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前节点',
                        sortable: true,
                    },
                    {
                        field: 'ProcessInstanceStateCodeName',
                        title: '流程状态',
                        formatter: function formatter(value, row, index) {
                            return value
                        },
                        sortable: true,
                    }],
                    editoption: [
                        {
                            title: '查看',
                            f: function (id) {
                                lookupFieldView(id, 7001)
                                $('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '编辑',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/layouteditor/add_layout_ie8.html?entityName=ReimburseBill&id=' + id;
                                $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                            },
                        },
                        {
                            title: '删除',
                            f: function (id) {
                                $('.popup-mask').show()
                                var url = '/alert/delete_ie8.html?objtypecode=7001&id=' + id;
                                $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                            },
                        },
                    ]
                }
            }]
        }
    },
    BusinessUnitSum: {
    template: {
    head: {
    title: '部门合同汇总报表',
    logo: '/template/hearder/logo.png',
    btns: [{
        label: '搜索',
        type: 'layui-btn-normal',
        click: {
            f: function () {

            },
            n: 'reloadgrided'
        }
    }, {
    label: '导出',
    type: 'layui-btn-normal',
    click: {
        f: function () {
            var url = '/apps/CommandProcessor.ashx?cmd=contract.report.dept.summary'
            var data = {}
            var filterQuery = mylayout.activetab.table.filterquerystring
            if (filterQuery) {
                data.filterQuery = filterQuery
            }
            openWindowWithPost(url, data)
        },
        n: 'exported'
    }
}]
},
    tabs: [{
    label: '全部',
    name: 'caigouContract',
        summaryurl: 'contract.summary.statistics.get&Type=0',
searchform: [
    {
    label: '合同状态',
    name: 'StateCode',
    placeholder: "请选择",
    type: 'StateCode',
    },
{
    label: '签订日期',
    name: 'SignedOn',
    placeholder: "请选择",
    type: 'D',
},
 {
     label: '申请日期',
     name: 'ApplyDate',
     placeholder: "请选择",
     type: 'D',
 },
],
issearchform: true,
summary: [],
table: {
    pag: 2,
    objecttypecode: 10,
    cmd: 'contract.report.dept.summary',
    filterquery: '',
    formatOper: function (value, row, index) {
        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
    },
    columnsArray: [
        {
        field: 'BusinessUnitIdName',
        title: '部门',
        sortable: true,
        sorter: function (a, b) {
            return (a > b ? 1 : -1);
        }
    },
    {
        field: 'ContractCount',
        title: '合同数量',
        sortable: true,
        sorter: function (a,b) {
            return (a > b ? 1 : -1);
        }
    }, {
        field: 'TotalPriceSum',
        title: '合同金额',
        sortable: true,
        sorter: function (a, b) {
            return (a > b ? 1 : -1);
        }
    }, {
        field: 'PaidAmountSum',
        title: '已付金额',
        sortable: true,
        sorter: function (a, b) {
            return (a > b ? 1 : -1);
        }
    }, {
        field: 'UnpaidAmountSum',
        title: '未付金额',
        sortable: true,
        sorter: function (a, b) {
            return (a > b ? 1 : -1);
        }
    }],
    editoption: [
        {
            title: '查看详情',
            f: function (id) {
                window.open('/800/detail?objectTypeCode=10&id=' + id)
            },
        }
    ]
}
}]
}
},
BusinessUnitDetail: {
        template: {
            head: {
                    title: '部门合同明细报表',
                    logo: '/template/hearder/logo.png',
                    btns: [{
                        label: '搜索',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {

                            },
                            n: 'reloadgrided'
                        }
                    }, {
                        label: '导出',
                        type: 'layui-btn-normal',
                        click: {
                            f: function () {
                                var url = '/apps/CommandProcessor.ashx?cmd=contract.report.dept.list'
                                var data = {}
                                var filterQuery = mylayout.activetab.table.filterquerystring
                                if (filterQuery) {
                                    data.filterQuery = filterQuery
                                }
                                openWindowWithPost(url, data)
                            },
                            n: 'exported'
                        }
                    }]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=0',
                searchform: [
                {
                    label: '合同状态',
                    name: 'StateCode',
                    placeholder: "请选择",
                    type: 'StateCode',
                },
                {
                    label: '归口部门',
                    name: 'GUIKOUBUMENName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '申请部门',
                    name: 'BusinessUnitName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '签订日期',
                    name: 'SignedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '申请日期',
                    name: 'ApplyDate',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                table: {
                    expand: '2',
                    pag:2,
                    objecttypecode: 10,
                    cmd: 'contract.report.dept.list',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.AccountId + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'BusinessUnitName',
                        title: '部门',
                        sortable: true,
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    },
                    {
                        field: 'Title',
                        title: '合同名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;' && value != undefined) {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sorter: function (a,b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value == null || value == undefined ? '' : value
                        },
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'TotalPrice',
                        title: '合同金额',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value == null || value == undefined ? '' : value
                        },
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }, {
                        field: 'PaidAmount',
                        title: '已付金额',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value == null || value == undefined ? '' : value
                        },
                        sorter: function (a, b) {
                            return (a > b ? 1 : -1);
                        }
                    }],
                    editoption: [
                        {
                            title: '查看详情',
                            f: function (Id, AccountId) {
                                if (Id=='undefined') {
                                    window.open('/800/detail?objectTypeCode=10&id=' + AccountId)
                                }
                                else{
                                    window.open('/800/detail?objectTypeCode=1010&id=' + Id)
                                }
                                    
                            },
                        }
                    ]
                }
            }]
        }
},
contractWorkflow: {
    template: {
        head: {
            title: '合同审批',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '批量驳回',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        //$('.popup-mask').show()
                        //var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount'
                        //$('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    },
                    n: 'btnContractAccount'
                }
            },
            {
                label: '批量批准',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        //$('.popup-mask').show()
                        //var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount'
                        //$('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    },
                    n: 'btnContractAccount'
                }
            }, {
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=contract.workflow.owner.task.getlist'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '我的待办',
            name: 'todo',
            summaryurl: '',
            searchform: [{
                label: '合同名称',
                name: 'ContractIdName',
                placeholder: "请填写内容",
                type: 'S',
            }, {
                label: '合同编号',
                name: 'ContractNumber',
                placeholder: "请填写内容",
                type: 'S',
            }, {
                label: '发起人',
                name: 'StartByName',
                placeholder: "请填写内容",
                type: 'S',
            },{
                label: '申请部门',
                name: 'BusinessUnitId',
                placeholder: "请填写内容",
                type: 'O',
                objtypecode: 10
            }, {
                label: '提交日期',
                name: 'WFRuleLogCreatedOn',
                placeholder: "请选择",
                type: 'D',
            },{
                label: '当前状态',
                name: 'InstanceStateCodeName',
                placeholder: "请选择",
                type: 'I',
            },
            ],
            issearchform: true,
            summary: [],
            table: {
                objecttypecode: 122,
                cmd: 'contract.workflow.owner.task.getlist',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [{
                    field: 'LIST_RECORD_ID',
                    checkbox: true
                },
                //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.WFRuleLogId + '" data-id="' + row.WFRuleLogId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.WFRuleLogId + '&source=l&retURL=%2f123%2fo" target="_blank">审批</a>'
                    }
                },
                {
                    field: 'ContractIdName',
                    title: '合同名称',
                    formatter: function formatter(value, row, index) {
                        if (value && value != '&nbsp;' && value != undefined) {
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                        return ''
                    },
                    sortable: true,
                }, {
                    field: 'ContractNumber',
                    title: '合同编号',
                    sortable: true,
                }, {
                    field: 'CategoryCodeName',
                    title: '审批类型',
                    sortable: true,
                }, {
                    field: 'TypeName',
                    title: '合同类型',
                    sortable: true,
                }, {
                    field: 'StartByName',
                    title: '发起人',
                    sortable: true,
                }, {
                    field: 'CreatedOn',
                    title: '发起时间',
                    sortable: true,
                }, {
                    field: 'ApplyDate',
                    title: '申请日期',
                    sortable: true,
                },
                {
                    field: 'FromActivityName',
                    title: '来源节点',
                    sortable: true,
                },
                {
                    field: 'CreatedByName',
                    title: '来源提交人',
                    sortable: true,
                },
                {
                    field: 'WFRuleLogCreatedOn',
                    title: '来源提交时间',
                    sortable: true,
                }
                ],
                editoption: [
                    {
                        title: '审批',
                        f: function (id) {
                            window.open('/a0M/e?id='+id+'&source=l&retURL=%2f123%2fo')
                            //lookupFieldView(id, 20211)
                            //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                    },
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '我的已办',
            name: 'doing',
            summaryurl: '',
            searchform: [{
                label: '合同名称',
                name: 'ContractIdName',
                placeholder: "请填写内容",
                type: 'S',
            }, {
                label: '合同编号',
                name: 'ContractNumber',
                placeholder: "请填写内容",
                type: 'S',
            }, {
                label: '发起人',
                name: 'StartByName',
                placeholder: "请填写内容",
                type: 'S',
            }, {
                label: '申请部门',
                name: 'BusinessUnitId',
                placeholder: "请选择",
                type: 'O',
                objtypecode: 10
            }, {
                label: '申请日期',
                name: 'ApplyDate',
                placeholder: "请选择",
                type: 'D',
            }, {
                label: '当前状态',
                name: 'InstanceStateCodeName',
                placeholder: "请选择",
                type: 'I',
            }],
            issearchform: true,
            summary: [],
            table: {
                objecttypecode: 122,
                cmd: 'contract.workflow.owner.getlist',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.LIST_RECORD_ID + '" data-id="' + row.LIST_RECORD_ID + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [{
                    field: 'LIST_RECORD_ID',
                    checkbox: true
                },
                //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.WFRuleLogId + '" data-id="' + row.WFRuleLogId + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" target="_blank" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=/contract/workflow/home?objTypeId=1010&name=contractWorkflow">查看</a>'

                    }
                },
                {
                    field: 'ContractIdName',
                    title: '合同名称',
                    formatter: function formatter(value, row, index) {
                        if (value && value != '&nbsp;' && value != undefined) {
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                        return ''
                    },
                    sortable: true,
                }, {
                    field: 'ContractNumber',
                    title: '合同编号',
                    sortable: true,
                }, {
                    field: 'TypeName',
                    title: '合同类型',
                    sortable: true,
                }, {
                    field: 'CategoryCodeName',
                    title: '审批类型',
                    sortable: true,
                }, {
                    field: 'StartByName',
                    title: '发起人',
                    sortable: true,
                }, {
                    field: 'CreatedOn',
                    title: '发起时间',
                    sortable: true,
                }, {
                    field: 'BusinessUnitIdName',
                    title: '申请部门',
                    sortable: true,
                }, {
                    field: 'ApplyDate',
                    title: '申请日期',
                    sortable: true,
                },
                {
                    field: 'CurrentStepName',
                    title: '当前步骤',
                    sortable: true,
                },
                {
                    field: 'InstanceStateCodeName',
                    title: '流程状态',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        if (value == '已完成') {
                            return '<span style="color:green;" >' + value + '</span>'
                        }
                        else {
                            return value
                        }
                    }
                },
                {
                    field: 'ProcessIdName',
                    title: '流程名称',
                    sortable: true,
                }
                ],
                editoption: [

                    {
                        title: '审批',
                        f: function (id) {
                            window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                            //lookupFieldView(id, 20211)
                            //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                    },
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        },
        ]
    }
},
contractSigning: {
    template: {
        head: {
            title: '合同签订报表',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=contract.signing.report'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '全部',
            name: 'todo',
            summaryurl: '',
            searchform: [
                {
                    label: '审批类型',
                    name: 'CategoryCode',
                    placeholder: "请选择",
                    type: 'CategoryCodeName',
                }, {
                    label: '合同类型',
                    name: 'Type',
                    placeholder: "请选择",
                    type: 'cntrtype',
                }, {
                    label: '创建日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '签订日期',
                    name: 'SignedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '申请日期',
                    name: 'ApplyDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 1010,
                cmd: 'contract.signing.report',
                filterquery: '\nStateCode\tgt\t0',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    {
                    field: 'Title',
                    title: '合同名称',
                    formatter: function formatter(value, row, index) {
                        if (value && value != '&nbsp;' && value != undefined) {
                            return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                        }
                        return ''
                    },
                    sortable: true,
                }, {
                    field: 'ContractNumber',
                    title: '合同编号',
                    sortable: true,
                }, {
                    field: 'CategoryCodeName',
                    title: '审批类型',
                    sortable: true,
                }, {
                    field: 'TypeName',
                    title: '合同类型',
                    sortable: true,
                }, {
                    field: 'ApplyDate',
                    title: '合同开始日期',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        return value ? (value.replace("T", " ")).replace(/\s[\x00-\xff]*/g, '') : '';
                    }
                }, {
                    field: 'ActiveOn',
                    title: '合同截至日期',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        return value ? (value.replace("T", " ")).replace(/\s[\x00-\xff]*/g, '') : '';
                    }
                }, {
                    field: 'TotalPrice',
                    title: '合同金额',
                    sortable: true,
                },{
                    field: 'StateCodeName',
                    title: '合同状态',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        return formatOperstatecode(value, row, index);
                    }
                }, {
                    field: 'SignedOn',
                    title: '合同签订日期',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        return value ? (value.replace("T", " ")).replace(/\s[\x00-\xff]*/g, '') : '';
                    }
                }, {
                    field: 'CreatedOn',
                    title: '合同创建日期',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        return value ? (value.replace("T", " ")).replace(/\s[\x00-\xff]*/g, '') : '';
                    }
                }, {
                    field: 'OwningBusinessUnitName',
                    title: '执行部门',
                    sortable: true,
                }, {
                    field: 'OwningUserName',
                    title: '执行人',
                    sortable: true,
                }, 
                
                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }
        ]
    }
},
cntrtStampduty: {
    template: {
        head: {
            title: '印花税报表',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=contract.signing.report'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '全部',
            name: 'todo',
            summaryurl: '',
            searchform: [
                {
                    label: '审批类型',
                    name: 'CategoryCode',
                    placeholder: "请选择",
                    type: 'CategoryCodeName',
                }, {
                    label: '合同类型',
                    name: 'Type',
                    placeholder: "请选择",
                    type: 'cntrtype',
                }, {
                    label: '创建日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '签订日期',
                    name: 'SignedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '领取日期',
                    name: 'LINGQURIQ',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 10190,
                cmd: 'contract.printed.items.report',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    },
                    {
                        field: 'Title',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;' && value != undefined) {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sortable: true,
                    },
                     {
                         field: 'TotalPrice',
                         title: '合同总金额',
                         sortable: true,
                     },
                     {
                         field: 'CategoryCodeName',
                        title: '审批类型',
                        sortable: true,
                     },
                     {
                         field: 'TypeName',
                         title: '合同类型',
                         sortable: true,
                     },
                    {
                        field: 'SignedOn',
                        title: '签订日期',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value ? (value.replace("T", " ")).replace(/\s[\x00-\xff]*/g, '') : '';
                        }
                    }, {
                        field: 'LINGQURIQ',
                        title: '领取日期',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value ? (value.replace("T", " ")).replace(/\s[\x00-\xff]*/g, '') : '';
                        }
                    }, {
                        field: 'StampDutyName',
                        title: '税目名称',
                        sortable: true,
                    }, {
                        field: 'TaxRate',
                        title: '税率',
                        sortable: true,
                    }, {
                        field: 'StampDutyAmount',
                        title: '税额',
                        sortable: true,
                    },
                
                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }
        ]
    }
},
cntrtchange: {
    template: {
        head: {
            title: '合同变更报表',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=contract.signing.report'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '全部',
            name: 'todo',
            summaryurl: '',
            searchform: [
                {
                    label: '审批类型',
                    name: 'CategoryCode',
                    placeholder: "请选择",
                    type: 'CategoryCodeName',
                }, {
                    label: '合同类型',
                    name: 'Type',
                    placeholder: "请选择",
                    type: 'cntrtype',
                }, {
                    label: '创建日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '签订日期',
                    name: 'SignedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '申请日期',
                    name: 'ApplyDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 10189,
                cmd: 'entity.lookup.search&lookupName=',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                    {
                        field: 'Name',
                        title: '名称',
                        sortable: true,
                    },
                    {
                        field: 'ContractId',
                        title: '合同',
                        sortable: true,
                    },
                    {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    },{
                        field: 'ApplyDate',
                        title: '申请日期',
                        sortable: true,
                    }, {
                        field: 'ChangeTypeCode',
                        title: '变更类型',
                        sortable: true,
                    }, {
                        field: 'StatusCode',
                        title: '审批状态',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }
        ]
    }
},

mineOfficialDocumentIn: {
    template: {
        head: {
            title: '我的收文',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=officialdocumentin.owner.list'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '待办收文',
            name: 'mineDocumentInTasks',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentInName',
                    placeholder: "请填写内容",
                    type: 'S',
                },{
                    label: '收文日期',
                    name: 'DocInDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100108,
                cmd: 'officialdocumentin.no.owner.list',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.WFRuleLogId + '&source=l&retURL=%2f123%2fo" target="_blank">办理</a>'
                    }
                },
                    {
                        field: 'OfficialDocumentInName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueOrg',
                        title: '来文单位',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '来文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '来文编号',
                        sortable: true,
                    }, {
                        field: 'DocInDate',
                        title: '收文日期',
                        sortable: true,
                    }, {
                        field: 'DocInNo',
                        title: '收文编号',
                        sortable: true,
                    }, {
                        field: 'EmergencyCode',
                        title: '紧急程度',
                        sortable: true,
                    }, {
                        field: 'StartByName',
                        title: '发起人',
                        sortable: true,
                    }, {
                        field: 'FromActivityName',
                        title: '来源节点',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'WFRuleLogCreatedOn',
                        title: '来源时间',
                        sortable: true,
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        },
        {
            label: '已办收文',
            name: 'mineDocumentInClosedTasks',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentInName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '收文日期',
                    name: 'DocInDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100108,
                cmd: 'officialdocumentin.wfprocessinstances.owner.list',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                    }
                },
                    {
                        field: 'OfficialDocumentInName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueOrg',
                        title: '来文单位',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '来文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '来文编号',
                        sortable: true,
                    }, {
                        field: 'DocInDate',
                        title: '收文日期',
                        sortable: true,
                    }, {
                        field: 'DocInNo',
                        title: '收文编号',
                        sortable: true,
                    }, {
                        field: 'EmergencyCode',
                        title: '紧急程度',
                        sortable: true,
                    }, {
                        field: 'StartByName',
                        title: '发起人',
                        sortable: true,
                    }, {
                        field: 'CurrentStepName',
                        title: '当前节点',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'WFProcessInstanceStateCodeName',
                        title: '流程状态',
                        sortable: true,
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '已读',
            name: 'mineDocumentInRead',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentInName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '收文日期',
                    name: 'DocInDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100108,
                cmd: 'officialdocumentin.isread.owner.list&Type=1',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                    }
                },
                    {
                        field: 'OfficialDocumentInName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueOrg',
                        title: '来文单位',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '来文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '来文编号',
                        sortable: true,
                    }, {
                        field: 'DocInDate',
                        title: '收文日期',
                        sortable: true,
                    }, {
                        field: 'DocInNo',
                        title: '收文编号',
                        sortable: true,
                    },{
                        field: 'StartByName',
                        title: '发起人',
                        sortable: true,
                    },{
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    },{
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '未读',
            name: 'mineDocumentInUnread',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentInName',
                    placeholder: "请填写内容",
                    type: 'S',
                },{
                    label: '收文日期',
                    name: 'DocInDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100108,
                cmd: 'officialdocumentin.isread.owner.list&Type=2',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                    }
                },
                    {
                        field: 'OfficialDocumentInName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueOrg',
                        title: '来文单位',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '来文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '来文编号',
                        sortable: true,
                    }, {
                        field: 'DocInDate',
                        title: '收文日期',
                        sortable: true,
                    }, {
                        field: 'DocInNo',
                        title: '收文编号',
                        sortable: true,
                    }, {
                        field: 'StartByName',
                        title: '发起人',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
        label: '我的发起',
        name: 'mineDocumentIn',
        summaryurl: '',
        searchform: [
            {
                label: '标题',
                name: 'OfficialDocumentInName',
                placeholder: "请填写内容",
                type: 'S',
            },{
                label: '收文日期',
                name: 'DocInDate',
                placeholder: "请选择",
                type: 'D',
            },
        ],
        issearchform: true,
        summary: [],
        table: {
            expand: '3',
            pag: 2,
            objecttypecode: 100108,
            cmd: 'officialdocumentin.owner.list&type=2',
            filterquery: '',
            formatOper: function (value, row, index) {
                return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
            },
            columnsArray: [
                //{
            //    field: 'Action',
            //    title: '操作',
            //    formatter: function formatter(value, row, index) {
            //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

            //    }
            //},
            {
                field: 'Action',
                title: '操作',
                formatter: function formatter(value, row, index) {
                    return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                }
            },
                {
                    field: 'OfficialDocumentInName',
                    title: '标题',
                    sortable: true,
                },
                {
                    field: 'IssueOrg',
                    title: '来文单位',
                    sortable: true,
                },
                {
                    field: 'IssueDate',
                    title: '来文日期',
                    sortable: true,
                }, {
                    field: 'DocumentTypeCode',
                    title: '文种',
                    sortable: true,
                }, {
                    field: 'DocumentNo',
                    title: '来文编号',
                    sortable: true,
                }, {
                    field: 'DocInDate',
                    title: '收文日期',
                    sortable: true,
                }, {
                    field: 'DocInNo',
                    title: '收文编号',
                    sortable: true,
                }, {
                    field: 'EmergencyCode',
                    title: '紧急程度',
                    sortable: true,
                }, {
                    field: 'StartByName',
                    title: '发起人',
                    sortable: true,
                }, {
                    field: 'CurrentStepName',
                    title: '当前节点',
                    sortable: true,
                }, {
                    field: 'CreatedByName',
                    title: '提交人',
                    sortable: true,
                }, {
                    field: 'WFProcessInstanceStateCodeName',
                    title: '流程状态',
                    sortable: true,
                }, {
                    field: 'ProcessIdName',
                    title: '流程名称',
                    sortable: true,
                }, {
                    field: 'CreatedOn',
                    title: '创建日期',
                    sortable: true,
                },

            ],
            editoption: [
                //{
                //    title: '查看',
                //    f: function (id) {
                //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                //        //lookupFieldView(id, 20211)
                //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                //    },
                //},
                //{
                //    title: '编辑',
                //    f: function (id) {
                //        $('.popup-mask').show()
                //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                //    },
                //},
                //{
                //    title: '删除',
                //    f: function (id) {
                //        $('.popup-mask').show()
                //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                //    },
                //},
            ]
        }
        }, {
            label: '草稿箱',
            name: 'mineDocumentInDraft',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentInName',
                    placeholder: "请填写内容",
                    type: 'S',
                },{
                    label: '收文日期',
                    name: 'DocInDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100108,
                cmd: 'officialdocumentin.owner.list&type=1',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<div><a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo")\' target="_blank">修改</a>&nbsp;&nbsp;<span style="color:blue;cursor: pointer;" onclick=\'deleted(100108,"' + row.LIST_RECORD_ID + '")\'>删除</span></div>'

                    }
                },
                    {
                        field: 'OfficialDocumentInName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueOrg',
                        title: '来文单位',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '来文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '来文编号',
                        sortable: true,
                    }, {
                        field: 'DocInDate',
                        title: '收文日期',
                        sortable: true,
                    }, {
                        field: 'DocInNo',
                        title: '收文编号',
                        sortable: true,
                    }, {
                        field: 'EmergencyCode',
                        title: '紧急程度',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'WFProcessInstanceStateCodeName',
                        title: '流程状态',
                        sortable: true,
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true,
                    }, {
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    }, 

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }
        ]
    }
},
mineOfficialDocumentOut: {
    template: {
        head: {
            title: '我的发文',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=officialdocumentout.owner.list'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '待办发文',
            name: 'mineDocumentOutTasks',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentOutName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发文日期',
                    name: 'IssueDate',
                    placeholder: "请选择",
                    type: 'D',
                }
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100109,
                cmd: 'officialdocumentout.no.owner.list',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.WFRuleLogId + '&source=l&retURL=%2f123%2fo" target="_blank">办理</a>'
                    }
                },
                    {
                        field: 'OfficialDocumentOutName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '发文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '发文编号',
                        sortable: true,
                    },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发文部门',
                        sortable: true,
                    },
                    {
                        field: 'Author',
                        title: '拟稿人',
                        sortable: true,
                    }, {
                        field: 'StartByName',
                        title: '发起人',
                        sortable: true,
                    }, {
                        field: 'FromActivityName',
                        title: '来源节点',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'WFRuleLogCreatedOn',
                        title: '来源时间',
                        sortable: true,
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        },
        {
            label: '已办发文',
            name: 'mineDocumentOutClosedTasks',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentOutName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发文日期',
                    name: 'IssueDate',
                    placeholder: "请选择",
                    type: 'D',
                }
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100109,
                cmd: 'officialdocumentout.wfprocessinstances.owner.list',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                    }
                },
                    {
                        field: 'OfficialDocumentOutName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '发文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '发文编号',
                        sortable: true,
                    },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发文部门',
                        sortable: true,
                    },
                    {
                        field: 'Author',
                        title: '拟稿人',
                        sortable: true,
                    }, {
                        field: 'StartByName',
                        title: '发起人',
                        sortable: true,
                    }, {
                        field: 'CurrentStepName',
                        title: '当前节点',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'WFProcessInstanceStateCodeName',
                        title: '流程状态',
                        sortable: true,
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '已读',
            name: 'mineDocumentOutRead',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentOutName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发文日期',
                    name: 'IssueDate',
                    placeholder: "请选择",
                    type: 'D',
                }
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100109,
                cmd: 'officialdocumentout.isread.owner.list&Type=1',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                    }
                },
                    {
                        field: 'OfficialDocumentOutName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '发文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '发文编号',
                        sortable: true,
                    },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发文部门',
                        sortable: true,
                    },
                    {
                        field: 'Author',
                        title: '拟稿人',
                        sortable: true,
                    },
                    {
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '未读',
            name: 'mineDocumentOutUnread',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentOutName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发文日期',
                    name: 'IssueDate',
                    placeholder: "请选择",
                    type: 'D',
                }
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100109,
                cmd: 'officialdocumentout.isread.owner.list&Type=2',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                    }
                },
                    {
                        field: 'OfficialDocumentOutName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '发文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '发文编号',
                        sortable: true,
                    },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发文部门',
                        sortable: true,
                    },
                    {
                        field: 'Author',
                        title: '拟稿人',
                        sortable: true,
                    },
                    {
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '我的发起',
            name: 'mineDocumentOut',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentOutName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发文日期',
                    name: 'IssueDate',
                    placeholder: "请选择",
                    type: 'D',
                }
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100109,
                cmd: 'officialdocumentout.owner.list&type=2',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                    }
                },
                    {
                        field: 'OfficialDocumentOutName',
                        title: '标题',
                        sortable: true,
                    },
                    {
                        field: 'IssueDate',
                        title: '发文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '发文编号',
                        sortable: true,
                    },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发文部门',
                        sortable: true,
                    },
                    {
                        field: 'Author',
                        title: '拟稿人',
                        sortable: true,
                    }, {
                        field: 'StartByName',
                        title: '发起人',
                        sortable: true,
                    }, {
                        field: 'CurrentStepName',
                        title: '当前节点',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'WFProcessInstanceStateCodeName',
                        title: '流程状态',
                        sortable: true,
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true,
                    }, {
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '草稿箱',
            name: 'mineDocumentOutDraft',
            summaryurl: '',
            searchform: [
                {
                    label: '标题',
                    name: 'OfficialDocumentOutName',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发文日期',
                    name: 'IssueDate',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 100109,
                cmd: 'officialdocumentout.owner.list&type=1',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                {
                    field: 'Action',
                    title: '操作',
                    formatter: function formatter(value, row, index) {
                        return '<div><a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo")\' target="_blank">修改</a>&nbsp;&nbsp;<span style="color:blue;cursor: pointer;" onclick=\'deleted(100109,"' + row.LIST_RECORD_ID + '")\'>删除</span></div>'

                    }
                },
                   {
                       field: 'OfficialDocumentOutName',
                       title: '标题',
                       sortable: true,
                   },
                    {
                        field: 'IssueDate',
                        title: '发文日期',
                        sortable: true,
                    }, {
                        field: 'DocumentTypeCode',
                        title: '文种',
                        sortable: true,
                    }, {
                        field: 'DocumentNo',
                        title: '发文编号',
                        sortable: true,
                    },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发文部门',
                        sortable: true,
                    },
                    {
                        field: 'Author',
                        title: '拟稿人',
                        sortable: true,
                    }, {
                        field: 'CreatedByName',
                        title: '提交人',
                        sortable: true,
                    }, {
                        field: 'WFProcessInstanceStateCodeName',
                        title: '流程状态',
                        sortable: true,
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true,
                    }, {
                        field: 'CreatedOn',
                        title: '创建日期',
                        sortable: true,
                    },

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }
        ]
    }
},
contractRemind: {
    template: {
        head: {
            title: '合同提醒',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        var url = '/apps/CommandProcessor.ashx?cmd=officialdocumentout.owner.list'
                        var data = {}
                        var filterQuery = mylayout.activetab.table.filterquerystring
                        if (filterQuery) {
                            data.filterQuery = filterQuery
                        }
                        openWindowWithPost(url, data)
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '即将过期合同',
            name: 'expiringcontract',
            summaryurl: '',
            searchform: [
                {
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                },
                {
                    label: '合同编号',
                    name: 'ContractNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                //{
                //    label: '审批类型',
                //    name: ' CategoryCode',
                //    placeholder: "请选择",
                //    type: 'CategoryCodeName',
                //},
                {
                    label: '归口部门',
                    name: 'GUIKOUBUMENName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '合同类型',
                    name: 'TypeName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '申请时间',
                    name: 'ApplyDate',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '截止时间',
                    name: 'ExpiresOn',
                    placeholder: "请选择",
                    type: 'D',
                }
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 1010,
                cmd: 'contract.remind.expiring.getliset&type=1',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                //    }
                //},
                    {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    },
                    {
                        field: 'ContractIdTitle',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;' && value != undefined) {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sortable: true,
                    },
                    {
                        field: 'TotalPrice',
                        title: '合同金额',
                        sortable: true,
                    },
                    //{
                    //    field: 'CategoryCodeName',
                    //    title: '审批类型',
                    //    sortable: true,
                    //},
                    {
                        field: 'GUIKOUBUMENName',
                        title: '归口部门',
                        sortable: true,
                    },
                    {
                        field: 'TypeName',
                        title: '合同类型',
                        sortable: true,
                    },
                    {
                        field: 'ApplyDate',
                        title: '申请时间',
                        sortable: true,
                    },
                    {
                        field: 'ExpiresOn',
                        title: '截止时间',
                        sortable: true,
                    },
                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }, {
            label: '已过期合同',
            name: 'expiredcontract',
            summaryurl: '',
            searchform: [
                {
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                },
                {
                    label: '合同编号',
                    name: 'ContractNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                //{
                //    label: '审批类型',
                //    name: ' CategoryCode',
                //    placeholder: "请选择",
                //    type: 'CategoryCodeName',
                //},
                {
                    label: '归口部门',
                    name: 'GUIKOUBUMENName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '合同类型',
                    name: 'TypeName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '申请时间',
                    name: 'ApplyDate',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '截止时间',
                    name: 'ExpiresOn',
                    placeholder: "请选择",
                    type: 'D',
                }
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 1010,
                cmd: 'contract.remind.expiring.getliset&type=2',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div><a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo")\' target="_blank">修改</a>&nbsp;&nbsp;<span style="color:blue;cursor: pointer;" onclick=\'deleted(100109,"' + row.LIST_RECORD_ID + '")\'>删除</span></div>'

                //    }
                //},
                   {
                       field: 'ContractNumber',
                       title: '合同编号',
                       sortable: true,
                   },
                    {
                        field: 'ContractIdTitle',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;' && value != undefined) {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sortable: true,
                    },
                    {
                        field: 'TotalPrice',
                        title: '合同金额',
                        sortable: true,
                    },
                    //{
                    //    field: 'CategoryCodeName',
                    //    title: '审批类型',
                    //    sortable: true,
                    //},
                    {
                        field: 'GUIKOUBUMENName',
                        title: '归口部门',
                        sortable: true,
                    },
                    {
                        field: 'TypeName',
                        title: '合同类型',
                        sortable: true,
                    },
                    {
                        field: 'ApplyDate',
                        title: '申请时间',
                        sortable: true,
                    },
                    {
                        field: 'ExpiresOn',
                        title: '截止时间',
                        sortable: true,
                    },
                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        },
        {
            label: '收款计划',
            name: 'receiveplan',
            summaryurl: '',
            searchform: [
               {
                   label: '合同名称',
                   name: 'ContractId',
                   placeholder: "请填写内容",
                   type: 'O',
                   objtypecode: 1010
               },
                {
                    label: '合同编号',
                    name: 'ContractNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                //{
                //    label: '审批类型',
                //    name: 'ContractIdCategoryCode',
                //    placeholder: "请选择",
                //    type: 'CategoryCodeName',
                //},
                {
                    label: '归口部门',
                    name: 'ContractIdGUIKOUBUMENName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '合同类型',
                    name: 'ContractIdTypeName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                {
                    label: '类型',
                    name: 'type',
                    placeholder: "请选择",
                    type: 'expiretype',
                },
                {
                    label: '申请时间',
                    name: 'ContractIdApplyDate',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '计划付款时间',
                    name: 'PlanPayOn',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 1012,
                cmd: 'contract.plan.remind.getliset&contracttype=1',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div><a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo")\' target="_blank">修改</a>&nbsp;&nbsp;<span style="color:blue;cursor: pointer;" onclick=\'deleted(100109,"' + row.LIST_RECORD_ID + '")\'>删除</span></div>'

                //    }
                //},
                    {
                        field: 'ContractNumber',
                        title: '合同编号',
                        sortable: true,
                    },
                    {
                        field: 'ContractIdTitle',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;' && value != undefined) {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sortable: true,
                    },
                    {
                        field: 'Amount',
                        title: '计划金额',
                        sortable: true,
                    },
                    //{
                    //    field: 'CategoryCodeName',
                    //    title: '审批类型',
                    //    sortable: true,
                    //},
                    {
                        field: 'ContractIdGUIKOUBUMENName',
                        title: '归口部门',
                        sortable: true,
                    },
                    {
                        field: 'ContractIdTypeName',
                        title: '合同类型',
                        sortable: true,
                    },
                    {
                        field: 'ContractIdApplyDate',
                        title: '申请时间',
                        sortable: true,
                    },
                    {
                        field: 'PlanPayOn',
                        title: '计划付款时间',
                        sortable: true,
                    },
                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        },
        {
            label: '付款计划',
            name: 'payplan',
            summaryurl: '',
            searchform: [
                {
                    label: '合同名称',
                    name: 'ContractId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 1010
                },
                {
                    label: '合同编号',
                    name: 'ContractNumber',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                //{
                //    label: '审批类型',
                //    name: 'ContractIdCategoryCode',
                //    placeholder: "请选择",
                //    type: 'CategoryCodeName',
                //},
                {
                    label: '归口部门',
                    name: 'ContractIdGUIKOUBUMENName',
                    placeholder: "请填写内容",
                    type: 'S',
                },
                    {
                        label: '合同类型',
                        name: 'ContractIdTypeName',
                        placeholder: "请填写内容",
                        type: 'S',
                },
                {
                    label: '类型',
                    name: 'type',
                    placeholder: "请选择",
                    type: 'expiretype',
                },
                {
                    label: '申请时间',
                    name: 'ContractIdApplyDate',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '计划付款时间',
                    name: 'PlanPayOn',
                    placeholder: "请选择",
                    type: 'D',
                },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 1012,
                cmd: 'contract.plan.remind.getliset&contracttype=2',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div><a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo")\' target="_blank">修改</a>&nbsp;&nbsp;<span style="color:blue;cursor: pointer;" onclick=\'deleted(100109,"' + row.LIST_RECORD_ID + '")\'>删除</span></div>'

                //    }
                //},
                {
                    field: 'ContractNumber',
                    title: '合同编号',
                    sortable: true,
                },
                    {
                        field: 'ContractIdTitle',
                        title: '合同名称',
                        formatter: function formatter(value, row, index) {
                            if (value && value != '&nbsp;' && value != undefined) {
                                return '<a style="color:blue;" href="/800/detail?objectTypeCode=1010&id=' + row.ContractId + '" target="_blank">' + value + '</a>'
                            }
                            return ''
                        },
                        sortable: true,
                    },
                    {
                        field: 'Amount',
                        title: '计划金额',
                        sortable: true,
                    },
                    //{
                    //    field: 'CategoryCodeName',
                    //    title: '审批类型',
                    //    sortable: true,
                    //},
                    {
                        field: 'ContractIdGUIKOUBUMENName',
                        title: '归口部门',
                        sortable: true,
                    },
                    {
                        field: 'ContractIdTypeName',
                        title: '合同类型',
                        sortable: true,
                    },
                    {
                        field: 'ContractIdApplyDate',
                        title: '申请时间',
                        sortable: true,
                    },
                    {
                        field: 'PlanPayOn',
                        title: '计划付款时间',
                        sortable: true,
                    },
               
                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        },
        
        ]
    }
},

centralizedContract: {
    template: {
        head: {
            title: '归口合同报表',
            logo: '/template/hearder/logo.png',
            btns: [{
                label: '搜索',
                type: 'layui-btn-normal',
                click: {
                    f: function () {

                    },
                    n: 'reloadgrided'
                }
            },
            {
                label: '导出',
                type: 'layui-btn-normal',
                click: {
                    f: function () {
                        
                    },
                    n: 'exported'
                }
            }]
        },
        tabs: [{
            label: '全部',
            name: 'todo',
            summaryurl: '',
            searchform: [
                {
                    label: '归口部门',
                    name: 'GUIKOUBUMEN',
                    placeholder: "请填写内容",
                    type: 'centralizedDept',
                },
                 {
                     label: '签订日期',
                     name: 'SignedOn',
                     placeholder: "请选择",
                     type: 'D',
                 },
                 {
                     label: '申请日期',
                     name: 'ApplyDate',
                     placeholder: "请选择",
                     type: 'D',
                 },
            ],
            issearchform: true,
            summary: [],
            table: {
                expand: '3',
                pag: 2,
                objecttypecode: 1010,
                cmd: 'contract.report.gukoubumen.getlist',
                filterquery: '',
                formatOper: function (value, row, index) {
                    return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                },
                columnsArray: [
                    //{
                //    field: 'Action',
                //    title: '操作',
                //    formatter: function formatter(value, row, index) {
                //        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'

                //    }
                //},
                    {
                        field: 'GUIKOUBUMENName',
                        title: '归口部门',
                        sortable: true,
                    },
                    {
                        field: 'DfkAmount',
                        title: '待付款金额',
                        sortable: true,
                    },
                    {
                        field: 'LzzAmount',
                        title: '流转中金额',
                        sortable: true,
                    }, {
                        field: 'WzxAmount',
                        title: '未执行金额',
                        sortable: true,
                    }

                ],
                editoption: [
                    //{
                    //    title: '查看',
                    //    f: function (id) {
                    //        window.open('/a0M/e?id=' + id + '&source=l&retURL=%2f123%2fo')
                    //        //lookupFieldView(id, 20211)
                    //        //$('#iframe').height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '编辑',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/layouteditor/add_layout_ie8.html?entityName=ContractAccount&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                    //    },
                    //},
                    //{
                    //    title: '删除',
                    //    f: function (id) {
                    //        $('.popup-mask').show()
                    //        var url = '/alert/delete_ie8.html?objtypecode=20211&id=' + id;
                    //        $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
                    //    },
                    //},
                ]
            }
        }
        ]
    }
},





}

var timeoperator = [{
    label: '今天',
    value: 'today',
}, {
    label: '昨天',
    value: 'yesterday',
}, {
    label: '明天',
    value: 'tomorrow',
}, {
    label: '本周',
    value: 'this-week',
}, {
    label: '本月',
    value: 'this-month',
}, {
    label: '上月',
    value: 'last-month',
}, {
    label: '下月',
    value: 'next-month',
}, {
    label: '今年',
    value: 'this-year',
}, {
    label: '去年',
    value: 'last-year',
},{
    label: '本月生日',
    value: 'birthday-this-month',
}, ]
var stateoperator = [{
    label: '草稿',
    value: '0',
}, {
    label: '已开发票',
    value: '1',
}, {
    label: '执行中',
    value: '2',
}, {
    label: '暂停',
    value: '3',
}, {
    label: '已取消',
    value: '4',
}, {
    label: '已过期',
    value: '5',
}, {
    label: '中止',
    value: '6',
}]
var instanceoperator = [{
    label: '草稿',
    value: '0',
}, {
    label: '审批中',
    value: '1',
}, {
    label: '挂起',
    value: '2',
}, {
    label: '已完成',
    value: '3',
},{
    label: '已退回',
    value: '5',
}]
var planoperator = [{
    label: '未开始',
    value: 0,
}, {
    label: '审批中',
    value: 1,
}, {
    label: '暂停',
    value: 2,
}, {
    label: '已付款',
    value: 3,
}]
var StateCodeOption = [{
    label: '草稿',
    value: '0',
}, {
    label: '履行中',
    value: '1',
}, {
    label: '已完成',
    value: '2',
}, {
    label: '暂停',
    value: '3',
}, {
    label: '终止',
    value: '4',
}, {
    label: '解约',
    value: '5',
}, {
    label: '变更',
    value: '6',
}]
var contractType = [{
    label: '技术合同',
    value: '0',
}, {
    label: '购销合同',
    value: '1',
}, {
    label: '加工承揽合同',
    value: '2',
}, {
    label: '财产租赁合同',
    value: '3',
}, {
    label: '仓储保管合同',
    value: '4',
}, {
    label: '货物运输合同',
    value: '5',
}, {
    label: '财产保险合同',
    value: '6',
},{
    label: '建设工程勘察设计合同',
    value: '7',
}, {
    label: '建筑安装工程承包合同',
    value: '8',
}]
var CategoryCodeName = [{
    label: '政采',
    value: 0,
}, {
    label: '科研',
    value: 1,
}, {
    label: '经济',
    value: 2,
}]
var expiretype = [{
    label: '即将过期',
    value: 1,
}, {
    label: '已过期',
    value: 2,
}]
var centralizedDept = [{
    label: '审计处',
    value: 0,
}, {
    label: '信息中心',
    value: 1,
}]