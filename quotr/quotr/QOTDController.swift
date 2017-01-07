//
//  QOTDController.swift
//  quotr
//
//  Created by Henry Ly on 1/3/17.
//  Copyright © 2017 Henry M Ly. All rights reserved.
//

import UIKit
import Moya

class QOTDController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var quotes: [Quote]?
    
    let cellID = "cellID"
    
    
    // MARK: - Moya Tests
    
    let provider = MoyaProvider<MyService>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchQuotes()
        
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.hidesBarsOnSwipe = true
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        titleLabel.text = "qotd"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = FlatUIColors.clouds
        collectionView?.register(QOTDCell.self, forCellWithReuseIdentifier: cellID)
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! QOTDCell
        
        cell.quote = quotes?[indexPath.item]
        
        cell.shouldHideAllViews(true)
        
        UIView.animate(withDuration: 1.0) {
            cell.shouldHideAllViews(false)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func fetchQuotes() {
        provider.request(.all) { (result) in
            switch result {
            case let .success(moyaResponse):
                let statusCode = moyaResponse.statusCode
                print("⚡️⚡️⚡️⚡️⚡️")
                print(statusCode)
                print("⚡️⚡️⚡️⚡️⚡️")
    
                do {
                    let data = moyaResponse.data
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    var quotes: [Quote] = []
                    
                    for eachQuote in json as! [JSON] {
                        let newQuote = Quote(json: eachQuote)
                        quotes.append(newQuote)
                    }
                    
                    self.quotes = quotes.reversed()
                    self.collectionView?.reloadData()
                }
                catch {
                    print("Moya error")
                }
                
            case let .failure(error):
                print(error.errorDescription ?? "Moya error: Unable to download JSON")
            }
        }
    
    }
    
}
