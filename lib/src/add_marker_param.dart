import '../a_flutter_amap.dart';

/// 添加Marker参数
class AddMarkerParam {
/*
{
  'position': {
    'latitude': 20.21,
    'longitude': 108.12
  },
  'anchor': {
    'anchorU': 12.12,
    'anchorV': 12.12
  },
  'title': 'askjdfl',
  'snippet': 'ajsdf',
  'draggable': true,
  'visible': true,
  'alpha': 0.5
} 
*/

  /// 添加Marker参数
  ///
  /// [position] - 经纬度
  ///
  /// [anchor] - 锚点
  ///
  /// [title] - 标题
  ///
  /// [snippet] - 内容
  ///
  /// [draggable] - 是否可拖拽
  ///
  /// [visible] - 是否可见
  ///
  /// [alpha] - 透明度
  AddMarkerParam({
    this.position,
    this.anchor,
    this.title,
    this.snippet,
    this.draggable,
    this.visible,
    this.alpha,
  });

  AddMarkerParam.fromJson(Map<String, dynamic> json) {
    position = (json['position'] != null && (json['position'] is Map))
        ? LatLng.fromJson(json['position'])
        : null;
    anchor = (json['anchor'] != null && (json['anchor'] is Map))
        ? Anchor.fromJson(json['anchor'])
        : null;
    title = json['title']?.toString();
    snippet = json['snippet']?.toString();
    draggable = json['draggable'];
    visible = json['visible'];
    alpha = double.tryParse(json['alpha']?.toString() ?? '');
  }

  LatLng? position;
  Anchor? anchor;
  String? title;
  String? snippet;
  bool? draggable;
  bool? visible;
  double? alpha;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (position != null) {
      data['position'] = position!.toJson();
    }
    if (anchor != null) {
      data['anchor'] = anchor!.toJson();
    }
    data['title'] = title;
    data['snippet'] = snippet;
    data['draggable'] = draggable;
    data['visible'] = visible;
    data['alpha'] = alpha;
    return data;
  }
}
