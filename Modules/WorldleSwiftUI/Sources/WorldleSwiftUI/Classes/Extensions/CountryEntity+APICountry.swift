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

}
