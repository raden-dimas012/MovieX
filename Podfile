# Uncomment the next line to define a global platform for your project
platform :ios, '16.1'
source 'https://github.com/raden-dimas012/CorePodspecMovieX'
#source 'https://github.com/CocoaPods/Specs.git'
source 'https://cdn.cocoapods.org/'
# Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  workspace 'MovieX'

target 'MovieX' do
  # Pods for MovieX
  pod 'Alamofire'
  pod 'RealmSwift'
  pod 'lottie-ios', '~> 4.0.1'
  pod 'SwiftLint'
  pod 'Kingfisher'
  #pod 'Core'
  pod 'Core', :git => 'https://github.com/raden-dimas012/CoreMovieX.git'

end

target 'Common' do 
  project 'Commons/Common/Common' 
# Pods for Common
  pod 'SwiftLint'
  pod 'RealmSwift'
  #pod 'Core'
  pod 'Core', :git => 'https://github.com/raden-dimas012/CoreMovieX.git'
end

target 'MovieXUI' do 
  project 'Commons/MovieXUI/MovieXUI' 
# Pods for MovieXUI
  pod 'lottie-ios', '~> 4.0.1'
  pod 'SwiftLint'
  pod 'Kingfisher'
  #pod 'Core'
  pod 'Core', :git => 'https://github.com/raden-dimas012/CoreMovieX.git'
end

post_install do |pi|
     pi.pods_project.targets.each do |t|
       t.build_configurations.each do |config|
         config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.1'
       end
     end
 end