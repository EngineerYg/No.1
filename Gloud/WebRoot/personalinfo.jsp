<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="g"%> %>
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
	<link rel="stylesheet" href="css/info/style.css" />
	<link rel="stylesheet" href="css/info/style1.css" />
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
    <!-- 面包屑 -->
    <div class="bread_nav">
        <a href="#" title="首页">首页</a> - <a href="" title="账号信息">账号信息</a>
    </div>
    <!-- 账号信息 -->
    <div class="user_card">
        <div class="user_info border_box">
            <h3 class="game_tips">基本信息</h3>
            <!--账户头像-->
            <form class="submit_form" method="post" action="#" target="exec_target" enctype="multipart/form-data">
	            <dl class="user_info_dl" id="height">
	                <dt class="user_info_dl_tips" style="position:relative;">
	                    <img src="images/personalInfo/0e0cc060a35d5d0e311e8765279bc0ad.png" class="user_info_tx" alt="头像" id="user_head_src">
	                    <img src="images/personalInfo/no_all_custom.png" alt="未定义" id="j_custom" class="inputfile">
	                </dt>
	                <dd class="user_info_dl_mate user_name">
	                    <div class="user_tips">
	                        <p class="user_name">
	                            <span class="break">
	                                ID: 2288970                            </span>
	                        </p>
	                    </div>
	                    <div class="user_tips_eidt" id="j_set_avatar_tips"><a href="#" title="更换头像" class="user_eidt user_top">更换头像</a>
	                    </div>
	                </dd>
	            </dl>
            </form>
            <!--账户昵称-->
            <dl class="user_info_dl">
                <dt class="user_info_dl_tips">
                    昵称：
                </dt>
                <dd class="user_info_dl_mate">
                    <div class="user_tips">
                        <div class="user_list">
                            <p class="user_list_m"><input type="text" id="j_nickname_input" class="u_input_t" value="妖哥" maxlength="12">
                            </p>
                        </div>
                    </div>
                    <div class="user_tips_eidt"><a href="javascript:;" title="修改昵称" class="user_eidt" id="j_nickname" onclick="">更改资料</a>
                    </div>
                </dd>
            </dl>
            <!--绑定手机-->
            <dl class="user_info_dl">
                <dt class="user_info_dl_tips">
                    绑定手机：
                </dt>
                <dd class="user_info_dl_mate">
                    <div class="user_tips">
                        <div class="user_list">
                            <p class="user_list_m"><input type="text" class="u_input_t" value="130****3722" readonly="readonly" disabled="disabled">
                            </p>
                        </div>
                    </div>
                                    </dd>
            </dl>
            <!--绑定邮箱-->
            <dl class="user_info_dl">
                <dt class="user_info_dl_tips">
                    绑定邮箱：
                </dt>
                <dd class="user_info_dl_mate">
                    <div class="user_tips">
                        <div class="user_list">
                            <p class="user_list_m"><input type="text" class="u_input_t" id="user_bind_email" readonly="readonly">
                            </p>
                        </div>
                    </div>
                                                <div class="user_tips_eidt"><a href="#" title="立即绑定" class="user_eidt" id="j_email">立即绑定</a></div>                </dd>
            </dl>
            <!--绑定微信号-->
            <!-- <dl class="user_info_dl">
                 <dt class="user_info_dl_tips">
                     绑定微信：
                 </dt>
                 <dd class="user_info_dl_mate">
                     <div class="user_tips">
                         <div class="user_list">
                             <p class="user_list_m"><input type="text" class="u_input_t" value="格来云游戏"/></p>
                         </div>
                     </div>
                     <div class="user_tips_eidt"><a href="#" title="立即绑定" class="user_eidt">立即绑定</a></div>
                 </dd>
             </dl>-->
            <!--账号安全-->
            <dl class="user_info_dl">
                <dt class="user_info_dl_tips">
                    账号安全：
                </dt>
                <dd class="user_info_dl_mate">
                    <div class="user_tips">
                        <p class="user_star">
                            <img src="images/personalInfo/satr_1.png" alt="安全1">
                            <img src="images/personalInfo/satr_1.png" alt="安全1">
                            <img src="images/personalInfo/satr_1.png" alt="安全1">
                            <img src="images/personalInfo/satr_2.png" alt="安全2">
                            <img src="images/personalInfo/satr_2.png" alt="安全2">                        </p>
                    </div>
                    <div class="user_tips_eidt" id="j_change_psw">
                                                    <a href="#" title="修改密码" class="user_eidt">修改密码</a>                    </div>
                </dd>
            </dl>
            <!--账号等级-->
            <dl class="user_info_dl">
                <dt class="user_info_dl_tips">
                    账号等级：
                </dt>
                <dd class="user_info_dl_mate">
                    <div class="user_tips">
                        <div class="user_loading_card">
                            <p class="user_loading_line" style=" width:0%"></p>

                            <p class="user_loading_lv">LV0</p>
                            <p class="user_loading_num">0/1000</p>
                                
                        </div>
                    </div>
                    <div class="user_tips_eidt"><a href="javascript:;" title="修改昵称" class="user_eidt" id="j_level_rule">升级规则</a>
                    </div>
                </dd>
            </dl>
        </div>

        <div class="user_main_cont">
            <div class="u_card border_box num_top">
                <h3 class="game_tips">
            	钱包
                    <div class="u_right_title">
                        <img src="images/personalInfo/user_qb.png" class="u_right_title_img" alt="钱包图标">
                    </div>
                </h3>
                <!--<div class="u_charge_btn">
                    <a href="#" title="立即充值" class="u_charge_btn_a">
                        立即充值
                    </a>
                    <p>
                        账户余额：<span> 0G币</span>
                    </p>
                </div>-->
                <div class="u_charge_btn">
		            <a href="#" title="立即充值" class="u_charge_btn_a">
		                <img src="images/personalInfo/user_g_ico.png" alt="">
		                <span>0</span>
		                <i class="mon_btn">充值</i>
		            </a>
		            <a href="#" title="立即充值" class="u_charge_btn_a">
		                <img src="images/personalInfo/user_yb.png" alt="">
		                <span>26581</span>
		                <i class="mon_btn">获取</i>
		            </a>
		        </div>
            </div>

            <div class="u_card border_box num_top num_even">
                <h3 class="game_tips">
                    会员
                    <div class="u_right_title">
                        <img src="images/personalInfo/user_hy.png" class="u_right_title_img" alt="会员图标">
                    </div>
                </h3>

                <div class="u_vip_btn_left">
                        <a href="#" title="续费" class="huiyuan">
                            格来会员 VIP
                        </a>
                        <p>包月600G(6元)</p>
                        <p>乐享众多功能特权</p>
                </div>

                <div class="u_vip_btn_right">
                    <a href="#" title="了解特权" class="huiyuan">
                        超级会员 SVIP
                    </a>
                    <p>包月1800G(18元)</p>
                    <p>尊享最极致的服务</p>
                </div>
            </div>


            <div class="u_card border_box">
                <h3 class="game_tips">
                    任务
                    <div class="u_right_title">
                        <img src="images/personalInfo/user_rw.png" class="u_right_title_img" alt="任务图标">
                    </div>
                </h3>
                
                <ul class="u_user_items">
		            <li>
		                <p class="u_user_items_pic">
		                    <img src="images/personalInfo/user_yg.png" alt="">
		                </p>
		                <div class="u_user_items_info">
		                    <h5>签到领经验</h5>
		                    <a href="#" title="" class="u_user_items_info_btn">前往</a>
		                </div>
		            </li>
		            <!--<li>
		                <p class="u_user_items_pic">
		                    <img src="images/personalInfo/user_yg2.png" alt="">
		                </p>
		                <div class="u_user_items_info">
		                    <h5>任务赚云贝</h5>
		                    <a href="#" title="" class="u_user_items_info_btn">前往</a>
		                </div>
		            </li>-->
		        </ul>
		        
                <!--<div class="u_charge_code">
                    <p class="u_charge_code_p"><input type="text" placeholder="输入16位兑换码" class="u_charge_code_input" value="" id="charge_code_input" onkeyup="value=value.replace(/\D/g,&#39;&#39;)"></p>
                </div>
                <div class="u_charge_btn xw_m_top">
                    <a href="#" id="charge_code_no_btn" title="确定" class="u_charge_btn_a">
                        确定
                    </a>
                </div>
                <div class="u_m_t_r" id="j_exchange">
                    <img src="images/personalInfo/question.png" alt="问题反馈">
                </div>-->
            </div>
            <div class="u_card border_box num_even">
                <h3 class="game_tips">账单
                    <div class="u_right_title">
                        <img src="images/personalInfo/user_zd.png" class="u_right_title_img" alt="title_img">
                    </div>
                </h3>
                <div class="u_charge_btn">
		            <a href="#" title="消费记录" style="text-align: center" class="u_charge_btn_a">消费记录</a>
		            <a href="#" title="充值记录" style="text-align: center" class="u_charge_btn_a">充值记录</a>
		        </div>
            </div>
        </div>
    </div>
