<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
	<head>
		<meta charset="GBK">
		<title>活动投票界面</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/vote.css"/>
		<link rel="stylesheet" href="define/css/stylegan.css" media="all">
		<script type="text/javascript">
		
		function onSel(vaae201)
		 {
		  	 var vform = document.getElementById("myform");
		  	 vform.action="<%=path%>/findByIdVote.html?aae201="+vaae201;
		  	 vform.submit();
		 } 
		function onVote(vaae201,vaae101)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/addVote.html?aae201="+vaae201+"&aae101="+vaae101;
			vform.submit();
		}
		
		function checkApply(vaae101)
		{
			
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/checkByIdVote.html?aae101="+vaae101;
			vform.submit();
		}
		
		</script>
	</head>
	<body>
<!-- -->
	<form id="myform" action="<%=path%>/checkByIdVote.html" method="post">
		
		

	
		<div class="konghang"></div>
		
		<c:if test="${rows!=null }">
		
		<!-- 活动名称 -->
		<c:forEach items="${rows }" var="ins" begin="0" end="0" varStatus="vs">
		<div class="conwidth">
        	<div class="jianjie">
        		<div class="fl">
        				<h2>${ins.aae102 }</h2>
						<p>${ins.aae103 }</p>
        				
        		</div>
        		<div class="fr">
        			<div class="apply">
        			<div class="kh30"></div>
        			<c:if test="${ins.aae107==2 }">
        			 <button onclick="checkApply('${param.aae101}')">参加活动</button>
        			 </c:if>
        
        		</div>
        		
        	</div>
        	<div class="kh20"></div>
        		
        	</div>
        	
        	<!--  <div class="kh20"></div>
		</div>
		-->
		
		
		</c:forEach>


        <div class="conwidth survey">
        	<div class="kh20"></div>
            <div class="userprod clearfix">
            
            <!-- 活动选项 -->
            <c:forEach items="${rows }" var="ins" varStatus="vs">
            	<c:if test="${ins.aae107==1 }">
            	<div class="userproduction" style="height:100px;">
            		<p class="name">${ins.aae203 }</p>
        			<div class="stars">
        				<span class="a">目前票数</span>${ins.aae202 }票
        				
      					<input type="submit" class="button" onclick="onVote('${ins.aae201 }','${param.aae101}')" value="投票">
        				<!-- <button>投票</button> -->
        				
        			</div>
            	</div>
            	</c:if>
            	<c:if test="${ins.aae107==2 }">
            	<div class="userproduction">
            	
            		<div class="cover">
            			<img class="img_size" src="${ins.aae204 }" onclick="onSel('${ins.aae201}')"/>
            			<a href="#" class="active"></a>
            		</div>
            		
                   
                   <p>${ins.aae203 }</p>
                   
        			
        			<div class="stars">
        				<span class="a">目前票数</span>${ins.aae202 }票
        				
        				<input type="submit" class="button" onclick="onVote('${ins.aae201 }','${param.aae101}')" value="投票">
        				<!-- <button>投票</button> -->
        				
        			</div>
            	</div>
            	</c:if>
            	
            	</c:forEach>
            
            	
			</div>
			
			</div>
			
			
			</c:if>
		
            <div class="kh30"></div>
		
	
        
			
        

		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/main.js" type="text/javascript" charset="utf-8"></script>


	</form>
	</body>

</html>
