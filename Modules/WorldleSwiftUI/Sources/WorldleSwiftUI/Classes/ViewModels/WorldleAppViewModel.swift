//
//  WorldleAppViewModel.swift
//  
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import Foundation
import WorldleCore
import WorldleAPI

public class WorldleAppViewModel: ObservableObject {

    // MARK: - State properties

    @MainActor @Published var countries: [CountryEntity] = []
    @MainActor @Published var isLoading: Bool = false

    // MARK: - Private properties

    // MARK: - Public properties

    private let baseURL: String

    // MARK: - Public methods

    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func loadCountries() async {
        await MainActor.run {
            isLoading = true
        }
        
        if let countries = try? await GetCountriesAPI.getCountries(baseURL: baseURL).map({ CountryEntity(with: $0) }) {
            await MainActor.run { [weak self] in
                self?.countries = countries
                self?.isLoading = false
            }
        }
    }

    // MARK: - Private methods

}
