import 'package:flutter/services.dart';

import '../a_flutter_amap.dart';

class AMapViewController {
  final MethodChannel _channel = const MethodChannel('a_flutter_amap');

  /// 设置当前缩放等级
  ///
  /// [zoomLevel] - 缩放等级
  Future<void> setZoomLevel(double zoomLevel) async {
    await _channel.invokeMethod('setZoomLevel', zoomLevel);
  }

  /// 获取当前缩放等级
  Future<double> getZoomLevel() async {
    return await _channel.invokeMethod('getZoomLevel');
  }

  /// 放大缩放等级
  Future<void> zoomIn() async {
    await _channel.invokeMethod('zoomIn');
  }

  /// 缩小缩放等级
  Future<void> zoomOut() async {
    await _channel.invokeMethod('zoomOut');
  }

  /// 设置最大缩放等级
  Future<void> setMaxZoomLevel(double level) async {
    await _channel.invokeMethod('setMaxZoomLevel', level);
  }

  /// 设置最小缩放等级
  Future<void> setMinZoomLevel(double level) async {
    await _channel.invokeMethod('setMinZoomLevel', level);
  }

  /// 获取最大缩放等级
  Future<double> getMaxZoomLevel() async {
    return await _channel.invokeMethod('getMaxZoomLevel');
  }

  /// 获取最小缩放等级
  Future<double> getMinZoomLevel() async {
    return await _channel.invokeMethod('getMinZoomLevel');
  }

  /// 设置地图图层类型
  ///
  /// [type] - 地图图层类型
  Future<void> setMapType(MapType type) async {
    await _channel.invokeMethod('setMapType', type.name);
  }

