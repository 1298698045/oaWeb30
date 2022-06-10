// var isBook = true;
var documentWidth = $(this).width();
var topMenuItemWidth = 90;
var topMenuWrapWidth = $(".topMenuWapper").width();
var totalNum = $(".topMenuWapper .topTabMenuItem").length - 2;
// var showNum = Math.floor(topMenuWrapWidth / topMenuItemWidth) - 1;

// $(".topMenuWapper .topTabMenuItem")
//   .filter(":lt(" + showNum + ")")
//   .show()
//   .end()
//   .filter(":gt(" + showNum + ")")
//   .hide();
// console.log("topMenuWrapWidth", topMenuWrapWidth, showNum);
// if (showNum < totalNum) {
//   console.log(showNum,totalNum)
//   $(".topMenuWapper .topTabMenuItemMore").show();
//   $(".topMenuWapper .topTabMenuItem").eq(totalNum).show();
//   var arr = $(".topMenuWapper .topTabMenuItem")
//     .filter(":lt(" + showNum + ")")
//     .show()
//     .end()
//     .filter(":gt(" + showNum + ")");
//   arr = arr.not(".topTabMenuItemMore");
//   for (var i = 0; i < arr.length; i++) {
//     var str = "";
//     str += '<div class="dropMenuItem">';
//     str += '<a href="#" class="name">';
//     str += arr[i].innerText;
//     str += "</a>";
//     str += "</div>";
//     $(".topMenuWapper .topTabMenuItemMore .dropMenuWapper .dropMenu").append(
//       str
//     );
//   }
// }


resizeWidthFun(documentWidth, topMenuWrapWidth, topMenuItemWidth, totalNum);

/**
 * 
 * @param {*} documentWidth // 文档窗口宽度
 * @param {*} topMenuWrapWidth // 顶部菜单整体 宽度
 * @param {*} topMenuItemWidth // 顶部菜单每项的宽度
 * @param {*} totalNum // 初始顶部菜单的总个数
 */
  function resizeWidthFun(
    documentWidth,
    topMenuWrapWidth,
    topMenuItemWidth,
    totalNum
  ) {
    // 当前dom默认显示多少个菜单
    var currentDomNum = Math.floor(topMenuWrapWidth / topMenuItemWidth) - 1;
    //console.log("currentDomNum", currentDomNum);
    // 控制显示隐藏哪些菜单
    $(".topMenuWapper .topTabMenuItem")
      .filter(":lt(" + currentDomNum + ")")
      .show()
      .end()
      .filter(":gt(" + currentDomNum + ")")
      .hide();
      // 判断当前显示的个数是否小于总条数，如果小于，需要显示更多
    $(".topMenuWapper .topTabMenuItemMore .dropMenuWapper .dropMenu").children().remove();
      if(currentDomNum < totalNum) {
        $(".topMenuWapper .topTabMenuItemMore").show();
        // 更多中要push的内容
         var arr = $(".topMenuWapper .topTabMenuItem")
           .filter(":lt(" + currentDomNum + ")")
           .show()
           .end()
           .filter(":gt(" + currentDomNum + ")");
        // 除更多本身
        arr = arr.not(".topTabMenuItemMore");
        //console.log(arr,'------')
        for (var i = 0; i < arr.length; i++) {
          var str = "";
          str += '<div class="dropMenuItem">';
          str += '<a href="'
          str += $(arr[i]).find("a").attr("href")
          str += '"class="name">';
          str += arr[i].innerText;
          str += "</a>";
          str += "</div>";
          $(
            ".topMenuWapper .topTabMenuItemMore .dropMenuWapper .dropMenu"
          ).append(str);
        }
      }
  }

  $(window).resize(function(){
    documentWidth = $(this).width();
    topMenuWrapWidth = $(".topMenuWapper").width();
    totalNum = $(".topMenuWapper .topTabMenuItem").length - 3;
    if(documentWidth>=1914){
      //location.reload();
    }
    resizeWidthFun(documentWidth, topMenuWrapWidth, topMenuItemWidth, totalNum);
  })

  // $(window).resize(function () {
  //   var width = $(this).width();
  //   if (width < 1400) {
  //     $(".topMenuWapper .topTabMenuItem")
  //       .filter(":lt(4)")
  //       .show()
  //       .end()
  //       .filter(":gt(4)")
  //       .hide();
  //     var index = $(".topMenuWapper .topTabMenuItem").length - 1;
  //     $(".topMenuWapper .topTabMenuItem").eq(index).show();
  //     var arr = $(".topMenuWapper .topTabMenuItem")
  //       .filter(":lt(4)")
  //       .show()
  //       .end()
  //       .filter(":gt(4)");
  //     arr = arr.not(".topTabMenuItemMore");
  //     if (isBook == true) {
  //       for (var i = 0; i < arr.length; i++) {
  //         var str = "";
  //         str += '<div class="dropMenuItem">';
  //         str += '<a href="#" class="name">';
  //         str += arr[i].innerText;
  //         str += "</a>";
  //         str += "</div>";
  //         $(
  //           ".topMenuWapper .topTabMenuItemMore .dropMenuWapper .dropMenu"
  //         ).append(str);
  //       }
  //     }
  //     isBook = false;
  //   } else {
  //     $(".topMenuWapper .topTabMenuItem")
  //       .filter(":lt(4)")
  //       .show()
  //       .end()
  //       .filter(":gt(4)")
  //       .show();
  //     var arr = $(".topMenuWapper .topTabMenuItem")
  //       .filter(":lt(4)")
  //       .show()
  //       .end()
  //       .filter(":gt(4)");
  //     arr = arr.not(".topTabMenuItemMore");
  //     // console.log('=======arr', arr)
  //     var result = [];
  //     for (let i = 0; i < arr.length; i++) {
  //       result.push(arr[i].innerText);
  //     }
  //     console.log(result, "result", result[0]);
  //     $(
  //       ".topMenuWapper .topTabMenuItemMore .dropMenuWapper .dropMenu .dropMenuItem"
  //     ).each(function (index) {
  //       // console.log("index", index);
  //       var html = $(
  //         ".topMenuWapper .topTabMenuItemMore .dropMenuWapper .dropMenu .dropMenuItem"
  //       )
  //         .eq(index)
  //         .find(".name");
  //       if (html && html[0]) {
  //         html = html[0].innerText;
  //       }
  //       console.log(html, "html", result);
  //       if (isIE()) {
  //       } else {
  //         html = $.trim(html);
  //       }
  //       if (result.indexOf(html) != -1) {
  //         console.log("ifififif", index, html);
  //         $(
  //           ".topMenuWapper .topTabMenuItemMore .dropMenuWapper .dropMenu .dropMenuItem"
  //         )
  //           .eq(index)
  //           .hide();
  //       }
  //     });
  //     isBook = true;
  //     $(".topMenuWapper .topTabMenuItemMore").hide();
  //   }
  // });

