<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>��������</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>

<script type="text/javascript">
function give(vaac201) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/likePro.html?aac201="+vaac201; 
	vform.submit();
}
function cancle(vaac201) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleLikePro.html?aac201="+vaac201; 
	vform.submit();
}
</script>

</head>

<body>
	<div class="header">
		<!--------------ͷ��---------------->
		<div class="conwidth">
			<h1 class="fl">
				<a href="">��<span>ʰ</span></a>
			</h1>
			<div class="search fl" id="search-box">
				<form action="#" method="get" target="_blank">
					<input type="text" placeholder="�������ס�ʳ��" id="sreach-input"
						class="search-text fl" /> <input type="button" value="�Ѳ���"
						class="search-btn fl" />
				</form>
			</div>
			<div class="nav fr">
				<ul>
					<li><a href="index.html">��ҳ</a></li>
					<li class="menu-class"><a href="menu_class.html">���׷���</a>
						<div class="topbar-menu">
							<ul class="plain">
								<li class='topbar-menu-head'>��������</li>
								<li><a href="menu_class.html">�ҳ���</a></li>
								<li><a href="menu_class.html">���ֲ�</a></li>
								<li><a href="menu_class.html">�·���</a></li>
								<li><a href="menu_class.html">���</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">�決</a></li>
								<li><a href="menu_class.html">С��</a></li>
							</ul>
							<ul class="plain">
								<li class='topbar-menu-head'>����ʳ��</li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">ţ��</a></li>
								<li><a href="menu_class.html">��</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">����</a></li>
							</ul>
							<ul class="plain">
								<li class='topbar-menu-head'>ʱ��ʳ��</li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">��</a></li>
								<li><a href="menu_class.html">�㶹</a></li>
								<li><a href="menu_class.html">��ݮ</a></li>
								<li><a href="menu_class.html">���</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">����</a></li>
								<li><a href="menu_class.html">�²�</a></li>
							</ul>
							<div class="span">
								<span><a href="menu_class.html">�鿴ȫ������</a></span>
							</div>
						</div></li>
					<li><a href="popular_menu.html">�˵�</a></li>
					<li><a href="">��Ʒ��̬</a></li>
				</ul>
				<div class="dengluzhuce fr">
					<a href=login.html"">��¼</a> <a href="register .html">ע��</a>
				</div>
			</div>
		</div>
		<div class="suggest" id="sreach-suggest">
			<!---����������ʾsuggest-->
			<ul>
				<li>��" "����û�</li>
				<li>��" "��ز˵�</li>
			</ul>
		</div>
	</div>
	<div class="konghang"></div>
	<!--��Ϊͷ���̶�����Ҫ���ø߶ȿ��а����ݳ���ȥ-->

	<form id="myform" action="<%=path%>/details.html" method="post">
		<input type="submit" name="next" value="��ѯ">
		<div class="conwidth content clearfix">
			<h1>${ins.aac102 }</h1>
			<div class="leftcon">
				<img src="img/menubook/${ins.aac108 }"
					style="width: 660px; height: 440px" />
				<div class="cookde">
					<span class="cooknum">0</span><span>&nbsp;�����������</span>
					<div class="fr">
						<c:choose>
							<c:when test="${1>0}">
								<a class="layui-btn layui-btn-danger">�޸�</a>
								<a class="layui-btn layui-btn-danger"
									href="<%=path%>/delreci.html">ɾ��</a>
							</c:when>
							<c:otherwise>
							
						    <c:choose>
						<c:when test="${ins.aad101!=null}">
							<a class="quxiaozan" id="canclezan" onclick="cancle('${ins.aac201}')" href="#">����</a>							
						</c:when>
						<c:otherwise>
							<a class="dianzan" id="zan" onclick="give('${ins.aac201}')" href="#" >��</a>
						</c:otherwise>
							</c:choose> 
							
								<a class="layui-btn layui-btn-danger">����</a>
								<a class="layui-btn layui-btn-danger">�ղ�</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="author">
					<img
						src="img/menubook/cd9d547428ab11e7947d0242ac110002_271w_209h.jpg" /><span>ʳ���İ�</span>
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
								<p>${ins.aac402 }</p> <img src="img/menubook/${ins.aac403 }"
									width="400px" height="270px"></li>
							</c:forEach>
						</ol>
					</div>

					<div class="question">
						<div class="title">
							<h2 class="fubiaoti">${ins.aac102 }�Ĵ���</h2>
						</div>
						����${ins.aac102 }�������������ʣ� <a href="cook_question.html">��һ������</a>
					</div>

					<div class="upload">�ϴ�������${ins.aac102 }</div>
				</div>
				<div class="kh30"></div>
			</div>
			<div class="rightcon">
				<div class="kh30"></div>
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
				<div class="message">
					<p>�ò��״�����${ins.aac103 }</p>
					<p>
						<span>26</span>�ղ�
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
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/56f12d74883211e6b87c0242ac110003_2448w_3264h.jpg" />
							<p class="title">������ζ�������ĵ�̢�䷽����KFC�Ļ�Ҫ�ۻ�Ҫ��~������óԵĵ�̢�䷽</p>
							<p>FeEl &nbsp;&nbsp;&nbsp;&nbsp; 67778 ����</p>
						</a>
					</div>
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/7ee9900086f211e6b87c0242ac110003_500w_752h.jpg" />
							<p class="title">��Խݮ����</p>
							<p>��֮ &nbsp;&nbsp;&nbsp;&nbsp; 46737 ����</p>
						</a>
					</div>
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/4daad8ea877a11e6a9a10242ac110002_469w_701h.jpg" />
							<p class="title">���˰��Ǵ��Ź�</p>
							<p>С��xiaoci &nbsp;&nbsp;&nbsp;&nbsp; 38657 ����</p>
						</a>
					</div>
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/ed35e338873811e6b87c0242ac110003_450w_600h.jpg" />
							<p class="title">���ּ���</p>
							<p>�� &nbsp;&nbsp;&nbsp;&nbsp; 40401 ����</p>
						</a>
					</div>
				</div>
			</div>
		</div>
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
