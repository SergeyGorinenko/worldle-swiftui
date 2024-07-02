//
//  GuessModel.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import WorldleCore

struct GuessModel: Hashable {

    enum Direction {
        case up, upRight, right, downRight, down, downLeft, left, upLeft
        
        var icon: String {
            switch self {
            case .up: return "arrow.up"
            case .upRight: return "arrow.up.right"
            case .right: return "arrow.right"
            case .downRight: return "arrow.down.right"
            case .down: return "arrow.down"
            case .downLeft: return "arrow.down.left"
            case .left: return "arrow.left"
            case .upLeft: return "arrow.up.left"
            }
        }
    }
    
    let country: CountryEntity?
    let direction: Direction
    let distance: Double
    let distancePercentage: Double
    let done: Bool
    
    init(country: CountryEntity? = nil, direction: Direction = .up, distance: Double = 0, distancePercentage: Double = 0) {
        self.country = country
        self.direction = direction
        self.distance = distance
        self.distancePercentage = distancePercentage
        self.done = (country != nil)
    }

}
