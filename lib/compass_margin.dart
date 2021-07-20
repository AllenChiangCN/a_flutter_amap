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
    this.marginRight = 0,
    this.marginTop = 0,
  });

  CompassMargin.fromJson(Map<String, dynamic> json) {
    marginRight = int.tryParse(json["marginRight"].toString()) ?? 0;
    marginTop = int.tryParse(json["marginTop"].toString()) ?? 0;
  }

  int marginRight = 0;

  int marginTop = 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["marginRight"] = marginRight;
    data["marginTop"] = marginTop;
    return data;
  }
}
