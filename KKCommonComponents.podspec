#
# Be sure to run `pod lib lint CommonComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KKCommonComponents'
  s.version          = '0.0.6'
  s.summary          = 'CommonComponents'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/cmadc/CommonComponents'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liujiaojiao' => 'jiaojiao.liu@phicomm.com' }
  s.source           = { :git => 'https://github.com/cmadc/CommonComponents.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'KKCommonComponents/KKCommonComponents.h'
  s.source_files = 'KKCommonComponents/KKCommonComponents.h'

  s.subspec 'KKFont' do |ss|

    ss.public_header_files = 'KKCommonComponents/Font/*.h'
    ss.source_files = 'KKCommonComponents/Font/*.{h,m}'

  end

  s.subspec 'KKLabel' do |ss|

    ss.public_header_files = 'KKCommonComponents/KKLabel/*.h'
    ss.source_files = 'KKCommonComponents/KKLabel/*.{h,m}'

  end

  s.subspec 'KKModel' do |ss|

    ss.public_header_files = 'KKCommonComponents/model/*.h'
    ss.source_files = 'KKCommonComponents/model/*.{h,m}'

  end

  s.subspec 'Reachability' do |ss|

    ss.public_header_files = 'KKCommonComponents/Reachability/*.h'
    ss.source_files = 'KKCommonComponents/Reachability/*.{h,m}'

  end

  s.subspec 'KKAttributeString' do |ss|

    ss.public_header_files = 'KKCommonComponents/KKAttributeString/*.h'
    ss.source_files = 'KKCommonComponents/KKAttributeString/*.{h,m}'
    ss.dependency 'KKCommonComponents/KKFont'

  end

  s.subspec 'KKButton' do |ss|

    ss.public_header_files = 'KKCommonComponents/Button/*.h'
    ss.source_files = 'KKCommonComponents/Button/*.{h,m}'

  end

  s.subspec 'KKView' do |ss|

    ss.public_header_files = 'KKCommonComponents/View/*.h'
    ss.source_files = 'KKCommonComponents/View/*.{h,m}'

  end

  s.subspec 'KKColor' do |ss|

    ss.public_header_files = 'KKCommonComponents/Color/*.h'
    ss.source_files = 'KKCommonComponents/Color/*.{h,m}'

  end

  s.subspec 'KKWebImage' do |ss|

    ss.public_header_files = 'KKCommonComponents/KKWebImage/*.h'
    ss.source_files = 'KKCommonComponents/KKWebImage/*.{h,m}'

  end

  s.subspec 'KKPhoto' do |ss|

    ss.public_header_files = 'KKCommonComponents/KKPhoto/*.h'
    ss.source_files = 'KKCommonComponents/KKPhoto/*.{h,m}'
    ss.dependency 'KKCommonComponents/KKColor'
    ss.dependency 'KKCommonComponents/KKView'

  end
   s.subspec 'KKBanner' do |ss|

    ss.public_header_files = 'KKCommonComponents/KKBanner/*.h'
    ss.source_files = 'KKCommonComponents/KKBanner/*.{h,m}'
    ss.dependency 'KKCommonComponents/KKColor'
    ss.dependency 'KKCommonComponents/KKView'
    ss.dependency 'KKCommonComponents/KKWebImage'

  end 

  s.dependency 'AFNetworking', '~> 3.2.1'
  s.dependency 'YYModel','~> 1.0.4'
  s.dependency 'Masonry'
  s.dependency 'SDWebImage', '~> 4.3.3'
  s.dependency 'SDWebImage/GIF'
  s.dependency 'FLAnimatedImage'
  s.dependency 'DACircularProgress'

end
