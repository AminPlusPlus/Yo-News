//
//  ViewController.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func startSpinner(forView view:UIView, style : UIActivityIndicatorView.Style) {
        let indicator = UIActivityIndicatorView(style: style)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.accessibilityIdentifier = "spinner"
        
        view.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
        indicator.startAnimating()
    }
    
    func stopSpinner(forView view:UIView) {
        for case let indicator as UIActivityIndicatorView in view.subviews {
            print("Indicator")
            guard indicator.accessibilityIdentifier == "spinner" else {return}
            indicator.startAnimating()
            indicator.removeFromSuperview()
        }
    }
    
}
