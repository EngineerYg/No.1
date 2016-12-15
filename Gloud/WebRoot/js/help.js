/**
 * 1.找到自身的索引
 * 2.找到其对应索引
 * 3.修改其样式
 */
$(function(){

	 var email_patt = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
	 var phone_patt = new RegExp(/^(130|131|132|133|134|135|136|137|138|139|150|151|152|153|154|155|156|157|158|159|170|176|180|177|178|181|182|183|184|185|186|187|188|189)[0-9]{8}$/);
	var oBox = $('.j_tap_box');
	var oNav = $('.j_tap_nav');
	var oContent = $('.j_tap_content');
	oBox.find('li').on('click', function(){
		oBox.find('a').removeClass('on');
		$(this).find('a').addClass('on');
		oNav.children().css('display', 'none');
		oNav.children().eq($(this).index()).css('display', 'block');
		oContent.find('.help_font_height_b').css('display', 'none');
		oContent.find('.help_font_height_b').eq($(this).index()).css('display', 'block');
		
	})

	oNav.children().find('a').on('click', function(){
		var outIndex = $(this).parent().index();
		var inIndex = $(this).index();
		console.log(outIndex, inIndex)
		$(this).parent().children().removeClass('on');
		$(this).parent().children().eq(inIndex).addClass('on');
		oContent.find('.help_font_height_b').eq(outIndex).find('.help_font_height_m').css('display', 'none');
		oContent.find('.help_font_height_b').eq(outIndex).find('.help_font_height_m').eq(inIndex).css('display', 'block');
	});
	 $("#j_user_feedback").click(function () {
	        var content = $("#j_feedback_contet").val();
	        var contact = $("#j_feedback_contact").val();
	        var data = $("#form_find").serialize();
	        if (content == '') {
	            write_tip_message('内容不能为空！');
	        }else if(contact==""){
	        	 write_tip_message('联系方式不能为空!');
	        }else if(!email_patt.test(contact) && !phone_patt.test(contact)){
	        	 write_tip_message('请输入正确的联系方式！');
	        }else{
	        	$("#form_find").trigger("submit");
	        }
	    });
})