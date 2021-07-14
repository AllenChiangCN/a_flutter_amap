import 'dart:async';

import 'package:flutter/services.dart';

export 'amap_view.dart';
export 'location_type.dart';
export 'logo_position.dart';
export 'zoom_position.dart';

class AFlutterAmap {
  static const MethodChannel _channel = const MethodChannel('a_flutter_amap');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
