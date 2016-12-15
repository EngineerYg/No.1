/**
 * Created by zhuzhipeng on 2015/8/24.
 */
$(function () {
    $("#reg_username_error_message").css('display', 'none');
    $("#reg_password_error_message").css('display', 'none');
    $("#reg_repeat_password_error_message").css('display', 'none');
    $("#reg_verify_code_message").css('display', 'none');

    var email_patt = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
    var password_patt = new RegExp(/[A-Za-z0-9_!@#$%^&*()+\S]{6,20}$/);
    var code_patt = new RegExp(/^.{4,4}$/);
    var phone_patt = new RegExp(/^(130|131|132|133|134|135|136|137|138|139|150|151|152|153|154|155|156|157|158|159|170|176|180|177|178|181|182|183|184|185|186|187|188|189)[0-9]{8}$/);
    // 验证码生成
  var captcha_img = $('#reg_checkcode_div').find('img');
  var verifyimg = captcha_img.attr("src");
  captcha_img.attr('title', '点击刷新');
  captcha_img.click(function(){
     changeCode();
     
  });
    var username;
    var password;
    var pic_ver_code;
    var todo;
    var i = 0;
    var priority = 0;
    var ram=Math.ceil(Math.random()*10000);	//验证码
    $('#form_reg :input').focus(function () {
        if ($(this).is('#username')) {
            $("#reg_username_error_message").html("");
            $("#reg_username_error_message").removeClass("wrong");
        }
        if ($(this).is('#password')) {
            $("#reg_password_error_message").html("");
            $("#reg_password_error_message").removeClass("wrong");
        }
        if ($(this).is('#repeat_password')) {
            $("#reg_repeat_password_error_message").html("");
            $("#reg_repeat_password_error_message").removeClass("wrong");
        }
        if ($(this).is('#verifycode')) {
            $("#reg_verify_code_message").html("");
            $("#reg_verify_code_message").removeClass("wrong");
        }
    });
    $('#form_reg :input').blur(function () {
        if ($(this).is('#username')) {
            //赋值username
            username = this.value;
            var msg = 'reg_username_error_message';
            if (this.value == "") {
                setStyle('请输入用户名', 2, msg);
            } else if (!email_patt.test(this.value) && !phone_patt.test(this.value)) {
                setStyle('请输入正确的邮箱或手机号', 2, msg);
            } else {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: '/index.php/Ajaxdata/is_exist_user',
                    data: "username=" + this.value,
                    success: function (result) {
                        if (result.code != "0") {
                            setStyle(result.message, 2, msg);
                            priority = 1;
                        } else {
                            setStyle("可以注册", 1, msg);
                            priority = 0;
                        }
                    }
                });
            }
        }

        if (priority > 0) {
            return;
        }

        if ($(this).is('#password')) {
            var msg = 'reg_password_error_message';
            password = this.value;
            var is_patt=verify_password(password);
            if (this.value == "") {
                setStyle('请输入密码', 2, msg);
                return;
            } else if (password.length < 6 || password.length > 16) {
                setStyle('密码长度必须在6-16位', 2, msg);
                return;
            }
            else if (!is_patt) {
                setStyle('密码中含有特殊字符', 2, msg);
                return;
            } else {
                setStyle("", 0, msg);
            }
        }
        if ($(this).is('#repeat_password')) {
            var msg = 'reg_repeat_password_error_message';

            if (this.value == "") {
                setStyle('请输入确认密码', 2, msg);
            } else if (this.value.length < 6 || this.value.length > 16) {
                setStyle('密码长度必须在6-16位', 2, msg);
            }  else if (this.value != password) {
                setStyle('两次密码输入不一致', 2, msg);
            } else if(this.value==password){
            	setStyle('密码核对正确',1,msg)
            }else {
                setStyle("", 0, msg);
            }
        }

        //图形验证码
        if ($(this).is('#reg_verify_code')) {
            pic_ver_code = this.value;
            // alert(pic_ver_code);
            var msg = 'reg_checkcode_error_messages';
            var cd = this.value;
            var code = getverifycode();
           //alert(code.toString());
            var checkcode = new RegExp(/[0-9]{4}$/);
            if (this.value == "") {
                setStyle('请输入验证码', 2, msg);
                return;
            }else if (!checkcode.test(this.value)) {
                setStyle('验证码为四位数字', 2, msg);
                return;
            }else if(this.value!=code){
					setStyle('验证码输入不正确', 2, msg);
					changeCode();
		  	}else{
					 setStyle('验证码正确', 1, msg);
					 todo=1;
			}
          
        }


      if ($(this).is('#verifycode')) {
          var msg = 'reg_verify_code_message';
		  
          if (this.value == "") {
             setStyle('请输入验证码', 2, msg);
          } else if (!code_patt.test(this.value)) {
              setStyle('验证码格式不正确', 2, msg);
             }
           if($("#verifycode").val()!=ram){
    		setStyle('动态验证码输入有误,请认真核对！', 2, msg);
    	}
//        }else {
//            $.ajax({
//                type: "POST",
//                dataType: "json",
//                url: '/index.php/Ajaxdata/verify_random_code',
//               data: "verify_code=" + this.value + "&type=1" + "&username=" + username,
//                success: function (result) {
//                    if (result.code == "0") {
//                        setStyle("", 0, msg);
//                    } else {
//                        setStyle(result.message, 2, msg);
//                    }
//                }
//            });
//       }
      }
  });

    $('#click_reg').click(function () {
//  	if($("#verifycode").val()!=ram){
//  		alert("动态验证码输入有误，请认证核对！")
//  		return false;
//  	}
        $('#form_reg :input').trigger('blur');
        var numError = $('#form_reg .wrong').length;
       // alert(numError);
        if (numError) {
            return false;
        }
//        var real_password = $.md5(password);
//        if (real_password) {
//            $("#reg_real_password").val(real_password);
//        }
        
        $("#form_reg").submit();
    });
    
    // 发送验证码
    $('#get_verify_code').click(function () {

        if (priority > 0) {
            return;
        }

        var msg = "reg_verify_code_message";

        if (username == "") {
            setStyle('请输入手机号码或邮箱', 2, msg);
        }else if (!email_patt.test(username) && !phone_patt.test(username)) {
            setStyle('请输入正确的手机号或邮箱', 2, msg);
        }else if(todo != 1){//发送手机验证码前验证图形验证码
           setStyle('图形验证码错误或没有输入', 2, msg);
        }else{
        if ($("#get_verify_code").hasClass("verify_code_true")) {
        	
             return;
         }

//          $.ajax({
//              type: "POST",
//              url: '/index.php/Ajaxdata/get_verify_code_20160513',
//              data: "type=1&username=" + username,
//              dataType: "json",
//              error: function (XMLHttpRequest, textStatus, errorThrown) {
//              },
//              success: function (result) {
//                  $("#reg_verify_code_message").removeAttr("class");
//                  $("#reg_verify_code_message").text("");
//                  if (result.code == 0) {
//                      setStyle('效验码已发送,请注意查收', 1, msg);
//                  } else {
//                      if (result.code == -110) {
//                          setStyle('验证码已发送,请稍后重试！', 2, msg);
//                          $("#" + msg).css('display', 'block');
//                      }
//                      else {
//                          setStyle('验证码发送失败，请稍后再试', 2, msg);
//                          $("#" + msg).css('display', 'block');
//                      }
//                  }
//              }
//          });
			
			
			
            //按钮倒计时 -- 限制 60 秒
            var count = 179;
            $("#get_verify_code").addClass("verify_code_true");
            $("#get_verify_code").text("180秒后重新发送");
            function CountDown() {
                $("#get_verify_code").attr("disabled", true);
                $("#get_verify_code").text(+count + "秒后重新发送");
                
                if(count==175){
                	
                	//alert(ram);
                	setStyle('效验码已发送,请注意查收', 1, msg);
                	$("#verifycode").val(ram.toString());
                }
                if (count == 0) {
                    $("#get_verify_code").text("获取验证码").removeClass("verify_code_true");
                    clearInterval(countdown);
                }
                count--;
            }

            var countdown = setInterval(CountDown, 1000);
        }
    });
});

