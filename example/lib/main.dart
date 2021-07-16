import 'package:a_flutter_amap/a_flutter_amap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
              autoLocateAfterInit: true,
              showBuildings: false,
              showCompass: true,
              showLocationButton: true,
              showScaleControl: true,
              showZoomControl: false,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AFlutterAmap.zoomIn();
                    },
                    child: Text('ZoomIn'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AFlutterAmap.zoomOut();
                    },
                    child: Text('ZoomOut'),
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
