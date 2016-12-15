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
    <script type="text/javascript" src="js/index.js" ></script>
<style type="text/css">
	html{
		line-height: 19.6px;
	}
</style>


<script type="text/javascript">
	function message_close() {
        $('#footer_message').css('display', 'none');
    }
	
</script>

  </head>
  
  <body>
    <!--  共用遮罩 -->
<div id="DivLocker" style="position: fixed; background-color: rgb(0, 0, 0); top: 0px; left: 0px; right: 0px; opacity: 0.5; overflow: hidden; height: 100%; z-index: 10000; display: none;"></div>
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
<!-- 页头 -->


<script>
	$(document).keydown(function(event) {

		if ($('#j_login_f').is(':hidden')) {
			//隐藏中
		} else {
			//可以快捷登录
			if (event.keyCode == 13) {
				$("#click_login").click();
			}
		}
	});
</script>

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
                                <a href="User_Operation/upPwd.jsp" title="">修改密码</a>
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
  

 
 
   <!-- 内容 -->
<section class="main_card" style="margin-top:15px;">
    <!-- 内容 左侧 -->
    <!-- 内容 左侧 -->
<div class="main_info_card">
	<!-- 内容 焦点图 -->
	<div class="main_l_jdt">
		<p class="game_arr pre_ico j_slide_pre" style="margin-top:7px;"></p>
		<p class="game_arr next_ico j_slide_next" style="margin-top:7px;"></p>
		<ul style="width:1000px; left: -432px; transition: all 1s ease 0s;" id="j_slide">
			
			<li class="main_jdt"><a href="#" target="_blank"><img src="gameImages/lb1.png" alt="蝙蝠侠：阿卡姆之城"> </a></li>
			<li class="main_jdt"><a href="#" target="_blank"><img src="gameImages/lb2.png" alt="格来云游戏新年巨献-刺客信条：大革命"> </a></li>		
			
			<li class="main_jdt"><a href="#" target="_blank"><img src="gameImages/lb1.png" alt="蝙蝠侠：阿卡姆之城"> </a></li>
			<li class="main_jdt"><a href="#" target="_blank"><img src="gameImages/lb2.png" alt="格来云游戏新年巨献-刺客信条：大革命"> </a></li>		</ul>
		<!-- <div class="main_jdt"><img src="images/jdt.png" alt="" /></div> -->
		<div class="main_jdt_num" id="j_slide_btn">
			<span class="">1</span>  <span class="on">2</span>		</div>
	</div>
	<ul class="main_l_pics" id="j_game_Img">
		<li><a href="#" target="_blank"><img src="gameImages/b_1.png" alt="游戏名称" class="pics_img">
				<p style="display: none">安卓客户端下载</p></a></li>

		<li class="no_r"><a href="#"> <img src="gameImages/new_b_2.png" alt="游戏名称" class="pics_img">
				<p style="display: none;">SVIP 海量专享特权</p>
		</a></li>

		<li><a href="#" target="_blank"><img src="gameImages/b_3.png" alt="游戏名称" class="pics_img">
				<p style="display: none">了解格来云游戏网页版</p></a></li>

		<li class="no_r"><a href="#"><img src="gameImages/b_4.png" alt="游戏名称" class="pics_img">
				<p style="display: none;">G币 购买游戏时间</p> </a></li>

	</ul>
</div>

    <!-- 游戏列表 右侧 -->
    <div class="main_info">
        <!-- 游戏列表 导航区 -->
        <div class="main_pics_nav">
            <div class="main_pics_nav_items">
                <a href="index.php" title="新品热门" class="on">新品热门</a>
                <a href="search.php?name=全部游戏" title="全部游戏" class="">全部游戏</a>
                <a href="search.php?name=冒险解谜" title="冒险解谜" class="">冒险解谜</a>
                <a href="search.php?name=动作格斗" title="动作格斗" class="">动作格斗</a>
                <a href="search.php?name=体育竞速" title="体育竞速" class="">体育竞速</a>
                <a href="search.php?name=飞行射击" title="飞行射击" class="">飞行射击</a>
             </div>
       <div class="main_pics_nav_search">
    <form action="SoS.php" id="search_game_form" method="post">
        <input class="input_search" placeholder="搜索游戏" autocomplete="off" id="search_game" name="search_game" type="text">
        <input class="input_search_btn" value="" id="search_game_button" type="button">
    </form>
</div>
<div class="main_pics_nav_r">
            <a href="myGame.php" title="我的游戏">我的游戏</a>
             <a href="#" title="历史游戏">历史游戏</a></div>
