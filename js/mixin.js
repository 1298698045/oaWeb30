var mixin = {
    data:function(){
        return {
            desc:'',
            commentList: []
        }
    },
    created:function(){
        this.queryCommentList();
    },
    methods: {
        queryCommentList:function() {
            var that = this;
            var d = {
                meetingid: getQueryString('id')
            }
            ajaxMethodPostData('chatter.search', d, function (data) {
                that.commentList = data.rows;
                that.desc = '';
            })
        },
        sendComment: function () {
            var that = this;
            var d = {
                title: that.desc,
                ObjectId: getQueryString('id')
            }
            ajaxMethodPostData('chatter.post', d, function (data) {
                that.queryCommentList();
                //if (data.rows == undefined) return;
                //var count = data.rows.length ? data.rows.length : 0;
                //$('#messageboardcount').html('(' + count + ')');
                //for (var i = 0; i < data.rows.length; i++) {
                //    var res = data.rows[i]
                //    if (res.OwningBusinessUnit) {
                //        var OwningBusinessUnit = res.OwningBusinessUnit
                //    } else {
                //        var OwningBusinessUnit = ''
                //    }

                //    $('.comment1 ul').append('<li class="comment-main">'
                //        + '<img class="messageboardimg" src="/img/cal/1.png"  alt="" /><p class="name">' + res.OwningUser + '：<span class="title1">' + res.Title + '</span></p>'
                //        + '<p class="miaoshu">' + OwningBusinessUnit + '<span>&nbsp;</span><span>' + res.CreatedOn + '</span></p>'
                //        + '</li>')
                //}

            })
        }
    }
}
// 公共面板评论组件
var Comment = Vue.extend({
    mixins: [mixin],
    template: `
        <div class ="panelBody">
            <div class="panelCommentWrap">
                <div class="commentBox">
                    <div class="leftAvatar">
                        <i class="iconfont icon-morentouxiang"></i>
                    </div>
                    <div class="rightTextare">
                        <textarea placeholder-class="placeholder" v-model="desc" placeholder="说点什么吧..." name="" id="" cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="optionalWrap">
                    <button class="btn">取消</button>
                    <button class ="btn primary" @click="sendComment()">讨论</button>
                </div>
                <div class="commentList">
                    <div class ="commentItemBox" v-for="(item,index) in commentList" :key="index">
                        <div class="leftAvatar">
                            <i class="iconfont icon-morentouxiang"></i>
                        </div>
                        <div class="rightComment">
                            <div class ="commentName">{{item.CreatedBy}}</div>
                            <div class ="commentContent">{{item.Title}}</div>
                            <div class ="commentTime">{{item.CreatedOn}}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `,
});
//var message = Vue.extend({
//    template: `
//            <el-button: plain="true" @click="open2">成功</el-button>
//            <el-button: plain="true" @click="open4">错误</el-button>
//        `
//})



var messageTips = function (self, title, desc, confirmButtonText, cancelButtonText, type, closeOnClickModal, sucessText, cancelText, sucessFun, errorFun, cancelButtonClass, confirmButtonClass) {
    var that = self;
    that.$confirm(desc, title, {
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,
        closeOnClickModal: closeOnClickModal,
        type: type,
        cancelButtonClass: cancelButtonClass,
        confirmButtonClass: confirmButtonClass
    }).then(function () {
        sucessFun(sucessText);
    }).catch(function () {
        errorFun(cancelText);
    });
}