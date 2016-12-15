
$(function(){
	function gameList(){
		var aList = $('#j_game_list').children();
		aList.each(function(){
			$(this).on('mouseover',function(){
				$(this).find('.game_pics_cover').show();
			})
			$(this).on('mouseout',function(){
				$(this).find('.game_pics_cover').hide();
			})
		
		})
	}
	setTimeout(function(){
		// gameList();
	},300)
})
