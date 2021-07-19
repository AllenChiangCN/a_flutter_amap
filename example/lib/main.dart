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
                    onPressed: () async {
                      double maxLevel = await AFlutterAmap.getMaxZoomLevel();
                      debugPrint('max level: $maxLevel');
                    },
                    child: Text('最大缩放等级'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      double minLevel = await AFlutterAmap.getMinZoomLevel();
                      debugPrint('min level: $minLevel');
                    },
                    child: Text('最小缩放等级'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      double currentLevel =
                          await AFlutterAmap.getCurrentZoomLevel();
                      debugPrint('current level: $currentLevel');
                    },
                    child: Text('当前缩放等级'),
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
