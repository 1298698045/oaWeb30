<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设置办理人员</title>
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css" rel="stylesheet" />
    <link href="/css/createdfilter.css" rel="stylesheet" />
    <link href="/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .popup-exit {
            width: 20px;
            height: 20px;
            position: absolute;
            right: 15px;
            top: 15px;
            background: url('/img/cal/closegray.png') no-repeat center;
            background-size: 18px;
            cursor: pointer;
        }

        .popup-head {
            color: #333;
            height: 58px;
            line-height: 60px;
            font-size: 16px;
            text-align: center;
            border-bottom: 2px solid #dcdcdc;
        }

        #popup-zhuangtaichange .popup-body {
            padding: 20px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .popup-foot > div {
            width: 65px;
        }

        .popup-foot > div {
            float: right;
            background-color: white;
            border: 1px solid #dcdcdc;
            color: #108af9;
            height: 32px;
            border-radius: 4px;
            text-align: center;
            line-height: 32px;
            margin-right: 10px;
            cursor: pointer;
            margin-top: 10px;
            padding: 0 10px;
        }

        .popup-foot {
            border-radius: 0;
            border-top: 2px solid #dcdcdc;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
            padding-bottom: 15px;
            height: 40px;
        }

            .popup-foot .popup-foot-shur {
                color: white;
                background-color: #108af9;
            }

        .red {
            color: red;
        }

        .item-left {
            float: left;
            width: 49%;
        }

        .item-right {
            float: right;
            width: 49%;
        }

        .popup-body {
            padding: 20px;
            height: 458px;
            overflow: auto;
        }

        .item-body {
            margin-top: 5px;
        }

        input {
            height: 32px;
            line-height: 32px;
            border-radius: 4px;
        }

        textarea {
            height: 50px;
        }

        input, textarea {
            width: 100%;
            border: 1px solid #dedede;
        }

        .item {
            margin-top: 10px;
        }

        .popup-foot .popup-foot-shur:hover {
            color: white;
            background-color: #0d7ade !important;
        }

        .disstatus {
            border-color: red;
        }

        .save-status {
            font-size: 12px;
            color: red;
        }

        .form-error {
            margin-top: 10px;
            text-align: left;
            width: 100%;
            background: rgb(194, 57, 52);
            padding: 15px;
            color: #fff;
            border-radius: 4px;
            height: 50px;
            box-sizing: border-box;
        }

        .form-error2 {
            color: rgb(194, 57, 52);
            margin-left: 15px;
            margin-top: 10px;
            font-size: 14px;
            text-align: left;
        }

        .item-title {
            display: inline-block;
            margin-bottom: 5px;
        }
        .section-title {
            padding: 5px;
            background-color: #f2f2f2;
            border-radius: 4px;
        }
        input[type="checkbox"] {
            width: 14px;
            height: 14px;
        }
        .popup-body .layui-input-block {
            margin-left: 0;
        }
        .section-body {
            padding: 0 20px;
        }
        .section {
            padding-bottom: 20px;
        }
        .red {
            color: red;
        }
        .layui-form input {
            text-indent: 5px !important;
        }
        .selectCell{
            font-size:14px;
        }
        .selectCell select{
            height:300px;
        }
        .filter-main{
            padding-left:0;
        }
        .filter-addbtn{
            margin-left:15px;
        }
        .treePanel{
            width:240px;
            margin-top:25px;
            margin-right:10px;
            display:none;
        }
        .section-edit{
            float:right;
            margin-right:15px;
            cursor:pointer;
            color:#108def;
            font-size:14px;
        }
        .section-up{
            display:none;
        }
        #Variables .layui-form-checkbox,#StepVariables .layui-form-checkbox{
            width:40%;
        }
        #table{
            border-collapse:collapse;
        }
        #table td,#table th{
            border:1px solid #dedede;
            text-align:center;
            padding:5px;
        }
        #peoplecontent>div{
            float:left;
            width:30%;
            padding-left:20px;
            box-sizing:border-box;
        }
    </style>
</head>
<body>
    <div class="popup" style="display: block;">
        <div class="popup-exit close"></div>
        <div class="popup-head">
            预览人员
        </div>
        <div class="popup-body layui-form">
            <div class="modal-header"></div>
            <div class="section">
                <div id="peoplecontent">
                    
                </div>
            </div>
        </div>
        <div class="popup-foot">
            <div class="close">取消</div>
        </div>
    </div>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    
    <script src="/js/alert.js"></script>
    <script>
        ajaxMethodGetData('process.step.participator.getlist', {
            processId: getQueryString('processId'),
            stepId: getQueryString('stepId'),
        }, function (data) {
            for (var i = 0; i < data.participators.length; i++) {
                var res = data.participators[i]
                $('#peoplecontent').append('<div>' + res.userName + res.BusinessUnitIdName + '</div>')
            }
        })
        $('.close').click(function () {
            parent.$('#iframe').hide()
            parent.$('.popup-mask').hide()
        })
    </script>
</body>
</html>
