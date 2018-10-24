//
//  DetailViewController.swift
//  Ice and Fire Wiki
//
//  Created by Dubois Grayson on 8/30/18.
//  Copyright © 2018 Mellow Cobra. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var house: House? {
        didSet {
            refreshUI()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func refreshUI() {
        loadViewIfNeeded()
        
        if let house = self.house {
            nameLabel.text = house.name
            regionLabel.text = house.region
            wordsLabel.text = house.words
            coatOfArmsLabel.text = house.coatOfArms
        }
    }
    
}

extension DetailViewController: HouseSelectionDelegate {
    func houseSelected(_ newHouse: House) {
        house = newHouse
    }
}
