//
//  BaseCell.swift
//  quotr
//
//  Created by Henry Ly on 1/3/17.
//  Copyright © 2017 Henry M Ly. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() { }
    
}
