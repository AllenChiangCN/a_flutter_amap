import 'package:a_flutter_amap/a_flutter_amap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AMapViewController controller;

  @override
  void initState() {
    super.initState();

    controller = AMapViewController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: [
            AMapView(
              controller: controller,
              autoLocateAfterInit: true,
              showCompass: true,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.clearAllOverlay(true);
                    },
                    child: Text('清空所有Overlay(true)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.clearAllOverlay(false);
                    },
                    child: Text('清空所有Overlay(false)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.addMarker(AddMarkerParam(
                        position: LatLng(
                          latitude: 29.573833,
                          longitude: 106.550198,
                        ),
                        anchor: Anchor(anchorU: 0.5, anchorV: 1),
                        title: '鲤鱼池',
                        snippet: '鲤鱼池轻轨站扶梯维护',
                        draggable: true,
                        visible: true,
                        alpha: 1,
                      ));
                    },
                    child: Text('添加Marker'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
