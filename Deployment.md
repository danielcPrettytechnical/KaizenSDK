# Deployment and Release Process for Kaizen SDK
## Prerequisites

Before you can build and deploy the KaizenSDK, make sure you have the following tools installed:

- [Xcode 13.2.1 or higher](https://developer.apple.com/xcode/)
- [Swift 5.1+](https://www.swift.org/download/)
- [CocoaPods](https://cocoapods.org/)

Note that Xcode and Swift can be installed via [Apple's developer website](https://developer.apple.com/) or using [Homebrew](https://brew.sh/).

## Build SDK

To build Kaizen SDK, follow these steps:

1. Clone the [Kaizen SDK git repository](https://gitlab.com/prettytechnical/kaizen/ios-sdk). Note that this is a private repository and you will need access to it.
2. Run the ``/deploy.sh`` script, which will build the SDK and run all unit tests.
3. If the command succeeds, an Output folder will be generated that contains the xcframework file. Copy this file to the deployment repository at [Kaizen Deployment Repo](https://github.com/danielcPrettytechnical/KaizenSDK) and push it.

## Tag Release

To tag a new release of Kaizen SDK, follow these steps:

1. Update the podspec file with the new version number.
2. Push the changes to the git repository at [Kaizen Deployment Repo](https://github.com/danielcPrettytechnical/KaizenSDK)
3. Create a tag using [semantic versioning](https://semver.org/).
4. Push the tag to the git repository. Note that this is important so that CocoaPods can recognize the latest version.
5. Publish the SDK by updating the podspec file to point to the new tag. The SDK can be installed using CocoaPods with the following line: 

`` pod 'KaizenSDK', :git => 'https://github.com/danielcPrettytechnical/KaizenSDK.git', :tag => '[LAST VERSION AVAILABLE]'.``

## Additional Information
All devlopment of Kaizen SDK are deployed to the following repository URL: [Kaizen SDK git repository](https://gitlab.com/prettytechnical/kaizen/ios-sdk)
The xcframework file is pushed to the deployment repository at [Kaizen Deployment Repo](https://github.com/danielcPrettytechnical/KaizenSDK), and CocoaPods is used as the dependency manager to install the SDK.
