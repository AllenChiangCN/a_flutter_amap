import 'dart:async';

import 'package:a_flutter_amap/map_type.dart';
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

  /// 放大缩放等级
  static Future<void> zoomIn() async {
    await _channel.invokeMethod('zoomIn');
  }

  /// 缩小缩放等级
  static Future<void> zoomOut() async {
    await _channel.invokeMethod('zoomOut');
  }

  /// 设置最大缩放等级
  static Future<void> setMaxZoomLevel(double level) async {
    await _channel.invokeMethod('setMaxZoomLevel', level);
  }

  /// 设置最小缩放等级
  static Future<void> setMinZoomLevel(double level) async {
    await _channel.invokeMethod('setMinZoomLevel', level);
  }

  /// 获取最大缩放等级
  static Future<double> getMaxZoomLevel() async {
    return await _channel.invokeMethod('getMaxZoomLevel');
  }

  /// 获取最小缩放等级
  static Future<double> getMinZoomLevel() async {
    return await _channel.invokeMethod('getMinZoomLevel');
  }

  /// 获取当前缩放等级
  static Future<double> getCurrentZoomLevel() async {
    return await _channel.invokeMethod('getCurrentZoomLevel');
  }

  /// 设置地图图层类型
  ///
  /// [type] 地图图层类型
  static Future<void> setMapType(MapType type) async {
    await _channel.invokeMethod('setMapType', type.name);
  }
}
