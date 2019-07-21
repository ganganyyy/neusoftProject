<!-- author:韩金利 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
	<title>作品动态</title>
	<link href="layui/css/layui.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<link rel="stylesheet" type="text/css" href="css/queryPro.css"/>
	<link rel="stylesheet" href="./layui/css/layui.css" media="all">
	<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
	<link href="./define/css/styles.css" rel="stylesheet">
	<script type="text/javascript" src="./define/js/move-top.js"></script>
	<script type="text/javascript" src="./define/js/easing.js"></script>
	<script src="./define/js/jquery.min.js"></script>	
</head>
<body>
	
	<div class="konghang"></div>
    <div class="conwidth">
    	<div class="conwidth survey">
        	<div class="fubiaoti2 clearfix">
        		<h1 style="font-family:'Microsoft YaHei';font-size:34px;">按照菜谱，秀出你的作品</h1>
        	</div>
        	<div class="kh20"></div>
        	
			<div class="userprod clearfix">
				<form id="myform" method="post">	
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="onEdit('${ins.aac201}')">
		            				<img src="${ins.aac204}" alt="作品图片" width="280px" height="200px"/>
		            			</a>
		            		</div>
		        			<p>&nbsp;&nbsp;${ins.aac203}</p>
		        			<div class="stars">
		        				<span class="a">${ins.aac202}</span>
		        				<span class="b">${ins.aac206}</span>
		        			</div>
				         </div>
				      </c:forEach>
				 </form>
			  </div>
	  	</div>
    </div>
        
     <div class="conwidth footer"><!----------------页脚---------------->
        <ul>
            <li><a href="#">帮助中心</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">意见反馈</a></li>
            <li><a href="#">隐私声明</a></li>
        </ul><br />
    </div>


	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
	<script src="layui/layui.js"></script>
	<script type="text/javascript">
      function onEdit(vaac201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPro.html?aac201="+vaac201;
    	 vform.submit();
      }
   </script>

</body>
</html>