
Pod::Spec.new do |s|
  s.name             = 'KaizenSDK'
  s.version          = '1.0.5'
  s.summary          = 'KaizenSDK is a software development kit (SDK) for iOS gaming apps'


  s.description      = <<-DESC
                            KaizenSDK 
                       DESC

  s.homepage         = 'https://github.com/danielcPrettytechnical/KaizenSDKTest.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pretty Technical' => 'https://github.com/danielcPrettytechnical/KaizenSDKTest.git' }
  s.source           = { :git => 'https://github.com/danielcPrettytechnical/KaizenSDKTest.git',  :tag => "1.0.4" }
  s.ios.deployment_target = '13.0'
  s.ios.vendored_frameworks = 'KaizenSDK.xcframework'
  s.swift_version = "5.5.2" 
  s.dependency 'Alamofire'
  s.dependency 'FloatingPanel'
end
