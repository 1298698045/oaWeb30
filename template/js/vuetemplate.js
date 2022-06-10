var lookupchooktemplate = {
    data: function () {
        return {

        }
    },
    props: ['value', 'search', 'name', 'objtypecode', 'title', 'vuename', 'checked'],
    template: '<div class="searchcontent"><el-select '
            + '    v-model="value.Id"'
            + '    filterable remote'
            + '    @visible-change="getlookup(objtypecode,name)"'
            + '    :remote-method="function(query){searchlookup(query,objtypecode,name)}"'
            + '    :placeholder="title">'
            + '    <el-option v-for="item in search[name]"'
            + '    :key="item.ID"'
            + '    :label="item.Name"'
            + '    :value="item.ID">'
            + '    </el-option>'
            + '    </el-select> '
            + '<div @click="openslookup(name,objtypecode,vuename)" class="lookresultbtn">'
            + '      <i class="el-icon-search"></i></div></div>',
    methods: {
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
                    if (that.list) {
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
            }
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
        openslookup: function (name, objtypecode, vuename) {
            $('#changeDiv').show()
            if (objtypecode == 30020 || objtypecode == 8) {
                $('#iframe').attr('src', '/_ui/common/data/UserLookResult.html?name=' + name + '&vuename=' + vuename)
            } else if (objtypecode == 10) {
                $('#iframe').attr('src', '/_ui/common/data/deptchose_form.html?name=' + name + '&vuename=' + vuename)
            }
        },
    }
}

var lookupchookstemplate = {
    data: function () {
        return {

        }
    },
    props: ['value', 'search', 'name', 'objtypecode', 'title', 'vuename', 'checked','disabled'],
    template: '<div class="searchcontent"><el-select'
        + ' :disabled=disabled'
            + '    multiple '
            + '@change="function(val){checkedchange(val,name)}"'
            + '    v-model="value.Id"'
            + '    filterable remote'
            + '    @visible-change="getlookup(objtypecode,name)"'
            + '    :remote-method="function(query){searchlookup(query,objtypecode,name)}"'
            + '    collapse-tags'
            + '    :placeholder="title">'
            + '    <el-option v-for="item in search[name]"'
            + '    :key="item.ID"'
            + '    :label="item.Name"'
            + '    :value="item.ID">'
            + '    </el-option>'
            + '    </el-select> '
            + '<div v-if="!disabled" @click="openslookup(name,objtypecode,vuename)" class="lookresultbtn">'
            + '      <i class="el-icon-search"></i></div></div>',
    methods: {
        checkedchange: function (val, name) {
            var id = val[val.length - 1]
            if (JSON.stringify(this.checked[name]).indexOf(id) == -1) {
                for (var i = 0; i < this.search[name].length; i++) {
                    if (this.search[name][i].ID == id) {
                        this.checked[name].push({
                            ID: id,
                            Name: this.search[name][i].Name
                        })
                        break
                    }
                }

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
                    if (that.list) {
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
                for (var i = 0; i < that.checked[name].length; i++) {
                    if (JSON.stringify(that.search[name]).indexOf(JSON.stringify(that.checked[name][i].ID)) == -1) {
                        that.search[name].push(that.checked[name][i])
                    }
                }
            }
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
                for (var i = 0; i < that.checked[name].length; i++) {
                    if (JSON.stringify(that.search[name]).indexOf(JSON.stringify(that.checked[name][i].ID)) == -1) {
                        that.search[name].push(that.checked[name][i])
                    }
                }
            }
        },
        openslookup: function (name, objtypecode, vuename) {
            $('#changeDiv').show()
            if (objtypecode == 30020 || objtypecode == 8) {
                $('#iframe').attr('src', '/_ui/common/data/invite_UserLookResult2.html?name=' + name + '&vuename=' + vuename)
            } else if (objtypecode == 10) {
                $('#iframe').attr('src', '/alert/deptchose.html?name=' + name + '&vuename=' + vuename)
            }
        },
    }
}
