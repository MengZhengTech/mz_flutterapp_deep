/**
 * created by Huai 2019/3/25 0025
 */
import 'package:amap_base_map/amap_base_map.dart';
import 'package:flutter/material.dart';

class MindMapPage extends StatefulWidget{
  @override
  _MindMapState createState() => _MindMapState();
}

class _MindMapState extends State<MindMapPage>{
  AMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义地图'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: AMapView(
        onAMapViewCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
//        onPressed: () async {
//          await _controller?.setCustomMapStylePath('amap_assets/style.data');
//          await _controller?.setMapCustomEnable(true);
//        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}