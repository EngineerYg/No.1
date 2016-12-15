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
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/content.css"/>
	<link rel="stylesheet" type="text/css" href="css/headerAfooter.css"/>
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" type="text/css" href="css/help.css" />
	<link rel="stylesheet" href="css/layer.css" />
    <link rel="stylesheet" href="js/jquery.css" />
    
     <script type="text/javascript" src="js/hm.js" ></script>
    <script type="text/javascript" src="js/jquery-1.7.2.js" ></script>

	<script type="text/javascript" src="js/hm.js"></script>
   
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/sw_ua.js"></script>
    <script type="text/javascript" src="js/check_ua.js"></script>
    <script type="text/javascript" src="js/store.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script  type="text/javascript" src="js/nav.js"></script>
    <script  type="text/javascript" src="js/rem_1366.js"></script>
     <script type="text/javascript" type="text/javascript" src="js/login.js" ></script>
    <script type="text/javascript" src="js/jquery_002.js" ></script>
    <script type="text/javascript" src="js/reg.js" ></script>
    <script type="text/javascript" src="js/footer.js" ></script>
    <script type="text/javascript" src="js/index.js" ></script>  
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

<link rel="stylesheet" type="text/css" href="js/jquery.css">
<title>测试REM</title>
	<!-- 内容 -->
	<section class="main_card" style="margin-top:30px;">
		<!-- 面包屑 -->
		<div class="bread_nav">
			<a href="index.php" title="首页">首页</a> - <a href="#" title="帮助">帮助</a>
		</div>
		<!-- 帮助界面 -->


		<div class="help_card">
			<div class="help_info border_box">
				<h3 class="help_tips">
					<img src="images/help_always_question.png" class="help_right_title_img"> 常见问题
				</h3>
                <ul class="help_list_nav_item j_tap_box">
                    <li><a href="javascript:;" title="格来云游戏" class="help_list_nav on">格来云游戏</a></li>
                    <li><a href="javascript:;" title="帐号" class="help_list_nav">帐号</a></li>
                    <li><a href="javascript:;" title="资金" class="help_list_nav">资金</a></li>
                    <li><a href="javascript:;" title="游戏启动" class="help_list_nav">游戏启动</a></li>
                    <li><a href="javascript:;" title="游戏运行" class="help_list_nav">游戏运行</a></li>
                    <li><a href="javascript:;" title="其他" class="help_list_nav">其他</a></li>
                </ul>
                
                <div class="help_m_info j_tap_nav">

       				<div style="display:block">
                        <a href="javascript:;" title="格来云游戏PC网页版" class="on">格来云游戏PC网页版</a> | 
                        <a href="javascript:;" title="关于格来云游戏">关于格来云游戏</a> | 
                        <a href="javascript:;" title="体验更多游戏">体验更多游戏</a>
                    </div>
					
                    <div>
                        <a href="javascript:;" title="注册和登录" class="on">注册和登录</a> | 
                        <a href="javascript:;" title="帐号安全">帐号安全</a> | 
                        <a href="javascript:;" title="会员问题">会员问题</a> | 
                        <a href="javascript:;" title="经验和等级">经验和等级</a>
                    </div>
                    
                    <div>
                    	<a href="javascript:;" title="充值问题" class="on">充值问题</a> | 
                        <a href="javascript:;" title="G币问题">G币问题</a> | 
                    	<a href="javascript:;" title="云贝问题">云贝问题</a>
                    </div>
                    <div>
                        <a href="javascript:;" title="无法购买游戏" class="on">无法购买游戏</a> | 
                        <a href="javascript:;" title="不能开始游戏">不能开始游戏</a> |  
                        <a href="javascript:;" title="排队问题">排队问题</a> | 
                        <a href="javascript:;" title="存档问题">存档问题</a>
                    </div>
                    <div>
                        <a href="javascript:;" title="游戏画面卡顿" class="on">游戏画面卡顿</a> | 
                        <a href="javascript:;" title="游戏中途断开">游戏中途断开</a>
                    </div>
                    <div>
                        <a href="javascript:;" title="实物手柄" class="on">实物手柄</a> | 
                        <a href="javascript:;" title="更多问题">更多问题</a>
                    </div>
				</div>
                <div class="help_font_div help_font_height mCustomScrollbar j_tap_content _mCS_1"><div tabindex="0" style="max-height: 234.633px;" id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
                		<div id="mCSB_1_container" class="mCSB_container" style="position:relative; top:0; left:0; " dir="ltr">
                	<div class="help_font_height_b" style="display:block; position: relative; height: 240px; overflow-y: auto;">
                        <div class="help_font_height_m" style="display:block">
                            <div class="help_font_div_stitle">1、PC网页版支持什么浏览器？</div>
                            <p class="help_font_div_p">格来云游戏网页版目前在谷歌、360、QQ、搜狗等双核浏览器下有很好的浏览体验。建议您升级自己的浏览器或更换浏览器。 <a href="http://www.gloud.cn/index.php/user/explorer.html">点我升级&gt;</a></p>
                            <div class="help_font_div_stitle">2、第一次玩游戏需要什么？</div>
                            <p class="help_font_div_p">第一次试玩或开始游戏时，需要下载安装一个进入游戏的迷你客户端。</p>
                            <p class="help_font_div_p">Windows系统的PC <a href="data/gmclatest.zip">点我下载&gt;</a></p>
                            <p class="help_font_div_p">Mac版必要程序请加入测试QQ群277960170获取</p>
        
                            <div class="help_font_div_stitle">3、如何启动游戏？</div>
                            <p class="help_font_div_p">安装好迷你客户端，刷新页面，再次点击试玩或开始游戏按钮，选择服务器，排队成功后即可启动游戏。如果您选择了使用“客户端”启动游戏，会弹出外部请求协议，请点击“启动应用”。如果您选择了使用“网页”启动游戏，则会跳转到IE浏览器。</p>
    					</div>
                        
                        <div class="help_font_height_m">
                        
                            <div class="help_font_div_stitle">1、什么是云游戏？</div>
                            <p class="help_font_div_p">云游戏是将游戏放在服务器端运行，并将渲染完毕后的游戏画面压缩后通过网络传送给用户，客户端不需要任何高端硬件，只要能流畅播放视频即可享受高质量的游戏体验。</p>
                            <div class="help_font_div_stitle">2、格来云游戏有哪些版本？</div>
                            <p class="help_font_div_p">格来云游戏PC网页版：分为Windows版和Mac版，<a href="http://cdnuc.51ias.com/update/gmclatest.exe">Windows版必要程序下载&gt;</a>  ，Mac版必要程序请加入测试QQ群277960170获取。</p>
                            
                            <p class="help_font_div_p">格来云游戏安卓版：支持搭载安卓
