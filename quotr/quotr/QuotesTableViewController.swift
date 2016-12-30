//
//  QuotesTableViewController.swift
//  quotr
//
//  Created by Henry Ly on 12/29/16.
//  Copyright © 2016 Henry M Ly. All rights reserved.
//

import UIKit

typealias JSON = [String:Any]

class QuotesTableViewController: UITableViewController {
    
    var quotesArray = [Quote]()
    
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
        return quotesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteTableViewCell
    
        let eachQuote = quotesArray[indexPath.row]
        
        cell.contentLabel.text = eachQuote.content
        cell.authorLabel.text = eachQuote.author.uppercased()
        
        return cell
    }

    func setupView() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.93, green:0.59, blue:0.49, alpha:1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
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
                } catch let error as NSError {
                    print(error)
                }
            }
            self.quotesArray.reverse()
            self.refreshTableView()
        }.resume()
    }

    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
