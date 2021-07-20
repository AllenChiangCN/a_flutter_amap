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
              autoLocateAfterInit: false,
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
                      controller.setMapCenter(
                        LatLng(latitude: 39.903963, longitude: 116.411161),
                      );
                    },
                    child: Text('北京'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.setMapCenter(
                        LatLng(latitude: 32.07387, longitude: 118.767728),
                      );
                    },
                    child: Text('南京'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.setMapCenter(
                        LatLng(latitude: 34.334954, longitude: 108.836088),
                      );
                    },
                    child: Text('西安'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.setMapCenter(
                        LatLng(latitude: 29.526291, longitude: 106.638822),
                      );
                    },
                    child: Text('重庆'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      LatLng center = await controller.getMapCenter();
                      debugPrint(
                        'latitude: ${center.latitude}, longitude: ${center.longitude}',
                      );
                    },
                    child: Text('当前中点'),
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
