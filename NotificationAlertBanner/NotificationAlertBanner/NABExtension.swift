//
//  NABExtension.swift
//  NotificationAlertBannerExample
//
//  Created by ZerOnes on 06/01/2020.
//  Copyright © 2020 ZerOnes. All rights reserved.
//

import UIKit

//MARK:- typealias

typealias NSXAnchor = NSLayoutAnchor<NSLayoutXAxisAnchor>
typealias NSYAnchor = NSLayoutAnchor<NSLayoutYAxisAnchor>
typealias NAB = NotificationAlertBanner
typealias WP = WindowProperty

//MARK:- Extension

extension UIView {

    
    //MARK:- UpdateView
    
    @discardableResult
    func hide(_ isHide:Bool = true) -> UIView {
        self.isHidden = isHide
        return self
    }
    
    @discardableResult
    func opacity(_ alpha:CGFloat = 1) -> UIView {
        self.alpha = alpha
        return self
    }
    
    @discardableResult
    func userInteraction(_ isEnabled:Bool = true) -> UIView {
        self.isUserInteractionEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func color(_ backgroundColor:UIColor) -> UIView {
        self.backgroundColor = backgroundColor
        return self
    }
    
    
    @discardableResult
    func clipped() -> UIView {
        self.clipsToBounds = true
        return self
    }
    
    @discardableResult
    func border(_ color:UIColor, width:CGFloat) -> UIView {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func corner(_ radius:CGFloat) -> UIView {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func title(_ text:String?, _ textColor:UIColor = .black) -> UIView {
        if let label = self as? UILabel {
            label.text = text
            label.textColor = textColor
            return label as UIView
        }else if let button = self as? UIButton {
            button.setTitle(text, for: .normal)
            button.setTitleColor(textColor, for: .normal)
        }
        return self
    }
    
    @discardableResult
    func alignment(_ alignment:NSTextAlignment) -> UIView {
        if let label = self as? UILabel {
            label.textAlignment = alignment
            return label as UIView
        }
        return self
    }
    
    @discardableResult
    func line(_ numberOfLine:Int = 1) -> UIView {
           if let label = self as? UILabel {
               label.numberOfLines = numberOfLine
               return label as UIView
           }
           return self
       }
    
    func fontCustom(_ name:String, size:CGFloat) -> UIView {
        if let label = self as? UILabel {
            label.font = UIFont(name: name, size: size)
            return label as UIView
        }
        return self
    }
    
    func fontSystem(_ style:UIFont.Weight = .regular, size:CGFloat) -> UIView {
        if let label = self as? UILabel {
            label.font = UIFont.systemFont(ofSize: size, weight:style)
            return label as UIView
        }
        return self
    }
    
    @discardableResult
    func front(_ baseView:UIView) -> UIView {
        baseView.bringSubviewToFront(self)
        return self
    }
    
    //MARK:- Add View
    
    @discardableResult
    func clickAction(_ target:Any?, _ event:UIControl.Event, selector:Selector) -> UIView {
        self.isUserInteractionEnabled = true
        let button = UIButton()
        button.addTarget(target, action: selector, for: event)
        self.addSelf(button)
        button.constraintBounds(self)
        return self
    }
    
    @discardableResult
    func image(_ backgroundImage:UIImage?, _ mode:ContentMode = .scaleAspectFill) -> UIView {
        let image = UIImageView(image: backgroundImage)
        image.contentMode = mode
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        image.constraintBounds(self)
        return self
    }
    
    @discardableResult
    func blur(_ style:UIBlurEffect.Style) -> UIView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        self.addSubview(blurView)
        blurView.constraintBounds(self)
        return self
    }
    
    @discardableResult
    func addSelf(_ baseView:UIView) -> UIView {
        baseView.addSubview(self)
        return self
    }
    
    //MARK:- Gesture
    
     @discardableResult
      func  tapGesture(action : @escaping (TapGestureRecognizer)->Void ) -> UIView {
          let tap = TapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
          tap.action = action
          tap.numberOfTapsRequired = 1
          
          self.addGestureRecognizer(tap)
          self.isUserInteractionEnabled = true
          return self
      }
      
      @objc func handleTap(_ gesture: TapGestureRecognizer) {
          if let action = gesture.action {
              action(gesture)
          }
      }
      
      @discardableResult
      func  longGesture(action : @escaping (LongPressGestureRecognizer)->Void ) -> UIView {
          let long = LongPressGestureRecognizer(target: self , action: #selector(self.handleLong(_:)))
          long.action = action
          long.minimumPressDuration = 0.0
          
          self.addGestureRecognizer(long)
          self.isUserInteractionEnabled = true
          return self
      }
      
      @objc func handleLong(_ gesture: LongPressGestureRecognizer) {
          if let action = gesture.action {
              action(gesture)
          }
      }
   
    //MARK:- Dispatch
    
    func dispatchDelay(_ time:DispatchTime = .now(), complition:@escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: time) {
            complition()
        }
    }
    
    //MARK:- Frame
    
    @discardableResult
    func setFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIView {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
    
    @discardableResult
    func updateFrame(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) -> UIView {
        self.frame = CGRect(x: x ?? self.frame.origin.x, y: y ?? self.frame.origin.y, width: width ?? self.frame.width, height: height ?? self.frame.height)
        return self
    }
    
    @discardableResult
    func bounds(_ baseView:UIView) -> UIView {
        self.bounds = baseView.bounds
        return self
    }
    
    //MARK:- Constraint
    
    @discardableResult
    func applyConstraints() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    func topConstraint(_ baseView:UIView, constant:CGFloat) -> NSLayoutConstraint {
        self.applyConstraints()
        let topConstraint = self.topAnchor.constraint(equalTo: baseView.topAnchor, constant: constant)
        topConstraint.isActive = true
        return topConstraint
    }
    
    @discardableResult
    func leadingConstraint(_ baseView:UIView, constant:CGFloat) -> NSLayoutConstraint {
        self.applyConstraints()
        let leadingConstraint = self.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: constant)
        leadingConstraint.isActive = true
        return leadingConstraint
    }
    
    @discardableResult
    func trailingConstraint(_ baseView:UIView, constant:CGFloat) -> NSLayoutConstraint {
        self.applyConstraints()
        let trailingConstraint = self.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: constant)
        trailingConstraint.isActive = true
        return trailingConstraint
    }
    
    @discardableResult
    func bottomConstraint(_ baseView:UIView, constant:CGFloat) -> NSLayoutConstraint {
        self.applyConstraints()
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: constant)
        bottomConstraint.isActive = true
        return bottomConstraint
    }
    
