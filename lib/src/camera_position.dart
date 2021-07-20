import 'lat_lng.dart';

/// 视角位置
class CameraPosition {
  /// 视角位置
  ///
  /// [target] - 目标点坐标
  ///
  /// [tilt] - 倾斜度，以角度为单位，0-45
  ///
  /// [zoom] - 缩放等级
  ///
  /// [bearing] - 指向的方向，以角度为单位，从正北向逆时针方向计算，0-360
  CameraPosition({
    required this.target,
    required this.tilt,
    required this.zoom,
    required this.bearing,
  })  : assert(tilt >= 0 && tilt <= 45, '角度在0-45度之间'),
        assert(bearing >= 0 && bearing <= 360, '角度在0-360度之间');

  CameraPosition.fromJson(Map<String, dynamic> json) {
    target = LatLng.fromJson(json["target"]);
    tilt = double.parse(json["tilt"]);
    zoom = double.parse(json["zoom"]);
    bearing = double.parse(json["bearing"]);
  }

  /// 目标点坐标
  late LatLng target;

  /// 倾斜度，以角度为单位，0-45
  late double tilt;

  /// 缩放等级
  late double zoom;

  /// 指向的方向，以角度为单位，从正北向逆时针方向计算，0-360
  late double bearing;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["target"] = target.toJson();
    data["tilt"] = tilt;
    data["zoom"] = zoom;
    data["bearing"] = bearing;
    return data;
  }
}
