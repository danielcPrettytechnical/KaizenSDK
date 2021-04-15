
Pod::Spec.new do |s|
  s.name             = 'KaizenSDK'
  s.version          = '0.0.3'
  s.summary          = 'KaizenSDK is a software development kit (SDK) for iOS gaming apps'


  s.description      = <<-DESC
                            KaizenSDK 
                       DESC

  s.homepage         = 'https://github.com/danielcPrettytechnical/KaizenSDKTest.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pretty Technical' => 'https://github.com/danielcPrettytechnical/KaizenSDKTest.git' }
  s.source           = { :git => 'https://github.com/danielcPrettytechnical/KaizenSDKTest.git',  :tag => "0.0.1" }
  s.ios.deployment_target = '10.0'
  s.ios.vendored_frameworks = 'KaizenSDK.xcframework'
  s.swift_version = "5" 
  s.dependency 'SwiftyBeaver'
  s.dependency 'Alamofire'
end
