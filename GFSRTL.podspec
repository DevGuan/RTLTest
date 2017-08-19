Pod::Spec.new do |s|
s.name = ‘GFSRTL’
s.version = ‘1.0.1’
s.license = 'MIT'
s.summary = ‘RTL layout in iOS.'
s.homepage = 'https://github.com/DevGuan/MasonryRTLTest’
s.authors = { 'DevGuan' => '975081801@qq.com' }
s.source = { :git => 'https://github.com/DevGuan/MasonryRTLTest.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = ‘8.0’
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'GFSRTL/{GFS,RTL,MAS,UI}*.{h,m}'
  end

end
