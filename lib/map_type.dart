/// 地图图层类型
enum MapType {
  NORMAL,
  NIGHT,
  NAVI,
  BUS,
  SATELLITE,
}

extension MapTypeExtension on MapType {
  String get name {
    switch (this) {
      case MapType.NORMAL:
        return 'NORMAL';
      case MapType.NIGHT:
        return 'NIGHT';
      case MapType.NAVI:
        return 'NAVI';
      case MapType.BUS:
        return 'BUS';
      case MapType.SATELLITE:
        return 'SATELLITE';
      default:
        return 'NORMAL';
    }
  }
}
