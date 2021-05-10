
Pod::Spec.new do |s|
  s.name             = 'KaizenSDK'
  s.version          = '0.0.5'
  s.summary          = 'A software development kit (SDK) for iOS gaming apps'
  s.description      = '<<-DESC A software development kit (SDK) for iOS gaming apps that implements the platform’s main features: login, sign up, get the game list and launch games. 
  The SDK simplifies the development of new gaming apps and manages all the backend connections.
                       DESC'

  s.homepage         = 'https://gitlab.com/prettytechnical/kaizen/ios-sdk.git'
  # s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pretty Technical' => 'https://gitlab.com/prettytechnical/kaizen/ios-sdk.git' }
  s.source           =  { :path => '.' }

  s.ios.deployment_target = '11.0'

  s.source_files = 'KaizenSDK/**/*'
  # s.dependency 'SwiftyBeaver'
  s.dependency 'Alamofire'
  s.swift_version = "5" 
  s.exclude_files = [ './Pods', './Podfile', './Podfile.lock', 'KaizenSDK/**/*.plist' ]
end