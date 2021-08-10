/// 默认Marker颜色
enum MarkerColor {
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  CYAN,
  AZURE,
  BLUE,
  VIOLET,
  MAGENTA,
  ROSE,
}

extension MarkerColorExtension on MarkerColor {
  String get name {
    switch (this) {
      case MarkerColor.RED:
        return 'RED';
      case MarkerColor.ORANGE:
        return 'ORANGE';
      case MarkerColor.YELLOW:
        return 'YELLOW';
      case MarkerColor.GREEN:
        return 'GREEN';
      case MarkerColor.CYAN:
        return 'CYAN';
      case MarkerColor.AZURE:
        return 'AZURE';
      case MarkerColor.BLUE:
        return 'BLUE';
      case MarkerColor.VIOLET:
        return 'VIOLET';
      case MarkerColor.MAGENTA:
        return 'MAGENTA';
      case MarkerColor.ROSE:
        return 'ROSE';
    }
  }
}
