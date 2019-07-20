<!-- author:������ -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>��������</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>

<link rel="stylesheet" href="css/collection/common.css">

<script src="js/collection/jquery-1.9.1.min.js" type="text/javascript" charset="GBK"></script>
<script src="js/collection/common.js" type="text/javascript" charset="GBK"></script>
<script src="js/collection/user.js" type="text/javascript" charset="GBK"></script>
<script type="text/javascript">
function publish(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/commentReci.html?aac101="+vaac101; 
	vform.submit();
}
function give(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/likeReci.html?aac101="+vaac101; 
	vform.submit();
}
function cancle(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleLikeReci.html?aac101="+vaac101; 
	vform.submit();
}
function shoucang(vaac101,vaad301) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/shoucangReci.html?aac101="+vaac101+"&aad301="+vaad301; 
	vform.submit();
}
function cancleShoucang(vaac101,vaad201) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleshoucangReci.html?aac101="+vaac101+"&aad201="+vaad201; 
	vform.submit();
}
function guanzhu(vaac101,vaac106) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/guanzhu.html?aac101="+vaac101+"&aac106="+vaac106;
	vform.submit();
}
function cancleGuanzhu(vaac101,vaac106) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleGuanzhu.html?aac101="+vaac101+"&aac106="+vaac106; 
	vform.submit();
}
function create(vaac101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/creAndColl.html?aac101="+vaac101;
	 vform.submit();
}
</script>

</head>

