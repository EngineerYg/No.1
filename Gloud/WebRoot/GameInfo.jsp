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
        <link rel="stylesheet" href="css/layer.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/headerAfooter.css"/>
		<link rel="stylesheet" href="css/help.css" />
		<link rel="stylesheet" href="css/content.css" />
		<link rel="stylesheet" href="css/lunbo.css" />
		<link rel="stylesheet" href="css/xq.css" />



          <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(function(){
	
	 $("#j_buy_qgamesave_close_x").click(function(){
			
		 $("#j_buy_game_storage_f").css("display","none");
	 });	

	$("#j_region").click(function(){
		$("#j_region_f").show();
	});
	$("#j_buy_game_time").click(function(){
		if($("#id").val()!=""){
			$("#j_buy_game_time_f").show();
		}else{
			location.href="OpaLogin.php?url="+window.location.pathname+window.location.search;
		}
		
	});
	$("#j_buy_gamesave").click(function(){
		if($("#id").val()!=""){
			$("#j_buy_gamesave_f").show();
		}else{
			location.href="OpaLogin.php?url="+window.location.pathname+window.location.search;
		}
	});
	$("#j_start_game").click(function(){
		if($("#id").val()!=""){
			$("#queue_list").show();
			$("#region_name").html($("#j_region").html());
			$("#j_qingxidu").html($("#j_videobitrate").html());
			$("#screen_resolution").html($("#j_screen_resolution").html());
			$("#inputdevice").html($("#j_inputdevice").html());
		}else{
			location.href="OpaLogin.php?url="+window.location.pathname+window.location.search;
		}
	});
	$("#j_buy_gamesave_close_x").click(function(){
		$("#DivLocker").hide();
  		$('#j_buy_gamesave_f').hide();
	});
	$("#j_buy_gameTime_close_x").click(function(){
		$("#DivLocker").hide();
  		$("#j_buy_game_time_f").hide();
	});
	$("#sali").click(function(){
		$("#sali").hide();
		$("#savaOP").show();
	})
	$("#region_queding").click(function(){
		//var h = $("div[id='region_id_21'][class*='on']").find($("div[Class*='xw_top_1_client_1_head']")).html();
		$("#j_region_f").hide();
		
		alert(h);
		//$("#j_region").html(h);
		$("#j_region").addClass("on");
		
	});

	 $("#j_queue_list_close_x").click(function () {
            $("#DivLocker").hide();
            $('#j_region_f').hide();
            
            $('#queue_list').hide();
            $("#open_game").hide();
		});
	 $("#j_close_gamesave_use_mode").click(function(){
		 $("#gamesave_use_mode").hide();
		 $("#sali").css("display","block");
	 });
	 $("#delete_gamesave_btn").click(function(){
		 location.href="delGameSave.php?gid="+$("#gid").val()+"&id="+$("#gameSave").val();
	 });
	$("#buy_game_storage_btn").click(function(){
		//alert($("#sid").val());
		location.href="buySave.php?sid="+$("#sid").val();
	});
});
</script>          
          
          
    <script type="text/javascript" src="js/hm.js"></script>
    
    <script type="text/javascript" src="js/jquery.md5.js"></script>
    <script type="text/javascript" src="js/sw_ua.js"></script>
    <script type="text/javascript" src="js/check_ua.js"></script>
    <script type="text/javascript" src="js/store.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/nav.js"></script>
    <script type="text/javascript" src="js/rem_1366.js"></script>

    <script src="js/login.js"></script>
<script src="js/reg.js"></script>

<link rel="stylesheet" type="text/css" href="css/layer.css">
<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css">

<script type="text/javascript" src="js/xqjs/gls_response.js" ></script>
<script type="text/javascript" src="js/xqjs/gmc_response.js" ></script>
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
<input id="id" type="hidden" value="${user.ID }" />

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

    	
    	<link rel="stylesheet" type="text/css" href="css/layer.css">
<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css">
<style type="text/css">
    .arrow {
        position: relative;
        width: 20px;
        height: 20px;
        margin: 25px 0 0 158px;
    }

    .arrow .arrow_border, .arrow .arrow_content {
        width: 0;
        height: 0;
        overflow: hidden;
        border-width: 10px;
        border-style: dashed dashed solid dashed;
    }

    .arrow .arrow_border {
        border-color: transparent transparent #25943a transparent;
    }

    .arrow .arrow_content {
        border-color: transparent transparent #25943a transparent;
        position: absolute;
        top: 1px;
    }

    .main {
        width: 250px;
        margin: 0 auto;
    }

    .b1, .b2, .b3, .b4, .b5, .b6, .b7, .b8 {
        height: 1px;
        overflow: hidden;
        display: block;
    }

    .b1, .b8 {
        height: 0px;
        margin: 0 5px;
    }

    .b1 {
        border-bottom: 1px solid #25943a;
    }

    .b8 {
        border-top: 1px solid #25943a;
    }

    .b2, .b3, .b4, .b5, .b6, .b7 {
        border-left: 1px solid #25943a;
        border-right: 1px solid #25943a;
    }

    .b2, .b7 {
        margin: 0 3px;
        border-width: 2px;
    }

    .b3, .b6 {
        margin: 0 2px;
    }

    .b4, .b5 {
        margin: 0 1px;
        height: 2px;
    }

    .b2, .b3, .b4, .b5, .b6, .b7, .content {
        background: #151515;
        z-index: 1000000
    }

    .content {
        border-left: 1px solid #25943a;
        border-right: 1px solid #25943a;
        padding: 10px;
        position: relative;
    }

    .car_arr_type_hehe {
        color: #999
    }

    .car_arr_type_hehe:hover {
        color: #25963a;
    }

    .item .bill_count a:link{
        color: white;
    }
    .item .bill_count a:hover{
        color: green;
    }

</style>
<!-- 内容 -->
<section class="main_card">
    <!-- 面包屑 -->
    <!--添加一个隐藏intpu-->
    <input type="hidden" name="input_curr_game_id" id="input_curr_game_id" value="102">

    <div class="bread_nav">
        <a href="index.php" title="首页">首页</a>
        -
        <a href="GameInfo.php" title="${game.gamename }">${game.gamename }</a>

        <div class="main_pics_nav_r">
                            <a href="myGame.php" title="我的游戏">我的游戏</a>                            
                            <a href="historygames.php" title="历史游戏">历史游戏</a>        </div>
    </div>

    <!-- 游戏主图 -->
    <div class="game_baner">
        <img src="${game.gamephoto }" alt="游戏主图">
    </div>
    <!-- 游戏详情 -->
    <div class="game_info_card">
        <!-- 游戏介绍 -->
        <div class="game_info_card_l">
            <div class="game_info_date">
                <div class="game_info_mate border_box">
                    <h3 class="game_tips">游戏信息</h3>

                    <div class="game_list">
                        
                        <p>游戏名称：${game.gamename }</p>
                        
                        <p>
                            支持人数：${game.gameRenshu }人
                            （仅1P支持键盘）                        </p>
                        <p>购买支持： G币</p>

      	 <p>
		                            操作方式：
		    <img src="images/op_ico_2.png" alt="鼠标">
		    <img src="images/op_ico_1.png" alt="键盘">
     	</p>
                        <p>
                            支持存档：
                            支持                        </p>
                    </div>
                </div>
                <div class="game_info_play border_box">
                    <ul class="game_items">
                        <li>
                            <a title="购买时长" id="j_buy_game_time">
                                <img src="gameImages/g_1.png" alt="时长">
                                <span>购买时长</span>
                            </a>
                        </li>
                        <li>
                            <a title="云存档" id="j_buy_gamesave">
                                <img src="gameImages/g_2.png" alt="存档">
                                <span>云存档</span>
                            </a>
                        </li>
                    </ul>
                    <a title="开始游戏" class="g_link" style="margin: 0px 50px; background-color: rgb(21, 21, 21);" id="j_start_game">开始游戏<br>
                    	<g:if test="${!empty mygame  }">
                    		${mygame.etime }到期
                    	</g:if>
                    </a>

                    <div id="try_tips" style="display:none;">
                        <div class="arrow">
                            <div class="arrow_border"></div>
                            <div class="arrow_content"></div>
                        </div>
                        <div class="main"><b class="b1"></b> <b class="b2"></b>
                            <b class="b3"></b>
                            <b class="b4"></b>

                            <div class="content">
                                <p>
                                    &nbsp;&nbsp;
                                    <a href="#" class="h_vip_ico"></a>
                                    &nbsp; 1.5倍试玩时间
                                </p>
                                <hr style="border:1px solid #25943a;size:1pix">
                                <p>
                                    &nbsp;&nbsp;
                                    <a href="#" class="h_svip_ico"></a>
                                    &nbsp; 2倍试玩时间
                                </p>
                            </div>
                            <b class="b5"></b>
                            <b class="b6"></b>
                            <b class="b7"></b>
                            <b class="b8"></b>
                        </div>
                    </div>
                    <p></p>
                </div>
            </div>
            <div class="game_info_txt border_box">
                <h3 class="game_tips">游戏详情</h3>

                <div class="game_t mCustomScrollbar _mCS_1" >
	                <div tabindex="0" id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
	                	<div id="mCSB_1_container" class="mCSB_container" style="position: relative; height: 150px; overflow-y: auto; top: 0px; left: 0px; line-height: 20px;" dir="ltr"   >
		                	<p></p>

							<p>${game.gameinfo }</p><p></p>
	            		</div>
	            		<!--
                        	作者：offline
                        	时间：2016-07-15
                        	描述：滚动条
                        -->
                        <script type="text/javascript" src="js/jquery-1.js" ></script>
                        <script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
		            	
	                </div>
                </div>
            </div>
        </div>
        <!-- 游戏图集 -->
        <div class="game_info_card_r">
            <div class="game_baner_pics">
                <img data-src="" src="${game.gamephoto1 }" alt="游戏图集" class="game_pic_big" id="j_atlas_img">
                <!-- 上下页 -->
                <p class="game_arr pre_ico j_atlas_pre"></p>

                <p class="game_arr next_ico j_atlas_next"></p>
            </div>
            <div class="game_baner_pics_itemscont">
                <ul class="game_baner_pics_items" id="j_atlas" style="transition: all 1s ease; left: 0px; width: 747.656px;">
                                        <!--<li class="on">
                    <img src="http://s2.gloud.cn/web/images/baner_jdt_1.jpg" alt="" class="game_pic_small" />
                </li>
                -->
                    <li>
                            <img src="${game.gamephoto1 }" alt="图集" class="game_pic_small">
                        </li><li>
                            <img src="${game.gamephoto2 }" alt="图集" class="game_pic_small">
                        </li><li>
                            <img src="${game.gamephoto3 }" alt="图集" class="game_pic_small">
                        </li><li>
                            <img src="${game.gamephoto4 }" alt="图集" class="game_pic_small">
                        </li><li>
                            <img src="${game.gamephoto5 }" alt="图集" class="game_pic_small">
                        </li>                </ul>
                <!-- 上下页 -->
                <p class="game_arr pre_ico j_atlas_pre"></p>

                <p class="game_arr next_ico j_atlas_next"></p>
            </div>
        </div>
    </div>

    <!-- 更多 -->
    <div class="games_slide">
        <h3 class="games_slide_tips">更多云游戏</h3>

        <div class="games_slide_box">
            <ul class="games_slide_items" id="j_game_silde" style="transition: all 1s ease; left: 0px; width: 1417px;">
               <g:forEach items="${tlist }" var ="mgame">
	               	<li>
	                     <a href="GameInfo.php?id=${mgame.gameid }">
	                      	<img src="${mgame.gameDP }" alt="标题图片">
	                       	<div class="games_slide_cover" style="display:none">
	                         	<h3>${mgame.gamename }</h3>
	                         </div>
	                     </a>
	                </li>  
               </g:forEach>          
              </ul>
        </div>
        <!-- 上下页 -->
        <p class="game_arr pre_ico j_game_pre"></p>

        <p class="game_arr next_ico j_game_next"></p>
    </div>
