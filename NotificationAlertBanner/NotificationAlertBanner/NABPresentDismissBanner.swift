//
//  PresentDismissBanner.swift
//  NotificationAlertBannerExample
//
//  Created by ZerOnes on 10/01/2020.
//  Copyright © 2020 ZerOnes. All rights reserved.
//

import UIKit

extension BannerViewOne {
    
    
    func animationPresentNAB(_ view:UIView, complition: (() -> Void)? = nil) {
        
        switch self.style {
        case .t2D, .r2L, .l2R, .t2DDetails, .r2LDetails, .l2RDetails, .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
            
            switch self.style {
            case .t2D, .t2DDetails, .t2DImageDetails :
                view.updateFrame(y: -view.frame.size.height).opacity(0).hide(false)
            case .r2L, .l2R, .r2LDetails, .l2RDetails, .r2LImageDetails, .l2RImageDetails :
                let x = (self.style == .r2L || self.style == .r2LDetails || self.style == .r2LImageDetails) ? view.frame.size.width : -view.frame.size.width
                view.updateFrame(x: x).opacity(0).hide(false)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                    
                    switch self.style {
                    case .t2D, .t2DDetails, .t2DImageDetails :
                        view.updateFrame(y: 0).opacity(1)
                    case .r2L, .l2R, .r2LDetails, .l2RDetails, .r2LImageDetails, .l2RImageDetails :
                        view.updateFrame(x: 0).opacity(1)
                    }
                    view.layoutIfNeeded()
                }){ _ in
                    if let complition = complition {
                        complition()
                    }
                }
            }
        }
        
    }
    
    func animationDismissNAB(_ view:UIView, complition: (() -> Void)? = nil) {
        
        switch self.style {
        case .t2D, .r2L, .l2R, .t2DDetails, .r2LDetails, .l2RDetails, .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
            
            switch self.style {
            case .t2D, .t2DDetails, .t2DImageDetails :
                view.updateFrame(y:0).opacity(1).hide(false)
            case .r2L, .l2R, .r2LDetails, .l2RDetails, .r2LImageDetails, .l2RImageDetails :
                view.updateFrame(x:0).opacity(1).hide(false)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                    
                    switch self.style {
                    case .t2D, .t2DDetails, .t2DImageDetails :
                        view.updateFrame(y: -view.frame.size.height).opacity(0)
                        
                    case .r2L, .l2R, .r2LDetails, .l2RDetails, .r2LImageDetails, .l2RImageDetails :
                        let x = (self.style == .r2L || self.style == .r2LDetails || self.style == .r2LImageDetails) ? view.frame.size.width : -view.frame.size.width
                        view.updateFrame(x: x).opacity(0)
                    }
                    view.layoutIfNeeded()
                }){ _ in
                    if let complition = complition {
                        complition()
                    }
                    self.removeFromSuperview()
                    NotificationAlertBanner.bannerViewBase = nil
                }
            }
        }
    }
    
    func animationHorizontalScrolling(_ insideView:UIView, _ upperView:UIView, complition: (() -> Void)? = nil) {
        let insideV = insideView.frame.size.width
        let upperV = upperView.frame.size.width
        let diffWidth = upperV - insideV
        if diffWidth < 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: TimeInterval(0.01 * abs(diffWidth)), delay: 0, options: .curveLinear, animations: {
                    insideView.transform = CGAffineTransform(translationX: diffWidth, y: insideView.frame.origin.y)
                    self.layoutIfNeeded()
                }){ _ in
                    if let complition = complition {
                        complition()
                    }
                }
            }
        }else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let complition = complition {
                    complition()
                }
            }
        }
    }
    
}
