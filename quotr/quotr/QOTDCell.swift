//
//  QOTDCell.swift
//  quotr
//
//  Created by Henry Ly on 1/3/17.
//  Copyright © 2017 Henry M Ly. All rights reserved.
//

import UIKit
import SnapKit

class QOTDCell: BaseCell {
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Being the richest man in the cemetery doesn't matter to me. Going to bed at night saying we've done something wonderful, that's what matters to me."
        label.textColor = .black
        label.font = UIFont(name: "BodoniSvtyTwoITCTT-Book", size: 20.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "STEVE JOBS"
        label.textColor = FlatUIColors.salmon
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var quote: Quote? {
        didSet {
            contentLabel.text = quote?.content
            authorLabel.text = quote?.author.uppercased()
        }
    }

    override func setupViews() {
        super.setupViews()
        
        addSubview(contentLabel)
        addSubview(authorLabel)
        
        contentLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        authorLabel.snp.makeConstraints { (make) in
            make.centerX.width.equalToSuperview()
            make.top.equalTo(contentLabel.snp.bottom).offset(16)
        }
    }
    
}