</section>

<!--包含设置头像浮层-->
<!-- 弹出层 5    选择头像 -->
<div class="xw_top_second" style="display:none; z-index:10001;width:6.3rem; margin-left:-3.15rem;" id="j_head_f">
    <!--   显示窗体的具体位置-->
    <div class="xw_top_head">
        <!-- 弹窗的头部-->
        <div class="xw_top_5_head_main">
            <!-- 弹窗的头部内容样式-->
            <span class="xw_top_head_title">
                <!-- 弹窗标题-->请选头像</span>

            <div class="xw_top_head_close" id="j_head_x">
                <img class="layer_btn_x" src="images/personalInfo/close.png" alt="close">
            </div>
            <!-- 弹窗头部关闭--> </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_5_main">
        <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <div class="xw_top_5_main_m" style="">
                <div class="xw_top_5_main_m_div">
                                                <dt class="xw_top_5_dt" id="user_head_1822">
                                    <img src="images/personalInfo/dd14dd009e145de8eb944289745f0643.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1823">
                                    <img src="images/personalInfo/8a5c7cde9209be7438331bc802d66bd9.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1824">
                                    <img src="images/personalInfo/616ac3dc0f8b9ef4eade65f45d7f341f.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1825">
                                    <img src="images/personalInfo/f60c2b463a68695faad6ac9f071d5259.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1826">
                                    <img src="images/personalInfo/a76562baf59afcf189eefc1be80720e6.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1827">
                                    <img src="images/personalInfo/3a3e31465cfbdb95dcce932c1c1b8bc0.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1828">
                                    <img src="images/personalInfo/0e2d5ba3d617f29fa4dba5435477e883.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1829">
                                    <img src="images/personalInfo/3d8fcc7464f04983e4abf9f4f009f01d.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1830">
                                    <img src="images/personalInfo/8b8916d6535911e5c9b197e5eccf91fc.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1831">
                                    <img src="images/personalInfo/4c81b61591c288286ead29a275924393.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1832">
                                    <img src="images/personalInfo/baf3e678249a1d6a1730522e75bd6513.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1833">
                                    <img src="images/personalInfo/6229202fde4c1aed86b33c37b6e3735d.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1834">
                                    <img src="images/personalInfo/474d140f9e411de91b353f5d07868998.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1835">
                                    <img src="images/personalInfo/40af5a43d38d9ba37fc856fb69b72c93.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1836">
                                    <img src="images/personalInfo/c0e9021a98f13af1e52573e74987216b.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1837">
                                    <img src="images/personalInfo/d6e1bdb50c0b19c356580644c0836a5d.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1838">
                                    <img src="images/personalInfo/0e0cc060a35d5d0e311e8765279bc0ad.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1839">
                                    <img src="images/personalInfo/3fec300304f8f084a834e93ae77fd867.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1840">
                                    <img src="images/personalInfo/6d1184fb92f3b43eb3b2c6f487480f79.png" class="xw_top_5_img" alt="top_5_img">
                                </dt><dt class="xw_top_5_dt" id="user_head_1841">
                                    <img src="images/personalInfo/3415ed8a60273756da10d583de2e03c3.png" class="xw_top_5_img" alt="top_5_img">
                                </dt>                    </div>
                </div>
                <div class="xw_top_5_div">
                    <div class="xw_top_5_div_btn">
                        <input type="hidden" name="head_id" id="j_user_head_id" value="">
                        <div class="xw_top_5_div_span" id="j_set_user_head">确定</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--包含设置头像tips浮层-->
