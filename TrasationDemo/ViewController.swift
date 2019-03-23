//
//  ViewController.swift
//  TrasationDemo
//
//  Created by mr.zhou on 2019/3/23.
//  Copyright © 2019 mr.zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()
    var transationDelegate: TestTransationDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        
        button.center = self.view.center
        button.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
        button.backgroundColor = UIColor.red
        button.setTitle("present", for: .normal)
        button.addTarget(self, action: #selector(tapPresentButton), for: .touchUpInside)
    }
    
    
    @objc func tapPresentButton() {
        
        
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .custom
        transationDelegate = TestTransationDelegate(from: self, to: secondVC)
        secondVC.transitioningDelegate = transationDelegate
        self.present(secondVC, animated: true, completion: nil)
    }

}