<body>
	<div class="konghang"></div>
	<!--��Ϊͷ���̶�����Ҫ���ø߶ȿ��а����ݳ���ȥ-->

	<form id="myform" action="<%=path%>/details.html" method="post">
		<div class="conwidth content clearfix">
			<h1>${ins.fvalue }&nbsp;&nbsp;${ins.aac102 }</h1>
			<div class="leftcon">
				<img src="${ins.aac108 }"
					style="width: 660px; height: 440px" />
				<div class="cookde">
					<span class="cooknum">${ins.pronum }</span><span>&nbsp;�����������</span>
					<div class="fr">
						<c:choose>
							<c:when test="${ins.aac106!=sessionScope.aab101Self}">	
			<c:choose>
				<c:when test="${ins.aad101!=null}">
					<a class="layui-btn layui-btn-danger" onclick="cancle('${ins.aac101}')">����</a>							
				</c:when>
				<c:otherwise>
					<a class="layui-btn layui-btn-danger" onclick="give('${ins.aac101}')">����</a>
				</c:otherwise>
			</c:choose>
				
			<c:choose>
				<c:when test="${ins.aad201!=null}">
					<a class="layui-btn layui-btn-danger" onclick="cancleShoucang('${ins.aac101}','${ins.aad201}')">���ղ�</a>							
				</c:when>
				<c:otherwise>
				    <a class="layui-btn layui-btn-danger" id="shoucang" href="javascript:;">�ղ�</a>
				</c:otherwise>
			</c:choose>
							</c:when>
							<c:otherwise>
			<a class="layui-btn layui-btn-danger" href="<%=path%>/updateDetail.html?aac101=${ins.aac101}">�޸�</a>
			<a class="layui-btn layui-btn-danger"
			   href="<%=path%>/delreci.html?aac101=${ins.aac101}">ɾ��</a>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
				<div class="author">
					<img src="${ins.aab106 }" width="50px" height="50px"/><span>${ins.aab102 }</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<c:choose>
						<c:when test="${ins.aab201!=null}">
							<a class="layui-btn layui-btn-danger" onclick="cancleGuanzhu('${ins.aac101}','${ins.aac106}')">�ѹ�ע</a>							
						</c:when>
						<c:otherwise>
							<a class="layui-btn layui-btn-danger" onclick="guanzhu('${ins.aac101}','${ins.aac106}')">��ע</a>
						</c:otherwise>
					</c:choose>
					
				</div>

				<div class="desc">
					<p>${ins.aac105 }</p>
					<br />
				</div>
				<div class="kh30"></div>

				<h2>&nbsp; ����</h2>
				<div class="ings">
					<table class="layui-table" lay-skin="line" style="border: 0px">
						<c:forEach items="${rows2 }" var="ins" varStatus="vs">
							<tr>
								<td>${ins.aac603 }</td>
								<td>${ins.aac602 }</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<div class="kh30"></div>
				<div class="zuofa">
					<div class="title">
						<h2 class="fubiaoti">${ins.aac102 }������</h2>
					</div>
					<div>
						<ol>
							<c:forEach items="${rows1 }" var="ins" varStatus="vs">
								<li><span>${ins.aac404 }</span>
								<p>${ins.aac402 }</p> <img src="${ins.aac403}"
									width="400px" height="270px"></li>
							</c:forEach>
							<li></li>
						</ol>
					</div>

                    <br>
					<div class="upload"><a href="<%=path%>/addPro.jsp?aac207=${ins.aac101}">�ϴ�������${ins.aac102 }</a></div>
				</div>
				<div class="kh30"></div>
			</div>
			<div class="rightcon">
				<div class="look">
					<div class="title">
						<h2 class="fubiaoti">��㿴��</h2>
					</div>
					<span><a href="#">�����ʰ��۲�</a></span><span><a href="#">�ڴ�������</a></span>
					<span><a href="#">�ɹ��л�����</a></span><span><a href="#">�ɿ�����</a></span>
					<span><a href="#">�㹽���ռ���</a></span><span><a href="#">ľ���ո���</a></span>
					<span><a href="#">�������</a></span><span><a href="#">�ϲ���Ƭ��</a></span>
					<span><a href="#">��������</a></span><span><a href="#">�س�Ģ��</a></span>
				</div>
				<div class="kh30"></div>
				
				<div>
					<p class="fubiaoti">��</p><br>
					<c:forEach items="${rows4}" var="ins" varStatus="vs">	
					<a><img src="${ins.aab106}" width="45px" height="45px" style="border-radius: 50%"></a>
					</c:forEach>
			    </div>
			    
			 <div class="kh30"></div>
			    
			<div>
			<p class="fubiaoti">����</p>
			<c:forEach items="${rows5}" var="ins" varStatus="vs">
                  <div class="content">
					<div class="info">
				    	<img src="${ins.aab106}" width="45px" height="45px"style="border-radius: 50%">					        
				        <a>${ins.aab102}</a>
				    </div>
				    <div class="neirong">
				         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         ${ins.aad404}
				    </div>
			</div>
			</c:forEach>
			</div>
			    <textarea class="layui-textarea" rows="5" cols="20" placeholder="˵��ʲô��"
				style="height: 50px" name="aad404"></textarea>
				<br>
			    <div class="anniu">
			    	<button class="layui-btn" id="pinglun" onclick="publish('${ins.aac101}')">��������</button>
			    	<button type="reset" class="layui-btn layui-btn-primary">���</button>
			    </div>
				
				<div class="message">
					<p>�ò��״�����${ins.aac103 }</p>
					<p>
						<span>${ins.aac110 }</span>�ղ�
					</p>
					<p>��Ȩ���������У�û�����߱��˵���������κ��˲���ת�ػ�ʹ��������κβ��ֵ����ݡ�</p>
				</div>
			</div>
		</div>

		<div class="bottomcon">
			<div class="conwidth">
				<div class="kh30"></div>
				<div class="alsolike">
				
					<div class="title">
						<h2 class="fubiaoti">${ins.aac102 }����Ʒ</h2>
					</div>
					
					<c:choose>
						<c:when test="${rows3.size() != 0}">
						<c:forEach items="${rows3}" var="ins" varStatus="vs">
				     	<div class="likemenu">
						<a href="#"> 
					        <img src="${ins.aac204}"/>
							<p class="title">${ins.aac203 }</p>
					    </a>
					    </div>
				        </c:forEach>
						</c:when>
						<c:otherwise>
							��δ���û��ϴ���Ʒ
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
		
		 <!--�ղؼе��� start-->
        <div class="popup-box popup-manage">
            <div class="popup">
                <div class="popup-tit">������ղؼ�</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                    <div class="txt-box">
                        <input type="text" maxlength="15" 
                               style="width:250px;height:33px;" name="caad302">
                        <button class="layui-btn" onclick="create('${ins.aac101}')">����</button>
                    </div>
                    <ul class="list" id="popup-manage-list">			
		<c:choose>
			<c:when test="${rows.size() != 0}">
			<c:forEach items="${rows}" var="insi" varStatus="vs">
            <li onclick="shoucang('${ins.aac101}','${insi.aad301}')">
            <input type="text" value="${insi.aad302}"class="input" disabled>
            </li>
        </c:forEach>
		</c:when>
		<c:otherwise>
		�����ղؼ�
		</c:otherwise>
		</c:choose>
		
                    </ul>
                </div>
            </div>
        </div>
        <!--�ղؼе��� end-->
		
	</form>
	<div class="conwidth footer">
		<!----------------ҳ��---------------->
		<ul>
			<li><a href="#">��ʳ������־</a></li>
			<li><a href="#">��������</a></li>
			<li><a href="#">����ָ��ԭ��</a></li>
			<li><a href="#">��ʰ�������</a></li>
			<li><a href="#">��������</a></li>
			<li><a href="#">��ϵ����</a></li>
			<li><a href="#">�������</a></li>
			<li><a href="#">��˽����</a></li>
		</ul>
		<br />
		<p>�ٺٺ���Ŀ��</p>
	</div>
</body>
</html>
