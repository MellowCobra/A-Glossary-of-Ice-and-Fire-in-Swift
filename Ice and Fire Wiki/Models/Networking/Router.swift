//
//  Router.swift
//  Ice and Fire Wiki
//
//  Created by Dubois Grayson on 8/30/18.
//  Copyright © 2018 Mellow Cobra. All rights reserved.
//

import Foundation
import Alamofire

enum RouterError: Error {
    case urlNotFound
}

enum Router: URLRequestConvertible {
    case houses
    case house(id: Int)
    
    // MARK: - Endpoint for the specified request type
    var endpoint: String {
        let config = AppConfiguration.shared
        
        switch self {
        case .houses: return config.endpoint(.Houses)
        case .house(_): return config.endpoint(.Houses)
        }
    }
    
    // MARK: - Fully-configured request by type
    func asURLRequest() throws -> URLRequest {
        guard let url = AppConfiguration.shared.baseApiUrl else {
            throw RouterError.urlNotFound
        }
        
        var fullUrl = url.appendingPathComponent(endpoint)
        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = "get"
        
        switch self {
        case .house(let id):
            fullUrl = fullUrl.appendingPathComponent("\(id)")
            urlRequest.url = fullUrl
            
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: [:])
        case .houses:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: [:])
        }
        
        return urlRequest
    }
}