4.2以上系统的设备，智能电视及盒子端请在应用市场下载安装，如：沙发管家、当贝市场、小米电视应用商店、奇珀市场、盒范儿TV、爱家TV、联想乐商店
等；也可用外存储设备安装：将格来云游戏安卓客户端通过电脑下载到U盘、SD卡等外存储设备上，将外存储设备连接到智能电视或盒子进行安装。<a href="http://s2.gloud.cn/intro/client/index.html" target="_blank">格来云游戏安卓版下载&gt;</a></p>
                            <p class="help_font_div_p">格来云游戏IOS版：敬请期待。</p>
                            
                            <div class="help_font_div_stitle">3、网络门槛</div>
                            <p class="help_font_div_p">由于云游戏需要将游戏图像从云端传至终端屏幕上，所以需要不错的带宽去支持。在选择合适的区以后， 4M的带宽适合使用“流畅”清晰度，10M以上的宽带才可以使用“高清”清晰度。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        	
                            <div class="help_font_div_stitle">1、游戏只能玩一部分，其他暂未开放什么意思？（安卓版）</div>
                            <p class="help_font_div_p">格来云游戏是等级解锁制的哦，等级越高解锁的游戏越多。</p>
                            <div class="help_font_div_stitle">2、什么时候更新游戏？（安卓版）</div>
                            <p class="help_font_div_p">正常情况下每周三更新一款新的游戏，部分游戏升级才能解锁哦~</p>
                            <div class="help_font_div_stitle">3、怎么才能升级？</div>
                            <p class="help_font_div_p">在平台上的所有游戏时长都会积累经验，购买游戏、使用G币也会增加经验。VIP用户通过游戏所获得的经验是普通用户的1.5倍；SVIP用户通过游戏所获得的经验是普通用户的2倍。</p>
                            <div class="help_font_div_stitle">4、网页版如何玩到更多游戏？</div>
                            <p class="help_font_div_p">网页版目前游戏数量有限，想要体验更多游戏？您可以去安卓版看看，在安卓版购买的游戏，会出现在网页版“我的游戏”中。<a href="http://s2.gloud.cn/intro/client/index.html" target="_blank">下载安卓版&gt;</a></p>
                        </div>
                    </div>
                    <div class="help_font_height_b" style="position: relative; height: 240px; overflow-y: auto;">
                        <div class="help_font_height_m" style="display:block">
                        	
                            <div class="help_font_div_stitle">1、如何注册格来云游戏账号？</div>
                            <p class="help_font_div_p">点注册账号，输入手机号或者邮箱号，点击发送验证码，输入手机或邮箱收到的验证码，设置6到16位的英文与数字的密码，即可完成注册。</p>
                            <div class="help_font_div_stitle">2、没收到验证码怎么办？</div>
                            <p class="help_font_div_p">可能当时短信通道繁忙，可选择邮箱注册或稍后再试。</p>
                            <div class="help_font_div_stitle">3、账号有什么用？</div>
                            <p class="help_font_div_p">格来云游戏账号采用手机号或邮箱来绑定，并用于登录。登录账号可享用更丰富的云游戏服务，不建议向其他人告知、共享、交易账号，以免造成不必要的经济损失。</p>
                            <div class="help_font_div_stitle">4、游客帐号如何成为正式帐号？</div>
                            <p class="help_font_div_p">游客帐号有丢失的风险，建议绑定手机或邮箱完成注册，可体验更多云游戏服务，如随处可玩：用安卓设备、电脑均可登录格来云游戏。存档随身：不论在哪，云端存档可以让精彩继续。帐号安全：保护个人游戏资产、游戏存档，避免帐号丢失。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        
                            <div class="help_font_div_stitle">1、如何绑定手机、邮箱？</div>
                            <p class="help_font_div_p">在“帐号中心”的“基本信息”里点击手机或邮箱后的【绑定】按钮即可绑定手机、邮箱。</p>
                            
                            <div class="help_font_div_stitle">2、忘记密码怎么办？</div>
                            <p class="help_font_div_p">进入<a href="http://www.gloud.cn/index.php/user/set_password.html" target="_blank">忘记密码</a>页面&gt; 填写您注册的手机号或者邮箱，输入手机或邮箱收到的验证码，重新设置新密码。帐号申诉请联系客服QQ：3077589307</p>
                            
                            <div class="help_font_div_stitle">3、手机或邮箱停用了怎么办？</div>
                            <p class="help_font_div_p">手机或邮箱停用，需要更换绑定，请在
