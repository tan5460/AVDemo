//
//  XYTransitionDelegate.swift
//  AVDemo
//
//  Created by YJ on 2023/11/4.
//

import UIKit

enum XYTransitionType {
    case navigationController(UINavigationController.Operation)
    case tabBarController(XYTabBarTransitionDirection)
    
}

enum XYTabBarTransitionDirection {
    case left
    case right
}

class XYTransitionDelegate: NSObject, UINavigationControllerDelegate {

    var enableTransitionAnimate: Bool = true
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if enableTransitionAnimate {
            return XYTransitionAnimator(transitionType: .navigationController(operation))
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
