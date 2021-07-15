/// 指南针相对右上角边距
class CompassMargin {
  /// 指南针相对右上角边距
  ///
  /// 只针对iOS
  ///
  /// [marginRight] 右边距
  ///
  /// [marginTop] 上边距
  CompassMargin({
    this.marginRight = 0.0,
    this.marginTop = 0.0,
  });

  CompassMargin.fromJson(Map<String, dynamic> json) {
    marginRight = double.tryParse(json["marginRight"].toString()) ?? 0;
    marginTop = double.tryParse(json["marginTop"].toString()) ?? 0;
  }

  double marginRight = 0.0;

  double marginTop = 0.0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["marginRight"] = marginRight;
    data["marginTop"] = marginTop;
    return data;
  }
}
