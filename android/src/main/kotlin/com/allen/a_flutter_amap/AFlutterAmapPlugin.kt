package com.allen.a_flutter_amap

import android.Manifest
import android.content.pm.PackageManager
import android.util.Log
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
    private lateinit var mActivity: FlutterActivity

    private lateinit var mFlutterPluginBinding: FlutterPlugin.FlutterPluginBinding

    private lateinit var mChannel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        mFlutterPluginBinding = flutterPluginBinding
        mChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "a_flutter_amap")
        mChannel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        mChannel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        mActivity = binding.activity as FlutterActivity
        mFlutterPluginBinding.platformViewRegistry.registerViewFactory(
            "AMapView",
            AMapViewFactory(mActivity)
        )
        binding.addRequestPermissionsResultListener { requestCode, permissions, grantResults ->
            if (requestCode == AMapView.PERMISSION_REQUEST_CODE) {
                if (permissions.size == 1 && permissions[0] == Manifest.permission.ACCESS_FINE_LOCATION &&
                    grantResults.size == 1 && grantResults[0] == PackageManager.PERMISSION_GRANTED
                ) {
                    Log.d("AMapView", "Permission granted")
                } else {
                    Log.d("AMapView", "Permission denied still")
                }
            }
            true
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

    }

    override fun onDetachedFromActivity() {

    }
}
