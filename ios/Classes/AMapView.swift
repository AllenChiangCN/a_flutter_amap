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
    private var _logoMargin: NSDictionary?

    /// 指南针右上边距
    ///
    /// marginRight: 右边距
    ///
    /// marginTop: 上边距
    private var _compassMargin: NSDictionary?

    /// 比例尺左下边距
    ///
    /// marginLeft: 左边距
    ///
    /// marginBottom: 下边距
    private var _scaleMargin: NSDictionary?

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
        _logoMargin = params["logoMargin"] as? NSDictionary
        _compassMargin = params["compassMargin"] as? NSDictionary
        _scaleMargin = params["scaleMargin"] as? NSDictionary
        _initialZoomLevel = params["initialZoomLevel"] as! NSNumber
        _maxZoomLevel = params["maxZoomLevel"] as! NSNumber
        _minZoomLevel = params["minZoomLevel"] as! NSNumber

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
    }

    /// 配置地图组件
    private func configAMapView() {
        setMaxZoomLevel(_maxZoomLevel)
        setMinZoomLevel(_minZoomLevel)
        _mAMapView.zoomLevel = CGFloat(truncating: _initialZoomLevel)

        _mAMapView.delegate = self

        _mAMapView.showsUserLocation = _autoLocateAfterInit
        if _autoLocateAfterInit {
            _mAMapView.setUserTrackingMode(.follow, animated: true)
        }

        setMapType(_mapType)
        _mAMapView.mapLanguage = _mapLanguage == "CHINESE" ? 0 : 1
        turnOnTraffic(_showTraffic)
        turnOnBuildings(_showBuildings)
        _mAMapView.showsCompass = _showCompass
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
//        if _logoMargin != nil {
//            let marginLeft = _logoMargin!["marginLeft"] as! Double
//            let marginBottom = _logoMargin!["marginBottom"] as! Double
//            print("左边距: \(marginLeft), 下边距: \(marginBottom)")
//            mapView.logoCenter = CGPoint(x: mapView.logoCenter.x + CGFloat(marginLeft), y: mapView.logoCenter.y - CGFloat(marginBottom))
//        }

        if _compassMargin != nil {
            let marginRight = _compassMargin!["marginRight"] as! Double
            let marginTop = _compassMargin!["marginTop"] as! Double
            _mAMapView.compassOrigin = CGPoint(x: _mAMapView.compassOrigin.x - CGFloat(marginRight), y: _mAMapView.compassOrigin.y + CGFloat(marginTop))
        }

        if _scaleMargin != nil {
            let marginLeft = _scaleMargin!["marginLeft"] as! Double
            let marginBottom = _scaleMargin!["marginBottom"] as! Double
            _mAMapView.scaleOrigin = CGPoint(x: _mAMapView.scaleOrigin.x + CGFloat(marginLeft), y: _mAMapView.scaleOrigin.y - CGFloat(marginBottom))
        }
    }

    // MARK: - 暴露方法

    /// 设置当前缩放等级
    ///
    /// - Parameter zoomLevel: 缩放等级
    func setZoomLevel(_ zoomLevel: NSNumber) {
        _mAMapView.setZoomLevel(CGFloat(truncating: zoomLevel), animated: true)
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

    /// 获取当前缩放等级
    func getCurrentZoomLevel(_ result: FlutterResult) {
        result(_mAMapView.zoomLevel)
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
}

extension AMapView: MAMapViewDelegate {
}
