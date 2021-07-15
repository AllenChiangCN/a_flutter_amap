/// Logo相对左下角边距
class LogoMargin {
  /// Logo相对左下角边距
  ///
  /// [marginLeft] 左边距
  ///
  /// [marginBottom] 下边距
  LogoMargin({
    this.marginLeft = 0.0,
    this.marginBottom = 0.0,
  });

  LogoMargin.fromJson(Map<String, dynamic> json) {
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
