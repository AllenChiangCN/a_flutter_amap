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
        case "getZoomLevel":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.getZoomLevel(result)
        case "zoomIn":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.zoomIn()
        case "zoomOut":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.zoomOut()
        case "setMaxZoomLevel":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setMaxZoomLevel(call.arguments as! NSNumber)
        case "setMinZoomLevel":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setMinZoomLevel(call.arguments as! NSNumber)
        case "getMaxZoomLevel":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.getMaxZoomLevel(result)
        case "getMinZoomLevel":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.getMinZoomLevel(result)
        case "setMapType":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setMapType(call.arguments as! String)
        case "getMapType":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.getMapType(result)
        case "turnOnTraffic":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.turnOnTraffic((call.arguments as! NSNumber).boolValue)
        case "isTrafficOn":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isTrafficOn(result)
        case "turnOnBuildings":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.turnOnBuildings((call.arguments as! NSNumber).boolValue)
        case "isBuildingsOn":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isBuildingsOn(result)
        case "setMapLanguage":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setMapLanguage(call.arguments as! String)
        case "getMapLanguage":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.getMapLanguage(result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
