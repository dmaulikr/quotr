//
//  Quote.swift
//  quotr
//
//  Created by Henry Ly on 12/29/16.
//  Copyright © 2016 Henry M Ly. All rights reserved.
//

import Foundation

final class Quote {
    
    // TODO: Implement class Quote Model
    var content: String
    var author: String
    var id: Int
    
    init(content: String, author: String, id: Int) {
        self.content = content
        self.author = author
        self.id = id
    }
    
    init(json: JSON) {
//        guard let content = json["content"] as? String, let author = json["author"] as? String, let id = json["id"] as? Int else { return }
        self.content = json["content"] as! String
        self.author = json["author"] as! String
        self.id = json["id"] as! Int
//        self.content = content
//        self.author = author
//        self.id = id
    }
    
}
