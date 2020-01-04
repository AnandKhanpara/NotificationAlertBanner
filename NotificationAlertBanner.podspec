
Pod::Spec.new do |spec|


  spec.name         = "NotificationAlertBanner"
  spec.version      = "0.0.6"
  spec.summary      = "Add NotificationAlertBanner"
  
  spec.description  = <<-DESC
  This CocoaPods library helps you perform NotificationAlertBanner.
                   DESC

  spec.homepage     = "https://github.com/AnandKhanpara/NotificationAlertBanner"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Anand Khanpara" => "anandkhanpara111@gmail.com" }
  spec.ios.deployment_target = "11.0"
  spec.swift_version = "5"
  spec.source       = { :git => "https://github.com/AnandKhanpara/NotificationAlertBanner.git", :tag => "#{spec.version}" }
  spec.source_files  = "NotificationAlertBanner/**/*.{h,m,swift}"

end
