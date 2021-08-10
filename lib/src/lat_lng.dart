/// 坐标点
class LatLng {
  /// 坐标点
  ///
  /// [latitude] - 纬度
  ///
  /// [longitude] - 经度
  LatLng({
    required this.latitude,
    required this.longitude,
  });

  LatLng.fromJson(Map<String, dynamic> json) {
    latitude = double.parse(json['latitude']);
    longitude = double.parse(json['longitude']);
  }

  /// 纬度
  late double latitude;

  /// 经度
  late double longitude;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
