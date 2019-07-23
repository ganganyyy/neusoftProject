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
        <link rel="stylesheet" type="text/css" href="css/myRP.css"/>

<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>

<script type="text/javascript">
function getEvent(vaab101)
{
	var vform = document.getElementById("myform");
	    vform.action="<%=path%>/queryHomeEvent.html?aab101="+vaab101;
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
	vform.action="<%=path%>/browsefindByIdarticle.html?aac201="+vaac301;
	vform.submit();
}
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
	<div class="konghang"></div>
                <c:if test="${ins!=null }">
				<div class="conwidth">
				<div class="jianjie">
				<img src="${ins.aab106 }" class="img"/>
				<div class="fl">
				<h2>${ins.aab102 }的厨房</h2>
				<!-- <span><i class="icon1"></i>2016-3-23 锟斤拷锟斤拷</span><br />-->
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
        		<span class="bqcaipu"><a href="#" onclick="getRecipe('${sessionScope.aab101Self}')">菜谱</a></span>
        		<span class="bqzuopin"><a href="#" onclick="getWork('${sessionScope.aab101Self}')">作品</a></span>
        		<span class="teshu bqshoucang"><a href="#" onclick="getCol('${sessionScope.aab101Self}')">收藏</a></span>
        		<span class="bqliuyanban"><a href="#" onclick="getLike('${sessionScope.aab101Self}')">点赞</a></span>
        		<span class="bqliuyanban"><a href="#" onclick="getEvent('${param.aab101}')">活动作品</a></span>
        	</div>

        	<div class="kh20"></div>
          <form id="myform" method="post">
            <input type="hidden" name="aad301" value="${param.aad301}">
        	<div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>菜谱</legend>
				</fieldset>
				     <c:forEach items="${reci}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a onclick="chacaipu('${ins.aac101}')">
		            				<img src="${ins.aac108}" alt="锟斤拷锟斤拷图片" width="300px" height="240px"/>
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
				     <c:forEach items="${pro}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chazuopin('${ins.aac201}')">
		            				<img src="${ins.aac204}" alt="锟斤拷品图片" width="300px" height="240px"/>
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
