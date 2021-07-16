import Flutter
import UIKit

public class SwiftAFlutterAmapPlugin: NSObject, FlutterPlugin {
    private static var factory: AMapViewFactory?

    public static func register(with registrar: FlutterPluginRegistrar) {
        factory = AMapViewFactory(messenger: registrar.messenger())
        let channel = FlutterMethodChannel(name: "a_flutter_amap", binaryMessenger: registrar.messenger())
        let instance = SwiftAFlutterAmapPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.register(factory!, withId: "AMapView")
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "setZoomLevel":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setZoomLevel(call.arguments as! NSNumber)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