</section>
<!--   弹出层   -->
<!--    检测安装   -->
<!--    检测安装   -->
<div class="xw_top_second" id="j_check_gmc_f" style="display:none;z-index: 10001"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_head_main" style="margin-bottom:10px;"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				检测
			</span>

            <div class="xw_top_head_close close_focus" id="j_check_gmc_close_x">
                <img class="layer_btn_x" src="images/close.png" alt="close">
            </div>
            <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_4_main xw_top_7_main_pad">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m xw_top_7_main_m">
                <div class="xw_top_7_main_left">
                    <div class="xw_top_7_main_left_css">
                        浏览器请求启动程序时，会弹出外部请求协议<br>请点击<span style="color:#fff">“启动应用”</span><br>否则无法顺利进入游戏。<br>勾选<span style="color:#fff">“记住我对所有此类链接的选择”</span>下次不会弹出此协议
                    </div>

                </div>
                <div class="xw_top_7_main_right">
                    <div>
                        <img src="images/speed_progress.gif" class="xw_7_speed_progress" alt="speed_profress">
                    </div>
                    <p class="xw_top_7_main_m_waring" id="check_gmc_prompt"></p>

                    <div class="xw_top_main_btns">
                        <div class="xw_top_7_main_right_btn" id="install_gmc_helper" style="margin-left:130px; display: none; float:left;cursor:pointer">
                            <span><a onclick="update_gmc()" style="color: white;">更新</a></span>
                        </div>
                        <div class="xw_top_7_main_right_btn" id="close_gmc_helper" style="margin-left:0px;display: none; float:left;cursor:pointer">
                            <span><a style="color: white;">关闭</a></span>
                        </div>
                        <div class="xw_top_7_main_right_btn" id="constituency" style="margin-left:0px; display: none; float:left;cursor:pointer">
                            <span><a onclick="constituency()" style="color: white;">继续</a></span>
                        </div>
                        <div class="xw_top_7_main_center_btn" id="download_install" style="display: none;cursor:pointer">
                            <a title="下载安装" class="g_link xw_top_7_font_size" target="_blank" href="#">下载必要程序</a>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--    选区测速   -->
<div class="xw_top_1_second" style="display:none; text-align:left; z-index: 10001" id="region_list"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_1_head_main"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				选择服务器
			</span>

            <div class="xw_top_head_close close_focus">
                <img class="layer_btn_x" src="images/close.png" alt="close">
            </div>
            <!-- 弹窗头部关闭-->
        </div>
    </div>

    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_1_main">    <!--  中部内容 边距控制-->
            </div>
    <div class="xw_top_1_desc">
        为了确保测速准确，测速前请关闭下载上传软件已经其它占用网速的应用程序。
    </div>
    <div class="span12 ">
        <input type="button" id="enqueue" class="btn-playgame0" value="加入排队" onclick="Enqueue()" style="position:absolute;left:330px;top:440px;">
    </div>
</div>

<!--   排队   -->
<div class="xw_top_second" style="display: none; text-align:left;z-index: 10001" id="queue_list"><!--   显示窗体的具体位置   -->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_head_main" style="margin-bottom:5px;"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				启动队列
			</span>

            <div class="xw_top_head_close" id="j_queue_list_close_x">
                <img class="layer_btn_x" src="images/close.png" alt="close">
            </div>
            <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_4_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <ul class="xw_top_2_main_m xw_top_2_main_m_add">
                <li class="xw_top_2_p1" style="width:50%;height:40px;float:left;">
                    <img src="images/xp_line.png" class="xw_top_2_img1" alt="line">
                    <span class="xw_top_2_span1">服务器 :</span>
                    <span class="xw_top_2_span2" id="region_name">北京多线</span>
                </li>

                <li class="xw_top_2_p1" style="width:50%;height:40px;float:left;">
                    <img src="images/start_method.png" class="xw_top_2_img1" alt="line">
                    <span class="xw_top_2_span1">启动方式 :</span>
                    <span class="xw_top_2_span2" id="start_method">客户端/网页</span>
                </li>

                <li class="xw_top_2_p1" style="width:50%;height:40px;float:left;">
                    <img src="images/HD.png" class="xw_top_2_img1" alt="hd">
                    <span class="xw_top_2_span1">清晰度 :</span>
                    <span class="xw_top_2_span2" id="j_qingxidu">流畅</span>
                </li>

                <li class="xw_top_2_p1" style="width:50%;height:40px;float:left;">
                    <img src="images/shoubing.png" class="xw_top_2_img1" alt="line">
                    <span class="xw_top_2_span1">操控设备 :</span>
                    <span class="xw_top_2_span2" id="inputdevice">键鼠</span>
                </li>

                <li class="xw_top_2_p1" style="width:50%;height:40px;float:left;">
                    <img src="images/720P.png" class="xw_top_2_img1" alt="hd">
                    <span class="xw_top_2_span1">分辨率 :</span>
                    <span class="xw_top_2_span2" id="screen_resolution">720</span>
                </li>
                <p class="xw_top_2_p1" style="clear:both;">
                    <img src="images/quene.png" class="xw_top_2_img1" alt="quene">
                    <span class="xw_top_2_span1">排队 :</span>
                    <span class="xw_top_2_span2">
                        队列总人数
                        <span id="queue_nums">0</span>
                        人，您前面还有
                        <span id="queue_pop_nums">0</span>
                        人
                    </span>
                </p>
                <p class="xw_top_2_p2">
                    <span class="xw_top_2_span4" id="queue_status">服务器已经满，请稍等！</span>
                </p>

                <p class="xw_top_2_p3">
                    <span class="xw_top_2_span1">
                        SVIP队列最前，其次是VIP队列，
                        <a style="color:#25943a" href="#" target="_blank">开通SVIP，畅享排队优先&gt;</a>
                    </span>
                </p>
            </ul>
            </div>
        <div class="xw_top_2_div_btn_m" style="padding:0 40px 0px 30px">
            <div class="xw_top_2_div_btn_div">
                <div class="xw_top_2_div_btn_div_m" id="open_game" style="display:block;cursor:pointer;width:150px">
                    <span class="xw_top_2_div_btn_div_span">
                                                    <span id="open_game_btn">请稍等</span>                    </span>
                </div>

                <div class="xw_top_2_div_btn_div_m2" id="dequeue" style="display:none;cursor:pointer;width:150px">
                    <span class="xw_top_2_div_btn_div_span2"> 退出队列 </span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 重新加入队列 -->
