# Uncomment the next line to define a global platform for your project
platform :ios, '16.1'

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
end

target 'Core' do
  project '../Core/Core' 
# Pods for Core
  pod 'RealmSwift'
  pod 'SwiftLint'
  pod 'Alamofire'
end

target 'MovieXUI' do 
  project '../Commons/MovieXUI/MovieXUI' 
# Pods for MovieXUI
  pod 'lottie-ios', '~> 4.0.1'
  pod 'SwiftLint'
  pod 'Kingfisher'
end

target 'Home' do 
  project '../Modules/Home/Home' 
# Pods for Home
  pod 'lottie-ios', '~> 4.0.1'
  pod 'SwiftLint'
  pod 'Kingfisher'
end

target 'Search' do 
  project '../Modules/Search/Search' 
# Pods for Search
  pod 'lottie-ios', '~> 4.0.1'
  pod 'SwiftLint'
  pod 'Kingfisher'
end

target 'Favorite' do 
  project '../Modules/Favorite/Favorite' 
# Pods for Favorite
  pod 'lottie-ios', '~> 4.0.1'
  pod 'SwiftLint'
  pod 'Kingfisher'
end

target 'Settings' do 
  project '../Modules/Settings/Settings' 
# Pods for Settings
  pod 'SwiftLint'
end

target 'About' do 
  project '../Modules/About/About' 
# Pods for About
  pod 'SwiftLint'
end

target 'Detail' do 
  project '../Modules/Detail/Detail' 
# Pods for Detail
  pod 'SwiftLint'
  pod 'Kingfisher'
end



post_install do |pi|
     pi.pods_project.targets.each do |t|
       t.build_configurations.each do |config|
         config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.1'
       end
     end
 end