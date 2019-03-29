/**
 * created by Huai 2019/3/25 0025
 * 心情首页
 */
import 'package:amap_base_map/amap_base_map.dart';
import 'package:flutter/material.dart';

class MindMapPage extends StatefulWidget{
  @override
  _MindMapState createState() => _MindMapState();
}

class _MindMapState extends State<MindMapPage>{
  AMapController _controller;
  UiSettings _uiSettings = UiSettings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: AMapView(
              onAMapViewCreated: (controller) {
                print(controller);
                setState(() => _controller = controller);
                _controller.setMyLocationStyle(MyLocationStyle( // 定位蓝点
                    showMyLocation: true,
                    strokeColor: Colors.transparent,
                    radiusFillColor: Colors.brown,
                    myLocationType: LOCATION_TYPE_MAP_ROTATE, //
                ));
                _controller?.setUiSettings(
                        _uiSettings.copyWith(isMyLocationButtonEnabled: true));

                // _controller?.setMapCustomEnable(true);
                // 自定义地图 可能需要下载样式文件后引用
                // _controller?.setCustomMapStyleID("908fb101e5477578868dd9bae230bd83");
              },
              amapOptions: AMapOptions(
                compassEnabled: false,       // 是否显示指南针
                zoomControlsEnabled: true,   // 是否支持手势缩放
                tiltGesturesEnabled: false,  // 是否支持通过手势倾斜
                logoPosition: LOGO_POSITION_BOTTOM_LEFT,  // 定位蓝点展示模式
                camera: CameraPosition(tilt: 45, zoom: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}