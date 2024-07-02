//
//  CountriesManager.swift
//  
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import Foundation
import WorldleCore
import WorldleAPI

final class CountriesManager {

    // MARK: - State properties

    // MARK: - Private properties

    // MARK: - Public properties

    private let baseURL: String

    // MARK: - Public methods

    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func loadAllCountries() async throws -> [CountryEntity] {
        try await GetCountriesAPI.getCountries(baseURL: baseURL).map({ CountryEntity(with: $0) })
    }

    // MARK: - Private methods

}
