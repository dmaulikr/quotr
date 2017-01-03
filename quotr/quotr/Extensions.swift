//
//  Extensions.swift
//  quotr
//
//  Created by Henry Ly on 1/3/17.
//  Copyright © 2017 Henry M Ly. All rights reserved.
//

import UIKit

// MARK: - Make colors easier

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}

// MARK: - Help make constraints easier

extension UIView {
    
    func makeConstraints(with format: String, views: UIView...) {
        var viewsDictionary: [String: UIView] = [:]
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
