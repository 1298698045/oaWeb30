﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeHotNews.aspx.cs" Inherits="WebClient.apps.scontent.HomeHotNews" %>
<html>
<head>
    <title></title>
    <script src="/js/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <!--
    <script src="jquery.bxslider.min.js" type="text/javascript"></script>-->
    <style type="text/css">
        .il, ol, ul
        {
            list-style: outside none none;
        }

        a, abbr, acronym, address, applet, b, big, blockquote, body, caption, center, cite, code, dd, del, dfn, dl, dt, em, fieldset, font, form, h1, h2, h3, h4, h5, h6, html, i, iframe, img, ins, kbd, label, legend, li, object, ol, p, pre, q, s, samp, small, span, strike, sub, sup, table, tbody, td, tfoot, th, thead, tr, tt, u, ul, var
        {
            background: rgba(0, 0, 0, 0) none repeat scroll 0 center;
            border: 0 none;
            font: inherit;
            margin: 0;
            padding: 0;
            vertical-align: baseline;
        }

        h1, h2, h3, h4, h5, h6, td, th
        {
            font-weight: 400;
        }

        .top-slider
        {
            background: #000 none repeat scroll 0 0;
            height: 446px;
            margin-bottom: 10px;
            overflow: hidden;
            width: 470px;
        }

            .top-slider li
            {
                float: left;
                min-width: 470px;
                width: 470px;
            }

            .top-slider .bx-wrapper
            {
                position: relative;
                width: 470px;
            }

            .top-slider .bx-viewport
            {
                height: 440px;
                min-height: 440px;
                width: 470px;
            }

            .top-slider .slider-box
            {
                height: 440px;
                position: relative;
            }

            .top-slider .slider-img
            {
                position: relative;
            }

                .top-slider .slider-img img
                {
                    height: 313px;
                    width: 100%;
                }

            .top-slider .slider-box .tags
            {
                left: 30px;
                position: absolute;
                top: 265px;
            }

                .top-slider .slider-box .tags a
                {
                    background: #f12b15 none repeat scroll 0 0;
                    color: #fff;
                    display: inline-block;
                    font-size: 14px;
                    line-height: 24px;
                    padding: 0 10px;
                }

            .top-slider .slider-header
            {
                background-color: #000;
                border-top: 1px solid #333;
                padding: 15px 30px 10px;
            }

                .top-slider .slider-header h3 a
                {
                    color: #e5e5e5;
                    font-size: 24px;
                    line-height: 30px;
                }

                .top-slider .slider-header p
                {
                    color: #f5f5f5;
                    font-size: 16px;
                    line-height: 24px;
                    margin-top: 10px;
                    word-wrap: break-word;
                }

            .top-slider .slider-footer
            {
                background-color: #000;
                bottom: 10px;
                left: 0;
                position: absolute;
                width: 100%;
            }

                .top-slider .slider-footer p
                {
                    line-height: 20px;
                    padding: 0 30px;
                }

                    .top-slider .slider-footer p span
                    {
                        color: #aaa;
                        display: inline-block;
                        font-size: 12px;
                    }

                .top-slider .slider-footer span a
                {
                    color: #aaa;
                }

                .top-slider .slider-footer .collect, .top-slider .slider-footer .comment
                {
                    float: right;
                    margin-left: 10px;
                }

                    .top-slider .slider-footer .comment em
                    {
                        margin-left: 3px;
                    }

            .top-slider .bx-controls
            {
                height: 4px;
            }

            .top-slider .bx-controls .bx-pager
            {
                width: 100%;
            }

            .top-slider .bx-controls .bx-pager .bx-pager-item
            {
                display: inline-block;
                float: left;
            }

            .top-slider .bx-controls .bx-pager .bx-pager-item .bx-pager-link
            {
                background: #666 none repeat scroll 0 0;
                border-left: 1px solid #000;
                border-right: 1px solid #000;
                display: block;
                height: 4px;
                text-indent: -9999px;
                transition: all 0.3s ease 0s;
            }

            .top-slider .bx-controls .bx-pager .bx-pager-item .bx-pager-link.active
            {
                background: #ee2e24 none repeat scroll 0 0;
            }

            .top-slider .bx-controls-direction a
            {
                background: rgba(0, 0, 0, 0) url("../image/top-slider.png") no-repeat scroll 0 0;
                display: inline-block;
                height: 98px;
                margin-top: -50px;
                position: absolute;
                text-indent: -9999px;
                top: 38%;
                width: 100px;
                z-index: 100;
            }

            .top-slider .bx-controls-direction .bx-prev
            {
                background-position: 0 0;
                left: 0;
            }

            .top-slider .bx-controls-direction .bx-prev:hover
            {
                background-position: 0 -83px;
            }

            .top-slider .bx-controls-direction .bx-next
            {
                background-position: -100px 0;
                right: 0;
            }

            .top-slider .bx-controls-direction .bx-next:hover
            {
                background-position: -100px -83px;
            }
    </style>
