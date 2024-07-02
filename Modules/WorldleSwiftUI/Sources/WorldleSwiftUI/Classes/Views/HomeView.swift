//
//  HomeView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI
import WorldleCore

public struct HomeView: View {

    // MARK: - State properties
    
    @EnvironmentObject var appVM: WorldleAppViewModel
    @State var showGame: Bool = false
    @State var showError: Bool = false
    @State var error: Error?

    public var body: some View {
        ZStack {
            ProgressView()
                .colorInvert()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor", bundle: Bundle.module))
        .task {
            do {
                try await appVM.loadCountries()
            } catch {
                self.error = error
                self.showError.toggle()
            }
            showGame.toggle()
        }
        .fullScreenCover(isPresented: $showGame, content: {
            WorldleGameView(countries: appVM.countries, countryToGuess: appVM.countries.randomElement()!, showGame: $showGame)
                .transition(.opacity)
        })
        .alert(isPresented: $showError) {
            getAlert(error: error)
        }
        .onChange(of: showGame) { oldValue, newValue in
            if !newValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    showGame.toggle()
                }
            }
        }
    }
    
    // MARK: - Public methods
    
    public init() {
    }

    // MARK: - Private methods

    private func getAlert(error: Error?) -> Alert {
        Alert(
            title: Text("Warning"),
            message: Text("Could not connect server. Try to run the app later please."),
            dismissButton: .default(Text("OK"))
        )
    }

}

#Preview {
    HomeView()
        .environmentObject(DeveloperPreview.shared.appVM)
}
