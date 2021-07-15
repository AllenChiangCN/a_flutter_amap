package com.allen.a_flutter_amap

import android.content.Context
import android.view.View
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import com.amap.api.maps.AMap
import com.amap.api.maps.AMapOptions
import com.amap.api.maps.MapView
import com.amap.api.maps.UiSettings
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
    DefaultLifecycleObserver {
    companion object {
        const val PERMISSION_REQUEST_CODE = 0x00000001
    }

    private var _mapView: MapView = MapView(context)

    private var _aMap: AMap = _mapView.map

    private var _uiSettings: UiSettings = _aMap.uiSettings

    /**
     * 初始化后是否自动定位
     */
    private var _autoLocateAfterInit: Boolean = creationParams["autoLocateAfterInit"] as Boolean

    /**
     * 地图图层类型
     */
    private var _mapType: String = creationParams["mapType"] as String

    /**
     * 底图语言
     */
    private var _mapLanguage: String = creationParams["mapLanguage"] as String

    /**
     * 定位类型
     */
    private var _locationType: String = creationParams["locationType"] as String

    /**
     * 定位间隔，仅定位类型为连续定位时有效，单位毫秒
     */
    private var _locationInterval: Int = creationParams["locationInterval"] as Int

    /**
     * 是否显示实时路况
     */
    private var _showTraffic: Boolean = creationParams["showTraffic"] as Boolean

    /**
     * 是否显示楼块
     */
    private var _showBuildings: Boolean = creationParams["showBuildings"] as Boolean

    /**
     * 是否显示底图文字标注
     */
    private var _showMapText: Boolean = creationParams["showMapText"] as Boolean

    /**
     * 是否显示缩放控件
     */
    private var _showZoomControl: Boolean = creationParams["showZoomControl"] as Boolean

    /**
     * 是否显示指南针
     */
    private var _showCompass: Boolean = creationParams["showCompass"] as Boolean

    /**
     * 是否显示定位按钮
     */
    private var _showLocationButton: Boolean = creationParams["showLocationButton"] as Boolean

    /**
     * 是否显示比例尺控件
     */
    private var _showScaleControl: Boolean = creationParams["showScaleControl"] as Boolean

    /**
     * 是否显示室内地图
     */
    private var _showIndoorMap: Boolean = creationParams["showIndoorMap"] as Boolean

    /**
     * 是否显示室内地图控件
     */
    private var _showIndoorMapControl: Boolean = creationParams["showIndoorMapControl"] as Boolean

    /**
     * 所有手势是否可用
     */
    private var _allGestureEnable: Boolean? = creationParams["allGestureEnable"] as Boolean?

    /**
     * 缩放手势是否可用
     */
    private var _zoomGestureEnable: Boolean = creationParams["zoomGestureEnable"] as Boolean

    /**
     * 旋转手势是否可用
     */
    private var _rotateGestureEnable: Boolean = creationParams["rotateGestureEnable"] as Boolean

    /**
     * 拖拽手势是否可用
     */
    private var _scrollGestureEnable: Boolean = creationParams["scrollGestureEnable"] as Boolean

    /**
     * 倾斜手势是否可用
     */
    private var _tiltGestureEnable: Boolean = creationParams["tiltGestureEnable"] as Boolean

    /**
     * 是否以地图中心点缩放
     */
    private var _isGestureScaleByMapCenter: Boolean =
        creationParams["isGestureScaleByMapCenter"] as Boolean

    /**
     * 缩放控件位置
     */
    private var _zoomPosition: String = creationParams["zoomPosition"] as String

    /**
     * Logo位置
     */
    private var _logoPosition: String = creationParams["logoPosition"] as String

    /**
     * Logo左下边距
     *
     * marginLeft: 左边距
     *
     * marginBottom: 下边距
     */
    private var _logoMargin: HashMap<String, Any>? =
        creationParams["logoMargin"] as HashMap<String, Any>?

    init {
        activity.lifecycle.addObserver(this)
    }

    private fun initAMapView() {
        val locationStyle = MyLocationStyle().apply {
            myLocationType(getLocationType(_locationType))
            interval(_locationInterval.toLong())
            showMyLocation(true)
        }
        _aMap.myLocationStyle = locationStyle

        if (_autoLocateAfterInit) {
            _aMap.isMyLocationEnabled = true
        }

        setMapType(_mapType)
        _aMap.setMapLanguage(if (_mapLanguage == "CHINESE") AMap.CHINESE else AMap.ENGLISH)
        _aMap.isTrafficEnabled = _showTraffic
        _aMap.showBuildings(_showBuildings)
        _aMap.showMapText(_showMapText)
        showZoomControl(_showZoomControl)
        _uiSettings.isCompassEnabled = _showCompass
        _uiSettings.isMyLocationButtonEnabled = _showLocationButton
        _uiSettings.isScaleControlsEnabled = _showScaleControl
        showIndoorMap(_showIndoorMap)
        _uiSettings.isGestureScaleByMapCenter = _isGestureScaleByMapCenter
        enableAllGesture(_allGestureEnable)
        if (_logoMargin != null) {
            _uiSettings.setLogoLeftMargin((_logoMargin!!["marginLeft"] as Double).toInt())
            _uiSettings.setLogoBottomMargin((_logoMargin!!["marginBottom"] as Double).toInt())
        } else {
            setLogoPosition(_logoPosition)
        }
    }

    /**
     * 设置地图图层类型
     *
     * @param type 图层类型名称
     */
    private fun setMapType(type: String) {
        when (type) {
            "NORMAL" -> _aMap.mapType = AMap.MAP_TYPE_NORMAL
            "NIGHT" -> _aMap.mapType = AMap.MAP_TYPE_NIGHT
            "NAVI" -> _aMap.mapType = AMap.MAP_TYPE_NAVI
            "BUS" -> _aMap.mapType = AMap.MAP_TYPE_BUS
            "SATELLITE" -> _aMap.mapType = AMap.MAP_TYPE_SATELLITE
            else -> _aMap.mapType = AMap.MAP_TYPE_NORMAL
        }
    }

    /**
     * 获取定位类型常量
     *
     * @param type 定位类型名称
     */
    private fun getLocationType(type: String): Int {
        return when (type) {
            "SHOW" -> MyLocationStyle.LOCATION_TYPE_SHOW
            "LOCATE" -> MyLocationStyle.LOCATION_TYPE_LOCATE
            "FOLLOW" -> MyLocationStyle.LOCATION_TYPE_FOLLOW
            "MAP_ROTATE" -> MyLocationStyle.LOCATION_TYPE_MAP_ROTATE
            "LOCATION_ROTATE" -> MyLocationStyle.LOCATION_TYPE_LOCATION_ROTATE
            "LOCATION_ROTATE_NO_CENTER" -> MyLocationStyle.LOCATION_TYPE_LOCATION_ROTATE_NO_CENTER
            "FOLLOW_NO_CENTER" -> MyLocationStyle.LOCATION_TYPE_FOLLOW_NO_CENTER
            "MAP_ROTATE_NO_CENTER" -> MyLocationStyle.LOCATION_TYPE_MAP_ROTATE_NO_CENTER
            else -> MyLocationStyle.LOCATION_TYPE_LOCATE
        }
    }

    /**
     * 是否显示缩放按钮
     *
     * @param show 是否显示
     */
    private fun showZoomControl(show: Boolean) {
        _uiSettings.isZoomControlsEnabled = show

        if (show) {
            setZoomPosition(_zoomPosition)
        }
    }

    /**
     * 是否显示室内地图
     *
     * @param show 是否显示
     */
    private fun showIndoorMap(show: Boolean) {
        _aMap.showIndoorMap(show)
        if (show) {
            _uiSettings.isIndoorSwitchEnabled = _showIndoorMapControl
        } else {
            _uiSettings.isIndoorSwitchEnabled = false
        }
    }

    /**
     * 所有手势是否可用
     */
    private fun enableAllGesture(enable: Boolean?) {
        when (enable) {
            true -> {
                _uiSettings.setAllGesturesEnabled(true)
                enableZoomGesture(_zoomGestureEnable)
                enableRotateGesture(_rotateGestureEnable)
                enableScrollGesture(_scrollGestureEnable)
                enableTiltGesture(_tiltGestureEnable)
            }
            false -> {
                _uiSettings.setAllGesturesEnabled(false)
            }
            else -> {
                enableZoomGesture(_zoomGestureEnable)
                enableRotateGesture(_rotateGestureEnable)
                enableScrollGesture(_scrollGestureEnable)
                enableTiltGesture(_tiltGestureEnable)
            }
        }
    }

    /**
     * 缩放手势是否可用
     */
    private fun enableZoomGesture(enable: Boolean) {
        _uiSettings.isZoomGesturesEnabled = enable
    }

    /**
     * 旋转手势是否可用
     */
    private fun enableRotateGesture(enable: Boolean) {
        _uiSettings.isRotateGesturesEnabled = enable
    }

    /**
     * 拖拽手势是否可用
     */
    private fun enableScrollGesture(enable: Boolean) {
        _uiSettings.isScrollGesturesEnabled = enable
    }

    /**
     * 倾斜手势是否可用
     */
    private fun enableTiltGesture(enable: Boolean) {
        _uiSettings.isTiltGesturesEnabled = enable
    }

    /**
     * 设置缩放控件位置
     */
    private fun setZoomPosition(position: String) {
        when (position) {
            "RIGHT_BOTTOM" ->
                _uiSettings.zoomPosition = AMapOptions.ZOOM_POSITION_RIGHT_BUTTOM
            "RIGHT_CENTER" ->
                _uiSettings.zoomPosition = AMapOptions.ZOOM_POSITION_RIGHT_CENTER
            else -> _uiSettings.zoomPosition = AMapOptions.ZOOM_POSITION_RIGHT_BUTTOM
        }
    }

    /**
     * 设置Logo位置
     */
    private fun setLogoPosition(position: String) {
        when (position) {
            "BOTTOM_LEFT" ->
                _uiSettings.logoPosition = AMapOptions.LOGO_POSITION_BOTTOM_LEFT
            "BOTTOM_RIGHT" ->
                _uiSettings.logoPosition = AMapOptions.LOGO_POSITION_BOTTOM_RIGHT
            "BOTTOM_CENTER" ->
                _uiSettings.logoPosition = AMapOptions.LOGO_POSITION_BOTTOM_CENTER
            else ->
                _uiSettings.logoPosition = AMapOptions.LOGO_POSITION_BOTTOM_LEFT
        }
    }

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
}
