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

  /// 获取当前缩放等级
  static Future<double> getZoomLevel() async {
    return await _channel.invokeMethod('getZoomLevel');
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

  /// 设置地图图层类型
  ///
  /// [type] 地图图层类型
  static Future<void> setMapType(MapType type) async {
    await _channel.invokeMethod('setMapType', type.name);
  }

  /// 获取地图图层类型
  static Future<MapType> getMapType() async {
    String typeString = await _channel.invokeMethod('getMapType');
    switch (typeString) {
      case 'NORMAL':
        return MapType.NORMAL;
      case 'NIGHT':
        return MapType.NIGHT;
      case 'NAVI':
        return MapType.NAVI;
      case 'BUS':
        return MapType.BUS;
      case 'SATELLITE':
        return MapType.SATELLITE;
      default:
        return MapType.NORMAL;
    }
  }

  /// 打开/关闭实时路况
  ///
  /// [on] 打开/关闭实时路况
  static Future<void> turnOnTraffic(bool on) async {
    await _channel.invokeMethod('turnOnTraffic', on);
  }

  /// 实时路况是否打开
  static Future<bool> isTrafficOn() async {
    return await _channel.invokeMethod('isTrafficOn');
  }

  /// 打开/关闭楼块
  ///
  /// [on] 打开/关闭楼块
  static Future<void> turnOnBuildings(bool on) async {
    await _channel.invokeMethod('turnOnBuildings', on);
  }

  /// 楼块是否打开
  ///
  /// 只针对iOS
  static Future<bool> isBuildingsOn() async {
    return await _channel.invokeMethod('isBuildingsOn');
  }
}
