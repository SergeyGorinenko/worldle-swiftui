//
//  GetCountriesAPI.swift
//  
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import Foundation

// MARK: - GetCountriesAPI

public class GetCountriesAPI {

    public static func getCountries(baseURL: String) async throws -> [APICountry] {
        let apiURL = URL(string: baseURL + "countries.json")!

        let (data, _) = try await URLSession.shared.data(from: apiURL)
        if let decodedResponse = try? JSONDecoder().decode([APICountry].self, from: data) {
            return decodedResponse
        } else {
            throw WorldleAPIError.parsing
        }
    }

}