<!-- 账号中心界面，点击问号 出现兑换提示弹窗-->
<style type="text/css">
    .dandu>p{margin-top: 0.1rem}
</style>
<div class="xw_charge_top" style="display:none;z-index:10001;" id="j_set_avatar_tips_f"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
    
        <div class="xw_top_head_main" style="margin-bottom:0.05rem;"><!-- 弹窗的头部内容样式-->
            <span class="xw_top_head_title"><!-- 弹窗标题-->
                提示
            </span>
            <div class="xw_top_head_close" id="j_set_avatar_tips_x"> 
                <img class="layer_btn_x" src="images/personalInfo/close.png" alt="close">
             </div> <!-- 弹窗头部关闭-->
        </div>
    </div>
     <!-- 弹出 中部内容 控制-->
    <div class="xw_handle_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list xw_duihuan_tips dandu">   
            <p>亲，修改头像是会员特权。</p>
        </div>
        <div class="xw_handle_return_btn" style="cursor:pointer;margin-left: 0rem">
            <div class=" xw_charge_duihuan_btn_div" style="margin-left: 0.1rem" onclick="close_all_layer(j_set_avatar_tips_f,1)">
                关闭
            </div>
            <a href="http://www.gloud.cn/index.php/vip_index/vip_index.html" class=" xw_charge_duihuan_btn_div" style="float: right;margin-right: 0.1rem">
                开通会员
            </a>
        </div>
    </div>
