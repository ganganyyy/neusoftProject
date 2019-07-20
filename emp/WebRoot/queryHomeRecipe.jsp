<!-- author:吴佳珊  ${sessionScope.aab101Self==param.aab101 }-->
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
		<link rel="stylesheet" href="define/css/stylegan.css" media="all">
        <link rel="stylesheet" href="css/test.css">
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
	
	<form id="myform" action="<%=path%>/queryEvent.html" method="post">
   <div class="layui-container" style="margin-top:50px;margin-left:15%; width:70%;"> 
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
        		<c:if test="${sessionScope.aab101Self!=param.aab101 }">
        		<c:if test="${sub.aab201!=null }">
        		<div class="fr">
					<a href="#"><div class="guanzhu2">已关注</div></a>
        		</div>
        		</c:if>
        		<c:if test="${sub.aab201==null }">
        		<div class="fr">
					<a href="#" onclick="onSub('${param.aab101}');"><div class="guanzhu2">关注</div></a>
        		</div>
        		</c:if>
        		</c:if>
        	</div>
        	
        	<div class="kh20"></div>
		</div>
		</c:if>
		
		
		 <div class="conwidth survey">
        	<div class="navigation">
        		<span class="teshu bqcaipu"><a href="#" onclick="getRecipe('${param.aab101}')">菜谱</a></span>
        		<span class="bqzuopin"><a href="#" onclick="getWork('${param.aab101}')">作品</a></span>
        		<span class="bqshoucang"><a href="#" onclick="getCol('${param.aab101}')">收藏</a></span>
        		<span class="bqliuyanban"><a href="#" onclick="getLike('${param.aab101}')">点赞</a></span>
        	</div>
        
        <c:if test="${sessionScope.aab101Self==param.aab101 }">
        	<div class="kh40">
        	<button type="button" onclick="addRecipe();" class="guanzhu3">
            <i class="layui-icon layui-icon-add-1"></i>创建菜谱</button>	
        	</div>
        </c:if>
        	<div class="layui-row layui-col-space25">

<c:if test="${rows!=null }">
<c:forEach items="${rows }" var="ins">

<div class="layui-col-md4 layui-col-sm6">
<div class="layadmin-contact-box">
<div class="layui-col-md12">
<div class="layadmin-text-center">
      <img src="${ins.aac108 }" style="border-radius:0px;margin-bottom:15px;">
</div>
</div>
<div class="layui-col-md12">
          <a href="javascript:;">
            <h3 style="color:#d3c5a1;text-align:center;">
              <strong>${ins.aac102 }</strong>
            </h3>
          </a>
</div>
</div>
</div>

</c:forEach>
</c:if>


</div> 
            
       </div>
      
		</div>
		
		</form>
	</body>
</html>
