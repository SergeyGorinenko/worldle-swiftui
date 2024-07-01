//
//  WorldleGameView.swift
//
//
//  Created by Serhii Horinenko on 29.06.2024.
//

import SwiftUI

public struct WorldleGameView: View {

    // MARK: - State properties
    
    @EnvironmentObject var appVM: WorldleAppViewModel
    @StateObject var gameVM = WorldleGameViewModel()
    
    // MARK: - Public properties

    public var body: some View {
        ZStack {
            VStack(spacing: 0) {
                headerView

                ScrollView {
                    countryShapeView
                    guessesView
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor", bundle: Bundle.module))
        .task {
            await appVM.loadCountries()
        }
    }
    
    public init() {
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

            Rectangle()
                .fill(Color("TextColor", bundle: Bundle.module))
                .frame(height: 2)
                .padding(.horizontal)
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
    WorldleGameView()
        .environmentObject(DeveloperPreview.shared.appViewModel)
}
