package com.allen.a_flutter_amap

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.util.Log
import android.view.View
import androidx.core.app.ActivityCompat
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import com.amap.api.maps.AMap
import com.amap.api.maps.MapView
import com.amap.api.maps.model.MyLocationStyle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.platform.PlatformView

class AMapView(
    context: Context,
    val activity: FlutterActivity,
    id: Int,
    creationParams: Map<String, Any?>?
) :
    PlatformView,
    DefaultLifecycleObserver {
    companion object {
        const val PERMISSION_REQUEST_CODE = 0x00000001
    }

    private var mMapView: MapView = MapView(context)

    private var mAMap: AMap = mMapView.map

    init {
        activity.lifecycle.addObserver(this)

        when (ActivityCompat.checkSelfPermission(
            activity,
            Manifest.permission.ACCESS_FINE_LOCATION
        )) {
            PackageManager.PERMISSION_DENIED -> {
                Log.e("AMapView", "Permission denied")
                if (activity.shouldShowRequestPermissionRationale(Manifest.permission.ACCESS_FINE_LOCATION)) {
                    Log.e("AMapView", "We should be access to fine location")
                } else {
                    ActivityCompat.requestPermissions(
                        activity,
                        arrayOf(Manifest.permission.ACCESS_FINE_LOCATION),
                        PERMISSION_REQUEST_CODE
                    )
                }
            }
            PackageManager.PERMISSION_GRANTED -> {
//                activity.requestPermissions()
                Log.d("AMapView", "Permission granted")
            }
        }
    }

    override fun getView(): View {
        return mMapView
    }

    override fun dispose() {
        activity.lifecycle.removeObserver(this)
    }

    override fun onCreate(owner: LifecycleOwner) {
        Log.d("AMapView", "onCreate")
        mMapView.onCreate(null)

        val locationStyle = MyLocationStyle().apply {
            myLocationType(MyLocationStyle.LOCATION_TYPE_LOCATION_ROTATE)
            showMyLocation(true)
        }
        mAMap.let {
            it.myLocationStyle = locationStyle
            it.isMyLocationEnabled = true
        }
    }

    override fun onStart(owner: LifecycleOwner) {
    }

    override fun onResume(owner: LifecycleOwner) {
        mMapView.onResume()
    }

    override fun onPause(owner: LifecycleOwner) {
        mMapView.onPause()
    }

    override fun onStop(owner: LifecycleOwner) {
    }

    override fun onDestroy(owner: LifecycleOwner) {
        mMapView.onDestroy()
    }
}