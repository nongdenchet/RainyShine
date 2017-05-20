source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'RainyShine' do
  use_frameworks!

	pod 'Swinject', '~> 2.1.0'
	pod 'Moya/RxSwift'
	pod 'RxSwift',    '~> 3.0'
  pod 'RxCocoa',    '~> 3.0'
  pod 'ObjectMapper', '~> 2.2'

  target 'RainyShineTests' do
    inherit! :search_paths
		
		pod 'Cuckoo'
  	pod 'RxBlocking', '~> 3.0'
		pod 'RxTest',     '~> 3.0'
	end

  target 'RainyShineUITests' do
    inherit! :search_paths
  end
end
