<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>�ϴ�����</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>

<script>
    function addings()
    {
        var tableobj =document.getElementById("ings");
        var trobj =document.createElement("tr");
        for (var i = 0; i < 2; i++) 
        {
            var tdobj = document.createElement("td");
            tdobj.innerHTML="<input type='text' style='width:100%; height:35px;border:0px;'>";
            trobj.appendChild(tdobj);
        }
        var tdobj = document.createElement("td");
        tdobj.innerHTML="<a class='layui-btn layui-btn-danger' onclick='delecttr(this)'>ɾ��</a>";
        trobj.appendChild(tdobj);
        tableobj.appendChild(trobj);
    }
    
    var j=4;
    var b=j;
    function addzuofa()
    {
        var obj =document.getElementById("zuofa");

        for(var i=1;i<2;i++)
        	{
            var rowobj = document.createElement("div");
            rowobj.className = "layui-row";
            b = j++;
        	}
    	rowobj.innerHTML="<div class='kh30'></div>"
    	+"<div class='layui-col-md1' name='"+b+"aac404'>"+b+"</div>"
        +"<div class='layui-col-md3'><textarea rows='5' cols='20' placeholder='��Ӳ�������' style='width:100%;border:0px;height:240px' name='"+b+"aac402'></textarea></div>"
        +"<div class='layui-col-md5'>"
        +"<input type='file' onchange='PreviewImage(this, "+b+")' name='images'/>"
        +"<div class='layui-upload'>"
        +"<button type='button' class='layui-btn' name='aac108'>�ϴ�ͼƬ</button>"
        +"<div class='layui-upload-list' id='imgPreview"+b+"'>"
        +"<img class='layui-upload-img' width='350px' height='250px'>"
        +"</div>"
        +"</div>"
        +"</div>"
        +"<div class='layui-col-md2'><br><br><br><br><br>&nbsp;&nbsp;<a class='layui-btn layui-btn-danger' onclick='delecttr(this)'>ɾ��</a></div>";
        obj.appendChild(rowobj);
    }
    
    function delecttr(obj)
        {
        var tr = obj.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
        }

    //����ͼƬ
    function Image(imgFile) 
    {
     var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
     if(!pattern.test(imgFile.value)) 
     { 
      alert("ϵͳ��֧��jpg/jpeg/png/gif/bmp��ʽ����Ƭ��");  
      imgFile.focus(); 
     } 
     else 
     { 
      var path; 
      if(document.all)//IE 
      { 
       imgFile.select(); 
       path = document.selection.createRange().text; 
       document.getElementById("imgPreview").innerHTML=""; 
       document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//ʹ���˾�Ч�� 
      } 
      else//FF 
      {
       path = URL.createObjectURL(imgFile.files[0]);
       document.getElementById("imgPreview").innerHTML = "<img src=' "+path+" ' width='600px' height='400px'/>";
      } 
     } 
    }
    
    //����ͼƬ
    function PreviewImage(imgFile,i) 
    {
     var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
     if(!pattern.test(imgFile.value)) 
     { 
      alert("ϵͳ��֧��jpg/jpeg/png/gif/bmp��ʽ����Ƭ��");  
      imgFile.focus(); 
     } 
     else 
     { 
      var path; 
      if(document.all)//IE 
      { 
       imgFile.select(); 
       path = document.selection.createRange().text; 
       document.getElementById("imgPreview").innerHTML=""; 
       document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//ʹ���˾�Ч�� 
      } 
      else//FF 
      {
       path = URL.createObjectURL(imgFile.files[0]);
       document.getElementById("imgPreview"+ i).innerHTML = "<img src=' "+path+" ' width='350px' height='250px'/>";
      } 
     } 
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
					<a href="login.html">��¼</a> <a href="register .html">ע��</a>
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

	<form id="myform" action="<%=path%>/upreci" method="post" enctype="multipart/form-data" >

		<div class="conwidth content clearfix">

			<div class="kh30"></div>
			<input type="text" name="aac102" required lay-verify="required"
		    placeholder="��Ӳ�������" autocomplete="off" class="layui-input">

	<div class="kh30"></div>
    <input type="file" onchange="Image(this)" name="images"/> 
	<div class="layui-upload">
    <button type="submit" class="layui-btn" name="upload" formaction="<%=path%>/upload" formenctype="multipart/form-data">�ϴ�ͼƬ</button>
    <div id="imgPreview" class="layui-upload-list">
    <img class="layui-upload-img" width="600px" height="400px">
    </div>
    </div>  
	<div class="kh30"></div>
	<div class="author">
	<input type="hidden" name="aac106">
		<img src="img/menubook/1.jpg" style="width: 50px; height: 50px" /><span>ʳ���İ�</span>
	</div>

	<div class="kh30"></div>
	<div class="desc">
		<textarea name="aac105" required lay-verify="required"
			placeholder="��Ӳ�������" class="layui-textarea"></textarea>
	</div>

	<div class="kh30"></div>
	<h2>&nbsp; ����</h2>
	<div class="ings">
		<table class="layui-table">
			<tbody id="ings">
				<tr>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;"></td>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;"></td>
					<td><a class="layui-btn layui-btn-danger"
						onclick="delecttr(this)">ɾ��</a></td>
				</tr>
			</tbody>
		</table>
		<input class="layui-btn" type="button" value="׷��һ��"
			onclick="addings()">
	</div>
	
	<div class="kh30"></div>
	<div class="title">
		<h2 class="fubiaoti">����</h2>
	</div>
	<div id="zuofa">
		<div class="layui-row">
			<div class="layui-col-md1" name="aac404">1</div>
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="��Ӳ�������"
				style="width: 100%; border: 0px; height: 240px" name="aac402"></textarea>
			</div>
			<div class="layui-col-md5">
			<input type="file" onchange="PreviewImage(this,1)" name="images" />
		<div class="layui-upload">
		<button type="button" class="layui-btn">�ϴ�ͼƬ</button>
		<div id="imgPreview1" class="layui-upload-list" >
			<img class="layui-upload-img" width="350px" height="250px">
		</div>
	    </div>
			</div>
			<div class="layui-col-md2">
				<br><br><br><br><br>&nbsp;&nbsp;
				<a class="layui-btn layui-btn-danger"
				   onclick="delecttr(this)">ɾ��</a>
			</div>
		</div>
		
		<div class="layui-row">
		<div class="kh30"></div>
			<div class="layui-col-md1" name="aac404">2</div>
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="��Ӳ�������"
				style="width: 100%; border: 0px; height: 240px" name="aac402"></textarea>
			</div>
			<div class="layui-col-md5">
			<input type="file" onchange="PreviewImage(this,2)" name="images" />
		<div class="layui-upload">
		<button type="button" class="layui-btn">�ϴ�ͼƬ</button>
		<div id="imgPreview2" class="layui-upload-list" >
			<img class="layui-upload-img" width="350px" height="250px">
		</div>
	    </div>
			</div>
			<div class="layui-col-md2">
				<br><br><br><br><br>&nbsp;&nbsp;
				<a class="layui-btn layui-btn-danger"
				   onclick="delecttr(this)">ɾ��</a>
			</div>
		</div>
		
		<div class="layui-row">
		<div class="kh30"></div>
			<div class="layui-col-md1" name="aac404">3</div>
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="��Ӳ�������"
				style="width: 100%; border: 0px; height: 240px" name="aac402"></textarea>
			</div>
			<div class="layui-col-md5">
			<input type="file" onchange="PreviewImage(this,3)" name="images" />
		<div class="layui-upload">
		<button type="button" class="layui-btn">�ϴ�ͼƬ</button>
		<div id="imgPreview3" class="layui-upload-list" >
			<img class="layui-upload-img" width="350px" height="250px">
		</div>
	    </div>
			</div>
			<div class="layui-col-md2">
				<br><br><br><br><br>&nbsp;&nbsp;
				<a class="layui-btn layui-btn-danger"
				   onclick="delecttr(this)">ɾ��</a>
			</div>
		</div>
	</div>
								
	<div class="layui-row">
	<input class="layui-btn" type="button" value="׷��һ��"
	onclick="addzuofa('zuofa')">
	</div>

			 <div class="kh30"></div>
			  <div class="layui-row">
			    <div class="fubiaoti">�Ƽ�����ϵ</div>
			    <div >
			      <select style="width:750px;height:30px;" name="aac107">
			        <option value="09" selected="">����</option>
			        <option value="01">����</option>
			        <option value="02">³��</option>
			        <option value="03">����</option>
			        <option value="04">�ղ�</option>
			        <option value="05">���</option>
			        <option value="06">����</option>
			        <option value="07">���</option>
			        <option value="08">�ղ�</option>
			      </select>
			    </div>
			  </div>
			
			<div class="kh30"></div>
			<div class="layui-row">
				<div class="layui-col-md4 layui-col-md-offset3">
					<input class="layui-btn" type="submit" value="��������"
						style="width: 300px; height: 50px;">
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