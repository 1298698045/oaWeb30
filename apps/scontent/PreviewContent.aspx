<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreviewContent.aspx.cs"
    Inherits="WebClient.apps.scontent.PreviewContent" %>
<!DOCTYPE html>
<!--[31,1,23219218] published at 2015-09-11 08:58:34 from #153 by system -->
<html>
<head>
  
    <meta http-equiv="Content-type" content="text/html; charset=gb2312" />
    <title><%=CTitle%></title>
    <link href="TextCommon.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* topLogin */
        .login-wrap
        {
            float: left;
        }

            .login-wrap .login-btn
            {
                display: block;
                width: 46px;
                height: 23px;
                background-image: url();
                background-position: 0 0;
                vertical-align: -7px;
                *vertical-align: -3px;
                *margin-right: 5px;
                position: relative;
                top: 8px;
            }

                .login-wrap .login-btn:hover
                {
                    background-image: url();
                    background-position: -47px 0;
                }

            .login-wrap .name
            {
                float: left;
                padding-top: 8px;
                margin-right: 10px;
                font-size: 14px;
                font-family: "Microsoft YaHei","FAE8F6F96C59ED1","SimSun","B8BF53";
            }

                .login-wrap .name span
                {
                    color: #6b615d;
                }

                .login-wrap .name a
                {
                    color: #3c7ea8;
                }

                    .login-wrap .name a:hover
                    {
                        color: #3c7ea8;
                    }

            .login-wrap .icon
            {
                background: none;
                background-repeat: no-repeat;
            }

            .login-wrap .msg
            {
                float: left;
                position: relative;
                border: 1px solid #ffffff;
                text-align: center;
                width: 38px;
                cursor: pointer;
            }

                .login-wrap .msg .icon-wrap
                {
                    position: relative;
                    z-index: 10;
                    padding-top: 10px;
                    height: 25px;
                }

                .login-wrap .msg .icon
                {
                    display: inline-block;
                    width: 14px;
                    height: 13px;
                    background-image: url();
                    background-position: -94px 0;
                }

                .login-wrap .msg .new
                {
                    display: block;
                    position: absolute;
                    width: 5px;
                    height: 5px;
                    background-image: url();
                    background-position: -111px 0;
                    font-size: 0;
                    line-height: 0;
                    top: 10px;
                    right: 10px;
                }

                .login-wrap .msg ul
                {
                    display: none;
                }

            .login-wrap .setting
            {
                float: left;
                position: relative;
                border: 1px solid #ffffff;
                text-align: center;
                width: 38px;
                cursor: pointer;
            }

                .login-wrap .setting .icon-wrap
                {
                    position: relative;
                    z-index: 10;
                    padding-top: 10px;
                    height: 25px;
                }
                
                .login-wrap .setting ul
                {
                    display: none;
                }

            .login-wrap .active
            {
                border: 1px solid #d6d6d6!important;
                border-bottom: 0;
                background-color: #fafafa;
            }

                .login-wrap .active .icon-wrap
                {
                    background-color: #fafafa;
                }

                .login-wrap .active ul
                {
                    display: block;
                    position: absolute;
                    top: 34px;
                    right: -1px;
                    z-index: 1;
                    border: 1px solid #d6d6d6;
                    border-bottom: 0;
                    background-color: #fafafa;
                }

                    .login-wrap .active ul li
                    {
                        width: 140px;
                        height: 30px;
                        line-height: 30px;
                        border-bottom: 1px solid #d6d6d6;
                        text-align: left;
                        vertical-align: middle;
                    }

                    .login-wrap .active ul a
                    {
                        color: #5c5c5c;
                        display: block;
                        height: 100%;
                        padding: 0 15px;
                        text-decoration: none;
                    }

                        .login-wrap .active ul a:hover
                        {
                            color: #5c5c5c;
                            background-color: #e6e6e6;
                        }

                    .login-wrap .active ul .entry
                    {
                        float: left;
                    }

                    .login-wrap .active ul .count
                    {
                        display: block;
                        float: right;
                        margin-top: 10px;
                        height: 14px;
                        line-height: 14px;
                    }

                        .login-wrap .active ul .count span
                        {
                            overflow: hidden;
                        }

                        .login-wrap .active ul .count .lh-circle
                        {
                            float: left;
                            width: 7px;
                            height: 14px;
                            /*background-image: url(http://i1.sinaimg.cn/dy/deco/2013/1030/imgs/icon7.png);*/
                            background-repeat: no-repeat;
                        }

                        .login-wrap .active ul .count i
                        {
                            float: left;
                            height: 14px;
                            line-height: 14px;
                            font-style: normal;
                            color: #fff;
                            background-color: #0085da;
                        }

                        .login-wrap .active ul .count .rh-circle
                        {
                            float: left;
                            width: 7px;
                            height: 14px;
                            /*background-image: url(http://i2.sinaimg.cn/dy/deco/2013/1030/imgs/icon8.png);*/
                            background-repeat: no-repeat;
                        }

        /* udv common */
        .udv-clearfix:after
        {
            content: "\0020";
            display: block;
            height: 0;
            clear: both;
        }

        .udv-clearfix
        {
            zoom: 1;
        }

        .udv-clearit
        {
            clear: both;
            height: 0;
            font-size: 0;
            overflow: hidden;
        }

        .login-wrap .msg
        {
            border: 1px solid #fff;
        }

        .login-wrap .setting
        {
            border: 1px solid #fff;
        }

        .top-nav
        {
            padding: 2px 0;
        }

        .top-n-left
        {
            line-height: 86px;
            height: 86px;
        }

            .top-n-left a
            {
                float: left;
                height: 86px;
            }

            .top-n-left img
            {
                display: block;
                padding-top: 5px;
            }

        .top-n-right
        {
            float: right;
            color: #6b615d;
            padding-top: 35px;
            margin-left: 10px;
        }

            .top-n-right a
            {
                display: inline-block;
            }

        body
        {
            padding-top: 0;
        }

        #navTop
        {
            margin-top: 0;
        }

        .link-6b615d
        {
            color: #6B615D;
        }

            .link-6b615d:visited
            {
                color: #6B615D;
            }

            .link-6b615d:hover
            {
                color: #0071B9;
            }

        .link-FF8400
        {
            color: #00f;
        }

            .link-FF8400:visited
            {
                color: #800080;
            }

            .link-FF8400:hover
            {
                color: #0071B9;
            }

        .wrap
        {
            width: 1000px;
            margin: 0 auto;
        }

        .nav
        {
            line-height: 45px;
            font-family: "Microsoft YaHei","FAE8F6F96C59ED1","SimSun","B8BF53";
        }

            .nav ul
            {
                float: left;
                font-size: 14px;
            }

            .nav li
            {
                float: left;
                _display: inline;
            }

            .nav a
            {
                float: left;
                padding: 0 9px;
                color: #fff;
            }

                .nav a:visited
                {
                    color: #fff;
                }

                .nav a:hover
                {
                    color: #fff;
                    background: #0085da;
                    text-decoration: none;
                }

            .nav .current
            {
                background: #0085da;
            }

        .nav-form
        {
            float: right;
            padding: 10px 10px 0 0;
        }

            .nav-form form
            {
                float: right;
            }

        .nav-f-text
        {
            -moz-box-sizing: content-box;
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
        }

        .nav-f-submit
        {
            width: 31px;
            height: 24px;
            /*background: url(http://i3.sinaimg.cn/dy/deco/2013/0609/xy/img/icon1.png) 0 0 no-repeat;*/
            float: left;
            border-width: 0;
            cursor: pointer;
        }

        .suggest
        {
            z-index: 10;
            overflow: hidden;
        }

        #navTop
        {
            margin-top: 0;
        }

            #navTop ul
            {
                float: left;
            }

            #navTop li
            {
                padding: 0 18px;
            }

        .nav_gdzt
        {
            position: relative;
            width: 100px;
            z-index: 10;
        }

        .nav_gdzt_title
        {
            padding: 0!important;
            width: 100%;
            text-align: center;
        }

        .nav_tzlc
        {
            position: relative;
            z-index: 10;
        }

        .nav .nav_gdzt_list
        {
            position: absolute;
            width: 100px;
            top: 45px;
            left: 0;
            display: none;
            text-align: center;
            z-index: 20;
            background: #072785;
            line-height: 14px;
        }

            .nav .nav_gdzt_list a
            {
                display: block;
                font-size: 12px;
                padding: 5px 0;
                float: none;
            }

        .nav .nav_tzlc_list
        {
            position: absolute;
            width: 74px;
            top: 45px;
            left: 0;
            display: none;
            text-align: center;
            z-index: 20;
            background: #072785;
            line-height: 14px;
        }

            .nav .nav_tzlc_list a
            {
                width: 50%;
                font-size: 12px;
                padding: 4px 0;
                float: left;
            }

        .two_code
        {
            left: 50%;
            margin: 0 0 0 490px;
            position: fixed;
            top: 150px;
            width: 111px;
            height: 148px;
            z-index: 100;
            text-align: center;
            background-color: rgb(235,235,235);
            _position: absolute;
        }

            .two_code p
            {
                line-height: 24px;
            }

        div.two_code:hover
        {
            background-color: rgb(209,209,209);
        }

        .two_code img
        {
            border: 2px solid #fff;
        }

        /*标准二级导航_财经 begin*/
        .secondaryHeader
        {
            height: 33px;
            overflow: hidden;
            /*background: url(http://i3.sinaimg.cn/dy/images/header/2008/standardl2nav_bg.gif) repeat-x #fff;*/
            color: #000;
            font-size: 12px;
            font-weight: 100;
        }

            .secondaryHeader a, .secondaryHeader a:visited
            {
                color: #000;
                text-decoration: none;
            }

                .secondaryHeader a:hover, .secondaryHeader a:active
                {
                    color: #c00;
                    text-decoration: underline;
                }

        .sHBorder
        {
            border: 1px #e3e3e3 solid;
            padding: 0 10px 0 12px;
            overflow: hidden;
            zoom: 1;
        }

        .sHLogo
        {
            float: left;
            height: 31px;
            line-height: 31px;
            overflow: hidden;
        }

            .sHLogo span, .sHLogo span a, .sHLogo span a:link, .sHLogo span a:visited, .sHLogo span a:hover
            {
                display: block;
                *float: left;
                display: table-cell;
                vertical-align: middle;
                *display: block;
                *font-size: 27px;
                *font-family: Arial;
                height: 31px;
            }

                .sHLogo span, .sHLogo span a img, .sHLogo span a:link img, .sHLogo span a:visited img, .sHLogo span a:hover img
                {
                    vertical-align: middle;
                }

        .sHLinks
        {
            float: right;
            line-height: 31px;
        }

        .secondaryHeader img
        {
            border: none;
        }
        /*标准二级导航_财经 end*/

        .link-6b615d
        {
            color: #6B615D;
        }

            .link-6b615d:visited
            {
                color: #6B615D;
            }

            .link-6b615d:hover
            {
                color: #0071B9;
            }

        .link-FF8400
        {
            color: #00f;
        }

            .link-FF8400:visited
            {
                color: #800080;
            }

            .link-FF8400:hover
            {
                color: #0071B9;
            }

        .outlogin_layerbox_bylx .layerbox_left ul.loginformlist li input.styles
        {
            -moz-box-sizing: content-box;
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
        }

        .left
        {
            float: left;
        }

        .searchbox .sb_text
        {
            float: left;
            width: 170px;
            height: 18px;
            line-height: 20px;
            vertical-align: middle;
            margin-top: 0;
            margin-bottom: 0;
            padding: 1px;
        }

        .sim_select
        {
            float: left;
            width: 35px;
        }

            .sim_select h3
            {
                background: url("images/bg.png") no-repeat scroll -216px -432px transparent;
                color: #BABABA;
                font-family: "Microsoft YaHei","微软雅黑","SimSun","宋体";
                font-size: 12px;
                font-weight: normal;
                height: 20px;
                line-height: 20px;
                overflow: hidden;
                padding-left: 8px;
                width: 43px;
                cursor: pointer;
            }

            .sim_select ul
            {
                background: none repeat scroll 0 0 #FFFFFF;
                border: 1px solid #C6C6C6;
                position: absolute;
            }

            .sim_select li
            {
                color: #333333;
                cursor: pointer;
                font-family: "Microsoft YaHei","微软雅黑","SimSun","宋体";
                font-size: 12px;
                line-height: 22px;
                padding-left: 8px;
                width: 35px;
            }

        .searchbox .sb_btn
        {
            float: right;
        }

        .suggest
        {
            z-index: 10;
        }

        .blk_right
        {
            padding-top: 0;
        }

        .searchbox
        {
            display: none;
        }

        #PublicRelation1
        {
            position: relative;
            top: -10px;
        }
    </style>
    
    <script type="text/javascript">
        //medialogo resize begin
        var flag = false; function DrawImage(a) { var b = new Image(); var c = 999; var d = 21; b.src = a.src; if (b.width > 0 && b.height > 0) { flag = true; if (b.width / b.height >= c / d) { if (b.width > c) { a.width = c; a.height = (b.height * c) / b.width } else { a.width = b.width; a.height = b.height } } else { if (b.height > d) { a.height = d; a.width = (b.width * d) / b.height } else { a.width = b.width; a.height = b.height } } } }
        //medialogo resize end
    </script>
       <script type="text/javascript">
           function formLoad()
           {
               var refreshParent = getQueryString("refreshParent");
               if (refreshParent == "1")
               {
                   //alert('1');
                   top.window.opener.location.reload();
               }
           }
           function getQueryString(name) {
               var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
               var r = location.search.substr(1).match(reg);
               if (r != null) return unescape(decodeURI(r[2])); return null;
           }
            </script> 
