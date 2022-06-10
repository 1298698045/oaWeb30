// JavaScript Document

$(document).ready(function(e) {
//奇偶序列	
    $(".main > .hBlock:even").addClass("even");
    $(".main > .hBlock:odd").addClass("odd");
	$(".optT ul").each(function() {
        $(this).children("li:last").addClass("last")
    });
	
//Sub Menu
$(".cMenuBut,.cSubMenu").on({
	mouseover:function(){
		$(".cSubMenu").show()
		var SubRH=$(".cSubmenuL").height();
		$(".cSubmenuR").css("min-height",SubRH)
	},
	mouseout:function(){
		$(".cSubMenu").hide()
	}
})	


$(".cSubmenuL ul li.cSubmenuHeader").on({
	mouseover:function(){
		if(!$(this).hasClass(".cur")){
			$(this).addClass("cur").siblings().removeClass("cur");
			var subLiNum=$(this).index();
			$(this).parent().parent(".cSubmenuL").siblings(".cSubmenuR").children("ul.cSubCnt").children("li").eq(subLiNum).addClass("cur").siblings("li").removeClass("cur");
			$(this).parent().parent(".cSubmenuL").siblings(".cSubmenuR").children("ul.cSubAD").children("li").eq(subLiNum).addClass("cur").siblings("li").removeClass("cur");
		}
	}
})	
// Tab
	$(".optT ul li").on({
		mouseover:function(){
			$(this).addClass("hover");
		},
		mouseout:function(){
			$(this).removeClass("hover");
		},
		click:function(){
			if(!$(this).hasClass("cur")){
				$(this).addClass("cur").siblings().removeClass("cur");
				var liIndex = $(this).index();
				$(this).parents(".option").next(".optCnt").children("ul").children("li").eq(liIndex).show().siblings("li").hide();;
			}
		}
	})	
	

    

	
});