“帐号中心”点击更换绑定，换绑前需要验证已绑定的手机邮箱或密保问题，验证成功，进入下一步，绑定新的手机或邮箱即可。如果未绑定邮箱和手机，可联系客
服，告知用户ID、账号交易的大致信息用以找回账号；如果什么都不记得，请重新注册账号。</p>
                            
                            <div class="help_font_div_stitle">4、如何设置密保问题？</div>
                            <p class="help_font_div_p">设置密保问题可提升帐号安全，请在“帐号中心”点击“设置密保问题”，首先需要验证绑定的手机或邮箱，验证成功后进入下一步，选择一个密保问题，输入问题答案，点击确定即可。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        	
                            <div class="help_font_div_stitle">1、VIP格来会员是什么？</div>
                            <p class="help_font_div_p">VIP格来会员可以享受：尊贵标识、试玩时长×1.5、排队优先级在第二队列、叫号尊候时间20秒、等级加速×1.5、720P游戏尺寸、断线重连、修改昵称、修改可选头像、VIP头像边框、普通游戏云贝购买、VIP游戏云贝购买等特权。</p>
                            <div class="help_font_div_stitle">2、SVIP超级会员是什么？</div>
                            <p class="help_font_div_p">SVIP超级会员可以享受：尊贵标
识、购买游戏时长享95折、试玩时长×2、排队优先级在第一队列、叫号尊候时间120秒、等级加速×2、720P游戏尺寸、高清画质、移屏功能、意外情况
挂起保留、断线重连、修改昵称、自定义头像、SVIP头像边框、普通游戏云贝购买、VIP游戏云贝购买等特权、SVIP游戏云贝购买等特权、联机高级房间
（安卓专属）等特权。</p>
                            
                            <div class="help_font_div_stitle">3、VIP和SVIP的购买、续费</div>
                            <p class="help_font_div_p">购买VIP和SVIP以月为单位，购买、续费VIP将延长VIP的到期时间。购买、续费SVIP也会延长SVIP的到期时间。</p>
                            
                            <div class="help_font_div_stitle">4、VIP升级SVIP</div>
                            <p class="help_font_div_p">VIP大于等于31天时，可以将VIP升级到SVIP，将会把原来账户中的VIP时间升级为SVIP，剩余的VIP时间在SVIP到期后生效。</p>

                        </div>
                        
                        <div class="help_font_height_m">
                        	
                            <div class="help_font_div_stitle">1、如何获得经验、提升等级？</div>
                            <p class="help_font_div_p">在平台内的玩所有游戏时长都会积累经验；购买游戏、充值G币也会增加经验。VIP用户通过游戏所获得的经验是普通用户的2倍。</p>
                            <div class="help_font_div_stitle">2、等级有什么用？</div>
                            <p class="help_font_div_p">格来云游戏的等级为玩家的个人信息，等级提高可以解锁更多的游戏（安卓版可见），未来等级会有更多功能和特权，敬请期待。</p>
                        </div>
                    </div>
                    <div class="help_font_height_b" style="position: relative; height: 240px; overflow-y: auto;">
                        <div class="help_font_height_m" style="display:block">
                        	
                            <div class="help_font_div_stitle">1、充值G币都有什么方式？</div>
                            <p class="help_font_div_p">a.通过支付宝、微信扫码支付。</p>
                            <p class="help_font_div_p">b.电话充值卡支付。</p>
                            <p class="help_font_div_p">c.短代支付。</p>
                            <p class="help_font_div_p">d.官方淘宝店。</p>
                            
                            <div class="help_font_div_stitle">2、电话卡充值数额不对？</div>
                            <p class="help_font_div_p">电话卡充值时，一定要选择和充值卡的相同面额的选项进行充值。否则充值金额将会不正确。</p>
                            
                            <div class="help_font_div_stitle">3、什么是短代充值？</div>
                            <p class="help_font_div_p">短代充值是通过扣除手机内的话费进行充值的充值方式。</p>
                            
                            <div class="help_font_div_stitle">4、短代充值怎么使用？</div>
                            <p class="help_font_div_p">输入手机号码，当手机收到验证码以后，输入验证码即可。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        
                            <div class="help_font_div_stitle">1、什么是G币？</div>
                            <p class="help_font_div_p">G币是格来云游戏平台的货币之一，可用于购买游戏时长、存档、会员等，用处更广。</p>
                            
                            <div class="help_font_div_stitle">2、G币如何获取</div>
                            <p class="help_font_div_p">①、可在“充值页”用人民币购买。支持支付宝支付、微信支付、电话充值卡、短代支付。</p>
                            <p class="help_font_div_p">②、可通过格来云游戏官方淘宝店“云游戏畅玩店”购买。<a href="http://gloud.taobao.com/" target="_blank">官方淘宝店&gt;</a></p>
                            
                            <div class="help_font_div_stitle">3、电话卡充值错误怎么办？</div>
                            <p class="help_font_div_p">电话卡充值是以充值卡面额充值的，请选择和充值卡相同的数额进行充值，不可分开充值。</p>
                            
                            <div class="help_font_div_stitle">4、G币如何使用</div>
                            <p class="help_font_div_p">在购买游戏处选择相应的游戏时长然后G币支付即可购买相应的游戏；在“会员中心”购买VIP服务；在“存档市场“购买游戏存档。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        	
                            <div class="help_font_div_stitle">1、什么是云贝？</div>
                            <p class="help_font_div_p">云贝是格来云游戏平台的货币之一，可用于购买游戏时长、游戏包、存档等。</p>
                            
                            <div class="help_font_div_stitle">2、如何获得云贝？</div>
                            <p class="help_font_div_p">①、新账号将赠送3000云贝</p>
                            <p class="help_font_div_p">②、通过任务中心的任务和每日签到获取。</p>
                            <p class="help_font_div_p">③、参与活动：参加官方举行的活动，领取云贝礼包兑换码，可以到兑换中心为账号充值。</p>
                            
                            <div class="help_font_div_stitle">3、云贝如何使用</div>
                            <p class="help_font_div_p">在购买游戏或存档处选择相应的游戏时长然后云贝支付即可购买相应的游戏或存档。</p>
                            
                            <div class="help_font_div_stitle">4、如何获得更多云贝？</div>
                            <p class="help_font_div_p">购买VIP或SVIP在任务中可获得云贝奖励或加成。</p>
                        </div>
                    </div>
                    <div class="help_font_height_b" style="position: relative; height: 240px; overflow-y: auto;">
                        <div class="help_font_height_m" style="display:block">
                        	
                            <div class="help_font_div_stitle">1、无法用云贝购买游戏？</div>
                            <p class="help_font_div_p">无法购买游戏一般有这几种情况：</p>
                            <p class="help_font_div_p">a.如果您是普通用户，可以用云贝购买普通游戏；VIP游戏和SVIP游戏只能用G币购买。</p>
                            <p class="help_font_div_p">b.如果您是VIP用户，可以用云贝普通游戏+VIP游戏；SVIP游戏只能用G币购买。</p>
                            <p class="help_font_div_p">c.如果您是SVIP用户，可以用云贝或G币购买所有游戏。</p>
                            <div class="help_font_div_stitle">2、购买游戏提示要升级VIP</div>
                            <p class="help_font_div_p">格来云游戏内容分为：普通游戏、VIP游戏和SVIP游戏。只有账号身份相对应的游戏才能用云贝购买；G币可以购买所有的游戏。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        
                            <div class="help_font_div_stitle">1、游戏无法启动或崩溃？</div>
                            <p class="help_font_div_p">①格来云游戏网页版支持大部分双核浏览器，如果您的浏览器已切换到兼容模式，请手动切回急速模式。</p>
                            <p class="help_font_div_p">②请检查你的电脑的显卡驱动并更新，如果是集成显卡，请联系客服报告你的帐号ID、机器详细配置、浏览器版本（客服QQ : 3077589307）</p>
                            <p class="help_font_div_p">③如果检测不到开始游戏必要程序或无法更新，请关闭杀毒软件、电脑管家，刷新再试；如果仍不能解决，请尝试重新下载必要程序。<a href="http://cdnuc.51ias.com/update/gmclatest.exe">下载&gt;</a> </p>
                            <div class="help_font_div_stitle">2、无法启动游戏</div>
                            <p class="help_font_div_p">①未连接GLS： 没有连接到服务器，先检查网络连接，然后关闭客户端重新打开即可进入。</p>
                            <p class="help_font_div_p">②存档正在上传：</p>
                            <p class="help_font_div_p">【正常情况】提示“存档正在上传”，说明存档正在上传至云端，一般很快就会上传完毕。有些游戏可能慢些，但也不会特别长时间。此时玩家可以选择继续等待存档上传完毕后进入游戏，或者将正在上传的存档删除使用以前的存档进入游戏。</p>
                            <p class="help_font_div_p">【非正常情况】如果长时间都没有上传完毕，说明上传过程中出现了问题。原因可能是网速差、不稳定。若存档非常重要，建议关闭同网络下其他占用网速的设备；若存档不是特别重要，可删除，选择使用以前的存档开始游戏。</p>
                            <p class="help_font_div_p">③“登陆服务器失败，同一账户不能同时启动两个游戏”：该情况是因为一个帐号能登录多个设备，而其中有一个设备已经进入游戏导致，退出其余设备，稍后只登陆一台设备即可。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        	
                            <div class="help_font_div_stitle">1、为什么会排队？</div>
                            <p class="help_font_div_p">本区服务器满载后，无法同时启动更多的游戏。</p>
                            <div class="help_font_div_stitle">2、不想排队怎么办？</div>
                            <p class="help_font_div_p">不想排队可更换服务器负载小的区启动游戏、购买VIP或SVIP排队优先，加速进入游戏。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        	
                            <div class="help_font_div_stitle">1、格来云游戏存档有什么用？</div>
                            <p class="help_font_div_p">记录并储存玩家玩游戏的存档，当再次启动游戏时会读取存档启动。</p>
                            
                            <div class="help_font_div_stitle">2、我能存多少个存档？</div>
                            <p class="help_font_div_p">每款游戏会有5个默认存档。</p>
                            
                            <div class="help_font_div_stitle">3、想要一个资源全开的存档怎么获得？</div>
                            <p class="help_font_div_p">通过“存档管理”内的“存档市场”找到存档，并可以通过G币或云贝购买。</p>
                            
                            <div class="help_font_div_stitle">4、购买的存档有时间限制吗？</div>
                            <p class="help_font_div_p">购买的存档是永久的哦。</p>
                            
                            <div class="help_font_div_stitle">5、存档一直在上传怎么办？</div>
                            <p class="help_font_div_p">一般存档上传在3-5秒之间，如果一直是上传状态，请检查您的网络连接，网络通畅后会自动上传的。</p>
                            
                            <div class="help_font_div_stitle">6、我的存档可以在其他设备上使用吗？</div>
                            <p class="help_font_div_p">存档是和账号绑定的，无论怎么更换设备都可以使用自己的存档。</p>
                        </div>
                    </div>
                    <div class="help_font_height_b" style="position: relative; height: 240px; overflow-y: auto;">
                        <div class="help_font_height_m" style="display:block">
                        	
                            <div class="help_font_div_stitle">1、视频卡顿、声音卡顿怎么办？</div>
                            <p class="help_font_div_p">首先，请使用有线网络，不建议使用WIFI体验格来云游戏。玩游戏的时候，如果出现卡顿情况，游戏会自动降速，通过降低画面质量来保证流畅，这个过程大概需要1-2分钟，降速会持续降速至画面流畅为止。</p>
                            
                            <div class="help_font_div_stitle">2、网络带宽不足怎么办？</div>
                            <p class="help_font_div_p">网络带宽不够引起。建议在“设置中”把“游戏清晰度”调整为流畅；如果仍然卡顿，请在“设置”中把“画面尺寸”改为480P；若以上两项都无法解决问题，说明你的网络和格来云游戏服务器之间的带宽不足，请提升网络带宽或等待我们扩大服务器部署范围。</p>
                            
                            <div class="help_font_div_stitle">3、视频流畅但延迟大怎么办？</div>
                            <p class="help_font_div_p">延迟的情况很复杂，可能导致延迟的主要因素（它们是互相叠加的）如下：</p>
                            <p class="help_font_div_p">网络延迟。在云游戏的服务器覆盖到全国每个省的每个电信运营商之前，总会有用户的延迟体验较差，就像有人看优酷会卡一样。解决的办法只有：等待我们扩大云游戏的部署范围。网络延迟在0~20毫秒为佳，20~50ms还凑合，50ms以上较差。</p>
                            <p class="help_font_div_p">WIFI导致的延迟。WIFI网络容
