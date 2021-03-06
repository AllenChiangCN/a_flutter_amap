//
//  AMapView.swift
//  a_flutter_amap
//
//  Created by Allen Chiang on 2021/7/7.
//

import MAMapKit
import UIKit

class AMapView: NSObject, FlutterPlatformView {
    private var _view: UIView

    private var _mAMapView: MAMapView

    private var _customMapStyleOptions = MAMapCustomStyleOptions()

    // MARK: - 属性

    /// 初始化后是否自动定位
    private var _autoLocateAfterInit: Bool

    /// 地图图层类型
    private var _mapType: String

    /// 底图语言
    private var _mapLanguage: String

    /// 是否显示实时路况
    private var _showTraffic: Bool

    /// 是否显示楼块
    private var _showBuildings: Bool

    /// 是否显示指南针
    private var _showCompass: Bool

    /// 是否显示比例尺控件
    private var _showScaleControl: Bool

    /// 是否显示室内地图
    private var _showIndoorMap: Bool

    /// 是否显示室内地图控件
    private var _showIndoorMapControl: Bool

    /// 缩放手势是否可用
    private var _zoomGestureEnable: Bool

    /// 旋转手势是否可用
    private var _rotateGestureEnable: Bool

    /// 拖拽手势是否可用
    private var _scrollGestureEnable: Bool

    /// 倾斜手势是否可用
    private var _tiltGestureEnable: Bool

    /// 是否以地图中心点缩放
    private var _isGestureScaleByMapCenter: Bool

    /// Logo左下边距
    ///
    /// marginLeft: 左边距
    ///
    /// marginBottom: 下边距
    private var _logoMargin: Dictionary<String, Int>?

    /// 指南针右上边距
    ///
    /// marginRight: 右边距
    ///
    /// marginTop: 上边距
    private var _compassMargin: Dictionary<String, Int>?

    /// 比例尺左下边距
    ///
    /// marginLeft: 左边距
    ///
    /// marginBottom: 下边距
    private var _scaleMargin: Dictionary<String, Int>?

    /// 初始缩放等级
    ///
    /// 默认[3,19]
    ///
    /// 有室内地图时[3,20]
    private var _initialZoomLevel: NSNumber

    /// 最大缩放等级
    private var _maxZoomLevel: NSNumber

    /// 最小缩放等级
    private var _minZoomLevel: NSNumber

    /// 自定义地图样式id
    private var _customMapStyleId: NSString?

    /// 显示范围
    private var _bound: Dictionary<String, NSObject>?

    // MARK: - 方法

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
        _view = UIView()
        let params = args as! NSDictionary
        _autoLocateAfterInit = params["autoLocateAfterInit"] as! Bool
        _mapType = params["mapType"] as! String
        _mapLanguage = params["mapLanguage"] as! String
        _showTraffic = params["showTraffic"] as! Bool
        _showBuildings = params["showBuildings"] as! Bool
        _showCompass = params["showCompass"] as! Bool
        _showScaleControl = params["showScaleControl"] as! Bool
        _showIndoorMap = params["showIndoorMap"] as! Bool
        _showIndoorMapControl = params["showIndoorMapControl"] as! Bool
        _zoomGestureEnable = params["zoomGestureEnable"] as! Bool
        _rotateGestureEnable = params["rotateGestureEnable"] as! Bool
        _scrollGestureEnable = params["scrollGestureEnable"] as! Bool
        _tiltGestureEnable = params["tiltGestureEnable"] as! Bool
        _isGestureScaleByMapCenter = params["isGestureScaleByMapCenter"] as! Bool
        _logoMargin = params["logoMargin"] as? Dictionary<String, Int>
        _compassMargin = params["compassMargin"] as? Dictionary<String, Int>
        _scaleMargin = params["scaleMargin"] as? Dictionary<String, Int>
        _initialZoomLevel = params["initialZoomLevel"] as! NSNumber
        _maxZoomLevel = params["maxZoomLevel"] as! NSNumber
        _minZoomLevel = params["minZoomLevel"] as! NSNumber
        _customMapStyleId = params["customMapStyleId"] as? NSString
        _bound = params["iOSBound"] as? Dictionary<String, NSObject>

        _view.backgroundColor = UIColor.white
        _mAMapView = MAMapView(frame: _view.bounds)

