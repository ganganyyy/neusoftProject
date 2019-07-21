<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <link rel="stylesheet" href="css/area.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <title>地图</title>
</head>
<body>
	<div class="my-map">
		<div id="container"></div>
	</div>
	<script src="https://webapi.amap.com/maps?v=1.4.15&key=dc45539a898fa3f2e694f3e9e0bb8762"></script>
    <!-- UI组件库 1.0 -->
    <script src="https://webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
	<script>
		var map = new AMap.Map('container', {
	    resizeEnable: true,
	    zoom:4,
		zooms: [4,7],
	    center: [100, 45],
	    mapStyle:'amap://styles/11eac35b0462ac3a95a65fdc24343416'
	    });
		

        AMapUI.load(['ui/geo/DistrictExplorer', 'lib/$'], function(DistrictExplorer, $) {

	        //创建一个实例
	        var districtExplorer = window.districtExplorer = new DistrictExplorer({
	            eventSupport: true, //打开事件支持
	            map: map
	        });

		    //当前聚焦的区域
	        var currentAreaNode = null;

	        //鼠标hover提示内容
	        var $tipMarkerContent = $('<div class="tipMarker top"></div>');

	        var tipMarker = new AMap.Marker({
	            content: $tipMarkerContent.get(0),
	            offset: new AMap.Pixel(0, 0),
	            bubble: true
	        });

	        //根据Hover状态设置相关样式
	        function toggleHoverFeature(feature, isHover, position) {

	            tipMarker.setMap(isHover ? map : null);

	            if (!feature) {
	                return;
	            }

	            var props = feature.properties;

	            if (isHover) {

	                //更新提示内容
	                $tipMarkerContent.html(props.name);
	                //更新位置
	                tipMarker.setPosition(position || props.center);
	            }

	            //更新相关多边形的样式
	            var polys = districtExplorer.findFeaturePolygonsByAdcode(props.adcode);
	            for (var i = 0, len = polys.length; i < len; i++) {

	                polys[i].setOptions({
	                    fillOpacity: isHover ? 0.5 : 0.2
	                });
	            }
	        }

	        //监听feature的hover事件
	        districtExplorer.on('featureMouseout featureMouseover', function(e, feature) {
	            toggleHoverFeature(feature, e.type === 'featureMouseover',
	                e.originalEvent ? e.originalEvent.lnglat : null);
	        });

	        //监听鼠标在feature上滑动
	        districtExplorer.on('featureMousemove', function(e, feature) {
	            //更新提示位置
	            tipMarker.setPosition(e.originalEvent.lnglat);
	        });

	        //feature被点击
	        districtExplorer.on('featureClick', function(e, feature) {

	            var props = feature.properties;
	            switch(props.adcode) {
				     case 370000:
				        infoWindow1.open(map, props.center);
				        break;
				     case 430000:
				     	infoWindow2.open(map, props.center);
				     	break;
				     case 510000:
				     	infoWindow3.open(map, props.center);
				     	break;
				     case 440000:
				     	infoWindow4.open(map, props.center);
				     	break;
				     case 320000:
				        infoWindow5.open(map, props.center);
				        break;
				     case 330000:
				     	infoWindow6.open(map, props.center);
				     	break;
				     case 350000:
				     	infoWindow7.open(map, props.center);
				     	break;
				     case 340000:
				     	infoWindow8.open(map, props.center);
				     	break;
				     default:
				        break;
				} 
	             
	        });

			//实例化信息窗体
			var title1 = '鲁菜',
			    content1 = [];
			
			content1.push("<img src='img/map/tcly.jpg'  width='100px'>鲁菜，是起源于山东的齐鲁风味，其发源地为山东省淄博市，是历史最悠久、技法最丰富、难度最高、最见功力的菜系。经典菜品有一品豆腐、葱烧海参、三丝鱼翅、白扒四宝、糖醋黄河鲤鱼、九转大肠等。");
			content1.push("<a href='<%=path%>/allMenu.html?aac107=02'>了解更多</a>");
			var infoWindow1 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title1, content1.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//实例化信息窗体
			var title2 = '湘菜',
			    content2 = [];
			content2.push("<img src='img/map/djyt.jpg'  width='100px'>湘菜制作精细，用料上比较广泛，口味多变，品种繁多；色泽上油重色浓，讲求实惠；品味上注重香辣、香鲜、软嫩；制法上以煨、炖、腊、蒸、炒诸法见称。官府湘菜代表菜品以组庵湘菜为代表，如组庵豆腐、组庵鱼翅等；民间湘菜代表菜品有剁椒鱼头、辣椒炒肉、湘西外婆菜、吉首酸肉、牛肉粉等。");
			content2.push("<a href='<%=path%>/allMenu.html?aac107=07'>了解更多</a>");
			var infoWindow2 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title2, content2.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//实例化信息窗体
			var title3 = '川菜',
			    content3 = [];
			content3.push("<img src='img/map/mpdf.jpg'  width='100px'>川菜取材广泛，调味多变，菜式多样，口味清鲜醇浓并重，以善用麻辣调味著称，并以其别具一格的烹调方法和浓郁的地方风味，融会了东南西北各方的特点，博采众家之长，善于吸收，善于创新，享誉中外。代表菜品有鱼香肉丝、宫保鸡丁、水煮鱼、麻婆豆腐、东坡肉等。");
			content3.push("<a href='<%=path%>/allMenu.html?aac107=01'>了解更多</a>");
			var infoWindow3 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title3, content3.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//实例化信息窗体
			var title4 = '粤菜',
			    content4 = [];
			content4.push("<img src='img/map/bqj.jpg'  width='100px'>粤菜用料丰富，选料精细，技艺精良，清而不淡，鲜而不俗，嫩而不生，油而不腻。擅长小炒，要求掌握火候和油温恰到好处。还兼容许多西菜做法，讲究菜的气势、档次。代表菜品有白切鸡、烧鹅、烤乳猪、红烧乳鸽、蜜汁叉烧、脆皮烧肉、上汤焗龙虾、清蒸东星斑、阿一鲍鱼等。");
			content4.push("<a href='<%=path%>/allMenu.html?aac107=03'>了解更多</a>");
			var infoWindow4 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title4, content4.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//实例化信息窗体
			var title5 = '苏菜',
			    content5 = [];
			content5.push("<img src='img/map/ssgy.jpg'  width='100px'>苏菜擅长炖、焖、蒸、炒，重视调汤，保持菜的原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。其名菜有金陵叉烤鸭、老鸭汤、炖生敲、烤方、水晶肴蹄、清炖蟹粉狮子头、黄泥煨鸡、清炖鸡孚等。");
			content5.push("<a href='<%=path%>/allMenu.html?aac107=04'>了解更多</a>");
			var infoWindow5 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title5, content5.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//实例化信息窗体
			var title6 = '浙菜',
			    content6 = [];
			content6.push("<img src='img/map/xhcy.jpg'  width='100px'>浙菜由杭州菜、宁波菜、绍兴菜、瓯菜组成。菜式小巧玲珑，清俊逸秀，菜品鲜美滑嫩，脆软清爽。运用香糟调味。代表菜品有东坡肉(杭州)、西湖醋鱼(杭州)、龙井虾仁(杭州)、三丝敲鱼(温州)等。");
			content6.push("<a href='<%=path%>/allMenu.html?aac107=05'>了解更多</a>");
			var infoWindow6 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title6, content6.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//实例化信息窗体
			var title7 = '闽菜',
			    content7 = [];
			content7.push("<img src='img/map/ftq.jpg'  width='100px'>闽菜以烹制山珍海味而著称，在色香味形俱佳的基础上，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格特色，以及汤路广泛的特点，在烹坛园地中独具一席。闽菜除招牌菜“佛跳墙”外，还有鸡汤氽海蚌、八宝红鲟饭、白炒鲜竹蛏、太极芋泥、淡糟香螺片、南煎肝、荔枝肉等。");
			content7.push("<a href='<%=path%>/allMenu.html?aac107=06'>了解更多</a>");
			var infoWindow7 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title7, content7.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//实例化信息窗体
			var title8 = '徽菜',
			    content8 = [];
			content8.push("<img src='img/map/cjy.jpg'  width='100px'>徽菜起源于秦汉，兴于唐宋，盛于明清，在清朝中、末期达到了鼎盛，徽菜是徽州的地方特色，其独特的地理人文环境赋予徽菜独有的味道。代表菜品:徽州毛豆腐、红烧臭鳜鱼、火腿炖甲鱼，红烧果子狸、腌鲜鳜鱼、黄山炖鸽等。");
			content8.push("<a href='<%=path%>/allMenu.html?aac107=08'>了解更多</a>");
			var infoWindow8 = new AMap.InfoWindow({
			    isCustom: true,  //使用自定义窗体
			    content: createInfoWindow(title8, content8.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});


			//构建自定义信息窗体
			function createInfoWindow(title, content) {
			    var info = document.createElement("div");
			    info.className = "custom-info input-card content-window-card";

			    //可以通过下面的方式修改自定义窗体的宽高
			    //info.style.width = "400px";
			    // 定义顶部标题
			    var top = document.createElement("div");
			    var titleD = document.createElement("div");
			    var closeX = document.createElement("img");
			    top.className = "info-top";
			    top.style.backgroundColor = 'white';
			    titleD.innerHTML = title;
			    closeX.src = "https://webapi.amap.com/images/close2.gif";
			    closeX.onclick = closeInfoWindow;

			    top.appendChild(titleD);
			    top.appendChild(closeX);
			    info.appendChild(top);

			    // 定义中部内容
			    var middle = document.createElement("div");
			    middle.className = "info-middle";
			    middle.style.backgroundColor = 'white';
			    middle.innerHTML = content;
			    info.appendChild(middle);

			    // 定义底部内容
			    var bottom = document.createElement("div");
			    bottom.className = "info-bottom";
			    bottom.style.position = 'relative';
			    bottom.style.top = '0px';
			    bottom.style.margin = '0 auto';
			    var sharp = document.createElement("img");
			    sharp.src = "https://webapi.amap.com/images/sharp.png";
			    bottom.appendChild(sharp);
			    info.appendChild(bottom);
			    return info;
			}

			//关闭信息窗体
			function closeInfoWindow() {
			    map.clearInfoWindow();
			}


		   var adcodes = [370000,430000,510000,440000,320000,330000,350000,340000];

	       var adcode = 100000; //全国的区划编码

		   districtExplorer.loadAreaNode(adcode, function(error, areaNode) {

		      if (error) {
		         console.error(error);
		         return;
		      }

		      //绘制载入的区划节点
		      renderAreaNode(districtExplorer, areaNode);
		   });

		function renderAreaNode(districtExplorer, areaNode) {

		   //清除已有的绘制内容
		   districtExplorer.clearFeaturePolygons();

		   //just some colors
		   var colors = ["#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00"];

		   //绘制子级区划
		   districtExplorer.renderSubFeatures(areaNode, function(feature, i) {

		   	   var props = feature.properties;
		   	   var code =props.adcode;

		      var fillColor = colors[i % colors.length];
		      var strokeColor = colors[colors.length - 1 - i % colors.length];

		      if(adcodes.indexOf(code)>-1)
		      {
		      	return {
		         cursor: 'default',
		         bubble: true,
		         strokeColor: strokeColor, //线颜色
		         strokeOpacity: 1, //线透明度
		         strokeWeight: 1, //线宽
		         fillColor: fillColor, //填充色
		         fillOpacity: 0.35, //填充透明度
		         };
		      }
		      else
		      {
		         return {
		         cursor: 'default',
		         bubble: true,
		         strokeColor: '#8B8B7A', //线颜色
		         strokeOpacity: 1, //线透明度
		         strokeWeight: 1, //线宽
		         fillColor: 'white', //填充色
		         fillOpacity: 0.35, //填充透明度
		        };
		      }

		   });

		   //绘制父级区划，仅用黑色描边
		   districtExplorer.renderParentFeature(areaNode, {
		      cursor: 'default',
		      bubble: true,
		      strokeColor: 'black', //线颜色
		      fillColor: null,
		      strokeWeight: 1.5, //线宽
		   });

		   //更新地图视野以适合区划面
		   map.setFitView(districtExplorer.getAllFeaturePolygons());
		}

		var LabelsData = [
			{
			    name: '四川省',
			    position: [104.065735,30.659462],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '川菜',
			        direction: 'center',
			        offset: [0, 0],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
				        fillColor: '#CC0033',
			        }
			    }
			},
			{
			    name: '浙江省',
			    position: [120.153576,30.287459],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '浙菜',
			        direction: 'center',
			        offset: [0, 10],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
			            fillColor: '#CC0033',
			        }
			    }
			},
			{
			    name: '安徽省',
			    position: [117.283042,31.86119],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '徽菜',
			        direction: 'center',
			        offset: [-12, 0],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
			            fillColor: '#CC0033',
			        }
			    }
			},
			{
			    name: '江苏省',
			    position: [118.767413,32.041544],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '苏菜',
			        direction: 'center',
			        offset: [15, -20],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
			            fillColor: '#CC0033',
			        }
			    }
			},
			{
			    name: '湖南省',
			    position: [112.982279,28.19409],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '湘菜',
			        direction: 'center',
			        offset: [-10, 0],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
			            fillColor: '#CC0033',
			        }
			    }
			},
			{
			    name: '福建省',
			    position: [119.306239,26.075302],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '闽菜',
			        direction: 'center',
			        offset: [-20, 0],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
			            fillColor: '#CC0033',
			        }
			    }
			},
			{
			    name: '山东省',
			    position: [117.000923,36.675807],
			    zooms: [3, 7],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '鲁菜',
			        direction: 'center',
			        offset: [10, 0],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
			            fillColor: '#CC0033',
			        }
			    }
			},
			{
			    name: '广东省',
			    position: [113.280637,23.125178],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '粤菜',
			        direction: 'center',
			        offset: [0, 0],
			        zooms: [3, 7],
			        style: {
			            fontSize: 15,
			            fontWeight: 'normal',
			            fillColor: '#CC0033',
			        }
			    }
			},
		];

 		var layer = new AMap.LabelsLayer({
            rejectMapMask: true,
            collision: true,
            animation: true,
        });

        map.add(layer);

        for (var i = 0; i < LabelsData.length; i++) {
            var labelsMarker = new AMap.LabelMarker(LabelsData[i]);

            layer.add(labelsMarker);
        }


	});
	</script>
</body>
</html>