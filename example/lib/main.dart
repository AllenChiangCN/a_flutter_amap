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
        body: Center(
          child: AMapView(
            autoLocateAfterInit: true,
            rotateGestureEnable: false,
            zoomPosition: ZoomPosition.RIGHT_CENTER,
            logoPosition: LogoPosition.BOTTOM_LEFT,
          ),
        ),
      ),
    );
  }
}
