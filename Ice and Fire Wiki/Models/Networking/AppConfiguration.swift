//
//  AppConfiguration.swift
//  Ice and Fire Wiki
//
//  Created by Dubois Grayson on 8/30/18.
//  Copyright © 2018 Mellow Cobra. All rights reserved.
//

import Foundation

enum DataEndpoint: String {
    case Houses = "housesEndpoint"
}

class AppConfiguration {
    
    // MARK: AppConfiguration Singleton
    static let shared = AppConfiguration()
    
    fileprivate var configurationData: NSDictionary {
        guard let path = Bundle.main.path(forResource:"config", ofType: "plist"), let data = NSDictionary(contentsOfFile: path) else {
            return NSDictionary()
        }
        
        return data
    }
    
    var baseApiUrl: URL! {
        if let urlString = configurationData.value(forKey: "baseApiUrl") as? String {
            return URL(string: urlString)
        } else {
            return URL(string: "")
        }
    }
    
    func endpoint(_ endpointType: DataEndpoint) -> String {
        return configurationData.value(forKey: endpointType.rawValue) as! String
    }
}
