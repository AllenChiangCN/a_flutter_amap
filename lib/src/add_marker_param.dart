import '../a_flutter_amap.dart';

/// 添加Marker参数
class AddMarkerParam {
/*
{
  'position': {
    'latitude': 20.21,
    'longitude': 108.12
  },
  'title': 'askjdfl',
  'snippet': 'ajsdf',
  'draggable': true,
  'visible': true,
  'isInfoWindowEnable': true,
  'alpha': 0.5,
  'rotateAngle': 23.33,
  'zIndex': 1,
  'anchor': {
    'anchorU': 12.12,
    'anchorV': 12.12
  },
  "markerColor": MarkerColor.RED
} 
*/

  /// 添加Marker参数
  ///
  /// [position] - 经纬度
  ///
  /// [title] - 标题
  ///
  /// [snippet] - 内容
  ///
  /// [draggable] - 是否可拖拽
  ///
  /// [visible] - 是否可见
  ///
  /// [isInfoWindowEnable] - InfoWindow是否可用
  ///
  /// [alpha] - 透明度, 0~1
  ///
  /// [rotateAngle] - 图片旋转角度，从正北开始，逆时针计算
  ///
  /// [zIndex] - ZIndex
  ///
  /// [anchor] - 锚点, 默认(0.5,1)
  ///
  /// [markerColor] - 默认Marker颜色
  AddMarkerParam({
    required this.position,
    required this.title,
    required this.snippet,
    this.draggable = false,
    this.visible = true,
    this.isInfoWindowEnable = true,
    this.alpha = 1,
    this.rotateAngle = 0,
    this.zIndex = 1,
    this.anchor,
    this.markerColor,
  }) : assert(alpha >= 0 && alpha <= 1, 'alpha取值范围为0-1') {
    anchor ??= Anchor(anchorU: 0.5, anchorV: 1);
  }

  AddMarkerParam.fromJson(Map<String, dynamic> json) {
    position = LatLng.fromJson(json['position']);
    title = json['title'].toString();
    snippet = json['snippet'].toString();
    draggable = json['draggable'];
    visible = json['visible'];
    isInfoWindowEnable = json['isInfoWindowEnable'];
    alpha = double.parse(json['alpha']);
    rotateAngle = double.parse(json['rotateAngle']);
    zIndex = int.parse(json['zIndex']);
    anchor = (json['anchor'] != null && (json['anchor'] is Map))
        ? Anchor.fromJson(json['anchor'])
        : null;
    markerColor = json['markerColor'] != null
        ? json['markerColor'].toString().markerColor
        : null;
  }

  /// 经纬度
  late LatLng position;

  /// 标题
  late String title;

  /// 内容
  late String snippet;

  /// 是否可拖拽
  late bool draggable;

  /// 是否可见
  late bool visible;

  /// InfoWindow是否可用
  late bool isInfoWindowEnable;

  /// 透明度，0~1
  late double alpha;

  /// 图片旋转角度，从正北开始，逆时针计算
  late double rotateAngle;

  /// ZIndex
  late int zIndex;

  /// 锚点，默认(0.5, 1)
  Anchor? anchor;

  /// 默认Marker颜色
  MarkerColor? markerColor;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['position'] = position.toJson();
    data['title'] = title;
    data['snippet'] = snippet;
    data['draggable'] = draggable;
    data['visible'] = visible;
    data['isInfoWindowEnable'] = isInfoWindowEnable;
    data['alpha'] = alpha;
    data['rotateAngle'] = rotateAngle;
    data['zIndex'] = zIndex;
    data['anchor'] = anchor?.toJson();
    data['markerColor'] = markerColor?.name;
    return data;
  }
}
