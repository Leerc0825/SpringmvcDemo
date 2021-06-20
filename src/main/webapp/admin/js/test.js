window.onload = function() {
	$("#btn2").mouseover(function() {
		console.log("test")
		$("body").css("background-color", "orange");
	});
}
//等待网页加载完毕后执行
jQuery(document).ready(function() {
	console.log("第1次");
});
jQuery(function() {
	console.log("第2次");
});
$(document).ready(function() {
	console.log("第3次");
});
$(function() {
	console.log("第4次");
});

var news_info = [{title:'新闻1', clickNum:12300}, {title:'新闻2', clickNum:9898}];