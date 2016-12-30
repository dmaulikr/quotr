//
//  QOTDViewController.swift
//  quotr
//
//  Created by Henry Ly on 12/29/16.
//  Copyright © 2016 Henry M Ly. All rights reserved.
//

import UIKit

class QOTDViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var quotesArray = [Quote]()
    var qotd = Quote()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuotes()
    }

    func fetchQuotes() {
        quotesArray.removeAll()
        
        let urlString = "https://protected-cove-92007.herokuapp.com/all"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error ?? "Error parsing JSON")
            } else {
                do {
                    let quotes = try JSONSerialization.jsonObject(with: data!, options: []) as! [JSON]
                    
                    for each in quotes {
                        let newQuote = Quote(json: each)
                        self.quotesArray.append(newQuote)
                    }
                    guard let latestQuote = quotes.last else { return }
                    self.qotd = Quote(json: latestQuote)
                    self.contentLabel.text = self.qotd.content
                    self.authorLabel.text = self.qotd.author.uppercased()
                } catch let error as NSError {
                    print(error)
                }
            }
        }.resume()
    }
    
}
