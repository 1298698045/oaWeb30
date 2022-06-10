<%@ Page Language="C#" AutoEventWireup="true"  Inherits="Youyou.home.homepage" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=1300px" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/common.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/icon/iconfont.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/home.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/centerLayout.css" />
    <link rel="stylesheet" href="/utils/index.min.css">
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <script src="/js/cnt/tree.js?a=13" type="text/javascript"></script>
    <link rel="stylesheet" href="/easyui/themes/bootstrap/easyui.css" type="text/css" />
    <link rel="stylesheet" href="/easyui/themes/icon.css" type="text/css" />
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <title>通讯录 - 协同办公系统 ~  - Developer Edition</title>
</head> 
<body>
    <div class="pageWraper" id="app">
        <uc1:MainNav ID="MainNav1" runat="server" />
        <div class="center">
            <div class="layoutContent">
                <div class="rightWrapper">
                    <div class="layoutContainer todoListWrap" style="display: flex;">
                        <div class="treeTemplate">
                            <div class="tabContainer">
                                <div class="tabList clearFix">
                                    <div class="tab" :class="{'active':leftTab==0}" @click="handleLeftTab(0)">
                                        <div class="tabHover">
                                            <span class="tabText">
                                                单位联系人
                                            </span>
                                        </div>
                                    </div>
                                    <div class="tab" :class="{'active':leftTab==1}" @click="handleLeftTab(1)">
                                        <div class="tabHover">
                                            <span class="tabText">
                                                个人联系人
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div v-if="leftTab==0">
                                <div class="switchWrap">
                                    <span class="spaceWrap">
                                        <span class="spaceItem" :class="{'active':spaceCurrent==0}" @click="handleTabSpace(0)">组织结构</span>
                                        <span class="spaceItem" :class="{'active':spaceCurrent==1}" @click="handleTabSpace(1)">常用小组</span>
                                    </span>
                                </div>
                                <div>
                                    <div class="tree" v-if="spaceCurrent==0">
                                        <el-tree :data="newTreeData" :props="defaultProps" @node-click="handleNodeClick"></el-tree>
                                    </div>
                                    <ul class="tree" v-if="spaceCurrent==1">
                                        <li class="treeNode" :class="{'active':groupCurrent==index}" v-for="(item,index) in groupList" @click="handleTabGroup(item,index)">
                                            <div class="rowHeight">
                                                <div class="flexName">
                                                    <div class="treeName">
                                                        {{item.Name || ''}}
                                                    </div>
                                                    <div class="treeNum">
                                                        {{item.Quantity || ''}}
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="personalWrap" v-if="leftTab==1">
                                <div class="tree">
                                    <el-tree :data="myGroupList" :props="groupProps" @node-click="handleNodeGroup"></el-tree>
                                </div>
                            </div>
                        </div>
                        <div class="guideWrap">
                            <div class="sanlan">
                                <i class="iconfont icon-xiala"></i>
                            </div>
                            <div class="layoutBodyHead">
                                <div class="tabContainer">
                                    <div class="tabList clearFix">
                                        <div class="tab" :class="{'active':rightTab==0}" @click="handleRightTab(0)">
                                            <div class="tabHover">
                                                <span class="tabText">
                                                    最近联系人
                                                </span>
                                            </div>
                                        </div>
                                        <div class="tab" :class="{'active':rightTab==1}" @click="handleRightTab(1)">
                                            <div class="tabHover">
                                                <span class="tabText">
                                                    全部人员
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="rWrap" v-if="leftTab==1">
                                    <button class="btn">导入</button>
                                    <button class="btn">导出</button>
                                    <button class="btn">下载模板</button>
                                    <div class="search">
                                        <input type="text" placeholder="搜索关键字">
                                        <div class="searchIcon">
                                            <i class="iconfont icon-sousuo"></i>
                                        </div>
                                    </div>
                                    <div class="select" id="selectBoard">
                                        <p class="val">看板</p>
                                        <p class="arrowIcon">
                                            <i class="iconfont icon-xiala"></i>
                                        </p>
                                        <div class="dropMenuWapper selectModal">
                                            <div class="dropMenu">
                                                <div class="dropMenuItem">
                                                    <span class="name">
                                                        列表
                                                    </span>
                                                </div>
                                                <div class="dropMenuItem">
                                                    <span class="name">
                                                        看板
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layoutBodyCenter">
                                <div class="businessWrap">
                                    <div class="businessCartItem" v-for="item in contactsList">
                                        <div class="cartItemHead">
                                            <div class="cartAvatar">
                                                <i class="iconfont icon-morentouxiang"></i>
                                            </div>
                                            <div class="cartInfo">
                                                <p class="name">{{item.FullName || item.fullName || ''}}</p>
                                                <p class="depart">{{item.BusinessUnitIdName || ''}}/主任医师</p>
                                                <p class="desc">(在单位)</p>
                                            </div>
                                        </div>
                                        <div class="phoneBox">
                                            <span class="label">手机号码</span>
                                            </br>
                                            <span class="val phone">13602716802</span>
                                            <span class="copyBoxWrap">
                                                <span class="copyIconBox">
                                                    <i class="iconfont icon-shezhi"></i>
                                                    <div class="child_tips">
                                                        复制
                                                        <div class="popper__arrow"></div>
                                                    </div>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="emailBox">
                                            <span class="label">邮箱</span>
                                            </br>
                                            <span class="val email">zhangliping_2020@fengxfo.com</span>
                                        </div>
                                    </div>
                                    <%--<div class="businessCartItem"></div>--%>
                                    <div class="fake_item"></div>
                                    <div class="fake_item"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footInfo">
                        北京凤凰世纪科技有限公司技术支持
                        本机IP:119.80.173.160
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/utils/jquery.min.js"></script>
<script src="/utils/vue.js"></script>
<script src="/js/request.js"></script>
<script src="/js/head.js"></script>
<script src="/utils/index.min.js"></script>
<script src="/js/cnt/cnt.js"></script>
<script>
    $(document).ready(function () {
        var height = $(window).height() - 64 - 150;
        var width = $(this).width();
        $('.layoutContainer').css('height', height + 'px')
        $(window).resize(function () {
            width =  $(window).height();
            height = $(this).height() - 64 - 150;
            $('.layoutContainer').css('height',height+'px')
        });
        //$('.guideWrap .tabContainer .tab').click(function () {
        //    $('.guideWrap .tabContainer .tab').removeClass('active');
        //    $(this).addClass('active');
        //})
        $('.sanlan').click(function () {
            $('.treeTemplate').toggle();
            $(this).toggleClass('active');
        })
        $('.noticeModal .tabContainer .tab').click(function () {
            $('.noticeModal .tabContainer .tab').removeClass('active');
            $(this).addClass('active');
        })
    })
</script>

</html>