</head>
<body style="margin: 0px;">
    <input type="hidden" id="totalSteps" name="totalSteps" value="<%=TotalRec%>" />
    <div class="top-slider" style="display: none">
        <div class="bx-wrapper" style="max-width: 470px;">
            <div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 440px;">
                <ul class="bxslider" style="width: 215%; position: absolute; transition-duration: 0s; transform: translate3d(-2350px, 0px, 0px);">
                  <!--  <li style="float: left; list-style: outside none none; position: relative; width: 470px;" class="bx-clone">
                        <div class="slider-box">
                            <div class="slider-img">
                                <a target="_blank" href="/article/422940.html">
                                    <img alt="" src="/20151030/14462171054886400_a470x313.jpg" class="img"><div class="box"></div>
                                    </a>
                                <div class="tags"><a target="_blank" href="/lists/34.html">中国时政</a></div>
                            </div>
                            <div class="slider-header">
                                <h3><a target="_blank" href="/article/422940.html">王林案中案真相调查 情妇和前妻谋划出资200万向办案民警行贿“购密”</a></h3>
                            </div>
                             <div class="slider-footer">
                                <p><span class="author"><a>新华网    </a></span><span class="date">10/30 22:26</span><span class="collect"><i class="jm-icon s-icon icon-a-collect"></i><em>6W</em></span><span class="comment"><i class="jm-icon s-icon icon-comment"></i><em>40</em></span></p>
                            </div>
                        </div>
                    </li>-->
                    <%=HotListHTML%>
                </ul>
            </div>
            <div class="bx-controls bx-has-controls-direction bx-has-pager">
                <div class="bx-controls-direction"><a href="" class="bx-prev">Prev</a><a href="" class="bx-next">Next</a></div>
                <div class="bx-pager bx-default-pager">
                    <div class="bx-pager-item" style="width: 20%;"><a class="bx-pager-link" data-slide-index="0" href="">1</a></div>
                    <div class="bx-pager-item" style="width: 20%;"><a class="bx-pager-link" data-slide-index="1" href="">2</a></div>
                    <div class="bx-pager-item" style="width: 20%;"><a class="bx-pager-link" data-slide-index="2" href="">3</a></div>
                    <div class="bx-pager-item" style="width: 20%;"><a class="bx-pager-link" data-slide-index="3" href="">4</a></div>
                    <div class="bx-pager-item" style="width: 20%;"><a class="bx-pager-link active" data-slide-index="4" href="">5</a></div>
                </div>
            </div>
        </div>
    </div>
    <div id="slideShow"></div>
    <!-- <img src="firstcar.gif" id="slide" width="100" height="56" />-->
    <script type="text/javascript">
        //variable that will increment through the images
        var tSteps = document.getElementById("totalSteps").value;
        tSteps = tSteps * 1;
        var step = 0
        function slideit() {
            var liItem = jQuery('.bxslider li');
            if (!liItem[step]) {
                step = 0;
                setTimeout("slideit()", 2500);
                return;
            }
            document.getElementById('slideShow').innerHTML = liItem[step].innerHTML;//"innertText" + step;
            if (step < tSteps) {
                //debugger;
                step++
            }
            else {
                //debugger;
                step = 0
                slideit();
            }
            //call function "slideit()" every 2.5 seconds
            setTimeout("slideit()", 2500)
        }
        slideit();
    </script>
</body>
</html>
