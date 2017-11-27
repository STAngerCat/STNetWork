#
# Be sure to run `pod lib lint STNetWork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'STNetWork'
  s.version          = '0.1.0'
  s.summary          = 'A short description of STNetWork.'
  s.module_map       = 'STNetWork/STNetWork.modulemap'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/STAngerCat/STNetWork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maple Yin' => 'i@maple.im' }
  s.source           = { :git => 'https://github.com/STAngerCat/STNetWork.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Mapleiny'

  s.ios.deployment_target = '8.0'

#s.public_header_files = 'STNetWork/Classes/*.h'
  s.source_files = 'STNetWork/Classes/*.{h,m,swift}'
  
  # s.resource_bundles = {
  #   'STNetWork' => ['STNetWork/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~> 4.3'
end
