<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>内容编辑 - 人力资源 - 北京凤凰世纪科技有限公司</title>
    <link href="/css/file.css" rel="stylesheet" />
    <style>
        *{
            margin:0;
            padding:0;
        }
        html,body,#vueapp{
            height:100%;
            background-color:#f2f2f2;
            overflow:hidden;

        }
        .content-header>div{
            float:left;
        }
        .content-header .head-right{
            float:right;
            margin-top:10px;
        }
        .logo-content{
            height:40px;
            line-height:40px;
            text-align:center;
            width:40px;
            border-radius:50%;
            background-color:rgb(87, 153, 229);
            font-size:23px;
        }
        .el-icon-s-order{
            color:white;
        }
        .content-header{
            padding:10px;
            border-bottom:1px solid #dedede;
            overflow:hidden;
            background-color:white;
            padding-bottom:0;
        }
        .head-logo{
            margin-left:10px;
            margin-right:20px;
            margin-top:10px;
        }
        .content-header .el-tabs__nav-wrap::after{
            background-color:white;
        }
        .content-header .el-tabs__header{
            margin-bottom:0;
        }
        .content-body{
            height:calc(100% - 100px);
            overflow-y:auto;
            overflow-x:hidden;
            margin:20px;
            border:1px solid #dedede;
            background-color:white;
        }
        .content-body .cke_chrome{
            border:0;
        }
        .el-form{
            padding:20px;
            padding-top:40px;
        }
        .el-form-item{
            float:left;
            width:38%;
            margin:0 6%;
        }
        .el-input,.el-select{
            width:100%;
        }
        .el-form-item{
            position:relative;
        }
        .lookresultbtn{
            color:#666;
            cursor:pointer;
            position:absolute;
            right:15px;
            top:0px;
        }
        .el-date-editor{
            width:100% !important;
        }
        .el-table__header-wrapper th {
            background-color: #f8fcff !important;
        }
        .fileview{
            cursor:pointer;
            color:#409EFF;
        }
        .file-preview {
            display: block;
        }

        .file-preview-head-right img {
            margin-top: 0;
        }

        .file-preview-type img {
            margin-top: 0;
        }

        .file-preview-head-middle img {
            margin-top: 20px;
        }

        .file-preview-download {
            color: white;
        }

        .pagination {
            position: absolute;
            right: -100px;
            top: 100px;
            color: #108def;
        }
        .file-preview{
            display:none;
        }
        .head-title{
            overflow:hidden;
        }
        .required{
            color:red;
            float:left;
            line-height:28px;
        }
        .title-name{
            float:left;
            line-height:28px;

        }
        .head-title .el-input{
            float:left;
            width:calc(100% - 50px);
            margin-left:5px;
        }
        #iframe {
    position: fixed;
    z-index: 1000;
    background-color: white;
    width: 60%;
    left: 20%;
    top: 50%;
    margin-top: -300px;
    border-radius: 7px;
    display: none;
    height: 620px;
    border: 0;
}
        .popup-mask {
            display:none;
            position: fixed;
            background-color:transparent;
            width:100%;
            height:100%;
            top:0;
            z-index:999;
            left:0;
            position:fixed;
            background: url(/img/bgOverlayDialogBackground.png) ;
            background-color: transparent;
        }
    </style>
