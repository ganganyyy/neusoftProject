<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
		<meta charset="GBK">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/user_kitchen.css"/>
		<link rel="stylesheet" href="layui/css/layui.css"  media="all">        
</head>
<body>
	  <form id="myform" method="post">
       <c:if test="${ins!=null }">
        <div class="conwidth">
        
        
        	<div class="jianjie">
        		<img src="${ins.aab106 }" class="img"/>
        		<div class="fl">
        				<h2>${ins.aab102 }的厨房</h2>
        			   <!-- <span><i class="icon1"></i>2016-3-23 加入</span><br />-->
        				<div class="guanzhuderen">
						<div class="x y">
							<span>关注的人</span><br><a href="#" onclick="getSub('${param.aab101}');"><span>${ins.aab107 }</span></a>
						</div>
						<div class="x">
							<span>被关注</span><br><a href="#" onclick="getSubByMe('${param.aab101}');"><span>${ins.aab108 }</span></a>
						</div>
					</div>
        				
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
         
        	<div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>菜谱</legend>
				</fieldset>	
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${reci}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chacaipu('${ins.aac101}')">
		            				<img src="${ins.aac108}" alt="菜谱图片" width="300px" height="240px"/>
		            			</a>
		            		</div>
		            		<p>&nbsp;&nbsp;${ins.aac102}</p>
		        			<div class="stars">		        			    
		        				<a href="#" onclick="shancaipu('${ins.aac101}')">删除</a>
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
		        				<a href="#" onclick="shanzuopin('${ins.aac201}')">删除</a>
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
		        				<a href="#" onclick="shanzhuanlan('${ins.aac301}')">删除</a>
		        			</div>
				         </div>
				      </c:forEach>
			  </div>             
         
       </div>
        </form>
		<script type="text/javascript">
	      function shancaipu(vaac101)
	      {
	    	 var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/cancleLike.html?aac101="+vaac101+"&aad103=01";
	    	 vform.submit();
	      }
	      function shanzuopin(vaac201)
	      {
	    	 var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/cancleLike.html?aac201="+vaac201+"&aad103=02";
	    	 vform.submit();
	      }
	      function shanzhuanlan(vaac301)
	      {
	    	 var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/cancleLike.html?aac301="+vaac301+"&aad103=03";
	    	 vform.submit();
	      }
	   </script>
	   
	</body>
</html>
