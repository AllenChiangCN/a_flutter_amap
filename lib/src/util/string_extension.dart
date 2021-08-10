import '../../a_flutter_amap.dart';

/// String扩展函数
extension StringExtension on String {
  /// 获取MarkerColor
  MarkerColor get markerColor {
    switch (this) {
      case "RED":
        return MarkerColor.RED;
      case "ORANGE":
        return MarkerColor.ORANGE;

      case "YELLOW":
        return MarkerColor.YELLOW;

      case "GREEN":
        return MarkerColor.GREEN;

      case "CYAN":
        return MarkerColor.CYAN;

      case "AZURE":
        return MarkerColor.AZURE;

      case "BLUE":
        return MarkerColor.BLUE;

      case "VIOLET":
        return MarkerColor.VIOLET;

      case "MAGENTA":
        return MarkerColor.MAGENTA;

      case "ROSE":
        return MarkerColor.ROSE;

      default:
        return MarkerColor.BLUE;
    }
  }
}
