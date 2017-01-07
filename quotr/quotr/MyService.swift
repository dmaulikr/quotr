//
//  MyService.swift
//  quotr
//
//  Created by Henry Ly on 1/6/17.
//  Copyright © 2017 Henry M Ly. All rights reserved.
//

import Moya

enum MyService {
    
    case all
    case deleteFirst
    
}

// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    
    var baseURL: URL { return URL(string: "https://protected-cove-92007.herokuapp.com")! }
    
    var path: String {
        switch self {
        case .all:
            return "/all"
        case .deleteFirst:
            return "/delete-first"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .all, .deleteFirst:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .all, .deleteFirst:
            return nil
        }
    }
    
    var sampleData: Data {
        switch self {
        case .all:
            return "{\"author\": \"Sample Data\", \"content\": \"This is sample data.\", \"id\": 000}".data(using: .utf8)!
        case .deleteFirst:
            return "{\"author\": \"First Quote\", \"content\": \"This is the first quote for sample data\", \"id\": 000}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .all, .deleteFirst:
            return .request
        }
    }
    
    // Not in tutorial
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .all, .deleteFirst:
            return URLEncoding()
        }
    }
    
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        switch self {
        case .all, .deleteFirst:
            return false
        }
    }
    
}

// MARK: - Helpers
private extension String {
    
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
    
}
