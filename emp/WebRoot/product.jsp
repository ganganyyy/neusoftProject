<!-- author:韩金利 -->
<%@ page language="java" pageEncoding="GBK" %>
<%@ include file="navigationBar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>作品</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/product.css"/>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/collection/common.css">
	<script src="js/collection/jquery-1.9.1.min.js" type="text/javascript" charset="GBK"></script>
	<script src="js/collection/common.js" type="text/javascript" charset="GBK"></script>
	<script src="js/collection/user.js" type="text/javascript" charset="GBK"></script>
	<link rel="stylesheet" href="./layui/css/layui.css" media="all">
	<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
	<link href="./define/css/styles.css" rel="stylesheet">
	<script type="text/javascript" src="./define/js/move-top.js"></script>
	<script type="text/javascript" src="./define/js/easing.js"></script>
	<script src="./define/js/jquery.min.js"></script>
</head>

<body>
	<div class="konghang"></div>

	<form id="myform" action="<%=path%>/queryPro.html" method="post">
		<div class="conwidth content clearfix">
			<div class="leftcon">
				<div class="ctitle">
					<span>${ins.aac102}&nbsp;的作品</span>
				</div>
				<img src="${ins.aac204}" width="650px" height="440px"/>
				<div>
					<div class="author">				
						<img src="${ins.aab106}" width="100px"/>
						<span>${ins.aab102}</span>
						<span style="color:#DD3915">做过</span>
						<span>${ins.aac102}</span>
					</div>
					<div class="fr">
					  <c:choose>
	     				<c:when test="${ins.aad201!=null}">
	     				    <a class="quxiaocang" id="canclezan" onclick="cancleColl('${ins.aac201}','${ins.aad201}')" href="javascript:;">已收藏</a>							
						</c:when>
					    <c:otherwise>
					    	<a class="shoucang" id="shoucang" href="javascript:;">收藏</a>
					    </c:otherwise>
					  </c:choose>
					  <c:choose>
	     				<c:when test="${ins.aad101!=null}">
	     				    <a class="quxiaozan" id="canclezan" onclick="cancleLike('${ins.aac201}')" href="#">已赞	</a>						
						</c:when>
					    <c:otherwise>
					    	<a class="dianzan" id="zan" onclick="giveLike('${ins.aac201}')" href="#" >赞</a>
					    </c:otherwise>
					  </c:choose>						
					</div>
					<!--收藏夹弹窗 start-->
			        <div class="popup-box popup-manage">
			            <div class="popup">
			                <div class="popup-tit">添加至收藏夹</div>
			                <span class="popup-close icon-close"></span>
			                <div class="popup-ct">
			                    <div class="txt-box">
			                        <input type="text" maxlength="15" 
			                               style="width:250px;height:33px;" name="caad302">
			                        <button class="layui-btn" onclick="create('${ins.aac201}')">创建</button>
			                    </div>
			                    <ul class="list" id="popup-manage-list">			
									<c:choose>
										<c:when test="${Collections.size() != 0}">
										<c:forEach items="${Collections}" var="insi" varStatus="vs">
							            <li onclick="giveColl('${ins.aac201}','${insi.aad301}')">
							            <input type="text" value="${insi.aad302}"class="input" disabled>
							            </li>
								        </c:forEach>
										</c:when>
										<c:otherwise>
										暂无收藏夹
										</c:otherwise>
									</c:choose>					
			                    </ul>
			                </div>
			            </div>
			        </div>
			        <!--收藏夹弹窗 end-->
				</div>				
				<div class="desc">
					<p>${ins.aac203}</p><br/>
				</div>
				<div class="like-title">
					<p>赞</p>
					<c:forEach items="${likes}" var="ins" varStatus="vs">
						<a><img src="${ins.aab106}" width="40px" height="40px"></a>				        		        
					</c:forEach>
			    </div>
				<div class="content-title">
					<p>评论</p>
					<c:forEach items="${comments}" var="ins" varStatus="vs">
						<div class="content">
							<div class="info">
						    	<img src="${ins.aab106}" width="45px" height="45px">					        
						        <a href="" class="info1">${ins.aab102}</a>
						        <span class="info2">        
						             <a href=""  class="huifu">回复</a>
						        </span>				        
						    </div>
						    <div class="neirong">
						         	${ins.aad404}
						    </div>
						</div>
					</c:forEach>
			    </div>		    
			    <textarea class="layui-textarea" name="aad404" placeholder="说点什么吧"> </textarea>
			    <div class="anniu">
			    	<button class="layui-btn" id="pinglun" onclick="publish('${ins.aac201}')">发表评论</button>
			    	<button type="reset" class="layui-btn layui-btn-primary">清空</button>
			    </div>						
		    </div>	    
		    <div class="rightcon">
				<div class="delete">
					<c:choose>
	     				<c:when test="${ins.aab101=='1'}">
	     				    <a class="shanchu" id="shan" onclick="shanchu('${ins.aac201}')" href="#">删除</a>	
	     				    <a class="shanchu" id="xuigai" onclick="xuigai('${ins.aac201}')" href="#">修改</a>						
						</c:when>
					    <c:otherwise>
					    	
					    </c:otherwise>
					 </c:choose>
				</div>	
			</div>
		 </div>
	</form>
 	<div class="conwidth footer"><!----------------页脚---------------->
        <ul>
            <li><a href="#">美食生活杂志</a></li>
            <li><a href="#">厨房工作</a></li>
            <li><a href="#">社区指导原则</a></li>
            <li><a href="#">美拾出版的书</a></li>
            <li><a href="#">帮助中心</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">意见反馈</a></li>
            <li><a href="#">隐私声明</a></li>
        </ul><br />
    </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/main.js"></script>
        <script src="layui/layui.js"></script>
        <script type="text/javascript">
        	function giveLike(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/likePro.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function cancleLike(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/cancleLikePro.html?aac201="+vaac201; 
        		vform.submit();
        	}
        	function giveColl(vaac201,vaad301) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/collectionPro.html?aac201="+vaac201+"&aad301="+vaad301; 
        		vform.submit();
        	}
           	function cancleColl(vaac201,vaad201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/cancleCollPro.html?aac201="+vaac201+"&aad201="+vaad201; 
        		vform.submit();
        	}
           	function publish(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/addComPro.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function shanchu(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/delByIdPro.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function xuigai(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/findByIdPro2.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function create(vaac201)
           	{
           		 var vform = document.getElementById("myform");
           		 vform.action="<%=path%>/creCollPro.html?aac201="+vaac201;
           		 vform.submit();
           	}
        </script>
</body>
</html>
