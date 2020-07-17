//
//  UIView.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/17/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Add subviews from the array of UIView
    /// - Parameter views: [UIView]
    func addSubViews(_ views : [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
