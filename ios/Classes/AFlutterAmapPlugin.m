#import "AFlutterAmapPlugin.h"
#if __has_include(<a_flutter_amap/a_flutter_amap-Swift.h>)
#import <a_flutter_amap/a_flutter_amap-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "a_flutter_amap-Swift.h"
#endif

@implementation AFlutterAmapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAFlutterAmapPlugin registerWithRegistrar:registrar];
}
@end
