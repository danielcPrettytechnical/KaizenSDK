
Pod::Spec.new do |s|
  s.name             = 'KaizenSDK'
  s.version          = '1.0.2'
  s.summary          = 'A software development kit (SDK) for iOS gaming apps'
  s.description      = '<<-DESC A software development kit (SDK) for iOS gaming apps that implements the platform’s main features: login, sign up, get the game list and launch games. 
  The SDK simplifies the development of new gaming apps and manages all the backend connections.
                       DESC'

  s.homepage         = 'https://gitlab.com/prettytechnical/kaizen/ios-sdk.git'
  # s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pretty Technical' => 'https://gitlab.com/prettytechnical/kaizen/ios-sdk.git' }
  s.source           =  { :path => '.' }

  s.ios.deployment_target = '12.0'

  s.source_files = ['KaizenSDK/**/*.{h,m,swift,xib,storyboard, xcassets}']
  s.dependency 'Alamofire'
  s.dependency 'FloatingPanel', '2.2.0'
  s.swift_version = "5" 
  s.exclude_files = [ './Pods', './Podfile', './Podfile.lock', 'KaizenSDK/**/*.plist' ]
  s.resources = ['KaizenSDK/icons.xcassets']
end