</div>
<!--包含设置自定义头像提示浮层-->
<!-- 账号中心界面，点击问号 出现兑换提示弹窗-->
<style type="text/css">
    .dandu>p{margin-top: 10px;}
</style>
<div class="xw_charge_top" style="display:none;z-index:10001;" id="j_custom_f"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
    
        <div class="xw_top_head_main" style="margin-bottom:0.05rem;"><!-- 弹窗的头部内容样式-->
            <span class="xw_top_head_title"><!-- 弹窗标题-->
                提示
            </span>
            <div class="xw_top_head_close" id="j_custom_x"> 
                <img class="layer_btn_x" src="images/personalInfo/close.png" alt="close">
             </div> <!-- 弹窗头部关闭-->
        </div>
    </div>
     <!-- 弹出 中部内容 控制-->
    <div class="xw_handle_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list xw_duihuan_tips dandu">   
            <p>亲，自定义头像是超级会员特权。</p>
        </div>
        <div class="xw_handle_return_btn" style="cursor:pointer;margin-left: 0rem">
            <div class=" xw_charge_duihuan_btn_div" onclick="close_all_layer(j_custom_f,1)">
                关闭
            </div>
            <a href="#" class=" xw_charge_duihuan_btn_div" style="float: right;margin-right: 0.1rem">
                开通SVIP
            </a>
        </div>
    </div>
</div>
<!--包含绑定邮箱浮层-->
<!-- 绑定邮箱  end-->
<div class="xw_top_first" style="display:none;z-index:10001" id="j_email_f"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_head_main"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				绑定邮箱
			</span>
            <span class="xw_top_head_close" id="j_email_x"> <img class="layer_btn_x" src="images/personalInfo/close_focus.png" alt="close"></span> <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m">
                <p class="xw_top_main_m_cdn">
                    <input type="text" id="bind_email" name="bind_email" placeholder="邮箱号" class="xw_top_main_m_input">
                </p>
            </div>
            <p class="xw_top_main_m_waring" style="display: none">请输入正确的邮箱</p>
        </div>
        <!-- 图形验证码 -->
        <div class="h_reg_info common_checkcode_div" id="common_checkcode_div1">
            <div class="h_reg_list h_reg_50 com_common_verify_code">
                <p class="h_reg_list_m" id="checkcode_p">
                    <input class="h_reg_input_t email_verify_code" id="email_verify_code1" data="1" type="text" name="email_verify_code" style="color:#fff;font-weight: 600" placeholder="请输入验证码">
                </p>
            </div>
            <div class="h_reg_checkcode">
                <img width="100%" height="100%" alt="验证码" src="images/personalInfo/create_verify_code.html" title="点击刷新">
            </div>
            <p class="h_reg_tips" id="email_checkcode_error_messages1"></p>
        </div>
        <!-- 图形验证码end -->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m" style="width:1.32rem;">
                <p class="xw_top_main_m_cdn">
                    <input type="text" value="" placeholder="请输入验证码" class="xw_top_main_m_input">
                </p>
            </div>
            <a href="http://www.gloud.cn/index.php/account/index.html#" title="发送验证码" class="xw_h_reg_code" id="j_email_s">发送验证码</a>

            <p class="xw_top_main_m_waring" style="display: none">请输入正确的验证码</p>
        </div>
        <div class="xw_top_main_btn" style="cursor:pointer;">
            <a href="http://www.gloud.cn/index.php/account/index.html#" class="xw_top_main_btn_a" title="绑定" id="j_email_b">绑定</a>
        </div>
    </div>