<div class="xw_top_first" style="display:none;z-index:10001" id="restart_queue"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->

    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_4_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <div class="xw_top_2_main_m xw_top_2_main_m_add xw_top_10_add" style="cursor:pointer;">
                对不起，等候超时，下次排队记得留意时间哦。<br>请重新排队吧。

            </div>
            <div class="xw_10_div">
                <div class="xw_top_2_div_btn_div ">
                    <div class=" xw_10_btn_div xw_10_btn_left" style="margin-bottom:20px;cursor:pointer;" id="restart_join_queue">
                        重新排队
                    </div>
                    <div class=" xw_10_btn_div xw_10_btn_right" style="margin-bottom:20px;cursor:pointer;" >
                        取消
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 继续游戏浮层 -->
<div class="xw_charge_top" style="display:none;z-index:10001;" id="j_continue_game_f"><!--   显示窗体的具体位置-->
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_main" style="padding:0 20px;">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <p class="xw_charge_return_info">发现您有游戏正在云端运行</p>
            <p class="xw_charge_return_info" style="margin-top:10px;">是否移屏到本设备上继续游戏？</p>
            <p class="xw_charge_return_info" style="margin-top:10px;">该功能为SVIP专享功能。立即开通</p>
        </div>
        <div class="xw_charge_return_btn" style="float: left;margin-left: 30px;width: 80px">

                <div class="xw_charge_return_btn_div" style="margin-top:20px;width: 80px"  id="j_continue_game_btn">
                   接收移屏
                </div>

        </div>
        <div class="xw_charge_return_btn" style="margin-left:30px;float: left">

            <div class="xw_charge_return_btn_div" style="margin-top:20px; width: 80px">
               新开游戏
            </div>

        </div>
    </div>
</div>
<!--   购买时长  -->
<!-- 购买游戏弹窗 -->
	
		<div class="buyplay_fixed" style="display:none;" id="j_buy_game_time_f">
	<ul class="tab_nav">
	<li class="active" id="tab_nav_gold">G币购买</li>
	<li id="tab_nav_coin">云贝购买</li>
	</ul>
	<div class="item">
	<div class="xw_top_head_close close_focus" id="j_buy_gameTime_close_x">
			<img src="images/close.png" alt="close" class="xw_8_close_btn layer_btn_x">
	</div>
	<div class="bill_count">
	<span class="bill_tit">账户余额：</span>
	<span class="price user_gold">${user.GB }</span>
	<span class="price user_coin" style="display: none;">${user.YB }</span>
	<img class="user_gold" src="images/ichy_59.png" alt="">
	<img class="user_coin" style="display: none;" src="images/user_yb.png" alt="">
	<a href="#" target="_blank" class="credit user_gold">充值G币&gt;</a>
	<a href="#" target="_blank" class="credit user_coin" style="display: none;">获取云贝&gt;</a>
	</div>
		<div id="j_buy_game_time_box">
		<div class="list_box" id="list_box_gold">
		<!-- svip开始 -->
		<div class="list">
		  <g:if test="${game.gameMoneytype==1 }" var="price">
		  		  <ul>
		        <li class="click_buy">
		                    <input type="hidden" name="chargepoint_id" value="253">
		                    <h2>包月（31天）</h2>
		                    <div class="price_num"> 
		                                                <input type="hidden" class="buy_game_money_value" value="${game.gameMoney*3.5 }G币">
		                        ${game.gameMoney*3.5 }G币                    </div>
		          </li>
		                
		                <li class="click_buy">
		                    <input type="hidden" name="chargepoint_id" value="492">
		                    <h2>包周（7天）</h2>
		                    <div class="price_num">
		                                    <input type="hidden" class="buy_game_money_value" value="${game.gameMoney*1.5 }G币">
		                        ${game.gameMoney*1.5 }G币                   
							</div>
		                </li>
		                                <li class="click_buy">
		                    <input type="hidden" name="chargepoint_id" value="401">
		                    <h2>包天（24小时）</h2>
		                    <div class="price_num">
		                           <input type="hidden" class="buy_game_money_value" value="${game.gameMoney }G币">
		                        ${game.gameMoney }G币                   
		                    </div>
		                </li>    </ul>
			</g:if>
			<g:if test="${not price }">
		    	  <p style ="text-align:center; font-size:18px; color:#FFF;">该游戏暂不支持G币购买，可用云币购买！</p>
		  	</g:if>
			</div>
		  
		  
		<div class="svip_info">
		    <span style="color:white;">SVIP购买享95折</span>
		    <a href="#" target="_blank" class="go_price">
		                开通&gt;    </a>
		</div>
		</div>
		<!-- svip结束 -->
		<!-- 一般开始 -->
		<div class="list_box" id="list_box_coin" style="display: none">
		<div class="list">
		   <g:if test="${game.gameMoneytype==2 }" var ="priceY">
		   		 <ul>
		       <li class="list_grey_cover click_buy">
		           <input type="hidden" name="chargepoint_id" value="253">
		               <h2>包月（31天）</h2>
		                  <div class="price_num">
		                         <input type="hidden" class="buy_game_money_value" value=" ${game.gameMoney*4}云贝">
		                             ${game.gameMoney*4}云贝                   
		                    </div>
		                </li>
		                                                <li class="list_grey_cover click_buy">
		                                    <input type="hidden" name="chargepoint_id" value="401">
		                    <h2>包天（24小时）</h2>
		                    <div class="price_num">
		                                                    <input type="hidden" class="buy_game_money_value" value=" ${game.gameMoney }云贝">
		                           ${game.gameMoney }云贝                    </div>
		                </li>    
		     </ul>
		   </g:if>
		   <g:if test="${not priceY }">
		    	  <p style ="text-align:center; font-size:18px; color:#FFF;"> 该游戏为VIP游戏,暂不支持云币购买，必须用G币购买！</p>
		  	</g:if>
		</div>
		<div class="svip_info">
		       <span style="color:white;">SVIP购买享95折</span>
		    <a href="#" target="_blank" class="go_price">
		                开通&gt;    </a>
		   		     		 	    
		</div>
		</div>
		<!-- 确认购买 -->
		<div class="no_glod" id="j_is_buy" style="display: none">
		<form action="buyGame.php" method="post">
		
		<h2 class="please_go">
		    是否确定购买？将扣除
		    <span id="isbuy_price"></span>
		</h2>
		<input name ="time" id="time" type ="hidden" value=""/>
		<input name ="price" id="price" type ="hidden" value="${game.gameMoney }"/>
		<input name ="id" id="id" type ="hidden" value="${game.gameid}"/>
		<input type ="submit" class="gobill" style="background:#2a2a2a;" id="sure_buy" value="确定"/>
		<a href="javascript:void(0)" class="exit" onclick="game_back_box()">返回</a>
		</form>
		</div>
		
		    <div class="no_glod" id="j_is_buying" style="display: none">
		    <h2 class="please_go">
		        购买中,请稍后
		    </h2>
		    </div>
		<!-- 一般结束 -->
		<!-- 余额不足 -->
		<div class="no_glod" id="j_buy_tips" style="display: none">
		<h2 class="please_go">您的G币余额不足，请您充值后再试</h2>
		<a href="#" target="_blank" class="gobill">去充值</a>
		<a href="#" class="exit" onclick="game_back_box()">返回</a>
		</div>
		<!-- 超上限 -->
		<div class="no_glod" id="j_buy_success" style="display: none">
		<h2 class="please_go"></h2>
		<a href="#" class="exit_only" onclick="close_buy_box()">确定</a>
		</div>
		</div>
	</div>
</div>


<!-- 购买存档弹出层 -->
<!-- 购买存档弹窗 点击购买弹出窗口 -->
<div class="buyplay_fixed" id="j_buy_game_storage_f" style="display:none;">
<ul class="tab_nav">
<li class="active" id="save_gold">G币购买</li>
<li id="save_coin">云贝购买</li>
</ul>
<div class="xw_top_head_close close_focus" id="j_buy_qgamesave_close_x">
			<img src="images/close.png" alt="close" class="xw_8_close_btn layer_btn_x">
	</div>
<div class="item">
<div class="bill_count">
<span class="bill_tit">账户余额：</span>
<span class="price user_gold">${user.GB }</span>
<span class="price user_coin" style="display: none;">${user.YB }</span>
<img class="user_gold" src="images/ichy_59.png" alt="">
<img class="user_coin" style="display: none;" src="images/user_yb.png" alt="">
<a href="#" target="_blank" class="credit user_gold">充值G币&gt;</a>
<a href="#" target="_blank" class="credit user_coin" style="display: none;">获取云贝&gt;</a>
</div>
<div class="trade">
<ul id="buy_game_storage_btn">
<input type="hidden" name="sid" id="sid" value=""/>
<li id="buy_game_storage_save_name"></li>
<li id="buy_game_storage_price"></li>
</ul>
</div>
</div>
</div>

<script language="javascript">
	function buy_game_storage(chargepoint_id) {
	    $.ajax({
	        type: "POST",
	        dataType: "json",
	        url: '/index.php/Accountajax/buy_chargepoint',
	        data: "chargepoint_id=" + chargepoint_id,
	        success: function (result) {
	            if (result.code != "0") {
	                alert(result.message);
	            } else {
	                alert("result.message");
	                location.reload();
	            }
	        }
	    });
	}
    function pay_money()
    {
        var url="/index.php/Pay/index";
        window.open(url);
    }

    $('#buy_game_storage_btn').on('mouseover',function(){
    	$('#buy_game_storage_btn').attr({style:'background:green'});
    });

    $('#buy_game_storage_btn').on('mouseout',function(){
    	$('#buy_game_storage_btn').attr({style:'background: '});
    });
