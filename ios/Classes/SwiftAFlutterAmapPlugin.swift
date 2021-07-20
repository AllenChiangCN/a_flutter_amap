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
        case "turnOnCompass":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.turnOnCompass((call.arguments as! NSNumber).boolValue)
        case "isCompassOn":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isCompassOn(result)
        case "turnOnScaleControl":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.turnOnScaleControl((call.arguments as! NSNumber).boolValue)
        case "isScaleControlOn":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isScaleControlOn(result)
        case "enableZoomGesture":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.enableZoomGesture((call.arguments as! NSNumber).boolValue)
        case "isZoomGestureEnable":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isZoomGestureEnable(result)
        case "enableRotateGesture":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.enableRotateGesture((call.arguments as! NSNumber).boolValue)
        case "isRotateGestureEnable":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isRotateGestureEnable(result)
        case "enableScrollGesture":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.enableScrollGesture((call.arguments as! NSNumber).boolValue)
        case "isScrollGestureEnable":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isScrollGestureEnable(result)
        case "enableTiltGesture":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.enableTiltGesture((call.arguments as! NSNumber).boolValue)
        case "isTiltGestureEnable":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.isTiltGestureEnable(result)
        case "setLogoMargin":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setLogoMargin(call.arguments as! Dictionary<String, Int>)
        case "setCompassMargin":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setCompassMargin(call.arguments as! Dictionary<String, Int>)
        case "setScaleMargin":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setScaleMargin(call.arguments as! Dictionary<String, Int>)
        case "setIsGestureScaleByMapCenterPosition":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setIsGestureScaleByMapCenterPosition((call.arguments as! NSNumber).boolValue)
        case "getIsGestureScaleByMapCenterPosition":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.getIsGestureScaleByMapCenterPosition(result)
        case "setCustomMapStyleId":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setCustomMapStyleId(call.arguments as! NSString)
        case "disableCustomMapStyle":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.disableCustomMapStyle()
        case "setMapCenter":
            let latLngMap = call.arguments as! Dictionary<String, Double>
            SwiftAFlutterAmapPlugin.factory?.aMapView?.setMapCenter(latLngMap)
        case "getMapCenter":
            SwiftAFlutterAmapPlugin.factory?.aMapView?.getMapCenter(result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
