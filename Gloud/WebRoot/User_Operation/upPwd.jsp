<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="g" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>格来云游戏-官网-云端超级游戏机-动视云科技</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
        <link rel="shortcut icon" href="images/icon.png"  />
	<link rel="stylesheet" type="text/css" href="css/headerAfooter.css"/>	    
	<link rel="stylesheet" type="text/css" href="css/content.css"/>
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" href="css/layer.css" />
	<link rel="stylesheet" href="css/login.css" />
	 <script src="js/jquery-1.8.3.js"></script>
	<script src="js/hm.js"></script>
   
    <script src="js/jquery.js"></script>
    <script src="js/sw_ua.js"></script>
    <script src="js/check_ua.js"></script>
    <script src="js/store.js"></script>
    <script src="js/common.js"></script>
    <script src="js/nav.js"></script>
    <script src="js/rem_1366.js"></script>
   
     <script type="text/javascript" src="js/login.js" ></script>
    <script type="text/javascript" src="js/jquery_002.js" ></script>
    <script type="text/javascript" src="js/reg.js" ></script>
    <script type="text/javascript" src="js/footer.js" ></script>
    
  <script type="text/javascript">
  $(function(){
	  $(document).keydown(function(event) {

			if ($('#form_find').is(':hidden')) {
				//隐藏中
			} else {
				//可以快捷登录
				if (event.keyCode == 13) {
					go();
				}
			}
		}); 
  });
  function go(){
		if(!$("#click_find").click()){
			$("#form_find").trigger("submit");
		}
	
	}
  </script>  
  </head>
  
  <body>
   <header class="header_card">
    <a href="index.php" title="格来云游戏" class="header_logo">格来云游戏</a>
<g:if test="${!empty user }" var="u">
    <div class="header_info">
        <div class="header_info_login">
            <div class="h_ico_nav">
                
                    <a href="#" title="开通">
                        <span class="h_novip_ico h_ico_1"></span>
                        开通
                    </a>
            </div>
            <div class="h_ico_nav">
                <span class="h_ico h_ico_2"></span>
                0                <a href="#" title="充值">-充值</a>
            </div>
            <div class="h_ico_nav">
                <a href="help.php" title="帮助">
                    <span class="h_ico h_ico_3"></span>
                    帮助
                </a>
            </div>
            <div class="h_ico_nav">
                <a href="#" target="_blank" title="站内信">
          <span class="h_ico" style="width:25px;height:20px;background:url(images/msg_index.png) no-repeat;background-position: 0 -20px"></span>                </a>
            </div>
            <div class="h_tx_nav" id="j_logout">
                <a href="#" title="" style="position:relative;">
                    <img style="vertical-align: baseline;" src="${user.photo }" alt="头像" class="h_tx">
                                        <!-- 注册弹出层 -->
                    </a><div class="h_user_card" style="display:none;z-index:10000;width:135px" id="j_logout_f"><a href="#" title="" style="position:relative;">
                        </a><ul class="h_user_card_list">
                        <a href="#" title="" style="position:relative;">
                            </a><li><a href="#" title="" style="position:relative;">
                                </a><a href="#" title="">账号中心</a>
                            </li>
                            <li>
                                <a href="#" title="">修改密码</a>
                            </li>
                            <li>
                                <a href="#" title="">用兑换码</a>
                            </li>
                            <li>
                                <a href="#" title="">账单记录</a>
                            </li>
                            <li>
                                <a href="out.do" title="">退出账号</a>
                            </li>
                        </ul>
                    </div>
                
                <div style="display:inline-block;height:55px">
                    <p style="color:#888;line-height:15px;padding:10px 0 0 5px;">${user.lvId }级</p>
                    <p style="color:#888;padding:5px;line-height:15px">${user.name }</p>
                </div>

            </div>
        </div>
    </div>
