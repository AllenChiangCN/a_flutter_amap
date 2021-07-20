import 'dart:async';

import 'package:a_flutter_amap/map_type.dart';
import 'package:flutter/services.dart';

import 'location_type.dart';
import 'map_language.dart';

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
  /// [zoomLevel] - 缩放等级
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
  /// [type] - 地图图层类型
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
  /// [on] - 打开/关闭实时路况
  static Future<void> turnOnTraffic(bool on) async {
    await _channel.invokeMethod('turnOnTraffic', on);
  }

  /// 实时路况是否打开
  static Future<bool> isTrafficOn() async {
    return await _channel.invokeMethod('isTrafficOn');
  }

  /// 打开/关闭楼块
  ///
  /// [on] - 打开/关闭楼块
  static Future<void> turnOnBuildings(bool on) async {
    await _channel.invokeMethod('turnOnBuildings', on);
  }

  /// 楼块是否打开
  ///
  /// 只针对iOS
  static Future<bool> isBuildingsOn() async {
    return await _channel.invokeMethod('isBuildingsOn');
  }

  /// 打开/关闭地图文字标注
  ///
  /// [on] - 打开/关闭楼块
  ///
  /// 只针对Android
  static Future<void> turnOnMapText(bool on) async {
    await _channel.invokeMethod('turnOnMapText', on);
  }

  /// 设置底图语言
  ///
  /// [language] - 底图语言
  static Future<void> setMapLanguage(MapLanguage language) async {
    await _channel.invokeMethod('setMapLanguage', language.name);
  }

  /// 获取底图语言
  ///
  /// 只针对iOS
  static Future<MapLanguage> getMapLanguage() async {
    String languageString = await _channel.invokeMethod('getMapLanguage');
    switch (languageString) {
      case 'CHINESE':
        return MapLanguage.CHINESE;
      case 'ENGLISH':
        return MapLanguage.ENGLISH;
      default:
        return MapLanguage.CHINESE;
    }
  }

  /// 设置定位类型
  ///
  /// [type] - 定位类型
  static Future<void> setLocationType(LocationType type) async {
    await _channel.invokeMethod('setLocationType', type.name);
  }

  /// 获取定位类型
  static Future<LocationType> getLocationType() async {
    String typeString = await _channel.invokeMethod('getLocationType');
    switch (typeString) {
      case 'SHOW':
        return LocationType.SHOW;
      case 'LOCATE':
        return LocationType.LOCATE;
      case 'FOLLOW':
        return LocationType.FOLLOW;
      case 'MAP_ROTATE':
        return LocationType.MAP_ROTATE;
      case 'LOCATION_ROTATE':
        return LocationType.LOCATION_ROTATE;
      case 'LOCATION_ROTATE_NO_CENTER':
        return LocationType.LOCATION_ROTATE_NO_CENTER;
      case 'FOLLOW_NO_CENTER':
        return LocationType.FOLLOW_NO_CENTER;
      case 'MAP_ROTATE_NO_CENTER':
        return LocationType.MAP_ROTATE_NO_CENTER;
      default:
        return LocationType.SHOW;
    }
  }

  /// 设置定位间隔
  ///
  /// [interval] - 定位间隔，单位毫秒
  static Future<void> setLocationInterval(int interval) async {
    await _channel.invokeMethod('setLocationInterval', interval);
  }

  /// 获取定位间隔
  static Future<int> getLocationInterval() async {
    return await _channel.invokeMethod('getLocationInterval');
  }

  /// 设置是否显示缩放按钮
  ///
  /// [on] - 是否显示
  static Future<void> turnOnZoomControl(bool on) async {
    await _channel.invokeMethod('turnOnZoomControl', on);
  }

  /// 缩放按钮是否显示
  static Future<bool> isZoomControlOn() async {
    return await _channel.invokeMethod('isZoomControlOn');
  }

  /// 设置是否显示指南针
  ///
  /// [on] - 是否显示
  static Future<void> turnOnCompass(bool on) async {
    await _channel.invokeMethod('turnOnCompass', on);
  }

  /// 指南针是否显示
  static Future<bool> isCompassOn() async {
    return await _channel.invokeMethod('isCompassOn');
  }

  /// 设置是否显示定位按钮
  ///
  /// [on] - 是否显示
  static Future<void> turnOnLocationButton(bool on) async {
    await _channel.invokeMethod('turnOnLocationButton', on);
  }

  /// 定位按钮是否显示
  static Future<bool> isLocationButtonOn() async {
    return await _channel.invokeMethod('isLocationButtonOn');
  }

  /// 设置是否显示比例尺控件
  ///
  /// [on] - 是否显示
  static Future<void> turnOnScaleControl(bool on) async {
    await _channel.invokeMethod('turnOnScaleControl', on);
  }

  /// 比例尺控件是否显示
  static Future<bool> isScaleControlOn() async {
    return await _channel.invokeMethod('isScaleControlOn');
  }
}
