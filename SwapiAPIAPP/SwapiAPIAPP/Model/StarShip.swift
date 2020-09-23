//
//  StarShip.swift
//  SwapiAPIAPP
//
//  Created by Deven Day on 9/23/20.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let results: [SecondLevelObjects]
}

struct SecondLevelObjects: Decodable {
    let model: String
    let passengers: String
    let maxSpeed: String
    
    enum CodingKeys: String, CodingKey {
        case model
        case passengers
        case maxSpeed = "max_atmosphering_speed"
    }
}
