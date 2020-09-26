//
//  StarshipTableViewCell.swift
//  SwapiAPIAPP
//
//  Created by Deven Day on 9/26/20.
//

import UIKit

class StarshipTableViewCell: UITableViewCell {

    //MARK: - OUtlets
    @IBOutlet weak var starshipModelLabel: UILabel!
    @IBOutlet weak var passengerLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    
    var starship: SecondLevelObjects? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Helper Functions/Methods
    func updateViews() {
        guard let starship = starship else {return}
        starshipModelLabel.text = "Starship Model:" + " " + starship.model
        passengerLabel.text = "Passenger Capacity:" + " " + starship.passengers
        velocityLabel.text = "Atmospheric Speed:" + " " + starship.maxSpeed
    }
    
    
    

}//END OF CLASS
