<!-- author:吴佳珊 -->
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
      	 var vform = document.getElementById("myform");
      	 vform.action="<%=path%>/addSubscribe.html?aab101="+vaab101;
      	 vform.submit();
        }
        </script>
	</head>
	<body>
	<form id="myform" action="<%=path%>/queryEvent.html" method="post">
           <div class="layui-container" style="margin-top:50px;margin-left:15%; width:70%">
        <!--   为头部留下控行       -->
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
        		<div class="fr">
					<a href="#" onclick="onSub('${param.aab101}');"><div class="guanzhu2">关注</div></a>
        		</div>
        		</c:if>
        		
        	</div>
        	
        	<div class="kh20"></div>
		</div>
		</c:if>
		
		 <div class="conwidth survey">
        	<div class="navigation">
        		<span class="bqcaipu"><a href="#"  onclick="getRecipe('${param.aab101}')">菜谱</a></span>
        		<span class="teshu bqzuopin"><a href="#">作品</a></span>
        		<span class="bqshoucang"><a href="#">收藏</a></span>
        		<span class="bqliuyanban"><a href="#">点赞</a></span>
        		<span class="bqcaidan"><a href="#">活动作品</a></span>
        	</div>

        	<div class="kh20"></div>
        	
        	<div class="layui-row layui-col-space25">

<c:if test="${rows!=null }">
<c:forEach items="${rows }" var="ins">

<div class="layui-col-md4 layui-col-sm6">
<div class="layadmin-contact-box">
<div class="layui-col-md12">
<div class="layadmin-text-center">
      <img src="${ins.aac204 }" style="border-radius:0%;margin-bottom:15px;">
</div>
</div>
<div class="layui-col-md12">
          <a href="javascript:;">
            <h3 style="color:#d3c5a1;text-align:center;">
              <strong>${ins.aac102 }</strong>
            </h3>
          </a>
          <!-- <button class="layui-btn layui-btn-sm caller-fr" onclick="onDel('${ins.aab101}')">
            <i class="layui-icon layui-icon-close"></i>
                         删除食谱
          </button>
           -->
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
