<!-- author:董淑媛 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
		<meta charset="GBK">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/user_kitchen.css"/>
		<link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="css/test.css">
        
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>
        
<script type="text/javascript">
function chacaipu(vaac101)
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/details.html?aac101="+vaac101; 
	vform.submit();
}
function chazuopin(vaac201)
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/findByIdPro.html?aac201="+vaac201; 
	vform.submit();
}
function chazhuanlan(vaac301)
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/browsefindByIdarticle.html?aac201="+vaac301; 
	vform.submit();
}
function getWork(vaab101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/queryHomeWork.html?aab101="+vaab101;
	 vform.submit();
}
function getSub(vaab101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/queryAllSubscribe.html?aab101="+vaab101;
	 vform.submit();
}
function getSubByMe(vaab101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/querySubMe.html?aab101="+vaab101;
	 vform.submit();
}
function onSub(vaab101)
{
	$.ajax({
		url:'/emp/addSubscribe.do',
		type:'post',
		data:{
			"aab101":vaab101
		},
		dataType:'json',
		success:function(data){
			 window.location.href="queryHomeRecipe.html?aab101="+vaab101;
		},
		error:function(data){
			
			alert("提示：网络故障！");
		}
	});	
}
</script>
</head>
<body>
	<div class="header">
		<div class="conwidth">
			<h1 class="fl"><a href="">美<span>拾</span></a></h1>
			<div class="search fl" id="search-box">
				<form action="#" method="get" target="_blank" >
					<input type="text" placeholder="搜索菜谱、食材"
						id="sreach-input" class="search-text fl"/>
					<input type="button" value="搜菜谱" class="search-btn fl"/>
				</form>
			</div>
			<div class="nav fr">
			<ul>
	                  <li><a href="">首页</a></li>
	                  <li class="menu-class"><a href="">菜谱分类</a>
	                      <div class="topbar-menu">
	                          <ul class="plain">
	                          <li class='topbar-menu-head'>常用主题</li>
	                          <li><a href="menu_class.html" >家常菜</a></li>
	                          <li><a href="menu_class.html" >快手菜</a></li>
	                          <li><a href="menu_class.html" >下饭菜</a></li>
	                          <li><a href="menu_class.html" >早餐</a></li>
	                          <li><a href="menu_class.html" >减肥</a></li>
	                          <li><a href="menu_class.html" >汤羹</a></li>
	                          <li><a href="menu_class.html" >烘焙</a></li>
	                          <li><a href="menu_class.html" >小吃</a></li>
	                          </ul>
	                          <ul class="plain">
	                          <li class='topbar-menu-head'>常见食材</li>
	                          <li><a href="menu_class.html" >猪肉</a></li>
	                          <li><a href="menu_class.html" >鸡肉</a></li>
	                          <li><a href="menu_class.html" >牛肉</a></li>
	                          <li><a href="menu_class.html" >鱼</a></li>
	                          <li><a href="menu_class.html" >鸡蛋</a></li>
	                          <li><a href="menu_class.html" >土豆</a></li>
	                          <li><a href="menu_class.html" >茄子</a></li>
	                          <li><a href="menu_class.html" >豆腐</a></li>
	                          </ul>
	                          <ul class="plain">
	                          <li class='topbar-menu-head'>时令食材</li>
	                          <li><a href="menu_class.html" >春笋</a></li>
	                          <li><a href="menu_class.html" >笋</a></li>
	                          <li><a href="menu_class.html" >豌豆</a></li>
	                          <li><a href="menu_class.html" >草莓</a></li>
	                          <li><a href="menu_class.html" >金桔</a></li>
	                          <li><a href="menu_class.html" >菠菜</a></li>
	                          <li><a href="menu_class.html" >冬笋</a></li>
	                          <li><a href="menu_class.html" >韭菜</a></li>
	                          </ul>
	                          <div class="span">
	                          <span><a href="">查看全部分类</a></span>
	                          </div>
	                      </div>
	                  </li>
	                  <li><a href="">菜单</a></li>
	                 <li><a href="<%=path%>/queryPro.html">作品动态</a></li>
	               
	             </ul>
		<div class="dengluzhuce fr">
			<a href="login.html">登录</a>
			<a href="register .html">注册</a>
		</div>
		</div>
	</div>
	         <div class="suggest" id="sreach-suggest"><!---搜索智能提示suggest-->
	             <ul>
	                 <li>搜"  "相关用户</li>
	                 <li>搜"  "相关菜单</li>
	             </ul>
	         </div>
	     </div>
	<div class="konghang"></div>   
                <c:if test="${ins!=null }">
				<div class="conwidth">
				<div class="jianjie">
				<img src="${ins.aab106 }" class="img"/>
				<div class="fl">
				<h2>${ins.aab102 }的厨房</h2>
				<!-- <span><i class="icon1"></i>2016-3-23 加入</span><br />-->
				<div class="guanzhuderen">
				<div class="x y">
				<span>关注的人</span><br><a href="#"><span>${ins.aab107 }</span></a>
				</div>
				<div class="x">
				<span>被关注</span><br><a href="#"><span>${ins.aab108 }</span></a>
				</div>
				</div>
				
				</div>
				<div class="fr">
				<a href="#"><div class="guanzhu2">关注</div></a>
				</div>
				</div>
				
				<div class="kh20"></div>
				</div>
				</c:if>
		
		 <div class="conwidth survey">
        	<div class="navigation">
        		<span class="teshu bqcaipu"><a href="#" onclick="getRecipe('${param.aab101}')">菜谱</a></span>
        		<span class="bqzuopin"><a href="#" onclick="getWork('${param.aab101}')">作品</a></span>
        		<span class="bqshoucang"><a href="<%=path%>/collect.html">收藏</a></span>
        		<span class="bqliuyanban"><a href="<%=path%>/myLikes.html">点赞</a></span>
        	</div>

        	<div class="kh20"></div>
          <form id="myform" method="post">
            <input type="hidden" name="aad301" value="${param.aad301}">
        	<div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>菜谱</legend>
				</fieldset>	
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${reci}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a onclick="chacaipu('${ins.aac101}')">
		            				<img src="${ins.aac108}" alt="菜谱图片" width="300px" height="240px"/>
		            			</a>
		            		</div>
		            		<p>&nbsp;&nbsp;${ins.aac102}</p>
		        			<div class="stars">		        			    
		        				<a href="#" onclick="shanchu('${ins.aad201}','${ins.aac301}','${ins.aad203}')">删除</a>
		        			</div>
				         </div>
				      </c:forEach>
			  </div>
			  
			<div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>作品</legend>
				</fieldset>	
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${pro}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chazuopin('${ins.aac201}')">
		            				<img src="${ins.aac204}" alt="作品图片" width="300px" height="240px"/>
		            			</a>
		            		</div>
		            		<p>&nbsp;&nbsp;${ins.aac203}</p>
		        			<div class="stars">		        			    
		        				<a href="#" onclick="shanchu('${ins.aad201}','${ins.aac301}','${ins.aad203}')">删除</a>
		        			</div>
				         </div>
				      </c:forEach>
			  </div>  
			  
			   <div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>专栏</legend>
				</fieldset>
					
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${comp}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chazhuanlan('${ins.aac301}')">
		            				<img src="img/zl.jpg"  width="300px" height="240px"/>
		            			</a>
		            		</div>
		            		<p>&nbsp;&nbsp;${ins.aac302}</p>
		        			<div class="stars">
		        				<a href="#" onclick="shanchu('${ins.aad201}','${ins.aac301}','${ins.aad203}')">删除</a>
		        			</div>
				         </div>
				      </c:forEach>
			  </div>             
          </form>
       </div>
		<script type="text/javascript">
	      function shanchu(vaad201,vaac01,vaad203)
	      {
	    	 var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/cancleColl.html?aad201="+vaad201+"&aac01="+vaac01+"&aad203="+vaad203;
	    	 vform.submit();
	      }
	   </script>
	</body>
</html>
