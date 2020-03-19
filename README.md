```swift
Under Developement ......
```
# NotificationAlertBanner
NotificationAlertBanner

![NAB_A_1](https://user-images.githubusercontent.com/52282676/77061042-a0964100-69ff-11ea-8c23-5b232de6763e.gif)


### Style

| Type | Type | Type |
|---|---|---|
|1. t2D | 2. r2L | 3. l2R |
|4. t2DDetails | 5. r2LDetails | 6. l2RDetails |
|7. t2DImageDetails | 8. r2LImageDetails | 9. l2RImageDetails |

## Usage
 
Firstly, import NotificationAlertBanner.

```swift
import NotificationAlertBanner
```
### Initialization

```swift
NotificationAlertBanner.add(style: .t2D, title: "title", details: "details", logoImage: UIImage(named: "logo_image"), informationImage: UIImage(named: "information_image"))
```

```swift
import UIKit
import NotificationAlertBanner

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        button.center = view.center
        view.addSubview(button)
    }

    @objc func btnClick(sender:UIButton) {
        NotificationAlertBanner.add(style: .t2D, title: "title", details: "details", logoImage: UIImage(named: "logo_image"), informationImage: UIImage(named: "information_image"))
    }
}
```

### Modify
```swift
 NotificationAlertBanner.bannerBackGroundColor = UIColor.white
 NotificationAlertBanner.bannerTitleFontColor = UIColor.black
 NotificationAlertBanner.bannerDetailsFontColor = UIColor.red
 NotificationAlertBanner.bannerBackGroundImage = UIImage(named: "background_image")
 NotificationAlertBanner.bannerBorderColor = .black
 NotificationAlertBanner.bannerBorderWidth = 2
 NotificationAlertBanner.bannerTitleFontName = "MarkerFelt-Thin"
 NotificationAlertBanner.bannerDetailsFontName = "MarkerFelt-Thin"
```
### Installation with CocoaPods

```
pod 'NotificationAlertBanner', '0.0.9'
```
