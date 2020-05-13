#
#  Be sure to run `pod spec lint KBFSocketRocket.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "KBFSocketRocket"
  spec.version      = "0.2.0"
  spec.summary      = "A short description of KBFSocketRocket."
  spec.description  ="KBFSocketRocket"

  spec.homepage     = "https://github.com/kang-breakfly/KBFSocketRocket"

   spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "kang-breakfly" => "breakfly@126.com" }

  spec.source       = { :git => "https://github.com/kang-breakfly/KBFSocketRocket.git", :tag => "#{spec.version}" }

  spec.source_files  = "SocketRocket/**/*.{h,m}","SocketRocket/*.{h,m}"
  spec.public_header_files = 'SocketRocket/*.h'

  spec.requires_arc = true
  spec.ios.frameworks = 'CFNetwork', 'Security'
  spec.osx.frameworks     = 'CoreServices', 'Security'
  spec.tvos.frameworks    = 'CFNetwork', 'Security'
  spec.libraries          = 'icucore'

end
