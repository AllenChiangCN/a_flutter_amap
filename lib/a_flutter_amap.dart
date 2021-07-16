import 'dart:async';

import 'package:flutter/services.dart';

export 'amap_view.dart';
export 'compass_margin.dart';
export 'location_type.dart';
export 'logo_margin.dart';
export 'logo_position.dart';
export 'map_language.dart';
export 'map_type.dart';
export 'scale_margin.dart';
export 'zoom_position.dart';

class AFlutterAmap {
  static const MethodChannel _channel = const MethodChannel('a_flutter_amap');

  /// 设置当前缩放等级
  ///
  /// [zoomLevel] 缩放等级
  static Future<void> setZoomLevel(double zoomLevel) async {
    await _channel.invokeMethod('setZoomLevel', zoomLevel);
  }
}
