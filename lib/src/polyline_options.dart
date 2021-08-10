import 'package:a_flutter_amap/a_flutter_amap.dart';

class PolylineOptions {
  /// PolylineOptions 参数
  ///
  /// [lineCapType] - [LineCapType] Polyline尾部形状
  ///
  /// [lineJoinType] - [LineJoinType] Polyline连接处形状
  ///
  /// [dottedLineType] - [DottedLineType] 虚线类型
  ///
  /// [width] - 线段的宽度
  ///
  /// [latlngs] - 顶点到线段的坐标集合
  ///
  /// [isGeodesic] - 设置线段是否为大地曲线，默认false，不画大地曲线。
  ///
  /// [isDottedLine] - 线段是否画虚线，默认为false，画实线
  ///
  /// [alpha] - 线段的ARGB颜色
  /// [red] - 线段的ARGB颜色
  /// [green] - 线段的ARGB颜色
  /// [blue] - 线段的ARGB颜色
  ///
  /// [isVisible] - 设置线段的可见性
  ///
  /// [useGradient] - 设置是否使用渐变色
  ///
  /// [zIndex] - 设置线段Z轴的值
  int? lineCapType = LineCapType.LineCapButt.value;
  int? lineJoinType = LineJoinType.LineJoinBevel.value;
  int? dottedLineType = DottedLineType.DOTTEDLINE_TYPE_CIRCLE.value;
  double? width = 10;
  bool? isGeodesic = false;
  bool? isDottedLine = false;
  bool? useGradient = false;
  bool? isVisible = true;
  int? alpha = 255;
  int? red = 1;
  int? green = 1;
  int? blue = 1;
  double? zIndex = 1;
  late List<LatLng> latlngs;

  PolylineOptions({
    this.lineCapType,
    this.lineJoinType,
    this.dottedLineType,
    this.width,
    this.isGeodesic,
    this.isDottedLine,
    this.useGradient,
    this.isVisible,
    this.zIndex,
    this.alpha,
    this.red,
    this.green,
    this.blue,
    required this.latlngs,
  });

  PolylineOptions.fromJson(Map<String, dynamic> json) {
    lineCapType = int.tryParse(json["lineCapType"]?.toString() ?? '');
    lineJoinType = int.tryParse(json["lineJoinType"]?.toString() ?? '');
    dottedLineType = int.tryParse(json["dottedLineType"]?.toString() ?? '');
    width = double.tryParse(json["width"]?.toString() ?? '');
    zIndex = double.tryParse(json["zIndex"]?.toString() ?? '');
    isGeodesic = json["isGeodesic"];
    isDottedLine = json["isDottedLine"];
    useGradient = json["useGradient"];
    isVisible = json["isVisible"];
    alpha = int.tryParse(json["alpha"]?.toString() ?? '');
    red = int.tryParse(json["red"]?.toString() ?? '');
    green = int.tryParse(json["green"]?.toString() ?? '');
    blue = int.tryParse(json["blue"]?.toString() ?? '');
    if (json["latlngs"] != null && (json["latlngs"] is List)) {
      final v = json["latlngs"];
      final arr0 = <LatLng>[];
      v.forEach((v) {
        arr0.add(LatLng.fromJson(v));
      });
      latlngs = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["lineCapType"] = lineCapType;
    data["lineJoinType"] = lineJoinType;
    data["dottedLineType"] = dottedLineType;
    data["width"] = width;
    data["zIndex"] = zIndex;
    data["useGradient"] = useGradient;
    data["isVisible"] = isVisible;
    data["isGeodesic"] = isGeodesic;
    data["isDottedLine"] = isDottedLine;
    data["alpha"] = alpha;
    data["red"] = red;
    data["green"] = green;
    data["blue"] = blue;
    final v = latlngs;
    final arr0 = [];
    v.forEach((v) {
      arr0.add(v.toJson());
    });
    data["latlngs"] = arr0;
    return data;
  }
}
