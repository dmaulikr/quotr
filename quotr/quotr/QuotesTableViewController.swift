//
//  QuotesTableViewController.swift
//  quotr
//
//  Created by Henry Ly on 12/29/16.
//  Copyright © 2016 Henry M Ly. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {
    
    var quotesArray: [Quote]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchQuotes()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotesArray?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteTableViewCell
    
        cell.quote = quotesArray?[indexPath.row]
        cell.contentLabel.alpha = 0
        cell.authorLabel.alpha = 0
        
        UIView.animate(withDuration: 2.0) {
            cell.contentLabel.alpha = 1
            cell.authorLabel.alpha = 1
        }
        
        return cell
    }

    func setupView() {
        // TODO: Setup this view
    }
    
    func fetchQuotes() {
        ApiService.sharedInstance.fetchQuotes { (quotes) in
            self.quotesArray = quotes
            self.quotesArray?.reverse()
            self.tableView.reloadData()
        }
    }

}
