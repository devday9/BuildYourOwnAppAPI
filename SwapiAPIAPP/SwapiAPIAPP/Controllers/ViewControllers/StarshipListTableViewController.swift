//
//  StarshipListTableViewController.swift
//  SwapiAPIAPP
//
//  Created by Deven Day on 9/24/20.
//

import UIKit

class StarshipListTableViewController: UITableViewController {
    
    //MARK: - Properties
    var starships: [SecondLevelObjects] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       fetchStarships()
    }

    //MARK: - Helpers
    func fetchStarships() {
        StarShipController.fetchStarShip { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let starships):
                    self.starships = starships
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return starships.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "starshipCell", for: indexPath) as? StarshipTableViewCell
        else {return UITableViewCell()}
        
        let starship = starships[indexPath.row]
        cell.starship = starship

        return cell
    }
}//END OF CLASS
