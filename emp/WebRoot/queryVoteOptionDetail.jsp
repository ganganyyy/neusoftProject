<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
	<head>
		<title>用户投票作品详情</title>
		<link rel="stylesheet" type="text/css" href="css/main.css">
		<link rel="stylesheet" type="text/css" href="css/voteDetail.css"/>
	<script type="text/javascript">
	function onVote(vaae201,vaae101)
	{
		var vform = document.getElementById("myform");
		vform.action="<%=path%>/addVote.html?aae201="+vaae201;
		vform.submit();
	}
	</script>
	</head>

	<body>
	
		<form id="myform" action="<%=path%>/addVote.html" method="post"></form>
        <div class="konghang"></div>


		<div class="conwidth content clearfix">
			<h1>${ins.aae102 }</h1>
			<div class="leftcon">
			<div class="img_framesize">
				<img class="img_size" src="${ins.aae204 }"/>
			</div>
				<div class="cookde">
					<span>已获得 </span><span class="cooknum">${ins.aae202 }</span><span> 票</span>
					<div class="fr">
		<input type="submit" class="shoucang" onclick="onVote('${param.aae201}')" value="投票">
					</div>
				</div>
				<div class="author">
					<img src="img/menubook/cd9d547428ab11e7947d0242ac110002_271w_209h.jpg"/>
					<span>${ins.aab102 }</span>
				</div>
				<div class="desc">
				<p>${ins.aae203 }</p>	
				</div>

				<div class="kh30"></div>

			</div>
		
		</div>

        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/main.js"></script>
	</body>
</html>

