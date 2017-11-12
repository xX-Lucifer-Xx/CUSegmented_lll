#
#  Be sure to run `pod spec lint CUSegmented.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CUSegmented"
  s.version      = "0.1.1"
  s.summary      = "CUSegmented - custom segmented control for iOS."
  s.description  = <<-DESC CUSegmented - custom segmented control for iOS.
                   DESC

  s.homepage     = "http://i-dev.top"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Alexander Ruduk" => "alakai.1998.28@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "hhttps://github.com/Viher-Sano/CUSegmented.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "CUSegmented/Classes/**/*.{swift}"

  # s.public_header_files = "CUSegmented/Classes/**/*.h"

  s.requires_arc = true

end