//移除错误状态

function removeWrong() {
    $("#reg_username_error_message").removeClass("wrong");
    $("#reg_password_error_message").removeClass("wrong");
    $("#reg_repeat_password_error_message").removeClass("wrong");
    $("#reg_verify_code_message").removeClass("wrong");

}

//表单提示
function setStyle(msg, result, id) {

    $("#" + id).css("color", "red");
    if (result != 0 && result != 1) {
        $("#" + id).text(msg);
        // $("#" + id + "error_message").append(msg);
        $("#" + id).removeAttr("class");
        $("#" + id).addClass("wrong");
        $("#" + id).addClass("h_reg_tips");

        $("#" + id).css('display', 'block');
    }
    else if (result == 1) {

        $("#" + id).text(msg);
        // $("#" + id + "error_message").append(msg);
        $("#" + id).removeAttr("class");
        $("#" + id).removeClass("wrong");
        $("#" + id).addClass("h_reg_tips");
        $("#" + id).css("color", "green");
        $("#" + id).css('display', 'block');
    }
    else {
        $("#" + id).removeAttr("class");
        $("#" + id).css('display', 'none');
    }

}
//function checkDt (result) {
//                $("#reg_verify_code_message").removeAttr("class");
//                $("#reg_verify_code_message").text("");
//                if (result.code == 0) {
//                    setStyle('效验码已发送,请注意查收', 1, msg);
//                } else {
//                    if (result.code == -110) {
//                        setStyle('验证码已发送,请稍后重试！', 2, msg);
//                        $("#" + msg).css('display', 'block');
//                   }
//                    else {
//                        setStyle('验证码发送失败，请稍后再试', 2, msg);
//                        $("#" + msg).css('display', 'block');
//                    }
//                }
//}