</g:if>	
<g:if test="${not u }">
 <div class="header_info">

		<div class="header_info_nav">
			<!-- <div style="margin-right: 100px; margin-top: 4px;"
				class="header_info_nav_list">
				<a href="#"><img style=""
					src="http://s2.gloud.cn/web//images/activity_one_html.png" alt='activity_one_html'></a>
			</div> -->
			<div class="header_info_nav_list">
				<a href="User_Operation/login.jsp" title="登录" class="info_nav" id="j_login">登录</a>
				<!-- 登录弹出层 -->	
			</div>
			<div class="header_info_nav_list">
				<a href="User_Operation/login.jsp" title="注册" class="info_nav" id="j_regist">注册</a>
				<!-- 注册弹出层 -->	
			</div>
			<div class="header_info_nav_list">
				<a href="help.php" title="帮助" class="info_nav">帮助</a>
			</div>
		</div>
	</div>
</g:if>
</header>   

<section class="main_card" style="margin-top:30px;">
	<!-- 面包屑 -->
    <div class="bread_nav">
        <a href="index.jsp" title="首页">首页</a> - <a href="" title="修改密码">修改密码</a>
    </div>
	<div class="user_login_card">
		<ul class="user_tab_forget  ">
			<li class="on">修改密码</li>
		</ul>
		<!-- 忘记密码 -->
		<form name="form_find" id="form_find" method="post" action="up.php">
			<div class="user_login_cont" style="display: block">
				<div class="page_reg_info">
					<div class="h_reg_list">
						<p class="h_reg_list_m">
							<input class="h_reg_input_t" name="old_password" id="old_password" placeholder="请输入原密码" type="password">
						</p>
						<p class="wrong h_reg_tips" style="display: block; color: red;" id="old_password_password_error_message">
						<%=session.getAttribute("error_pwd")==null?"":session.getAttribute("error_pwd") %>
						</p>
						<%
					
		   					//删除session对象
		   					session.removeAttribute("error_pwd");
   						%>
					</div>
				</div>
				<div class="page_reg_info">
					<div class="h_reg_list">
						<p class="h_reg_list_m">
							<input class="h_reg_input_t" name="password" id="password" placeholder="请输入新密码" type="password">
						</p>
						<p style="display: none;" class="h_reg_tips" id="password_password_error_message"></p>
					</div>

				</div>
				<div class="page_reg_info">
					<div class="h_reg_list">
						<p class="h_reg_list_m">
							<input class="h_reg_input_t" name="repeat_password" id="repeat_password" placeholder="重复密码" type="password">
						</p>
						<p style="display: none;" class="h_reg_tips" id="password_repeat_password_error_message"></p>
					</div>
					<input id="reg_real_password" value="" name="reg_real_password" type="hidden">
				</div>
				<a href="#" class="h_reg_btn"  id="click_find" title="确认">确认</a>
			</div>
		</form>
	</div>

</section>

<script type="text/javascript">
	/**
 * Created by YG on 2016/06/30.
 */
