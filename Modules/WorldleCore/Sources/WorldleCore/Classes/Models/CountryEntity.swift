//
//  CountryEntity.swift
//
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import CoreLocation
import Foundation

public struct CountryEntity: Identifiable, Hashable {
    public let id: String
    public let name: String
    public let location: CLLocation
    
    public init(id: String, name: String, location: CLLocation) {
        self.id = id
        self.name = name
        self.location = location
    }
    
}
