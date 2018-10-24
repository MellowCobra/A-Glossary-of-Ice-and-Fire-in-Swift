//
//  DataManager.swift
//  Ice and Fire Wiki
//
//  Created by Dubois Grayson on 8/30/18.
//  Copyright © 2018 Mellow Cobra. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager {
    static let shared = DataManager()
    
    func getHouses(_ completion: @escaping (_ houses: [House]) -> ()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(Router.houses).responseJSON(completionHandler: { response -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let houses = House.collection(from: json.array ?? [JSON]())
                
                completion(houses)
            case .failure(let error):
                print("Failed to collect GET response in call to getHouses.\n\(error)")
            }
        })
    }
    
    func getHouse(id: Int, _ completion: @escaping (_ house: House) -> ()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(Router.house(id: id)).responseJSON() { response in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let house = House(fromJson: json)
                
                completion(house)
            case .failure(let error):
                print("Failed to collect GET response in call to getHouse.\n\(error)")
            }
        }
    }
}
