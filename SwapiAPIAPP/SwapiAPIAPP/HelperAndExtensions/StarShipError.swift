//
//  StarShipError.swift
//  SwapiAPIAPP
//
//  Created by Deven Day on 9/23/20.
//

import Foundation

enum StarShipError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "The server failed to reach the necessary URL "
        case .thrownError(let error):
            return "There was an error: \(error.localizedDescription)"
        case .noData:
            return "No data found"
        case .unableToDecode:
            return "There was an error decoding the data"
        }
    }
}
