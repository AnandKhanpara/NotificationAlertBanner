# NotificationAlertBanner
NotificationAlertBanner
```
pod 'NotificationAlertBanner', '0.0.4'
```
## Style

| Type | Type | 
|---|---|
|1. topToDown | 2. rightToLeft |
|![alt tag](https://raw.githubusercontent.com/AnandKhanpara/NotificationAlertBanner/master/NotificationAlertBanner/Assets/BannerTopToDownNew.gif) |![alt tag](https://raw.githubusercontent.com/AnandKhanpara/NotificationAlertBanner/master/NotificationAlertBanner/Assets/BannerRightToLeftNew.gif)|

## Usage
 
Firstly, import NotificationAlertBanner.

```swift
import NotificationAlertBanner
```
## Initialization

```swift
NotificationAlertBanner.add(style: .topToDown, title: "title", details: "details", image: UIImage(named: "image"))
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
        NotificationAlertBanner.add(style: .topToDown, title: "title", details: "details", image: UIImage(named: "image"))
    }
}
```

