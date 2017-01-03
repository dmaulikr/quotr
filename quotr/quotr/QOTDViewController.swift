//
//  QOTDViewController.swift
//  quotr
//
//  Created by Henry Ly on 12/29/16.
//  Copyright © 2016 Henry M Ly. All rights reserved.
//

import UIKit

class QOTDViewController: UIViewController {

    @IBOutlet weak var qotdLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchLatestQuote()
    }
    
    func setupView() {
        self.qotdLabel.alpha = 0
        self.contentLabel.alpha = 0
        self.authorLabel.alpha = 0
    }

    func fetchLatestQuote() {
        ApiService.sharedInstance.fetchQuotes { (quotes) in
            let latestQuote = quotes.last
            self.contentLabel.text = latestQuote?.content
            self.authorLabel.text = latestQuote?.author.uppercased()
            
            UIView.animate(withDuration: 2.0, animations: {
                self.qotdLabel.alpha = 1
                self.contentLabel.alpha = 1
                self.authorLabel.alpha = 1
            })
        }
    }
    
}
