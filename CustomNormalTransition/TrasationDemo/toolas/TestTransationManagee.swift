//
//  TestTransationManagee.swift
//  TrasationDemo
//
//  Created by mr.zhou on 2019/3/23.
//  Copyright © 2019 mr.zhou. All rights reserved.
//

import UIKit

class TestTransationManagee: UIPresentationController {

    
    
    let dimmingView = UIView()
    
    open override func containerViewWillLayoutSubviews() {
        
    }
    
    open override func containerViewDidLayoutSubviews() {
        
    }

    open override func presentationTransitionWillBegin() {
        
        dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        dimmingView.alpha = 0.0
        
        containerView?.addSubview(dimmingView)
        dimmingView.frame = containerView?.bounds ?? CGRect.zero
        
        containerView?.addSubview(presentedViewController.view)
        presentedViewController.view.frame = CGRect(x: 0, y: containerView?.bounds.size.height ?? 0, width: containerView?.bounds.size.width ?? 0, height: (containerView?.bounds.size.height ?? 0 - 100))
        
        print("\(String(describing: self.containerView?.frame))")
        
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { (context) in
                self.dimmingView.alpha = 1
                self.presentedViewController.view.frame = CGRect(x: 0, y: 100, width: self.containerView?.bounds.size.width ?? 0, height: (self.containerView?.bounds.size.height ?? 0) - 100)
                print("\(self.presentedViewController.view.frame)")
            }) { (context) in
                
            }
        }
        
    }
    
    open override func presentationTransitionDidEnd(_ completed: Bool) {
        
    }
    
    open override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { (context) in
                self.dimmingView.alpha = 0
                self.presentedViewController.view.frame = CGRect(x: 0, y: self.containerView?.bounds.size.height ?? 0, width: self.containerView?.bounds.size.width ?? 0, height: (self.containerView?.bounds.size.height ?? 0) - 100)
            }) { (context) in
                
            }
        }
        
    }
    
    open override func dismissalTransitionDidEnd(_ completed: Bool) {
        
    }
    

    
}
