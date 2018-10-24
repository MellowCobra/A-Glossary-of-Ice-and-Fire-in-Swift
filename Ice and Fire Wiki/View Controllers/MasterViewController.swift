//
//  MasterViewController.swift
//  Ice and Fire Wiki
//
//  Created by Dubois Grayson on 8/30/18.
//  Copyright © 2018 Mellow Cobra. All rights reserved.
//

import UIKit

protocol HouseSelectionDelegate: class {
    func houseSelected(_ newHouse: House)
}

class MasterViewController: UITableViewController {
    
    // MARK: - Model
    var houses: [House] = [House]()
    weak var delegate: HouseSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        DataManager.shared.getHouses() { houses in
            
            self.houses = houses
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.houses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let house = self.houses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell", for: indexPath) as! HouseCell

        cell.configureWithHouse(house)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedHouse = houses[indexPath.row]
        delegate?.houseSelected(selectedHouse)
        
        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