  /// 获取地图图层类型
  Future<MapType> getMapType() async {
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
  Future<void> turnOnTraffic(bool on) async {
    await _channel.invokeMethod('turnOnTraffic', on);
  }

  /// 实时路况是否打开
  Future<bool> isTrafficOn() async {
    return await _channel.invokeMethod('isTrafficOn');
  }

  /// 打开/关闭楼块
  ///
  /// [on] - 打开/关闭楼块
  Future<void> turnOnBuildings(bool on) async {
    await _channel.invokeMethod('turnOnBuildings', on);
  }

  /// 楼块是否打开
  ///
  /// * 只针对iOS
  Future<bool> isBuildingsOn() async {
    return await _channel.invokeMethod('isBuildingsOn');
  }

  /// 打开/关闭地图文字标注
  ///
  /// [on] - 打开/关闭楼块
  ///
  /// * 只针对Android
  Future<void> turnOnMapText(bool on) async {
    await _channel.invokeMethod('turnOnMapText', on);
  }

  /// 设置底图语言
  ///
  /// [language] - 底图语言
  Future<void> setMapLanguage(MapLanguage language) async {
    await _channel.invokeMethod('setMapLanguage', language.name);
  }

  /// 获取底图语言
  ///
  /// * 只针对iOS
  Future<MapLanguage> getMapLanguage() async {
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
  Future<void> setLocationType(LocationType type) async {
    await _channel.invokeMethod('setLocationType', type.name);
  }

  /// 获取定位类型
  Future<LocationType> getLocationType() async {
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
  Future<void> setLocationInterval(int interval) async {
    await _channel.invokeMethod('setLocationInterval', interval);
  }

  /// 获取定位间隔
  Future<int> getLocationInterval() async {
    return await _channel.invokeMethod('getLocationInterval');
  }

  /// 设置是否显示缩放按钮
  ///
  /// [on] - 是否显示
  ///
  /// * 只针对Android
  Future<void> turnOnZoomControl(bool on) async {
    await _channel.invokeMethod('turnOnZoomControl', on);
  }

  /// 缩放按钮是否显示
  ///
  /// * 只针对Android
  Future<bool> isZoomControlOn() async {
    return await _channel.invokeMethod('isZoomControlOn');
  }

  /// 设置是否显示指南针
  ///
  /// [on] - 是否显示
  Future<void> turnOnCompass(bool on) async {
    await _channel.invokeMethod('turnOnCompass', on);
  }

  /// 指南针是否显示
  Future<bool> isCompassOn() async {
    return await _channel.invokeMethod('isCompassOn');
  }

  /// 设置是否显示定位按钮
  ///
  /// [on] - 是否显示
  ///
  /// * 只针对Android
  Future<void> turnOnLocationButton(bool on) async {
    await _channel.invokeMethod('turnOnLocationButton', on);
  }

  /// 定位按钮是否显示
  ///
  /// * 只针对Android
  Future<bool> isLocationButtonOn() async {
    return await _channel.invokeMethod('isLocationButtonOn');
  }

  /// 设置是否显示比例尺控件
  ///
  /// [on] - 是否显示
  Future<void> turnOnScaleControl(bool on) async {
    await _channel.invokeMethod('turnOnScaleControl', on);
  }

  /// 比例尺控件是否显示
  Future<bool> isScaleControlOn() async {
    return await _channel.invokeMethod('isScaleControlOn');
  }

  /// 设置是否启用所有手势
  ///
  /// [enable] - 是否启用
  ///
  /// * 只针对Android
  Future<void> enableAllGesture(bool enable) async {
    await _channel.invokeMethod('enableAllGesture', enable);
  }

  /// 所有手势是否启用
  ///
  /// * 只针对Android
  Future<bool> isAllGestureEnable() async {
    return await _channel.invokeMethod('isAllGestureEnable');
  }

  /// 设置是否启用缩放手势
  ///
  /// [enable] - 是否启用
  Future<void> enableZoomGesture(bool enable) async {
    await _channel.invokeMethod('enableZoomGesture', enable);
  }

  /// 缩放手势是否启用
  Future<bool> isZoomGestureEnable() async {
    return await _channel.invokeMethod('isZoomGestureEnable');
  }

  /// 设置是否启用旋转手势
  ///
  /// [enable] - 是否启用
  Future<void> enableRotateGesture(bool enable) async {
    await _channel.invokeMethod('enableRotateGesture', enable);
  }

  /// 旋转手势是否启用
  Future<bool> isRotateGestureEnable() async {
    return await _channel.invokeMethod('isRotateGestureEnable');
  }

  /// 设置是否启用拖拽手势
  ///
  /// [enable] - 是否启用
  Future<void> enableScrollGesture(bool enable) async {
    await _channel.invokeMethod('enableScrollGesture', enable);
  }

  /// 拖拽手势是否启用
  Future<bool> isScrollGestureEnable() async {
    return await _channel.invokeMethod('isScrollGestureEnable');
  }

  /// 设置是否启用倾斜手势
  ///
  /// [enable] - 是否启用
  Future<void> enableTiltGesture(bool enable) async {
    await _channel.invokeMethod('enableTiltGesture', enable);
  }

  /// 倾斜手势是否启用
  Future<bool> isTiltGestureEnable() async {
    return await _channel.invokeMethod('isTiltGestureEnable');
  }

  /// 设置Logo位置
  ///
  /// [logoPosition] - Logo位置
  ///
  /// * 只针对Android
  Future<void> setLogoPosition(LogoPosition logoPosition) async {
    await _channel.invokeMethod('setLogoPosition', logoPosition.name);
  }

  /// 获取Logo位置
  ///
  /// * 只针对Android
  Future<LogoPosition> getLogoPosition() async {
    String logoPosition = await _channel.invokeMethod('getLogoPosition');
    switch (logoPosition) {
      case "BOTTOM_LEFT":
        return LogoPosition.BOTTOM_LEFT;
      case "BOTTOM_CENTER":
        return LogoPosition.BOTTOM_CENTER;
      case "BOTTOM_RIGHT":
        return LogoPosition.BOTTOM_RIGHT;
      default:
        return LogoPosition.BOTTOM_LEFT;
    }
  }

  /// 设置Logo左下边距
  ///
  /// [logoMargin] - 左下边距
  ///
  /// * iOS上为递增效果
  Future<void> setLogoMargin(LogoMargin logoMargin) async {
    await _channel.invokeMethod('setLogoMargin', logoMargin.toJson());
  }

  /// 设置缩放按钮位置
  ///
  /// [zoomPosition] - 缩放按钮位置
  ///
  /// * 只针对Android
  Future<void> setZoomPosition(ZoomPosition zoomPosition) async {
    await _channel.invokeMethod('setZoomPosition', zoomPosition.name);
  }

  /// 获取缩放按钮位置
  ///
  /// * 只针对Android
  Future<ZoomPosition> getZoomPosition() async {
    String zoomPosition = await _channel.invokeMethod('getZoomPosition');
    switch (zoomPosition) {
      case "RIGHT_BOTTOM":
        return ZoomPosition.RIGHT_BOTTOM;
      case "RIGHT_CENTER":
        return ZoomPosition.RIGHT_CENTER;
      default:
        return ZoomPosition.RIGHT_BOTTOM;
    }
  }

  /// 设置指南针右上边距(递增效果)
  ///
  /// [margin] - 右上边距
  ///
  /// * 只针对iOS
  Future<void> setCompassMargin(CompassMargin margin) async {
    await _channel.invokeMethod('setCompassMargin', margin.toJson());
  }

  /// 设置比例尺左下边距(递增效果)
  ///
  /// [margin] - 左下边距
  ///
  /// * 只针对iOS
  Future<void> setScaleMargin(ScaleMargin margin) async {
    await _channel.invokeMethod('setScaleMargin', margin.toJson());
  }

  /// 设置是否以地图中心点缩放
  ///
  /// [flag] - 是否以地图中心点缩放
  Future<void> setIsGestureScaleByMapCenterPosition(bool flag) async {
    await _channel.invokeMethod('setIsGestureScaleByMapCenterPosition', flag);
  }

  /// 获取是否以地图中心点缩放
  Future<bool> getIsGestureScaleByMapCenterPosition() async {
    return await _channel.invokeMethod('getIsGestureScaleByMapCenterPosition');
  }

  /// 设置自定义地图样式
  ///
  /// [id] - 自定义地图样式id
  Future<void> setCustomMapStyleId(String id) async {
    await _channel.invokeMethod('setCustomMapStyleId', id);
  }

  /// 关闭自定义地图样式
  Future<void> disableCustomMapStyle() async {
    await _channel.invokeMethod('disableCustomMapStyle');
  }

  /// 设置地图中心点
  ///
  /// [latLng] - 坐标点
  Future<void> setMapCenter(LatLng latLng) async {
    await _channel.invokeMethod('setMapCenter', latLng.toJson());
  }

  /// 获取地图中心点
  Future<LatLng> getMapCenter() async {
    var latLngMap = await _channel.invokeMethod('getMapCenter');
    return LatLng(
      latitude: latLngMap['latitude'] as double,
      longitude: latLngMap['longitude'] as double,
    );
  }

  /// 设置地图显示范围
  ///
  /// [bound] - 西南角和东北角
  ///
  /// * 只针对Android
  Future<void> setAndroidBound(List<LatLng> bound) async {
    await _channel.invokeMethod(
      'setBound',
      bound.map((e) => e.toJson()).toList(),
    );
  }

  /// 设置地图显示范围
  ///
  /// [bound] - 西南角和东北角
  ///
  /// * 只针对iOS
  Future<void> setIOSBound(IosBound bound) async {
    await _channel.invokeMethod(
      'setBound',
      bound.toJson(),
    );
  }

  /// 地图截屏
  Future<String> screenShot() async {
    return await _channel.invokeMethod('screenShot');
  }

  /// 清空所有Overlay
  ///
  /// [keepMyLocationOverlay] - 是否保留myLocationOverlay
  Future<void> clearAllOverlay(bool keepMyLocationOverlay) async {
    await _channel.invokeMethod('clearAllOverlay', keepMyLocationOverlay);
  }

  /// 添加Marker
  ///
  /// [param] - 参数
  Future<void> addMarker(AddMarkerParam param) async {
    var marker = await _channel.invokeMethod('addMarker', param.toJson());
    print(marker);
  }
}
