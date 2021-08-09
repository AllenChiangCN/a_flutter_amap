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
              androidBound: [
                LatLng(latitude: 39.694, longitude: 116.104917),
                LatLng(latitude: 40.377269, longitude: 117.031672),
              ],
              iOSBound: IosBound(
                latLng: LatLng(latitude: 29.546073, longitude: 106.539373),
                latitudeDelta: 1.5,
                longitudeDelta: 2.5,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.setAndroidBound([
                        LatLng(latitude: 29.546073, longitude: 106.539373),
                        LatLng(latitude: 29.578474, longitude: 106.569929),
                      ]);
                    },
                    child: Text('Android重庆'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.setIOSBound(
                        IosBound(
                          latLng: LatLng(
                            latitude: 29.546073,
                            longitude: 106.539373,
                          ),
                          latitudeDelta: 1.5,
                          longitudeDelta: 2.5,
                        ),
                      );
                    },
                    child: Text('iOS重庆'),
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
