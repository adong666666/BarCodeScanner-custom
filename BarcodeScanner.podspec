Pod::Spec.new do |s|
  s.name             = "BarcodeScanner-custom"
  s.summary          = "Simple and beautiful barcode scanner."
  s.version          = "5.1.4"
  s.homepage         = "https://github.com/adong666666/BarCodeScanner-custom.git"
  s.license          = 'MIT'
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = {
    :git => "https://github.com/adong666666/BarCodeScanner-custom.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.platform = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  s.resource_bundles = {
    'BarcodeScanner' => ['Images/*.{png}'],
    'Localization' => ['Localization/*.lproj/Localizable.strings']
  }

  s.frameworks = 'UIKit', 'AVFoundation'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.1' }
end
