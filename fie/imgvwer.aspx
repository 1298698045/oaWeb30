<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="imgvwer.aspx.cs" Inherits="WebClient.fie.imgvwer" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="A jQuery plugin wrapper for Viewer.js.">
  <meta name="author" content="Chen Fengyuan">
  <title>图片查看</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/viewer.css">
  <link rel="stylesheet" href="css/main.css">
</head>
<body>
 <!-- Content -->
  <div class="container">
    <a href="/apps/files/FileViewer.aspx?id=<%=Request["id"]%>&isAttach=1&filesource=1" target="_blank">查看点击图片</a>
    <div class="row">     
      <div class="col-sm-81 col-md-6_">
        <h3>查看图片</h3>
        <hr>
        <div class="docs-galley">
          <ul class="docs-pictures clearfix">
            <!--<li><img data-original="images/CarresqueiraPortugal.jpg" src="images/CarresqueiraPortugal.jpg" alt="Cuo Na Lake"></li>-->
              <%=AttachmentListHTML%>
          </ul>
        </div>
      </div>  
    </div>
  </div>
  <!-- Scripts -->
  <script src="js/jquery-3.3.1.slim.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/common.js"></script>
  <script src="js/viewer.js"></script>
  <script src="js/jquery-viewer.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
