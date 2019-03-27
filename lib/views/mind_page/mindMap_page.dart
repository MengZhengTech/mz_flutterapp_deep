/**
 * created by Huai 2019/3/25 0025
 */
import 'package:amap_base_map/amap_base_map.dart';
import 'package:flutter/material.dart';
//import 'package:mz_flutterapp_deep/widgets/setting.widget.dart';

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
//      appBar: AppBar(
//        title: const Text('控件交互'),
//        backgroundColor: Colors.blueAccent,
//        centerTitle: true,
//      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: AMapView(
              onAMapViewCreated: (controller) {
                print("测试信息");
                print(controller);
                setState(() => _controller = controller);
                _controller.setMyLocationStyle(MyLocationStyle(
                    showMyLocation: true,
                    radiusFillColor: Colors.transparent,
                    myLocationType: LOCATION_TYPE_LOCATION_ROTATE_NO_CENTER, //
                ));
                _controller?.setUiSettings(
                        _uiSettings.copyWith(isMyLocationButtonEnabled: true));
              },
              amapOptions: AMapOptions(
                compassEnabled: false,
                zoomControlsEnabled: true,
                logoPosition: LOGO_POSITION_BOTTOM_LEFT,
              ),
            ),
          ),
//          Flexible(
//            child: ListView(
//              children: <Widget>[
//                BooleanSetting(
//                  head: '显示自己的位置 [Android, iOS]',
//                  onSelected: (value) {
//                    _controller?.setMyLocationStyle(
//                        MyLocationStyle(showMyLocation: value));
//                  },
//                ),
//                BooleanSetting(
//                  head: '缩放按钮 [Android]',
//                  selected: _uiSettings.isZoomControlsEnabled,
//                  onSelected: (value) {
//                    _controller?.setUiSettings(
//                        _uiSettings.copyWith(isZoomControlsEnabled: value));
//                  },
//                ),
//                DiscreteSetting(
//                  head: '缩放按钮位置 [Android]',
//                  options: ['右中', '右下'],
//                  onSelected: (value) {
//                    int position;
//                    switch (value) {
//                      case '右中':
//                        position = ZOOM_POSITION_RIGHT_CENTER;
//                        break;
//                      case '右下':
//                        position = ZOOM_POSITION_RIGHT_BUTTOM;
//                        break;
//                    }
//                    _controller?.setUiSettings(
//                        _uiSettings.copyWith(zoomPosition: position));
//                  },
//                ),
//                BooleanSetting(
//                  head: '指南针 [Android, iOS]',
//                  selected: _uiSettings.isCompassEnabled,
//                  onSelected: (value) {
//                    _controller?.setUiSettings(
//                        _uiSettings.copyWith(isCompassEnabled: value));
//                  },
//                ),
//                BooleanSetting(
//                  head: '定位按钮 [Android]',
//                  selected: _uiSettings.isMyLocationButtonEnabled,
//                  onSelected: (value) {
//                    _controller?.setUiSettings(
//                        _uiSettings.copyWith(isMyLocationButtonEnabled: value));
//                  },
//                ),
//                BooleanSetting(
//                  head: '比例尺控件 [Android, iOS]',
//                  selected: _uiSettings.isScaleControlsEnabled,
//                  onSelected: (value) {
//                    _controller?.setUiSettings(
//                        _uiSettings.copyWith(isScaleControlsEnabled: value));
//                  },
//                ),
//                DiscreteSetting(
//                  head: '地图Logo [Android]',
//                  options: ['左下', '中下', '右下'],
//                  onSelected: (value) {
//                    int position;
//                    switch (value) {
//                      case '左下':
//                        position = LOGO_POSITION_BOTTOM_LEFT;
//                        break;
//                      case '中下':
//                        position = LOGO_POSITION_BOTTOM_CENTER;
//                        break;
//                      case '右下':
//                        position = LOGO_POSITION_BOTTOM_RIGHT;
//                        break;
//                    }
//                    _controller?.setUiSettings(
//                        _uiSettings.copyWith(logoPosition: position));
//                  },
//                ),
//              ],
//            ),
//          )
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