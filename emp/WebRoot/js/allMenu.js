/**
 * @author:刘诗滢
 */
function selectType(type)
{
	
	var form=document.getElementById("typeForm");
	form.action="/emp/allMenu.html?aac107="+type;
	alert("/emp/allMenu.html?aac107="+type)
	form.submit();
	
}

layui.use(['element','carousel','form'], function(){
	
	 var form = layui.form;
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    //console.log(elem)
	    layer.msg(elem.text());
	  });
	  
	  <!--轮播-->
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#mainCarousel'
	    ,width: '100%' //设置容器宽度
		,height:"480px"
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
	  }); 
	});