</div>
<!-- 验证绑定邮箱  end-->
<div class="xw_top_first" style="display:none;z-index:10001" id="check_bind_email"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_head_main"><!-- 弹窗的头部内容样式-->
            <span class="xw_top_head_title"><!-- 弹窗标题-->
                验证绑定邮箱
            </span>
            <span class="xw_top_head_close" id="check_bind_email_x"> <img class="layer_btn_x" src="images/personalInfo/close_focus.png" alt="close"></span> <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m">
                <p class="xw_top_main_m_cdn">
                    <input type="text" id="checked_bind_email" disabled="disabled" name="bind_email" placeholder="邮箱号" style="color:#fff;font-weight: 600" class="xw_top_main_m_input">
                </p>
            </div>
            <p class="xw_top_main_m_waring" style="display: none">请输入正确的邮箱</p>
        </div>
        <!-- 图形验证码 -->
        <div class="h_reg_info common_checkcode_div" id="common_checkcode_div2">
           <div class="h_reg_list h_reg_50 com_common_verify_code">
               <p class="h_reg_list_m" id="checkcode_p">
                   <input class="h_reg_input_t email_verify_code" id="email_verify_code2" data="2" type="text" name="email_verify_code" style="color:#fff;font-weight: 600" placeholder="请输入验证码">
               </p>
           </div>
           <div class="h_reg_checkcode">
               <img width="100%" height="100%" alt="验证码" src="css/personalInfo/create_verify_code.html" title="点击刷新">
           </div>
           <p class="h_reg_tips" id="email_checkcode_error_messages2"></p>
        </div>
        <!-- 图形验证码end -->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m" style="width:1.32rem;">
                <p class="xw_top_main_m_cdn">
                    <input type="text" id="verify_code_email" value="" placeholder="请输入验证码" class="xw_top_main_m_input">
                </p>
            </div>
            <a href="http://www.gloud.cn/index.php/account/index.html#" title="发送验证码" class="xw_h_reg_code" id="j_email_se">发送验证码</a>

            <p class="xw_top_main_m_waring" style="display: none">请输入正确的验证码</p>
        </div>
        <div class="xw_top_main_btn" style="cursor:pointer;">
            <a href="http://www.gloud.cn/index.php/account/index.html#" class="xw_top_main_btn_a" title="绑定" id="j_email_b_next">下一步</a>
        </div>
    </div>
</div>

