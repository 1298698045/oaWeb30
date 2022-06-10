<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=1300px" />
    <title>信息管理</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/layui/layui/css/layui.css" rel="stylesheet" />  
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/easyui/themes/bootstrap/easyui.css" type="text/css" />
    <link rel="stylesheet" href="/easyui/themes/icon.css" type="text/css" />
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/easyui/js/treeLoader.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>    
    <link rel="stylesheet" href="/js/layoutlist/layoutlist.css" />
    <link rel="stylesheet" href="/template/css/indexStyle.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/common.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/icon/iconfont.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layout.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layoutAside.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/home.css" />
    <link rel="stylesheet" href="/css/myInstancelist.css" />
    <style>
        .center {
            margin-top: 75px;
            height: 100%;
        }
        .rightWrapper{
            margin-left:0px;
            padding:0 10px;
        }
    </style>
</head>
<body class="hasMotif contactTab  overviewPage sfdcBody brandQuaternaryBgr   ext-gecko ext-gecko3" >
       <div class="pageWraper">
        <uc1:MainNav ID="MainNav1" runat="server" />
        <div class="center">
            <div class="layoutContent">
                <div class="rightWrapper">
                    <div class="layoutContainer">
                        <div id="contentWrapper" style="vertical-align: middle">
        
                            <div class="bodyDiv brdPalette brandPrimaryBrd">
                                <div class="left-content">
                                    <div class="treesearch">
                                        <input type="text" name="treesearch" value="" placeholder="请输入" />
                                        <div class="searchIcon">
                                            <i class="iconfont icon-sousuo"></i>
                                        </div>
                                    </div>
                                    <div id="treePanel" class="easyui-panel" style="padding: 5px; width: 240px; min-height: 0!important; min-height: 200px;">
                                        <ul class="easyui-tree" id="LeftTree" style="display: block;">
                                            <li></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="main-content">
                                    <div class="left-show-btn">
                                        <i class="iconfont icon-xiala"></i>
                                    </div>
                                    <div class="left-hide-btn">
                                        <i class="iconfont icon-xiala" style="transform: rotate(270deg);"></i>
                                    </div>
                                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                                      <ul class="layui-tab-title">
                                      </ul>
                                    </div>
                                    <div class="search-content">
                                        <form class="layui-form" action="">
                                        </form>
                                    </div>
                                    <div class="statistics-content">
                    
                                    </div>
                                    <div class="gridcontent">
                                        <div id="datagrid"></div>
                                    </div>
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
    <iframe id="iframe" frameborder="0" src="/alert/wf/approval.html"></iframe>
    <div class="popup-mask"></div>
    <script type="text/javascript" src="/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="/template/js/search.js"></script>
    <script type="text/javascript" src="/template/js/indexjs.js"></script>
    <script src="/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="/layui/layui/layui.js"></script>
    <script type="text/javascript" src="/js/request.js"></script>
    <script type="text/javascript" src="/js/head.js"></script>
    <script type="text/javascript" src="/js/formcomponents.js"></script>
    <script type="text/javascript" src="/js/layoutlist/ContentPageConfig.js"></script>
    <script type="text/javascript" src="/js/layoutlist/treelistlayout.main.js"></script>
    <script src="/easyui/datagrid-export.js"></script>
    <script src="/js/alert.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
       
        var entityname = 'cntmylst';
        if (getQueryString('name') && getQueryString('name') != 'undefined') {
            entityname = getQueryString('name')
        }
        layui.use(['element', 'form'], function () {
            mylayout = new createdlayout(entityname)
            mylayout.layoutelement = layui.element;
            mylayout.layoutform = layui.form;
            mylayout.init()
        });
        $(document).ready(function () {
            $('.topTabMenuItem').eq(0).removeClass('active');
        })
    </script>
</body>
</html>