</script>

<!--  判断是否是VIP 弹出层-->
<!-- <div class="xw_charge_top" style="display:none;z-index:10001;" id='j_open_vip_f'> --><!--   显示窗体的具体位置-->
	 <!-- 弹出 中部内容 控制-->
	<!-- <div  class="xw_top_main" style="padding:0 0.2rem;">
		<div  class="xw_top_main_list">   
			<p class="xw_charge_return_info" >测试期间体验游戏需开通会员</p>
			<p class="xw_charge_return_info" style="margin-top:0.1rem;" >快去参加一分钱购买VIP活动吧</p>
		</div>
		<div class="xw_charge_return_btn" style="float: left;margin-left: 0.3rem;width: 0.8rem">
			<a href="#" target='_blank'>
				<div class="xw_charge_return_btn_div" style="margin-top:0.2rem;width: 0.8rem" onclick="close_all_layer('j_open_vip_f',1)">
					确定
				</div>
			</a>
		</div>
        <div class="xw_charge_return_btn" style="margin-left:0.3rem;float: left">

                <div class="xw_charge_return_btn_div" style="margin-top:0.2rem; width: 0.8rem" onclick="close_all_layer('j_open_vip_f',1)">
                    取消
                </div>
           
        </div>
	</div>
</div> -->


<div class="xw_charge_top" style="display:none;z-index:10001;" id="j_open_time_f"><!--   显示窗体的具体位置-->
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_top_main" style="padding:0 20px;">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list">   
			<p class="xw_charge_return_info">试玩时长结束，请购买游戏时间</p>
		</div>
		<div class="xw_charge_return_btn" style="  margin-left: 80px;">
				<div class="xw_charge_return_btn_div" style="margin-top:20px;" >
					确定
				</div>
		</div>
	</div>
</div>

<!--  判断用户组是否能玩该游戏 弹出层-->
<div class="xw_charge_top" style="display:none;z-index:10001;" id="j_open_game_auth0"><!--   显示窗体的具体位置-->
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_top_main" style="padding:0 20px;">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list">   
			<p class="xw_charge_return_info">您的账户无权访问</p>
			<p class="xw_charge_return_info" style="margin-top:10px;"></p>
		</div>
		<div class="xw_charge_return_btn" style="  margin-left: 80px;">
			<a href="#">
				<div class="xw_charge_return_btn_div" style="margin-top:20px;" >
					返回主页
				</div>
			</a>
		</div>
	</div>
</div>

<div class="xw_charge_top" style="display:none;z-index:10001;" id="j_open_game_auth1"><!--   显示窗体的具体位置-->
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_top_main" style="padding:0 20px;">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list">   
			<p class="xw_charge_return_info">敬请期待</p>
			<p class="xw_charge_return_info" style="margin-top:10px;">该游戏即将登陆平台，敬请期待</p>
		</div>
		<div class="xw_charge_return_btn" style="  margin-left: 80px;">
			<a href="#">
				<div class="xw_charge_return_btn_div" style="margin-top:20px;" >
					返回主页
				</div>
			</a>
		</div>
	</div>
</div>

<div class="xw_charge_top" style="display:none;z-index:10001;" id="j_open_game_auth2"><!--   显示窗体的具体位置-->
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_top_main" style="padding:0 20px;">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list">   
			<p class="xw_charge_return_info">无权购买</p>
			<p class="xw_charge_return_info" style="margin-top:10px;">该游戏当前用户不能购买</p>
		</div>
		<div class="xw_charge_return_btn" style="  margin-left: 80px;">
			<a href="#">
				<div class="xw_charge_return_btn_div" style="margin-top:20px;" >
					返回主页
				</div>
			</a>
		</div>
	</div>
</div>
<!--  存档运行模式 -->

<!--  读取存档运行模式 -->
<div class="xw_top_first" style="display:none; z-index:10003" id="gamesave_use_mode"><!--   显示窗体的具体位置-->
	<div class="xw_top_head">  <!-- 弹窗的头部-->
		<div class="xw_top_head_main xw_read_storage"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				请选择存档运行模式
			</span>
			<div class="xw_top_head_close"> 
				 <img class="layer_btn_x" src="images/close.png" id="j_close_gamesave_use_mode" alt="close">
			 </div> <!-- 弹窗头部关闭-->
		</div>
	</div>
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_top_4_main" id="savaOP">    <!--  中部内容 边距控制-->
	
		<div style="margin-bottom:20px;">
			<div class="xw_read_storage_btn1">
				<div class="xw_read_storage_btn11" id="use_gamesave_btn">
					使用存档
				</div>
			</div>
			<div class="xw_read_storage_btn2">
				<div class="xw_read_storage_btn22" id="use_gamesave_only_btn">
					只读模式
				</div>
			</div>
			
			<div class="xw_read_storage_btn2">
			<input type="hidden" id="gameSave" name="gameSave" value="">
			<input type="hidden" id="gid" name="gid" value="${game.gameid }">
				<div class="xw_read_storage_btn22" id="delete_gamesave_btn">
					删除存档
				</div>

			</div>
		</div>

	</div>
</div>
<!--  测试遮罩 -->
<!--  测试的时候遮罩 效果 -->
<div class="xw_charge_top" style="position:fixed;display:none;z-index:10002;  background:rgba(0, 0, 0, 0) none repeat scroll 0 0; border:0px;" id="test_speed_locker"><!--   显示窗体的具体位置-->
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_top_main">    <!--  中部内容 边距控制-->
		  <img src="images/speed_progress.gif" class="xw_7_speed_progress" alt="speed_progress">
	</div>
</div>
<!--  云存档 -->
<div class="xw_top_second" style="display: none; z-index: 10001; width:751px; margin-left: -375px;" id="j_buy_gamesave_f">
	<!--   显示窗体的具体位置-->
	<div class="xw_top_head">
		<!-- 弹窗的头部-->
		<ul class="xw_top_head_main  xw_8_head" style="cursor: pointer;" id="j_save_tab">
			<!-- 弹窗的头部内容样式-->
			<li class="on" id="xw_save_1">我的存档</li>
			<li class="" id="xw_save_2">存档市场</li>
		</ul>
		<div class="xw_top_head_close close_focus" id="j_buy_gamesave_close_x">
			<img src="http://s2.gloud.cn/web/images/close.png" alt="close" class="xw_8_close_btn layer_btn_x">
		</div>
	</div>
	<!-- 弹出 中部内容 控制-->
	<div class="xw_top_8_main" id="j_save_box">
		<!--  中部内容 边距控制-->
		<div style="position: relative; clear: both; overflow-y: auto; text-align: left; height: 131.8px;" class="mCustomScrollbar  _mCS_3 mCS_no_scrollbar">
			<div tabindex="0" style="max-height: 131.183px;" id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
				<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0px; left: 0px;" dir="ltr">
		            <div class="xw_8_savecard " id="xw_my_save_1">
						<div class="xw_8_save_tips">
							<h4>我的存档卡</h4>
							<p>${count }个存档卡</p>
						</div>
						<div class="xw_8_save_line"></div>
						<div class="xw_8_save_list_cont">
						<g:if test="${count>=1 }">
							<ul class="xw_8_save_list" id="j_save_silde" style="transition: all 1s ease 0s; left: 0px; width: 219.254px;">
								
									<g:forEach items="${save}" var="sv" >
										<li id="sali"  class="on" onclick="set_up(${sv.id},2661655);">
									<div class="xw_8_save_ico_1">
										<h4>
											${sv.time }分钟
										</h4>
										${sv.size }
									</div>
									<p class="xw_8_save_ico_p">
										${sv.stime }
									</p>
								</li>
									</g:forEach>
							
								
							</ul>
								</g:if>
						</div>
						<!-- 上下页 -->
						<!--<p class="game_arr pre_ico j_save_pre"></p>
						<p class="game_arr next_ico j_save_next"></p>-->
					</div>            		
				</div>

				<div style="display: none;" id="mCSB_3_scrollbar_vertical" class="mCSB_scrollTools mCSB_3_scrollbar mCS-light mCSB_scrollTools_vertical">
					<div style="" class="mCSB_draggerContainer">
						<div id="mCSB_3_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;">
							<div style="line-height: 30px;" class="mCSB_dragger_bar"></div>
						</div>
						<div class="mCSB_draggerRail"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="xw_8_desc">
			<p>1。以上均为游戏存档拷贝，游戏结束后，新存档拷贝会在序列最左侧产生;</p>

			<p>2。当存档拷贝序列过多时，只显示最新5个存档，删除候选，可显示更多;</p>

			<p>3。若只想查看存档进度，可使用“只读模式”,将不会产生新存档拷贝;</p>
		</div>
	</div>
	<div class="hide" id="xw_save_shop">
		<!-- mCustomScrollBox -->
		<div style="" class="xw_8_save_height  mCustomScrollbar _mCS_4 mCS_no_scrollbar">
			<div tabindex="0" style="max-height: 131.183px;" id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
				<div id="mCSB_4_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0px; left: 0px;" dir="ltr">
						<g:if test="${!empty sl }" var="s">
							<g:forEach items="${sl }" var="sh">
								<span onclick="buy_game_save(${sh.id },${sh.price}, '${sh.name}', -1)">
							<div class="xw_8_save_items ">
								<div class="xw_8_save_tips2">
									<h4>
										<span>存档—${sh.name }</span>
									</h4>
			
									<p>G币:${sh.price }</p>
								</div>
								<div class="xw_8_save_items_t">
									<h3>${sh.name }</h3>
			
									<p>${sh.info }</p>
								</div>
							</div>
						</span>
							</g:forEach>
						</g:if>
						<g:if test="${not s }">
							<div style="" class="xw_8_save_height  mCustomScrollbar _mCS_4"><div tabindex="0" style="max-height: 131.183px;" id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"><div id="mCSB_4_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0px; left: 0px;" dir="ltr">
						<div class="xw_8_save_items evenbg">
				<div class="xw_8_save_tips3"></div>
				<div class="xw_8_save_items_t">
					<h3>当前游戏还没有可购买的存档</h3>

					<p></p>
				</div>
			</div>
					</div><div style="display: none;" id="mCSB_4_scrollbar_vertical" class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical"><div style="" class="mCSB_draggerContainer"><div id="mCSB_4_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;"><div style="line-height: 30px;" class="mCSB_dragger_bar"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
						</g:if>
										
				</div>
				</div>
			
		</div>

		<div class="xw_8_desc">
			<p>1。以上均为游戏存档拷贝，游戏结束后，新存档拷贝会在序列最左侧产生;</p>

			<p>2。当存档拷贝序列过多时，只显示最新5个存档，删除候选，可显示更多;</p>

			<p>3。若只想查看存档进度，可使用“只读模式”,将不会产生新存档拷贝;</p>
		</div>
	</div>
	<script language="javascript">
        //购买存档
        function buy_game_save(id, gold, save_name, coin) {
        	var id =id;
        	save_gold = gold;
        	save_coin = coin;
            
            $('#j_buy_gamesave_f').hide();
            $('#j_buy_game_storage_f').show();
            $("#sid").val(id);
            $('#buy_game_storage_price').html(gold+"G币");
            $('#buy_game_storage_save_name').html(save_name);
        }
    </script>