    @discardableResult
    func widthConstraint(constraint:Constraint = .equal, equalTo:NSLayoutDimension? = nil, multiplier:CGFloat? = nil, constant:CGFloat = 0) -> NSLayoutConstraint {
        self.applyConstraints()
        var widthConstraint:NSLayoutConstraint!
        if constraint == .greater {
            if let multiplier = multiplier, let equalTo = equalTo {
                widthConstraint = self.widthAnchor.constraint(greaterThanOrEqualTo: equalTo, multiplier: multiplier, constant: constant)
            }else {
                widthConstraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        }else if constraint == .less {
            if let multiplier = multiplier, let equalTo = equalTo {
                widthConstraint = self.widthAnchor.constraint(lessThanOrEqualTo: equalTo, multiplier: multiplier, constant: constant)
            }else {
                widthConstraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: constant)
            }
        }else {
            if let multiplier = multiplier, let equalTo = equalTo {
                widthConstraint = self.widthAnchor.constraint(equalTo: equalTo, multiplier: multiplier, constant: constant)
            }else {
                widthConstraint = self.widthAnchor.constraint(equalToConstant: constant)
            }
        }
        widthConstraint.isActive = true
        return widthConstraint
    }
    
    @discardableResult
    func heightConstraint(constraint:Constraint = .equal, equalTo:NSLayoutDimension? = nil, multiplier:CGFloat? = nil, constant:CGFloat = 0) -> NSLayoutConstraint {
        self.applyConstraints()
        var heightConstraint:NSLayoutConstraint!
        if constraint == .greater {
            if let multiplier = multiplier, let equalTo = equalTo {
                heightConstraint = self.heightAnchor.constraint(greaterThanOrEqualTo: equalTo, multiplier: multiplier, constant: constant)
            }else {
                heightConstraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        }else if constraint == .less {
            if let multiplier = multiplier, let equalTo = equalTo {
                heightConstraint = self.heightAnchor.constraint(lessThanOrEqualTo: equalTo, multiplier: multiplier, constant: constant)
            }else {
                heightConstraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            }
        }else {
            if let multiplier = multiplier, let equalTo = equalTo {
                heightConstraint = self.heightAnchor.constraint(equalTo: equalTo, multiplier: multiplier, constant: constant)
            }else {
                heightConstraint = self.heightAnchor.constraint(equalToConstant: constant)
            }
        }
        heightConstraint.isActive = true
        return heightConstraint
    }
    
    @discardableResult
    func constraintBounds(_ baseView:UIView,isTop:Bool = true, isLeading:Bool = true, isTrailing:Bool = true, isBottom:Bool = true,
                          complition: (() -> Void)? = nil) -> UIView {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 0).isActive = isTop
        self.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 0).isActive = isLeading
        self.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: 0).isActive = isTrailing
        self.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 0).isActive = isBottom
        
        if let complition = complition {
            self.dispatchDelay {
                complition()
            }
        }
        return self
    }
    
    @discardableResult
    func constraint(t topAnchor:NSYAnchor? = nil, tC topAnchorConstant:CGFloat? = nil,
                    l leadingAnchor:NSXAnchor? = nil, lC leadingAnchorConstant:CGFloat? = nil,
                    tr trailingAnchor:NSXAnchor? = nil, trC trailingAnchorConstant:CGFloat? = nil,
                    b bottomAnchor:NSYAnchor? = nil, bC bottomAnchorConstant:CGFloat? = nil,
                    w width:CGFloat? = nil, wG widthGreater:CGFloat? = nil, wL widthLess:CGFloat? = nil,
                    h height:CGFloat? = nil, hG heightGreater:CGFloat? = nil, hL heightLess:CGFloat? = nil,
                    complition: (() -> Void)? = nil) -> UIView {
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = topAnchor, let constant = topAnchorConstant {
            self.topAnchor.constraint(equalTo: top, constant: constant).isActive = true
        }
        
        if let leading = leadingAnchor, let constant = leadingAnchorConstant {
            self.leadingAnchor.constraint(equalTo: leading, constant: constant).isActive = true
        }
        
        if let trailing = trailingAnchor, let constant = trailingAnchorConstant {
            self.trailingAnchor.constraint(equalTo: trailing, constant: constant).isActive = true
        }
        
        if let bottom = bottomAnchor, let constant = bottomAnchorConstant {
            self.bottomAnchor.constraint(equalTo: bottom, constant: constant).isActive = true
        }
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }else if let width = widthGreater {
            self.widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
        }else if let width = widthLess {
            self.widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
        }
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }else if let height = heightGreater {
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
        }else if let height = heightLess {
            self.heightAnchor.constraint(lessThanOrEqualToConstant: height).isActive = true
        }
        
        self.clipsToBounds = true
        
        if let complition = complition {
            self.dispatchDelay {
                complition()
            }
        }
        
        return self
    }
}


//MARK:- Enum

public enum Constraint {
    case greater
    case less
    case equal
}

public enum NotificationStyle {
    case t2D
    case r2L
    case l2R
    case t2DDetails
    case r2LDetails
    case l2RDetails
    case t2DImageDetails
    case r2LImageDetails
    case l2RImageDetails
}


//MARK:- Class

class TapGestureRecognizer: UITapGestureRecognizer {
    lazy var action : ((TapGestureRecognizer)->Void)? = nil
}

class LongPressGestureRecognizer: UILongPressGestureRecognizer {
    lazy var action : ((LongPressGestureRecognizer)->Void)? = nil
}

class ViewActiveLongReading: UIView {    
}
