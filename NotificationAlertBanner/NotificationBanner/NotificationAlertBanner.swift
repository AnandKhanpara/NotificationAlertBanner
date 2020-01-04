//
//  MessageBanner.swift
//  MessageBanner
//
//  Created by ZerOnes on 30/12/2019.
//  Copyright © 2019 ZerOnes. All rights reserved.
//

import Foundation
import UIKit

public final class NotificationAlertBanner: NSObject {
    
    typealias NAB = NotificationAlertBanner
    
    static var bannerBackGroundColor:UIColor? = nil
    static var bannerBackGroundImage:UIImage? = nil
    static var bannerTitleFontName:String? = nil
    static var bannerDetailsFontName:String? = nil
    static var bannerTitleFontColor:UIColor? = nil
    static var bannerDetailsFontColor:UIColor? = nil
    static var bannerBorderColor:UIColor? = nil
    static var bannerBorderWidth:CGFloat? = nil
    
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
