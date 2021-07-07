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

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
        _view = UIView()
        super.init()
        createAMapView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createAMapView(view _view: UIView) {
        _view.backgroundColor = UIColor.white
        let mAMapView = MAMapView(frame: _view.bounds)
        mAMapView.delegate = self
        mAMapView.showsUserLocation = true
        mAMapView.userTrackingMode = .follow
        _view.addSubview(mAMapView)
    }
}

extension AMapView: MAMapViewDelegate {
}