</head>
<body onload="formLoad()">
    <!-- body code begin -->

    <div style="background: #072785; min-width: 1000px; display: none;" id="nav">
        <div class="wrap">
            <div class="nav clearfix">
                <ul>
                    <li><a href="http://zhuanlan.sina.com.cn/">专栏首页</a></li>
                    <li class="line">&nbsp;</li>
                    <li><a href="http://home.zhuanlan.sina.com.cn/" target="_blank" class="link-fff">个人中心</a></li>
                    <li class="current"><a href="/zl/">意见领袖</a></li>
                    <li class="nav_gdzt">
                        <a href="/zl/special/" class="nav_gdzt_title">观点专题</a>
                        <div class="nav_gdzt_list">

                            <a href="/zl/special/jsjs.shtml" target="_blank">股市维稳</a>

                            <a href="/zl/special/ythll.shtml" target="_blank">亚投行来了</a>

                            <a href="/zl/special/zgzzkj.shtml" target="_blank">中国制造的困局</a>

                            <a href="/zl/special/2015scjz.shtml" target="_blank">15年首次降准</a>

                            <a href="/zl/special/2015rmbqn.shtml" target="_blank">2015人民币去哪</a>

                            <a href="/zl/special/" target="_blank">热点专题回顾</a>
                        </div>
                    </li>
                    <li><a href="/zl/china/">热评中国</a></li>
                    <li><a href="/zl/international/">海外来风</a></li>
                    <li class="nav_tzlc">
                        <a class="nav_tzlc_title" href="/zl/stock/">投资理财</a>
                        <div class="nav_tzlc_list">
                            <a href="/zl/stock/">股票</a><a href="/zl/fund/">基金</a><a href="/zl/usstock/">美股</a><a href="/zl/money/">理财</a><a href="/zl/hkstock/">港股</a><a href="/zl/bank/">银行</a><a href="/zl/insurance/">保险</a><a href="/zl/future/">期货</a><a href="/zl/nmetal/">黄金</a><a href="/zl/forex/">外汇</a>
                        </div>
                    </li>
                    <li><a href="/zl/management/">管理</a></li>

                    <li><a href="/zl/50forum/">中国经济50人</a></li>
                    <li><a href="/zl/zuozhe/">作者库</a></li>
                </ul>
                <div class="nav-form">
                    <form action="/zl/search.php" method="get" id="unify_search" target="_blank" class="udv-clearfix">
                        <input type="hidden" name="by" value="all" />
                        <input type="hidden" name="pid" value="31" />
                        <input type="text" name="q" class="nav-f-text" id="nav-f-text" autocomplete="off" />
                        <input type="submit" class="nav-f-submit" value="" />
                    </form>
                </div>
            </div>
        </div>

    </div>

    <div class="wrap" style="width: 1300px;">

        <div class="sp20"></div>

        <!-- 主容器 begin -->
        <a name="Main"></a>
        <div class="Main clearfix">
            <!--  内容列 begin -->
            <div class="blkContainer">


                <!-- 正文块 begin -->
                <div class="blkContainerPblk" id="J_Article_Wrap">
                    <!-- 微博名片 --><!--
                    <script type="text/javascript" src="http://news.sina.com.cn/js/87/20110714/205/sinalib.js"></script>
                    <script type="text/javascript" src="http://ent.sina.com.cn/js/20120914/weibocard.js"></script>-->
                    <!-- /微博名片 -->
                    <div class="blkContainerSblk">
                        <h1 id="artibodyTitle" pid="31" tid="1" did="23219218" fid="1554"><%=CTitle%></h1>
                        <div class="artInfo">
                            <span id="pub_date"><%=CreateOn%></span>&nbsp;&nbsp;<span class="art_author" id="author_ename">作者:<%=BusinessUnitName%></span>&nbsp;&nbsp;<a class="support_fun" id="J_To_Support" href="javascript:;" title="赞一个" action-type="to_support">(<em>  <%=LikeCount%></em>)<span class="support_tip">+1</span></a>  <a id="media_comment" href="#J_Comment_Wrap" rel="我有话说" class="J_Comment_Count_Txt" style="display: none;" action-type="anchorGo" data-sudaclick="media_comment">我有话说</a>
                            <div class="font_change" id="J_Font_Zoomer" data-sudaclick="font_change">
                                <span font-size="14"><a class="J_Font_Zoomer_Trigger icon font_down font_down_disable" action-type="fontZoom" action-data="type=down" href="javascript:void(0);" title="减小字号"></a><a class="J_Font_Zoomer_Trigger icon font_up" action-type="fontZoom" action-data="type=up" href="javascript:void(0);" title="加大字号"></a></span>
                            </div>
                        </div>
                        <div id="art-subscribe" class="art-subscribe"></div>
                        <!-- 正文内容 begin -->
                        <div class="blkContainerSblkCon BSHARE_POP" id="artibody">
                            <div class="moduleSingleImg01">
                            </div>
                             <%=Contents%>
                        </div>

                       
                        <!-- 文章关键字 begin -->
                        <p class="art_keywords">
                            <span class="art_keywords_tt">文章关键词：</span> <%=KeyWords%>
                        </p>
                        <!-- 文章关键字 end -->
                        <p class="art_keywords">
                            <span class="art_keywords_tt">附件：</span><%=AttachHTML%>
                        </p>
                        <div class="content_line"></div>
                        <!-- 相关新闻 begin -->
                        <div class="content_aboutNews clearfix">
                            <div class="ctit ctit_01">
                                <h2>推荐阅读</h2>
                            </div>
                            <div class="cblk_01">
                                <ul class="clist cpot clist_02">
                                    <%=RecommentListHTML%>
                                </ul>
                            </div>
                        </div>
                        <!-- 相关新闻 end -->

                        <div class="attitude" id="attitude">
                        </div>


                        <!-- 分享功能 old位置 begin -->
                        <div class="content_shareto clearfix" style="display: none;">
                            <div id="sinashareto" style="height: 60px; float: right; width: 460px;">
                                <div style="line-height: 22px; height: 30px; text-align: right; padding-right: 5px; visibility: hidden;" data-sudaclick="cmnt_num_02"><a href="#J_Comment_Wrap" rel="欢迎发表评论" class="J_Comment_Count_Txt fgrey333" style="display: none;" action-type="anchorGo">欢迎发表评论</a></div>
                            </div>
                        </div>
                        <!-- 分享功能 old位置 end -->



                    </div>

                    <style>
                        .weibo_share_w
                        {
                            position: relative;
                            bottom: -50px;
                            left: -160px;
                            float: none !important;
                            _zoom: 1;
                            *bottom: -30px;
                            _bottom: -50px;
                        }

                        .J_Comment_Count_Txt
                        {
                            position: relative;
                            bottom: -43px;
                            *bottom: -26px;
                            _bottom: -40px;
                        }

                        #media_comment
                        {
                            position: static;
                        }

                        .content_shareto
                        {
                            margin-top: -100px!important;
                            _margin-top: -80px;
                            height: auto;
                        }

                        #J_Post_Box_Count .J_Comment_Count_Txt
                        {
                            position: static;
                        }

                        .blkContainerSblk
                        {
                            padding-bottom: 5px;
                        }

                        .blkContainerCommentblk
                        {
                            margin-top: 20px;
                            margin-bottom: 20px;
                        }

                        .Mblk_cmnt
                        {
                            width: 678px !important;
                        }

                            .Mblk_cmnt .post_box_top
                            {
                                width: 648px !important;
                            }

                            .Mblk_cmnt .b_cont2
                            {
                                border-left: none;
                                border-right: none;
                            }

                        .attitude
                        {
                            padding-top: 18px;
                            padding-bottom: 18px;
                        }

                        .content_aboutNews
                        {
                            padding-left: 20px;
                        }
                        /* 分享 收藏 保存 打印 */
                        .content-tools-wrap
                        {
                            height: 25px;
                            line-height: 25px;
                            margin: 0;
                            padding: 0 25px;
                            overflow: visible;
                        }

                            .content-tools-wrap .weixin_qr_intro
                            {
                                text-align: left;
                            }

                        .content-tools-share
                        {
                            float: left;
                            display: inline;
                        }

                        .content-tools-share-label
                        {
                            float: left;
                            padding-right: 5px;
                            color: #333;
                        }
                    </style>

                </div>
                <!-- 正文块 end -->
                <div class="sp5"></div>


                <!--  内容列 end -->
            </div>
            <!--  侧边栏 begin -->
            <div class="sidebar">
                <!-- 推荐阅读 begin -->
                <div class="recRead custOrder">
                    <div class="custOrderTit">
                        <h2><a href="#" class="f072">最新</a></h2>
                    </div>
                    <div class="recReadCont">
                        <ul class="recList" id="JS_Recommend_List">
                               <!--<li><a href="" target="_blank">李德林：躺枪的经济怎样爬起来</a></li>-->
                            <%=LatestHTML%>
                        </ul>
                    </div>
                </div>
                <!-- 推荐阅读 end -->

                <!-- 热文排行 begin -->
                <div class="hotArtiList custOrder">
                    <div class="custOrderTit">
                        <h2><span class="f072">热文排行</span></h2>
                    </div>
                    <div class="hotArtiListCont">
                        <ul class="hatList">
                            <%=HotListHTML%>
                           
                        </ul>
                    </div>
                </div>               
            </div>
            <!--  侧边栏 end -->
        </div>
        <!-- 主容器 end -->
    </div>
    
    <!-- footer -->
    <!-- end footer -->

</body>
</html>
