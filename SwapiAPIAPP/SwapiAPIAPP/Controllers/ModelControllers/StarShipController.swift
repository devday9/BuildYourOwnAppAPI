//
//  StarShipController.swift
//  SwapiAPIAPP
//
//  Created by Deven Day on 9/23/20.
//

import Foundation

struct StringConstants {
    fileprivate static let baseURL = "https://swapi.dev/api"
    fileprivate static let starShipsEndpoint = "starships"
    fileprivate static let jsonExtension = ".json"
}

class StarShipController {
    
    static func fetchStarShip(completion: @escaping (Result<[SecondLevelObjects], StarShipError>) -> Void) {
        guard let baseURL = URL(string: StringConstants.baseURL) else {return completion(.failure(.invalidURL))}
        let starShipsEndpointURL = baseURL.appendingPathComponent(StringConstants.starShipsEndpoint)
        let finalURL = starShipsEndpointURL.appendingPathComponent(StringConstants.jsonExtension)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let secondLevelObjects = topLevelDictionary.results
                return completion(.success(secondLevelObjects))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
}//END OF CLASS