<!--包含绑定手机浮层-->
<!-- 绑定手机  end-->
<div class="xw_top_first" style="display:none;z-index:10001" id="j_phone_f"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_head_main"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				绑定手机
			</span>
            <span class="xw_top_head_close" id="j_phone_x"> <img class="layer_btn_x" src="images/personalInfo/close.png" alt="close"></span> <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m">
                <p class="xw_top_main_m_cdn">
                    <input type="text" id="bind_phone" name="bind_phone" placeholder="手机号" class="xw_top_main_m_input">
                </p>
            </div>
            <p class="xw_top_main_m_waring" style="display: none">请输入正确的手机号</p>
        </div>
        <!-- 图形验证码 -->
        <div class="h_reg_info common_checkcode_div" id="common_checkcode_div3">
           <div class="h_reg_list h_reg_50 com_common_verify_code">
               <p class="h_reg_list_m" id="checkcode_p3">
                   <input class="h_reg_input_t email_verify_code" id="email_verify_code3" data="3" type="text" name="email_verify_code" style="color:#fff;font-weight: 600" placeholder="请输入验证码">
               </p>
           </div>
           <div class="h_reg_checkcode">
               <img width="100%" height="100%" alt="验证码" src="css/personalInfo/create_verify_code.html" title="点击刷新">
           </div>
           <p class="h_reg_tips" id="email_checkcode_error_messages3"></p>
        </div>
        <!-- 图形验证码end -->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m" style="width:1.32rem;">
                <p class="xw_top_main_m_cdn">
                    <input type="text" value="" placeholder="请输入密码" class="xw_top_main_m_input">
                </p>
            </div>
            <a href="http://www.gloud.cn/index.php/account/index.html#" title="发送验证码" class="xw_h_reg_code" id="j_phone_s">发送验证码</a>

            <p class="xw_top_main_m_waring" style="display: none">请输入正确的验证码</p>
        </div>
        <div class="xw_top_main_btn" style="cursor:pointer;">
            <a href="http://www.gloud.cn/index.php/account/index.html#" class="xw_top_main_btn_a" title="绑定" id="j_phone_b">绑定</a>
        </div>
    </div>
</div>
<!-- 绑定验证手机  end-->
<div class="xw_top_first" style="display:none;z-index:10001" id="check_bind_phone"><!--   显示窗体的具体位置-->
    <div class="xw_top_head">  <!-- 弹窗的头部-->
        <div class="xw_top_head_main"><!-- 弹窗的头部内容样式-->
            <span class="xw_top_head_title"><!-- 弹窗标题-->
                验证绑定手机
            </span>
            <span class="xw_top_head_close" id="check_bind_phone_x"> <img class="layer_btn_x" src="images/personalInfo/close.png" alt="close"></span> <!-- 弹窗头部关闭-->
        </div>
    </div>
    <!-- 弹出 中部内容 控制-->
    <div class="xw_top_main">    <!--  中部内容 边距控制-->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m">
                <p class="xw_top_main_m_cdn">
                    <input type="text" id="checked_bind_phone" disabled="disabled" name="bind_phone" placeholder="手机号" class="xw_top_main_m_input" style="color:#fff;font-weight: 600">
                </p>
            </div>
            <p class="xw_top_main_m_waring" style="display: none">请输入正确的手机号</p>
        </div>
        <!-- 图形验证码 -->
        <div class="h_reg_info common_checkcode_div" id="common_checkcode_div4">
           <div class="h_reg_list h_reg_50 com_common_verify_code">
               <p class="h_reg_list_m" id="checkcode_p4">
                   <input class="h_reg_input_t email_verify_code" id="email_verify_code4" data="4" type="text" name="email_verify_code" style="color:#fff;font-weight: 600" placeholder="请输入验证码">
               </p>
           </div>
           <div class="h_reg_checkcode">
               <img width="100%" height="100%" alt="验证码" src="css/personalInfo/create_verify_code.html" title="点击刷新">
           </div>
           <p class="h_reg_tips" id="email_checkcode_error_messages4"></p>
        </div>
        <!-- 图形验证码end -->
        <div class="xw_top_main_list">
            <div class="xw_top_main_m" style="width:1.32rem;">
                <p class="xw_top_main_m_cdn">
                    <input type="text" id="verify_code_phone" placeholder="请输入验证码" class="xw_top_main_m_input">
                </p>
            </div>
            <a href="http://www.gloud.cn/index.php/account/index.html#" title="发送验证码" class="xw_h_reg_code" id="j_phone_se">发送验证码</a>

            <p class="xw_top_main_m_waring" id="verify_code_phone" style="display: none">请输入正确的验证码</p>
        </div>
        <div class="xw_top_main_btn">
            <a href="http://www.gloud.cn/index.php/account/index.html#" class="xw_top_main_btn_a" title="绑定" id="j_phone_b_next">下一步</a>
        </div>
    </div>
</div>

