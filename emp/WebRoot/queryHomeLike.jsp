<!-- author:韩金利 -->
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
		<link rel="stylesheet" type="text/css" href="css/myRP.css"/>
		<link rel="stylesheet" href="layui/css/layui.css"  media="all">
		<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
		<script type="text/javascript">
		function getRecipe(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/queryHomeRecipe.html?aab101="+vaab101;
        	 vform.submit();
        }
		function getWork(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/queryHomeWork.html?aab101="+vaab101;
        	 vform.submit();
        }
        function getCol(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/collect.html?aab101="+vaab101;
        	 vform.submit();
        }
        function getLike(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/myLikes.html?aab101="+vaab101;
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
		</script>
</head>
<body>
	  <form id="myform" method="post">
	   <div class="layui-container" style="margin-top:50px;margin-left:15%; width:70%">
        </div>
       <c:if test="${ins!=null }">
        <div class="conwidth">


        	<div class="jianjie">
        		<img src="${ins.aab106 }" class="img"/>
        		<div class="fl">
        				<h2>${ins.aab102 }的厨房</h2>
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
        		<span class="bqcaipu"><a href="#" onclick="getRecipe('${param.aab101}')">菜谱</a></span>
        		<span class="bqzuopin"><a href="#" onclick="getWork('${param.aab101}')">作品</a></span>
        		<span class="bqshoucang"><a href="#" onclick="getCol('${param.aab101}')">收藏</a></span>
        		<span class="teshu bqliuyanban"><a href="#" onclick="getLike('${param.aab101}')">点赞</a></span>
        	</div>

        	<div class="kh20"></div>

        	<div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>菜谱</legend>
				</fieldset>
				     <c:forEach items="${reci}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chacaipu('${ins.aac101}')">
		            				<img src="${ins.aac108}" alt="菜谱图片" width="280px" height="200px"/>
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
				     <c:forEach items="${pro}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chazuopin('${ins.aac201}')">
		            				<img src="${ins.aac204}" alt="作品图片" width="280px" height="200px"/>
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
				     <c:forEach items="${comp}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chazhuanlan('${ins.aac301}')">
		            				<img src="img/zl.jpg"  width="280px" height="200px"/>
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
	    	 vform.action="<%=path%>/browsefindByIdarticle.html?aac301="+vaac301;
	    	 vform.submit();
	      }
	   </script>

	</body>
</html>
