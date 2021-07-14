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

    /**
     * 初始化后是否自动定位
     */
    private var _autoLocateAfterInit: Bool

    /**
     * 是否显示指南针
     */
    private var _showCompass: Bool

    /**
     * 是否显示比例尺控件
     */
    private var _showScaleControl: Bool

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
        _view = UIView()
        let params = args as! NSDictionary
        _autoLocateAfterInit = params["autoLocateAfterInit"] as! Bool
        _showCompass = params["showCompass"] as! Bool
        _showScaleControl = params["showScaleControl"] as! Bool
        super.init()
        createAMapView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    private func createAMapView(view _view: UIView) {
        _view.backgroundColor = UIColor.white
        let mAMapView = MAMapView(frame: _view.bounds)
        initAMapView(mAMapView)
        _view.addSubview(mAMapView)
    }

    private func initAMapView(_ mapView: MAMapView) {
        mapView.delegate = self

        mapView.showsUserLocation = _autoLocateAfterInit
        if _autoLocateAfterInit {
            mapView.userTrackingMode = .follow
        }

        mapView.showsCompass = _showCompass

        mapView.showsScale = _showScaleControl
    }
}

extension AMapView: MAMapViewDelegate {
}
