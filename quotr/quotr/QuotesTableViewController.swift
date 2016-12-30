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
        
        cell.contentLabel.text = ("\"\(eachQuote.content)\"")
        cell.authorLabel.text = eachQuote.author
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func fetchQuotes() {
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
                        print(each)
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            self.refreshTableView()
            }.resume()
    }

    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
