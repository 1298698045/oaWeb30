<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="WebClient.secur.logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
    setTimeout(function () { window.location = '/secur/login.aspx'; }, 500);
</script>
<body id="logoutBody" onload="if(this.bodyOnLoad) bodyOnLoad();" onunload="if(this.bodyOnUnload) bodyOnUnload();">
<!-- Logout Page -->

</body>
</html>