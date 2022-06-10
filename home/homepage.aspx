<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Youyou.home.homepage" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=1300px" />
    <link rel="stylesheet" href="/js/layoutlist/layoutlist.css" />
    <link rel="stylesheet" href="/template/css/indexStyle.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/common.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/icon/iconfont.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layout.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layoutAside.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/home.css" />
    <link rel="stylesheet" href="/css/homepage.css" />
    <link rel="stylesheet" href="/utils/index.min.css">
    <title>OA</title>
</head> 
<body>
       <div class="pageWraper">
        <uc1:MainNav ID="MainNav1" runat="server" />
        <div class="center center1">
            <div class="layoutContent">
                <div class="leftMenuWrapper">
                    <div class="leftTabMenu active" name="newTodo">
                        <div class="menuIcon">
                            <i class="iconfont icon-xinjian"></i>
                        </div>
                        <div class="name">
                            新建事务
                        </div>
                    </div>
                    <div class="leftTabMenu" name="doingtask">
                        <div class="menuIcon">
                            <i class="iconfont icon-daiban1"></i>
                        </div>
                        <div class="name">
                            待办事务
                        </div>
                    </div>
                    <div class="leftTabMenu" name="donetask">
                        <div class="menuIcon">
                            <i class="iconfont icon-yiban"></i>
                        </div>
                        <div class="name">
                            已办事务
                        </div>
                    </div>
                    <div class="leftTabMenu" name="mineWorkflow">
                        <div class="menuIcon">
                            <i class="iconfont icon-faqi"></i>
                        </div>
                        <div class="name">
                            我的发起件
                        </div>
                    </div>
                    <div class="leftTabMenu">
                        <div class="menuIcon">
                            <i class="iconfont icon-tuijian"></i>
                        </div>
                        <div class="name">
                            退件箱
                        </div>
                    </div>
                    <div class="leftTabMenu">
                        <div class="menuIcon">
                            <i class="iconfont icon-chuanyue"></i>
                        </div>
                        <div class="name">
                            我传阅的
                        </div>
                    </div>
                    <div class="leftTabMenu">
                        <div class="menuIcon">
                            <i class="iconfont icon-shoudaochuanyue"></i>
                        </div>
                        <div class="name">
                            收到传阅
                        </div>
                    </div>
                    <div class="leftTabMenu">
                        <div class="menuIcon">
                            <i class="iconfont icon-caogaoxiang"></i>
                        </div>
                        <div class="name">
                            草稿箱
                        </div>
                    </div>
                    <div class="leftTabMenu">
                        <div class="menuIcon">
                            <i class="iconfont icon-shenpiyijian"></i>
                        </div>
                        <div class="name">
                            我的审批意见
                        </div>
                    </div>
                    <div class="leftTabMenu">
                        <div class="menuIcon">
                            <i class="iconfont icon-zhengwenmoban"></i>
                        </div>
                        <div class="name">
                            正文模板
                        </div>
                    </div>
                    <div class="leftTabMenu">
                        <div class="menuIcon">
                            <i class="iconfont icon-baobiaofenxi"></i>
                        </div>
                        <div class="name">
                            报表
                        </div>
                    </div>
                </div>
                <div class="rightWrapper">
                    <div class="layoutContainer" style="display: block;">
                        <div class="newTodoWrap">
                            <div class="panelModuleWrap">
                                <div class="tabList">
                                    <div class="tabItem active">
                                        最近使用
                                    </div>
                                    <div class="tabItem">
                                        我的收藏
                                    </div>
                                </div>
                                <div class="moduleBoxWrap">
                                    <div class="moduleBox">
                                        <div class="title">
                                            <div class="leftTitle">
                                                07. 日常费用报销审批单
                                            </div>
                                            <el-tooltip class="item" :value="true" :disabled="true" effect="dark" content="Top Center 提示文字" placement="top">
                                                <div class="rightIcon">
                                                    <i class="iconfont icon-shezhi"></i>
                                                </div>
                                            </el-tooltip>
                                        </div>
                                        <div class="bottomInfo">人力资源</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">07. 日常费用报销审批单</div>
                                        <div class="bottomInfo">人力资源</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">07. 日常费用报销审批单</div>
                                        <div class="bottomInfo">人力资源</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">07. 日常费用报销审批单</div>
                                        <div class="bottomInfo">人力资源</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">07. 日常费用报销审批单</div>
                                        <div class="bottomInfo">人力资源</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panelModuleWrap">
                                <div class="panelModuleHead">
                                    <div class="lTitle">
                                        全部流程
                                    </div>
                                    <div class="rContent">
                                        <div class="search">
                                            <input type="text" value="" placeholder="搜索流程">
                                            <div class="searchIcon">
                                                <i class="iconfont icon-sousuo"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tabList">
                                    <div class="tabItem active">
                                        全部
                                    </div>
                                    <div class="tabItem">
                                        人力资源
                                    </div>
                                    <div class="tabItem">
                                        商务部
                                    </div>
                                    <div class="tabItem">
                                        工作报表
                                    </div>
                                    <div class="tabItem">
                                        信息中心
                                    </div>
                                </div>
                                <div class="moduleBoxWrap">
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                    <div class="moduleBox">
                                        <div class="title">02 差旅费报销审批单</div>
                                    </div>
                                </div>
                            
                            </div>
                        </div>
                    </div>
                    <%--<div class="layoutContainer">
                        <iframe src="" id="childreniframe" frameborder="0" name="childreniframe"></iframe>
                    </div>--%>
                    <div class="footInfo">
                        北京凤凰世纪科技有限公司技术支持
                        本机IP:119.80.173.160
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
<script type="text/javascript" src="/utils/jquery.min.js"></script>
<script type="text/javascript" src="/js/request.js"></script>
<script type="text/javascript" src="/js/head.js"></script>
<script type="text/javascript" src="/js/formcomponents.js"></script>
<script type="text/javascript" src="/js/CommonUtils.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script>

    $('.guideWrap .tabContainer .tab').click(function(){
        $('.guideWrap .tabContainer .tab').removeClass('active');
        $(this).addClass('active');
    })
    $('.sanlan').click(function(){
        $('.treeTemplate').toggle();
        $(this).toggleClass('active');
    })
    $('.noticeModal .tabContainer .tab').click(function(){
        $('.noticeModal .tabContainer .tab').removeClass('active');
        $(this).addClass('active');
    })
    $('.leftTabMenu').click(function () {
        $('.leftTabMenu').removeClass('active');
        $(this).addClass('active');
    })

    var index = $('.userWrap .dropMenuWapper.userModal .dropMenu .dropMenuItem').length - 1;
    $('.userWrap .dropMenuWapper.userModal .dropMenu .dropMenuItem').each(function () {
        //console.log($(this).find('.item')[0].innerText)
        var text = $(this).find('.item')[0].innerText
        text = text.replace(/\s+/g, "");
        $(this).click(function () {
            if (text == '退出登录') {
                window.location.href = '/secur/login.aspx'
            }
        })
    })
  

    $(document).ready(function () {
        var pageName = getQueryString('pageName');
        if (pageName == 'flow') {
            location.href = '/workflow/instance/add';
        }
    })
</script>
</html>
