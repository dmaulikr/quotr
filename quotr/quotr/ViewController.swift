//
//  ViewController.swift
//  quotr
//
//  Created by Henry Ly on 12/29/16.
//  Copyright © 2016 Henry M Ly. All rights reserved.
//

import UIKit
import Foundation

typealias JSON = [String:Any]

class ViewController: UIViewController {

    var quotesArray = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuotes()
    }

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
                        print("⚡️⚡️⚡️⚡️⚡️")
                        print(each)
                        print("⚡️⚡️⚡️⚡️⚡️")
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            print("💦💦💦💦💦")
            print(self.quotesArray)
            print("💦💦💦💦💦")
        }.resume()
    }

}

