Pod::Spec.new do |spec|
  spec.name         = "ImageLoader"
  spec.version      = "0.0.1"
  spec.summary      = "Mobile application for test assignment"
  spec.homepage     = "https://github.com/beobyte/ImageLoader"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Anton Grachev" => "agrachev.86@gmail.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/beobyte/ImageLoader.git", :tag => '0.0.1' }
  spec.source_files  = "ImageLoader/*.{h,m,swift}"
  spec.requires_arc = true
end
