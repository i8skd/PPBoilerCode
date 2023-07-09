Pod::Spec.new do |s|
  s.name         = 'PPBoilerCode'
  s.version      = '0.1.0'
  s.summary      = 'A boiler code for the network request'
  s.homepage     = 'https://github.com/i8skd/PPBoilerCode'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Keshav Pawar' => 'keshavpawar100@gmail.com' }
  s.source       = { :git => 'https://github.com/i8skd/PPBoilerCode.git', :tag => s.version.to_s }
  s.swift_version = '5.0'

  s.source_files = 'PPBoilerCode/**/*.{swift}'

  # Replace 'MyCocoaPod' with the appropriate module name from your code
  s.module_name = 'PPBoilerCode'
end
