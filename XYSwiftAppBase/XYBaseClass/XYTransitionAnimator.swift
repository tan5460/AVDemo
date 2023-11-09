//
//  XYTransitionAnimator.swift
//  AVDemo
//
//  Created by YJ on 2023/11/4.
//

import UIKit

class XYTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var transitionType: XYTransitionType = .navigationController(.none)
    
    init(transitionType: XYTransitionType) {
        super.init()
        self.transitionType = transitionType
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        
        containerView.addSubview(toView!)
        let width = containerView.frame.width
        
        var fromViewToTransform : CGAffineTransform = .identity
        var toViewStartTransform : CGAffineTransform = .identity
        switch transitionType {
        case .navigationController(let operation):
            switch operation {
            case .push:
                fromViewToTransform = CGAffineTransformMakeTranslation(-width, 0)
                fromViewToTransform = CGAffineTransformScale(fromViewToTransform, 0.1, 0.1)
                toViewStartTransform = CGAffineTransformMakeTranslation(width, 0)
                toViewStartTransform = CGAffineTransformScale(toViewStartTransform, 0.1, 0.1)
            case .pop:
                fromViewToTransform = CGAffineTransformMakeTranslation(width, 0)
                fromViewToTransform = CGAffineTransformScale(fromViewToTransform, 0.1, 0.1)
                toViewStartTransform = CGAffineTransformMakeTranslation(-width, 0)
                toViewStartTransform = CGAffineTransformScale(toViewStartTransform, 0.1, 0.1)
            default:
                fromViewToTransform = .identity
                toViewStartTransform = .identity
            }
        case .tabBarController(let direction):
            switch direction {
            case .left:
                fromViewToTransform = CGAffineTransformMakeTranslation(-width, 0)
                toViewStartTransform = CGAffineTransformMakeTranslation(width, 0)
            default:
                fromViewToTransform = CGAffineTransformMakeTranslation(width, 0)
                toViewStartTransform = CGAffineTransformMakeTranslation(-width, 0)
            }
       
        }
        
        toView?.transform = toViewStartTransform
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            fromView?.transform = fromViewToTransform
            toView?.transform = .identity
        } completion: { isFinished in
            fromView?.transform = .identity
            toView?.transform = .identity
            
            let isCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
    
}
