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
    @State var showGameOver: Bool = false

    var mapAnimation: Namespace.ID
    @Namespace var searchAnimation

    // MARK: - Public properties

    public var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    headerView
                    countryShapeView.padding(.vertical, 16)

                    if gameVM.state != .playing {
                        answerView.padding(.bottom, 24)
                    }
                    
                    guessInputView
                    guessesView
                }
            }

            if showSearch {
                CountrySearchView(showSearch: $showSearch, searchAnimation: searchAnimation)
                    .environmentObject(gameVM)
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor", bundle: Bundle.module))
        .alert(isPresented: $showGameOver) {
            getAlert()
        }
        .onChange(of: gameVM.state, { oldValue, newValue in
            if newValue != .playing {
                showGameOver.toggle()
            }
        })
    }

    init(countries: [CountryEntity], countryToGuess: CountryEntity, showGame: Binding<Bool>, mapAnimation: Namespace.ID) {
        _gameVM = StateObject(wrappedValue: WorldleGameViewModel(countries: countries, countryToGuess: countryToGuess))
        _showGame = showGame
        self.mapAnimation = mapAnimation
    }

    // MARK: - Private properties

    private var headerView: some View {
        VStack(spacing: 8) {
            ZStack {
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

                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            showGame.toggle()
                        }
                    } label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundStyle(Color("TextColor", bundle: Bundle.module))
                            .font(.headline)
                            .fontWeight(.medium)
                            .frame(width: 40, height: 40)
                    }
                    .padding(.horizontal, 8)
                }
            }

            DividerView()
        }
    }
    
    private var countryShapeView: some View {
        HStack {
            if let url = gameVM.countryToGuess.imageURL {
                SVGImage(url: url)
                    .matchedGeometryEffect(id: "map", in: mapAnimation)
            }
        }
    }

    private var answerView: some View {
        HStack {
            Text("Country:")
            Text(gameVM.countryToGuess.name.uppercased())
                .fontWeight(.bold)
        }
        .foregroundStyle(Color("AnswerTextColor", bundle: Bundle.module))
        .frame(height: 40)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(Color("AnswerBGColor", bundle: Bundle.module))
        )
    }

    private var guessInputView: some View {
        GuessInputView(
            searchText: $gameVM.selectedCountryName,
            showSearch: $showSearch,
            searchAnimation: searchAnimation,
            guessAction: {
                gameVM.confirmSelectedCountry()
            }
        )
        .disabled(gameVM.state != .playing)
        .padding(.horizontal)
        .padding(.bottom, 8)
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

    private func getAlert() -> Alert {
        Alert(
            title: Text((gameVM.state == .won) ? "Congratulations!!!\nYOU WON!!!" : "YOU LOST!!!"),
            message: nil,
            dismissButton: .default(Text("OK"))
        )
    }

}

#Preview {
    @Namespace var namespace
    
    return NavigationStack {
        WorldleGameView(countries: DeveloperPreview.shared.countries, countryToGuess: DeveloperPreview.shared.countries.first!, showGame: .constant(true), mapAnimation: namespace)
            .environmentObject(DeveloperPreview.shared.appVM)
    }
}
