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
  bool flag = false;

  void refreshFlag() async {
    flag = await AFlutterAmap.getIsGestureScaleByMapCenterPosition();
    setState(() {});
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
              autoLocateAfterInit: true,
              showBuildings: false,
              showCompass: true,
              showLocationButton: true,
              showScaleControl: true,
              showZoomControl: true,
              logoMargin: LogoMargin(
                marginLeft: 40,
                marginBottom: 40,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('flag: $flag'),
                  ElevatedButton(
                    onPressed: () {
                      refreshFlag();
                    },
                    child: Text('Refresh Flag'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AFlutterAmap.setIsGestureScaleByMapCenterPosition(!flag);
                    },
                    child: Text('Toggle Flag'),
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