        super.init()
        createAMapView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    private func createAMapView(view _view: UIView) {
        configAMapView()
        _view.addSubview(_mAMapView)
        if _bound != nil {
            setBound(_bound!)
        }
    }

    /// 配置地图组件
    private func configAMapView() {
        setMaxZoomLevel(_maxZoomLevel)
        setMinZoomLevel(_minZoomLevel)
        _mAMapView.zoomLevel = CGFloat(truncating: _initialZoomLevel)

        _mAMapView.delegate = self

        _mAMapView.showsUserLocation = _autoLocateAfterInit
        if _autoLocateAfterInit && _bound == nil {
            _mAMapView.setUserTrackingMode(.follow, animated: true)
        }

        setMapType(_mapType)
        setMapLanguage(_mapLanguage)
        turnOnTraffic(_showTraffic)
        turnOnBuildings(_showBuildings)
        turnOnCompass(_showCompass)
        _mAMapView.showsScale = _showScaleControl
        _mAMapView.isShowsIndoorMap = _showIndoorMap
        if _showIndoorMap {
            _mAMapView.isShowsIndoorMapControl = _showIndoorMapControl
        } else {
            _mAMapView.isShowsIndoorMapControl = false
        }

        _mAMapView.isZoomEnabled = _zoomGestureEnable
        _mAMapView.isScrollEnabled = _scrollGestureEnable
        _mAMapView.isRotateEnabled = _rotateGestureEnable
        _mAMapView.isRotateCameraEnabled = _tiltGestureEnable

        _mAMapView.zoomingInPivotsAroundAnchorPoint = _isGestureScaleByMapCenter

        // TODO: 设置Logo位置
        if _logoMargin != nil {
            let marginLeft = _logoMargin!["marginLeft"]!
            let marginBottom = _logoMargin!["marginBottom"]!
            print("左边距: \(marginLeft), 下边距: \(marginBottom)")
            _mAMapView.logoCenter = CGPoint(x: _mAMapView.logoCenter.x + CGFloat(marginLeft), y: _mAMapView.logoCenter.y - CGFloat(marginBottom))
        }

        if _compassMargin != nil {
            let marginRight = _compassMargin!["marginRight"]!
            let marginTop = _compassMargin!["marginTop"]!
            _mAMapView.compassOrigin = CGPoint(x: _mAMapView.compassOrigin.x - CGFloat(marginRight), y: _mAMapView.compassOrigin.y + CGFloat(marginTop))
        }

        if _scaleMargin != nil {
            let marginLeft = _scaleMargin!["marginLeft"]!
            let marginBottom = _scaleMargin!["marginBottom"]!
            _mAMapView.scaleOrigin = CGPoint(x: _mAMapView.scaleOrigin.x + CGFloat(marginLeft), y: _mAMapView.scaleOrigin.y - CGFloat(marginBottom))
        }

        if _customMapStyleId != nil {
            setCustomMapStyleId(_customMapStyleId!)
        }
    }

    // MARK: - 插件暴露方法

    /// 设置当前缩放等级
    ///
    /// - Parameter zoomLevel: 缩放等级
    func setZoomLevel(_ zoomLevel: NSNumber) {
        _mAMapView.setZoomLevel(CGFloat(truncating: zoomLevel), animated: true)
    }

    /// 获取当前缩放等级
    func getZoomLevel(_ result: FlutterResult) {
        result(_mAMapView.zoomLevel)
    }

    /// 放大缩放等级
    func zoomIn() {
        _mAMapView.setZoomLevel(_mAMapView.zoomLevel + 1, animated: true)
    }

    /// 缩小缩放等级
    func zoomOut() {
        _mAMapView.setZoomLevel(_mAMapView.zoomLevel - 1, animated: true)
    }

    /// 设置最大缩放等级
    ///
    /// - Parameter level: 最大缩放等级
    func setMaxZoomLevel(_ level: NSNumber) {
        _mAMapView.maxZoomLevel = CGFloat(truncating: level)
    }

    /// 设置最小缩放等级
    ///
    /// - Parameter level: 最小缩放等级
    func setMinZoomLevel(_ level: NSNumber) {
        _mAMapView.minZoomLevel = CGFloat(truncating: level)
    }

    /// 获取最大缩放等级
    func getMaxZoomLevel(_ result: FlutterResult) {
        result(_mAMapView.maxZoomLevel)
    }

