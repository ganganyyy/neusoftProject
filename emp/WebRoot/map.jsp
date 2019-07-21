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
    <title>��ͼ</title>
</head>
<body>
	<div class="my-map">
		<div id="container"></div>
	</div>
	<script src="https://webapi.amap.com/maps?v=1.4.15&key=dc45539a898fa3f2e694f3e9e0bb8762"></script>
    <!-- UI����� 1.0 -->
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

	        //����һ��ʵ��
	        var districtExplorer = window.districtExplorer = new DistrictExplorer({
	            eventSupport: true, //���¼�֧��
	            map: map
	        });

		    //��ǰ�۽�������
	        var currentAreaNode = null;

	        //���hover��ʾ����
	        var $tipMarkerContent = $('<div class="tipMarker top"></div>');

	        var tipMarker = new AMap.Marker({
	            content: $tipMarkerContent.get(0),
	            offset: new AMap.Pixel(0, 0),
	            bubble: true
	        });

	        //����Hover״̬���������ʽ
	        function toggleHoverFeature(feature, isHover, position) {

	            tipMarker.setMap(isHover ? map : null);

	            if (!feature) {
	                return;
	            }

	            var props = feature.properties;

	            if (isHover) {

	                //������ʾ����
	                $tipMarkerContent.html(props.name);
	                //����λ��
	                tipMarker.setPosition(position || props.center);
	            }

	            //������ض���ε���ʽ
	            var polys = districtExplorer.findFeaturePolygonsByAdcode(props.adcode);
	            for (var i = 0, len = polys.length; i < len; i++) {

	                polys[i].setOptions({
	                    fillOpacity: isHover ? 0.5 : 0.2
	                });
	            }
	        }

	        //����feature��hover�¼�
	        districtExplorer.on('featureMouseout featureMouseover', function(e, feature) {
	            toggleHoverFeature(feature, e.type === 'featureMouseover',
	                e.originalEvent ? e.originalEvent.lnglat : null);
	        });

	        //���������feature�ϻ���
	        districtExplorer.on('featureMousemove', function(e, feature) {
	            //������ʾλ��
	            tipMarker.setPosition(e.originalEvent.lnglat);
	        });

	        //feature�����
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

			//ʵ������Ϣ����
			var title1 = '³��',
			    content1 = [];
			
			content1.push("<img src='img/map/tcly.jpg'  width='100px'>³�ˣ�����Դ��ɽ������³��ζ���䷢Դ��Ϊɽ��ʡ�Ͳ��У�����ʷ���ƾá�������ḻ���Ѷ���ߡ���������Ĳ�ϵ�������Ʒ��һƷ���������պ��Ρ���˿��ᡢ�װ��ı����Ǵ׻ƺ����㡢��ת�󳦵ȡ�");
			content1.push("<a href='<%=path%>/allMenu.html?aac107=02'>�˽����</a>");
			var infoWindow1 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title1, content1.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//ʵ������Ϣ����
			var title2 = '���',
			    content2 = [];
			content2.push("<img src='img/map/djyt.jpg'  width='100px'>���������ϸ�������ϱȽϹ㷺����ζ��䣬Ʒ�ַ��ࣻɫ��������ɫŨ������ʵ�ݣ�Ʒζ��ע�����������ʡ����ۣ��Ʒ������С�������������������ơ��ٸ���˴����Ʒ���������Ϊ���������ֶ������������ȣ������˴����Ʒ�ж罷��ͷ���������⡢�������Ųˡ��������⡢ţ��۵ȡ�");
			content2.push("<a href='<%=path%>/allMenu.html?aac107=07'>�˽����</a>");
			var infoWindow2 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title2, content2.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//ʵ������Ϣ����
			var title3 = '����',
			    content3 = [];
			content3.push("<img src='img/map/mpdf.jpg'  width='100px'>����ȡ�Ĺ㷺����ζ��䣬��ʽ��������ζ���ʴ�Ũ���أ�������������ζ���ƣ���������һ������������Ũ���ĵط���ζ���ڻ��˶��������������ص㣬�����ڼ�֮�����������գ����ڴ��£��������⡣�����Ʒ��������˿������������ˮ���㡢���Ŷ�����������ȡ�");
			content3.push("<a href='<%=path%>/allMenu.html?aac107=01'>�˽����</a>");
			var infoWindow3 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title3, content3.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//ʵ������Ϣ����
			var title4 = '����',
			    content4 = [];
			content4.push("<img src='img/map/bqj.jpg'  width='100px'>�������Ϸḻ��ѡ�Ͼ�ϸ�����վ���������������ʶ����ף��۶��������Ͷ����塣�ó�С����Ҫ�����ջ�������ǡ���ô���������������������������˵����ơ����Ρ������Ʒ�а��м����ն졢������������롢��֭���ա���Ƥ���⡢�����h��Ϻ���������ǰߡ���һ����ȡ�");
			content4.push("<a href='<%=path%>/allMenu.html?aac107=03'>�˽����</a>");
			var infoWindow4 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title4, content4.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//ʵ������Ϣ����
			var title5 = '�ղ�',
			    content5 = [];
			content5.push("<img src='img/map/ssgy.jpg'  width='100px'>�ղ��ó������ˡ������������ӵ��������ֲ˵�ԭ֭����ζ���ʣ�Ũ�����壬���������������ѹǶ���ʧ���Σ�����ˬ�����ʧ��ζ���������н���濾Ѽ����Ѽ���������á�������ˮ�����㡢����з��ʨ��ͷ�������м����������ڵȡ�");
			content5.push("<a href='<%=path%>/allMenu.html?aac107=04'>�˽����</a>");
			var infoWindow5 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title5, content5.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//ʵ������Ϣ����
			var title6 = '���',
			    content6 = [];
			content6.push("<img src='img/map/xhcy.jpg'  width='100px'>����ɺ��ݲˡ������ˡ����˲ˡ�걲���ɡ���ʽС�����磬�忡���㣬��Ʒ�������ۣ�������ˬ�����������ζ�������Ʒ�ж�����(����)����������(����)������Ϻ��(����)����˿����(����)�ȡ�");
			content6.push("<a href='<%=path%>/allMenu.html?aac107=05'>�˽����</a>");
			var infoWindow6 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title6, content6.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//ʵ������Ϣ����
			var title7 = '����',
			    content7 = [];
			content7.push("<img src='img/map/ftq.jpg'  width='100px'>����������ɽ�亣ζ�����ƣ���ɫ��ζ�ξ�ѵĻ����ϣ����ԡ��㡱����ζ�������������ʡ��ʹ������㡢����ķ����ɫ���Լ���·�㷺���ص㣬����̳԰���ж���һϯ�����˳����Ʋˡ�����ǽ���⣬���м����ۺ������˱����෹���׳������ɡ�̫�����ࡢ��������Ƭ���ϼ�Ρ���֦��ȡ�");
			content7.push("<a href='<%=path%>/allMenu.html?aac107=06'>�˽����</a>");
			var infoWindow7 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title7, content7.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});

			//ʵ������Ϣ����
			var title8 = '�ղ�',
			    content8 = [];
			content8.push("<img src='img/map/cjy.jpg'  width='100px'>�ղ���Դ���غ����������Σ�ʢ�����壬���峯�С�ĩ�ڴﵽ�˶�ʢ���ղ��ǻ��ݵĵط���ɫ������صĵ������Ļ�������ղ˶��е�ζ���������Ʒ:����ë���������ճ����㡢���������㣬���չ����ꡢ�������㡢��ɽ����ȡ�");
			content8.push("<a href='<%=path%>/allMenu.html?aac107=08'>�˽����</a>");
			var infoWindow8 = new AMap.InfoWindow({
			    isCustom: true,  //ʹ���Զ��崰��
			    content: createInfoWindow(title8, content8.join("<br/>")),
			    offset: new AMap.Pixel(16, -45)
			});


			//�����Զ�����Ϣ����
			function createInfoWindow(title, content) {
			    var info = document.createElement("div");
			    info.className = "custom-info input-card content-window-card";

			    //����ͨ������ķ�ʽ�޸��Զ��崰��Ŀ��
			    //info.style.width = "400px";
			    // ���嶥������
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

			    // �����в�����
			    var middle = document.createElement("div");
			    middle.className = "info-middle";
			    middle.style.backgroundColor = 'white';
			    middle.innerHTML = content;
			    info.appendChild(middle);

			    // ����ײ�����
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

			//�ر���Ϣ����
			function closeInfoWindow() {
			    map.clearInfoWindow();
			}


		   var adcodes = [370000,430000,510000,440000,320000,330000,350000,340000];

	       var adcode = 100000; //ȫ������������

		   districtExplorer.loadAreaNode(adcode, function(error, areaNode) {

		      if (error) {
		         console.error(error);
		         return;
		      }

		      //��������������ڵ�
		      renderAreaNode(districtExplorer, areaNode);
		   });

		function renderAreaNode(districtExplorer, areaNode) {

		   //������еĻ�������
		   districtExplorer.clearFeaturePolygons();

		   //just some colors
		   var colors = ["#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00"];

		   //�����Ӽ�����
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
		         strokeColor: strokeColor, //����ɫ
		         strokeOpacity: 1, //��͸����
		         strokeWeight: 1, //�߿�
		         fillColor: fillColor, //���ɫ
		         fillOpacity: 0.35, //���͸����
		         };
		      }
		      else
		      {
		         return {
		         cursor: 'default',
		         bubble: true,
		         strokeColor: '#8B8B7A', //����ɫ
		         strokeOpacity: 1, //��͸����
		         strokeWeight: 1, //�߿�
		         fillColor: 'white', //���ɫ
		         fillOpacity: 0.35, //���͸����
		        };
		      }

		   });

		   //���Ƹ������������ú�ɫ���
		   districtExplorer.renderParentFeature(areaNode, {
		      cursor: 'default',
		      bubble: true,
		      strokeColor: 'black', //����ɫ
		      fillColor: null,
		      strokeWeight: 1.5, //�߿�
		   });

		   //���µ�ͼ��Ұ���ʺ�������
		   map.setFitView(districtExplorer.getAllFeaturePolygons());
		}

		var LabelsData = [
			{
			    name: '�Ĵ�ʡ',
			    position: [104.065735,30.659462],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '����',
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
			    name: '�㽭ʡ',
			    position: [120.153576,30.287459],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '���',
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
			    name: '����ʡ',
			    position: [117.283042,31.86119],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '�ղ�',
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
			    name: '����ʡ',
			    position: [118.767413,32.041544],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '�ղ�',
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
			    name: '����ʡ',
			    position: [112.982279,28.19409],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '���',
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
			    name: '����ʡ',
			    position: [119.306239,26.075302],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '����',
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
			    name: 'ɽ��ʡ',
			    position: [117.000923,36.675807],
			    zooms: [3, 7],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '³��',
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
			    name: '�㶫ʡ',
			    position: [113.280637,23.125178],
			    zooms: [3, 13],
			    zIndex: 1,
			    opacity: 1,
			    text: {
			        content: '����',
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