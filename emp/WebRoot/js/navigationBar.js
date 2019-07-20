/**
 * @author:刘诗滢
 */
$(document).ready(function(){
	
	exeUserOnline();

});

/**
 * 退出登录
 * @returns
 */
function exit()
{
	$.ajax({
		url:'/emp/userExit.do',
		type:'post',
		data:{
			
		},
		cache:'true',
		dataType:'json',
		success:function(data){
			 window.location.href="login.jsp";
			
		},
		error:function(data){
			
			alert("提示：网络故障！");
		}
	});	
}

/**
 * 获取用户信息
 * @returns
 */
function exeUserOnline(){
	$.ajax({
		url:'/emp/userOnline.do',
		type:'post',
		data:{
			
		},
		cache:'true',
		dataType:'json',
		success:function(data){

			//alert("success");
			var html;
			if(data.msg==undefined||data.msg==""||data.msg==null)
			{
				//用户登录后
				document.getElementById("userIcon").src=data.ins.aab106;
			}
			else
			{
				//游客
				html='<a href="login.jsp" style="color:#63707e;">登录</a>';
				$("#userLi").html('<a href="login.jsp">登录</a>');
			}
			
			
		},
		error:function(data){
			
			alert("提示：网络故障！");
		}
	});	
}




layui.use(['element','form'], function(){
	
 var form = layui.form;

  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });

  form.on('select(sch)', function(data){
		 var input=document.getElementsByName("inputHunt")[0];
		 if(data.value=="ab01")
		 {
			 input.placeholder="搜索用户";
		 }
		 else
		 {
			 input.placeholder="搜索食谱";
		 }
	});      
});


