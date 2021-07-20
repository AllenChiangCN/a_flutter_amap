/// 定位类型
enum LocationType {
  /// 只定位
  SHOW,

  /// 定位、且将视角移动到地图中心点
  LOCATE,

  /// 定位、且将视角移动到地图中心点，定位点跟随设备移动
  FOLLOW,

  /// 定位、且将视角移动到地图中心点，地图依照设备方向旋转，定位点会跟随设备移动
  MAP_ROTATE,

  /// 定位、且将视角移动到地图中心点，定位点依照设备方向旋转，并且会跟随设备移动
  LOCATION_ROTATE,

  /// 定位、但不会移动到地图中心点，定位点依照设备方向旋转，并且会跟随设备移动
  LOCATION_ROTATE_NO_CENTER,

  /// 定位、但不会移动到地图中心点，并且会跟随设备移动
  FOLLOW_NO_CENTER,

  /// 定位、但不会移动到地图中心点，地图依照设备方向旋转，并且会跟随设备移动
  MAP_ROTATE_NO_CENTER,
}

extension LocationTypeExtension on LocationType {
  String get name {
    switch (this) {
      case LocationType.SHOW:
        return 'SHOW';
      case LocationType.LOCATE:
        return 'LOCATE';
      case LocationType.FOLLOW:
        return 'FOLLOW';
      case LocationType.MAP_ROTATE:
        return 'MAP_ROTATE';
      case LocationType.LOCATION_ROTATE:
        return 'LOCATION_ROTATE';
      case LocationType.LOCATION_ROTATE_NO_CENTER:
        return 'LOCATION_ROTATE_NO_CENTER';
      case LocationType.FOLLOW_NO_CENTER:
        return 'FOLLOW_NO_CENTER';
      case LocationType.MAP_ROTATE_NO_CENTER:
        return 'MAP_ROTATE_NO_CENTER';
      default:
        return 'SHOW';
    }
  }
}
