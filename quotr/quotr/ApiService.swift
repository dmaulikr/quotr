//
//  ApiService.swift
//  quotr
//
//  Created by Henry Ly on 1/2/17.
//  Copyright © 2017 Henry M Ly. All rights reserved.
//

import UIKit

typealias JSON = [String: Any]

class ApiService {

    static let sharedInstance = ApiService()
    
    func fetchQuotes(completion: @escaping ([Quote]) -> Void) {
        let urlString = "https://protected-cove-92007.herokuapp.com/all"
        
        guard let url = URL(string: urlString) else {
            print("Unable to create a URL from urlString")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error downloading JSON")
                DispatchQueue.main.async {
                    completion([Quote(content: error?.localizedDescription ?? "Error downloading JSON", author: "HENRY M LY", id: 000)])
                }
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                var quotes: [Quote] = []
    
                for eachQuote in json as! [JSON] {
                    let newQuote = Quote(json: eachQuote)
                    quotes.append(newQuote)
                }
                DispatchQueue.main.async {
                    completion(quotes)
                }
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
    
}
