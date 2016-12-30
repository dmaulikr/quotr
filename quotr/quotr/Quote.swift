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
    
    init() {
        self.content = "This is a default quote. There are many like it but this one is mine."
        self.author = "Henry M Ly"
        self.id = 0221
    }
    
    init(content: String, author: String, id: Int) {
        self.content = content
        self.author = author
        self.id = id
    }
    
    init(json: JSON) {
        self.content = json["content"] as! String
        self.author = json["author"] as! String
        self.id = json["id"] as! Int
    }
    
}
