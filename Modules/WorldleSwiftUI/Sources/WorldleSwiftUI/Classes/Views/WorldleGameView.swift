//
//  WorldleGameView.swift
//
//
//  Created by Serhii Horinenko on 29.06.2024.
//

import SwiftUI
import WorldleCore

public struct WorldleGameView: View {

    // MARK: - State properties
    
    @StateObject var gameVM: WorldleGameViewModel
    @Binding var showGame: Bool
    @State var showSearch: Bool = false

    // MARK: - Public properties

    public var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                headerView
                countryShapeView
                guessInputView
                guessesView
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor", bundle: Bundle.module))
        .fullScreenCover(isPresented: $showSearch, content: {
            CountrySearchView(showSearch: $showSearch)
                .environmentObject(gameVM)
        })
    }

    init(countries: [CountryEntity], countryToGuess: CountryEntity, showGame: Binding<Bool>) {
        _gameVM = StateObject(wrappedValue: WorldleGameViewModel(countries: countries, countryToGuess: countryToGuess))
        _showGame = showGame
    }

    // MARK: - Private properties

    private var headerView: some View {
        VStack(spacing: 8) {
            HStack {
                Image("WorldleIcon", bundle: Bundle.module)
                    .resizable()
                    .frame(width: 26, height: 26)
                
                HStack(spacing: 0) {
                    Text("WOR")
                        .foregroundStyle(Color("TextColor", bundle: Bundle.module))
                    Text("L")
                        .foregroundStyle(Color("TextSecondColor", bundle: Bundle.module))
                    Text("DLE")
                        .foregroundStyle(Color("TextColor", bundle: Bundle.module))
                }
                .font(.system(size: 36, weight: .bold, design: .default))
                .fontWeight(.bold)
            }

            DividerView()
        }
    }
    
    private var countryShapeView: some View {
        Image("US", bundle: Bundle.module)
            .resizable()
            .colorInvert()
            .foregroundStyle(.white)
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 50)
    }

    private var guessInputView: some View {
        GuessInputView(
            text: (gameVM.selectedCountry == nil) ? "" : gameVM.selectedCountry!.name.uppercased(),
            showSearch: $showSearch,
            selectAction: {
                gameVM.confirmSelectedCountry()
            }
        )
        .padding(.horizontal)
    }
    
    private var guessesView: some View {
        VStack(spacing: 8) {
            ForEach(Array(gameVM.guesses.enumerated()), id: \.offset) { (index, guess) in
                if guess.done {
                    GuessDoneView(guess: guess)
                } else if gameVM.currGuessIndex == index {
                    CurrentGuessView(index: index, total: gameVM.totalGuesses)
                } else {
                    GuessPlaceholderView()
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods

}

#Preview {
    NavigationStack {
        WorldleGameView(countries: DeveloperPreview.shared.countries, countryToGuess: DeveloperPreview.shared.countries.first!, showGame: .constant(true))
            .environmentObject(DeveloperPreview.shared.appVM)
    }
}