$(function () {
   // $("#old_password_password_error_message").css('display', 'none');
    $("#password_password_error_message").css('display', 'none');
    $("#password_repeat_password_error_message").css('display', 'none');
    var password_patt = new RegExp(/[A-Za-z0-9_!@#$%^&*()+\S]{6,20}$/);
    var password;
    var old_password;
    var username = "333442";
	$('#form_find :input').focus(function () {
		if ($(this).is('#old_password')) {
			$("#old_password_password_error_message").html("");
			$("#old_password_password_error_message").removeClass("wrong");
			$("#password_password_error_message").html("");
			$("#password_password_error_message").removeClass("wrong");
			$("#password_repeat_password_error_message").html("");
			$("#password_repeat_password_error_message").removeClass("wrong");
		 }
		 if ($(this).is('#password')) {
			 $("#old_password_password_error_message").html("");
				$("#old_password_password_error_message").removeClass("wrong");
				$("#password_password_error_message").html("");
				$("#password_password_error_message").removeClass("wrong");
				$("#password_repeat_password_error_message").html("");
				$("#password_repeat_password_error_message").removeClass("wrong");
		 }
		 if ($(this).is('#repeat_password')) {
			 $("#old_password_password_error_message").html("");
				$("#old_password_password_error_message").removeClass("wrong");
				$("#password_password_error_message").html("");
				$("#password_password_error_message").removeClass("wrong");
				$("#password_repeat_password_error_message").html("");
				$("#password_repeat_password_error_message").removeClass("wrong");
		 }
	});
	
    $('#form_find :input').blur(function () {
            if ($(this).is('#old_password')) {
                var msg = 'old_password_password_error_message';
                old_password = this.value;
                if (this.value == "") {
                    setStyle('请输入原密码', 2, msg);
                    return;
                } else if (old_password.length<6 || old_password.length>16) {
                    setStyle('密码长度必须在6-20位', 2, msg);
                } else if (!password_patt.test(this.value)) {
                    setStyle('密码为6到20位数字或英文组合', 2, msg);
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: '/index.php/Ajaxdata/is_password',
                        data: "username=" + username + "&password=" + $.md5(old_password),
						async:false,
                        success: function (result) {
                            if (result.code == "0") {
                                setStyle("", 0, msg);
                            } else {
                                setStyle("密码不正确", 2, msg);
                            }
                        }
                    });
                }
            }		
        if ($(this).is('#password')) {
            var msg = 'password_password_error_message';
            password = this.value;
            var is_patt=verify_password(password);
            if (password == "") {
                setStyle('请输入新密码', 2, msg);
				return;
            } else if (password.length<6 || password.length>16) {
                setStyle('密码长度必须在6-16位', 2, msg);
                return;
            }
            else if (!is_patt) {
                setStyle('密码中含有特殊字符', 2, msg);
                return;
            } else if (password == old_password) {
                setStyle('新密码不能是原密码', 2, msg);
				return;
            } else {
                setStyle("", 0, msg);
            }
        }
        if ($(this).is('#repeat_password')) {
            var msg = 'password_repeat_password_error_message';

            if (this.value == "") {
                setStyle('请输入确认密码', 2, msg);
				return;
            } else if (this.value != password) {
                setStyle('两次密码输入不一致', 2, msg);
				return;
            } else {
                setStyle("", 0, msg);
            }
        }
        $('#click_find').click(function () {
	        $('#form_find :input').trigger('blur');
	        var numError = $('#form_find .wrong').length;
	        if (numError) {
	            return false;
	        }
//	        var real_password=$.md5(password);
//	        if(real_password)
//	        {
//	            $("#reg_real_password").val(real_password);
//	        }
	        $("#form_find").submit();
	    });
    });
});
//移除错误状态

function removeWrong() {
    $("#password_password_error_message").removeClass("wrong");
    $("#password_repeat_password_error_message").removeClass("wrong");
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
        $("#" + id).addClass("wrong");
		$("#" + id).addClass("h_reg_tips");
		$("#" + id).css("color","green");
        $("#" + id).css('display', 'block');
	}
    else {
        $("#" + id).removeAttr("class");
        $("#" + id).css('display', 'none');
    }

}
</script>

<!-- 页尾 -->
	<div id="footer_tips" style="display:none;z-index:10000;position:absolute; font-size:12px;background: rgba(0, 0, 0, 0.8) none repeat scroll 0 0; color:#fff">
		<span id="footer_tips_span" class="" style="margin-left:20px;margin-right:20px;margin-top:20px;line-height:40px;"></span></div>

