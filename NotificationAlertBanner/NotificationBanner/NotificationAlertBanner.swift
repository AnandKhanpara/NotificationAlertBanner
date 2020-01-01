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
    
    public final class func add(notificationStyle: NotificationStyle = .topToDownScrollDetails ,title:String? = "", details:String? = "", image:UIImage? = nil) {
        
        switch notificationStyle {
        case .topToDownScrollDetails:
            NAB.addNotificationBanner(viewBanner: BannerTopToDownScrollDetails(title: title, details: details, image: image))
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
    case topToDownScrollDetails
}
