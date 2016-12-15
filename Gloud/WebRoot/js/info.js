$(function(){
	function atlas(){
		var oUl = $('#j_atlas');
		setStyle3(oUl[0],'transition', 'all 1s ease');
		setStyle3(oUl[0],'left', '0');
		var aLi=oUl.children();
		var oImg=$('#j_atlas_img');
		var oVideo = $('#j_atlas_video');
		var playBtn = $('#j_play_btn');
		var next = $('.j_atlas_next');
		var pre = $('.j_atlas_pre');
		var now = 0;
		var width=aLi.width()/160*165;
		console.log(aLi.length)
		oUl.css('width',width*aLi.length+'px');
		aLi.on('click',function(){

			now = $(this).index();
			console.log(now);
			if(now!=0){
				if($('#j_atlas_video').length>0){
					$('#j_atlas_video')[0].pause();
					$('#j_atlas_video').remove();
				}
				
				oImg.removeClass('hide');
				playBtn.addClass('hide');
			}
			else{
				playBtn.removeClass('hide');
			}
			
			aLi.removeClass('on');
			$(this).addClass('on');
			oImg.attr('src',$(this).find('img').data('src') || $(this).find('img').attr('src'));
		
			
		})

		next.on('click',function(){
			console.log(now);

			if(now>=aLi.length-1)return;
			now++;
			if(now!=0){
				if($('#j_atlas_video').length>0){
					$('#j_atlas_video')[0].pause();
					$('#j_atlas_video').remove();
				}
				oImg.removeClass('hide');
				playBtn.addClass('hide');
			}
			else if(now==0){
				playBtn.removeClass('hide');
				
			}
			
			aLi.removeClass('on');
			aLi.eq(now).addClass('on');
			oImg.attr('src',aLi.eq(now).find('img').attr('src'));
			if(now>=aLi.length-3){
				oUl.css('left',-aLi[0].offsetWidth/160*165*(aLi.length-4) +'px');
			}
			else{
				oUl.css('left',-aLi[0].offsetWidth/160*165*now +'px');
			}
			
			
			console.log(now);
		})

		pre.on('click',function(){
			console.log(now);
			if(now<=0)return;
			now--;
			if(now!=0){
				if($('#j_atlas_video').length>0){
					$('#j_atlas_video')[0].pause();
					$('#j_atlas_video').remove();
				}
				oImg.removeClass('hide');
				playBtn.addClass('hide');
			}
			else if(now==0){
				playBtn.removeClass('hide');
				
			}
				
			aLi.removeClass('on');
			aLi.eq(now).addClass('on');
			oImg.attr('src',aLi.eq(now).find('img').attr('src'));
			if(now>=aLi.length-3){
				oUl.css('left',-aLi[0].offsetWidth/160*165*(aLi.length-4) +'px');
			}else{
				oUl.css('left',-aLi[0].offsetWidth/160*165*now +'px');
			}
			
			
		})

		playBtn.on('click', function(){
			if(now==0 && oImg.data('src')){
				$('<video src="'+ oImg.data('src') +'" poster="'+ oImg.attr('src') +'"  width="100%" height="100%" controls autoplay="autoplay" id="j_atlas_video"></video>').insertBefore(oImg);
				oVideo = $('#j_atlas_video');
				playBtn.addClass('hide');
				oImg.addClass('hide');
				// oVideo[0].addEventListener('pause', end, false);
				oVideo[0].addEventListener('ended', end, false);
			}
		})
		function end(){
			$('#j_atlas_video').remove();
			playBtn.removeClass('hide');
			oImg.removeClass('hide');
		}
	}

	function gamesSlide(){
		var oUl = $('#j_game_silde');
		setStyle3(oUl[0],'transition', 'all 1s ease');
		setStyle3(oUl[0],'left', '0');
		var aLi = oUl.children();
		var next = $('.j_game_next');
		var pre = $('.j_game_pre');
		var now = 0;
		oUl.css('width',aLi.width()*aLi.length/2.4*2.6+'px');

		aLi.on('mouseover',function(){
			$(this).find('.games_slide_cover').show();
		})
		aLi.on('mouseout',function(){
			$(this).find('.games_slide_cover').hide();
		})

		next.on('click',function(){
			if(now>=aLi.length-5)return;

			now++;
			console.log(now);

			oUl.css('left',-aLi[0].offsetWidth/242*257*now +'px');
		})
		pre.on('click',function(){
			if(now<=0)return;
			now--;
		
			oUl.css('left',-aLi[0].offsetWidth/242*257*now +'px');
		})


		
	}

	function saveSlide(){
		var oUl = $('#j_save_silde');
		if(oUl.length==0){
			return;
		}

		setStyle3(oUl[0],'transition', 'all 1s ease');
		setStyle3(oUl[0],'left', '0');
		var aLi = oUl.find('li');
		var next = $('.j_save_next');
		var pre = $('.j_save_pre');
		var now = 0;
		
		var width=aLi.width()/105*117;
		oUl.css('width',width*aLi.length+'px');
		if(aLi.length<=2){
			next.hide();
			pre.hide();
		}
		// aLi.on('mouseover',function(){
		// 	$(this).find('.games_slide_cover').show();
		// })
		// aLi.on('mouseout',function(){
		// 	$(this).find('.games_slide_cover').hide();
		// })

		next.on('click',function(){
			if(now>=aLi.length-2)return;

			now++;
			console.log(now);

			oUl.css('left',-width*now +'px');
		})
		pre.on('click',function(){
			if(now<=0)return;
			now--;
		
			oUl.css('left',-width*now +'px');
		})


		
	}

/*	function saveTab(){
		$('#j_save_tab li').on('click',function(){
			$('#j_save_tab li').removeClass('on');
			$(this).addClass('on');
			$('#j_save_box').children().addClass('hide');
			$('#j_save_box').children().eq($(this).index()).removeClass('hide');
		})
		
	}
	*/
	function saveTab(){
	/*	$('#j_save_tab li').on('click',function(){
			$('#j_save_tab li').removeClass('on');
			$(this).addClass('on');
		//	$('#j_save_box').children().addClass('hide');
		//	$('#j_save_box').children().eq($(this).index()).removeClass('hide');
		})
		*/
		$('#xw_save_1').on('click',function(){
			$('#j_save_tab li').removeClass('on');
			$(this).addClass('on');
			$('#j_save_box').removeClass('hide');
			$('#xw_save_shop').addClass('hide');
		});
		$('#xw_save_2').on('click',function(){
			$('#j_save_tab li').removeClass('on');
			$(this).addClass('on');
			$('#j_save_box').addClass('hide');
			$('#xw_save_shop').removeClass('hide');
		});
		
	}
	$('.xw_8_close_btn').on('click',function(){
		$('#j_save_f').hide();
	})
	$('#tab_nav_gold').click(function(){
		$('.user_coin').hide();
		$('.user_gold').show();
		$('#j_buy_tips,#j_buy_success,#j_is_buy').hide();
		use_money_type = "gold";
		$('#j_buy_game_time_f .tab_nav li').removeClass();
		$(this).addClass('active');
		$('#list_box_gold').show();
		$('#list_box_coin').hide();
	})
	$('#tab_nav_coin').click(function(){
		$('.user_coin').show();
		$('.user_gold').hide();
		$('#j_buy_tips,#j_buy_success,#j_is_buy').hide();
		use_money_type = "coin";
		$('#j_buy_game_time_f .tab_nav li').removeClass();
		$(this).addClass('active');
		$('#list_box_coin').show();
		$('#list_box_gold').hide();
	})
	$('#j_buy_game_time_box .list_box .click_buy').click(function(){
		var date = $(this).find('h2').html();
		$("#time").val(date);
		//alert($("#time").val());
		price = $(this).find('.buy_game_money_value').val();
		chargepoint_id = $(this).children('input[name="chargepoint_id"]').val();
		$('.list_box').hide();
		$('#isbuy_price').text(price);
		$('#j_is_buy').show();
		
	})
//	$("#sure_buy").click(function(){
//		$('#j_is_buying').show();
//		location.href="OpaLogin.php?url="+window.location.pathname+window.location.search;
//	})
	$('#save_gold').click(function(){
		$('.user_coin').hide();
		$('.user_gold').show();
		$('#j_buy_tips,#j_buy_success,#j_is_buy').hide();
		save_money_type = "gold";
		$('#j_buy_game_storage_f .tab_nav li').removeClass();
		$(this).addClass('active');
		$('#buy_game_storage_price').html(save_gold+"G币");
	})
	$('#save_coin').click(function(){
		$('.user_coin').show();
		$('.user_gold').hide();
		$('#j_buy_tips,#j_buy_success,#j_is_buy').hide();
		save_money_type = "coin";
		$('#j_buy_game_storage_f .tab_nav li').removeClass();
		$(this).addClass('active');
		$('#buy_game_storage_price').html(save_coin+"云贝");
		if (save_coin < 0) {
			$('#buy_game_storage_price').html("暂不支持云贝购买");
		}
	})


	$('#buy_game_storage_btn').on('click', function () {
		$('#buy_game_storage_btn').hide();
		$('#buying_game_storage').show();
		if(save_money_type == "coin" && save_coin < 0) {
			return;
		}
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Accountajax/buy_chargepoint',
            data: "chargepoint_id=" + save_chargepoint_id + "&use_money_type=" + save_money_type,

            success: function (result) {
            	$('#buy_game_storage_btn').show();
				$('#buying_game_storage').hide();
                if (result.code != 0) {
                    if (result.code == '-108') {
                        $("#buy_time_f").hide();
                        $("#j_save_f").hide();
                        $("#buy_fail").show();
                    } else {
                        $("#j_buy_game_storage_f").hide();
                        write_tip_message(result.message);
                    }
                    return;
                }else
                {
                    write_tip_message("购买成功", 1);
                    return;
                }
                //location.reload();
            }
        });
    });

	function buy_game_time(chargepoint_id, use_money_type) {
		$('#j_is_buy').hide();
		$('#j_is_buying').show();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Accountajax/buy_chargepoint',
            data: "chargepoint_id=" + chargepoint_id + "&use_money_type=" + use_money_type,
            success: function (result) {
            	$('#j_is_buying').hide();
                if (result.code != "0") {
                	$('#j_is_buy').hide();
                	$('#j_buy_tips').show();
                	$('#j_buy_tips .please_go').text(result.message);
                    return;
                } else {
                	$('#j_is_buy').hide();
                    $('#j_buy_success').show();
                	$('#j_buy_success .please_go').text('恭喜您，购买成功！');
                }
            }
        });
    }

    function pay_money() {
        var url = "/index.php/Pay/index";
        window.open(url);
    }

	setTimeout(function(){
		saveTab();
		saveSlide();
		atlas();
		gamesSlide();
	},300)
})
	function close_buy_box(){
		use_money_type = "gold";
		$('#j_buy_game_time_f .tab_nav li').removeClass();
		$("#tab_nav_gold").addClass('active');
		$('#list_box_gold').show();
		$('#j_buy_tips,#j_buy_success,#j_is_buy').hide();
		$('#list_box_coin').hide();
		close_all_layer('j_buy_game_time_f');
	}
	function game_back_box(){
		$('#j_buy_tips,#j_buy_success,#j_is_buy').hide();
		$('#j_buy_game_time_f .tab_nav li').removeClass();
		if (use_money_type == "gold") {
			$("#tab_nav_gold").addClass('active');
			$('#list_box_gold').show();
			$('#list_box_coin').hide();
		} else if (use_money_type == "coin") {
			$("#tab_nav_coin").addClass('active');
			$('#list_box_gold').hide();
			$('#list_box_coin').show();
		}
	}
