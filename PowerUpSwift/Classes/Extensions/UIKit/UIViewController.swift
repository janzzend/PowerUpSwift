//
//  UIViewController.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

extension UIViewController {
    /// PowerUpSwift: Hides the keyboard when tapped outside the text field.
    public func dismissKeyboardWhenTappedOutside() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    /// PowerUpSwift: A syntactic sugar to access UIViewController's `navigationController` property.
    /// - Some developers name their view controllers with something like `someVC` instead of `someViewController`.
    /// - This comes in handy since it will make the code more streamlined.
    public var navVC: UINavigationController? {
        return self.navigationController
    }
    
    /// PowerUpSwift: [OBSOLETED] Present a view controller full screen no matter what.
    @available(iOS, obsoleted: 13.0, message: "This will no longer work starting in iOS 13.")
    public func showInFullScreen(completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let window = UIWindow(frame: UIScreen.main.bounds)
            
            // Add a way fill the screen entirely for iPhone X, Xs, Xs Max, or Xr as well
            // See: https://stackoverflow.com/a/46549624 and https://stackoverflow.com/a/46192822
            switch UIScreen.main.nativeBounds.height {
            case 2436 /* X, Xs */, 2688 /* Xs Max */, 1792 /* Xr */:
                if #available(iOS 11.0, *) {
                    window.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + window.safeAreaInsets.bottom)
                }
            default:
                break
            }
            
            let viewController = UIViewController()
            viewController.view.backgroundColor = .clear
            window.rootViewController = viewController
            window.windowLevel = UIWindow.Level.alert + 1 // TODO: Apple, please fix this
            window.makeKeyAndVisible()
            viewController.present(self, animated: true, completion: completion)
        }
    }
}
