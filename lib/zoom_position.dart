/// 缩放控件位置
///
/// 只针对Android
enum ZoomPosition {
  RIGHT_BOTTOM,
  RIGHT_CENTER,
}

extension ZoomPositionExtension on ZoomPosition {
  String get name {
    switch (this) {
      case ZoomPosition.RIGHT_BOTTOM:
        return 'RIGHT_BOTTOM';
      case ZoomPosition.RIGHT_CENTER:
        return 'RIGHT_CENTER';
      default:
        return 'RIGHT_BOTTOM';
    }
  }
}
