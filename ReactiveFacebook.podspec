Pod::Spec.new do |s|
  s.name         = "ReactiveFacebook"
  s.version      = "0.1"
  s.summary      = ""
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = "git@github.com:YouClap/ReactiveFacebook"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Luís Portela" => "me@portellaa.eu" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "git@github.com:YouClap/ReactiveFacebook.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
  s.dependency = "ReactiveSwift"
  s.dependency = "FacebookCore"
  s.dependency = "FacebookLogin"
end
