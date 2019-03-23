//
//  TestTransationDelegate.swift
//  TrasationDemo
//
//  Created by mr.zhou on 2019/3/23.
//  Copyright © 2019 mr.zhou. All rights reserved.
//

import UIKit

class TestTransationDelegate: NSObject, UIViewControllerTransitioningDelegate {
    var controller: TestTransationManagee!
    var interactiveTransition: UIPercentDrivenInteractiveTransition!
    init(from: UIViewController, to: UIViewController) {
        controller = TestTransationManagee(presentedViewController: to, presenting: from)
        
        interactiveTransition = UIPercentDrivenInteractiveTransition()
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(change), name: Notification.Name("change"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(end), name: Notification.Name("end"), object: nil)

    }
    
    @objc func change(noti: Notification) {
        
        let percent = noti.object as! NSNumber
        let float = percent.doubleValue
        interactiveTransition.update(CGFloat(float))
        
    }
    
    @objc func end(noti: Notification) {
        
        let percent = noti.object as! NSNumber
        let float = percent.doubleValue

        if (float > 0.5) {
            self.interactiveTransition.finish()
        } else {
            self.interactiveTransition.cancel()
        }
    }
    
//    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return interactiveTransition
//    }


    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactiveTransition
    }
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TestAnimator()
    }
    
    
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TestAnimator()
    }
    
    
    
    
//     public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//            return controller
//    }
    
}
