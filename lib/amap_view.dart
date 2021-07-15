import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'compass_margin.dart';
import 'location_type.dart';
import 'logo_margin.dart';
import 'logo_position.dart';
import 'zoom_position.dart';

/// 高德地图
class AMapView extends StatelessWidget {
  const AMapView({
    Key? key,
    this.autoLocateAfterInit = false,
    this.locationType = LocationType.LOCATE,
    this.locationInterval = 2000,
    this.showZoomControl = true,
    this.showCompass = false,
    this.showLocationButton = false,
    this.showScaleControl = false,
    this.allGestureEnable,
    this.zoomGestureEnable = true,
    this.rotateGestureEnable = true,
    this.scrollGestureEnable = true,
    this.tiltGestureEnable = true,
    this.isGestureScaleByMapCenter = false,
    this.zoomPosition = ZoomPosition.RIGHT_BOTTOM,
    this.logoPosition = LogoPosition.BOTTOM_LEFT,
    this.logoMargin,
    this.compassMargin,
  }) : super(key: key);

  final String viewType = 'AMapView';

  /// 初始化后是否自动定位
  final bool autoLocateAfterInit;

  /// 定位类型
  final LocationType locationType;

  /// 定位间隔，仅定位类型为连续定位时有效，单位毫秒
  final int locationInterval;

  /// 是否显示缩放控件
  ///
  /// 只针对Android
  final bool showZoomControl;

  /// 是否显示指南针
  final bool showCompass;

  /// 是否显示定位按钮
  ///
  /// 只针对Android
  final bool showLocationButton;

  /// 是否显示比例尺控件
  final bool showScaleControl;

  /// 所有手势是否可用
  ///
  /// 为null或true时其余手势可以单独控制
  final bool? allGestureEnable;

  /// 缩放手势是否可用
  final bool zoomGestureEnable;

  /// 旋转手势是否可用
  final bool rotateGestureEnable;

  /// 拖拽手势是否可用
  final bool scrollGestureEnable;

  /// 倾斜手势是否可用
  final bool tiltGestureEnable;

  /// 是否以地图中心点缩放
  final bool isGestureScaleByMapCenter;

  /// 缩放控件位置
  ///
  /// 只针对Android
  final ZoomPosition zoomPosition;

  /// Logo位置
  ///
  /// 只针对Android
  final LogoPosition logoPosition;

  /// Logo相对左下角边距，同时会影响比例尺控件的位置
  ///
  /// 不为null时LogoPosition属性无效
  final LogoMargin? logoMargin;

  /// 指南针相对右上角边距
  ///
  /// 只针对iOS
  final CompassMargin? compassMargin;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> creationParams = <String, dynamic>{
      'autoLocateAfterInit': autoLocateAfterInit,
      'locationType': locationType.name,
      'locationInterval': locationInterval,
      'showZoomControl': showZoomControl,
      'showCompass': showCompass,
      'showLocationButton': showLocationButton,
      'showScaleControl': showScaleControl,
      'allGestureEnable': allGestureEnable,
      'zoomGestureEnable': zoomGestureEnable,
      'rotateGestureEnable': rotateGestureEnable,
      'scrollGestureEnable': scrollGestureEnable,
      'tiltGestureEnable': tiltGestureEnable,
      'isGestureScaleByMapCenter': isGestureScaleByMapCenter,
      'zoomPosition': zoomPosition.name,
      'logoPosition': logoPosition.name,
      'logoMargin': logoMargin?.toJson(),
      'compassMargin': compassMargin?.toJson(),
    };
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: viewType,
          creationParams: creationParams,
          creationParamsCodec: StandardMessageCodec(),
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: viewType,
          creationParams: creationParams,
          creationParamsCodec: StandardMessageCodec(),
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError('Unsupported Fuchsia');
      case TargetPlatform.linux:
        throw UnsupportedError('Unsupported Linux');
      case TargetPlatform.macOS:
        throw UnsupportedError('Unsupported MacOS');
      case TargetPlatform.windows:
        throw UnsupportedError('Unsupported Windows');
    }
  }
}
