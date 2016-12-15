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
    <link rel="shortcut icon" href="images/icon.png"  />
    <title>格来云游戏-官网-云端超级游戏机-动视云科技</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 
          
          <link rel="stylesheet" type="text/css" href="css/style.css" />
          <link rel="stylesheet" type="text/css" href="css/headerAfooter.css"/>
	<link rel="stylesheet" type="text/css" href="css/content.css"/>
	<link rel="stylesheet" type="text/css" href="css/lunbo.css" />
	<link rel="stylesheet" type="text/css" href="css/layer.css" />
	<link rel="stylesheet" href="css/xq.css" />
	
	
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
    <script type="text/javascript" src="js/game.js" ></script>   

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


<section class="main_card">
    <!-- 游戏列表 -->
    <div class="main_info">
        <!-- 游戏列表 导航区 -->
            <!-- 游戏列表 导航区 -->
    <div class="main_pics_nav fixed">
        <div class="w_fixed_nav">
            <div class="main_pics_nav_items">
                <a href="index.php" title="首页" class="img_link"></a>
                <g:if test="${type=='全部游戏' }" var ="q">
                	  <a href="search.php?name=全部游戏" title="全部游戏" class="on">全部游戏</a>
                </g:if>
                 <g:if test="${not q }">
                	<a href="search.php?name=全部游戏" title="全部游戏" class="">全部游戏</a>
                </g:if> 
              	<g:if test="${type=='冒险解谜' }" var ="m">
                	  <a href="search.php?name=冒险解谜" title="冒险解谜" class="on">冒险解谜</a>
                </g:if>
                 <g:if test="${not m }">
                	<a href="search.php?name=冒险解谜" title="冒险解谜" class="">冒险解谜</a>
                </g:if>
           		<g:if test="${type=='动作格斗' }" var = "d">
                	  <a href="search.php?name=动作格斗" title="动作格斗" class="on">动作格斗</a>
                </g:if> 
              	 <g:if test="${not d }">
                	<a href="search.php?name=动作格斗" title="动作格斗" class="">动作格斗</a>
                </g:if>
               <g:if test="${type=='体育竞速'}" var ="t">
                	  <a href="search.php?name=体育竞速" title="体育竞速" class="on">体育竞速</a>
                </g:if>  
               	<g:if test="${not t }">
                	<a href="search.php?name=体育竞速" title="体育竞速" class="">体育竞速</a>
                </g:if>
                <g:if test="${type=='飞行射击' }" var ="f">
                	  <a href="search.php?name=飞行射击" title="飞行射击" class="on">飞行射击</a>
                </g:if>     
                <g:if test="${not f }">
                	<a href="search.php?name=飞行射击" title="飞行射击" class="">飞行射击</a>
                </g:if>
                
                
                
                
        	</div>
        	<div class="main_pics_nav_search">
    			<form action="SoS.php" id="search_game_form" method="post">
       				<input class="input_search" placeholder="搜索游戏" autocomplete="off" id="search_game" name="search_game" type="text">
       				<input class="input_search_btn" value="" id="search_game_button" type="button">
    			</form>
			</div>
<a href="javascript:void(0)" target="_blank" title="" class="main_pics_app_link">想要更多游戏？去安卓版看看&gt;</a>
			<div class="main_pics_nav_r">
			            <g:if test="${type=='我的游戏' }" var ="MyGame">
			            		<a href="myGame.php" class="on" title="我的游戏">我的游戏</a>
			            </g:if>
			            <g:if test="${not MyGame }">
			            		<a href="myGame.php"  title="我的游戏">我的游戏</a>
			            </g:if>
			            <a href="historyGame.php" title="历史游戏">历史游戏</a></div>
			</div>
</div>
        <!-- 游戏列表 -->
       <g:if test="${session.getAttribute('kong')== null }">
       		<div  style="width:500px;margin:0px auto; line-height:200px;  font-size:24px; color:#888888; text-algin:center; ">
       				<%=session.getAttribute("kong")==null?"":session.getAttribute("kong")%>
       		</div>
       		<% session.removeAttribute("kong"); %>
       </g:if>
        <ul class="game_pics" id="j_game_list">
           <g:forEach items="${list }" var ="game">
           		 <a href="GameInfo.php?id=${game.gameid }">
               <g:set var="i" value="${game.gameid}"></g:set>
               
               		<li class="" title="${game.title }">
              
            
                   <img src="${game.gameDP }" alt="${game.gamename }" class="game_pics_img">
                      <div class="game_pics_info">
                           <span>快进来啊小帅哥</span>
                      </div>
                       <div class="game_pics_cover" style="display:">
                                <h3>${game.gamename }</h3>

                                <p>${game.title }</p>
                                <span>可购买</span>
                       </div>
              	</li>
            </a> 
           </g:forEach>                                    
         </ul>
    </div>
</section>
<!-- 页尾 -->
<!--选区测速浮层-->
<link rel="stylesheet" type="text/css" href="css/layer.css">
    <link rel="stylesheet" type="text/css" href="js/jquery.css">

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