</head>
<body class="body">
    <div id="vueapp">
        <div class="content-header">
            <div class="head-logo">
                <div class="logo-content">
                    <i class="el-icon-s-order"></i>
                </div>
            </div>
            <div class="head-middle">
                <div class="head-title">
                    <span class="required">*</span>
                    <span class="title-name">标题</span>
                    <el-input size="mini" v-model="list.Title"></el-input>
                </div>
                <el-tabs v-model="activeName" >
                  <el-tab-pane label="正文内容" name="first"></el-tab-pane>
                  <el-tab-pane label="文档属性" name="second"></el-tab-pane>
                  <el-tab-pane label="文档附件" name="third"></el-tab-pane>
                </el-tabs>
            </div>
            <div class="head-right">
                <el-button size="small" @click="saveform(1)" class="save-checking">提交</el-button>
                <el-button size="small"@click="saveform(2)" class="save-checking">草稿</el-button>
            </div>
        </div>
        <div class="content-body">
            <div class="content-body-mainbody" v-show="activeName=='first'">
                 <textarea id="ckeditcontent" v-model="list.ContentBody"></textarea>
            </div>
            <div class="content-body-msg" v-show="activeName=='second'" >
                <el-form :model="list"  ref="ruleForm" label-width="80px" >
                      <el-form-item 
                          label="发布人"
                          prop="CreatedBy2"
                          :rules="[{ required: 'true', message: '请选择发布人', trigger: 'change' }]">
                          <el-select 
                                     v-model="list.CreatedBy.Id"
                                     filterable
                                     remote
                                     @change="function(val){lookupchange(val,'CreatedBy')}"
                                     @visible-change="getlookup('8','CreatedBy')"
                                     :remote-method="function(query){searchlookup(query,'8','CreatedBy')}"
                                     placeholder="请选择">
                              <el-option v-for="item in search.CreatedBy"
                                         :key="item.ID"
                                         :label="item.Name"
                                         :value="item.ID">
                              </el-option>
                           </el-select> 
                           <div @click="choosepeople('CreatedBy',8)" class="lookresultbtn">
                               <i class="el-icon-search"></i>
                           </div>
                      </el-form-item>
                      <el-form-item label="发布部门"prop="BusinessUnitId">
                          <el-select 
                                     v-model="list.BusinessUnitId.Id"
                                     filterable
                                     remote
                                     @visible-change="getlookup('10','BusinessUnitId')"
                                     :remote-method="function(query){searchlookup(query,'10','BusinessUnitId')}"
                                     placeholder="请选择">
                              <el-option v-for="item in search.BusinessUnitId"
                                         :key="item.ID"
                                         :label="item.Name"
                                         :value="item.ID">
                              </el-option>
                           </el-select> 
                           <div @click="choosedept('BusinessUnitId',10)" class="lookresultbtn">
                               <i class="el-icon-search"></i>
                           </div>
                      </el-form-item>
                      <el-form-item label="标题"
                          prop="Title"
                           :rules="[{ required: true, message: '请输入标题', trigger: 'blur' }]">
                        <el-input v-model="list.Title"></el-input>
                      </el-form-item>
                      <el-form-item label="所属栏目"prop="FolderId">
                        <el-select 
                                     v-model="list.FolderId.Id"
                                     filterable
                                     remote
                                     @visible-change="getlookup('100200','FolderId')"
                                     :remote-method="function(query){searchlookup(query,'100200','FolderId')}"
                                     placeholder="请选择">
                              <el-option v-for="item in search.FolderId"
                                         :key="item.ID"
                                         :label="item.Name"
                                         :value="item.ID">
                              </el-option>
                           </el-select> 
                           <div @click="chooselookup('FolderId',100200)" class="lookresultbtn">
                               <i class="el-icon-search"></i>
                           </div>
                      </el-form-item>
                    <el-form-item label="置顶信息">
                          <el-checkbox name="type" v-model="list.IsTop"></el-checkbox>
                      </el-form-item>
                      <el-form-item label="重要信息">
                          <el-checkbox name="type" v-model="list.IsImportant"></el-checkbox>
                      </el-form-item>
                    <el-form-item label="置顶截止">
                        <el-date-picker
                           :disabled="!list.IsTop"
                           value-format="yyyy-MM-dd"
                           v-model="list.EndTopDate"
                           type="date"
                           placeholder="选择日期">
                         </el-date-picker>
                      </el-form-item>
                    <el-form-item label="附件权限">
                        <el-select 
                                   v-model="list.AttachRightCode"
                                   placeholder="请选择">
                            <el-option v-for="item in select.AttachRightCode"
                                       :key="item.value"
                                       :label="item.label"
                                       :value="item.value">
                            </el-option>
                        </el-select> 
                      </el-form-item>
                      <el-form-item label="状态">
                          <el-select 
                                   v-model="list.StateCode"
                                   placeholder="请选择">
                            <el-option v-for="item in select.StateCode"
                                       :key="item.value"
                                       :label="item.label"
                                       :value="item.value">
                            </el-option>
                        </el-select> 
                      </el-form-item>
                    <el-form-item label="发布时间">
                        <el-date-picker
                         value-format="yyyy-MM-dd"
                           v-model="list.ApprovedOn"
                           type="date"
                           placeholder="选择日期">
                         </el-date-picker>
                      </el-form-item>
                    </el-form>
            </div>
            <div class="content-body-file" v-show="activeName=='third'">
                <el-table
                  :data="tableData"
                  :height="tableheight"
                  style="width: 100%">
                  <el-table-column
                      sortable
                    label="附件名称">
                      <div slot-scope="scope">
                          <span class="fileview" @click="tofileview(scope.row)">
                          {{scope.row.name}}
                          </span>
                      </div>
                  </el-table-column>
                  <el-table-column
                    prop="size"
                      sortable
                    label="附件大小">
                  </el-table-column>
                    <el-table-column
                        width="100"
                    label="操作">
                        <template slot-scope="scope">
                            <el-popover
                              placement="top"
                              width="160"
                              v-model="scope.row.visible">
                              <p>确定删除吗？</p>
                              <div style="text-align: right; margin: 0">
                                <el-button size="mini" type="text" @click="scope.row.visible = false">取消</el-button>
                                <el-button type="primary" size="mini" @click="scope.row.visible = false;deletefile(scope.row)">确定</el-button>
                              </div>
                              <el-button slot="reference" type="text">删除</el-button>
                            </el-popover>
                          </template>
                  </el-table-column>
                </el-table>
                <el-upload
                      class="upload-demo"
                      action="https://jsonplaceholder.typicode.com/posts/"
                      multiple
                      :limit="3"
                    :show-file-list="false"
                    >
                <el-button style="margin:8px;" size="small" type="primary">上传附件</el-button>
            </div>
        </div>
        <div class="file-preview" v-show="fileview.show">
            <div class="file-preview-mask"></div>
            <div class="file-preview-head">
                <div class="file-preview-head-left">
                    <div class="file-preview-type">
                        <img src="/img/filetype/xls.png" v-if="fileview.FileExtension == 'xls' || fileview.FileExtension == 'xlsx'">
                        <img src="/img/filetype/doc.png" v-else-if="fileview.FileExtension == 'docx' || fileview.FileExtension == 'doc'">
                        <img src="/img/filetype/rar.png" v-else-if="fileview.FileExtension == 'zip'">
                        <img src="/img/filetype/Pdf.png" v-else-if="fileview.FileExtension == 'pdf'">
                        <img src="/img/filetype/Folder.png" v-else-if="fileview.FileExtension == 'txt'">
                        <img src="/img/filetype/Image.png" v-else-if="fileview.FileExtension == 'png'|| fileview.FileExtension == 'jpg'|| fileview.FileExtension == 'bmp'|| fileview.FileExtension == 'jpeg'">
                        <img src="/img/filetype/Folder.png" v-else>
                    </div>
                    <div class="file-preview-name">
                        <span>{{fileview.name}}</span>
                    </div>
                </div>
                <div class="file-preview-head-middle">
                    <a :href="fileview.DownloadLinkUrl">
                        <div class="file-preview-download">
                            <img src="/img/cal/download.png" style="width: 18px; height: 18px;" />
                            <span>下载</span>
                        </div>
                    </a>
                </div>
                <div class="file-preview-head-right">
                    <img @click="fileview.show=false" src="/img/cal/4.closeIcon(24x24).png" style="width: 20px; height: 20px;" />
                </div>
            </div>
            <iframe :src="fileview.url"></iframe>
        </div>
    </div>
    <iframe id="iframe"></iframe>
    <div class="popup-mask"></div>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <link href="/element/element.css" rel="stylesheet" />
    <script type="text/javascript" src="/element/vue.js"></script>
    <script type="text/javascript" src="/element/element.js"></script>
    <script src="/ckeditor/ckeditor-4.16/ckeditor.js"></script>

    <script>
        function lookupPick(formName, controlName, controlName2, null1, valId, valName) {
            
            //lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id)
            vum.search[controlName2] = [{
                ID: valId,
                Name: valName
            }]
            vum.list[controlName2] = {
                Id: valId,
                Name: valName
            }
            vum.$set(vum.list, controlName2 + '2', valId)

        }

        var height = $('body').height() - 237
        var vum = new Vue({
            el: '#vueapp',
            data: {
                tableheight:'',
                activeName: 'first',
                list: {
                    Title:'',
                    IsTop: 0,
                    CreatedBy: {},
                    BusinessUnitId: {},
                    FolderId:{}
                },
                select: {},
                search: {
                    CreatedBy: [],
                    BusinessUnitId: [],
                    FolderId: [],
                },
                attributes: {
                    CreatedBy: { objectTypeCode: 8 },
                    BusinessUnitId: { objectTypeCode: 10 },
                    FolderId: { objectTypeCode: 100200 },
                },
                tableData: [{
                    name: '附件1',
                    size: '999'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, {
                    name: '附件1',
                    size: '1000'
                }, ],
                fileview: {
                    name: "",
                    url: "",
                    show: false,
                    filetype: ''
                },
            },
            created: function () {
                this.tableheight = $('body').height() - 150
                this.getdata()
            },
            mounted: function () {
                CKEDITOR.replace('ckeditcontent', {
                    height:height,
                });
            },
            methods: {
                saveform: function (type) {
                    var that = this
                    this.$refs['ruleForm'].validate(function(valid){
                        if (valid) {
                            var d = that.list
                            d.ContentBody = $($('.content-body-mainbody').find('iframe')[0].contentWindow.document.body).html()
                            d.StateCode = type
                            if (d.IsTop) {
                                d.IsTop = 1
                            } else {
                                d.IsTop = 0
                            }
                            var messages = {
                                params: {
                                    recordRep: {
                                        id:getQueryString('id'),
                                        objTypeCode: 100201,
                                        fields: d
                                    }
                                }
                            }
                            messages = JSON.stringify(messages)
                            ajaxMethodPostData('entity.saverecord', { message: messages }, function (data) {
                                if (data.status == 1) {
                                    that.$message({
                                        message: '保存成功',
                                        type: 'success'
                                    })
                                } else {
                                    that.$message({
                                        message: '保存失败',
                                        type: 'error'
                                    })
                                }
                            })
                        } else {
                            that.$message({
                                message: '请填写必填项',
                                type: 'error'
                            })
                        }
                    })
                    
                },
                getdata: function () {
                    var id = getQueryString('id')
                    var that = this
                    if (id && id != '') {
                        ajaxMethodGetData('entity.detail.get', { objtypecode: 100201, id: id }, function (data) {
                            that.list = data.record

                            if (data.record.IsTop == 1) {
                                that.list.IsTop = true
                            } else {
                                that.list.IsTop = false
                            }
                            that.select = data.context.picklistValuesMap

                            for (item in that.search) {
                                if (item != 'searchname') {
                                    var name = item
                                    var ID = that.list[name].Id
                                    var Name = that.list[name].Name
                                    var newlist = {
                                        ID: ID,
                                        Name: Name
                                    }
                                    that.search[name].push(newlist)
                                    Vue.set(that.list, name + 2, ID)
                                }
                            }
                        })
                    }
                },
                tofileview: function (row) {
                    this.fileview.name = row.name
                    this.fileview.url = row.url
                    this.fileview.show = true
                    this.fileview.DownloadLinkUrl = row.DownloadLinkUrl
                    this.fileview.FileExtension = row.filetype
                },
                deletefile: function (row) {
                    console.log(row)
                },
                openslookup: function (name, objtypecode) {
                    $('#changeDiv').show()
                    if (objtypecode == 30020) {
                        $('#iframe').attr('src', '/_ui/common/data/UserLookResult.html?name=' + name)
                    } else if (objtypecode == 10) {
                        $('#iframe').attr('src', '/_ui/common/data/deptchose_form.html?name=' + name)
                    } else if (objtypecode == 8) {
                        $('#iframe').attr('src', '/_ui/common/data/UserLookResult.html?name=' + name)
                    } else {
                        $('#iframe').attr('src', '/alert/lookupiframe.html?name=' + name + '&objtypecode=' + objtypecode)
                    }
                },
                getlookup: function (Lktp, name) {
                    var that = this
                    var d = {}
                    d = {
                        Lktp: Lktp
                    }
                    ajaxMethodGetData('ui.entity.lookup', d, callback)
                    function callback(data) {
                        that.search[name] = data.listData
                        var id = getQueryString('id')
                        if (id != null) {
                            var ID = that.list[name].Id
                            var Name = that.list[name].Name
                            var newlist = {
                                ID: ID,
                                Name: Name
                            }
                            if (ID) {
                                if (JSON.stringify(that.search[name]).indexOf(JSON.stringify(newlist.ID)) == -1) {
                                    that.search[name].push(newlist)
                                }
                            }
                        }
                    }
                },
                choosepeople:function(name) {
                    opencenterwindow('/_ui/common/data/UserLookResult.aspx?type=relatedchhoose&lknm=' + name, '', 1150, 600)
                },
                chooselookup:function(name,objtypecode,title,search) {
                    $('#iframe').show().attr('src', '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=所属栏目&search=' + search).height(640).css('margin-top', '-320px')
                    $('.popup-mask').show()
                },
                choosedept: function (name) {
                    opencenterwindow('/alert/deptchose_form.html?type=relatedchhoose&lknm=' + name, '', 750, 520)
                },
                searchlookup: function (query, Lktp, name) {
                    var that = this
                    var d = {}
                    d = {
                        Lktp: Lktp,
                        Lksrch: query
                    }
                    ajaxMethodGetData('ui.entity.lookup', d, callback)
                    function callback(data) {
                        that.search[name] = data.listData
                    }
                },
                lookupchange: function (val, data) {
                    Vue.set(this.list, data + 2, val)
                    var that = this
                    var attributes = that.attributes[data]
                    ajaxMethodGetData('entity.attributelookup.inputrequest', {
                        lookupObjectTypeCode: attributes.objectTypeCode,
                        ObjectTypeCode: that.objectTypeCode,
                        lookupAttributeName: data,
                        id: val
                    }, function (data) {
                        var res = data.actions[0].returnValue.changeValues
                        for (item in res) {
                            if (res[item] != null) {
                                if (res[item].Id) {
                                    that.list[item] = res[item]
                                    that.search[item].push({
                                        ID: res[item].Id,
                                        Name: res[item].Name
                                    })
                                } else {
                                    that.list[item] = res[item]
                                }
                            } else {
                                that.list[item] = ''
                            }

                        }
                    })
                }
            }
        })
    </script>
    <style>
        .file-preview{
            display:block;
        }
    </style>
</body>
</html>

