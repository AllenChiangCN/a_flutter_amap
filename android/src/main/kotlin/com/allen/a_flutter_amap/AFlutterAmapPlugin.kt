package com.allen.a_flutter_amap

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AFlutterAmapPlugin */
class AFlutterAmapPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var _activity: FlutterActivity

    private lateinit var _flutterPluginBinding: FlutterPlugin.FlutterPluginBinding

    private lateinit var _channel: MethodChannel

    private lateinit var _aMapViewFactory: AMapViewFactory

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        this._flutterPluginBinding = flutterPluginBinding
        _channel = MethodChannel(flutterPluginBinding.binaryMessenger, "a_flutter_amap")
        _channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        _channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "setZoomLevel" -> _aMapViewFactory.aMapView.setZoomLevel(call.arguments as Double)
            "getZoomLevel" -> _aMapViewFactory.aMapView.getZoomLevel(result)
            "zoomIn" -> _aMapViewFactory.aMapView.zoomIn()
            "zoomOut" -> _aMapViewFactory.aMapView.zoomOut()
            "setMaxZoomLevel" -> _aMapViewFactory.aMapView.setMaxZoomLevel(call.arguments as Double)
            "setMinZoomLevel" -> _aMapViewFactory.aMapView.setMinZoomLevel(call.arguments as Double)
            "getMaxZoomLevel" -> _aMapViewFactory.aMapView.getMaxZoomLevel(result)
            "getMinZoomLevel" -> _aMapViewFactory.aMapView.getMinZoomLevel(result)
            "setMapType" -> _aMapViewFactory.aMapView.setMapType(call.arguments as String)
            "getMapType" -> _aMapViewFactory.aMapView.getMapType(result)
            "turnOnTraffic" -> _aMapViewFactory.aMapView.turnOnTraffic(call.arguments as Boolean)
            "isTrafficOn" -> _aMapViewFactory.aMapView.isTrafficOn(result)
            "turnOnBuildings" -> _aMapViewFactory.aMapView.turnOnBuildings(call.arguments as Boolean)
            "isBuildingsOn" -> _aMapViewFactory.aMapView.isBuildingsOn(result)
            "turnOnMapText" -> _aMapViewFactory.aMapView.turnOnMapText(call.arguments as Boolean)
            else -> result.notImplemented()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        _activity = binding.activity as FlutterActivity
        _aMapViewFactory = AMapViewFactory(_activity)
        _flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "AMapView",
            _aMapViewFactory
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

    }

    override fun onDetachedFromActivity() {

    }
}
