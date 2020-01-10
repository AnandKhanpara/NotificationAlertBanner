//
//  BannerViewOne.swift
//  NotificationAlertBannerExample
//
//  Created by Anand Khanpara on 06/01/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import UIKit

class BannerViewOne: UIView {
    
    var bannerCardHeight:CGFloat = 70
    var bannerCardFrame:CGRect =  CGRect()
    var style:NotificationStyle = .t2D
    
    init(frame: CGRect = CGRect(), style: NotificationStyle = .t2D ,title:String? = "", details:String? = "", logoImage:UIImage? = nil, informationImage:UIImage? = nil) {
        super.init(frame: frame)
        
        DispatchQueue.main.async {
            
            self.style = style
            
            let bgView = UIView().setFrame(x: 0, y: 0, width: WP.windowWidth, height: WP.topSafe + self.bannerCardHeight).hide().addSelf(self)
            
            let bannerCard = UIView().corner(10).border(NAB.bannerBorderColor, width: NAB.bannerBorderWidth).addSelf(bgView)
            bannerCard.constraint(t: bgView.topAnchor, tC: WP.topSafe, l: bgView.leadingAnchor, lC: 10, tr: bgView.trailingAnchor, trC: -10, hG: self.bannerCardHeight)
            
            let emptyBackGroundView = UIView().addSelf(bannerCard).constraintBounds(bannerCard)
            
            let logoImageView = UIView().image(logoImage ?? UIImage(named: "apple"), .scaleAspectFit).corner(5).addSelf(bannerCard)
            switch self.style {
            case .t2D, .r2L, .l2R:
                logoImageView.constraint(t: bannerCard.topAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, w: 50, h: 50)
            case .t2DDetails, .r2LDetails, .l2RDetails:
                logoImageView.constraint(t: bannerCard.topAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, w: 30, h: 30)
            case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                logoImageView.constraint(t: bannerCard.topAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, w: 30, h: 30)
            }
            
            
            let titleLable = UILabel().title(title, NAB.bannerTitleFontColor ?? .black).line(0).fontSystem(.semibold, size: 16).fontCustom(NAB.bannerTitleFontName, size: 16).addSelf(bannerCard)
            
            switch self.style {
            case .t2D, .r2L, .l2R:
                titleLable.constraint(t: bannerCard.topAnchor, tC: 10, l: logoImageView.trailingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10, h: 30)
            case .t2DDetails, .r2LDetails, .l2RDetails:
                titleLable.constraint(t: bannerCard.topAnchor, tC: 10, l: logoImageView.trailingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10, h: 30)
            case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                titleLable.constraint(t: bannerCard.topAnchor, tC: 10, l: logoImageView.trailingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10, h: 30)
            }
            
            let informationImageView = UIView().image(informationImage ?? UIImage(named: "apple1"), .scaleAspectFit).corner(5).addSelf(bannerCard)
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
                detailsBGView.constraint(t: titleLable.bottomAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10,b: bannerCard.bottomAnchor, bC: -10, hG: 0)
            case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                detailsBGView.constraint(t: informationImageView.bottomAnchor, tC: 10, l: bannerCard.leadingAnchor, lC: 10, tr: bannerCard.trailingAnchor, trC: -10,b: bannerCard.bottomAnchor, bC: -10, hG: 0)
            }
            
            let detailsLable = UILabel().title(details, NAB.bannerDetailsFontColor ?? .black).alignment(.natural).fontSystem(size: 14).fontCustom(NAB.bannerDetailsFontName, size: 14).addSelf(detailsBGView)
            
            switch self.style {
            case .t2D, .r2L, .l2R:
                detailsLable.constraintBounds(detailsBGView, isTrailing: false)
            case .t2DDetails, .r2LDetails, .l2RDetails:
                detailsLable.line(0).constraintBounds(detailsBGView, isTrailing: true)
            case .t2DImageDetails, .r2LImageDetails, .l2RImageDetails:
                detailsLable.line(0).constraintBounds(detailsBGView, isTrailing: true)
            }
            
            self.dispatchDelay {
                print(informationImageView.frame)
                self.bannerCardHeight = bannerCard.frame.size.height
                self.bannerCardFrame = bannerCard.frame
                emptyBackGroundView.heightConstraint(constraint: .equal, constant: bannerCard.frame.size.height)
                self.addBackBannerCell(cellView: emptyBackGroundView)
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

    fileprivate func addBackBannerCell(cellView view:UIView, complition: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            view.color(.clear)
            if let image = NAB.bannerBackGroundImage {
                view.image(image)
            }else if let color = NAB.bannerBackGroundColor {
                view.color(color)
            }else {
                view.blur(.regular)
            }
            if let complition = complition {
                complition()
            }
        }
    }
    
    // MARK:- required init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
