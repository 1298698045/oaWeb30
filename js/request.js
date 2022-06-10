// 请求得封装头部
// localhost:61052/apps/CommandProcessor.ashx?cmd=app.profile.getlist&type=oa
var commomUrl = "http://localhost:61052/apps/"; // 公共前缀url
var commonHeader = {
  // 公共header
  Accept: "application/json",
  Authorization: "Bear " + "...",
};

//公共ajax封装
function ajax(url, type, params, successfn, errorfn) {
  $.ajax({
    url: commomUrl + url,
    type: type,
    // headers: commonHeader,
    data: params,
    success: function (res) {
      successfn(res);
    },
    error: function (res) {
      errorfn(res);
    },
    complete: function () {
    },
  });
}
