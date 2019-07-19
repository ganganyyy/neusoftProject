/**
 * @author:刘诗滢、吴佳珊
 */
$(document).ready(function(){
	
	exeUserOnline();

});
/**
 * 跳转到个人中心
 * @param vaab101
 * @returns
 */
function personal(vaab101)
{
	var vform = document.getElementById("myform");
 	vform.action="/emp/queryMessage.html?aab101="+vaab101;
 	vform.submit();
}
/**
 * 跳转到我的厨房
 * @param vaab101
 * @returns
 */
function kitchen(vaab101)
{
	var vform = document.getElementById("myform");
 	vform.action="/emp/queryHomeRecipe.html?aab101="+vaab101;
 	vform.submit();
}
/**
 * 跳转
 * @returns
 */
function toMessage()
{
	var vform = document.getElementById("myform");
 	vform.action="/emp/queryMessage.html";
 	vform.submit();
}

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