</div>


        <!-- 游戏列表 -->
        <ul class="main_pics" id="j_game_list">
        	
        	<g:forEach items="${list }" var = "game">
        	<g:set var="i" value="${game.gameid}"></g:set>
        		 <a href="GameInfo.php?id=${game.gameid }" target="_blank" >
                 	<g:if test="${i%3==0 }" var="li">
                 	<li class="no_r" title="${game.title }">
                 	</g:if>  
                 	<g:if test="${not li }" >
                 	<li title="${game.title }">
                 	</g:if>  
                            <img src="${game.gameDP }" alt="${game.gamename }" class="pics_img">
                            <div class="" style="left:0px;position: absolute; top: 1px;z-index: 30;">
                            </div>
                            <div class="pics_info">
                            
                            </div>
                            <div class="pics_cover" style="display: none;">
                                <h3>${game.gamename }</h3>

                                <p>${game.title }</p>
                            </div>
                        </li>  
                 </a>
        	</g:forEach>
       
        	    

        
        
        
          </ul>
    </div>
</section>  





<div class="footer_message" id="footer_message">
            <div class="footer_message_font">
                <img src="images/tongzhi1.png" class="message_left" alt="通知">开通格来会员、超级会员，畅享海量专享特权，
                	<a href="#">点击开通&gt; </a>
                <img src="images/iconfont-guanbi.png" class="message_right" alt="关闭" onclick="message_close();">
            </div>
        </div>    <!-- 弹出层 11 欢迎来到格来云游戏 start-->

<div class="xw_top_second" style="z-index: 10001; margin-left: -250px; display: none;" id="xw_guide_first">
	<!--   显示窗体的具体位置-->
	<div class="xw_top_head">
		<!-- 弹窗的头部-->
		<div class="xw_top_head_main" style="margin-bottom: 5px;">
			<!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"> <!-- 弹窗标题--> 欢迎来到格来云游戏
			</span>
			<div class="xw_top_head_close">
				<img class="layer_btn_x" src="images/close.png" alt="close" onclick="close_all_layer('xw_guide_first',1)">
			</div>
			<!-- 弹窗头部关闭-->
		</div>
	</div>
	<!-- 弹出 中部内容 控制-->
	<div class="xw_top_4_main">
		<!--  中部内容 边距控制-->
		<div class="xw_top_main_list">
			<div class=" xw_top_11_main " style="color:#ddd;font-size:12px;">格来云游戏是一款带给用户无限惊喜的云游戏平台，可畅玩各种仅能在高端PC或游戏主机运行的大型3D游戏，无需下载,免安装，精品游戏内容低门槛体验，只要宽带给力，精美的画面、流畅的游戏体验完全不是问题。
</div>
			<div class="xw_10_div">
				<div class="xw_top_2_div_btn_div ">
					<div class=" xw_11_btn_div  xw_11_btn_top" style="cursor: pointer;" onclick="xw_guide(1)">教我如何进入云游戏</div>
					<div class=" xw_11_btn_div xw_11_btn_bottom" style="cursor: pointer;" onclick="xw_guide(0)">
						我是老玩家，以后不显示此窗口</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 弹出层 12 如何进入云游戏 ？ start-->

<div class="xw_top_second xw_12_head" style="display: none; z-index: 10001; margin-left:-310px;" id="xw_guide_second">
	<!--   显示窗体的具体位置-->
	<div class="xw_top_head">
		<!-- 弹窗的头部-->
		<div class="xw_top_head_main" style="margin-bottom: 5px;">
			<!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"> <!-- 弹窗标题--> 如何进入云游戏?
			</span>
			<div class="xw_top_head_close">
				<img class="layer_btn_x" src="images/close.png" alt="close" onclick="close_all_layer('xw_guide_second,1')">
			</div>
			<!-- 弹窗头部关闭-->
		</div>
	</div>
	<!-- 弹出 中部内容 控制-->
	<div class="xw_top_4_main">
		<!--  中部内容 边距控制-->
		<div class="xw_top_main_list" id="xw_guide_list">
			<ul class="xw_12_list">
				<li class="on" id="list_1"><a class="help_12_icon h_12_1">登录</a>
					<div class="help_12_span">登录</div></li>
				<li id="list_2"><a class="help_12_icon h_12_2">登录</a>
					<div class="help_12_span">开通VIP</div></li>
				<li id="list_3"><a class="help_12_icon h_12_3">登录</a>
					<div class="help_12_span">试玩</div></li>
				<li id="list_4"><a class="help_12_icon h_12_4">登录</a>
					<div class="help_12_span">购买游戏时间</div></li>
				<li id="list_5"><a class="help_12_icon h_12_5">登录</a>
					<div class="help_12_span">下载安装小程序</div></li>
				<li id="list_6"><a class="help_12_icon h_12_6">登录</a>
					<div class="help_12_span">选择服务器</div></li>
				<li id="list_7"><a class="help_12_icon h_12_7">登录</a>
					<div class="help_12_span">进入排队</div></li>
				<li id="list_8" class="help_12_icon_end"><a class="help_12_icon h_12_8 ">登录</a>
					<div class="help_12_span">进入游戏</div></li>
			</ul>
		</div>
		<div class="xw_12_desc" id="xw_guide_desc" style="height:80px;margin-bottom:0px;color:#ddd">
			<p>在格来云游戏安卓端注册的用户，需要选择“ 安卓端注册账户首次登录” 按钮进行登录。</p>
			<p>在格来云游戏安卓端注册的用户，需返回安卓客户端中绑定您的邮箱或手机号，再来这里进行登录。</p>
			<p>没有账号？ 快去注册一个吧！当然您也可以选择用微信登录（暂未开放）。</p>
		</div>
	</div>

