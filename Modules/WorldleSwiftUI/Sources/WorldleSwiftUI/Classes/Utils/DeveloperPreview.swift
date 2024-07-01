//
//  DeveloperPreview.swift
//
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import Foundation
import WorldleAPI

public class DeveloperPreview {
    
    public static let shared = DeveloperPreview()
    private init() {}
    
    public let appViewModel: WorldleAppViewModel = WorldleAppViewModel(baseURL: Bundle.module.url(forResource: "countries", withExtension: "json")!.deletingLastPathComponent().absoluteString)
    
    let guesses: [GuessModel] = [
        GuessModel(countryName: "United States", direction: .downLeft, distance: 2463, distancePercentage: 85.37, done: true),
        GuessModel(countryName: "Ukraine", direction: .upRight, distance: 98, distancePercentage: 98.37, done: true),
        GuessModel(countryName: "Georgia", direction: .left, distance: 5946, distancePercentage: 54.37, done: true),
        GuessModel(),
        GuessModel(),
        GuessModel()
    ]
    
}
