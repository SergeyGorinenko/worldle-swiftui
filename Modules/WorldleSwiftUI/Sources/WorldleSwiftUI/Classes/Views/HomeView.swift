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
    @Namespace var mapAnimation

    public var body: some View {
        ZStack {
            VStack {
                if !showGame {
                    countryShapeView
                }

                ProgressView()
                    .colorInvert()
            }
            .alert(isPresented: $showError) {
                getAlert(error: error)
            }

            if showGame {
                WorldleGameView(countries: appVM.countries, 
                                countryToGuess: appVM.countries.randomElement()!,
                                showGame: $showGame,
                                mapAnimation: mapAnimation)
                    .transition(.opacity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor", bundle: Bundle.module))
        .task {
            await loadCountries()
        }
        .onChange(of: showGame) { oldValue, newValue in
            if !newValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    withAnimation {
                        showGame.toggle()
                    }
                }
            }
        }
    }
    
    // MARK: - Public methods
    
    public init() {
    }

    // MARK: - Private methods

    private var countryShapeView: some View {
        Image("US", bundle: Bundle.module)
            .resizable()
            .colorInvert()
            .foregroundStyle(.white)
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 50)
            .matchedGeometryEffect(id: "map", in: mapAnimation)
    }

    private func loadCountries() async {
        do {
            try await appVM.loadCountries()
            withAnimation {
                showGame.toggle()
            }
        } catch {
            self.error = error
            self.showError.toggle()
        }
    }
    
    private func getAlert(error: Error?) -> Alert {
        Alert(title: Text("Warning"),
              message: Text("Could not connect server. Try to run the app later please."),
              dismissButton: .default(Text("Reconnect"), action: {
            Task {
                await loadCountries()
            }
        }))
    }

}

#Preview {
    HomeView()
        .environmentObject(DeveloperPreview.shared.appVM)
}
