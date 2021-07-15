import 'dart:async';

import 'package:flutter/services.dart';

export 'amap_view.dart';
export 'compass_margin.dart';
export 'location_type.dart';
export 'logo_margin.dart';
export 'logo_position.dart';
export 'map_type.dart';
export 'scale_margin.dart';
export 'zoom_position.dart';

class AFlutterAmap {
  static const MethodChannel _channel = const MethodChannel('a_flutter_amap');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
