//
//  GuessModel.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import WorldleCore

struct GuessModel: Hashable {

    private enum Constants {
        static let sectionDegree = 22.5
    }
    
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
        
        static func direction(with bearing: Double) -> Direction {
            if Constants.sectionDegree <= bearing && bearing < 3 * Constants.sectionDegree {
                return .upRight
            } else if 3 * Constants.sectionDegree <= bearing && bearing < 5 * Constants.sectionDegree {
                return .right
            } else if 5 * Constants.sectionDegree <= bearing && bearing < 7 * Constants.sectionDegree {
                return .downRight
            } else if 7 * Constants.sectionDegree <= bearing && bearing < 9 * Constants.sectionDegree {
                return .down
            } else if 9 * Constants.sectionDegree <= bearing && bearing < 11 * Constants.sectionDegree {
                return .downLeft
            } else if 11 * Constants.sectionDegree <= bearing && bearing < 13 * Constants.sectionDegree {
                return .left
            } else if 13 * Constants.sectionDegree <= bearing && bearing < 15 * Constants.sectionDegree {
                return .upLeft
            } else {
                return .up
            }
        }
    }
    
    let country: CountryEntity?
    let direction: Direction
    let distance: Double // meters
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
