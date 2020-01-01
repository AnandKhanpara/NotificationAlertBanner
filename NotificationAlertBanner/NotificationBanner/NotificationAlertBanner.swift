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
    
    public final class func add(notificationStyle: NotificationStyle = .topToDown ,title:String? = "", details:String? = "", image:UIImage? = nil) {
        
        switch notificationStyle {
        case .topToDown:
            NAB.addNotificationBanner(viewBanner: BannerTopToDown(title: title, details: details, image: image))
        case .rightToLeft:
            NAB.addNotificationBanner(viewBanner: BannerRightToLeft(title: title, details: details, image: image))
            
            break 
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
//https://raw.githubusercontent.com/AnandKhanpara/NotificationAlertBanner/master/NotificationAlertBanner/Assets/BannerTopToDown.gif

//## NotificationAlertBanner Style
//### 1. topToDown
//![alt tag](https://raw.githubusercontent.com/AnandKhanpara/NotificationAlertBanner/master/NotificationAlertBanner/Assets/topToDown.gif)
