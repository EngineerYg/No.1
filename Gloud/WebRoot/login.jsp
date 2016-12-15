<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
out.print(basePath);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
    
    <title>格来云游戏-官网-云端超级游戏机-动视云科技</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="images/icon.png"  />
	<link rel="stylesheet" type="text/css" href="css/headerAfooter.css"/>	    
	<link rel="stylesheet" type="text/css" href="css/content.css"/>
	<link rel="stylesheet" type="text/css" href="css/login.css" />
    
    
     <script src="js/jquery-1.8.3.js"></script>
	<script src="js/hm.js"></script>
   
    <script src="js/jquery.js"></script>
    <script src="js/sw_ua.js"></script>
    <script src="js/check_ua.js"></script>
    <script src="js/store.js"></script>
    <script src="js/common.js"></script>
    <script src="js/nav.js"></script>
    <script src="js/rem_1366.js"></script>
  
     <script src="js/login.js"></script>
    <script type="text/javascript" src="js/jquery_002.js" ></script>
 <script type="text/javascript" src="js/reg.js"></script>
    <script type="text/javascript" src="js/code.js" ></script>
    
<script type="text/javascript">  
    $(function(){
    	
    	changeCode();
        getverifycode();
    	$('#set_login').on('click', function() {
		$('#set_register').removeClass('on');
		$('#set_login').addClass('on');
		$('#form_reg').hide();
		$('#form_login').show();
		$('.user_login_cont').show();
	});
	$('#set_register').on('click', function() {
		$('#set_register').addClass('on');
		$('#set_login').removeClass('on');
		$('#form_reg').show();
		$('#form_login').hide();
		$('.user_login_cont').show();
	});

	$(document).keydown(function(event) {

		if ($('#form_login').is(':hidden')) {
			if (event.keyCode == 13) {
				//alert("to");
				to();
			}
			//隐藏中
		} else {
			//可以快捷登录
			if (event.keyCode == 13) {
				//alert("go");
				go();
			}
		}
	});
	
	
});
   
    function go(){
		if(!$("#click_login").click()){
			$("#form_login").trigger("submit");
		}
	
	}
	function to(){
		if(!$("#click_reg").click()){
			$("#form_reg").trigger("submit");
		}
	}

	
</script>
  </head>
  
 <body >
		
<!--  共用遮罩 -->
<div id="DivLocker" style="display: none; position: fixed; background-color: rgb(0, 0, 0); top: 0px; left: 0px; right: 0px; opacity: 0.5; overflow: hidden; height: 100%; z-index: 10000;"></div>
<!--  共用提示窗口 -->
<!-- extra 额外增加的弹窗~~ 手机支付返回  成功还是失败-->
<div class="xw_charge_top" style="display:none;z-index:10002;" id="tip_message_div"><!--   显示窗体的具体位置-->
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_top_main">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list">   
			<p class="xw_charge_return_info" id="tip_message" style=" word-break:break-all; word-wrap:break-word"></p>
		</div>
		<div class="xw_charge_return_btn">
			<div class=" xw_charge_return_btn_div" style="display:none" onclick="close_tip_message(0)" id="tip_message_btn_name_0">
				确定 
			</div>
			<div class=" xw_charge_return_btn_div" style="display:none" onclick="close_tip_message(1)" id="tip_message_btn_name_1">
				确定 
			</div>
			
		</div>
	</div>
</div>		
	<!--
    	作者：offline
    	时间：2016-06-27
    	描述：页头
    -->	
<!--
	作者：YG
	时间：2016-06-25
	描述：头部
-->
<header class="header_card">
	<a href="index.php" title="格来云游戏" class="header_logo">格来云游戏</a>

	<div class="header_info">

		<div class="header_info_nav">
			<!-- <div style="margin-right: 100px; margin-top: 4px;"
				class="header_info_nav_list">
				<a href="/index.php/activity/activity_one_html"><img style=""
					src="http://s2.gloud.cn/web//images/activity_one_html.png" alt='activity_one_html'></a>
			</div> -->
			
			<div class="header_info_nav_list">
				<a href="help.php" title="帮助" class="info_nav">帮助</a>
			</div>
		</div>
	</div>
</header>

<!--
	作者：YG
	时间：2016-06-25
	描述：中间内容
	 //${cookie.account.value }
-->

