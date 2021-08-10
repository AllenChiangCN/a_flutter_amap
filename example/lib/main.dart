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

  String _selectedColor = 'red';

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
                  DropdownButton<String>(
                    value: _selectedColor,
                    items: [
                      'red',
                      'orange',
                      'yellow',
                      'green',
                      'cyan',
                      'azure',
                      'blue',
                      'violet',
                      'magenta',
                      'rose'
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (color) {
                      setState(() {
                        _selectedColor = color!;
                      });
                      controller.addMarker(
                        AddMarkerParam(
                          position: LatLng(
                            latitude: 29.573833,
                            longitude: 106.550198,
                          ),
                          title: '鲤鱼池',
                          snippet: '鲤鱼池轻轨站扶梯维护',
                          rotateAngle: -45.0,
                          markerColor: _selectedColor.toUpperCase().markerColor,
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.addMarker(
                        AddMarkerParam(
                          position: LatLng(
                            latitude: 29.573833,
                            longitude: 106.550198,
                          ),
                          title: '鲤鱼池',
                          snippet: '鲤鱼池轻轨站扶梯维护',
                          rotateAngle: -45.0,
                        ),
                      );
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
