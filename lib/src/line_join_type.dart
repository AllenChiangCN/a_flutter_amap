/// Polyline连接处形状
enum LineJoinType {
  /// 尖角连接点
  LineJoinBevel,

  /// 斜接连接点
  LineJoinMiter,

  /// 圆角连接点
  LineJoinRound,
}

extension LineJoinTypeExtension on LineJoinType {
  int get value {
    switch (this) {
      case LineJoinType.LineJoinBevel:
        return 0;
      case LineJoinType.LineJoinMiter:
        return 1;
      case LineJoinType.LineJoinRound:
        return 2;
    }
  }
}
