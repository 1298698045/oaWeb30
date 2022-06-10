var browserClient = {
    IS_IE: 0 <= navigator.userAgent.indexOf("MSIE"),
    IS_IE6: 0 <= navigator.userAgent.indexOf("MSIE 6"),
    IS_IE11: !!navigator.userAgent.match(/Trident\/7\./)
}

var str = '';
str += '<object id="WebOffice" width="100%" height="100%" classid="clsid:23739A7E-5741-4D1C-88D5-D50B18F7C347" codebase="iWebOffice2003.ocx#version=8.8.6.8">';
str += '</object>';

var noneIE=' <object progid="iWebOffice2003.iWebOffice" id="WebOffice" type="application/iwebplugin" HEIGHT="100%" width="100%"';
noneIE+=' OnExecuteScripted="OnExecuteScripted" ';
noneIE+=' OnMenuClick="OnMenuClick" OnToolsClick="OnToolsClick"';
noneIE+=' copyright="北京凤凰世纪科技有限公司[仅限内部员工专用];V5.0S0xGAAEAAAAAAAAAEAAAAG4BAABwAQAALAAAAG3/SgWVriClLdTh82zuqGVG3qrk0zLB/0biBGtL4odBZZCs7T/FVfKBRFjl/BZDSF/nCYOsGcDsrabWiS0Unr4t8Fp04nx0f+FnOcq6a1L1tcnsa/0GJTSCdoOLoYECxVKoTBIU0AyINsTfnjZKjOdOnwAGz1VFukwU9WyVLzp8JnF75uCEIFfGSvVdOKIL841qBnBjVkSAlKnUrcUrnK10tuvgrW2R5aA8aLV2VXqBRlS2u2+i/Y0nF1xZphyUFriWBm9QLKYOuttjPb2LTQPBINnSUPKr1v4p6VH6T6Hdgd5azQn7AzVAfR+7XuWYxOkHM8p49h4H24pOXmZnO7G8de/U62B/KLJ8L0s2A2DFbJJFqGY2w3AVM51iZ5B+kDwuembFC5WrNjdxS2STP6WbZfJXQL8LASXwoL+Qd446u4YF6VcQEvLVdUh7467ms3zaMAtFhwFc4WZuXBRjljNAACHWSIgYBuxGSMxusaCQx7Ougz9PhtyTQnjIc5dJyg=="></object>';
if(browserClient.IS_IE || browserClient.IS_IE6 || browserClient.IS_IE11)
    document.write(str);
else
    document.write(noneIE);