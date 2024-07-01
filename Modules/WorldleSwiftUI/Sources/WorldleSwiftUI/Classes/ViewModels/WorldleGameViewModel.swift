//
//  WorldleGameViewModel.swift
//  
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import Foundation

public class WorldleGameViewModel: ObservableObject {

    private enum Constants {
        static let guessCount = 6
    }
    
    // MARK: - State properties

    @Published var guesses: [GuessModel] = [GuessModel](repeating: GuessModel(), count: Constants.guessCount)
    @Published var currGuessIndex: Int = 0
    @Published var totalGuesses: Int = Constants.guessCount

    // MARK: - Private properties

    // MARK: - Public properties

    // MARK: - Public methods

    // MARK: - Private methods

}
