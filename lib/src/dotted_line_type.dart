/// 虚线类型
enum DottedLineType {
  /// 方形，值为0
  DOTTEDLINE_TYPE_SQUARE,

  /// 圆形，值为1
  DOTTEDLINE_TYPE_CIRCLE,
}

extension DottedLineTypeExtension on DottedLineType {
  int get value {
    switch (this) {
      case DottedLineType.DOTTEDLINE_TYPE_SQUARE:
        return 0;
      case DottedLineType.DOTTEDLINE_TYPE_CIRCLE:
        return 1;
    }
  }
}
