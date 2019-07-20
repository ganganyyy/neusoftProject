/**
 * @author:刘诗滢
 */
$(document).ready(function(){
	exeActivity();
	exeLatestMenu();
	exePopularUsers();
	

});

/**
 * 获取最近流行食谱
 * @returns
 */
function exeLatestMenu(){
	$.ajax({
		url:'/emp/LatestMenu.do',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			
			//alert("LatestMenu success");
			html='<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;width: 100%;">'
				+'<legend style="font-size: 15px;">最近流行食谱</legend>'
				+'<div class="layui-field-box" >'
				+'<a href="/emp/LatestMenu.html"  style="font-size: 16px;color:#63707E;float:right">see more</a>'
				+'</div>'
				+'</fieldset>';
			for(var i=0;i<6&&i<data.rows.length;i++)
			{
					html+='<div class="layui-col-md4" >'
					+'<div class="layui-card">'
					+'<div class="layui-card-header" style="text-align: center;font-size: 18px;">'+data.rows[i].aac102+'</div>'
					+'<div class="layui-card-body" align="center" style="font-size: 13px;">'
					+'<a onclick="toMenuDetail('+data.rows[i].aac101+')"><img src="'+data.rows[i].aac108+'" style="widtn:180px;height:100px;"></a>'
					+'<p><a onclick="kitchen('+data.rows[i].aab101+')">'+data.rows[i].aab102+'</a>创建&nbsp;&nbsp;'+data.rows[i].ac02count+'做过</p>'
					+'<a onclick="toMenuDetail('+data.rows[i].aac101+')">read more</a>'
					+'</br>'
					+'</div>'
					+'</div>'
					+'</div>';
				
			}
			$("#latestMenu").html(html);
			
		},
		error:function(data){
			
			alert("fail");
		}
	});	
}

/**
 * 获取人气用户
 * @returns
 */
function exePopularUsers(){
	$.ajax({
		url:'/emp/PopularUsers.do',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			//alert("PopularUsers success");
	        html='<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;width: 100%;">'
				+'<legend style="font-size: 15px;">明星用户</legend>'
				+'<div class="layui-field-box" >'
				+'<a href="/emp/PopularUsers.html"  style="font-size: 16px;color:#63707E;float:right">see more</a>'
				+'</div>'
				+'</fieldset>';
			for(var i=0;i<data.rows.length&&i<3;i++)
			{	
				html+='<div class="layui-card">'
					 +'<div class="layui-card-body layui-row layui-col-space10" align="center" style="font-size: 13px;">'
					 +'<div class="layui-col-md7">'
					 +'<a onclick="kitchen('+data.rows[i].aab101+')"><img class="layui-nav-img" src="'+data.rows[i].aab106+'" style="width:100px;height: 80px;border:1px"></a>'
					 +'</div>'
					 +'<div class="layui-col-md5">'
					 +'<a onclick="kitchen('+data.rows[i].aab101+')">'+data.rows[i].aab102+'</a><span>'+data.rows[i].aab108+'关注</span>'
					 +'<p><span>'+data.rows[i].ac01count+'食谱&nbsp;</span><span>'+data.rows[i].ac02count+'个作品</span></p>'
					 +'<a  onclick="kitchen('+data.rows[i].aab101+')">'
					 +'read more'
					 +'</a>'
					 +'</div>'
					 +'</div>'
					 +'</div>'
				}
			
			$("#popularUsers").html(html);
			
			
		},
		error:function(data){
			
			alert("fail");
		}
	});	
}

/**
 * 获取活动模块
 * @returns
 */
function exeActivity(){
	$.ajax({
		url:'/emp/queryAllVote.do',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			//alert("exeActivity success");
			html='<div class="layui-row">'
				+'<fieldset class="layui-elem-field layui-field-title" style="width: 100%;">'
				+'<legend style="font-size: 15px; text-align: center;">活动公告栏</legend>'
				+'<div class="layui-field-box" >'
				+'<a href="/emp/queryAllVote.html"  style="font-size: 13px;color:#63707E;float:right">see more</a>'
				+'</div>'
				+'</fieldset>'
				+'</div>';
			for(var i=0;i<data.rows.length&&i<3;i++)
			{	
				html+='<div class="layui-row">'
					 +'<div class="layui-card">'
					 +'<div class="layui-card-header" style="text-align:center;">'+data.rows[i].aae102
					 +'</div>'
					 +'<div class="layui-card-body">'
					 +data.rows[i].aae103.substring(0,20)
					 +'<br/>'
					 +'起止日期：'+data.rows[i].aae104
					 +'<br/>'
					 +'截至日期：'+data.rows[i].aae105
					 +'<a onclick="ActiDetail('+data.rows[i].aae101+');" style="float:right;color:#c2c2c2">more details</a>'
					 +'</div>'
					 +'</div>'
					 +'</div>';
			}
			
			$("#mainActivity").html(html);
			
			
		},
		error:function(data){
			
			alert("fail");
		}
	});	
}


