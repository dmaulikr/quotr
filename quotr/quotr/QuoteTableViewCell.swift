//
//  QuoteTableViewCell.swift
//  quotr
//
//  Created by Henry Ly on 12/29/16.
//  Copyright © 2016 Henry M Ly. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var quote: Quote? {
        didSet {
            contentLabel.text = quote?.content
            authorLabel.text = quote?.author.uppercased()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