</div>
<!--  删除正在上传的存档的弹出层 -->
<!--  读取存档运行模式 -->
<div class="xw_top_first" style="display:none; z-index:10003" id="delete_gamesave_layer"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_head_main xw_read_storage"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
			</span>

            <div class="xw_top_head_close">
                <img class="layer_btn_x" src="images/close.png" id="j_close_delete_gamesave_layer" alt="close">
            </div>
            <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_4_main">    <!--  中部内容 边距控制-->

        <div style="margin-bottom:60px;">
            <div class="xw_read_storage_btn2" style="margin-top:70px">
                	
                <div class="xw_read_storage_btn22" id="delete_gamesave_2_btn">
                    删除存档
                </div>
            </div>
        </div>

    </div>
</div>

<script src="js/info.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>


<!-- 页尾 -->
<!--选区测速浮层-->
<link rel="stylesheet" type="text/css" href="css/layer.css" />
    <link rel="stylesheet" type="text/css" href="js/jquery.css" />
    <div class="xw_top_1_second" style="text-align: left; z-index: 10001; display: none;" id="j_region_f"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_1_head_main"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				选择服务器
			</span>
            <div class="xw_top_head_close close_focus" id="j_region_x">
                <img class="layer_btn_x" src="images/close.png">
            </div>
            <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div id="j_region_html_div">
    <div style="" class="xw_top_1_main mCustomScrollbar _mCS_5 mCS_no_scrollbar">
    <div tabindex="0" style="max-height: 276.417px; " id="mCSB_5" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
    	<div id="mCSB_5_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0px; left: 0px;" dir="ltr">
    		<div tabindex="0" style="max-height: 276.417px; position: relative; height: 270px; overflow-y: auto;" id="mCSB_5" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
    			<div id="mCSB_5_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0px; left: 0px; margin-left: 15px;" dir="ltr">    <!--  中部内容 边距控制-->
        				<g:forEach items="${server }" var="ser">
        					<g:set var="i" value="${ser.id }"></g:set>
        					<div onclick="region_focus(${i })" id="region_id_2${i }" class="xw_top_1_client_1 xw_top_1_client_both region_id_21">
			                
			                <div class="xw_top_1_client_1_head xw_top_1_client_1_head_font">
			                    ${ser.name }
			                </div>
			                <div style="display: none;" class="xw_top_1_client_1_2" id="test_speed_div_id_21">
			                    <div class="xw_top_1_client_1_2_font" id="test_speed_div_2_id_21" onmouseout="onblur_speed('21')" onclick="speed_test('123.150.195.132','8082','21')" style="cursor:pointer; display:block" >${ser.speed }</div>
			                </div>
			                <div class="xw_top_1_client_btn2" style="cursor: pointer; display: block;" id="mbps_region_div_id_21" onmousemove="onblur_speed('21')">
			                    <div class="xw_top_1_client_1_2_font">
			                        <span class="xw_top_1_kps1" id="mbps_region_21">${ser.speed }</span>
			                    </div>
			                </div>
			
			                <div class="xw_top_1_client_1_3">
			                    <div class="xw_top_1_client_1_head_font" id="queue_max_size_21">${ser.per }人排队</div>
			                </div>
			                <div class="xw_top_1_client_1_4">
			                    <div class="xw_top_1_client_1_4_font xw_top_1_client_color_1" id="delaytime_region_21"></div>
			                </div>
			                <div class="xw_top_1_client_1_3">
			                    <div class="xw_top_1_client_1_head_font">延时 <span id="delay_time_21">${ser.delayed }</span> <img class="mCS_img_loaded" src="images/ms.png"></div>
			                </div>
			            </div>
        				</g:forEach>
        		
        		  </div>
            
    </div>
    </div>
   
    </div>
    </div>
    </div>
        <div class="xw_top_1_enter_btn">
            <div class="xw_top_1_enter_span" onclick="speed_all_region()" id="j_test_all_region" style="display: block;cursor:pointer;float: left;margin-left:-60px;width:48px"> 刷新</div>
            <div class="xw_top_1_enter_span" id="join_enqueue" style="display: none;cursor:pointer"> 加入队列</div>
            <div class="xw_top_1_enter_span" id="region_queding" style="cursor: pointer;"> 确定</div>
        </div>
    <div class="xw_top_1_desc" style=" ">
        为了确保测速准确,测速前请关闭下载上传软件以及其它占用网速的应用程序。
    </div>
</div>
    

<!-- 页尾 -->
	<div id="footer_tips" style="display:none;z-index:10000;position:absolute; font-size:12px;background: rgba(0, 0, 0, 0.8) none repeat scroll 0 0; color:#fff">
		<span id="footer_tips_span" class="" style="margin-left:20px;margin-right:20px;margin-top:20px;line-height:40px;">点击切换操作方式</span>
	</div>

<footer class="footer_card">

    <!-- 设置 -->
      <div class="footer_set "><!--选中为on-->
               <!-- <p class="f_set_btn" title="设置" id="j_footer">设置</p>-->
                <ul class="f_set_items" style="display:block" id="j_footer_f">
                    <li>
                        <span class="f_set_ico f_s_1" id="j_region">请选择服务器</span><!--选中为on-->
                    </li>
                    <li style="display:none">
                        <span class="f_set_ico f_s_6 j_config" id="j_start_method">客户端</span>
                    </li>
                    <li>
                        <span class="f_set_ico f_s_3 j_config" id="j_videobitrate">流畅</span>
                    </li>
                    <li>
                        <span class="f_set_ico f_s_2 j_config" id="j_screen_resolution">480</span>
                    </li>
                    <li>
                        <span class="f_set_ico f_s_4 j_config" id="j_protocol">TCP</span>
                    </li>
                                        <if condition="isset($data) and isset($data[0]) and isset($data[1]) and ($data[0] eq 1) and ($data[1] eq 1)">
                        <li>
                            <span class="f_set_ico f_s_5 j_config" id="j_inputdevice">手柄</span>
                        </li>                </if></ul>
            </div>    
    <!-- 底部信息 -->   
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
            <li><a href="#" title="官方淘宝店" class="f_ico f_7" target="_blank">官方淘宝店</a></li>
            <li><a href="#" title="官方微博" class="f_ico f_5" target="_blank">官方微博</a></li>
        </ul>
        <!-- 底部导航 -->
        <div class="footer_nav">
            <a href="#" title="新闻资讯" target="_blank">新闻资讯</a>
            <a href="#" title="关于我们" target="_blank">关于我们</a>
            <a href="#" title="加入我们" target="_blank">加入我们</a>
            <a href="#" target="_blank" title="用户协议">用户协议</a>
            <a href="#" title="用户协议" id="user_agreement_arr">&gt;</a>
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
    })
    $('#j_inputdevice').on('mouseout', function(){
		$("#footer_tips").hide();
    })
    $('#j_region').on('mouseover', function(){
		var top = $('#j_region').offset().top-50;
		var left = $('#j_region').offset().left;
		$("#footer_tips").show();
		$("#footer_tips_span").empty();
		$("#footer_tips").css({"top":top,"left":left});
		$("#footer_tips_span").append('点击切换选择服务器');
    })
    $('#j_region').on('mouseout', function(){
		$("#footer_tips").hide();
    })
    
