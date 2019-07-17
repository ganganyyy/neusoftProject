<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link rel="stylesheet" href="css/message.css">

</head>
<body>

<div class="layui-container" style="margin-top:50px;margin-left:10%; width:80%">

<div class="layui-row">
 <div class="layui-col-md3">
 <img src="img/head/photo1.jpg" class="head-img">
<ul class="layui-nav layui-nav-tree" lay-filter="test" >
 
    
  
<!-- <ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 20px;">-->
 <li class="layui-nav-item" ><a href="" ><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  ������Ϣ����</a></li>
  <li class="layui-nav-item" ><a href="" ><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  �޸�ͷ��</a></li>
    <li class="layui-nav-item layui-this" ><a href="" ><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  ��������</a></li>
  <li class="layui-nav-item"><a href=""><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  ϵͳ��Ϣ</a></li>

</ul> 
 </div>

 <div class="layui-col-md9">
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>Ĭ�ϱ��</legend>
</fieldset>
  <table class="layui-table">
    <colgroup>
      <col width="150">
      <col width="150">
      <col width="200">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>��Ϣ��</th>
        <th>����</th>
        <th>����ʱ��</th>
        <th>����</th>
      </tr> 
    </thead>
    <tbody>
      <tr>
        <td>����</td>
        <td>����</td>
        <td>1989-10-14</td>
        <td>����������</td>
      </tr>
      <tr>
        <td>�Ű���</td>
        <td>����</td>
        <td>1920-09-30</td>
        <td>��ǧ����֮�����������������ˣ���ǧ����֮�У�ʱ������ĵĻ�Ұ�</td>
      </tr>
      <tr>
        <td>Helen Keller</td>
        <td>��������</td>
        <td>1880-06-27</td>
        <td> Life is either a daring adventure or nothing.</td>
      </tr>
      <tr>
        <td>����</td>
        <td>����</td>
        <td>1103-���γ�������</td>
        <td>�̿������ĸģ�ҲĨ��ȥ������Ӣ�ۡ�����ʵ</td>
      </tr>
      <tr>
        <td>����</td>
        <td>�����壨���壩</td>
        <td>��Ԫǰ-372��</td>
        <td>Գǿ�����ǿ����ǿ����Գ��ǿ�� </td>
      </tr>
    </tbody>
  </table>
  </div>
</div>

          
<script src="layui/layui.js" charset="utf-8"></script>

</div>
</body>
</html>