易导致丢包和高延迟，特别是遇到较差的无线路由器、部分笔记本电脑无线天线差、2.4G WIFI干扰严重时。我们的建议是：使用5G 
WIFI，使用尽量好（400元以上）的无线路由器。WIFI带来的延迟很不确定，可能从几十毫秒到数百毫秒不等。</p>
                            
                            <div class="help_font_div_stitle">4、如何降低延迟？</div>
                            <p class="help_font_div_p">使用有线（或者使用5G WIFI）；关闭其他下载和上传的应用程序。</p>
                            
                            <div class="help_font_div_stitle">5、如何选择适合的清晰度？</div>
                            <p class="help_font_div_p">网络带宽决定你可以用怎样的清晰度，画面越精美的游戏需要的带宽越高，正常情况下，4M的带宽适合使用“流畅”清晰度，8M以上的宽带才可以使用“高清”清晰度。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        

                            <div class="help_font_div_stitle">1、试玩结束、游戏到期</div>
                            <p class="help_font_div_p">当游戏的试玩时间、游戏时长结束时，会强制踢出游戏，重新购买游戏后即可从最新的存档开始游戏。</p>
                            
                            <div class="help_font_div_stitle">2、游戏断开怎么办？</div>
                            <p class="help_font_div_p">当游戏过程中断网后游戏将会断开，需要从新启动游戏。SVIP会员有短时间的挂起，可直接恢复游戏，不需要重启。</p>

                        </div>
                    </div>
                    <div class="help_font_height_b" style="position: relative; height: 240px; overflow-y: auto;">
                        <div class="help_font_height_m" style="display:block">
                        	
                            <div class="help_font_div_stitle">1、手柄插上没反应或按键错乱怎么办？</div>
                            <p class="help_font_div_p">目前部分安卓设备对于手柄的支持很不完善，如果手柄连接之后无法操作系统界面，那么肯定是无法操作格来云游戏的。建议更换手柄，使用官方推荐的手柄型号。<a href="https://gloud.taobao.com/" target="_blank">官方淘宝店&gt;</a></p>
                            
                            <div class="help_font_div_stitle">2、手柄不震动是什么原因？</div>
                            <p class="help_font_div_p">手柄不震动的原因有以下几种情况，请
