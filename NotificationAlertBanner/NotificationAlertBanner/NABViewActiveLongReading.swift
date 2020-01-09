//
//  ViewActiveLongReading.swift
//  NotificationAlertBannerExample
//
//  Created by ZerOnes on 09/01/2020.
//  Copyright © 2020 ZerOnes. All rights reserved.
//

import UIKit

extension NotificationAlertBanner {
    
    static func addClickActiveLongReading() {
        DispatchQueue.main.async {
            let viewActiveLongReading = ViewActiveLongReading().color(.clear)
            viewActiveLongReading.frame = self.bannerFrame ?? CGRect()
            viewActiveLongReading.longGesture { (longReading) in
                switch longReading.state {
                case .began, .changed:
                    self.isActiveLongReading = true
                    self.multiNotificationToRemoveSuperView()
                case .ended:
                    self.isActiveLongReading = false
                    self.removeClickActiveLongReading()
                    guard let bannerViewBase = self.bannerViewBase else { return }
                    self.bannerViewOne?.animationDismissNAB(bannerViewBase)
                default:
                    break
                }
            }
            self.addNotificationBanner(viewBanner: viewActiveLongReading)
            self.bannerTopView = viewActiveLongReading
        }
    }
    
    static func removeClickActiveLongReading() {
        WP.window.subviews.forEach { (view) in
            if view.isKind(of: ViewActiveLongReading.self) {
                view.removeFromSuperview()
            }
        }
    }
    
    static func multiNotificationToRemoveSuperView() {
        self.arrBannerViewOne.forEach { (banner) in
            if self.bannerViewOne == banner { }else {
                banner.removeFromSuperview()
            }
        }
    }
    
}
