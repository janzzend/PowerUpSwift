//
//  UINavigationController.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//

import UIKit

extension UINavigationController {
    /// Adds a completion handler to `pushViewController(_, animated:)`.
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        self.pushViewController(viewController, animated: animated)

        guard animated, let coordinator = self.transitionCoordinator else {
            DispatchQueue.main.async { completion() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
    
    /// Adds a completion handler to `popViewController(animated:)`.
    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        self.popViewController(animated: animated)

        guard animated, let coordinator = self.transitionCoordinator else {
            DispatchQueue.main.async { completion() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
}