</script> 
<script language="JavaScript">
    // 购买相关
    use_money_type = "gold";
    save_money_type = "gold";
    //用户信息变量
    var account_id;  //  玩家ID
    var device_uuid; //  设备UUID
    var login_token; //   logintoken
    var nickname;    //   玩家昵称
    var user_is_vip = 0; //玩家是否是vip，默认不是vip
    var user_is_svip = 0;//玩家是否为svip，默认不是svip
    var user_level = 0;//玩家等级
    var user_s_time;//玩家还有多少分钟
    var user_game_auth;//该玩家用户组对该游戏权限
    var user_vip_level = 0;//玩家vipd等级 0普通用户1、vip用户，2、svip用户 暂时加上，兼容老版本
    var user_is_reconnect = 0;//默认不重连
    //游戏信息变量
    var game_id;     //  启动的游洗
    var game_mode = 1;      //   游戏模式  (暂时pc端都是单人有存档模式)
    var payment_type = 0;   //   支付模式  0:试玩,1:街机,4:已订阅
    var save_id = -1;       //   存档ID
    var serial_id = 0;     //   存档组ID
    var save_is_upload = 0;//最新存档是否上传成功
    var game_low_bitrate;
    var game_mid_bitrate;
    var game_high_bitrate;
    var gameimggc = "";//游戏手柄操控图
    var gameimgkm = "";//游戏键鼠操作图
    var game_is_shoubing;
    var game_is_jianpan;
    var gls_ip = '120.55.245.231';
    var gls_port = '80';
    var client_ver_api_url = 'http://b2.51ias.com/api.php';
    var is_display_logintoken_error = 0;
    var game_gs_id = 0;//gs返回的
    //状态值变量
    var select_region_id = null;//当前所选区域
    var is_start_game = true;      //  是否能点击start_game
    var player_game = false; //是否正在玩游戏
    var is_gls_connect_gls_status = false;         //gls链接状态
    var is_check_update = false;            // 验证是否获取到更新信息
    var is_close_gmc_helper = false;        // 是否依旧关闭gmc_helper
    var is_open_game = 0;//用户是否点击开始游戏
    var is_gmc_update = 0;//默认不是更新操作
    var gmchelper_is_open_num = 0;//浏览器弹出是否启用打开gmc协议
    var is_may_start_game = 0;//当用户排队轮上后，是否可以开始点击开始游戏按钮，默认不开始
    // 活动专用
    //var active_game_arr = ['14', '41', '42'];
    //网页开游戏参数
    var web_userdata="abc";
    var web_userid=0;
    var web_gsmid="";
    var web_gsip="";
    var web_gsmtoken="";
    var web_gameid=0;
    var web_gamemode=0;
    var web_width=0;
    var web_height=0;
    var web_payment=0;
    var web_serialid;
    var web_saveid;
    var web_inputdevice;
    var web_videobitratefluent;
    var web_videobitratestandard;
    var web_videobitratehigh;
    var web_videobitrate;
    var web_reconnect;
    var web_start_game_url="";
    var web_device_uuid;
    var web_logintoken;
    var web_gstcpport;
    var web_gsudpport;

    //函数返回值
    var countdown_timer;// setInterval 返回的code
    //加入队列时间
    var join_queue_time = 0;
    //默认延迟和带宽都测
    var speedtest_model = 1;//1代表都测2、只测试延迟
    var speedtest_key = 0;//当前测到那个线路的键值
    var region_speed_data;
    var speed_is_all = false;//默认当前不是全部都测
    //gmc相关状态变量
    var gmc_is_update_over = false;
    var gmc_connect_error_num = 0;//连接gmc错误次数
    var gmc_is_checkgmc = false;//当前是否在检测gmc
    var gmc_is_install = false;
    //gls相关变量
    var gls_login_success_next_step = 0;//登录成功gls后，下一步要做什么 1、加入队列2、获取排队信息3、获取单个线路详细信息
    var gls_user_is_login = 0;//记录用户是否登录了gls 0、没有登录1、登录成功
    var gls_connect_success_next_step = 0;//连接gls成功后，下一步要做什么1、登录
    var gls_is_notify_gs_result = 0;//是否已经通知gls gs连接状态，0没有通知


    var speed_test_client = Object.create(Speed_test);
    var gls_client = Object.create(GlsClient);
    var gmc_client = Object.create(GmcClient);
    gls_client.ip = gls_ip;
    gls_client.port = gls_port;
    //设置接口地址
    gmc_client.client_ver_url = client_ver_api_url;
    //使用存档启动游戏方法
    function set_up(serialid, saveid) {
        save_id = saveid;       //   存档ID
        serial_id = serialid;     //   存档组ID
        $("#j_buy_gamesave_f").hide();
        $("#gamesave_use_mode").show();
        $("#gameSave").val(serial_id);
    }
    //删除正在上传的存档
    //使用存档启动游戏方法
