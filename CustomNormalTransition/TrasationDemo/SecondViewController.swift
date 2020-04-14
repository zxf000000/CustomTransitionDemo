
//
//  SecondViewController.swift
//  TrasationDemo
//
//  Created by mr.zhou on 2019/3/23.
//  Copyright © 2019 mr.zhou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let button = UIButton()
    var totalHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        self.view.addSubview(button)
        
        self.view.layer.cornerRadius = 20.0
        

        
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 0.3
        self.view.layer.shadowOffset = CGSize(width: 0, height: -10.0)
        
        let panges = UIPanGestureRecognizer(target: self, action: #selector(panGes))
        self.view.addGestureRecognizer(panges)
        
        totalHeight = self.view.bounds.size.height - 100

        
    }
    
    override func viewDidLayoutSubviews() {
        
        button.center = self.view.center
        button.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
        button.backgroundColor = UIColor.red
        button.setTitle("dismiss", for: .normal)
        button.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
    }
    
    @objc func tapDismissButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func panGes(pan: UIPanGestureRecognizer) {
        let location = pan.location(in: self.view.window)
        
        print(location.y)
        
        let percent = (location.y - 100) / totalHeight;
        switch pan.state {
        case .possible:
            print("possible")
        case .began:
            print("began")
            self.dismiss(animated: true, completion: nil)
        
        case .changed:
            print("changed")
            print(percent)
            NotificationCenter.default.post(name: Notification.Name(rawValue: "change"), object: NSNumber(value: Double(percent)))

        case .ended:
            print("ended")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "end"), object: NSNumber(value: Double(percent)))

        case .cancelled:
            print("cancelled")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "end"), object: NSNumber(value: Double(percent)))

        case .failed:
            print("failed")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "end"), object: NSNumber(value: Double(percent)))

        }
    }
    
    func setupUI() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
