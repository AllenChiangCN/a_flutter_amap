/// 锚点
class Anchor {
  /// 锚点
  ///
  /// [anchorU] - 水平范围比例, 0~1
  ///
  /// [anchorV] - 水平范围比例, 0~1
  Anchor({
    required this.anchorU,
    required this.anchorV,
  });

  Anchor.fromJson(Map<String, dynamic> json) {
    anchorU = double.parse(json['anchorU']);
    anchorV = double.parse(json['anchorV']);
  }

  /// 水平范围比例, 0~1
  late double anchorU;

  /// 垂直范围比例, 0~1
  late double anchorV;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['anchorU'] = anchorU;
    data['anchorV'] = anchorV;
    return data;
  }
}
