#
#  Be sure to run `pod spec lint JPushApiManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "JPushApiManager"
  s.version      = "3.1.2"
  s.summary      = "组件化方式管理极光推送代码"
  s.description  = <<-DESC
                    组件化方式管理极光推送代码，以方便代码中一处修改全局生效
                   DESC

  s.homepage     = "https://github.com/XFNicar/JPushApiManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "XieFei" => "xuejingwen25@163.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/XFNicar/JPushApiManager.git", :tag => "#{s.version}" }
  s.source_files  = "Classes/*.{h,m}"
  s.requires_arc = true
  s.ios.vendored_libraries = 'libs/*.a'

end
