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
    
    let bgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 2
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = FlatUIColors.clouds
        
        imageView.image = UIImage(named: "steve_jobs")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        
        return imageView
    }()
    
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

        addSubview(bgView)
        bgView.addSubview(profileImageView)
        bgView.addSubview(contentLabel)
        bgView.addSubview(authorLabel)
        
        bgView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview().offset(-32)
        }
        
        profileImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(contentLabel.snp.top).offset(-32)
            make.height.width.lessThanOrEqualTo(150)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-64)
        }
        
        authorLabel.snp.makeConstraints { (make) in
            make.centerX.width.equalToSuperview()
            make.top.equalTo(contentLabel.snp.bottom).offset(16)
        }
    }
    
}