</div>
<!-- 弹出层 12 如何进入云游戏 ？ end-->

<script>
//设置cookie
function setCookie(c_name,value,expiredays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie=c_name+ "=" +escape(value)+
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
}
//获取cookie
function getCookie(c_name)
{
	if (document.cookie.length>0)
	  {
	  c_start=document.cookie.indexOf(c_name + "=");
	  if (c_start!=-1)
	    { 
	    c_start=c_start + c_name.length+1 ;
	    c_end=document.cookie.indexOf(";",c_start);
	    if (c_end==-1) c_end=document.cookie.length;
	    return unescape(document.cookie.substring(c_start,c_end));
	    } 
	  }
	return "";
}
//清除cookie  
function clearCookie(name) {  
    setCookie(name, "", -1);  
}  

function xw_first_guide() {
	$('#xw_guide_first').show();
	$('#DivLocker').show();
	//鼠标经过效果
	$('#xw_guide_list ul li')
			.on(
					'mouseover',
					function() {

						$('#xw_guide_list ul li').each(function() {
							$(this).removeClass('on');
						});
						$(this).addClass('on');

						var param = parseInt($(this).attr('id').replace(
								'list_', ''));
						var info = "";
						switch (param) {
						case 1:
							info = "<p>-在格来云游戏安卓端注册的账户，如果未设定密码，需要设定密码再登录。</p><p>-在格来云游戏安卓端的游客账户，需返回安卓客户端中绑定您的邮箱或手机号，再来这里进行登录。</p><p>-没有帐号？快去<a href=\"/index.php/user/user_operation\" target=\"_blank\" style=\"text-decoration:underline;color:#25963a\">注册一个</a>吧！当然您也可以选择用微信登录（即将开放）。</p>";
							break;
						case 2:
							info = "<p>-VIP包月价格：￥6  / 600G币 </p><p>-SVIP包月价格：￥18  / 1800G币 </p>";
							break;
						case 3:
							info = "<p>-选择你喜欢的游戏，可以先进行试玩。试玩时间结束后，需要购买游戏时间才能继续进行游戏。</p>";
							break;
						case 4:
							info = "<p>-每款游戏的时间价格不同，α测试期间，只支持G币购买游戏时间。<a href=\"/index.php/pay/index\" target=\"_blank\" style=\"text-decoration:underline;color:#25963a\">充值G币</a></p>";
							break;
						case 5:
							info = "<p>-第一次开始游戏时，需要下载安装一个进入游戏的必要小程序。<a href=\"http://cdnuc.51ias.com//update/gmclatest.exe\" target=\"_blank\"  style=\"text-decoration:underline;color:#25963a\">下载</a></p>";
							break;
						case 6:
							info = "<p>-在网页中点击开始游戏或试玩后，进入选择服务器界面，您需要测速并选择最优服务器进入游戏。</p><p>测速结果8M以上推荐使用高清和720P，4M-8M之间推荐使用标清和576P，4M以下推荐使用流畅和480P，优先选择延时低的服务器。</p>";
							break;
						case 7:
							info = "<p>-如果您选择的服务器人数已满，会进入排队，α测试期间，服务器资源有限，如遇到排队，请您耐心等待。</p>";
							break;
						case 8:
							info = "<p>-经历了前面几个简单的步骤，您已经可以成功进入游戏啦，拿起你的手柄或鼠标，畅快的体验游戏吧！</p>";
							break;
						}
						$('#xw_guide_desc').html(info);
					});
	/*	$('#xw_guide_list ul li').on('mouseout',function(){
			$(this).removeClass('on');
		});
	 */
}
function xw_guide() {
	var param1 = arguments[0] ? arguments[0] : 0;
	//引导
	if (param1 == 1) {
		$('#xw_guide_second').show();
		$('#DivLocker').show();
		$('#xw_guide_first').hide();
	} else {
		$('#xw_guide_first').hide();
		$('#DivLocker').hide();
	}
	//引导~~Zzz Orz
	//document.cookie = "xw_gloud_guide=" + 1;
	setCookie('xw_gloud_guide',2,365);
}
function check_guide(){
	if (getCookie('xw_gloud_guide') == "") {
		xw_first_guide();
	}else{
		//clearCookie("xw_gloud_guide");
		 
		// document.cookie = "xw_gloud_guide=" + 3;
		// alert(getCookie('xw_gloud_guide')+'111');
	}
}
$(function() {
	check_guide();
});
</script>

<!--选区测速浮层-->



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
                    
                    <g:forEach var="Qq" items="${lq }">
                    <g:set var = "i" value="${Qq.id }"></g:set>
                     <li style="float:none;display:block; width:118px;" >${i }群 :${Qq.qq }</li>
                    </g:forEach>
                   
                
  
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
		}
	}
    $('.layer_btn_x').on('mouseover',function(){
    	$(this).attr('src','images/close_focus.png');
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
