package com.allen.a_flutter_amap

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.view.View
import androidx.core.app.ActivityCompat
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import com.amap.api.maps.*
import com.amap.api.maps.model.MyLocationStyle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.platform.PlatformView

class AMapView(
    context: Context,
    val activity: FlutterActivity,
    id: Int,
    creationParams: Map<String, Any?>
) :
    PlatformView,
    DefaultLifecycleObserver,
    LocationSource {
    companion object {
        const val PERMISSION_REQUEST_CODE = 0x00000001
    }

    private var _mapView: MapView = MapView(context)

    private var _aMap: AMap = _mapView.map

    private var _uiSettings: UiSettings = _aMap.uiSettings

    /**
     * 初始化后是否自动定位
     */
    private var _autoLocateAfterInit: Boolean = false

    /**
     * 是否显示缩放控件
     */
    private var _showZoomControl: Boolean = false

    /**
     * 是否显示指南针
     */
    private var _showCompass: Boolean = false

    /**
     * 是否显示定位按钮
     */
    private var _showLocationButton: Boolean = false

    /**
     * 是否显示比例尺控件
     */
    private var _showScaleControl: Boolean = false

    /**
     * Logo位置
     */
    private var _logoPosition: String = ""

    init {
        _autoLocateAfterInit = creationParams["autoLocateAfterInit"] as Boolean
        _showZoomControl = creationParams["showZoomControl"] as Boolean
        _showCompass = creationParams["showCompass"] as Boolean
        _showLocationButton = creationParams["showLocationButton"] as Boolean
        _showScaleControl = creationParams["showScaleControl"] as Boolean
        _logoPosition = creationParams["logoPosition"] as String

        activity.lifecycle.addObserver(this)
    }

    private fun initAMapView() {
        val locationStyle = MyLocationStyle().apply {
            myLocationType(MyLocationStyle.LOCATION_TYPE_LOCATION_ROTATE)
            showMyLocation(true)
        }
        _aMap.myLocationStyle = locationStyle

        if (_autoLocateAfterInit) {
            _aMap.isMyLocationEnabled = true
//            if (haveLocationPermission()) {
//                _aMap.isMyLocationEnabled = true
//            } else {
//                throw Exception("定位权限未授予")
//            }
        }

        showZoomControl(_showZoomControl)
        showCompass(_showCompass)
        showLocationButton(_showLocationButton)
        showScaleControl(_showScaleControl)
        setLogoPosition(_logoPosition)
    }

    /**
     * 是否有定位权限
     */
    private fun haveLocationPermission(): Boolean {
        return ActivityCompat.checkSelfPermission(
            activity,
            Manifest.permission.ACCESS_FINE_LOCATION
        ) == PackageManager.PERMISSION_GRANTED
    }

    /**
     * 是否显示缩放按钮
     *
     * @param show 是否显示
     */
    private fun showZoomControl(show: Boolean) {
        _uiSettings.isZoomControlsEnabled = show
    }

    /**
     * 是否显示指南针
     *
     * @param show 是否显示
     */
    private fun showCompass(show: Boolean) {
        _uiSettings.isCompassEnabled = show
    }

    /**
     * 是否显示定位按钮
     *
     * @param show 是否显示
     */
    private fun showLocationButton(show: Boolean) {
        if (show) {
            _aMap.setLocationSource(this)
            _uiSettings.isMyLocationButtonEnabled = true
            _aMap.isMyLocationEnabled = true
//            _aMap.setOnMyLocationChangeListener(LocationChangeListener)
//            _aMap.setOnMyLocationChangeListener {
//                _aMap.animateCamera(
//                    CameraUpdateFactory.newLatLng(
//                        LatLng(
//                            it.latitude,
//                            it.longitude
//                        )
//                    )
//                )
//            }
//            if (haveLocationPermission() && _autoLocateAfterInit.not()) {
//                _aMap.isMyLocationEnabled = true
//            } else {
//                throw Exception("定位权限未授予")
//            }
        } else {
            _uiSettings.isMyLocationButtonEnabled = false
//            _aMap.removeOnMyLocationChangeListener(LocationChangeListener)
        }
    }

    /**
     * 是否显示比例尺控件
     *
     * @param show 是否显示
     */
    private fun showScaleControl(show: Boolean) {
        _uiSettings.isScaleControlsEnabled = show
    }

    private fun setLogoPosition(position: String) {
        when (position) {
            "BOTTOM_LEFT" -> {
                _uiSettings.logoPosition = AMapOptions.LOGO_POSITION_BOTTOM_LEFT
            }
            "BOTTOM_RIGHT" -> {
                _uiSettings.logoPosition = AMapOptions.LOGO_POSITION_BOTTOM_RIGHT
            }
            "BOTTOM_CENTER" -> {
                _uiSettings.logoPosition = AMapOptions.LOGO_POSITION_BOTTOM_CENTER
            }
            "MARGIN_LEFT" -> {
                _uiSettings.logoPosition = AMapOptions.LOGO_MARGIN_LEFT
            }
            "MARGIN_RIGHT" -> {
                _uiSettings.logoPosition = AMapOptions.LOGO_MARGIN_RIGHT
            }
            "MARGIN_BOTTOM" -> {
                _uiSettings.logoPosition = AMapOptions.LOGO_MARGIN_BOTTOM
            }
        }
    }

//    private object LocationChangeListener : AMap.OnMyLocationChangeListener {
//        override fun onMyLocationChange(location: Location?) {
//
//        }
//    }

    override fun getView(): View {
        return _mapView
    }

    override fun dispose() {
        activity.lifecycle.removeObserver(this)
    }

    override fun onCreate(owner: LifecycleOwner) {
        _mapView.onCreate(null)

        initAMapView()
    }

    override fun onStart(owner: LifecycleOwner) {
    }

    override fun onResume(owner: LifecycleOwner) {
        _mapView.onResume()
    }

    override fun onPause(owner: LifecycleOwner) {
        _mapView.onPause()
    }

    override fun onStop(owner: LifecycleOwner) {
    }

    override fun onDestroy(owner: LifecycleOwner) {
        _mapView.onDestroy()
    }

    override fun activate(listener: LocationSource.OnLocationChangedListener?) {

    }

    override fun deactivate() {

    }
}