    /// 获取最小缩放等级
    func getMinZoomLevel(_ result: FlutterResult) {
        result(_mAMapView.minZoomLevel)
    }

    /// 设置地图图层类型
    ///
    /// - Parameter type: 图层类型
    func setMapType(_ type: String) {
        if _mapType != type {
            _mapType = type
        }
        let t: MAMapType
        switch type {
        case "NORMAL":
            t = MAMapType.standard
        case "NIGHT":
            t = MAMapType.standardNight
        case "NAVI":
            t = MAMapType.navi
        case "BUS":
            t = MAMapType.bus
        case "SATELLITE":
            t = MAMapType.satellite
        default:
            t = MAMapType.standard
        }
        _mAMapView.mapType = t
    }

    /// 获取地图图层类型
    func getMapType(_ result: FlutterResult) {
        result(_mapType)
    }

    /// 打开/关闭实时路况
    ///
    /// - Parameter on: 打开/关闭
    func turnOnTraffic(_ on: Bool) {
        _mAMapView.isShowTraffic = on
    }

    /// 实时路况是否打开
    func isTrafficOn(_ result: FlutterResult) {
        result(_mAMapView.isShowTraffic)
    }

    /// 打开/关闭楼块
    ///
    /// - Parameter on: 打开/关闭
    func turnOnBuildings(_ on: Bool) {
        _mAMapView.isShowsBuildings = on
    }

    /// 楼块是否打开
    func isBuildingsOn(_ result: FlutterResult) {
        result(_mAMapView.isShowsBuildings)
    }

    /// 设置底图语言
    ///
    /// - Parameter language: 底图语言
    func setMapLanguage(_ language: String) {
        if _mapLanguage != language {
            _mapLanguage = language
        }
        _mAMapView.mapLanguage = _mapLanguage == "CHINESE" ? 0 : 1
    }

    /// 获取底图语言
    func getMapLanguage(_ result: FlutterResult) {
        result(_mapLanguage)
    }

    /// 打开/关闭指南针
    ///
    /// - Parameter on: 打开/关闭
    func turnOnCompass(_ on: Bool) {
        _mAMapView.showsCompass = on
    }

    /// 指南针是否打开
    func isCompassOn(_ result: FlutterResult) {
        result(_mAMapView.showsCompass)
    }

    /// 打开/关闭比例尺控件
    ///
    /// - Parameter on: 打开/关闭
    func turnOnScaleControl(_ on: Bool) {
        _mAMapView.showsScale = on
    }

    /// 比例尺控件是否打开
    func isScaleControlOn(_ result: FlutterResult) {
        result(_mAMapView.showsScale)
    }

    /// 启用/停用缩放手势
    ///
    /// - Parameter on: 启用/停用
    func enableZoomGesture(_ on: Bool) {
        _mAMapView.isZoomEnabled = on
    }

    /// 缩放手势是否启用
    func isZoomGestureEnable(_ result: FlutterResult) {
        result(_mAMapView.isZoomEnabled)
    }

    /// 启用/停用旋转手势
    ///
    /// - Parameter on: 启用/停用
    func enableRotateGesture(_ on: Bool) {
        _mAMapView.isRotateEnabled = on
    }

    /// 旋转手势是否启用
    func isRotateGestureEnable(_ result: FlutterResult) {
        result(_mAMapView.isRotateEnabled)
    }

    /// 启用/停用拖拽手势
    ///
    /// - Parameter on: 启用/停用
    func enableScrollGesture(_ on: Bool) {
        _mAMapView.isScrollEnabled = on
    }

    /// 拖拽手势是否启用
    func isScrollGestureEnable(_ result: FlutterResult) {
        result(_mAMapView.isScrollEnabled)
    }

    /// 启用/停用倾斜手势
    ///
    /// - Parameter on: 启用/停用
    func enableTiltGesture(_ on: Bool) {
        _mAMapView.isRotateCameraEnabled = on
    }

    /// 倾斜手势是否启用
    func isTiltGestureEnable(_ result: FlutterResult) {
        result(_mAMapView.isRotateCameraEnabled)
    }

