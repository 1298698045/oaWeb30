<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RptProcessInstances.aspx.cs" Inherits="WebClient.apps.wf.RptProcessInstances" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="/js/jquery/1.7.1/jquery.min.js"></script>
     <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/FusionCharts/FusionCharts.js"></script>
    <script language="javascript" type="text/javascript">
        function search() {

            var startDate1 = jq("#statDateBegin").val();
            var endDate1 = jq("#statDateEnd").val();

            var dates = startDate1.split('-');

            var startDate = "";
            var endDate = "";
            if (startDate1.length < 10) {
                startDate = dates[0] + "-0" + dates[1] + "-0" + dates[2];

                var dates = endDate1.split('-');
                endDate = dates[0] + "-0" + dates[1] + "-0" + dates[2];
            }
            else {
                startDate = startDate1;
                endDate = endDate1;
            }
            //get total
            GetSalesReportSummary(startDate, endDate);

            //get chart
            getGraphData(startDate, endDate);

            //get list
            searchList(startDate, endDate);

        }


        var isHTMLChart = true;
        function getGraphData(startDate, endDate) {

            //chartObj.setDataURL(dataUrl);
            //var chartObj = new FusionCharts("/js/FusionCharts/Column3D.swf", "chartId", width, height, "0", "0");
            //var chartObj = new FusionCharts("/js/FusionCharts/Column3D.swf", "chartId", 810, 500, "0", "0");
            //isHTMLChart = !!chartObj._overrideJSChartConfiguration;
            //chartObj.setTransparent(true);
            //chartObj.setDataURL("/apps/CommandProcessor.ashx?cmd=report.instances.getusertop&startDate=" + startDate + "&endDate=" + endDate);
            //chartObj.render("chartDataId");

            var myChart = new FusionCharts('/js/FusionCharts/Column3D.swf', 'myChart', '900', '300', '0', '1');
            //myChart.setXMLUrl('Data.xml');
            //myChart.setDataXML("<chart yAxisName='Sales Figure' caption='Top 5 Sales Person' numberPrefix='$' useRoundEdges='1' bgColor='FFFFFF,FFFFFF' showBorder='0' exportEnabled='1'  exportAtClient='0' exportAction='download' >    <set label='Alex' value='25000' />    <set label='Mark' value='35000' />    <set label='David' value='42300' />    <set label='Graham' value='35300' />     <set label='John' value='31300' /></chart>");
            var xml = "<graph caption='Month Sale'>";
            xml += "<set name='January' value='462' color='AFD8F8'/>";
            xml += "<set name='Febrary' value='662' color='00D8F8'/>";
            xml += "</graph>";
            myChart.setDataXML(xml);
            myChart.render('chartDataId1');
        }


        jQuery(document).ready(function () {

            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
            if (mm < 10)
                mm = "0" + mm;

            if (dd < 10)
                dd = "0" + dd;

            //var startDate = yyyy + "-" + mm + "-01";
            var startDate = yyyy + "-01-01";
            var endDate = yyyy + "-" + mm + "-" + dd;

            jQuery("#statDateBegin").val(startDate);
            jQuery("#statDateEnd").val(endDate);

            getGraphData(startDate, endDate);

            //GetSalesReportSummary(startDate, endDate);


        });
        function getGraphData1(startDate, endDate, callbak) {

            var url = "/apps/CommandProcessor.ashx?cmd=report.instances.getusertop&startDate=" + startDate + "&endDate=" + endDate
            jQuery.ajax({
                async: false, cache: false, dataType: "html",
                error: function (request, textStatus, errorThrown) {
                    errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                    //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
                    // alert("0");
                },
                success: function (data, textStatus) {
                    //callbak(data);
                    jQuery("#chartDataId1 ").html(data);
                },
                type: "GET",
                url: url
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="text" name="statDateBegin" id="statDateBegin"/>至<input type="text" name="statDateEnd" id="statDateEnd"/>
        <div id="chartDataId1">
        </div>
    </form>
</body>
</html>
