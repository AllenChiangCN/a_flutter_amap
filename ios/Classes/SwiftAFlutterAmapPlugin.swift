import Flutter
import UIKit

public class SwiftAFlutterAmapPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = AMapViewFactory(messenger: registrar.messenger())
        let channel = FlutterMethodChannel(name: "a_flutter_amap", binaryMessenger: registrar.messenger())
        let instance = SwiftAFlutterAmapPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.register(factory, withId: "AMapView")
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
