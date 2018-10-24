//
//  House.swift
//  Ice and Fire Wiki
//
//  Created by Dubois Grayson on 8/30/18.
//  Copyright © 2018 Mellow Cobra. All rights reserved.
//

import Foundation
import SwiftyJSON

class House {
    
    // MARK: - Data properties
    var name: String
    var region: String
    var coatOfArms: String
    var words: String?
    
    // MARK: - Initializers
    init(name: String, region: String, coatOfArms: String, words: String?) {
        self.name = name
        self.region = region
        self.coatOfArms = coatOfArms
        self.words = words
    }
    
    init(fromJson json: JSON) {
        self.name = json["name"].stringValue
        self.region = json["region"].stringValue
        self.coatOfArms = json["coatOfArms"].stringValue
        self.words = json["words"].stringValue
    }
    
    // MARK: - Static JSON to House Array method
    static func collection(from data: [JSON]?) -> [House] {
        var houses = [House]() // Initialize a new array of Houses
        
        if let jsonArray = data {
            for object in jsonArray {
                let house = House(fromJson: object)
                houses.append(house)
            }
        }
        
        return houses
    }
}
