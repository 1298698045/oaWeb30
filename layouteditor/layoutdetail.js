if ($('#detailview').length > 0) {
    var vue = new Vue({
        el: '#detailview',
        data: {
            entityApiName: '',
            entityLabel:'',
            record: {},
            list: {
                sections: []
            },
            detailviewloading: true,
            activesections: []
        },
        created: function () {
            this.getdata()
        },
        methods: {
            getdata: function (id) {
                if (!id) {
                    var id = getQueryString('id')
                }
                var objectTypeCode = getQueryString('objectTypeCode')

                var that = this
                ajaxMethodGetData('entity.recordandlayout.get', { id: id, objectTypeCode: objectTypeCode }, function (data) {
                    that.entityApiName = data.actions[0].returnValue.entityApiName
                    that.entityLabel = data.actions[0].returnValue.entityLabel
                    that.record = data.actions[0].returnValue.record
                    that.list.sections = data.context.componentDefs[0].lt.sections
                    for (var i = 0; i < that.list.sections.length; i++) {
                        if (that.list.sections[i].isCollapsed) {
                            that.activesections.push(i)
                        }
                    }
                    that.detailviewloading = false
                    $('.entityLabel').html(data.actions[0].returnValue.entityLabel)
                    $('h1 .uiOutputText').html(data.actions[0].returnValue.entityLabel)
                    var YearNumber = that.record.YearNumber
                    var MonthNumber = that.record.MonthNumber
                    if (YearNumber) {
                        window.YearNumber = YearNumber
                    }
                    if (MonthNumber) {
                        window.MonthNumber = MonthNumber
                    }
                })
            }
        }
    })
}

if ($('#vueRelatedListBlock').length > 0) {
    var vueRelatedListBlock = new Vue({
        el: '#vueRelatedListBlock',
        data: {
            relatedLists: [],
            listItems: {},
            recordIds: {},
            records: {},
            list: {},
            entityLabel: '',
            fileList: [],
            actionurl:''
        },
        created: function () {
            this.getdata()

        },
        methods: {
            getdata: function (id) {
                if (!id) {
                    var id = getQueryString('id')
                }
                var objectTypeCode = getQueryString('objectTypeCode')

                var that = this
                ajaxMethodGetData('entity.relatedlistinfos.get', { objectTypeCode: objectTypeCode }, function (data) {
                    that.relatedLists = data.actions[0].returnValue.relatedLists
                })
                this.getrelatedata(id)
            },
            getrelatedata: function (id) {
                var objectTypeCode = getQueryString('objectTypeCode')
                var that = this
                ajaxMethodGetData('entity.relatedrecords.get', { objectTypeCode: objectTypeCode, id: id }, function (data) {
                    that.listItems = data.actions[0].returnValue.listItems
                    that.recordIds = data.actions[0].returnValue.recordIds
                    that.records = data.actions[0].returnValue.records
                })
            },
            handleCommand: function (d) {
                var f = d.split('&')[0]
                var id = d.split('&')[1]
                var relatedListApiName = d.split('&')[3]
                var relatedObjectAttributeName = d.split('&')[4]
                this[f](id, relatedListApiName, relatedObjectAttributeName)
            },
            recordedit: function (id, name, relatedObjectAttributeName) {
                $('#iframe').attr('src', '/layouteditor/add_layout.html?id=' + id + '&entityName=' + name + '&type=related' + '&relatedObjectAttributeName=' + relatedObjectAttributeName)
                $('#changeDiv').show()
            },
            recordremove: function (id,obj) {
                $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&objTypeCode='+obj)
                $('#changeDiv').show()
            },
            addRelatedItem: function (name, relatedObjectAttributeName) {
                //新建相关
                $('#iframe').attr('src', '/layouteditor/add_layout.html?entityName=' + name + '&type=related' + '&relatedObjectAttributeName=' + relatedObjectAttributeName)
                $('#changeDiv').show()

            },
            filecontent: function (id, objectTypeCode) {
                this.actionurl = '/apps/CommandProcessor.ashx?c=1&cmd=file.attachment.upload&pid=' + id + '&type=' + objectTypeCode
                this.fileid = id
                this.fileobjectTypeCode = objectTypeCode
                var that = this
                ajaxMethodGetData('file.attachment.getlist', { id: id }, function (data) {
                    that.fileList = data.listData;
                })
            },
            filesuccess: function () {
                $('.el-popover.el-popper').hide()
            },
            filedown: function (url) {
                window.open(url)
            },
            filedelete: function (id) {
                var that = this
                ajaxMethodPostData('file.attachment.delete', { id: id }, function (data) {
                    that.filecontent(that.fileid, that.fileobjectTypeCode)
                })
            }
        }
    })
}

$(document).ready(function () {
    if (vue.entityLabel && vueRelatedListBlock)
        vueRelatedListBlock.entityLabel = vue.entityLabel;
})


$('#change').click(function () {
    var name = vue.entityApiName
    var id = getQueryString('id')
    $('#iframe').attr('src', '/layouteditor/add_layout.html?entityName=' + name + '&id=' + id)
    $('#changeDiv').show()
})