<section class="main_card">
	<div class="user_login_card">
		<ul class="user_tab_items">
			<li class="on" id="set_login">登录</li>
			<li class="" id="set_register">注册</li>
		</ul>
		<!-- 登录 -->
		<form name="form_login" id="form_login" method="post" action="loginInto.html">
			<div class="user_login_cont" style="display: block">
						<div class="page_reg_info">
				<div class="h_reg_list">
					<p class="h_reg_list_m">
						<input class="h_reg_input_t" id="username" name="username" placeholder="邮箱号/手机号/ID" type="text">
					</p>
				</div>
				<p style="display: none;" class="h_reg_tips" id="log_username_error_message"></p>
			</div>
			<!-- 图形验证 -->
			<div class="page_reg_info" id="checkcode_div" style="display:none">
				<div class="h_reg_list w_132">
					<p class="h_reg_list_m" id="checkcode_p">
						<input class="h_reg_input_t" id="login_verify_code" name="login_verify_code" placeholder="请输入验证码" type="text">
					</p>
				</div>
				<div class="h_reg_checkcode">
					<img alt="验证码" src="images/code/code1.png" title="点击刷新" height="100%" width="100%">
				</div>
				<p class="h_reg_tips" id="log_checkcode_error_messages"></p>
			</div>
			<!-- 图形验证end -->
			<div class="page_reg_info">
				<div class="h_reg_list">
					<p class="h_reg_list_m">
						<input class="h_reg_input_t" id="password" name="password" placeholder="请输入密码" type="password">
					
					</p>
				</div>
				<p style="display: block;" class="h_reg_tips" id="log_password_error_message">
				<%=session.getAttribute("error")==null?"":session.getAttribute("error") %>
				</p>
				
			</div>
			<p class="h_reg_xy">
				<span class="fl"> <input name="rememberme" checked="checked" type="checkbox"> 自动登录
				</span> <span class="fr"><a href="forGetPwd.jsp" title="忘记密码">忘记密码？</a></span>
			</p>
			<input value="1" name="dosubmit" type="hidden"> <input id="login_real_password" value="" name="login_real_password" type="hidden">
			 <a href="#" class="h_login_btn" title="登录" id="click_login" >登录</a>
	</div>
	</form>

	<!-- 注册 -->
	<form name="form_reg" id="form_reg" method="post" action="reg.html">
		<div class="user_login_cont" style="display: none">
		<div class="page_reg_info">
			<div class="h_reg_list">
				<p class="h_reg_list_m">
					<input class="h_reg_input_t" id="username" name="username" placeholder="邮箱号/手机号" type="text">
				</p>
			</div>
			<p style="display: none;" class="h_reg_tips" id="reg_username_error_message">
			<%=session.getAttribute("error")==null?"":session.getAttribute("error") %>
			</p>
			<%
   					//删除session对象
   					session.removeAttribute("error");
   			%>
		</div>
		<!-- 图形验证码 -->
		<div class="page_reg_info" id="reg_checkcode_div">
			<div class="h_reg_list w_132">
				<p class="h_reg_list_m" id="checkcode_p">
					<input class="h_reg_input_t" id="reg_verify_code" name="reg_verify_code" placeholder="请输入验证码" type="text">
				</p>
			</div>
			<div id="yzm" class="h_reg_checkcode">
				<img alt="验证码" src="" title="点击刷新" height="100%" width="100%" onclick="javascript:changeCode()">
			</div>
			<p class="h_reg_tips" id="reg_checkcode_error_messages"></p>
		</div>
		<!-- 图形验证码end -->
		<!--
        	作者：YG
        	时间：2016-06-29
        	描述：发送验证码
        -->
		<div class="page_reg_info">
			<div class="h_reg_list w_132">
				<p class="h_reg_list_m">
					<input class="h_reg_input_t" id="verifycode" name="verify_code" placeholder="验证码" type="text">
				</p>
			</div>
			<a href="javascript:void(0);"  title="发送验证码" id="get_verify_code" class="h_reg_code">发送验证码</a>

			<p style="display: none;" class="h_reg_tips" id="reg_verify_code_message"></p>
		</div>
		<div class="page_reg_info">
			<div class="h_reg_list">
				<p class="h_reg_list_m">
					<input class="h_reg_input_t" name="password" id="password" placeholder="请输入密码" type="password">
				</p>
			</div>
			<p style="display: none;" class="h_reg_tips" id="reg_password_error_message"></p>
		</div>
		<div class="page_reg_info">
			<div class="h_reg_list">
				<p class="h_reg_list_m">
					<input class="h_reg_input_t" name="repeat_password" id="repeat_password" placeholder="重复密码" type="password">
				</p>
			</div>
			<p style="display: none;" class="h_reg_tips" id="reg_repeat_password_error_message"></p>
		</div>
		<input value="1" name="dosubmit" type="hidden"> <input id="reg_real_password" value="" name="reg_real_password" type="hidden"> 
		<a href="#"  class="h_reg_btn" id="click_reg" title="注册">注册</a>

		<p class="h_reg_xy">
			<input checked="checked" type="checkbox"> 同意<a href="###" target="_blank">《用户协议》</a>
		</p>
		</div>
	</form>

	</div>
</section>

<!-- 页尾 -->
	<div id="footer_tips" style="display:none;z-index:10000;position:absolute; font-size:0.12rem;background: rgba(0, 0, 0, 0.8) none repeat scroll 0 0; color:#fff">
		<span id="footer_tips_span" class="" style="margin-left:0.2rem;margin-right:0.2rem;margin-top:0.2rem;line-height:40px;"></span></div>

<footer class="footer_card">

    <!-- 设置 -->
        
    <!-- 底部信息 -->
    <div class="footer_info clearfix">
        <!-- 外链 -->
        <ul class="footer_icoarea">
            <li><a href="###" title="首页" class="f_ico f_1 " target="_blank">首页</a></li>
            <li><a href="###" title="官方论坛" class="f_ico f_2" target="_blank">官方论坛</a></li>
            <li>
                <a href="###" title="百度贴吧" class="f_ico f_4" target="_blank">百度贴吧</a></li>
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
		}
	}
    $('.layer_btn_x').on('mouseover',function(){
    	$(this).attr('src','http://s2.gloud.cn/web/images/close_focus.png');
    });
    $('.layer_btn_x').on('mouseout',function(){
    	$(this).attr('src','http://s2.gloud.cn/web/images/close.png');
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
