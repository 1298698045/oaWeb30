var app = new Vue({
    el: "#app",
    components: {
        Comment
    },
    data: function () {
        return {
            categoryList: [
                {
                    Id: '',
                    ObjectTypeCode: '',
                    Name: '全部分类'
                }
            ],
            tableData: [
              {
                  start: "开始",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  start: "开始",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1517 弄",
              },
              {
                  start: "开始",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1519 弄",
              },
              {
                  start: "开始",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1516 弄",
              }
            ],
            current: "tab1",
            selectTableData: [
              {
                  date: "2016-05-03",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-02",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-04",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-01",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-08",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-06",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-07",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              }
            ],
            multipleSelection: [],
            remarksFile: [
              {
                  date: "2016-05-03",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-02",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-04",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-01",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-08",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-06",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              },
              {
                  date: "2016-05-07",
                  name: "王小虎",
                  address: "上海市普陀区金沙江路 1518 弄",
              }
            ],
            multipleSelectionRemarks: [],
            circulationRecord: [],
            categoryFiles: [],
            relationList: [], // 关联事务
            tableFiles: [], // 相关事务与附件
            readLogList: [], // 浏览记录
            rulelogList: []
        };
    },
    created: function () {
        this.getsTeppri();
        this.getFilesCategory();
        this.queryFileList();
        this.getRelevantEnclosure();
        this.getRulelog();
        this.getReadlog();
        this.getRelatedQuery();
        //this.getRuleInfo();
    },
    methods: {
        // 获取事务权限
        getsTeppri: function () {
            var that = this;
            var url = "/apps/CommandProcessor.ashx?cmd=process.steppri.get";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    processId: getQueryString('id'),
                    stepId: jQuery("#stepId").val()
                },
                error: function (request, textStatus, errorThrown) {
                    // errorThrown = String(errorThrown).replace(/&/g, "&").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, ">");
                },
                success: function (data, textStatus) {

                },
                type: "GET",
                url: url
            });
        },
        toggleSelection: function (rows) {
            if (rows) {
                rows.forEach(function (row) {
                    this.$refs.multipleTable.toggleRowSelection(row);
                });
            } else {
                this.$refs.multipleTable.clearSelection();
            }
        },
        handleSelectionChange: function (val) {
            console.log(val, "====");
            this.multipleSelection = val;
        },
        handleClickPreview: function (row) {
            console.log(row);
        },
        selectRemarksChange: function (val) {
            console.log(val);
            this.multipleSelectionRemarks = val;
        },
        // 附件分类
        getFilesCategory: function () {
            var that = this;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=attachment.category.getlist";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    ObjectTypeCode: 30022
                },
                error: function (request, textStatus, errorThrown) {
                    // errorThrown = String(errorThrown).replace(/&/g, "&").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, ">");
                },
                success: function (data, textStatus) {
                    that.categoryList = that.categoryList.concat(data.returnValue.records);
                    console.log(that.categoryList)
                },
                type: "GET",
                url: url
            });

        },
        // 附件列表
        queryFileList: function () {
            var that = this;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=process.instance.file.getlist";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    // InstanceId: "d40d420f-d534-4f06-b072-05946cf9c936",
                    InstanceId: getQueryString('id'),
                    InstanceState: 1,
                    right: 16
                },
                error: function (request, textStatus, errorThrown) {
                    // errorThrown = String(errorThrown).replace(/&/g, "&").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, ">");
                },
                success: function (data, textStatus) {
                    that.categoryFiles = data.CategoryFiles;
                },
                type: "GET",
                url: url
            });
        },
        // 相关事务与附件
        getRelevantEnclosure: function () {
            var that = this;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=process.instance.file.getlist";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    InstanceId: getQueryString('id'),
                    InstanceState: 1,
                    right: 16
                },
                error: function (request, textStatus, errorThrown) {
                    // errorThrown = String(errorThrown).replace(/&/g, "&").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, ">");
                },
                success: function (data, textStatus) {
                    data.CategoryFiles.forEach(function (item) {
                        that.tableFiles = that.tableFiles.concat(item.Files);
                    })
                },
                type: "GET",
                url: url
            });
        },
        // 流转信息 关联事务 process.instance.rulelog.getlist
        getRulelog: function () {
            var that = this;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=process.instance.rulelog.getlist";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    processInstanceId: getQueryString('id')
                },
                error: function (request, textStatus, errorThrown) {
                    that.rulelogList = [];
                },
                success: function (data, textStatus) {
                    console.log('data', data)
                    that.rulelogList = data.rows;
                },
                type: "GET",
                url: url
            });
        },
        getRuleInfo:function(){
            var that = this;
            var url = "/apps/wf/NotifyMem.aspx?c=1&cmd=entity.config.get";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    ObjTypeCode: '122',
                    id: getQueryString('id')
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                },
                type: "GET",
                url: url
            });
        },
        // process.instance.readlog.getlist 浏览记录
        getReadlog: function () {
            var that = this;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=process.instance.readlog.getlist";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    processInstanceId: getQueryString('id')
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    console.log('datadatadata', data)
                    that.readLogList = data.rows;
                },
                type: "GET",
                url: url
            });
        },
        handleDownloadUrl: function (url, name) {
            downloadFile(url, name)
        },
        // 关联事务 process.instance.related.getlist
        getRelatedQuery() {
            var that = this;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=process.instance.related.getlist";
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    processInstanceId: getQueryString('id')
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    console.log('===', data)
                    that.relationList = data.rows;
                },
                type: "GET",
                url: url
            });
        }
    },
});
/**
 * 模拟a标签下载接口文件流
 *
 * @param {Object} response response.data为Blob对象或字符串数据流
 * @param {String} name 包含后缀的文件名：不传则从response中截取
 *
 * @return {none}
 *
 */
 function downloadFile(response, name) {
    let blob,fileName;

    // 文件流对象检测
    if(Object.prototype.toString.call(response.data).includes('Blob')) {
        // 如果是json数据则不下载
        if(response.data.type=='application/json') return

        blob = response.data
    } else {
        blob = new Blob([response.data])
    }

    // 文件名处理
    if(!name) {
        let disposition = response.headers['content-disposition'];
        name = disposition.replace('attachment;filename=', '');
        fileName = decodeURI(name)
    } else {
        fileName = name
    }

    if (window.navigator.msSaveBlob) {
        //这个是IE浏览器独有的方法，用来判断当时是不是IE浏览器
        window.navigator.msSaveBlob(blob, fileName); //此方法即可下载成功
    } else {
        // 谷歌浏览器 创建a标签 添加download属性下载
        let element = document.createElement("a");
        const url = window.URL.createObjectURL(blob);
        element.href = url;
        element.download = fileName;
        document.body.appendChild(element);
        element.click();
        document.body.removeChild(element);
        window.URL.revokeObjectURL(url);
    }
}
// Vue.component(id, [definition])