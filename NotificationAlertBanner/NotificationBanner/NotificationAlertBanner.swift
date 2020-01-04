//
//  NotificationAlertBanner.swift
//  MessageBanner
//
//  Created by Anand Khanpara on 30/12/2019.
//  Copyright © 2019 Anand Khanpara. All rights reserved.
//

import Foundation
import UIKit

public final class NotificationAlertBanner: NSObject {
    
    typealias NAB = NotificationAlertBanner
    
    public static var bannerBackGroundColor:UIColor? = nil
    public static var bannerBackGroundImage:UIImage? = nil
    public static var bannerTitleFontName:String? = nil
    public static var bannerDetailsFontName:String? = nil
    public static var bannerTitleFontColor:UIColor? = nil
    public static var bannerDetailsFontColor:UIColor? = nil
    public static var bannerBorderColor:UIColor? = nil
    public static var bannerBorderWidth:CGFloat? = nil
    
    public final class func add(style: NotificationStyle = .topToDown ,title:String? = "", details:String? = "", image:UIImage? = nil) {
        switch style {
        case .topToDown:
            NAB.addNotificationBanner(viewBanner: BannerTopToDown(title: title, details: details, image: image))
        case .rightToLeft:
            NAB.addNotificationBanner(viewBanner: BannerRightToLeft(title: title, details: details, image: image))
        }
        
    }
    
    class func addNotificationBanner(viewBanner:UIView) {
        let window = UIApplication.shared.windows
        if let lastWindow = window.last {
            DispatchQueue.main.async {
               lastWindow.addSubview(viewBanner)
            }
        }
    }
}

public enum NotificationStyle {
    case topToDown
    case rightToLeft
}
