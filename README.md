```swift
Under Developement ......
```
# NotificationAlertBanner
NotificationAlertBanner

![alt tag](https://github.com/AnandKhanpara/GitProHubSupporting/blob/master/GitProHubSupporting/NAB/NAB_A_1.gif) 


## Style

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
```
pod 'NotificationAlertBanner', '0.0.8'
```
