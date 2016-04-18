Pod::Spec.new do |s|
  s.name         = "WFToolsExtension"
  s.version      = "1.0.1"
  s.summary      = "丰富的系统扩展库"
  s.homepage     = "https://github.com/CWFJ/WFToolsExtension"
  s.license      = "MIT"
  s.authors      = { 'WF Chia' => '345609097@qq.com'}
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/CWFJ/WFToolsExtension.git", :tag => s.version }
  s.source_files = "WFToolsExtensionExample/Classes/WFExtension/*.{h,m}"
  s.requires_arc = true
end