    /// 设置Logo左下边距
    ///
    /// - Parameter margin: 左下边距，包含*marginLeft*和*marginBottom*
    func setLogoMargin(_ margin: Dictionary<String, Int>) {
        let marginLeft = margin["marginLeft"]!
        let marginBottom = margin["marginBottom"]!
        _mAMapView.logoCenter = CGPoint(x: _mAMapView.logoCenter.x + CGFloat(marginLeft),
                                        y: _mAMapView.logoCenter.y - CGFloat(marginBottom))
    }

    /// 设置指南针右上边距
    ///
    /// - Parameter margin: 右上边距，包含*marginRight*和*marginTop*
    func setCompassMargin(_ margin: Dictionary<String, Int>) {
        let marginRight = margin["marginRight"]!
        let marginTop = margin["marginTop"]!
        _mAMapView.compassOrigin = CGPoint(x: _mAMapView.compassOrigin.x - CGFloat(marginRight),
                                           y: _mAMapView.compassOrigin.y + CGFloat(marginTop))
    }

    /// 设置比例尺左下边距
    ///
    /// - Parameter margin: 左下边距，包含*marginLeft*和*marginBottom*
    func setScaleMargin(_ margin: Dictionary<String, Int>) {
        let marginLeft = margin["marginLeft"]!
        let marginBottom = margin["marginBottom"]!
        _mAMapView.scaleOrigin = CGPoint(x: _mAMapView.scaleOrigin.x + CGFloat(marginLeft),
                                         y: _mAMapView.scaleOrigin.y - CGFloat(marginBottom))
    }

    /// 设置是否以地图中心点缩放
    ///
    /// - Parameter flag: 是否以地图中心点缩放
    func setIsGestureScaleByMapCenterPosition(_ flag: Bool) {
        _mAMapView.zoomingInPivotsAroundAnchorPoint = flag
    }

    /// 获取是否以地图中心点缩放
    func getIsGestureScaleByMapCenterPosition(_ result: FlutterResult) {
        result(_mAMapView.zoomingInPivotsAroundAnchorPoint)
    }

    /// 设置自定义地图样式
    ///
    /// - Parameter id: 自定义地图样式id
    func setCustomMapStyleId(_ id: NSString) {
        _customMapStyleOptions.styleId = id as String
        _mAMapView.setCustomMapStyleOptions(_customMapStyleOptions)
        _mAMapView.customMapStyleEnabled = true
    }

    /// 关闭自定义地图样式
    func disableCustomMapStyle() {
        _mAMapView.customMapStyleEnabled = false
    }

    /// 设置地图中心点
    ///
    /// - Parameter latLng: 地图中心点, latitude, longitude
    func setMapCenter(_ latLng: Dictionary<String, Double>) {
        _mAMapView.setCenter(CLLocationCoordinate2D(latitude: latLng["latitude"]!, longitude: latLng["longitude"]!), animated: true)
    }

    /// 获取地图中心点
    func getMapCenter(_ result: FlutterResult) {
        result([
            "latitude": _mAMapView.centerCoordinate.latitude,
            "longitude": _mAMapView.centerCoordinate.longitude,
        ])
    }

    /// 设置地图显示范围
    ///
    /// - Parameter bound: 地图显示范围
    func setBound(_ bound: Dictionary<String, NSObject>) {
        let latLng = bound["latLng"] as! Dictionary<String, Double>
        let southWest = CLLocationCoordinate2D(
            latitude: latLng["latitude"]!,
            longitude: latLng["longitude"]!
        )
        _mAMapView.limitRegion = MACoordinateRegion(center: southWest, span: MACoordinateSpan(
            latitudeDelta: bound["latitudeDelta"] as! Double,
            longitudeDelta: bound["longitudeDelta"] as! Double)
        )
    }

    /// 地图截屏
    func screenShot(_ result: FlutterResult) {
        let image = _mAMapView.takeSnapshot(in: _mAMapView.bounds)
        if image != nil {
            let path = NSTemporaryDirectory()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyyMMddHHmmss"
            let filePath = "\(path)\(dateFormatter.string(from: Date())).png"
            do {
                try image!.pngData()?.write(to: URL(fileURLWithPath: filePath, isDirectory: false), options: .atomicWrite)
                result(filePath)
            } catch {
                print("截屏保存失败\(error.localizedDescription)")
                result(FlutterError(code: "1002", message: "截屏保存失败", details: nil))
            }
        } else {
            result(FlutterError(code: "1003", message: "截屏失败", details: nil))
        }
    }
}

extension AMapView: MAMapViewDelegate {
}
