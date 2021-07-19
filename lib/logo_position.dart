/// Logo位置
///
/// 只针对Android
enum LogoPosition {
  BOTTOM_LEFT,
  BOTTOM_RIGHT,
  BOTTOM_CENTER,
}

extension LogoPositionExtension on LogoPosition {
  String get name {
    switch (this) {
      case LogoPosition.BOTTOM_LEFT:
        return 'BOTTOM_LEFT';
      case LogoPosition.BOTTOM_RIGHT:
        return 'BOTTOM_RIGHT';
      case LogoPosition.BOTTOM_CENTER:
        return 'BOTTOM_CENTER';
      default:
        return '';
    }
  }
}
