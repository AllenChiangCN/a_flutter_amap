# a_flutter_amap

高德地图Flutter插件

- Android
  - 自行添加并管理相关权限
  - 在AndroidManifest.xml添加meta-data，声明高德apikey

- iOS
  - 自行添加并管理相关权限
  - 在AppDelegate.swift的application(_,didFinishLaunchingWithOptions)方法中添加:
    ```swift
    AMapServices.shared().apiKey = "your apiKey"
    ```

- TODO:
  - [ ] iOS Logo位置属性

## 错误码
| 错误码 | 描述 |
| --- | --- |
| 1001 | 地图截屏Bitmap为空 |
| 1002 | 地图截屏保存失败 |
| 1003 | 地图截屏失败 |
| 2001 | 添加Marker失败 |
