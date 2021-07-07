import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// 高德地图
class AMapView extends StatelessWidget {
  const AMapView({Key? key}) : super(key: key);

  final String viewType = 'AMapView';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> creationParams = <String, dynamic>{};
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: viewType,
          creationParams: creationParams,
          creationParamsCodec: StandardMessageCodec(),
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: viewType,
          creationParams: creationParams,
          creationParamsCodec: StandardMessageCodec(),
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError('Unsupported Fuchsia');
      case TargetPlatform.linux:
        throw UnsupportedError('Unsupported Linux');
      case TargetPlatform.macOS:
        throw UnsupportedError('Unsupported MacOS');
      case TargetPlatform.windows:
        throw UnsupportedError('Unsupported Windows');
    }
  }
}