自行对照解决：1、游戏不支持震动；2、手柄没有打开震动功能（官方推荐手柄一般都支持，非官方推荐的手柄，请详细阅读说明书）；3、手柄支持震动，但未
更新手柄驱动；若以上都不，请检查手柄是否损坏或USB接口是否故障、是否正常供电等。</p>
                            
                            <div class="help_font_div_stitle">3、无线手柄怎么玩双人、多人游戏？</div>
                            <p class="help_font_div_p">如果USB接口较少，可以使用集线器连接多个手柄。无线手柄请将无线接收器插在集线器上，有线手柄直接连接集线器，一般最多能支持到4个玩家。</p>
                        </div>
                        
                        <div class="help_font_height_m">
                        	
                            <div class="help_font_div_p">1、如果有更多疑问，可以登录我们的百度贴吧：<a href="http://tieba.baidu.com/f?kw=%B8%F1%C0%B4%D4%C6%D3%CE%CF%B7&amp;fr=ala0&amp;tpl=5" target="_blank">格来云游戏吧&gt;</a>，与玩家交流。</div>
                            
                            <div class="help_font_div_p">2、关注我们的新浪微博：动视云游戏，微信公众号：动视云游戏，获取第一手的官方资讯；加入官方QQ群向客服寻求帮助：420268116。</div>
                            
                            <div class="help_font_div_p">3、通过“帮助中心”的“问题反馈”将您的问题反馈给我们。我们会根据问题为您进行解答。</div>
                        </div>
                    </div>
                    
				</div>
				<!--<div style="display: block;" id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical">
						<div class="mCSB_draggerContainer">
							<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 207px; max-height: 224px;" oncontextmenu="return false;">
									<div style="line-height: 30px;" class="mCSB_dragger_bar"></div>
							</div>
							<div class="mCSB_draggerRail"></div>
						</div>
				</div>-->
                
            </div>
           </div>
			</div>
			<div class="help_left_div">
				<div class="help_left_card border_box num_top">
					<h3 class="help_tips">
						<img src="images/help_guest.png" class="help_right_title_img"> 客户服务
					</h3>
					<div class="help_font_div">
						<p class="help_btn_div_pos">${cs.title }</p>
                        <p class="help_btn_div_pos">客服QQ : ${cs.QQ }</p>
						<p class="help_btn_div_pos">客服邮箱 : ${cs.email }</p>
						<p class="help_btn_div_pos">服务时间:${cs.time }</p>
						</div>

				</div>

				<div class="help_left_card border_box num_top num_even">
					<h3 class="help_tips">
						<img src="images/help_handle.png" class="help_right_title_img"> 手柄支持
					</h3>
					<div class="help_font_div">
						<p class="help_btn_div_pos">目前已支持大多数主流带摇杆的游戏手柄.</p>
                        <ul class="help_list_nav_item_2">
                            <li id="j_handle"><a title="360手柄模拟器" class="help_list_nav">360手柄模拟器</a></li>
                            <li><a href="###" title="购买手柄" class="help_list_nav" target="_blank">购买手柄</a></li>
                        </ul>
					</div>
				</div>

				<div class="help_left_card border_box">
					<h3 class="help_tips">
						<img src="images/help_talk.png" class="help_right_title_img"> 社区服务
					</h3>
					<div class="help_font_div">
						<p class="help_btn_div_pos"><span class="help_font_div_span">与玩家交流游戏经验丶咨询游戏活动时，推使用论坛服务。<span></span></span></p><p>
						</p><ul class="help_list_nav_item_2">
                            <!-- <li><a href="http://bbs.gloud.cn/forum.php" title="官方论坛" class="help_list_nav">官方论坛</a></li> -->
                            <li><a href="http://tieba.baidu.com/f?kw=%B8%F1%C0%B4%D4%C6%D3%CE%CF%B7&amp;fr=index" title="百度贴吧" class="help_list_nav" target="_blank">百度贴吧</a></li>
                        </ul>
					</div>
				</div>
				<div class="help_left_card border_box num_even">
					<h3 class="help_tips">
						<img src="images/help_advice.png" class="help_right_title_img"> 产品建议
					</h3>
					<div class="help_font_div">
                        <form name="form_find" id="form_find" method="post" action="sendMessageInfo.php">  
                    	<div class="page_reg_info">
                       	  <div class="help_list_info_area">
                                <p class="help_list_info_m_area">
                                  <textarea id="j_feedback_contet" name="content" class="help_list_info_input_t" maxlength="1000" placeholder="请输入您的意见、问题反馈" required=""></textarea>
                              </p>
                            </div>
                        </div>
                    	<div class="page_reg_info">
                        	<div class="help_list_info w_132">
                                <p class="help_list_info_m">
                                    <input name="contact" class="help_list_info_input_t" id="j_feedback_contact" placeholder="联系方式（电话/邮箱）选填" maxlength="20" type="text">
                                </p>
                            </div>
                            <a href="javascript:;" id="j_user_feedback" title="提交" class="help_list_code">提交</a>
                        
                        </div>
                        </form>
					</div>
				</div>
			</div>
		</div>
	</section>
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
 //    //全局遮罩
 //    $('#DivLocker').css({
 //        "position": "fixed",
 //        "background-color": "#000",
 //        "top":0,
 //        "buttom":0,
 //        "left":0 ,
 //        "right":0,
 //        "filter": "alpha(opacity=30)",
 //        "opacity": "0.5",
 //        "overflow": "hidden",
 //        "height":"100%",
 //        "z-index": "10000"
 //    });
 //    //msg 中间显示的内容，btn ，按钮名字
 //    function write_tip_message(msg ,info){
 //    	$('#DivLocker').hide();
 //    	$('#tip_message_div').show();
 //    	$('#tip_message').html(msg);
 //    	$('#DivLocker').show();
 //    	var param = arguments[1] ? arguments[1] : 0;
    	
 //    	$('#tip_message_btn_name_'+param).show();
 //    	// $('#j_open_time_f').show();
 //    }
 //    function close_tip_message(info){
    	
 //    	$('#tip_message_btn_name_'+info).hide();
 //    	$('#tip_message_div').hide();
 //    	$('#DivLocker').hide();
 //    	if(info == 1){
 //    		location.reload();
 //    	}
 //    }
 //    //统一  弹出层  关闭按钮  关闭
	// function close_all_layer(id,info){
	// 	$('#'+id).hide();
	// 	$('#DivLocker').hide();
		
	// 	var param = arguments[1] ? arguments[1] : 0;
	// 	if(param == 0){
	// 		location.reload();
	// 	}
	// }
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
<div class="xw_charge_top" style="display:none;z-index:10001" id="j_handle_f"><!--   显示窗体的具体位置-->
	<div class="xw_top_head">  <!-- 弹窗的头部-->
			   	<img src="images/close.png" alt="close" class="xw_8_close_btn layer_btn_x" id="j_handle_x">
			   
	</div>
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_handle_main">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list xw_handle_tips">   
			<p>下载解压后，将<span class="xw_handle_span_desc">三个</span>文件放到gmc所在目录内。再次重启游戏时，您的手柄就能正常使用啦！</p><p>删除这三个文件，原本可正常使用的手柄可恢复。</p>
		</div>
		<div class="xw_handle_return_btn">
			<a href="http://www.gloud.cn/Public/static/upload/360_handle.zip">
				<div class=" xw_charge_return_btn_div" style="margin-top:18px;">
					下载
				</div>
			</a>
		</div>
	</div>
