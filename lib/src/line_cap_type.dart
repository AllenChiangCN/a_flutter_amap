/// Polyline尾部形状
enum LineCapType {
  /// 箭头
  LineCapArrow,

  /// 普通头
  LineCapButt,

  /// 圆形头
  LineCapRound,

  /// 拓展头
  LineCapSquare,
}

extension LineCapTypeExtension on LineCapType {
  int get value {
    switch (this) {
      case LineCapType.LineCapButt:
        return 0;
      case LineCapType.LineCapSquare:
        return 1;
      case LineCapType.LineCapArrow:
        return 2;
      case LineCapType.LineCapRound:
        return 3;
    }
  }
}
