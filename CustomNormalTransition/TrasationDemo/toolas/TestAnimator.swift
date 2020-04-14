//
//  TestAnimator.swift
//  TrasationDemo
//
//  Created by mr.zhou on 2019/3/24.
//  Copyright © 2019 mr.zhou. All rights reserved.
//

import UIKit

class TestAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // This is used for percent driven interactive transitions, as well as for
    // container controllers that have companion animations that might need to
    // synchronize with the main animation.
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        if toVC?.presentingViewController != nil {
            // present
            if let toView = toVC?.view {
                containerView.addSubview(toView)
                toView.frame = CGRect(x: 0, y: containerView.bounds.size.height , width: containerView.bounds.size.width , height: (containerView.bounds.size.height ) - 100)

                
                UIView.animate(withDuration: 0.25, animations: {
                    toView.frame = CGRect(x: 0, y: 100, width: containerView.bounds.size.width, height: (containerView.bounds.size.height ) - 100)
                }) { (finish) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            }
            
        } else {
            // dismiss
            
            if let fromView = fromVC?.view {
            
                UIView.animate(withDuration: 0.25, animations: {
                    fromView.frame = CGRect(x: 0, y: containerView.bounds.size.height , width: containerView.bounds.size.width , height: (containerView.bounds.size.height ) - 100)
                }) { (finish) in
                    print("transitionWasCanceled========>> \(transitionContext.transitionWasCancelled)")
                    
                    // 如果不根据wasCanceled 来判断完成变化, 则fromView 会被强制移除,出现bug
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            }
        }
    }
    
    public func animationEnded(_ transitionCompleted: Bool) {
        print("ended")
    }

}