//    function delete_gamesave(serialid, saveid) {
//       save_id = saveid;       //   存档ID
//        serial_id = serialid;     //   存档组ID
//        $("#j_buy_gamesave_f").hide();
//        $("#delete_gamesave_layer").show();
//    }
    //获取本地存储的测速信息
    function get_region_data() {
        var region_data = store.get('region_data');
        var select_region = store.get('selected_region_id');
        if (region_data !== undefined) {
            var myobj = eval(region_data);
            for (var i = 0; i < myobj.length; i++) {
                var mbps = parseInt(myobj[i].mbps);
                var region_id = myobj[i].region_id;
                $('#delay_time_' + region_id).text(myobj[i].delay_time);
                if (myobj[i].mbps == 0) {
                    $('#test_speed_div_id_' + region_id).show();
                    //$('#mbps_region_div_id_' + region_id).show();
                    // $('#mbps_region_' + region_id).html(mbps + "Mbps");
                } else {
                    $('#test_speed_div_id_' + region_id).hide();
                    $('#mbps_region_div_id_' + region_id).show();
                    $('#mbps_region_' + region_id).html(mbps + "Mbps");
                }

                modify_class_by_speed(region_id, myobj[i].delay_time, mbps);
                //新增选中状态
                if (select_region != undefined) {
                    if (myobj[i].region_id == select_region) {
                        $("#region_id_" + select_region).addClass('on');
                    }
                }
            }
        }
    }
    function speed_test(ip, port, region_id) {
        $("#test_speed_locker").show();
        $("#DivLocker").show();
        $('#DivLocker').css("z-index", 10010);
        select_region_id = region_id;
        speed_test_client.ip = ip;
        speed_test_client.port = port;
        speed_test_client.start();
        clearInterval(countdown_timer);
    }

    //全部服务器测试延迟
    function speed_all_region() {
        //一键测试所有延迟
        speed_is_all = true;
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Accountajax/get_all_region',
            data: "",
            success: function (result) {
                if (result.code == 0) {
                    region_speed_data = result.data;
                    for (var o in region_speed_data) {
                        var speed_obj = Object.create(Speed_test);
                        var region_id = region_speed_data[o].id;
                        var speed_test_addr = region_speed_data[o].speed_test_addr;
                        var speed_test_port = region_speed_data[o].speed_test_ws_port;
                        speed_obj.ip = speed_test_addr;
                        speed_obj.port = speed_test_port;
                        speed_obj.region_id = region_id;
                        speed_obj.speedtest_mode = 0;
                        speed_obj.start();
                    }
                }
            }
        });
    }
    function region_focus(id) {
    	var id = id;
    	var a =$("#region_id_2"+id).find($("div[Class*='xw_top_1_client_1_head']")).html();
    	//alert(a);
    	$("#j_region").html(a);
    	$("#j_region").addClass("on");
        $region_div = $('.xw_top_1_main').find('.xw_top_1_client_1');
        $region_div.each(function () {
            $(this).removeClass('on');
        });
        $("#region_id_2"+id).addClass('on');
        select_region_id = $("#region_id_2"+id).attr('id').replace("region_id_", "");
        store.set('selected_region_id', select_region_id);
        var region_data = store.get('region_data');
        var is_speed = 0;
        if (region_data !== undefined) {
            var myobj = eval(region_data);
            for (var i = 0; i < myobj.length; i++) {
                if (select_region_id == myobj[i].region_id) {
                    is_speed = 1;
                }
            }
        }
       
    }
    //测速按钮划过
    function onblur_speed(region_id) {
        var user_mbps = 0;
        var user_delay_time = 0;
        var region_data = store.get('region_data');
        if (region_data !== undefined) {
            var myobj = eval(region_data);
            for (var i = 0; i < myobj.length; i++) {
                if (region_id == myobj[i].region_id) {
                    user_mbps = myobj[i].mbps;
                    user_delay_time = myobj[i].delay_time;
                }
            }
        }
        $("#mbps_region_div_id_" + region_id).mouseover(function () {
            var s = $("#mbps_region_div_id_" + region_id).text();
            if (s) {
                $("#mbps_region_div_id_" + region_id).hide();
                $("#test_speed_div_id_" + region_id).show();
                if (user_mbps != 0) {
                    $("#test_speed_div_2_id_" + region_id).text("重新测速");
                } else {
                    $("#test_speed_div_2_id_" + region_id).text("测速");
                }

            }
        });
        $("#test_speed_div_id_" + region_id).mouseout(function () {
            var region_data = store.get('region_data');
            if (region_data !== undefined) {
                $('#delay_time_' + region_id).text(user_delay_time);
                $('#test_speed_div_id_' + region_id).hide();
                $('#mbps_region_div_id_' + region_id).show();
                $('#mbps_region_' + region_id).html(user_mbps + "Mbps");
                modify_class_by_speed(region_id, user_delay_time, user_mbps);
            }
        });
    }

    $(function () {
        //获取当前用户所选服务器
        var user_select_region_id = store.get("selected_region_id");
        if (user_select_region_id != undefined) {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '/index.php/Ajaxdata/get_region_info',
                data: "region_id=" + user_select_region_id,
                success: function (result) {
                    if (result.code == 0) {
                        var region_info = result.data;
                        var region_name = region_info.name;
                        $("#j_region").text(region_name);
                    }
                }
            });
        }
        //根据页面隐藏的表单，获取游戏的信息
        game_id = $("#input_curr_game_id").val();
        //获取游戏的信息
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Gameajax/get_game_info',
            data: "game_id=" + game_id,
            success: function (result) {
                if (result.code == 0) {
                    game_name = result.data.game_name;
                    game_low_bitrate = result.data.low_bitrate;
                    game_mid_bitrate = result.data.mid_bitrate;
                    game_high_bitrate = result.data.high_bitrate;
                    //gameimggc = result.data.control_pic;
                    //gameimgkm = result.data.keyboard_control_pic;
                    game_is_jianpan = result.data.is_jianpan;
                    game_is_shoubing = result.data.is_shoubing;
                    game_auth = result.data.action;
                    if (game_is_jianpan == 1) {
                        gameimgkm = result.data.keyboard_control_pic;
                    } else {
                        gameimgkm = "";
                    }
                    if (game_is_shoubing == 1) {
                        gameimggc = result.data.control_pic;
                    } else {
                        gameimggc = "";
                    }
                    if (result.data.save_enabled == 1) {
                        game_mode = 1;
                    } else {
                        game_mode = 2;
                    }
                }
            }
        });
        //当用户登录后，获取用户的存档信息
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Gameajax/last_save',
            data: "game_id=" + game_id,
            success: function (result) {
                if (result.code == 0) {
                    serial_id = result.data.id;
                    if (result.data.save.id != 0) {
                        save_id = result.data.save.id;
                    }
                }
            }
        });
        //加载完后首先获取用户信息
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Accountajax/get_user_info',
            data: "",
            success: function (result) {
                if (result.code == "0") {
                    var user_info = result.data;
                    account_id = user_info.id;
                    device_uuid = user_info.device_info.device_uuid;
                    login_token = user_info.device_info.login_token;
                    nickname = user_info.nickname;
                    user_is_vip = user_info.is_vip;
                    user_is_svip = user_info.is_svip;
                    user_level = user_info.level;
                    if (user_info.is_svip == 1) {
                        user_vip_level = 2;
                    } else if (user_info.is_vip == 1) {
                        user_vip_level = 1;
                    } else {
                        user_vip_level = 0;
                    }
                    gls_client.account_id = account_id;
                    gls_client.device_uuid = device_uuid;
                    gls_client.login_token = login_token;
                    gls_client.nickname = nickname;
                    gls_client.client_ver = "20160303";
                    //如果用户已经登录，则获取用户的游戏剩余时间
                    if (account_id && game_id) {
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: '/index.php/Accountajax/get_game_time',
                            data: "account_id=" + account_id + "&game_id=" + game_id,
                            success: function (result) {
                                if (result.code != "0") {
                                    write_tip_message("网络繁忙，请稍后");
                                    return;
                                } else {
                                    if (result.data.user_game_time == 0) {
                                        if (result.data.play_game_mode == 1) {
                                            $('#j_start_game').html('开始游戏<br>0分钟');
                                            is_start_game = 2;   //  试玩游戏时长结束,请购买游戏
                                        } else {
                                            $('#j_start_game').html('试玩<br>0分钟');
                                            is_start_game = 2;   //  试玩游戏时长结束,请购买游戏
                                        }
                                        $('#j_start_game').css('background-color', '#151515');
                                    } else {
                                        user_s_time = result.data.user_s_time;
                                        if (result.data.play_game_mode == 1) {
                                            $('#j_start_game').html('开始游戏<br>' + result.data.user_game_time);
                                            is_start_game = 1;//用户购买了游戏，切还没到期
                                            payment_type = 4;//用户购买了游戏，启动游戏时的参数
                                        } else {
                                            $('#j_start_game').html('试玩<br>' + result.data.user_game_time + '分钟 &nbsp;&nbsp;<span id="j_try_play_tips" class="h_ico h_ico_3"></span>');
                                            $('#j_try_play_tips').on('mouseover', function () {
                                                $('#try_tips').show();
                                            })
                                            $('#j_try_play_tips').on('mouseout', function () {
                                                $('#try_tips').hide();
                                            })
                                            is_start_game = 3;//用户试玩时间还有剩余
                                            payment_type = 0;//用户处于试玩模式
                                        }
                                        $('#j_start_game').css('background-color', '#151515');
                                    }
                                }
                            }
                        });
                    }
                }
            }
        });

        setTimeout(function () {
            need_login_btn_manage.init();
        }, 300);
        //点击开始游戏按钮
        $('#open_game').bind('click', function () {
            if(is_may_start_game==0){
                return;
            }
            if (is_gls_connect_gls_status = true && player_game == false) {
                //$(this).unbind('click');
                //
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: '/index.php/Gameajax/last_save',
                    data: "game_id=" + game_id,
                    success: function (result) {
                        if (result.code == 0) {
                            serial_id = result.data.id;
                            if (result.data.save.id != -1) {
                                save_id = result.data.save.id;
                                save_is_upload = result.data.save.upload_time;
                            }
                            if (save_id != -1 && save_is_upload == 0) {
                                write_tip_message("最新存档还没有上传成功，请稍后重试或删除该存档");
                                return;
                            }

                            var start_method = store.get('start_method');
                            if('网页'==start_method){
                                console.log('web_start_url:'+'http://www.gloud.cn/'+web_start_game_url);
                                //alert(web_start_game_url);
                                //window.location.href='http://www.gloud.cn/'+web_start_game_url;
                                //window.open(web_start_game_url);
                                gmc_client.urlopenwithie('http://www.gloud.cn/'+web_start_game_url);
                                //$('#j_start_game').html('正在游戏中');
                                //$('#j_start_game').css('background-color', '#b7b7b7');
                            }else{
                                //gmc_client.open_gmc_client();
                                gmc_client.app_open();
                            }

                            //player_game = true;
                            $('#queue_list').hide();
                            $('#j_region_f').hide();
                            //去掉遮罩
                            $("#DivLocker").hide();

                            if('网页'!=start_method) {
                                setTimeout(function () {
                                    gmc_client.gameinfo_query();
                                }, 3000);    //  gmc窗体在运行时,每5秒检测一次是否存在
                            }
                        }
                    }
                });
            } else {
                write_tip_message("迷你客户端没有安装或出现错误");
                return;
            }
            clearInterval(countdown_timer); //停止倒数计时
        });
        //继续游戏按钮
        $('#j_continue_game_btn').bind('click', function () {
            if (is_gls_connect_gls_status = true && player_game == false) {

                //继续游戏支持网页
                var start_method = store.get('start_method');
                if('网页'==start_method){
                    //alert(web_start_game_url);
                    gmc_client.urlopenwithie('http://www.gloud.cn/'+web_start_game_url);
                    return;
                }else{
                    gmc_client.app_open();
                }
                player_game = true;
                $('#queue_list').hide();
                $('#j_region_f').hide();
                //去掉遮罩
                $("#DivLocker").hide();
                setTimeout(function () {
                    gmc_client.gameinfo_quesy();
                }, 3000);    //  gmc窗体在运行时,每5秒检测一次是否存在
            } else {
                write_tip_message("迷你客户端没有安装或出现错误");
                return;
            }
            clearInterval(countdown_timer); //停止倒数计时
        });
        $('#j_restart_game_btn').bind('click', function () {
            gls_user_is_login = 1;
            var select_region_id = store.get('selected_region_id');
            //加入队列操作
            gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);
        });


        //测速界面弹出
        $("#j_region").click(function () {
            var game_text = $("#j_start_game").text();
            if (game_text == '正在游戏中') {
                write_tip_message("正在游戏中，无法切换服务器");
                return;
            }
            $("#DivLocker").show();
            $("#j_region_f").show();
            $("#region_queding").show();
            $("#join_enqueue").hide();
            get_region_data();
            var region_data = store.get('region_data');
            if (region_data == undefined) {
                speed_all_region();
            }
            //如果测速以及加入队列界面显示连接gls
            if (gls_client.sock == null) {
                //链接gls
                gls_client.start();
                gls_login_success_next_step = 2;
            } else {
                if (gls_user_is_login == 1) {
                    gls_client.allRegion();

                } else {
                    gls_client.login();
                    gls_login_success_next_step = 2;
                }
            }
        });
        //点击加入队列按钮
        $("#join_enqueue").click(function () {
            $("#DivLocker").hide();
            $('#j_region_f').hide();
            if (select_region_id == null || select_region_id == undefined) {
                write_tip_message("请先选择服务器");
                return;
            }
            if (gls_client.sock == null) {
                gls_client.start();
                gls_login_success_next_step = 1;
            } else {
                if (gls_user_is_login == 1) {
                    //加入队列操作
                    gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);
                } else {
                    //登录gls
                    gls_client.login();
                    gls_login_success_next_step = 1;
                }
            }
        });
        //按钮重新加入队列
        $("#restart_join_queue").click(function () {
            select_region_id = store.get('selected_region_id');
            if (select_region_id == null || select_region_id == undefined) {
                write_tip_message("请先选择服务器");
                return;
            }
            gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);
            $("#DivLocker").hide();
            $("#restart_queue").hide();
        });
        //点击退出队列按钮
        $("#dequeue").click(function () {
            $("#DivLocker").hide();
            $('#j_region_f').hide();
            $('#queue_list').hide();
            $("#open_game").hide();
            select_region_id = store.get('selected_region_id');
            if (gmc_client.gsip != '') {
                //已经分配gs，可以点击开始游戏
                gls_client.sendConnectGSResult(1, '', select_region_id, game_gs_id, 0, 0);
                clearInterval(countdown_timer); //停止倒数计时
            } else {
                gls_client.dequeue(select_region_id);
                clearInterval(countdown_timer); //停止倒数计时
            }
        });

        //点击队列确定，关闭付
        $("#region_queding").click(function () {
            $("#DivLocker").hide();
            $('#j_region_f').hide();
        });

        //关闭gmc检测
        $("#j_check_gmc_close_x").click(function () {
            $("#DivLocker").hide();
            $('#j_check_gmc_f').hide();
        });
        $("#close_gmc_helper").click(function () {
            $("#DivLocker").hide();
            $('#j_check_gmc_f').hide();
        });
        $("#download_install").click(function () {
            $("#DivLocker").hide();
            $('#j_check_gmc_f').hide();
        });

        //关闭购买时常按钮
        $("#j_buy_game_time_close_x").click(function () {
            $("#DivLocker").hide();
            $('#j_buy_game_time_f').hide();
        });
        $("#j_buy_gamesave_close_x").click(function () {
            $("#DivLocker").hide();
            $('#j_buy_gamesave_f').hide();
        });

        $("#j_queue_list_close_x").click(function () {
            $("#DivLocker").hide();
            $('#j_region_f').hide();
            
            $('#queue_list').hide();
            $("#open_game").hide();

//          select_region_id = store.get('selected_region_id');
//          if (gmc_client.gsip != '') {
//              //已经分配gs，可以点击开始游戏
//              gls_client.sendConnectGSResult(1, '', select_region_id, game_gs_id, 0, 0);
//              clearInterval(countdown_timer); //停止倒数计时
//
//          } else {
//              gls_client.dequeue(select_region_id);
//              clearInterval(countdown_timer); //停止倒数计时
//            }
        });
        $("#j_close_gamesave_use_mode").click(function () {
            $("#DivLocker").hide();
            $('#gamesave_use_mode').hide();
        });
        $("#j_close_delete_gamesave_layer").click(function () {
            $("#DivLocker").hide();
            $('#delete_gamesave_layer').hide();
        });


        $("#j_region_x").click(function () {
            $("#DivLocker").hide();
            $('#j_region_f').hide();
        });

        //使用存档启动游戏
        $("#use_gamesave_btn").click(function () {
            $("#j_buy_gamesave_f").hide();
            $("#gamesave_use_mode").hide();
            if (player_game == true) {
                write_tip_message("您现在正在游戏中");
                return;
            }
            if (is_start_game == 2) {
                $("#DivLocker").show();
                //$('#j_buy_game_time_f').show();
                need_login_btn_manage.getGameTime();
                return;
            }
            need_login_btn_manage.checkgmc();
        });
        //使用存档只读模式启动游戏
        $("#use_gamesave_only_btn").click(function () {
            game_mode = 2;
            $("#j_buy_gamesave_f").hide();
            $("#gamesave_use_mode").hide();
            if (player_game == true) {
                write_tip_message("您现在正在游戏中");
                return;
            }
            if (is_start_game == 2) {
                $("#DivLocker").show();
               	// $('#j_buy_game_time_f').show();
                need_login_btn_manage.getGameTime();
                return;
            }
            need_login_btn_manage.checkgmc();
        });
        //删除存档
        $("#delete_gamesave_btn").click(function () {
            $("#j_buy_gamesave_f").hide();
            $("#gamesave_use_mode").hide();
            //异步删除save
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '/index.php/Accountajax/del_save',
                data: "gameid=" + game_id + "&saveid=" + save_id,
                success: function (result) {
                    if (result.code == 0) {
                        write_tip_message("删除成功", 1);
                        return;
                    } else {
                        write_tip_message("删除失败");
                        return;
                    }
                }
            });
        });
        //删除正在上传的存档
        $("#delete_gamesave_2_btn").click(function () {
            $("#j_buy_gamesave_f").hide();
            $("#delete_gamesave_layer").hide();
            //异步删除save
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '/index.php/Accountajax/del_save',
                data: "gameid=" + game_id + "&saveid=" + save_id,
                success: function (result) {
                    if (result.code == 0) {
                        write_tip_message("删除成功", 1);
                        return;
                    } else {
                        write_tip_message("删除失败");
                        return;
                    }
                }
            });
        });
    });
    //汇报测速结果到服务器方法
    function notice_speed_result(region_id, ping, kbps) {
        //异步获取用户ip
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Accountajax/accept_nettest_result',
            data: "region_id=" + region_id + "&ping=" + ping + "&kbps=" + kbps,
            success: function (result) {
                if (result.code == 0) {
                    return;
                }
            }
        });
    }
    //ajax获取并改变页面上开始游戏按钮状态
    function modify_start_game_by_ajax(account_id, game_id) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '/index.php/Accountajax/get_game_time',
            data: "account_id=" + account_id + "&game_id=" + game_id,
            success: function (result) {
                if (result.code != "0") {
                    write_tip_message("网络繁忙，请稍后");
                    return;

                } else {
                    if (result.data.user_game_time == 0) {
                        if (result.data.play_game_mode == 1) {
                            $('#j_start_game').html('开始游戏');
                            is_start_game = 2;   //  试玩游戏时长结束,请购买游戏
                        } else {
                            $('#j_start_game').html('试玩');
                            is_start_game = 2;   //  试玩游戏时长结束,请购买游戏
                        }
                    } else {
                        if (result.data.play_game_mode == 1) {
                            $('#j_start_game').html('开始游戏<br>' + result.data.user_game_time);
                            is_start_game = 1;//用户购买了游戏，切还没到期
                            payment_type = 4;//用户购买了游戏，启动游戏时的参数
                        } else {
                            $('#j_start_game').html('试玩(' + result.data.user_game_time + '分钟)');
                            is_start_game = 3;//用户试玩时间还有剩余
                            payment_type = 0;//用户处于试玩模式
                        }
                    }
                }
            }
        });
    }
    //根据就不同的测速结果展示不同的样式
    function modify_class_by_speed(region_id, delaytime, mbps) {
        if (mbps != undefined && mbps != null) {
            if (mbps <= 1.5 && mbps > 0) {
                $("#mbps_region_" + region_id).removeClass();
                $("#mbps_region_" + region_id).addClass("xw_top_1_kps3");
            } else if (mbps > 1.5 && mbps < 3) {
                $("#mbps_region_" + region_id).removeClass();
                $("#mbps_region_" + region_id).addClass("xw_top_1_kps2");
            } else {
                $("#mbps_region_" + region_id).removeClass();
                $("#mbps_region_" + region_id).addClass("xw_top_1_kps1");
            }
        }
        if (delaytime != undefined) {
            if (delaytime <= 40) {
                $("#delaytime_region_" + region_id).removeClass();
                $("#delaytime_region_" + region_id).addClass("xw_top_1_client_1_4_font xw_top_1_client_color_1");
            } else if (delaytime > 40 && delaytime < 80) {
                $("#delaytime_region_" + region_id).removeClass();
                $("#delaytime_region_" + region_id).addClass("xw_top_1_client_1_4_font xw_top_1_client_color_2");
            } else {
                $("#delaytime_region_" + region_id).removeClass();
                $("#delaytime_region_" + region_id).addClass("xw_top_1_client_1_4_font xw_top_1_client_color_3");
            }
        }
    }

    //非强制更新，不更新，继续玩游戏
    function constituency() {
        var select_region_id = store.get('selected_region_id');
        if (select_region_id != undefined) {
            if (gls_client.sock == null) {
                gls_login_success_next_step = 1;
                gls_client.start();
                //正在加入队列提示
                $("#check_gmc_prompt").html('请稍等，正在加入队列');
            } else {
                if (gls_user_is_login == 1) {
                    //加入队列操作
                    gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);
                } else {
                    //登录gls
                    gls_client.login();
                    gls_login_success_next_step = 1;
                }
            }
        } else {
            //首先选择线路
            $("#check_gmc_prompt").html("");
            $('#install_gmc_helper').hide();
            $("#close_gmc_helper").hide();
            $("#constituency").hide();
            $('#j_check_gmc_f').hide();
            $('#j_region_f').show();
            $("#region_queding").hide();
            $("#join_enqueue").show();
            //获取每个区域的上次测速信息
            get_region_data();
            if (gls_client.sock == null) {
                gls_client.start();
                gls_login_success_next_step = 1;
            } else {
                if (gls_user_is_login == 1) {
                    //加入队列操作
                    gls_client.enqueue(select_region_id, game_id, game_mode, payment_type, save_id, serial_id);
                } else {
                    //登录gls
                    gls_client.login();
                    gls_login_success_next_step = 1;
                }
            }
        }
    }
    //向gmchelp发送信息，更新客户端
    function update_gmc() {
        gmc_client.update_update();
        $("#install_gmc_helper").hide();
    }
    $('#j_try_play_tips').mouseover(function () {

    })
</script>
  </body>
</html>
