//
//  WorldleAppViewModel.swift
//  
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import SwiftUI
import WorldleCore
import WorldleAPI

@MainActor
public final class WorldleAppViewModel: ObservableObject {

    // MARK: - State properties

    @Published private(set) var countries: [CountryEntity] = []
    @Published private(set)var isLoading: Bool = false

    // MARK: - Private properties

    private let countriesManager: CountriesManager

    // MARK: - Public properties

    // MARK: - Public methods

    public init(baseURL: String) {
        self.countriesManager = CountriesManager(baseURL: baseURL)
    }

    func loadCountries() async throws {
        countries = try await countriesManager.loadAllCountries()
    }

    // MARK: - Private methods

}
