//
//  AddNotificationBanner.swift
//  NotificationAlertBannerExample
//
//  Created by Anand Khanpara on 09/01/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import UIKit

extension NotificationAlertBanner {
    
    static var bannerFrame:CGRect? = nil
    static var bannerTopView:UIView? = nil
    static var bannerViewBase:UIView? = nil
    static var isActiveLongReading:Bool? = false
    static var bannerViewOne:BannerViewOne? = nil
    static var arrBannerViewOne = [BannerViewOne]()
    
    public final class func add(style: NotificationStyle = .t2D ,title:String? = "", details:String? = "", logoImage:UIImage? = nil, informationImage:UIImage? = nil) {
        switch style {
        case .t2D, .r2L, .l2R:
            let banner = BannerViewOne(style: style, title: title, details: details, logoImage: logoImage)
            self.bannerViewOne = banner
            self.arrBannerViewOne.append(banner)
            NAB.addNotificationBanner(viewBanner: banner)
        case .t2DDetails, .r2LDetails, .l2RDetails:
            let banner = BannerViewOne(style: style, title: title, details: details, logoImage: logoImage)
            self.bannerViewOne = banner
            self.arrBannerViewOne.append(banner)
            NAB.addNotificationBanner(viewBanner: banner)
        case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
            let banner = BannerViewOne(style: style, title: title, details: details, logoImage: logoImage, informationImage: informationImage)
            self.bannerViewOne = banner
            self.arrBannerViewOne.append(banner)
            NAB.addNotificationBanner(viewBanner: banner)
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