</div>

    <!-- 账号中心界面，点击问号 出现兑换提示弹窗-->
<div class="xw_charge_top" style="display:none;z-index:10001" id="j_feedback_f"><!--   显示窗体的具体位置-->
	<div class="xw_top_head">  <!-- 弹窗的头部-->
	
		<div class="xw_top_head_main" style="margin-bottom:5px;"><!-- 弹窗的头部内容样式-->
			<span class="xw_top_head_title"><!-- 弹窗标题-->
			</span>
			<div class="xw_top_head_close" id="j_exchange_x"> 
				<img class="layer_btn_x" src="images/close.png" alt="close">
			 </div> <!-- 弹窗头部关闭-->
		</div>
	</div>
	 <!-- 弹出 中部内容 控制-->
	<div class="xw_handle_main">    <!--  中部内容 边距控制-->
		<div class="xw_top_main_list xw_duihuan_tips">   
			<p id="feedback_result"></p><p>
		</p></div>
		<div class="xw_handle_return_btn" style="cursor:pointer;">
			<div class=" xw_charge_duihuan_btn_div" onclick="close_all_layer('j_feedback_f',1)">
				关闭
			</div>
		</div>
	</div>
</div>
    <script src="js/help.js"></script>
	<script src="js/jquery_002.js"></script>
	<div id="DivLocker" style="display:none;position:fixed;background-color:#000;top:0;buttom:0;left:0;right:0;filter:alpha(opacity=30);opacity:0.5;overflow:hidden;height:100%;z-index:9000;"></div>
<!-- 360 手柄模拟器下载弹出层-->   
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
