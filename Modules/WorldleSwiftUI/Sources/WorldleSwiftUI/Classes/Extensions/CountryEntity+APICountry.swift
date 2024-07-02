//
//  CountryEntity+APICountry.swift
//
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import CoreLocation
import WorldleCore
import WorldleAPI

extension CountryEntity {
    
    init(with country: APICountry) {
        self.init(
            id: country.code,
            name: country.name,
            location: CLLocation(latitude: country.latitude, longitude: country.longitude)
        )
    }

    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/gist/smoroden/4599bfcde936165187d7476cfc148101/raw/366b16d7d82a7d6ed9500cc3cddd6c8a57bb1076/\(id.lowercased()).svg")
    }
    
}
