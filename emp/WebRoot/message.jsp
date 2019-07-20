<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
<title>系统消息</title>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link rel="stylesheet" href="define/css/stylegan.css" media="all">
<link rel="stylesheet" href="css/message.css">


<script type="text/javascript">
    function toUpgrade()
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/upgradeCount.html";
  	 vform.submit();
    } 
    function toMessage()
    {
    	var vform = document.getElementById("myform");
     	vform.action="<%=path%>/queryMessage.html";
     	vform.submit();
    }
    function toPhoto()
    {
    	var vform = document.getElementById("myform");
     	vform.action="<%=path%>/queryPhoto.html";
     	vform.submit();
    }
    var count=0;
    function onSelect(vstate)
    {
  	  vstate?count++:count--;
  	  var vdel=document.getElementById("del");
  	  vdel.disabled=(count==0);
    }
    function toInfo()
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/queryPersonalInfo.html";
  	 vform.submit();
    } 
    function onDel(vaab301)
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/delByIdMessage.html?aab301="+vaab301;
  	 vform.submit();
    } 
 
    </script> 
</head>
<body>
<div class="layui-container" style="margin-top:90px;margin-left:10%; width:80%">
<form id="myform" action="<%=path%>/queryEvent.html" method="post">
<div class="layui-row">
 <div class="layui-col-md3" style="margin-top: 30px;">

 <img src="${ins.aab106 }" class="head-img">
 
<ul class="layui-nav layui-nav-tree" lay-filter="test" >

<!-- <ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 20px;">-->
<li class="layui-nav-item" ><a href="#" onclick="toInfo();"><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  个人信息设置</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toPhoto();"><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  修改头像</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toUpgrade();"><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  申请升级</a></li>
<li class="layui-nav-item layui-this"><a href="#" onclick="toMessage();"><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  系统消息</a></li>

</ul> 
 </div>

 <div class="layui-col-md9">
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>系统消息</legend>
</fieldset>
  <table class="layui-table">
    <colgroup>
      <col width="100">
      <col width="250">
      <col width="200">
      <col width="150">
      <col width="50">
    
    </colgroup>
    <thead>
      <tr>
        <th>选择</th>
        <th>消息内容</th>
        <th>消息时间</th>
        <th>查看状态</th>
        <th>删除</th>
      </tr> 
    </thead>
    <c:if test="${rows!=null }">
    
    <tbody>
    <c:forEach items="${rows }" var="ins" varStatus="vs">
      <tr>
      
        <td><input type="checkbox" name="idlist" value="${ins.aab301 }"
				             onclick="onSelect(this.checked)"></td>
        <c:if test="${ins.aab303==0 }">
        <td><a herf="#" id="addAsset" class="colorA" onclick="onLook('${ins.aab302 }','${ins.aab301 }')">${ins.aab302 }</a></td>
        </c:if>
        <c:if test="${ins.aab303==1 }">
        <td><a herf="#">${ins.aab302 }</a></td>
        </c:if>
        <td>${ins.aab304 }</td>
        <c:if test="${ins.aab303==0 }">
        <td style="color:#df2e2e;"><i class="layui-icon layui-icon-face-smile"></i>未查看</td>
        </c:if>
        <c:if test="${ins.aab303==1 }">
        <td >已查看</td>
        </c:if>
        <td> <button type="button" onclick="onDel('${ins.aab301}')" class="layui-btn layui-btn-sm layui-btn-green">
        <i class="layui-icon layui-icon-delete"></i>删除</button></td>
         
      </tr>
      </c:forEach>

    </tbody>
   
    </c:if>
  </table>
    
   <input type="submit" class="layui-btn layui-btn-sm layui-btn-green-fr" id="del" value="删除已选" 
	              formaction="<%=path%>/delMessage.html"  disabled="disabled">
        
  </div>
 
</div>
</form>
          
<script src="layui/layui.js" charset="utf-8"></script>

</div>
 <script>
 function onLook(vaab302,vaab301)
 {
  layer.alert(vaab302,function(index){
	  var vform = document.getElementById("myform");
	  vform.action="<%=path%>/updateMessage.html?aab301="+vaab301;
	  vform.submit();
  layer.close(index);
  });
 }
  </script>
</body>
    <!-- 弹窗 -->
    <script src="layer/layer.js"></script>
    <script src="layer/extend/layer.ext.js"></script>

</html>