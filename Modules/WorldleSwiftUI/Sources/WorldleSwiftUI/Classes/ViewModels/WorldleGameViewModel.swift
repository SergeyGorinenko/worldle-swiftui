//
//  WorldleGameViewModel.swift
//  
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import Combine
import SwiftUI
import WorldleCore

@MainActor
final class WorldleGameViewModel: ObservableObject {

    private enum Constants {
        static let guessCount = 6
    }
    
    // MARK: - State properties

    @Published private(set) var countries: [CountryEntity]
    @Published private(set) var filteredCountries: [CountryEntity] = []
    @Published private(set) var countryToGuess: CountryEntity
    @Published var guesses: [GuessModel] = [GuessModel](repeating: GuessModel(), count: Constants.guessCount)
    @Published var currGuessIndex: Int = 0
    @Published var totalGuesses: Int = Constants.guessCount
    @Published var searchText: String = ""
    @Published var selectedCountry: CountryEntity?

    // MARK: - Private properties

    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Public properties

    // MARK: - Public methods

    init(countries: [CountryEntity], countryToGuess: CountryEntity) {
        self.countries = countries
        self.countryToGuess = countryToGuess

        addSubscribers()
    }
    
    func confirmSelectedCountry() {
        guard let selectedCountry = selectedCountry else { return }
        guard currGuessIndex < Constants.guessCount else { return }

        let direction: GuessModel.Direction = .upLeft
        let distance: Double = 0
        let distancePercentage: Double = 0
        guesses[currGuessIndex] = GuessModel(country: selectedCountry, direction: direction, distance: distance, distancePercentage: distancePercentage)
        
        self.selectedCountry = nil
        currGuessIndex += 1
    }
    
    // MARK: - Private methods

    private func addSubscribers() {
        $searchText
            .sink { [weak self] (searchText) in
                guard let self = self else { return }

                if searchText.isEmpty {
                    self.filteredCountries = []
                } else {
                    self.filteredCountries = self.countries.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
                }
            }
            .store(in: &cancellables)

        $selectedCountry
            .sink { [weak self] (selectedCountry) in
                self?.searchText = ""
            }
            .store(in: &cancellables)
        
        $currGuessIndex
            .sink { [weak self] (currGuessIndex) in
                guard let self = self else { return }

                if self.currGuessIndex == Constants.guessCount {
                    
                }
            }
            .store(in: &cancellables)
    }

}
