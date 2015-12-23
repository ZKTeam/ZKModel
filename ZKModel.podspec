Pod::Spec.new do |s|
	s.name = "ZKModel"
	s.version = "1.0"
	s.summary = "ZKModel is model converter."
	s.homepage = "https://github.com/WangWenzhuang/ZKModel"
	s.license = 'MIT'
	s.author = { "WangWenzhuang" => "1020304029@qq.com" }
	s.platform = :ios, '7.0'
	s.source = { :git => "https://github.com/WangWenzhuang/ZKModel.git", :tag => "v1.0" }
	s.source_files = 'ZKModel/*'
	s.requires_arc = true
end