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

    /// 初始化后是否自动定位
    private var _autoLocateAfterInit: Bool

    /// 地图图层类型
    private var _mapType: String

    /// 是否显示实时路况
    private var _showTraffic: Bool

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

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
        _view = UIView()
        let params = args as! NSDictionary
        _autoLocateAfterInit = params["autoLocateAfterInit"] as! Bool
        _mapType = params["mapType"] as! String
        _showTraffic = params["showTraffic"] as! Bool
        _showCompass = params["showCompass"] as! Bool
        _showScaleControl = params["showScaleControl"] as! Bool
        _showIndoorMap = params["showIndoorMap"] as! Bool
        _showIndoorMapControl = params["showIndoorMapControl"] as! Bool
        _zoomGestureEnable = params["zoomGestureEnable"] as! Bool
        _rotateGestureEnable = params["rotateGestureEnable"] as! Bool
        _scrollGestureEnable = params["scrollGestureEnable"] as! Bool
        _tiltGestureEnable = params["tiltGestureEnable"] as! Bool
        _logoMargin = params["logoMargin"] as? NSDictionary
        _compassMargin = params["compassMargin"] as? NSDictionary
        _scaleMargin = params["scaleMargin"] as? NSDictionary
        super.init()
        createAMapView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    private func createAMapView(view _view: UIView) {
        _view.backgroundColor = UIColor.white
        let mAMapView = MAMapView(frame: _view.bounds)
        configAMapView(mAMapView)
        _view.addSubview(mAMapView)
    }

    /// 配置地图组件
    ///
    /// - Parameter mapView: 地图组件
    private func configAMapView(_ mapView: MAMapView) {
        mapView.delegate = self

        mapView.showsUserLocation = _autoLocateAfterInit
        if _autoLocateAfterInit {
            mapView.setUserTrackingMode(.follow, animated: true)
        }

        mapView.mapType = getMapType(_mapType)
        mapView.isShowTraffic = _showTraffic
        mapView.showsCompass = _showCompass
        mapView.showsScale = _showScaleControl
        mapView.isShowsIndoorMap = _showIndoorMap
        if _showIndoorMap {
            mapView.isShowsIndoorMapControl = _showIndoorMapControl
        } else {
            mapView.isShowsIndoorMapControl = false
        }

        mapView.isZoomEnabled = _zoomGestureEnable
        mapView.isScrollEnabled = _scrollGestureEnable
        mapView.isRotateEnabled = _rotateGestureEnable
        mapView.isRotateCameraEnabled = _tiltGestureEnable

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
            mapView.compassOrigin = CGPoint(x: mapView.compassOrigin.x - CGFloat(marginRight), y: mapView.compassOrigin.y + CGFloat(marginTop))
        }

        if _scaleMargin != nil {
            let marginLeft = _scaleMargin!["marginLeft"] as! Double
            let marginBottom = _scaleMargin!["marginBottom"] as! Double
            mapView.scaleOrigin = CGPoint(x: mapView.scaleOrigin.x + CGFloat(marginLeft), y: mapView.scaleOrigin.y - CGFloat(marginBottom))
        }
    }

    /// 获取地图图层类型
    ///
    /// - Parameter type: 类型名称
    ///
    /// - Returns: 类型
    private func getMapType(_ type: String) -> MAMapType {
        switch type {
        case "NORMAL":
            return .standard
        case "NIGHT":
            return .standardNight
        case "NAVI":
            return .navi
        case "BUS":
            return .bus
        case "SATELLITE":
            return .satellite
        default:
            return .standard
        }
    }
}

extension AMapView: MAMapViewDelegate {
}
