//
//  WindowProperty.swift
//  NotificationAlertBannerExample
//
//  Created by Anand Khanpara on 06/01/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import Foundation
import UIKit



class WindowProperty : NSObject {
    
    
    static let arrWindow = UIApplication.shared.windows
    
    static let window:UIWindow = {
        guard let lastWindow = UIApplication.shared.windows.last else {
            return UIWindow()
        }
        return lastWindow
        
    }()
    
    static let windowFrame:CGRect = {
        guard let frame = UIApplication.shared.windows.last?.frame else {
            return CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        return frame
    }()
    
    static let windowWidth:CGFloat = {
        return WindowProperty.windowFrame.width
    }()
    
    static let windowHeight:CGFloat = {
        return WindowProperty.windowFrame.height
    }()
    
    static let windowSafeArea:UIEdgeInsets = {
        guard let safeArea = UIApplication.shared.windows.last?.safeAreaInsets else {
            return UIEdgeInsets()
        }
        return safeArea
    }()
    
    static let topSafe:CGFloat = {
        return WindowProperty.windowSafeArea.top
    }()
    
    static let leftSafe:CGFloat = {
        return WindowProperty.windowSafeArea.left
    }()
    
    static let rightSafe:CGFloat = {
        return WindowProperty.windowSafeArea.right
    }()
    
    static let bottomSafe:CGFloat = {
        return WindowProperty.windowSafeArea.bottom
    }()
}
