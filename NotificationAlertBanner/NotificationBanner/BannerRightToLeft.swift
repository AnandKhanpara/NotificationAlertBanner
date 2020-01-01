//
//  BannerRightToLeftScrollDetails.swift
//  NotificationAlertBannerExample
//
//  Created by ZerOnes on 01/01/2020.
//  Copyright © 2020 ZerOnes. All rights reserved.
//

import Foundation
import UIKit

public final class BannerRightToLeft: UIView {
    
    public init(frame: CGRect = CGRect(), title:String? = "", details:String? = "", image:UIImage? = nil) {
        super.init(frame: frame)
        self.setAddView(title: title, details: details, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAddView(title:String? = "", details:String? = "", image:UIImage? = nil) {
        
        let window = UIApplication.shared.windows
        
        guard let backGroundViewFrame = window.last?.frame else {
            return
        }
        
        guard let safeArea = window.last?.safeAreaInsets else {
            return
        }
        
        let topSafe = safeArea.top
        
        let bannerViewHeight:CGFloat = 70
        
        let width:CGFloat = backGroundViewFrame.size.width
        let height:CGFloat = bannerViewHeight + topSafe
        
        let backGroundView = UIView()
        backGroundView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        backGroundView.backgroundColor = .clear
        self.addSubview(backGroundView)
        
        var centerXAnchorConstraintBannerCell:NSLayoutConstraint?

        let bannerCell = UIView(frame: CGRect(x: 0, y: topSafe, width: width, height: 70))
        bannerCell.layer.cornerRadius = 10
        bannerCell.clipsToBounds = true
        bannerCell.translatesAutoresizingMaskIntoConstraints = false
        bannerCell.backgroundColor = .clear
        backGroundView.addSubview(bannerCell)
        
        bannerCell.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: topSafe).isActive = true
        bannerCell.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 10).isActive = true
        bannerCell.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -10).isActive = true
        bannerCell.heightAnchor.constraint(equalToConstant: 70).isActive = true
        centerXAnchorConstraintBannerCell = bannerCell.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor, constant: 0)
        
        centerXAnchorConstraintBannerCell?.isActive = true

        backGroundView.transform = CGAffineTransform(translationX: backGroundViewFrame.width , y: backGroundView.frame.origin.y)
        backGroundView.alpha = 0
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bannerCell.bounds
        bannerCell.addSubview(blurView)
        
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        bannerCell.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: bannerCell.leadingAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.centerYAnchor.constraint(equalTo: bannerCell.centerYAnchor, constant: 0).isActive = true
        
        let labelTitle = UILabel()
        labelTitle.frame = self.bounds
        labelTitle.text = title
        labelTitle.font = UIFont.boldSystemFont(ofSize: 14)
        labelTitle.textColor = UIColor.black
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        bannerCell.addSubview(labelTitle)
        
        labelTitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: bannerCell.trailingAnchor, constant: -10).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        labelTitle.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0).isActive = true
        
        let viewDetailsBG = UIView()
        viewDetailsBG.clipsToBounds = true
        viewDetailsBG.translatesAutoresizingMaskIntoConstraints = false
        bannerCell.addSubview(viewDetailsBG)
        
        viewDetailsBG.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        viewDetailsBG.trailingAnchor.constraint(equalTo: bannerCell.trailingAnchor, constant: -10).isActive = true
        viewDetailsBG.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewDetailsBG.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        
        let labelDetails = UILabel()
        labelDetails.frame = self.bounds
        labelDetails.text = details
        labelDetails.font = UIFont.systemFont(ofSize: 14)
        labelDetails.textColor = UIColor.black
        labelDetails.translatesAutoresizingMaskIntoConstraints = false
        viewDetailsBG.addSubview(labelDetails)
        
        labelDetails.leadingAnchor.constraint(equalTo: viewDetailsBG.leadingAnchor, constant: 0).isActive = true
        labelDetails.topAnchor.constraint(equalTo: viewDetailsBG.topAnchor, constant: 0).isActive = true
        labelDetails.bottomAnchor.constraint(equalTo: viewDetailsBG.bottomAnchor, constant: 0).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            UIView.animate(withDuration: 0.7, delay: 0, options: .curveLinear, animations: {
                backGroundView.alpha = 1
                backGroundView.transform = .identity
                self.layoutIfNeeded()
            }) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
                    longDetailsToScrollingLeftToRight()
                }
            }
        }
        
        func longDetailsToScrollingLeftToRight() {
            
            let animatedWidth = (labelDetails.frame.size.width - viewDetailsBG.frame.size.width)
            
            if 0 < animatedWidth {
                UIView.animate(withDuration: TimeInterval(0.01 * animatedWidth), delay: 0, options: .curveLinear, animations: {
                    labelDetails.transform = CGAffineTransform(translationX: -animatedWidth, y: labelDetails.frame.origin.y)
                    self.layoutIfNeeded()
                }) { _ in
                    hideSelfViewAndRemoveSuperView()
                }
            }else {
                hideSelfViewAndRemoveSuperView()
            }
        }
        
        func hideSelfViewAndRemoveSuperView() {
            
            UIView.animate(withDuration: 0.7, delay: 1, options: .curveLinear, animations: {
                backGroundView.alpha = 0
                backGroundView.transform = CGAffineTransform(translationX: backGroundViewFrame.width , y: backGroundView.frame.origin.y)
                self.layoutIfNeeded()
            }) { _ in
                
                DispatchQueue.main.async {
                    self.removeFromSuperview()
                }
            }
        }
        
    }
}
    
