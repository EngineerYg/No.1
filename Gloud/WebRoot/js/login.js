/**
 * @Time 2016/06/29
 * @author YG
 */
$(function () {
    $("#log_username_error_message").css('display', 'none');
    $("#log_password_error_message").css('display', 'block');
    var numError = $('#form_login .wrong').length;
    var email_patt = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
    var password_patt =  new RegExp(/[A-Za-z0-9_!@#$%^&*()+\S]{6,20}$/);
    var phone_patt = new RegExp(/^(130|131|132|133|134|135|136|137|138|139|150|151|152|153|154|155|156|157|158|159|170|176|180|177|178|181|182|183|184|185|186|187|188|189)[0-9]{8}$/);
    var id_patt = new RegExp(/[0-9]{1,11}$/);
    var username;
    var password;
    var userinfo;
	var error_password_num = 0;
	var is_judge_verify_code = 0;
//	var captcha_img = $('#yzm').find('img');
//	 captcha_img.attr('title', '点击刷新');
//	captcha_img.click(function(){
//		alert(1212);
//	  	 changeCode();
//		}
//  // 验证码生成
//  var captcha_img = $('#checkcode_div').find('img');
//  var verifyimg = captcha_img.attr("src");
//  captcha_img.attr('title', '点击刷新');
//  captcha_img.click(function(){
//      if( verifyimg.indexOf('?')>0){
//          $(this).attr("src", verifyimg+'&random='+Math.random());
//      }else{
//          $(this).attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());
//      }
//  });


    $('#form_login :input').focus(function(){
	     if ($(this).is('#username')) {
			$("#log_username_error_message").html("");
			$("#log_username_error_message").removeClass("wrong");
//			removeWrong();
//			numError=0;
		 }
		  if ($(this).is('#password')) {
			$("#log_password_error_message").html("");
			
		    $("#log_password_error_message").removeClass("wrong");
//			removeWrong();
//			numError=0;
		  }

	});
    $('#form_login :input').blur(function () {
    	numError=0;
            if ($(this).is('#password')) {
				
                if(!username){
                    var $form=$("form[name='form_login']");
                    username=$("input[name='username']",$form).val();
                }
                var msg = 'log_password_error_message';
                password = this.value;
                var is_patt=verify_password(password);
                if (this.value == "") {
                    setStyle('请输入密码', 2, msg);
					is_judge_verify_code = 0;
                    return
                } else if (password.length < 6 || password.length > 16) {
                    setStyle('密码长度必须在6-16位', 2, msg);
					is_judge_verify_code = 0;
                } else if (!is_patt) {
                    setStyle('密码中含有特殊字符', 2, msg);
					is_judge_verify_code = 0;
                } else {
                    var user_error_num_key = "error_password_num_" + username;
					
					error_number =0;
					error_number = Number(error_number);
					
					
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: '/index.php/Ajaxdata/is_password',
                        data: "username=" + username + "&password=" + $.md5(password),
						async:false,
                        success: function (result) {
                            if (result.code == "0") {
                                $.cookie(user_error_num_key, 0);
                                setStyle("", 0, msg);
                            } else {
                                //获取cookie中用户的错误次数
                               is_judge_verify_code = 0;
                                error_password_num = $.cookie(user_error_num_key);
                                if (error_password_num == null) {
                                    error_password_num = 1;
                                    $.cookie(user_error_num_key, error_password_num);
                                    setStyle("密码不正确", 2, msg);
                                } else {
                                    error_password_num = Number(error_password_num);
                                    error_password_num += 1;
                                    if (error_password_num > 3 && error_password_num < 10) {
                                     //   var p_html = '<input class="h_reg_input_t" id="login_verify_code" type="text" name="login_verify_code"placeholder="请输入验证码"/>';
                                     //   $("#checkcode_p").html(p_html);
                                        $("#checkcode_div").show();
                                        setStyle("密码不正确",2, msg);
										
										error_number_boolean = true;
                                    }
                                    if (error_password_num <= 3) {
                                        setStyle("密码不正确", 2, msg);
                                    }
                                    if (error_password_num >= 0) {
                                        var ss='<a href="/index.php/User/set_password" style="color: red;border-bottom: 1px solid white">忘记密码></a>';
                                        var mess_url = "密码错误次数过多，请使用";
                                        $("#log_password_error_message").css("color","red");
                                        $("#log_password_error_message").html(mess_url+ss);
                                        $("#log_password_error_message").removeAttr("class");
                                        $("#log_password_error_message").addClass("wrong");
                                        $("#log_password_error_message").addClass("h_reg_tips");
                                        $("#log_password_error_message").css('display', 'block');
                                       // setStyle(mess_url, 2, msg);
									   $("#checkcode_div").hide();
                                    }
                                    numError=0;
                                    //$.cookie(user_error_num_key, error_password_num);
									return;
                                }
                            }
                        }
                    });
                }
            }
		
        if ($(this).is('#username')) {
            var msg = 'log_username_error_message';
            username = this.value;
            if (this.value == "") {
                setStyle('请输入用户名', 2, msg);
                return;
            } else if (!email_patt.test(this.value) && !phone_patt.test(this.value) && !id_patt.test(this.value)) {
                setStyle('用户名格式错误', 2, msg);
                return;
            } else {           
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: '/index.php/Ajaxdata/is_exist_user',
                    data: "username=" + this.value,
                    success: function (result) {
                        if (result.code == "0") {
                            userinfo = result.data;
                            setStyle(result.message, 2, msg);
                        } 
                        // 邮箱用户未设置密码
                        else if (result.code == "-123" || result.code == "-124") {
                            var ss='<a href="/index.php/User/set_password?username=' + username + '&type=1" style="color: green;border-bottom: 1px solid white">设置密码></a>';
                            var mess_url = "您未设置密码，请先 ";
                            $("#log_username_error_message").css("color","red");
                            $("#log_username_error_message").html(mess_url+ss);
                            $("#log_username_error_message").removeAttr("class");
                            $("#log_username_error_message").addClass("wrong");
                            $("#log_username_error_message").addClass("h_reg_tips");
                            $("#log_username_error_message").css('display', 'block');
                            // setStyle(mess_url, 2, msg);
                            $("#checkcode_div").hide();
                        }
                        //游客ID未绑定密码的
                        else if (result.code == "-122") {
                            var mess_url = "安卓端游客请回安卓端绑定邮箱或手机";
                            $("#log_username_error_message").css("color","red");
                            $("#log_username_error_message").html(mess_url);
                            $("#log_username_error_message").removeAttr("class");
                            $("#log_username_error_message").addClass("wrong");
                            $("#log_username_error_message").addClass("h_reg_tips");
                            $("#log_username_error_message").css('display', 'block');
                            // setStyle(mess_url, 2, msg);
                            $("#checkcode_div").hide();
                        }
						// -102  存在 。登陆
						else {
                            setStyle("", 0, msg);
                        }
                    }
                });
            }
        }

	
			//验证码
            if ($(this).is('#login_verify_code')) {
                if(is_judge_verify_code == 1){
                        return;
                    }
                if (error_password_num >3 && error_password_num < 10) {
                    
                    var msg = 'log_checkcode_error_messages';
                    var code = this.value;
                    var checkcode = new RegExp(/[0-9]{4}$/);
                    if (this.value == "") {
                        setStyle('请输入验证码', 2, msg);
                        return;
                    }else if (!checkcode.test(this.value)) {
                        setStyle('验证码为四位数字', 2, msg);
                        return;
                    }
                    else{
                                $.ajax({
                                    type: "POST",
                                    dataType: "json",
                                    url: '/index.php/Ajaxdata/check_verify',
                                    data: "code=" + code,
                                    async:false,
                                    success: function (result) {
                                        if(result.code=='0'){
                                            setStyle('验证码正确', 1, msg);
                                            is_judge_verify_code = 1;
                                        }
                                        else{
                                            setStyle('验证码错误', 2, msg);
                                        }
                                    }
                            });
                        }
                }
                else{
                    return;
                }
            }

    });

    $('#click_login').click(function () {
        $('#form_login :input').trigger('blur');

         numError = $('#form_login .wrong').length;
		
		//alert(numError);
        if (numError) {
            return false;
        }
//        var real_password = $.md5(password);
//        if (real_password) {
//            $("#login_real_password").val(real_password);
//        }
        $("#form_login").trigger("submit");

    });
});

// 移除错误状态

function removeWrong() {
    $("#log_username_error_message").removeClass("h_reg_tips");
    $("#log_password_error_message").removeClass("h_reg_tips");
    $("#log_checkcode_error_messages").removeClass("h_reg_tips");
	
}

//表单提示
function setStyle(msg, result, id) {

    $("#" + id).css("color","red");
    if (result != 0 && result !=1) {
        $("#" + id).text(msg);
        // $("#" + id + "error_message").append(msg);
        $("#" + id).removeAttr("class");
        $("#" + id).addClass("wrong");
        $("#" + id).addClass("h_reg_tips");

        $("#" + id).css('display', 'block');
    }
    else if(result==1){

        $("#" + id).text(msg);
        // $("#" + id + "error_message").append(msg);
        $("#" + id).removeAttr("class");
        $("#" + id).removeClass("wrong");
        $("#" + id).addClass("h_reg_tips");
        $("#" + id).css("color","green");
        $("#" + id).css('display', 'block');
    }
    else {
        $("#" + id).removeAttr("class");
        $("#" + id).css('display', 'none');
    }
}

