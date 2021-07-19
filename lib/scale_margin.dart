/// 比例尺相对左下角边距
class ScaleMargin {
  /// 比例尺相对左下角边距
  ///
  /// 只针对iOS
  ///
  /// [marginLeft] 左边距
  ///
  /// [marginBottom] 下边距
  ScaleMargin({
    this.marginLeft = 0.0,
    this.marginBottom = 0.0,
  });

  ScaleMargin.fromJson(Map<String, dynamic> json) {
    marginLeft = double.tryParse(json["marginLeft"].toString()) ?? 0;
    marginBottom = double.tryParse(json["marginBottom"].toString()) ?? 0;
  }

  double marginLeft = 0.0;

  double marginBottom = 0.0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["marginLeft"] = marginLeft;
    data["marginBottom"] = marginBottom;
    return data;
  }
}
