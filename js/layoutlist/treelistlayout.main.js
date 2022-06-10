


function createdlayout(name) {
	var that = this
	var thisself = this
	this.contractname = name

	//console.log(this)
	this.formcomponents = formcomponents
	this.init = function () {
		//console.log(this)
		this.createdlayout()
	}
	this.createdlayout = function () {
		var contractname = this.contractname
		var template = window.layoutdata[contractname].template
		$('.header-title').html(template.head.title)
		$('head title').html(template.head.title)
		if (parent.$('head title') && parent.$('head title').length) {
            parent.$('head title').html(template.head.title)
		}
		$('.logo-img img').attr('src', template.head.logo)

		var btns = template.head.btns
		var that = this
		for (var i = 0; i < btns.length; i++) {
			var item = btns[i]
			if (item.label == '搜索') {
				$('.head-right-btn').append('<div onclick="reloadgrid()"  class="layui-btn layui-btn-sm ' + item.type + '">' + item.label + '</div>')
			} else if (item.label == '导出') {
			    $('.head-right-btn').append('<div onclick="exported()"  class="layui-btn layui-btn-sm ' + item.type + '">' + item.label + '</div>')
			} else {
				window[item.click.n] = item.click.f
				$('.head-right-btn').append('<div onclick="' + item.click.n + '()"  class="layui-btn layui-btn-sm ' + item.type + '">' + item.label + '</div>')
			}
		}

		$('.head-right-btn div').eq(0).hide()
		$('.head-right-btn div').eq(1).hide()

		var tabs = template.tabs
		if (template.head.title == '信息管理' || template.head.title == '通知管理') {
		    var type = 1
		    if (template.head.title == '通知管理') {
		        type = 2
		    }
		    ajaxMethodGetData('content.header.count&type='+type, null, function (data) {
		        for (var i = 0; i < tabs.length; i++) {
		            var item = tabs[i]
		            var countdata = data.count
		            if (item) {
		                if (item.label == '待审批') {
		                    $('.layui-tab-title').append('<li name="' + item.name + '" ><span class="tab-title">' + item.label + '</span><span class="tab-count" style="margin-left:5px;color:rgba(255, 0, 0, 1);">' + (countdata ? countdata : 0) + '</span>' + '</li>')
		                }
		                else {
		                    $('.layui-tab-title').append('<li name="' + item.name + '" >' + item.label + '</li>')
		                }
		            }
		        }
		      
		    })
		}
		else {
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
		    if ($(this).children('.tab-title').text() == '待审批' || $(this).text() == '我管理的') {
		        $('.head-right-btn div').eq(0).show()
		        $('.head-right-btn div').eq(1).show()
		    }
		    else {
		        $('.head-right-btn div').eq(0).hide()
		        $('.head-right-btn div').eq(1).hide()
		    }
		})
		$('.layui-tab-title li:first').addClass('layui-this')
		tabchange(tabs[0], that)
		$('.layui-tab-title li').css({'min-width':'unset'})
	}
	this.getlookupfilter = function (type) {
		var searchform = []
		var GridColumns = []
		var that = this
		ajaxMethodGetAsyncData('entity.lookupfilter.getlist', { objectTypeCode: this.activetab.table.objecttypecode }, false, function (data) {
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
			
		    var chosefield = ''
		    if (data && data.returnValue && data.returnValue.GridColumns) {
		        for (var i = 0; i < data.returnValue.GridColumns.length; i++) {
		            var item = data.returnValue.GridColumns[i]
		            GridColumns.push({
		                field: item.Name,
		                title: item.Title,
		                sortable: true,
		            })
		            if (item.IsNameField && that.activetab.common == true) {
		                chosefield = item.Name
		                GridColumns.unshift({
		                    field: 'LIST_RECORD_ID',
		                    title: '操作',
		                    formatter: function formatter(value, row, index) {
		                        return '<a onclick="chooselookup(\'' + row.LIST_RECORD_ID + '\',\'' + row[chosefield] + '\')" style=\"color:#015ba7;font-size:13px;\" href="javascript:">选择</a>&nbsp;';
		                    }
		                })
		            }
		        }
		    }
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
	    var item = that.activetab;
	    //debugger;
		$('.statistics-content').html('')
		if (item.summary.length > 0) {
			for (var i = 0; i < item.summary.length; i++) {
				if (item.summary[i].label) {
					$('.statistics-content').append('<div class="layui-card">'
                    + '  <div class="layui-card-body">'
                    + '      <div class="statistics-left">'
                    + '          <div class="statistics-name">' + item.summary[i].label + '</div>'
                    + '          <div class="statistics-count" name="' + item.summary[i].name + '">25</div>'
                    + '      </div>'
                    + '      <div class="statistics-right">'
                    + '          <div class="layui-icon ' + item.summary[i].type + '" style="color:#108def;"></div>'
                    + '      </div>'
                    + '  </div>'
                    + '</div>')
				}
			}
			$('.statistics-content .layui-card').width($('.statistics-content').width() / $('.statistics-content .layui-card').length - 10)
			ajaxMethodGetAsyncData(that.activetab.summaryurl, { objtypecode: this.activetab.table.objecttypecode }, false, function (data) {
				for (item in data.data.listData.Table[0]) {
					$('.statistics-count[name="' + item + '"]').html(data.data.listData.Table[0][item])
				}
			})
		}
	}
	this.gettree = function () {
	    $('.main-content').width($('.bodyDiv').width() - 260 - 1)
	    $('#treePanel').height(window.gridcontentheight)
	    if (that.activetab.treeentity) {
            this.treeNode = null;
            var card = '';
            this.treeNode = new treeLoader("LeftTree", that.activetab.treeentity, function (node) {
                that.getgrid()
            });
	        this.treeNode.init();
	    } else {
	        ajaxMethodGetData(that.activetab.treequeryurl, null, function (data) {
	            var datas = data.data;
	            treedata = datas
	            $("#LeftTree").tree({
	                data: datas,
	                onClick: function (node) {
	                    tofolder(node.id)
	                },
	                onLoadSuccess: function (node, data) {
	                    //$("#LeftTree").tree('expandAll')
	                    $("#LeftTree").tree('collapseAll');
	                    var root = $(this).tree('getRoot').target
	                    $(this).tree('expand', root.target);
	                    $(this).tree('collapseAll');
	                },
	                formatter: function (node) {
	                    if (node.parent) {
	                        return '<span class="treename">' + node.name + '</span><span class="treenum">' + node.text + '</span>';
	                    }
	                    else {
	                        return '<span class="treename">' + node.name + '</span><span class="treenum"></span>';
	                    }
	                }
	            });
	        })
	        //var screenHeight = getClientHeight();
	        //$("#treePanel").height(screenHeight - 75);
	    }
    },
	this.getgrid = function () {
	    $(document).ready(function () {
		var table = that.activetab.table

		var gridcontentheight = window.gridcontentheight - $('.search-content').height() - $('.statistics-content').height()

		$('.gridcontent').height(gridcontentheight)
		$('.gridcontent').html('<div id="datagrid"></div><div id="datagridExport"></div>')
		$('#datagrid').height(gridcontentheight)
		$('#datagridExport').height(0)
		this.columnsArray = []
		if (table.columnsArray) {
		    this.columnsArray = table.columnsArray;
		} else {
		    this.columnsArray = table.GridColumns;
		}
		var self = this;
		var random = Math.ceil(Math.random() * 10000);
		var data = {
			gd: '',
			entityType: '',
			objecttypecode: table.objecttypecode
		}
		var url = layoutdata.requesturl + table.cmd
		var filterquery = ''

		var queryParams = {
			objecttypecode: table.objecttypecode
		}
		var node = $('#LeftTree').tree('getSelected')
		if (node) {
		    var treenode = $('#LeftTree').tree('getData', node.target)
		    //var ids = this.treeNode.getchildrendata(treenode)
		    var ids = []
		    getchildrendata(treenode)
		    function getchildrendata(data) {
		        ids.push(data.id)
		        if (data.children.length > 0) {
		            for (var i = 0; i < data.children.length; i++) {
		                getchildrendata(data.children[i])
		            }
		        }
		    }
		    ids = ids.join(',')
            var leftSrchName = that.activetab.leftSrchName ? that.activetab.leftSrchName : 'ProcessId';
            var extSrch = leftSrchName+"\tin\t" + ids;
            filterquery += extSrch
        }

		for (var i = 0; i < $('.search-content .layui-form-item').length; i++) {
			if ($('.search-content .layui-form-item').eq(i).find('select').length > 0) {
			    if ($('.search-content .layui-form-item').eq(i).find('select').val() != '') {
					var name = $('.search-content .layui-form-item').eq(i).find('select').attr('name')
					var value = $('.search-content .layui-form-item').eq(i).find('select').val()
					if (value == 'customize') {
					    value = $('.search-content .layui-form-item').eq(i).find('select').next().next().val().split(' - ').join(',')
					    filterquery += '\n' + name + '\tbetween\t' + value
					} else if ($('.search-content .layui-form-item').eq(i).find('select').attr('lay-filter') == 'timechook') {
					    filterquery += '\n' + name + '\t' + value
					} else {
					    filterquery += '\n' + name + '\teq\t' + value
					}
					if (table.filterquery != true) {
						queryParams[name] = value
					}
				}
			} else {
			    if ($('.search-content .layui-form-item').eq(i).find('input').val()&&$('.search-content .layui-form-item').eq(i).find('input').val() != '') {
					var name = $('.search-content .layui-form-item').eq(i).find('input').attr('name')
					var value = $('.search-content .layui-form-item').eq(i).find('input').val()
					filterquery += '\n' + name + '\tcontains\t' + value
					if (table.filterquery != true) {
						queryParams[name] = value
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
		url += '&objecttypecode=' + table.objecttypecode
		if (table.iscommon == true) {
			ajaxMethodGetAsyncData('entitygrid.config.get', {
				objecttypecode: table.objecttypecode
			}, false, function (data) {
			    
				for (var i = 0; i < data.DataSet.Columns.length; i++) {
					var res = data.DataSet.Columns[i]
					self.columnsArray.push({
						field: res.Name,
						title: res.Title,
						sortable: true,
					})
				}
			})
		}
		//var filterId = '';
		//if (name = 'docInlst') {
		//    filterId = 'd93a75d1-41da-4792-bec0-31366bd88623'
		//}
		//if (name = 'docOutlst') {
		//    filterId = '9b44097d-328b-40fa-9603-c79ce7adb02b'
		//}
		//if (name = 'proclst') {
		//    filterId = '0531eacb-8701-4398-a16f-4c0a6f7cdd3c'
		//}
		$('#datagrid').datagrid({
		    columns: [self.columnsArray],
		    fitCloumns: true,
		    idField: "LIST_RECORD_ID",
		    singleSelect: false,
		    checkOnSelect: true,
		    method: 'POST',
		    pagination: true,
		    rownumbers: true,
		    url: url,
            fit:true,
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
		        data0.total = data&&Number(data.total) ? Number(data.total) : data0.rows.length;
		        return data0
		    },
		    pageSize: 15,
		    pageList: [10, 15, 20, 25, 30, 50, 100],
		    queryParams: {
		        filterquery: filterquery
		    },
		    onDblClickRow: function onDblClickRow(index, row) {
		    },
		    onLoadSuccess: function (data) {
		        $('#datagrid').datagrid('clearChecked')
		        that.layoutelement.render()
		        $('.layui-progress-bar').each(function () {
		            $(this).css('width', $(this).attr('lay-percent'))
		        })

		        layui.use(['dropdown'], function () {
		            var dropdown = layui.dropdown
		            dropdown.render({
		                elem: '.editoption',
		                data: table.editoption,
		                click: function (obj) {
		                    var elem = $(this.elem)
		                    var AccountId = elem.data('accountid')
		                    var ContractId = elem.data('contractid')
		                    obj.f(ContractId, AccountId)
		                }
		            });
		        });
		    }
		});
	})
	}
}
for (item in formcomponents) {
	createdlayout.prototype[item] = formcomponents[item]
}
function reloadgrid() {
	mylayout.getgrid()
}
function exported() {
    mylayout.getexport()
}
function tofolder() {
    mylayout.getgrid()
}
function reset() {
    $('.search-content .layui-form-item').find('select').val('');
    $('.search-content .layui-form-item').find('input').val('');
    mylayout.getgrid()
}
$(document).ready(function () {
    $('body').on('keyup', '.layui-input-block input', function (event) {
        if (event.keyCode == '13') {
            reloadgrid()
        }
    });
});
function tabchange(item, that) {
	that.activetab = item
	if (item.issearchform) {
	} else {
	    item.searchform = that.getlookupfilter('searchform')
	}
	item.table.GridColumns = that.getlookupfilter('GridColumns')
    that.gettree()
    that.getselect()
    //if (item.summary && item.summary.length) {
    //    that.getsummary()
    //} else {
    //    $('.statistics-content').hide()
    //}
    that.getsummary()
	$('.search-content .layui-form').html('')
	for (var i = 0; i < item.searchform.length; i++) {
		var res = item.searchform[i]
		var html = '<div class="layui-form-item">'
                    + '<label class="layui-form-label">' + res.label + '：</label>'
                    + '<div class="layui-input-block">'
		if (res.type == 'S') {
			html += '<input type="text" name="' + res.name + '" placeholder="' + res.placeholder + '" autocomplete="off" class="layui-input">'
		} else if (res.type == 'L' || res.type == 'LT' || res.type == 'DT') {
			html += '<select  name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
			if (that.select && res && res.name != 'undefined' && that.select[res.name]) {
			    for (var j = 0; j < that.select[res.name].length; j++) {
			        var option = that.select[res.name][j]
			        html += '<option value="' + option.value + '">' + option.label + '</option>'
			    }
			}
			html += '</select>'
		} else if (res.type == 'D' || res.type == 'F') {
			html += '<select lay-filter="timechook" name="' + res.name + '" lay-verify="">'
                 + '<option value="">' + res.placeholder + '</option>'
			for (var j = 0; j < timeoperator.length; j++) {
				var option = timeoperator[j]
				if (option) {
					html += '<option value="' + option.value + '">' + option.label + '</option>'
				} else {
					html += '<option value=""></option>'
				}
			}
			html += '<option value="customize">自定义</option>'

			html += '</select>'
			html += '<input style="display:none" placeholder="请选择时间" datatype="' + res.type + '" id="laydate' + item.name + i + '" class="laydate layui-input"  name="' + res.name + '" autocomplete="off" />'
		} else if (res.type == 'O' || res.type == 'Y' || res.type == 'U' || res.type == 'Y_MD') {
			html += '<div Lktp="' + res.objtypecode + '" class="layui-input-block searchselect">'
                + '<select id="select' + item.name + res.name + '" lay-search lay-verify="" name="' + res.name + '"><option value="">请选择</option></select>'
			html += ' <img title="' + res.label + '" class="searchimg" src="/img/images/02.1-1.Search_.png" />'
		} else if (res.type == 'I') {
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
		} else {
			html += '<input type="text" name="' + res.name + '" placeholder="' + res.placeholder + '" autocomplete="off" class="layui-input">'

		}
		html += '</div>'
                + '</div>'
		$('.search-content .layui-form').append(html)
	}
	if ($('.layui-form-item').length > 0 && !$('.header-right').length) {

	    $('.search-content .layui-form').append('<div class="layui-form-item"><div style="margin-top:20px;margin-left:0;" onclick="reloadgrid()" class="layui-btn layui-btn-sm layui-btn-normal formitem-searchbtn">查询</div></div>')
	    $('.search-content .layui-form').append('<div class="layui-form-item"><div style="margin-top:20px;margin-left:0;" onclick="reset()" class="layui-btn layui-btn-sm layui-btn-normal formitem-searchbtn">重置</div></div>')
	}

	$('.searchimg').click(function () {
	    that.formcomponents.chooselookup($(this).parents('.searchselect').attr('Lktp'), $(this).parents('.searchselect').find('select').attr('id'), $(this).attr('title'))
	})
	



	that.layoutform.render()
	that.layoutform.on('select(timechook)', function (data) {
	    if (data.value == 'customize') {
			$(data.othis).next().show()
		} else {
			$(data.othis).next().hide()

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
				}
			});
		} else if (datatype == 'Year') {
			laydate.render({
				elem: '#' + id,
				type: 'year',
				format: 'yyyy',
				trigger: 'click',

				done: function (value) {
				}
			});
		} else if (datatype == 'Month') {
			laydate.render({
				elem: '#' + id,
				type: 'month',
				format: 'yyyy-MM',
				trigger: 'click',

				done: function (value) {
				}
			});
		}
	})
	that.getgrid()
}