// 判断是否是ie
function isIE() {
  if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
    return true;
  } else {
    return false;
  }
}  

function getHeaderQuery() {
  let url = "CommandProcessor.ashx", // 接口
    params = {
      // 参数
      cmd: "app.profile.getlist",
      type: "oa",
    };
  // 调用公共resquest.js的get方法
  ajax(
    url,
    "GET",
    params,
    function (res) {
      res = JSON.parse(res);
      let list = res.listData || [];
      //console.log(res); //请求成功
      $(".appMenuWapper .appMenu .appMenuItem").remove();
      for (var i = 0; i < list.length; i++) {
        str = "";
        str += '<div class ="appMenuItem"';
        str += ' href="'
        str += list[i].LinkUrl
        str += '">';
        str += '<div class ="box">';
        str += '<p class ="item_icon">';
        str += '<i class="iconfont icon-kaoqinguanli"></i>';
        str += "</p>";
        str += '<p class="name" title="${list[i].Label}">';
        str += list[i].Label;
        str += "</p>";
        str += "</div>";
        str += '<div class ="active"></div>';
        str += "</div>";
        $(".appMenuWapper .appMenu").append(str);
      }
      $(".appMenuWapper .appMenu .appMenuItem").click(function () {
        //console.log($(this).attr("href"));
        var url = $(this).attr("href");
        url = encodeURI(url)
          //console.log(url, 'url')
        //window.open(url);
          window.location.href = url
      });
    },
    function (res) {
      console.log(res); //请求失败
    }
  );
}
getHeaderQuery();
var index = $('.userWrap .dropMenuWapper.userModal .dropMenu .dropMenuItem').length - 1;
$('.userWrap .dropMenuWapper.userModal .dropMenu .dropMenuItem').each(function () {
    //console.log($(this).find('.item')[0].innerText)
    var text = $(this).find('.item')[0].innerText
    text = text.replace(/\s+/g, "");
    $(this).click(function () {
        if (text == '退出登录') {
            window.location.href = '/secur/login.aspx'
        }
    })
})