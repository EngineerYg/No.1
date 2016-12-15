/**
 * Created by MyPC on 2015/10/13.
 */

$(function () {
    $('#search_game_button').click(function () {
        var val = $('#search_game').val;
        if (val == '') {
            return;
        }
        $("#search_game_form").submit();
    })
})
