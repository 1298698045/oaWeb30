var layoutdata = {
    requesturl: '/apps/CommandProcessor.ashx?cmd=',
    common: {
        template: {
            head: {
                title: '查询',
                logo: '/template/hearder/logo.png',
                btns: []
            },
            tabs: [{
                common: true,
                label: '所有',
                name: 'caigouContract',
                searchform: [],
                summary: [],
                table: {
                    GridColumns: [],
                    cmd: 'entity.lookup.search&lookupName=' + getQueryString('lookupName'),
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
    mineWorkflow: {
        template: {
            head: {
                title: '我的发起/我的请求',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                }, {
                    label: '督办',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                $('.popup-mask').show()
                                $('#iframe').show().attr('src', '/alert/wf/supervisor.html').height(520).css('margin-top', '-260px')
                            }
                        },
                        n: 'supervisor'
                    }
                }, {
                    label: '取消督办',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                //$('.popup-mask').show()
                                //$('#iframe').show().attr('src', '/alert/wf/cancelsupervisor.html').height(520).css('margin-top', '-260px')
                                layer.confirm('确定要取消督办吗？', {
                                    btn: ['取消', '确定'] //按钮
                                }, function (index) {
                                    layer.close(index)
                                }, function (index) {
                                    for (var i = 0; i < rows.length; i++) {
                                        var id = rows[i].ProcessInstanceId
                                        var messages = {
                                            params: {
                                                recordRep: {
                                                    id: id,
                                                    objTypeCode: 122,
                                                    fields: {
                                                        IsSupervised: false,
                                                    }
                                                }
                                            }
                                        }
                                        messages = JSON.stringify(messages)
                                        var data = { messages: messages }
                                        if (i == rows.length - 1) {
                                            ajaxMethodPostData('entity.saverecord', data, function (data) {
                                                layer.msg('取消成功');
                                                $('#datagrid').datagrid('reload')
                                            })
                                        } else {
                                            ajaxMethodPostData('entity.saverecord', data)
                                        }
                                    }
                                });
                            }
                        },
                        n: 'cancelsupervisor'
                    }
                }, {
                    label: '收藏',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                $('.popup-mask').show()
                                $('#iframe').show().attr('src', '/alert/wf/isfavor.html').height(520).css('margin-top', '-260px')
                            }
                        },
                        n: 'IsFavor'
                    }
                }, {
                    label: '批量打印',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                var ids = []
                                for (var i = 0; i < rows.length; i++) {
                                    ids.push(rows[i].ProcessInstanceId)
                                    //window.open('/apps/wf/WFFormPrint.aspx?InstanceId=' + rows[i].ProcessInstanceId, rows[i].ProcessInstanceId);
                                }
                                openprints(ids, '/apps/wf/WFFormPrint.aspx?InstanceId=')
                            }
                        },
                        n: 'rowsprint'
                    }
                }, {
                    label: '批量传阅',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                var processInstanceIds = "";
                                for (var i = 0; i < rows.length; i++) {
                                    if (i > 0)
                                        processInstanceIds += ",";
                                    processInstanceIds += rows[i].ProcessInstanceId;
                                }
                                Processcircularize(processInstanceIds);
                            }
                        },
                        n: 'batchRead'
                    }
                }]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                summaryurl: 'contract.summary.statistics.get&Type=4',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.owner.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    },  {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceNumber',
                        title: '编号',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: false
                    }/*, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: false
                    }*/]
                    //formatOper: function (value, row, index) {
                    //    return '<ul class="layui-nav" lay-filter="">'
                    //            + '  <li class="layui-nav-item">'
                    //            + '    <a href="javascript:;">更多操作</a>'
                    //            + '    <dl class="layui-nav-child">'
                    //            + '      <dd><a href="">操作1</a></dd>'
                    //            + '      <dd><a href="">操作2</a></dd>'
                    //            + '      <dd><a href="">操作3</a></dd>'
                    //            + '    </dl>'
                    //            + '  </li>'
                    //            + '</ul>'
                    //},
                }
            }, {
                label: '已完成',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.owner.search',
                    filterquery: '\nstatecode\teq\t3',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceNumber',
                        title: '编号',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: false
                    }]
                }
            }, {
                label: '流转中',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    cmd: 'process.instance.owner.search',
                    filterquery: '\nstatecode\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceNumber',
                        title: '编号',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: false
                    }]
                }
            }, {
                label: '被退回/撤销',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    cmd: 'process.instance.owner.search',
                    filterquery: '\nstatecode\teq\t5',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ProcessInstanceNumber',
                        title: '编号',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: false
                    }]
                }
            }, {
                label: '督办',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.owner.search',
                    filterquery: '\nIsSupervised\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }],
                }
            }, {
                label: '收藏',
                name: 'favoriteProcessInstances',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.favorite.search',
                    filterquery: '\nIsFavor\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }]
                }
            }, {
                label: '我的关注',
                name: 'favoriteProcessInstances',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.favorite.search',
                    filterquery: '\nIsFavor\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }]
                }
            }, {
                label: '草稿',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '状态',
                    name: 'StateCode',
                    placeholder: "请填写内容",
                    type: 'L',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=3',
                table: {
                    objecttypecode: 122,
                    cmd: 'process.instance.owner.search',
                    filterquery: '\nstatecode\teq\t0',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            if (row.StateCode == 1) {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcancel(\'' + row.ProcessInstanceId + '\')">撤销</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessreminderInstance(\'' + row.ProcessInstanceId + '\')">催办</a>'
                                //+ '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick=\'commondelete(122,"' + row.ProcessInstanceId + '")\'>删除</a>';
                            } else {
                                return '<a target="_block" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + row.ProcessInstanceId + '\')">传阅</a>'
                               + '&nbsp|&nbsp<a  style="color:#015ba7;font-size:13px;cursor:pointer;" onclick=\'commondelete(122,"' + row.ProcessInstanceId + '")\'>删除</a>';
                            }
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次办理时间',
                        sortable: true
                    }]
                }
            }]
        }
    },
    supervise: {
        template: {
            head: {
                title: '流程督办',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                        },
                        n: 'searchcontract'
                    }
                }, {
                    label: '导出',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                        },
                        n: 'exported'
                    }
                }, {
                    label: '督办',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                $('.popup-mask').show()
                                $('#iframe').show().attr('src', '/alert/wf/supervisor.html').height(520).css('margin-top', '-260px')
                            }
                        },
                        n: 'supervisor'
                    }
                }, {
                    label: '取消督办',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                //$('.popup-mask').show()
                                //$('#iframe').show().attr('src', '/alert/wf/cancelsupervisor.html').height(520).css('margin-top', '-260px')
                                layer.confirm('确定要取消督办吗？', {
                                    btn: ['取消', '确定'] //按钮
                                }, function (index) {
                                    layer.close(index)
                                }, function (index) {
                                    for (var i = 0; i < rows.length; i++) {
                                        var id = rows[i].ProcessInstanceId
                                        var messages = {
                                            params: {
                                                recordRep: {
                                                    id: id,
                                                    objTypeCode: 122,
                                                    fields: {
                                                        IsSupervised: false,
                                                    }
                                                }
                                            }
                                        }
                                        messages = JSON.stringify(messages)
                                        var data = { messages: messages }
                                        if (i == rows.length - 1) {
                                            ajaxMethodPostData('entity.saverecord', data, function (data) {
                                                $('#datagrid').datagrid('reload')

                                                layer.msg('取消成功');
                                            })
                                        } else {
                                            ajaxMethodPostData('entity.saverecord', data)
                                        }
                                    }

                                });
                            }
                        },
                        n: 'cancelsupervisor'
                    }
                }, {
                    label: '关注',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请选择流程')
                            } else if (rows.length > 1) {
                                layer.msg('至多只能选择一个流程')
                            } else {
                                $('.popup-mask').show()
                                $('#iframe').show().attr('src', '/alert/wf/follow.html?ProcessInstanceId=' + rows[0].ProcessInstanceId).height(660).css('margin-top', '-330px')
                            }
                        },
                        n: 'follow'
                    }
                }, ]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                //summaryurl: 'contract.summary.statistics.get&Type=4',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    //iscommon: true,
                    cmd: 'process.instance.owner.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    },{
                        field: 'SuperviseReminderOn',
                        title: '反馈日期',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }],
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
                }
            }, {
                label: '督办',
                name: 'xiaoshouContract',
                //summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'SuperviseReminderOn',
                        title: '督办提醒',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }],
                    objecttypecode: 122,
                    cmd: 'process.instance.owner.search',
                    filterquery: '\nIsSupervised\teq\t1',
                    formatOper: function (value, row, index) {
                        return '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="showEditDialog()">付款</a>'
                    },
                }
            }, {
                label: '未督办',
                name: 'xiaoshouContract',
                summaryurl: 'contract.summary.statistics.get&Type=5',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.ProcessInstanceId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '创建时间',
                        sortable: true
                    }],
                    objecttypecode: 122,
                    cmd: 'process.instance.owner.search',
                    filterquery: '\nIsSupervised\teq\t0',
                    formatOper: function (value, row, index) {
                        return '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="showEditDialog()">付款</a>'
                    },
                }
            }],
        },
    },
    doingtask: {
        template: {
            head: {
                title: '待办事宜',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                }, {
                    label: '批量传阅',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                var processInstanceIds = "";
                                for (var i = 0; i < rows.length; i++) {
                                    if (i > 0)
                                        processInstanceIds += ",";
                                    processInstanceIds += rows[i].ProcessInstanceId;
                                }
                                Processcircularize(processInstanceIds);
                            }
                        },
                        n: 'batchRead'
                    }
                }]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.waitingtask.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId;
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processtodetailed(' + "'/a0M/e?id=" + WFRuleLogId + "&source=l&retURL=%2fworkflow%2fdoing%2flist?objTypeId=123&name=doingtask')" + '">办理</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessopenchangeDiv(' + "'/apps/wf/InstanceTranAgent.aspx?InstanceId=" + rowId + "&RuleLogId" + WFRuleLogId + "&InstanceIdName=" + InstanceIdName + "&ExecutorIdentityName=" + ExecutorIdentityName + "'" + ')">委派</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" target="_" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '&retURL=%2fworkflow%2fdoing%2flist?objTypeId=123&name=doingtask">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    },
                    {
                        field: 'CreatedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartByName',
                        title: '发起人姓名',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '发起时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'IsRead',
                        title: '已读',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            if (value == 'True') {
                                return '<img style=\"height:12px;width:14px;margin-left:8px;\" src="/img/images/00.3.Check.png" />';
                            }
                            else {
                                return '';
                            }
                        }
                    }],
                }
            }, {
                label: '被退回',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.waitingtask.search',
                    filterquery: '\nSourceDirect\teq\t3',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processtodetailed(' + "'/a0M/e?id=" + WFRuleLogId + "&source=l&retURL=%2f123%2fo')" + '">办理</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessopenchangeDiv(' + "'/apps/wf/InstanceTranAgent.aspx?InstanceId=" + rowId + "&RuleLogId" + WFRuleLogId + "&InstanceIdName=" + InstanceIdName + "&ExecutorIdentityName=" + ExecutorIdentityName + "'" + ')">委派</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" target="_" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    },
                    {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }],
                }
            }, {
                label: '待阅',
                name: 'watingread',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.waitingtask.search',
                    filterquery: '\nStepTypeCode\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processtodetailed(' + "'/a0M/e?id=" + WFRuleLogId + "&source=l&retURL=%2f123%2fo')" + '">办理</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessopenchangeDiv(' + "'/apps/wf/InstanceTranAgent.aspx?InstanceId=" + rowId + "&RuleLogId" + WFRuleLogId + "&InstanceIdName=" + InstanceIdName + "&ExecutorIdentityName=" + ExecutorIdentityName + "'" + ')">委派</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" target="_" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    },
                    {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }],
                }
            }, 
            {
                label: '已读',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.waitingtask.search',
                    filterquery: '\nIsRead\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName;
                            var ExecutorIdentityName = row.ExecutorIdentityName;
                            var WFRuleLogId = row.WFRuleLogId;
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processtodetailed(' + "'/a0M/e?id=" + WFRuleLogId + "&source=l&retURL=%2fworkflow%2fdoing%2flist?objTypeId=123&name=doingtask')" + '">办理</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessopenchangeDiv(' + "'/apps/wf/InstanceTranAgent.aspx?InstanceId=" + rowId + "&RuleLogId" + WFRuleLogId + "&InstanceIdName=" + InstanceIdName + "&ExecutorIdentityName=" + ExecutorIdentityName + "'" + ')">委派</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" target="_" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    },
                    {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }],
                }
            }, {
                label: '未读',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.waitingtask.search',
                    filterquery: '\nIsRead\teq\t0',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processtodetailed(' + "'/a0M/e?id=" + WFRuleLogId + "&source=l&retURL=%2f123%2fo')" + '">办理</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="ProcessopenchangeDiv(' + "'/apps/wf/InstanceTranAgent.aspx?InstanceId=" + rowId + "&RuleLogId" + WFRuleLogId + "&InstanceIdName=" + InstanceIdName + "&ExecutorIdentityName=" + ExecutorIdentityName + "'" + ')">委派</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" target="_block" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'ProcessIdName',
                        title: '流程',
                        sortable: true
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    },
                    {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }],
                }
            }, {
                label: '超时',
                name: 'expiredTasks',
                summaryurl: '',
                searchform: [],
                summary: [],
                treeentity: 'processtree'
            }]
        }
    },
    donetask: {
        template: {
            head: {
                title: '已办事宜',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },
                {
                    label: '批量传阅',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                var processInstanceIds = "";
                                for (var i = 0; i < rows.length; i++) {
                                    if (i > 0)
                                        processInstanceIds += ",";
                                    processInstanceIds += rows[i].ProcessInstanceId;
                                }
                                Processcircularize(processInstanceIds);
                            }
                        },
                        n: 'batchRead'
                    }
                }]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=2',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.finishedtask.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;cursor:pointer;" onclick="Processtoreload(\'' + rowId + '\',\'' + WFRuleLogId + '\')">重办</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;cursor:pointer;" target="_blank" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'InstanceStateCodeName',
                        title: '流程状态',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人姓名',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }]
                }
            }, {
                label: '流程已完成',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=2',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.finishedtask.search',
                    filterquery: '\nStateCode\teq\t3',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processtoreload(\'' + rowId + '\')">重办</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" target="_" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'InstanceStateCodeName',
                        title: '流程状态',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人姓名',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }]
                }
            }, {
                label: '流程流转中',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                //treeentity: 'processtree',
                treequeryurl: 'process.instance.tree.get&type=2',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.finishedtask.search',
                    filterquery: '\nStateCode\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processtoreload(\'' + rowId + '\')">重办</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;" target="_" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'InstanceStateCodeName',
                        title: '流程状态',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'ToActivityName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人姓名',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }]
                }
            }, ],
        },
    },
    instancesManager:{
        template: {
            head: {
                title: '事务管理',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                }
                ]
            },
            tabs: [{
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'entity.grid.search&entityType=WFProcessInstances&sort=CreatedOn&order=desc',
                    filterquery: '\nStateCode\tneq\t0',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                    {
                        field: "ProcessInstanceNumber",
                        title: '流程编号',
                        sortable: true
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: formatName1
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus1
                    }, {
                        field: 'AttachQty',
                        title: '附件数量',
                        sortable: true
                    },{
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    },
                     {
                         field: 'CreatedOn',
                         title: '发起时间',
                         sortable: true
                     },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    },{
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }]
                }
            }, {
                label: '流转中',
                name: 'state1',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'entity.grid.search&entityType=WFProcessInstances&sort=CreatedOn&order=desc',
                    filterquery: '\nStateCode\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                    {
                        field: "ProcessInstanceNumber",
                        title: '流程编号',
                        sortable: true
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: formatName1
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus1
                    }, {
                        field: 'AttachQty',
                        title: '附件数量',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    },
                     {
                         field: 'CreatedOn',
                         title: '发起时间',
                         sortable: true
                     },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }]
                }
            }, {
                label: '已完成',
                name: 'state3',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'entity.grid.search&entityType=WFProcessInstances&sort=CreatedOn&order=desc',
                    filterquery: '\nStateCode\teq\t3',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                    {
                        field: "ProcessInstanceNumber",
                        title: '流程编号',
                        sortable: true
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: formatName1
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus1
                    }, {
                        field: 'AttachQty',
                        title: '附件数量',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    },
                     {
                         field: 'CreatedOn',
                         title: '发起时间',
                         sortable: true
                     },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }]
                }
            }, {
                label: '已退回',
                name: 'state4',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'entity.grid.search&entityType=WFProcessInstances&sort=CreatedOn&order=desc',
                    filterquery: '\nStateCode\teq\t4',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                    {
                        field: "ProcessInstanceNumber",
                        title: '流程编号',
                        sortable: true
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: formatName1
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus1
                    }, {
                        field: 'AttachQty',
                        title: '附件数量',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    },
                     {
                         field: 'CreatedOn',
                         title: '发起时间',
                         sortable: true
                     },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }]
                }
            }, {
                label: '已撤销',
                name: 'state5',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'entity.grid.search&entityType=WFProcessInstances&sort=CreatedOn&order=desc',
                    filterquery: '\nStateCode\teq\t5',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                    {
                        field: "ProcessInstanceNumber",
                        title: '流程编号',
                        sortable: true
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: formatName1
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus1
                    }, {
                        field: 'AttachQty',
                        title: '附件数量',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    },
                     {
                         field: 'CreatedOn',
                         title: '发起时间',
                         sortable: true
                     },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }]
                }
            }, {
                label: '草稿',
                name: 'state0',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '发起人',
                    name: 'CreatedBy',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 8
                }, {
                    label: '发起部门',
                    name: 'BusinessUnitId',
                    placeholder: "请填写内容",
                    type: 'O',
                    objtypecode: 10
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '提交日期',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'entity.grid.search&entityType=WFProcessInstances&sort=CreatedOn&order=desc',
                    filterquery: '\nStateCode\teq\t0',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            return formatOper1(value, row, index);
                        }
                    },
                    {
                        field: "ProcessInstanceNumber",
                        title: '流程编号',
                        sortable: true
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: formatName1
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'StateCodeName',
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus1
                    }, {
                        field: 'AttachQty',
                        title: '附件数量',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人',
                        sortable: true
                    },
                    {
                        field: 'CurrentStepName',
                        title: '当前步骤',
                        sortable: true
                    },
                     {
                         field: 'CreatedOn',
                         title: '发起时间',
                         sortable: true
                     },
                    {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'ModifiedOn',
                        title: '上一次修改时间',
                        sortable: true
                    }, {
                        field: 'PriorityName',
                        title: '紧急程度',
                        sortable: true
                    }]
                }
            }, ],
        },
    },
    proclst: {
        template: {
            head: {
                title: '流程设置',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },
               ]
            },
            tabs: [{
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 121,
                    iscommon: false,
                    cmd: 'entitygrid.list&entityType=121',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
                            var urlApprove = "/121/e?id=" + rowId;
                            var name = row["Name"];
                            var entityType = "121";
                            if (name != "") {
                                //name = name.substring(name.indexOf('>') + 1, name.lastIndexOf('<'));
                                //console.log(rowId);
                                // console.log(row);
                            }
                            var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/' + entityType + '/detail?id=' + rowId + '&retURL=%2F121%2Fo\">权限设置</a>';
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/121/e?id=" + rowId + "&retURL=%2F121%2Fo\"  >编辑基本信息</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/apps/flowdesigner/editors/WFlowDesigner.aspx?id=" + rowId + "&retURL=%2F121%2Fo\"  >设计流程</a>";
                            //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"renameDialog('" + rowId + "','" + name + "')\" >重命名</a>&nbsp;";
                            //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"return confirmDelete();\" href=\"/setup/own/deleteRedirect.aspx?type=100201&delID=" + rowId + "&retURL=/090/o\">删除</a>";
                            return html;
                        }
                    }, {
                        field: 'Name',
                        title: '名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    },
                    {
                        field: "ProcessCode",
                        title: '流程代码',
                        sortable: true
                    },
                    {
                        field: "StateCode",
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus2
                    },
                    {
                        field: "EntityType",
                        title: '关联对象代码',
                        sortable: true
                    },
                    {
                        field: "EntityObjectId",
                        title: '关联对象',
                        sortable: true
                    },
                    {
                        field: "EntityLayoutId",
                        title: '表单',
                        sortable: true
                    },
                    {
                        field: "FolderId",
                        title: '流程分类',
                        sortable: true
                    },
                    {
                        field: "ModifiedBy",
                        title: '上一次修改人',
                        sortable: true
                    },
                    {
                        field: "ModifiedOn",
                        title: '上一次修改日期',
                        sortable: false
                    }]
                }
            }, {
                label: '启用',
                name: 'state1',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 121,
                    iscommon: false,
                    cmd: 'entitygrid.list&entityType=121',
                    filterquery: '\nStateCode\teq\t1',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
                            var urlApprove = "/121/e?id=" + rowId;
                            var name = row["Name"];
                            var entityType = "121";
                            if (name != "") {
                                //name = name.substring(name.indexOf('>') + 1, name.lastIndexOf('<'));
                                //console.log(rowId);
                                // console.log(row);
                            }
                            var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/' + entityType + '/detail?id=' + rowId + '&retURL=%2F121%2Fo\">权限设置</a>';
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/121/e?id=" + rowId + "&retURL=%2F121%2Fo\"  >编辑基本信息</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/apps/flowdesigner/editors/WFlowDesigner.aspx?id=" + rowId + "&retURL=%2F121%2Fo\"  >设计流程</a>";
                            //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"renameDialog('" + rowId + "','" + name + "')\" >重命名</a>&nbsp;";
                            //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"return confirmDelete();\" href=\"/setup/own/deleteRedirect.aspx?type=100201&delID=" + rowId + "&retURL=/090/o\">删除</a>";
                            return html;
                        }
                    }, {
                        field: 'Name',
                        title: '名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    },
                    {
                        field: "ProcessCode",
                        title: '流程代码',
                        sortable: true
                    },
                    {
                        field: "StateCode",
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus2
                    },
                    {
                        field: "EntityType",
                        title: '关联对象代码',
                        sortable: true
                    },
                    {
                        field: "EntityObjectId",
                        title: '关联对象',
                        sortable: true
                    },
                    {
                        field: "EntityLayoutId",
                        title: '表单',
                        sortable: true
                    },
                    {
                        field: "FolderId",
                        title: '流程分类',
                        sortable: true
                    },
                    {
                        field: "ModifiedBy",
                        title: '上一次修改人',
                        sortable: true
                    },
                    {
                        field: "ModifiedOn",
                        title: '上一次修改日期',
                        sortable: false
                    }]
                }
            }, {
                label: '草稿',
                name: 'state0',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 121,
                    iscommon: false,
                    cmd: 'entitygrid.list&entityType=121',
                    filterquery: '\nStateCode\teq\t0',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
                            var urlApprove = "/121/e?id=" + rowId;
                            var name = row["Name"];
                            var entityType = "121";
                            if (name != "") {
                                //name = name.substring(name.indexOf('>') + 1, name.lastIndexOf('<'));
                                //console.log(rowId);
                                // console.log(row);
                            }
                            var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/' + entityType + '/detail?id=' + rowId + '&retURL=%2F121%2Fo\">权限设置</a>';
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/121/e?id=" + rowId + "&retURL=%2F121%2Fo\"  >编辑基本信息</a>";
                            html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=\"/apps/flowdesigner/editors/WFlowDesigner.aspx?id=" + rowId + "&retURL=%2F121%2Fo\"  >设计流程</a>";
                            //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"renameDialog('" + rowId + "','" + name + "')\" >重命名</a>&nbsp;";
                            //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"return confirmDelete();\" href=\"/setup/own/deleteRedirect.aspx?type=100201&delID=" + rowId + "&retURL=/090/o\">删除</a>";
                            return html;
                        }
                    }, {
                        field: 'Name',
                        title: '名称',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return value;
                        }
                    },
                    {
                        field: "ProcessCode",
                        title: '流程代码',
                        sortable: true
                    },
                    {
                        field: "StateCode",
                        title: '状态',
                        sortable: true,
                        formatter: formatStatus2
                    },
                    {
                        field: "EntityType",
                        title: '关联对象代码',
                        sortable: true
                    },
                    {
                        field: "EntityObjectId",
                        title: '关联对象',
                        sortable: true
                    },
                    {
                        field: "EntityLayoutId",
                        title: '表单',
                        sortable: true
                    },
                    {
                        field: "FolderId",
                        title: '流程分类',
                        sortable: true
                    },
                    {
                        field: "ModifiedBy",
                        title: '上一次修改人',
                        sortable: true
                    },
                    {
                        field: "ModifiedOn",
                        title: '上一次修改日期',
                        sortable: false
                    }]
                }
            }],
        },
    },
    cancelledWfinstances: {
        template: {
            head: {
                title: '退件箱',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },
                ]
            },
            tabs: [{
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '退件时间',
                    name: 'ExpiredOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.canceltask.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            //var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + row.WFRuleLogId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">办理</a>";
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>修改</a>";
                            action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/detail?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>查看</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/WFPageProcessor.ashx?cmd=cancelwfinstance&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\"  onclick=\"return confirmCancelWF();\"  >撤销</a>";
                            action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"deleteProcessInstance('" + rowId + "');\"  >删除</a>";
                            return action;
                        }
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            var name = row["Name"];
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + rowId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dcancelledWfinstances%26t%3da0M\">" + name + "</a>";
                            return action;
                        }
                    },
                    { field: "ProcessIdName", title: '流程名称', sortable: true },
                    { field: "CurrentStepName", title: '当前步骤', sortable: true },
                    { field: "StateCodeName", title: '状态', sortable: true },
                    { field: "BusinessUnitIdName", title: '发起人部门', sortable: true },
                    { field: "CreatedByName", title: '发起人姓名', sortable: false },
                    { field: "PriorityName", title: '紧急程度', sortable: true },
                    { field: "CreatedOn",  title: '创建时间', sortable: true },
                    { field: "ModifiedOn", title: '修改时间', sortable: true },
                    { field: "ExpiredOn", title: '退件时间', sortable: true },
                    ]
                }
            }, {
                label: '撤销',
                name: 'cancel',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '退件时间',
                    name: 'ExpiredOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.canceltask.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            //var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + row.WFRuleLogId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">办理</a>";
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>修改</a>";
                            action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/detail?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>查看</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/WFPageProcessor.ashx?cmd=cancelwfinstance&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\"  onclick=\"return confirmCancelWF();\"  >撤销</a>";
                            action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"deleteProcessInstance('" + rowId + "');\"  >删除</a>";
                            return action;
                        }
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            var name = row["Name"];
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + rowId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dcancelledWfinstances%26t%3da0M\">" + name + "</a>";
                            return action;
                        }
                    },
                    { field: "ProcessIdName", title: '流程名称', sortable: true },
                    { field: "CurrentStepName", title: '当前步骤', sortable: true },
                    { field: "StateCodeName", title: '状态', sortable: true },
                    { field: "BusinessUnitIdName", title: '发起人部门', sortable: true },
                    { field: "CreatedByName", title: '发起人姓名', sortable: false },
                    { field: "PriorityName", title: '紧急程度', sortable: true },
                    { field: "CreatedOn", title: '创建时间', sortable: true },
                    { field: "ModifiedOn", title: '修改时间', sortable: true },
                    { field: "ExpiredOn", title: '退件时间', sortable: true },
                    ]
                }
            }, {
                label: '被退回',
                name: 'return',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                {
                    label: '退件时间',
                    name: 'ExpiredOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.canceltask.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            //var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + row.WFRuleLogId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">办理</a>";
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>修改</a>";
                            action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/detail?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>查看</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/WFPageProcessor.ashx?cmd=cancelwfinstance&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\"  onclick=\"return confirmCancelWF();\"  >撤销</a>";
                            action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"deleteProcessInstance('" + rowId + "');\"  >删除</a>";
                            return action;
                        }
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            var name = row["Name"];
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + rowId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dcancelledWfinstances%26t%3da0M\">" + name + "</a>";
                            return action;
                        }
                    },
                    { field: "ProcessIdName", title: '流程名称', sortable: true },
                    { field: "CurrentStepName", title: '当前步骤', sortable: true },
                    { field: "StateCodeName", title: '状态', sortable: true },
                    { field: "BusinessUnitIdName", title: '发起人部门', sortable: true },
                    { field: "CreatedByName", title: '发起人姓名', sortable: false },
                    { field: "PriorityName", title: '紧急程度', sortable: true },
                    { field: "CreatedOn", title: '创建时间', sortable: true },
                    { field: "ModifiedOn", title: '修改时间', sortable: true },
                    { field: "ExpiredOn", title: '退件时间', sortable: true },
                    ]
                }
            }, ],
        },
    },
    createdreadwfinstances: {
        template: {
            head: {
                title: '我传阅的',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },
                ]
            },
            tabs: [{
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.foward.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            //var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + row.WFRuleLogId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">办理</a>";
                            //var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">修改</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/detail?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">查看</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/WFPageProcessor.ashx?cmd=cancelwfinstance&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\"  onclick=\"return confirmCancelWF();\"  >撤销</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"deleteProcessInstance('" + rowId + "');\"  >删除</a>";
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?objectTypeCode=123&source=i&read=1&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>查看</a>";
                            return action;
                        }
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            var name = row["Name"];
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" target='_blank' href=\"/a0M/e?source=i&read=1&id=" + rowId + "&retURL=%2fwfinstance%2ffowardReadLog.aspx%3fgridid%3dmyreadwfinstances%26t%3da0M\">" + name + "</a>";
                            return action;
                        }
                    },
                   {
                       field: "StateCodeName", title: '流程状态', sortable: true,
                       formatter: function formatter(value, row, index) {
                           return formatOperstatecode(value, row, index);
                       }
                   },
                   { field: "ReceiverName", title: '被传阅人', sortable: true },
                   { field: "CreatedReadOn", title: '传阅时间', sortable: true },
                   { field: "ReadTime", title: '阅读时间', sortable: true },
                   { field: "ProcessIdName", title: '流程', sortable: true },         
                   { field: "CurrentStepName", title: '当前步骤', sortable: true },
                   { field: "CreatedByName", title: '发起人', sortable: false },
                   { field: "BusinessUnitIdName", title: '发起人部门', sortable: true },
                   { field: "CreatedOn", title: '流程发起时间', sortable: true },
                    ]
                }
            }, ],
        },
    },
    myreadwfinstances: {
        template: {
            head: {
                title: '收到传阅',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },
                ]
            },
            tabs: [{
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.receive.foward.search',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            //var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + row.WFRuleLogId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">办理</a>";
                            //var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">修改</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/detail?action=b&source=l&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">查看</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/WFPageProcessor.ashx?cmd=cancelwfinstance&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\"  onclick=\"return confirmCancelWF();\"  >撤销</a>";
                            //action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"deleteProcessInstance('" + rowId + "');\"  >删除</a>";
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?objectTypeCode=123&source=i&read=1&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fcancellst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target='_blank'>查看</a>";
                            return action;
                        }
                    },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            var name = row["Name"];
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" target='_blank' href=\"/a0M/e?source=i&read=1&id=" + rowId + "&retURL=%2fwfinstance%2ffowardReadLog.aspx%3fgridid%3dmyreadwfinstances%26t%3da0M\">" + name + "</a>";
                            return action;
                        }
                    },
                    {
                        field: "StateCodeName", title: '状态', sortable: true,
                        formatter: function formatter(value, row, index) {
                            return formatOperstatecode(value, row, index);
                        }
                    },
                    { field: "CreatedReadOn", title: '传阅时间', sortable: true },
                    { field: "ReadTime", title: '阅读时间', sortable: true },
                    { field: "ProcessIdName", title: '流程', sortable: true },
                    { field: "CurrentStepName", title: '当前步骤', sortable: true },
                    { field: "CreatedByName", title: '发起人', sortable: false },
                    { field: "BusinessUnitIdName", title: '发起人部门', sortable: true },
                    { field: "CreatedOn", title: '流程发起时间', sortable: true },
                    ]
                }
            }, ],
        },
    },
    mydraftinstances: {
        template: {
            head: {
                title: '草稿箱',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },
                ]
            },
            tabs: [{
                label: '全部',
                name: 'all',
                summaryurl: '',
                searchform: [{
                    label: '标题',
                    name: 'Name',
                    placeholder: "请填写内容",
                    type: 'S',
                }, {
                    label: '优先级',
                    name: 'Priority',
                    placeholder: "请选择",
                    type: 'I',
                }, {
                    label: '创建时间',
                    name: 'CreatedOn',
                    placeholder: "请选择",
                    type: 'D',
                },
                ],
                issearchform: true,
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'wf.instanceowner.search&entityType=WFProcessInstances',
                    filterquery: '\nStateCode\teq\t0',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + row.ProcessInstanceId + "&retURL=%2fwfinstance%2fdraftlst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\" target=\"_blank\">修改</a>";
                            action += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"return confirmDelete2(null,'" + rowId + "','a0M');\"  >删除</a>";
                            return action;
                        }
                    },
                    { field: "ProcessInstanceNumber", width: 130, title: '流程编号' },
                    {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            var rowId = row.ProcessInstanceId;
                            var name = row["Name"];
                            var action = "<a style=\"color:#015ba7;font-size:13px;\" href=\"/a0M/e?source=i&id=" + rowId + "&retURL=%2fwfinstance%2fdraftlst.aspx%3fgridid%3dmydraftinstances%26t%3da0M\">" + name + "</a>";
                            return action;
                        }
                    },
                    { field: "ProcessIdName", width: 200, title: '流程名称', sortable: true },
                    { field: "StateCodeName", title: '状态', sortable: true },
                    { field: "BusinessUnitIdName", title: '部门', sortable: true },
                    { field: "CreatedByName", title: '创建人姓名', sortable: false },
                    { field: "CreatedOn", width: 140, title: '创建时间', sortable: true },
                    { field: "ModifiedOn", width: 140, title: '上次一次修改时间', sortable: true }
                    ]
                }
            },],
        },
    },
    follow: {
        template: {
            head: {
                title: '关注事宜',
                logo: '/template/hearder/logo.png',
                btns: [{
                    label: '搜索',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () { },
                        n: 'searchcontract'
                    }
                },
                {
                    label: '批量传阅',
                    type: 'layui-btn-normal',
                    click: {
                        f: function () {
                            var rows = $('#datagrid').datagrid('getChecked')
                            if (rows.length == 0) {
                                layer.msg('请至少选择一个流程')
                            } else {
                                var processInstanceIds = "";
                                for (var i = 0; i < rows.length; i++) {
                                    if (i > 0)
                                        processInstanceIds += ",";
                                    processInstanceIds += rows[i].ProcessInstanceId;
                                }
                                Processcircularize(processInstanceIds);
                            }
                        },
                        n: 'batchRead'
                    }
                }]
            },
            tabs: [{
                label: '全部',
                name: 'caigouContract',
                summaryurl: '',
                searchform: [],
                summary: [],
                treeentity: 'processtree',
                //treequeryurl: 'process.instance.tree.get&type=1',
                table: {
                    objecttypecode: 122,
                    iscommon: false,
                    cmd: 'process.instance.favorite.get',
                    filterquery: '',
                    columnsArray: [{
                        field: 'ids',
                        checkbox: true
                    }, {
                        field: "Action",
                        title: "操作",
                        formatter: function formatter(value, row, index) {
                            var rowId = row["ProcessInstanceId"];
                            var InstanceIdName = row.ToActivityName
                            var ExecutorIdentityName = row.ExecutorIdentityName
                            var WFRuleLogId = row.WFRuleLogId
                            var action = '<a style="color:#015ba7;font-size:13px;cursor:pointer;cursor:pointer;" onclick="Processtoreload(\'' + rowId + '\',\'' + WFRuleLogId + '\')">重办</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;cursor:pointer;" onclick="Processcircularize(\'' + rowId + '\')">传阅</a>'
                            action += '&nbsp;|&nbsp;<a style="color:#015ba7;font-size:13px;cursor:pointer;cursor:pointer;" target="_blank" href="/apps/wf/WFFormPrint.aspx?InstanceId=' + row.ProcessInstanceId + '">打印</a>'
                            return action;
                        }
                    }, {
                        field: 'Name',
                        title: '标题',
                        sortable: true,
                        formatter: function formatter(value, row, index) {
                            return '<a target="_blank" style=\"color:#015ba7;font-size:13px;cursor:pointer;\" href="/a0M/e?objectTypeCode=123&source=l&id=' + row.WFRuleLogId + '">' + row.Name + '</a>&nbsp;';
                        }
                    }, {
                        field: 'InstanceStateCodeName',
                        title: '流程状态',
                        sortable: true
                    }, {
                        field: 'ProcessIdName',
                        title: '流程名称',
                        sortable: true
                    }, {
                        field: 'CurrentStepName',
                        title: '当前环节',
                        sortable: true
                    }, {
                        field: 'FromActivityName',
                        title: '来源环节',
                        sortable: true
                    }, {
                        field: 'CreatedByName',
                        title: '发起人姓名',
                        sortable: true
                    }, {
                        field: 'BusinessUnitIdName',
                        title: '发起人部门',
                        sortable: true
                    }, {
                        field: 'StartedByName',
                        title: '来源提交人',
                        sortable: true
                    }, {
                        field: 'CreatedOn',
                        title: '提交时间',
                        sortable: true
                    }, {
                        field: 'Deadline',
                        title: '办理期限',
                        sortable: true
                    }, {
                        field: 'UrgeTimes',
                        title: '催办次数',
                        sortable: true
                    }]
                }
            }, ],
        },
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
var instanceoperator = [{
    label: '一般',
    value: '0',
}, {
    label: '紧急',
    value: '1',
}, {
    label: '加急',
    value: '2',
}]
