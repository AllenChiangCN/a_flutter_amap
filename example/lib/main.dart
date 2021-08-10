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
                  ElevatedButton(
                    onPressed: () {
                      controller.clearAllMarkers();
                    },
                    child: Text('清空所有Marker'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.clearMapScreenMarkers();
                    },
                    child: Text('清空可见Marker'),
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
                      controller.addPolyline(
                        PolylineOptions(
                          latlngs: [
                            LatLng(
                              latitude: 39.999391,
                              longitude: 116.135972,
                            ),
                            LatLng(
                              latitude: 39.898323,
                              longitude: 116.057694,
                            ),
                            LatLng(
                              latitude: 39.900430,
                              longitude: 116.265061,
                            ),
                            LatLng(
                              latitude: 39.955192,
                              longitude: 116.140092,
                            ),
                          ],
                          lineCapType: LineCapType.LineCapSquare.value,
                          dottedLineType:
                              DottedLineType.DOTTEDLINE_TYPE_CIRCLE.value,
                          lineJoinType: LineJoinType.LineJoinBevel.value,
                          width: 10,
                          isGeodesic: false,
                          isDottedLine: false,
                          alpha: 255,
                          red: 23,
                          green: 142,
                          blue: 248,
                          isVisible: true,
                          useGradient: true,
                          zIndex: 50,
                        ),
                      );
                    },
                    child: Text('addPolyline'),
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