<footer class="footer_card">

    <!-- 设置 -->
        
    <!-- 底部信息 -->
    <div class="footer_info clearfix">
        <!-- 外链 -->
        <ul class="footer_icoarea">
            <li><a href="#" title="首页" class="f_ico f_1 " target="_blank">首页</a></li>
            <li><a href="#" title="官方论坛" class="f_ico f_2" target="_blank">官方论坛</a></li>
            <li>
                <a href="#" title="百度贴吧" class="f_ico f_4" target="_blank">百度贴吧</a></li>
            <li>
                <a href="#" title="QQ" class="f_ico f_3" id="j_qq">QQ</a>
                <ul class="f_ico_qq" style="display:none" id="j_qq_f">
                    <li style="float:none;display:block">1群 276959983</li>
                    <li style="float:none;display:block">2群 50406148</li>
                    <li style="float:none;display:block">3群 83151838</li>
                    <li style="float:none;display:block">4群 365411154</li>
                    <li style="float:none;display:block">5群 110493718</li>
                    <li style="float:none;display:block">6群 420268116</li>       
                </ul>
            </li>
            <li>
                <a href="#" title="微信公众号" class="f_ico f_6 " id="j_wx">微信公众号</a>

                <div class="f_ico_wx" style="display: none" id="j_wx_f"><img src="images/wx_code.jpg" alt="微信关注我们"></div>
            </li>
            <li><a href="###" title="官方淘宝店" class="f_ico f_7" target="_blank">官方淘宝店</a></li>
            <li><a href="###" title="官方微博" class="f_ico f_5" target="_blank">官方微博</a></li>
        </ul>
        <!-- 底部导航 -->
        <div class="footer_nav">
            <a href="###" title="新闻资讯" target="_blank">新闻资讯</a>
            <a href="###" title="关于我们" target="_blank">关于我们</a>
            <a href="###" title="加入我们" target="_blank">加入我们</a>
            <a href="###" target="_blank" title="用户协议">用户协议</a>
            <a href="###" title="用户协议" id="user_agreement_arr">&gt;</a>
        </div>
        <div class="xw_user_agreement" id="user_agreement">
            © 2015-2016 gloud.cn 动视云（北京）科技有限公司版权所有<br></br><br></br><br></br>ICP证：黔ICP备14000582号-1 网络文化经营许可证：黔网文许字[2014]1248-005号<br></br><br></br><br></br>抵制不良游戏，
            拒绝盗版游戏，注意自我保护，谨防受骗上当，<br></br><br></br><br></br>适度游戏益脑，沉迷游戏伤身，合理安排时间 ，享受健康生活<br></br><br></br><br></br>
        </div>
    </div>
</footer>
<!--  控制用户协议的显示 -->
<script>
    $("#user_agreement_arr").mouseover(function () {
        $("#user_agreement").css("display", "block");
    });
    $("#user_agreement_arr").mouseout(function () {
        $("#user_agreement").css("display", "none");
    });
    //全局遮罩
    $('#DivLocker').css({
        "position": "fixed",
        "background-color": "#000",
        "top":0,
        "buttom":0,
        "left":0 ,
        "right":0,
        "filter": "alpha(opacity=30)",
        "opacity": "0.5",
        "overflow": "hidden",
        "height":"100%",
        "z-index": "10000"
    });
    //msg 中间显示的内容，btn ，按钮名字
    function write_tip_message(msg ,info){
    	$('#DivLocker').hide();
    	$('#tip_message_div').show();
    	$('#tip_message').html(msg);
    	$('#DivLocker').show();
    	var param = arguments[1] ? arguments[1] : 0;
    	
    	$('#tip_message_btn_name_'+param).show();
    	// $('#j_open_time_f').show();
    }
    function close_tip_message(info){
    	
    	$('#tip_message_btn_name_'+info).hide();
    	$('#tip_message_div').hide();
    	$('#DivLocker').hide();
    	if(info == 1){
    		location.reload();
    	}
    }
    //统一  弹出层  关闭按钮  关闭
	function close_all_layer(id,info){
		$('#'+id).hide();
		$('#DivLocker').hide();
		
		var param = arguments[1] ? arguments[1] : 0;
		if(param == 0){
			location.reload();
		};
	};
    $('.layer_btn_x').on('mouseover',function(){
    	$(this).attr('src','http://s2.gloud.cn/web/images/close_focus.png');
    });
    $('.layer_btn_x').on('mouseout',function(){
    	$(this).attr('src','images/close.png');
    });
    //鼠标划过底部鼠标，选择服务器文字提示  点击切换操作方式，点击切换选择服务器
    $('#j_inputdevice').on('mouseover', function(){
		var top = $('#j_inputdevice').offset().top-50;
		var left = $('#j_inputdevice').offset().left;
		$("#footer_tips").show();
		$("#footer_tips_span").empty();
		$("#footer_tips").css({"top":top,"left":left});
		$("#footer_tips_span").append('点击切换操作方式');
    });
    $('#j_inputdevice').on('mouseout', function(){
		$("#footer_tips").hide();
    });
    $('#j_region').on('mouseover', function(){
		var top = $('#j_region').offset().top-50;
		var left = $('#j_region').offset().left;
		$("#footer_tips").show();
		$("#footer_tips_span").empty();
		$("#footer_tips").css({"top":top,"left":left});
		$("#footer_tips_span").append('点击切换选择服务器');
    });
    $('#j_region').on('mouseout', function(){
		$("#footer_tips").hide();
    });
    
</script>  
  </body>
</html>
