Pod::Spec.new do |s|
  s.name             = "PayPalHereSDKv2"
  s.version          = "2.0.0.201805"
  s.summary          = "SDK for interfacing with PayPal card readers and mobile payment processing APIs."
  s.license          = { :type => 'COMMERCIAL', :file => 'LICENSE.md' }
  s.authors          = {"PayPal"=>"DL-PP-RetailSDK@paypal.com"}
  s.homepage         = "https://developer.paypal.com/docs/integration/paypal-here/ios-dev/overview/"
  s.description      = "The PayPal Here SDK v2 for iOS provides access to a group of PayPal transaction services which contain an extensive set of point-of-sale functions for merchants."
  s.source           = { :git => 'https://github.com/PayPal-Mobile/ios-here-sdk-dist.git', :tag => "v#{s.version}" }

  s.requires_arc = true
  s.ios.deployment_target    = '8.1'

  s.xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited)',
    'OTHER_LDFLAGS' => '-weak_library /usr/lib/libstdc++.dylib -lstdc++ -ObjC',
  }

  s.ios.frameworks = 'AudioToolbox', 'MobileCoreServices', 'Security', 'CFNetwork', 'AVFoundation', 'ExternalAccessory', 'MediaPlayer', 'CoreTelephony', 'Foundation', 'CoreBluetooth', 'SystemConfiguration', 'JavaScriptCore', 'CoreBluetooth', 'UIKit', 'CoreLocation'

  s.default_subspec = 'Debug'

  s.subspec 'Debug' do |sp|
    sp.vendored_frameworks      = 'RSDK/Debug/PayPalRetailSDK.framework', 'frameworks/PPHSwiper.framework', 'frameworks/PPHR_BLE.framework', 'frameworks/PPHSDK_BLE.framework'
    sp.ios.resource             = 'RSDK/Debug/PayPalRetailSDK.framework/Versions/A/Resources/**/*'
  end

  s.subspec 'Release' do |sp|
    sp.vendored_frameworks      = 'RSDK/Release/PayPalRetailSDK.framework', 'frameworks/PPHSwiper.framework', 'frameworks/PPHR_BLE.framework', 'frameworks/PPHSDK_BLE.framework'
    sp.ios.resource             = 'RSDK/Release/PayPalRetailSDK.framework/Versions/A/Resources/**/*'
  end

  s.dependency 'SimpleKeychain', '~> 0.6.1'

end