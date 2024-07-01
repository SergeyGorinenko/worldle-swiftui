//
//  APICountry.swift
//
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import Foundation

// MARK: - APICountry

public struct APICountry: Codable {
    public let code: String
    public let name: String
    public let latitude: Double
    public let longitude: Double
}
