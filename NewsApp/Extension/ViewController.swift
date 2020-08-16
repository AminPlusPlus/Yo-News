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
            guard indicator.accessibilityIdentifier == "spinner" else {return}
            indicator.startAnimating()
            indicator.removeFromSuperview()
        }
    }
    
    func shareAcitivity(description : String, url : String ) {
        
        // Setting description
        let firstActivityItem = description

        // Setting url
        let secondActivityItem : NSURL = NSURL(string: url)!
        
        // If you want to use an image
        let image : UIImage = UIImage(named: "AppIcon")!
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
        


        // Pre-configuring activity items
        activityViewController.activityItemsConfiguration = [
        UIActivity.ActivityType.message
        ] as? UIActivityItemsConfigurationReading
        
        // Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