<!--包含对换提示浮层-->
<!-- 账号中心界面，点击问号 出现兑换提示弹窗-->
<div class="xw_charge_top" style="display:none;z-index:10001" id="j_exchange_f"><!--   显示窗体的具体位置-->
	<div class="xw_top_head">  <!-- 弹窗的头部-->
	
		<div class="xw_top_head_main" style="margin-bottom:0.05rem;"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				兑换规则
			</span>
			<div class="xw_top_head_close" id="j_exchange_x"> 
				<img class="layer_btn_x" src="images/personalInfo/close.png" alt="close">
			 </div> <!-- 弹窗头部关闭-->
		</div>
	</div>
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_handle_main">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list xw_duihuan_tips">   
			<p>1.输入16位数字兑换码，即可领取兑换券内容。</p>
			<p>2.每个兑换券都有使用次数限制，请参考领取说明使用。</p><p>
			</p><p>3.兑换券可兑换游戏时长包、云贝、经验、游戏等。</p><p>
			</p><p>4.如兑换出现问题，请联系客服。</p><p>
		</p></div>
		<div class="xw_handle_return_btn" style="cursor:pointer;">
			<div class=" xw_charge_duihuan_btn_div" onclick="close_all_layer(j_exchange_f,1)">
				关闭
			</div>
		</div>
	</div>
</div>
<!--包含升级规则提示浮层-->
<!-- 账号中心界面，点击问号 出现兑换提示弹窗-->
<style type="text/css">
	.dandu>p{margin-top: 10px}
</style>
<div class="xw_charge_top" style="display:none; z-index:10001; height:302px; line-height:18px ; text-align: center;width: 702px;left: 30%;top: 40%;font-size:20px;" id="j_level_f"><!--   显示窗体的具体位置-->
	<div class="xw_top_head">  <!-- 弹窗的头部-->
	
		<div class="xw_top_head_main" style="margin-bottom:0.05rem;"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
				升级规则
			</span>
			<div class="xw_top_head_close" id="j_level_x"> 
				<img class="layer_btn_x" src="images/personalInfo/close.png" alt="close">
			 </div> <!-- 弹窗头部关闭-->
		</div>
	</div>
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_handle_main">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list xw_duihuan_tips dandu" style="height: 103px; font-size: 18px; line-height: 35px; margin-top: 75px;">   
			<p>1. 游戏在线可获得经验。VIP帐号获取经验X1.5倍，SVIP帐号获取经验X2倍。</p>
			<p>2. 消耗G币可获得经验。</p><p>
			</p><p>3. 帐号等级越高，特权福利越多，敬请期待！</p><p>
		</p></div>
		<div id="close" class="xw_handle_return_btn" style="cursor:pointer;">
			<div class=" xw_charge_duihuan_btn_div" style="margin-left: 140px; width: 160px; height: 42px; line-height: 42px; font-size: 18px; margin-top: 30px;"
					 onclick="close_all_layer(j_level_f,1)">
				关闭
			</div>
		</div>
	</div>
</div>

<!--账号弹窗 账号-更改资料-->
<form action="#" method="post" name="reg_testdate">
	<div class="updata_fixed" id="j_change_info_f" style="display: none; z-index:10001;">
	    <div class="th_td">更改资料</div>
	    <div class="th_bd">
	        <dl>
	            <!-- 会员 -->
	            <dl>
	                <dt>昵称：</dt>
	                <dd>
	                <input class="text" id="nickname" maxlength="12" placeholder="这里的昵称最多是十二个字 " value="妖哥" type="text">
	                                </dd>
	                            </dl>
	            <dl id="gender_change">
	                <dt>性别：</dt>
	                <dd id="gender">
	                    <label><input type="radio" name="sex" checked="checked" value="2">我是男神</label>
	                    <label><input type="radio" name="sex" value="1">我是女神</label>
	                </dd>
	            </dl>
	                <input name="" id="is_gender" value="1" type="hidden">
	            	<dl id="bir_change">
		                <dt>生日：</dt>
		                <dd>
		                    <select name="YYYY" id="year" onChange="YYYYDD(this.value)">
		                    	<option value="">--</option>
		                    </select>
		                    <select name="MM" id="month" onchange="MMDD(this.value)">
		                    	<option value="">--</option>
		                    </select>
		                    <select name="DD" id="day">
		                    	<option value="">--</option>
		                    </select>
		                </dd>
		            </dl>
	                <input name="" id="is_bir" value="1" type="hidden">
	                            <dl>
	                <dt>签名：</dt>
	                <dd>
	                                    <textarea id="motto" placeholder="最多输入50个字 " maxlength="50"></textarea>                    
	                                    <h2 class="info"><img src="images/personalInfo/ichy_66.png">请认真填写个人资料</h2>
	                </dd>
	            </dl>
	        </dl>
	        <div class="btn">
	            <a href="#" class="sure_btn" id="j_change_info_s">确定</a>
	            <a href="#" id="close_info" class="cancel_btn" onclick="close_all_layer(j_change_info_f,1)">取消</a>
	        </div>
	    </div>
	    <a href="javascript:;" class="close_btn" id="j_level_x_c"></a>
	</div>
