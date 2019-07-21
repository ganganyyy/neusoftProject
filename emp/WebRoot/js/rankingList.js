/**
 * @author:刘诗滢
 */
$(document).ready(function(){
	
	exeRanking1();
	exeRanking2();
	exeRanking3();

});


/**
 * 获取人气用户
 * @returns
 */
function exeRanking1(){
	$.ajax({
		url:'/emp/PopularUsers.do',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			//alert("PopularUsers success");
			var html='<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;width: 100%;">'
				+'<legend style="font-size: 15px;">关注最多</legend>'
				+'</fieldset>';
			for(var i=0;i<data.rows.length&&i<10;i++)
			{	
				html+='<div class="layui-card">'
					 +'<div class="layui-card-body layui-row layui-col-space10" align="center" style="font-size: 13px;">'
					 +'<div class="layui-col-md5">'
					 +'<a onclick="kitchen('+data.rows[i].aab101+')"><img class="layui-nav-img" src="'+data.rows[i].aab106+'" style="width:100px;height: 80px;border:1px"></a>'
					 +'</div>'
					 +'<div class="layui-col-md5">'
					 +'<a onclick="kitchen('+data.rows[i].aab101+')">'+data.rows[i].aab102+'</a>'
					 +'<br/><span>'+data.rows[i].aab108+'关注</span>'
					 +'<p><span>'+data.rows[i].ac01count+'食谱&nbsp;</span><span>'+data.rows[i].ac02count+'个作品</span></p>'
					 +'<a  onclick="kitchen('+data.rows[i].aab101+')">'
					 +'更多细节...'
					 +'</a>'
					 +'</div>'
					 +'</div>'
					 +'</div>'
				}
			
			$("#ranking1").html(html);
			
			
		},
		error:function(data){
			
			alert("fail");
		}
	});	
}


/**
 * 排行榜食谱
 * 按收藏数
 * @returns
 */
function exeRanking2(){
	$.ajax({
		url:'/emp/popularMenu.do?option=0',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			//alert("exeRanking2 success");
			var html='<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;width: 100%;">'
				+'<legend style="font-size: 15px;">收藏最多</legend>'
				+'</fieldset>';
			for(var i=0;i<data.rows.length&&i<10;i++)
			{	
				html+='<div class="layui-card">'
					 +'<div class="layui-card-body layui-row layui-col-space10" align="center" style="font-size: 13px;">'
					 +'<div class="layui-col-md6">'
					 +'<a onclick="toMenuDetail('+data.rows[i].aac101+')"><img class="layui-nav-img" src="'+data.rows[i].aac108+'" style="width:100px;height: 80px;border:1px"></a>'
					 +'</div>'
					 +'<div class="layui-col-md5">'
					 +'<a onclick="kitchen('+data.rows[i].aab101+')">'+data.rows[i].aac102+'</a><span>'
					 +'<p><span>'+data.rows[i].aab102+'&nbsp;创建</span><span>'+data.rows[i].aac110+'收藏</span></p>'
					 +'<a onclick="toMenuDetail('+data.rows[i].aac101+')">'
					 +'更多细节...'
					 +'</a>'
					 +'</div>'
					 +'</div>'
					 +'</div>'
				}
			
			$("#ranking2").html(html);
			
			
		},
		error:function(data){
			
			alert("fail");
		}
	});	
}

/**
 * 排行榜食谱
 * 按点赞数
 * @returns
 */
function exeRanking3(){
	$.ajax({
		url:'/emp/popularMenu.do?option=1',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			//alert("exeRanking3 success");
			var html='<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;width: 100%;">'
				+'<legend style="font-size: 15px;">点赞最多</legend>'
				+'</fieldset>';
			for(var i=0;i<data.rows.length&&i<10;i++)
			{	
				html+='<div class="layui-card">'
					 +'<div class="layui-card-body layui-row layui-col-space10" align="center" style="font-size: 13px;">'
					 +'<div class="layui-col-md5">'
					 +'<a onclick="toMenuDetail('+data.rows[i].aac101+')"><img class="layui-nav-img" src="'+data.rows[i].aac108+'" style="width:100px;height: 80px;border:1px"></a>'
					 +'</div>'
					 +'<div class="layui-col-md5">'
					 +'<a onclick="kitchen('+data.rows[i].aab101+')">'+data.rows[i].aac102+'</a><span>'
					 +'<p><span>'+data.rows[i].aab102+'&nbsp;创建</span><span>'+data.rows[i].aac109+'点赞</span></p>'
					 +'<a onclick="toMenuDetail('+data.rows[i].aac101+')">'
					 +'更多细节...'
					 +'</a>'
					 +'</div>'
					 +'</div>'
					 +'</div>'
				}
			
			$("#ranking3").html(html);
			
			
		},
		error:function(data){
			
			alert("fail");
		}
	});	
}

