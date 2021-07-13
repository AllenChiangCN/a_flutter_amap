/// Logo位置
enum LogoPosition {
  BOTTOM_LEFT,
  BOTTOM_RIGHT,
  BOTTOM_CENTER,
  MARGIN_LEFT,
  MARGIN_RIGHT,
  MARGIN_BOTTOM,
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
      case LogoPosition.MARGIN_LEFT:
        return 'MARGIN_LEFT';
      case LogoPosition.MARGIN_RIGHT:
        return 'MARGIN_RIGHT';
      case LogoPosition.MARGIN_BOTTOM:
        return 'MARGIN_BOTTOM';
      default:
        return '';
    }
  }
}
