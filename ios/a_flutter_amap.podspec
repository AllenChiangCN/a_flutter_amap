#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint a_flutter_amap.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'a_flutter_amap'
  s.version          = '0.0.1'
  s.summary          = 'Amap for flutter'
  s.description      = <<-DESC
Amap for flutter
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.static_framework = true
  s.dependency 'Flutter'
  s.dependency 'AMap3DMap', '7.9.0'
  s.dependency 'AMapSearch', '7.9.0'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
