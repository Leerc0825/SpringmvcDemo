$(function () {

    var scored = false;//用户是否已经打分
    $("div.dafen i").mouseover(function (e) {
        if (!scored) {
            var i_list = $("div.dafen i");
            for (var i = 0; i < i_list.length; i++) {
                i_list.eq(i).removeClass("fa-star-o");
                i_list.eq(i).addClass("fa-star");
                if (this == i_list[i])
                    break;//结束循环
            }
        }
    });

    var isLogin = false;//默认未登录
    $("div.dafen i").click(function (e) {
        if (!isLogin) {
            var i_list = $("div.dafen i");
            $("div.dafen i").removeClass("fa-star")
            $("div.dafen i").addClass("fa-star-o")
            for (var i = 0; i < i_list.length; i++) {
                i_list.eq(i).removeClass("fa-star-o");
                i_list.eq(i).addClass("fa-star");
                if (this == i_list[i]) {
                    $("[name=score]").val((i + 1) * 2);
                    scored = true;
                    break;//结束循环
                }

            }
        } else $("#myModal").modal("show");

    });

    $("div.dafen i").mouseleave(function () {
        if (!scored) {//如果用户还没打分，则需要将星号清除
            $("div.dafen i").removeClass("fa-star")
            $("div.dafen i").addClass("fa-star-o")
        }
    });


});

function showStar(star_list,pingfen) {
    var pingfen2 = Math.round(pingfen);//四舍五入计算出的分数
    var star_list = $("div.pingfen i");
    for (var i = 0; i < star_list.length; i++) {
        star_list.eq(i).removeClass("fa-star-o")
        if (pingfen2 >= 2.0)
            star_list.eq(i).addClass("fa-star");
        else
            star_list.eq(i).addClass("fa-star-half-o");
        pingfen2 -= 2;
        if (pingfen2 <= 0) break;
    }
}