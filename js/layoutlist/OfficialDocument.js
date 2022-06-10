var layoutdata = {
    requesturl: '/apps/CommandProcessor.ashx?cmd=',
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
                label: '未读',
                name: 'mineDocumentInUnread',
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
                            field: 'AuthorName',
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
                            field: 'AuthorName',
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
                            field: 'AuthorName',
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
                            field: 'AuthorName',
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
                            field: 'AuthorName',
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
                            field: 'AuthorName',
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
    docOutlst: {
        template: {
            head: {
                title: '发文管理',
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
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docouttype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100109,
                    cmd: 'entitygrid.list&entityType=A09&sort=IssueDate&order=asc',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                        {
                            field: 'Name',
                            title: '标题',
                            sortable: true,
                        },
                        {
                            field: 'CreatedByName',
                            title: '创建人',
                            sortable: true,
                        },
                        {
                            field: 'IssueDate',
                            title: '创建时间',
                            sortable: true,
                        }, 
                        {
                            field: 'ModifiedOn',
                            title: '上一次修改时间',
                            sortable: true,
                        }, {
                            field: 'DocumentTypeCode',
                            title: '文种',
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
                label: '已完成',
                name: 'state3',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docouttype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100109,
                    cmd: 'entitygrid.list&entityType=A09&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t3',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                        {
                            field: 'Name',
                            title: '标题',
                            sortable: true,
                        },
                        {
                            field: 'CreatedByName',
                            title: '创建人',
                            sortable: true,
                        },
                        {
                            field: 'IssueDate',
                            title: '创建时间',
                            sortable: true,
                        },
                        {
                            field: 'ModifiedOn',
                            title: '上一次修改时间',
                            sortable: true,
                        }, {
                            field: 'DocumentTypeCode',
                            title: '文种',
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
                label: '搁置',
                name: 'state2',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docouttype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100109,
                    cmd: 'entitygrid.list&entityType=A09&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t2',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);

                        }
                    },
                        {
                            field: 'Name',
                            title: '标题',
                            sortable: true,
                        },
                        {
                            field: 'CreatedByName',
                            title: '创建人',
                            sortable: true,
                        },
                        {
                            field: 'IssueDate',
                            title: '创建时间',
                            sortable: true,
                        },
                        {
                            field: 'ModifiedOn',
                            title: '上一次修改时间',
                            sortable: true,
                        }, {
                            field: 'DocumentTypeCode',
                            title: '文种',
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
                label: '流转中',
                name: 'state1',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docouttype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100109,
                    cmd: 'entitygrid.list&entityType=A09&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t1',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);

                        }
                    },
                        {
                            field: 'Name',
                            title: '标题',
                            sortable: true,
                        },
                        {
                            field: 'CreatedByName',
                            title: '创建人',
                            sortable: true,
                        },
                        {
                            field: 'IssueDate',
                            title: '创建时间',
                            sortable: true,
                        },
                        {
                            field: 'ModifiedOn',
                            title: '上一次修改时间',
                            sortable: true,
                        }, {
                            field: 'DocumentTypeCode',
                            title: '文种',
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
                label: '草稿',
                name: 'state0',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docouttype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100109,
                    cmd: 'entitygrid.list&entityType=A09&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t0',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);

                        }
                    },
                        {
                            field: 'Name',
                            title: '标题',
                            sortable: true,
                        },
                        {
                            field: 'CreatedByName',
                            title: '创建人',
                            sortable: true,
                        },
                        {
                            field: 'IssueDate',
                            title: '创建时间',
                            sortable: true,
                        },
                        {
                            field: 'ModifiedOn',
                            title: '上一次修改时间',
                            sortable: true,
                        }, {
                            field: 'DocumentTypeCode',
                            title: '文种',
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






    docInlst: {
        template: {
            head: {
                title: '收文查询',
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
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docintype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100108,
                    cmd: 'entitygrid.list&entityType=A08&sort=IssueDate&order=asc',
                    filterquery: '',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper2(value, row, index);
                        }
                    },
                        {
                            field: 'Name',
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
                label: '已完成',
                name: 'state3',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docintype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100108,
                    cmd: 'entitygrid.list&entityType=A08&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t3',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper2(value, row, index);

                        }
                    },
                        {
                            field: 'Name',
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
                label: '搁置',
                name: 'state2',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docintype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100108,
                    cmd: 'entitygrid.list&entityType=A08&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t2',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper2(value, row, index);

                        }
                    },
                        {
                            field: 'Name',
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
                label: '流转中',
                name: 'state1',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docintype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100108,
                    cmd: 'entitygrid.list&entityType=A08&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t1',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper2(value, row, index);

                        }
                    },
                        {
                            field: 'Name',
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
                label: '草稿',
                name: 'state0',
                summaryurl: '',
                searchform: [
                    {
                        label: '标题',
                        name: 'Name',
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
                treeentity: 'docintype',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    expand: '3',
                    pag: 2,
                    objecttypecode: 100108,
                    cmd: 'entitygrid.list&entityType=A08&sort=IssueDate&order=asc',
                    filterquery: '\nStatusCode\teq\t0',
                    formatOper: function (value, row, index) {
                        return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                    },
                    columnsArray: [
                    {
                        field: 'Action',
                        title: '操作',
                        formatter: function formatter(value, row, index) {
                            return formatOper2(value, row, index);

                        }
                    },
                        {
                            field: 'Name',
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
            }, 
            ]
        }
    },






    officialDocumentInReadlog: {
        template: {
            head: {
                title: '阅读日志',
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
            tabs: [
                {
                    label: '收文未读',
                    name: 'innoread',
                    summaryurl: '',
                    searchform: [
                        {
                            label: '标题',
                            name: 'OfficialDocumentInName',
                            placeholder: "请填写内容",
                            type: 'S',
                        },{
                            label: '姓名',
                            name: 'FavoriteUserIdName',
                            placeholder: "请填写内容",
                            type: 'S',
                        }, {
                            label: '收文日期',
                            name: 'IssueDate',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '阅读时间',
                            name: 'ReadOn',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '发起时间',
                            name: 'FavoriteCreatedOn',
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
                        cmd: 'officialdocumentin.isread.all.list&type=2',
                        filterquery: '',
                        formatOper: function (value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        },
                        columnsArray: [
                        {
                            field: 'Action',
                            title: '操作',
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                            }
                        },
                        {
                            field: 'DocumentNo',
                            title: '收文编号',
                            sortable: true,
                        },
                        {
                            field: 'OfficialDocumentInName',
                            title: '收文标题',
                            sortable: true,
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">' + value + '</a>'

                            }
                        },
                        {
                            field: 'IssueDate',
                            title: '收文时间',
                            sortable: true,
                        },
                        {
                            field: 'DocumentTypeCode',
                            title: '文种',
                            sortable: true,
                        },
                        {
                            field: 'BusinessUnitIdName',
                            title: '收文部门',
                            sortable: true,
                        },
                       {
                           field: 'FavoriteCreatedOn',
                           title: '发起时间',
                           sortable: true,
                       }, {
                           field: 'FavoriteUserIdName',
                           title: '阅读人',
                           sortable: true,
                       }, {
                           field: 'ReadOn',
                           title: '阅读时间',
                           sortable: true,
                       }, {
                           field: 'IsReadName',
                           title: '是否阅读',
                           sortable: true,
                       }, {
                           field: 'CurrentStepName',
                           title: '当前节点',
                           sortable: true,
                       }, {
                           field: 'WFProcessInstanceStateCodeName',
                           title: '流程状态',
                           sortable: true,
                       }, {
                           field: 'ModifiedOn',
                           title: '修改时间',
                           sortable: true,
                       },
                        {
                            field: 'ModifiedByName',
                            title: '修改人',
                            sortable: true,
                        },
                        ],
                        editoption: [

                        ]
                    }
                },
                {
                    label: '收文已读',
                    name: 'inisread',
                    summaryurl: '',
                    searchform: [
                        {
                            label: '标题',
                            name: 'OfficialDocumentInName',
                            placeholder: "请填写内容",
                            type: 'S',
                        }, {
                            label: '姓名',
                            name: 'FavoriteUserIdName',
                            placeholder: "请填写内容",
                            type: 'S',
                        }, {
                            label: '收文日期',
                            name: 'IssueDate',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '阅读时间',
                            name: 'ReadOn',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '发起时间',
                            name: 'FavoriteCreatedOn',
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
                        cmd: 'officialdocumentin.isread.all.list&type=1',
                        filterquery: '',
                        formatOper: function (value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        },
                        columnsArray: [
                        {
                            field: 'Action',
                            title: '操作',
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                            }
                        },
                        {
                            field: 'DocumentNo',
                            title: '收文编号',
                            sortable: true,
                        },
                        {
                            field: 'OfficialDocumentInName',
                            title: '收文标题',
                            sortable: true,
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">' + value + '</a>'

                            }
                        },
                        {
                            field: 'IssueDate',
                            title: '收文时间',
                            sortable: true,
                        },
                        {
                            field: 'DocumentTypeCode',
                            title: '文种',
                            sortable: true,
                        },
                        {
                            field: 'BusinessUnitIdName',
                            title: '收文部门',
                            sortable: true,
                        },
                       {
                           field: 'FavoriteCreatedOn',
                           title: '发起时间',
                           sortable: true,
                       }, {
                           field: 'FavoriteUserIdName',
                           title: '阅读人',
                           sortable: true,
                       }, {
                           field: 'ReadOn',
                           title: '阅读时间',
                           sortable: true,
                       }, {
                           field: 'IsReadName',
                           title: '是否阅读',
                           sortable: true,
                       }, {
                           field: 'CurrentStepName',
                           title: '当前节点',
                           sortable: true,
                       }, {
                           field: 'WFProcessInstanceStateCodeName',
                           title: '流程状态',
                           sortable: true,
                       }, {
                           field: 'ModifiedOn',
                           title: '修改时间',
                           sortable: true,
                       },
                        {
                            field: 'ModifiedByName',
                            title: '修改人',
                            sortable: true,
                        },
                        ],
                        editoption: [

                        ]
                    }
                },
                {
                    label: '发文未读',
                    name: 'outnoread',
                    summaryurl: '',
                    searchform: [
                        {
                            label: '标题',
                            name: 'OfficialDocumentOutName',
                            placeholder: "请填写内容",
                            type: 'S',
                        }, {
                            label: '姓名',
                            name: 'FavoriteUserIdName',
                            placeholder: "请填写内容",
                            type: 'S',
                        }, {
                            label: '发文日期',
                            name: 'IssueDate',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '阅读时间',
                            name: 'ReadOn',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '发起时间',
                            name: 'FavoriteCreatedOn',
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
                        cmd: 'officialdocumentout.isread.all.list&type=2',
                        filterquery: '',
                        formatOper: function (value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        },
                        columnsArray: [
                        {
                            field: 'Action',
                            title: '操作',
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                            }
                        },
                        {
                            field: 'DocumentNo',
                            title: '发文编号',
                            sortable: true,
                        },
                        {
                            field: 'OfficialDocumentOutName',
                            title: '发文标题',
                            sortable: true,
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">' + value + '</a>'

                            }
                        },
                        {
                            field: 'IssueDate',
                            title: '发文时间',
                            sortable: true,
                        },
                        {
                            field: 'DocumentTypeCode',
                            title: '文种',
                            sortable: true,
                        },
                        {
                            field: 'BusinessUnitIdName',
                            title: '发文部门',
                            sortable: true,
                        },
                        {
                            field: 'AuthorName',
                            title: '拟稿人',
                            sortable: true,
                        }, {
                            field: 'FavoriteCreatedOn',
                            title: '发起时间',
                            sortable: true,
                        }, {
                            field: 'FavoriteUserIdName',
                            title: '阅读人',
                            sortable: true,
                        }, {
                            field: 'ReadOn',
                            title: '阅读时间',
                            sortable: true,
                        }, {
                            field: 'CurrentStepName',
                            title: '当前节点',
                            sortable: true,
                        }, {
                            field: 'WFProcessInstanceStateCodeName',
                            title: '流程状态',
                            sortable: true,
                        }, {
                            field: 'IsReadName',
                            title: '是否阅读',
                            sortable: true,
                        }, {
                            field: 'ModifiedOn',
                            title: '修改时间',
                            sortable: true,
                        },
                        {
                            field: 'ModifiedByName',
                            title: '修改人',
                            sortable: true,
                        },
                        ],
                        editoption: [

                        ]
                    }
                },
                {
                    label: '发文已读',
                    name: 'outisread',
                    summaryurl: '',
                    searchform: [
                        {
                            label: '标题',
                            name: 'OfficialDocumentOutName',
                            placeholder: "请填写内容",
                            type: 'S',
                        }, {
                            label: '姓名',
                            name: 'FavoriteUserIdName',
                            placeholder: "请填写内容",
                            type: 'S',
                        }, {
                            label: '发文日期',
                            name: 'IssueDate',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '阅读时间',
                            name: 'ReadOn',
                            placeholder: "请选择",
                            type: 'D',
                        },
                        {
                            label: '发起时间',
                            name: 'FavoriteCreatedOn',
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
                        cmd: 'officialdocumentout.isread.all.list&type=1',
                        filterquery: '',
                        formatOper: function (value, row, index) {
                            return '<div class="editoption" data-accountid="' + row.valueid + '" data-id="' + row.valueid + '">更多操作<i class="layui-icon layui-icon-down"></i></div>'
                        },
                        columnsArray: [
                        {
                            field: 'Action',
                            title: '操作',
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">查看</a>'

                            }
                        },
                        {
                            field: 'DocumentNo',
                            title: '发文编号',
                            sortable: true,
                        },
                        {
                            field: 'OfficialDocumentOutName',
                            title: '发文标题',
                            sortable: true,
                            formatter: function formatter(value, row, index) {
                                return '<a style="color:blue;" href="/a0M/e?id=' + row.LIST_RECORD_ID + '&source=l&retURL=%2f123%2fo" target="_blank">' + value + '</a>'

                            }
                        },
                        {
                            field: 'IssueDate',
                            title: '发文时间',
                            sortable: true,
                        },
                        {
                            field: 'DocumentTypeCode',
                            title: '文种',
                            sortable: true,
                        },
                        {
                            field: 'BusinessUnitIdName',
                            title: '发文部门',
                            sortable: true,
                        },
                        {
                            field: 'AuthorName',
                            title: '拟稿人',
                            sortable: true,
                        }, {
                            field: 'FavoriteCreatedOn',
                            title: '发起时间',
                            sortable: true,
                        }, {
                            field: 'FavoriteUserIdName',
                            title: '阅读人',
                            sortable: true,
                        }, {
                            field: 'ReadOn',
                            title: '阅读时间',
                            sortable: true,
                        }, {
                            field: 'IsReadName',
                            title: '是否阅读',
                            sortable: true,
                        }, {
                            field: 'CurrentStepName',
                            title: '当前节点',
                            sortable: true,
                        }, {
                            field: 'WFProcessInstanceStateCodeName',
                            title: '流程状态',
                            sortable: true,
                        }, {
                            field: 'ModifiedOn',
                            title: '修改时间',
                            sortable: true,
                        },
                        {
                            field: 'ModifiedByName',
                            title: '修改人',
                            sortable: true,
                        },
                        ],
                        editoption: [

                        ]
                    }
                },

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
}, {
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
}, {
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
}, {
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