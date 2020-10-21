#
# Be sure to run `pod lib lint KosherSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZmanimKit'
  s.version          = '2.0.1'
  s.summary          = 'A Swift library for getting zmanim.'
  s.swift_versions	 = ['5.0']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MichaelJBerk/ZmanimKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'LGLP', :file => 'LICENSE.md' }
  s.author           = { 'Michael Berk' => 'michaelberkdev@gmail.com' }
  s.source           = { :git => 'https://github.com/MichaelJBerk/ZmanimKit.git', :branch => "master"} #:tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.6'
  s.macos.deployment_target = '10.15.6'

  s.source_files = 'Sources/**/*'
  s.resources = 'Assets/*'
  
  # s.resource_bundles = {
  #   'KosherSwift' => ['KosherSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
