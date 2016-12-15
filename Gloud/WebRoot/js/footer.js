/**
 * Created by MyPC on 2015/11/12.
 */
$(function () {
    //用户游戏设置
    $("#j_footer").click(function () {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Accountajax/get_user_info',
            data: "",
            success: function (result) {
                if (result.code != "0") {
                    alert(result.message);
                } else {
                    $("#j_footer_f").show();
                }
            }
        });
    });

})
