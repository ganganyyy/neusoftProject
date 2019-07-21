<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
    <title>活动管理界面</title>
    <script src="assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">
     <link rel="stylesheet" href="define/css/stylegan.css" media="all">
 
    <script src="assets/js/jquery.min.js"></script>
    <script type="text/javascript">
    
    function onDel(vaae101)
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/delByIdEvent.html?aae101="+vaae101;
  	 vform.submit();
    } 
    function onEdit(vaae101)
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/queryVoteDetail.html?aae101="+vaae101;
  	 //alert(vform.action);
  	 vform.submit();
    } 
 
    </script> 

</head>

<body class="theme-white">
<br>
<form id="myform" action="<%=path%>/queryEvent.html" method="post">

    <script src="assets/js/theme.js"></script>
    <div class="am-g tpl-g">
    
    <div class="row-content am-cf">
        <div class="row" style="margin-right: 10%;margin-left: 10%;margin-top: 4%;">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title  am-cf">活动列表</div>


                    </div>
                    <div class="widget-body  am-fr">

                        <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                            <div class="am-form-group">
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                    <input type="submit" name="next" value="查询活动" class="am-btn am-btn-default am-btn-success">
                                    <input type="submit" name="next" value="创建活动" class="am-btn am-btn-default am-btn-secondary" formaction="<%=path%>/addEvent.jsp">
                                <!--        <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 淇濆瓨</button>-->
                                        <!--<button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 瀹℃牳</button>
                                        <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 鍒犻櫎</button>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                     

                        <div class="am-u-sm-12">
                            <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                <thead>
                                    <tr>
                                       
                                        <th>活动名称</th>
                                        <th>活动内容</th>
                                        <th>活动类型</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
              
            <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
		     
		     
		      <tr class="gradeX">
		       
               <td>
               <a herf="#" onclick="onEdit('${ins.aae101}')" 
      style="color: #809cd2;font-weight: bold;cursor: pointer;">${ins.aae102 }</a></td>
               <td>${ins.aae103 }</td>
               <c:if test="${ins.aae107==1 }">
               <td>无作品活动</td>
               </c:if>
               <c:if test="${ins.aae107==2 }">
               <td>有作品活动</td>
               </c:if>
               <td>${ins.aae104 }</td>
               <td>${ins.aae105 }</td>
               <td>
               <div class="tpl-table-black-operation">
               <a href="#" onclick="onDel('${ins.aae101}')" class="tpl-table-black-operation-del">
               <i class="am-icon-trash"></i> 删除
               </a>
               </div>
               </td>
              </tr>
			  
		      </c:forEach>
		      <!-- 补充空行 -->
	        

                                            <!-- more data -->
                                        </tbody>
                                    </table>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <!--   <script src="assets/js/amazeui.min.js"></script>-->
    <!--<script src="assets/js/amazeui.datatables.min.js"></script>-->
<!--    <script src="assets/js/dataTables.responsive.min.js"></script>-->
    <script src="assets/js/app.js"></script>

</form>	
</body>

</html>