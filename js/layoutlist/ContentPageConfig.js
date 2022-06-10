var userId = ''
ajaxMethodGetData('user.info.get', {}, function (data) {
    window.userId = data.userId
})
var layoutdata = {
    requesturl: '/apps/CommandProcessor.ashx?cmd=',

    noticelst: {
        template: {
            head: {
                title: '通知管理',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '批量发布',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个通知')
                            } else {
                                layer.confirm('是否确定发布?', { btn: ['确定', '取消'], title: "提示" }, function () {
                                    layer.close(layer.index)
                                    var isend = ''
                                    for (var i = 0; i < rows.length; i++) {
                                        if (i == rows.length-1) {
                                            isend=1
                                        }
                                        batchpublish(rows[i].LIST_RECORD_ID, 100202, 1, isend)
                                    }
                                }, function () {
                                })
                            }
                        },
                        n: 'batchpublished'
                    }
                }, {
                    label: '批量取消发布',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个通知')
                            } else {
                                layer.confirm('是否确定取消发布?', { btn: ['确定', '取消'], title: "提示" }, function () {
                                    layer.close(layer.index)
                                    var isend = ''
                                    for (var i = 0; i < rows.length; i++) {
                                        if (i == rows.length - 1) {
                                            isend = 1
                                        }
                                        batchpublish(rows[i].LIST_RECORD_ID, 100202, 0, isend)
                                    }
                                }, function () {
                                })
                            }
                        },
                        n: 'batchcancel'
                    }
                }, {
                    label: '新建',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            window.open('/091/e?retURL=%2F091%2Fo')
                            //$('.popup-mask').show()
                            //var url = '/layouteditor/add_layout_ie8.html?entityName=Notice'
                            //$('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                        n: 'newnotice'
                    }
                }, ]
            },
            tabs: [{
                label: '我创建',
                name: 'mycreated',
                summaryurl: '',
                summary: [],
                treeentity: 'noticetree',
                leftSrchName: 'FolderId',
                searchform: [{
                    label: '标题',
                    name: 'Title',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'L',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, ],
                issearchform: true,
                table: {
                    objecttypecode: 100202,
                    iscommon: false,
                    cmd: 'entitygrid.list&entityType=091',
                    filterquery: "\nCreatedBy\teq-userid",
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/091/detail?objTypeCode=100202&objectTypeCode=100201&id=' + row.LIST_RECORD_ID + '&retURL=%2f091%2fo">查看</a>';
                            //if (row.StateCode == '已发布') {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                            //}
                            //else {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                            //}
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/091/e?objTypeCode=100202&objectTypeCode=100201&id=" + row.LIST_RECORD_ID + "&retURL=%2f091%2fo\"  >编辑</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100202) href=\"#\">删除</a>";
                            return html
                              
                        }
                    }, {
                        field: 'Title',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    }, {
                        field: 'FolderId',
                        title: '栏目',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '发布状态',
                        sortable: true,
                        formatter: formatStatus
                    }, {
                        field: 'BusinessUnitId',
                        title: '发布部门',
                        sortable: true
                    }, {
                        field: 'ReadCount',
                        title: '阅读数',
                        sortable: true
                    }, {
                        field: 'ApprovedBy',
                        title: '审批发布人',
                        sortable: true
                    }, {
                        field: 'ApprovedOn',
                        title: '发布时间',
                        sortable: true
                    }, {
                        field: 'CreatedBy',
                        title: '创建人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedBy',
                        title: '上次修改人',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true
                    }]
                }
            },{
            label: '部门的',
            name: 'businessunit',
            summaryurl: '',
            summary: [],
            treeentity: 'noticetree',
            leftSrchName: 'FolderId',
            searchform: [{
                label: '标题',
                name: 'Title',
                placeholder: "请填写内容",
                type: 'S',
            }, {
                label: '部门',
                name: 'BusinessUnitId',
                placeholder: "请填写内容",
                type: 'O',
                objtypecode: 10
            }, {
                label: '状态',
                name: 'StateCode',
                placeholder: "请选择状态",
                type: 'L',
            }, {
                label: '创建时间',
                name: 'CreatedOn',
                placeholder: "请选择日期",
                type: 'D',
            }, ],
            issearchform: true,
            table: {
                objecttypecode: 100202,
                iscommon: false,
                cmd: 'entitygrid.list&entityType=091',
                filterquery: "\nBusinessUnitId\teq-businessunitid",
                columnsArray: [{
                    field: 'LIST_RECORD_ID',
                    checkbox: true
                }, {
                    field: "Action",
                    title: "操作",
                    formatter: function formatter(value, row, index) {
                        var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/091/detail?objTypeCode=100202&objectTypeCode=100202&id=' + row.LIST_RECORD_ID + '&retURL=%2f091%2fo">查看</a>';
                        //if (row.StateCode == '已发布') {
                        //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                        //}
                        //else {
                        //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                        //}
                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/091/e?objTypeCode=100202&objectTypeCode=100202&id=" + row.LIST_RECORD_ID + "&retURL=%2f091%2fo\"  >编辑</a>";
                        html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100202) href=\"#\">删除</a>";
                        return html
                              
                    }
                }, {
                    field: 'Title',
                    title: '标题',
                    sortable: true,
                    formatter: function formatter(value, row, index) {
                        return value;
                    }
                }, {
                    field: 'FolderId',
                    title: '栏目',
                    sortable: true,
                }, {
                    field: 'StateCodeName',
                    title: '发布状态',
                    sortable: true,
                    formatter: formatStatus
                }, {
                    field: 'BusinessUnitId',
                    title: '发布部门',
                    sortable: true
                }, {
                    field: 'ReadCount',
                    title: '阅读数',
                    sortable: true
                }, {
                    field: 'ApprovedBy',
                    title: '审批发布人',
                    sortable: true
                }, {
                    field: 'ApprovedOn',
                    title: '发布时间',
                    sortable: true
                }, {
                    field: 'CreatedBy',
                    title: '创建人',
                    sortable: true
                }, {
                    field: 'CreatedOn',
                    title: '创建时间',
                    sortable: true
                }, {
                    field: 'ModifiedBy',
                    title: '上次修改人',
                    sortable: true
                }, {
                    field: 'ModifiedOn',
                    title: '上次修改时间',
                    sortable: true
                }]
            }
        }, {
                label: '我管理的',
                name: 'mymanagement',
                summaryurl: '',
                summary: [],
                treeentity: 'noticetree',
                leftSrchName: 'FolderId',
                searchform: [{
                    label: '标题',
                    name: 'Title',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'L',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, ],
                issearchform: true,
                table: {
                    objecttypecode: 100202,
                    iscommon: false,
                    cmd: 'content.manage.search&type=2',
                    filterquery: '',
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/091/detail?objTypeCode=100202&objectTypeCode=100202&id=' + row.LIST_RECORD_ID + '&retURL=%2f091%2fo">查看</a>';
                            //if (row.StateCode == '已发布') {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                            //}
                            //else {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                            //}
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/091/e?objTypeCode=100202&objectTypeCode=100202&id=" + row.LIST_RECORD_ID + "&retURL=%2f091%2fo\"  >编辑</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100202) href=\"#\">删除</a>";
                            return html

                        }
                    }, {
                        field: 'Title',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    }, {
                        field: 'FolderIdName',
                        title: '栏目',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '发布状态',
                        sortable: true,
                        formatter: formatStatus
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发布部门',
                        sortable: true
                    }, {
                        field: 'ReadCount',
                        title: '阅读数',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '创建人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedByName',
                        title: '上次修改人',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true
                    }]
                }
            }, {
                label: '待审批',
                name: 'myapproval',
                summaryurl: '',
                summary: [],
                treeentity: 'noticetree',
                leftSrchName: 'FolderId',
                searchform: [{
                    label: '标题',
                    name: 'Title',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'L',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, ],
                issearchform: true,
                table: {
                    objecttypecode: 100202,
                    iscommon: false,
                    cmd: 'content.pending.search&type=2',
                    filterquery: '',
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/091/detail?objTypeCode=100202&objectTypeCode=100202&id=' + row.LIST_RECORD_ID + '&retURL=%2f091%2fo">查看</a>';
                            //if (row.StateCode == '已发布') {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                            //}
                            //else {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                            //}
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/091/e?objTypeCode=100202&objectTypeCode=100202&id=" + row.LIST_RECORD_ID + "&retURL=%2f091%2fo\"  >编辑</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100202) href=\"#\">删除</a>";
                            return html

                        }
                    }, {
                        field: 'Title',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    }, {
                        field: 'FolderIdName',
                        title: '栏目',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '发布状态',
                        sortable: true,
                        formatter: formatStatus
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发布部门',
                        sortable: true
                    }, {
                        field: 'ReadCount',
                        title: '阅读数',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '创建人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedByName',
                        title: '上次修改人',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true
                    }]
                }
            }, ]
        }
    },
   
    cntmylst: {
        template: {
            head: {
                title: '信息管理',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '批量发布',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个通知')
                            } else {
                                layer.confirm('是否确定发布?', { btn: ['确定', '取消'], title: "提示" }, function () {
                                    layer.close(layer.index)
                                    var isend = ''
                                    for (var i = 0; i < rows.length; i++) {
                                        if (i == rows.length - 1) {
                                            isend = 1
                                        }
                                        batchpublish(rows[i].LIST_RECORD_ID, 100201, 1, isend)
                                    }
                                }, function () {
                                })
                            }
                        },
                        n: 'batchpublished'
                    }
                }, {
                    label: '批量取消发布',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个通知')
                            } else {
                                layer.confirm('是否确定取消发布?', { btn: ['确定', '取消'], title: "提示" }, function () {
                                    layer.close(layer.index)
                                    var isend = ''
                                    for (var i = 0; i < rows.length; i++) {
                                        if (i == rows.length - 1) {
                                            isend = 1
                                        }
                                        batchpublish(rows[i].LIST_RECORD_ID, 100201, 0, isend)
                                    }
                                }, function () {
                                })
                            }
                        },
                        n: 'batchcancel'
                    }
                }, {
                    label: '新建',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            window.open('/090/e?retURL=%2F090%2Fo')
                            //$('.popup-mask').show()
                            //var url = '/layouteditor/add_layout_ie8.html?entityName=Notice'
                            //$('#iframe').show().attr('src', url).height(620).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "640px" })
                        },
                        n: 'newnotice'
                    }
                }, ]
            },
            tabs: [{
                label: '我创建',
                name: 'mycreated',
                summaryurl: '',
                summary: [],
                treeentity: 'contenttree',
                leftSrchName: 'FolderId',
                searchform: [{
                    label: '标题',
                    name: 'Title',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'L',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, ],
                issearchform: true,
                table: {
                    objecttypecode: 100201,
                    iscommon: false,
                    cmd: 'entitygrid.list&entityType=090',
                    filterquery: "\nCreatedBy\teq-userid",
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/090/detail?objectTypeCode=100201&id=' + row.LIST_RECORD_ID + '&retURL=%2f090%2fo">查看</a>';
                            //if (row.StateCode == '已发布') {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                            //}
                            //else {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                            //}
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/090/e?objectTypeCode=100201&id=" + row.LIST_RECORD_ID + "&retURL=%2f090%2fo\"  >编辑</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100201) href=\"#\">删除</a>";
                            return html

                        }
                    }, {
                        field: 'Title',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    }, {
                        field: 'FolderId',
                        title: '栏目',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '发布状态',
                        sortable: true,
                        formatter: formatStatus
                    }, {
                        field: 'BusinessUnitId',
                        title: '发布部门',
                        sortable: true
                    }, {
                        field: 'ReadCount',
                        title: '阅读数',
                        sortable: true
                    }, {
                        field: 'ApprovedBy',
                        title: '审批发布人',
                        sortable: true
                    }, {
                        field: 'ApprovedOn',
                        title: '发布时间',
                        sortable: true
                    }, {
                        field: 'CreatedBy',
                        title: '创建人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedBy',
                        title: '上次修改人',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true
                    }]
                }
            }, {
                label: '部门的',
                name: 'businessunit',
                summaryurl: '',
                summary: [],
                treeentity: 'contenttree',
                leftSrchName: 'FolderId',
                searchform: [{
                    label: '标题',
                    name: 'Title',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'L',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, ],
                issearchform: true,
                table: {
                    objecttypecode: 100201,
                    iscommon: false,
                    cmd: 'entitygrid.list&entityType=090',
                    filterquery: "\nBusinessUnitId\teq-businessunitid",
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/090/detail?objectTypeCode=100201&id=' + row.LIST_RECORD_ID + '&retURL=%2f090%2fo">查看</a>';
                            //if (row.StateCode == '已发布') {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                            //}
                            //else {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                            //}
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/090/e?objectTypeCode=100201&id=" + row.LIST_RECORD_ID + "&retURL=%2f090%2fo\"  >编辑</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100201) href=\"#\">删除</a>";
                            return html

                        }
                    }, {
                        field: 'Title',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    }, {
                        field: 'FolderId',
                        title: '栏目',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '发布状态',
                        sortable: true,
                        formatter: formatStatus
                    }, {
                        field: 'BusinessUnitId',
                        title: '发布部门',
                        sortable: true
                    }, {
                        field: 'ReadCount',
                        title: '阅读数',
                        sortable: true
                    }, {
                        field: 'ApprovedBy',
                        title: '审批发布人',
                        sortable: true
                    }, {
                        field: 'ApprovedOn',
                        title: '发布时间',
                        sortable: true
                    }, {
                        field: 'CreatedBy',
                        title: '创建人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedBy',
                        title: '上次修改人',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true
                    }]
                }
            }, {
                label: '我管理的',
                name: 'mymanagement',
                summaryurl: '',
                summary: [],
                treeentity: 'contenttree',
                leftSrchName: 'FolderId',
                searchform: [{
                    label: '标题',
                    name: 'Title',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'L',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, ],
                issearchform: true,
                table: {
                    objecttypecode: 100201,
                    iscommon: false,
                    cmd: 'content.manage.search&type=1',
                    filterquery: '',
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/090/detail?objectTypeCode=100201&id=' + row.LIST_RECORD_ID + '&retURL=%2f090%2fo">查看</a>';
                            //if (row.StateCode == '已发布') {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                            //}
                            //else {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                            //}
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/090/e?objectTypeCode=100201&id=" + row.LIST_RECORD_ID + "&retURL=%2f090%2fo\"  >编辑</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100201) href=\"#\">删除</a>";
                            return html

                        }
                    }, {
                        field: 'Title',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    }, {
                        field: 'FolderIdName',
                        title: '栏目',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '发布状态',
                        sortable: true,
                        formatter: formatStatus
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发布部门',
                        sortable: true
                    }, {
                        field: 'ReadCount',
                        title: '阅读数',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '创建人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedByName',
                        title: '上次修改人',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true
                    }]
                }
            }, {
                label: '待审批',
                name: 'myapproval',
                summaryurl: '',
                summary: [],
                treeentity: 'contenttree',
                leftSrchName: 'FolderId',
                searchform: [{
                    label: '标题',
                    name: 'Title',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请选择状态",
                    type: 'L',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择日期",
                    type: 'D',
                }, ],
                issearchform: true,
                table: {
                    objecttypecode: 100201,
                    iscommon: false,
                    cmd: 'content.pending.search&type=1',
                    filterquery: '',
                    columnsArray: [{
                        field: 'LIST_RECORD_ID',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var html = '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/090/detail?objectTypeCode=100201&id=' + row.LIST_RECORD_ID + '&retURL=%2f090%2fo">查看</a>';
                            //if (row.StateCode == '已发布') {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",1) href=\"#\">取消发布</a>";
                            //}
                            //else {
                            //    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\"onclick=publish(\"" + row.LIST_RECORD_ID + "\",2) href=\"#\">发布</a>";
                            //}
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/090/e?objectTypeCode=100201&id=" + row.LIST_RECORD_ID + "&retURL=%2f090%2fo\"  >编辑</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=deleterow(\"" + row.LIST_RECORD_ID + "\",100201) href=\"#\">删除</a>";
                            return html

                        }
                    }, {
                        field: 'Title',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    }, {
                        field: 'FolderIdName',
                        title: '栏目',
                        sortable: true,
                    }, {
                        field: 'StateCodeName',
                        title: '发布状态',
                        sortable: true,
                        formatter: formatStatus
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发布部门',
                        sortable: true
                    }, {
                        field: 'ReadCount',
                        title: '阅读数',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '创建人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedByName',
                        title: '上次修改人',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上次修改时间',
                        sortable: true
                    }]
                }
            }, ]
        }
    },

}
function deleterow(id, type) {
    $('.popup-mask').show()
    $('#changeDiv').show()
    $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objtypecode=' + type).show().height(280).css('top', '25%!important')
}
function formatStatus(val, row, index) {
    var value = row["StateCodeName"];
    // console.log(value);
    if (value == "1" || value == "审批通过" || value == "已发布") {
        return "<span style='color:#333;'>已发布</span>";
    }
    if (value == "2" || value == "审批未通过" || value == "审批不通过") {
        return "<span style='color:#333;'>审批未通过</span>";
    }
    if (value == "0" || value == "草稿") {
        return "<span style='color:#333;'>草稿</span>";
    }
    if (value == "已退回" || value == "退回") {
        return "<span style='color:#333;'>" + value + "</span>";
    }
}
function publish(id, type) {
    if (type == 1) {
        if (confirm('是否确定撤销发布')) {
            ajaxMethodPOSTData('content.publish', {
                id: id,
                state: 0
            }, function (data) {
                success('撤销成功')
                $('#datagrid').datagrid('reload')
            })
        }
    } else {
        if (confirm('是否确定发布')) {
            ajaxMethodPOSTData('content.publish', {
                id: id,
                state: 1
            }, function (data) {
                success('发布成功')
                $('#datagrid').datagrid('reload')

            })
        }
    }
}
function batchpublish(id, objTypeCode, type, isend) {
    var messages = {
        params: {
            recordRep: {
                id: id,
                objTypeCode: objTypeCode,
                fields: {
                    StateCode: type
                }
            }
        }
    }
    messages = JSON.stringify(messages)
    var data = { message: messages };
    ajaxMethodPostData('entity.saverecord', data, callback)
    function callback(data) {
        if (isend == 1 && type == 1) {
            reloadgrid()
            success("发布成功")
        }
        if (isend == 1 && type == 0) {
            reloadgrid()
            success("取消发布成功")
        }
    }
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