</form>
<script language="JavaScript">   
	function YYYYMMDDstart(){   
		MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];   
		
		//先给年下拉框赋内容   
		var y  = new Date().getFullYear();  
		for (var i = (y-30); i < (y+30); i++) //以今年为准，前30年，后30年   
			   document.reg_testdate.YYYY.options.add(new Option(" "+ i, i));   
		
		//赋月份的下拉框   
		for (var i = 1; i < 13; i++)   
			   document.reg_testdate.MM.options.add(new Option(" " + i, i));   
		
		document.reg_testdate.YYYY.value = y;   
		document.reg_testdate.MM.value = new Date().getMonth() + 1;   
		var n = MonHead[new Date().getMonth()];   
		if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;   
			writeDay(n); //赋日期下拉框Author:meizz   
		document.reg_testdate.DD.value = new Date().getDate();   
	}   
	if(document.attachEvent)   
		window.attachEvent("onload", YYYYMMDDstart);   
	else   
	window.addEventListener('load', YYYYMMDDstart, false);   
	function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)   
	{   
		var MMvalue = document.reg_testdate.MM.options[document.reg_testdate.MM.selectedIndex].value;   
		if (MMvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
		var n = MonHead[MMvalue - 1];   
		if (MMvalue ==2 && IsPinYear(str)) n++;   
		writeDay(n)   
	}   
	function MMDD(str)   //月发生变化时日期联动   
	{   
		var YYYYvalue = document.reg_testdate.YYYY.options[document.reg_testdate.YYYY.selectedIndex].value;   
		if (YYYYvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
		var n = MonHead[str - 1];   
		if (str ==2 && IsPinYear(YYYYvalue)) n++;   
		writeDay(n)   
	}   
	function writeDay(n)   //据条件写日期的下拉框   
	{   
		var e = document.reg_testdate.DD; optionsClear(e);   
		for (var i=1; i<(n+1); i++)   
		e.options.add(new Option(" "+ i, i));   
	}   
	function IsPinYear(year)//判断是否闰平年   
	{
		return(0 == year%4 && (year%100 !=0 || year%400 == 0));
	}   
	function optionsClear(e)   
	{   
		e.options.length = 1;   
	}   
</script>
<script type="text/javascript">

	//点击确定提交  待定
	$("#j_change_info_s").click(function(){
		$('#DivLocker').hide();
		$("#j_change_info_f").hide();
	});
	
	$("#close_info").click(function(){
		$('#DivLocker').hide();
		$("#j_change_info_f").hide();
	});
</script>
<script type="text/javascript">
	$("#j_nickname").click(function(){
		$('#DivLocker').show();
		$("#j_change_info_f").show();
	});
</script>
<script type="text/javascript">
        //显示升级规则
    $("#j_level_rule").click(function () {
        $('#DivLocker').show();
        $("#j_level_f").show();
    });
    $("#j_level_x").click(function () {
        $('#DivLocker').hide();
        $("#j_level_f").hide();
    });
    $(function(){
    	$("#close").click(function(){
    	 $('#DivLocker').hide();
    		$("#j_level_f").hide();
    	});
    })
</script>
<!-- 页尾 -->
<!--选区测速浮层-->
<link rel="stylesheet" type="text/css" href="css/personalInfo/layer.css">
    <link rel="stylesheet" type="text/css" href="css/personalInfo/jquery.mCustomScrollbar.css">
      
  
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
