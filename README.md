# a_flutter_amap

高德地图Flutter插件

- Android
  - 自行添加并管理相关权限
  - 在AndroidManifest.xml添加meta-data，声明高德apikey

- iOS
  - 自行添加并管理相关权限
  - 在AppDelegate.swift的application(_,didFinishLaunchingWithOptions)方法中添加:
    ```aidl
    AMapServices.shared().apiKey = "your apiKey"
    ```

- TODO:
    - [ ] Android定位按钮功能
