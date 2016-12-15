<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	<link id="yanse" rel="stylesheet" href="${pageContext.request.contextPath}/easyui1.3/themes/gray/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/easyui1.3/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui1.3/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui1.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui1.3/locale/easyui-lang-zh_CN.js"></script>
  
  <script type="text/javascript">
  var all = 0 ;
  $(function(){
	  $("#mytabs").tabs({
		  onContextMenu:function(e, title,index){
			   //2.选中右击的选项卡
				$("#mytabs").tabs('select',title) ;
				//3.显示右键菜单
				$('#myrightmenu').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
		  }
	  }) ;
  }) ;
  
  
  	function addTab(t,url){
  		if(!$("#mytabs").tabs('exists',t)){
  			$("#mytabs").tabs('add',{
  	  			title:t,
  	  			href:url,
  	  			closable:true
  	  		}) ;
  			
  			all++ ;
  		}
  		else{
  			$("#mytabs").tabs('select',t) ;
  		}
  		
  		
  	}
  	
  	function removeone(){
  		//1.得到选中的选项卡
  		var tab = $('#mytabs').tabs('getSelected') ;
  		var index = $("#mytabs").tabs('getTabIndex',tab) ;
  		$("#mytabs").tabs('close',index) ;
  	}
  
  	
  	function removeall(){
  		for(var i=0;i<all;i++){
  			$("#mytabs").tabs('close',1) ;
  		}
  	}
  </script>
  
  </head>
  
  <body>
<div id="cc" class="easyui-layout" fit=true>   
    <div data-options="region:'north',title:'',split:true" style="height:60px;">
    		
    </div>      
    <!-- West -->
    <div data-options="region:'west',title:'',split:true" style="width:150px;">
    	<!-- 折叠卡 -->
    	<div id="aa" class="easyui-accordion" fit=true>   
			    <div title="用户管理"  style="overflow:auto;padding:10px;">   
			       <p><a href="javascript:addTab('会员管理','huiyuan/list.jsp')">会员管理</a></p>
			       <p><a href="">普通用户管理</a></p>
			    </div>   
			    <div title="订单管理" style="overflow:auto;padding:10px;">   
			       <p><a href="javascript:addTab('订单列表','dingdan/dingdan.jsp')">订单列表</a></p>
			       <p><a href="">订单详情</a></p>  
			    </div>   
			    <div title="航班信息" style="overflow:auto;padding:10px;">   
			        <p><a href="">机票管理</a></p>
			       <p><a href="">航班信息</a></p>   
			    </div>   
		</div>  
    </div>   
    <div data-options="region:'center',title:'管理中心'" style="padding:0px;background:#eee;">
    	<!-- 选项卡 -->
    	<div id="mytabs" class="easyui-tabs" fit=true>   
			   <div title="Tab1" style="padding:20px;">   
			      欢迎使用该系统    
			   </div>   
			   
		</div>  
    </div>   
</div>  


<!-- 菜单 -->
<!-- 右键菜单定义如下： -->
<div id="myrightmenu" class="easyui-menu" style="width:120px;">
	<div onclick="removeone()" data-options="iconCls:'icon-remove'">关闭</div>
	
	<div onclick="removeall()" data-options="iconCls:'icon-remove'">关闭所有</div>
</div>

  </body>
</html>
