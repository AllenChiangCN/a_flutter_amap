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
            "zoomIn" -> _aMapViewFactory.aMapView.zoomIn()
            "zoomOut" -> _aMapViewFactory.aMapView.zoomOut()
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
