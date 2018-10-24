//
//  HouseCell.swift
//  Ice and Fire Wiki
//
//  Created by Dubois Grayson on 8/30/18.
//  Copyright © 2018 Mellow Cobra. All rights reserved.
//

import UIKit

class HouseCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    func configureWithHouse(_ house: House) {
        nameLabel.text = house.name
        regionLabel.text = house.region
    }

}
