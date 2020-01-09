//
//  Demo.swift
//  NotificationAlertBannerExample
//
//  Created by ZerOnes on 06/01/2020.
//  Copyright © 2020 ZerOnes. All rights reserved.
//

import UIKit

class BannerViewOne: UIView {
    
    fileprivate var bannerCardHeight:CGFloat = 70
    fileprivate var bannerCardFrame:CGRect =  CGRect()
    fileprivate var style:NotificationStyle = .t2D
    
    init(frame: CGRect = CGRect(), style: NotificationStyle = .t2D ,title:String? = "", details:String? = "", logoImage:UIImage? = nil, informationImage:UIImage? = nil) {
        super.init(frame: frame)
        
        DispatchQueue.main.async {
            
            self.style = style
            
            let bgView = UIView().setFrame(x: 0, y: 0, width: WP.windowWidth, height: WP.topSafe + self.bannerCardHeight).hide().addSelf(self)
            
            let bannerCard = UIView().corner(10).addSelf(bgView)
            bannerCard.constraint(t: bgView.topAnchor, tC: WP.topSafe, l: bgView.leadingAnchor, lC: 10, tr: bgView.trailingAnchor, trC: -10, hG: self.bannerCardHeight)
            
            self.addBackBannerCell(cellView: bannerCard) {
                
                let logoImageView = UIView().image(logoImage).corner(5).addSelf(bannerCard)
                
                switch self.style {
                case .t2D, .r2L, .l2R:
                    logoImageView.constraint(t: bannerCard.topAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, w: 50, h: 50)
                case .t2DDetails, .r2LDetails, .l2RDetails:
                    logoImageView.constraint(t: bannerCard.topAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, w: 30, h: 30)
                case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                    logoImageView.constraint(t: bannerCard.topAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, w: 30, h: 30)
                }
                
                
                let titleLable = UILabel().title(title, .black).line(0).fontSystem(.semibold, size: 16).addSelf(bannerCard)
                
                switch self.style {
                case .t2D, .r2L, .l2R:
                    titleLable.constraint(t: bannerCard.topAnchor, tC: 10, l: logoImageView.trailingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10, h: 30)
                case .t2DDetails, .r2LDetails, .l2RDetails:
                    titleLable.constraint(t: bannerCard.topAnchor, tC: 10, l: logoImageView.trailingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10, h: 30)
                case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                    titleLable.constraint(t: bannerCard.topAnchor, tC: 10, l: logoImageView.trailingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10, h: 30)
                }
                
                let informationImageView = UIView().image(logoImage).corner(5).addSelf(bannerCard)
                switch self.style {
                case .t2D, .r2L, .l2R:
                    break
                case .t2DDetails, .r2LDetails, .l2RDetails:
                    break
                case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                    informationImageView.constraint(t: titleLable.bottomAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10)
                    informationImageView.heightConstraint(constraint: .equal, equalTo: informationImageView.widthAnchor, multiplier: 0.5)
                }
                
                
                let detailsBGView = UIView().addSelf(bannerCard)
                
                switch self.style {
                case .t2D, .r2L, .l2R:
                    detailsBGView.constraint(t: titleLable.bottomAnchor, tC: 0, l: logoImageView.trailingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10,b: bannerCard.bottomAnchor, bC: -10, hG: 20)
                case .t2DDetails, .r2LDetails, .l2RDetails:
                    detailsBGView.constraint(t: titleLable.bottomAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10,b: bannerCard.bottomAnchor, bC: -10, hG: 20)
                case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                    detailsBGView.constraint(t: informationImageView.bottomAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10,b: bannerCard.bottomAnchor, bC: -10, hG: 20)
                }
                
                let detailsLable = UILabel().title(details, .black).alignment(.justified).fontSystem(size: 14).addSelf(detailsBGView)
                
                switch self.style {
                case .t2D, .r2L, .l2R:
                    detailsLable.constraintBounds(detailsBGView, isTrailing: false)
                case .t2DDetails, .r2LDetails, .l2RDetails:
                    detailsLable.line(0).constraintBounds(detailsBGView, isTrailing: true)
                case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                    detailsLable.line(0).constraintBounds(detailsBGView, isTrailing: true)
                }
                
                self.dispatchDelay {
                    self.bannerCardHeight = bannerCard.frame.size.height
                    self.bannerCardFrame = bannerCard.frame
                    bgView.updateFrame(height: WP.topSafe + self.bannerCardHeight)
                    NotificationAlertBanner.bannerFrame = bannerCard.frame
                    
                    self.animationPresentNAB(bgView) {
                        NotificationAlertBanner.bannerViewBase = bgView
                        NotificationAlertBanner.addClickActiveLongReading()
                        
                        self.animationHorizontalScrolling(detailsLable, detailsBGView) {
                            if NotificationAlertBanner.isActiveLongReading == false {
                                NotificationAlertBanner.removeClickActiveLongReading()
                                self.animationDismissNAB(bgView)
                            }
                        }
                    }
                }
            }
        }
    }
    
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

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
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
    
    fileprivate func animationHorizontalScrolling(_ insideView:UIView, _ upperView:UIView, complition: (() -> Void)? = nil) {
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
    
    fileprivate func addBackBannerCell(cellView view:UIView, complition:@escaping () -> ()) {
        DispatchQueue.main.async {
            view.color(.clear)
            if let image = NAB.bannerBackGroundImage {
                view.image(image)
            }else if let color = NAB.bannerBackGroundColor {
                view.color(color)
            }else {
                view.blur(.regular)
            }
            complition()
        }
    }
    
    // MARK:- required init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
