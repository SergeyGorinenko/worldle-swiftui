//
//  DeveloperPreview.swift
//
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import CoreLocation
import Foundation
import WorldleAPI
import WorldleCore

@MainActor
public class DeveloperPreview {
    
    public static let shared = DeveloperPreview()
    private init() {}
    
    public let appVM: WorldleAppViewModel = WorldleAppViewModel(baseURL: Bundle.module.url(forResource: "countries", withExtension: "json")!.deletingLastPathComponent().absoluteString)

    lazy var gameVM: WorldleGameViewModel = WorldleGameViewModel(countries: countries, countryToGuess: countries.first!)
    
    lazy var guesses: [GuessModel] = [
        GuessModel(country: countries[0], direction: .downLeft, distance: 2463, distancePercentage: 85.37),
        GuessModel(country: countries[1], direction: .upRight, distance: 98, distancePercentage: 98.37),
        GuessModel(country: countries[2], direction: .left, distance: 5946, distancePercentage: 54.37),
        GuessModel(),
        GuessModel(),
        GuessModel()
    ]

    let countries: [CountryEntity] = [
        CountryEntity(id: "US", name: "United States", location: CLLocation(latitude: 37.09024, longitude: -95.712891)),
        CountryEntity(id: "UA", name: "Ukraine", location: CLLocation(latitude: 48.379433, longitude: 31.16558)),
        CountryEntity(id: "GE", name: "Georgia", location: CLLocation(latitude: 42.315407, longitude: 43.356892))
    ]

}
