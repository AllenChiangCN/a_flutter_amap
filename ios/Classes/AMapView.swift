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

    /// 是否显示指南针
    private var _showCompass: Bool

    /// 是否显示比例尺控件
    private var _showScaleControl: Bool
    
    /// 缩放手势是否可用
    private var _zoomGestureEnable: Bool
    
    /// 旋转手势是否可用
    private var _rotateGestureEnable: Bool
    
    /// 拖拽手势是否可用
    private var _scrollGestureEnable: Bool
    
    /// 倾斜手势是否可用
    private var _tiltGestureEnable: Bool

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
        _view = UIView()
        let params = args as! NSDictionary
        _autoLocateAfterInit = params["autoLocateAfterInit"] as! Bool
        _showCompass = params["showCompass"] as! Bool
        _showScaleControl = params["showScaleControl"] as! Bool
        _zoomGestureEnable = params["zoomGestureEnable"] as! Bool
        _rotateGestureEnable = params["rotateGestureEnable"] as! Bool
        _scrollGestureEnable = params["scrollGestureEnable"] as! Bool
        _tiltGestureEnable = params["tiltGestureEnable"] as! Bool
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
    /// - Parameter mapView: 地图组件
    private func configAMapView(_ mapView: MAMapView) {
        mapView.delegate = self

        mapView.showsUserLocation = _autoLocateAfterInit
        if _autoLocateAfterInit {
            mapView.setUserTrackingMode(.follow, animated: true)
        }

        mapView.showsCompass = _showCompass

        mapView.showsScale = _showScaleControl
        
        mapView.isZoomEnabled = _zoomGestureEnable
        mapView.isScrollEnabled = _scrollGestureEnable
        mapView.isRotateEnabled = _rotateGestureEnable
        mapView.isRotateCameraEnabled = _tiltGestureEnable
    }
}

extension AMapView: MAMapViewDelegate {
}
