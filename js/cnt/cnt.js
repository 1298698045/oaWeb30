$('#selectBoard').click(function (e) {
    e.stopPropagation();
    $(this).toggleClass('active');
    $(this).find('.selectModal').toggle();
    $(this).find('.selectModal .dropMenuItem').click(function () {
        var val = $(this).html();
        $('#selectBoard .val').html(val)
    })
})

var domThis = this;

var app = new Vue({
    el: '#app',
    data: function () {
        return {
            contactsList: domThis.contactsList,
            treeData: [],
            defaultProps: {
                children: 'children',
                label: 'text'
            },
            groupProps:{
                children: 'children',
                label: 'name'
            },
            newTreeData: [],
            spaceCurrent: 0,
            groupList: [],
            leftTab: 0,
            rightTab: 0,
            groupCurrent: -1,
            myGroupList: []
        }
    },
    created: function () {
        this.queryTree();
        this.queryLatestuse();
        this.queryGroup();
    },
    methods: {
        // 单位联系人/个人联系人
        handleLeftTab:function(current){
            this.leftTab = current;
            if (this.leftTab == 1) {
                this.myGroupQuery();
                this.queryPerson('');
            } else {
                this.queryLatestuse();
            }
        },
        queryPerson: function (id) {
            var contactGroupId = id;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=contact.my.search";
            var that = this;
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    pageNumber: 1,
                    pageSize: 20,
                    contactGroupId: contactGroupId
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    that.rightTab = 1;
                    that.contactsList = data.rows;
                },
                type: "GET",
                url: url
            });
        },
        handleNodeGroup:function(e){
            this.queryPerson(e.contactGroupId)
        },
        // 我的小组
        myGroupQuery:function(){
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=contact.group.search";
            var that = this;
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {

                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    that.myGroupList = data.rows;
                },
                type: "GET",
                url: url
            });
        },
        // 最近联系人
        queryLatestuse:function () {
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=user.latestuse.getlist";
            var that = this;
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {

                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    console.log('datadatadata', data)
                    that.rightTab = 0;
                    that.contactsList = data.listData;
                },
                type: "GET",
                url: url
            });
        },
        // 组织结构
        queryTree:function() {
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=tree.get";
            var that = this;
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    entity: 'organizationtree'
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    console.log('treeData', data)
                    that.treeData = data.rows;
                    that.newTreeData = that.formTreeData(data.rows)
                },
                type: "GET",
                url: url
            });
        },
        // 小组

        queryGroup:function () {
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=sys.group.search";
            var that = this;
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    console.log('group', data)
                    that.groupList = data.listData;
                },
                type: "GET",
                url: url
            });
        },
        // 根据条件查询联系人
        queryCnt:function(id) {
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=addresslist.search";
            var that = this;
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    businessUnitId: id,
                    pageNumber: 1,
                    pageSize: 25
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    that.rightTab = 1;
                    that.contactsList = data.listData;
                },
                type: "GET",
                url: url
            });
        },
        // 小组筛选
        queryGroupScreen: function (groupId) {
            var groupId = groupId;
            var url = "/apps/CommandProcessor.ashx?c=1&cmd=sys.group.member.search";
            var that = this;
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                data: {
                    groupId: groupId
                },
                error: function (request, textStatus, errorThrown) {

                },
                success: function (data, textStatus) {
                    that.rightTab = 1;
                    that.contactsList = data.listData;
                },
                type: "GET",
                url: url
            });
        },
        handleTabGroup:function(item,index){
            this.groupCurrent = index;
            this.queryGroupScreen(item.GroupId)
        },
        // 切换组织架构和小组 0 / 1
        handleTabSpace:function(current){
            this.spaceCurrent = current;
            if (this.spaceCurrent == 0) {
                this.queryTree();
            } else {
                this.queryGroup();
            }
        },
        formTreeData: function (list) {
            var result = [];
            var map = {};
            if (!Array.isArray(list)) {
                return result
            }
            list.forEach(function (item) {
                map[item.id] = item;
            })
            list.forEach(function (item) {
                var parent = map[item.pid]
                if (parent) {
                    parent.children = parent.children || []
                    parent.children.push(item)
                } else {
                    result.push(item)
                }
            })
            return result
        },
        handleNodeClick: function (e) {
            console.log(e)
            var id = e.id;
            this.queryCnt(id)
            
        },
        handleRightTab: function (current) {
            this.rightTab = current;
            if (this.rightTab == 0) {
                this.queryLatestuse();
            } else {
                this.queryCnt('');
            }
        }
    }

})