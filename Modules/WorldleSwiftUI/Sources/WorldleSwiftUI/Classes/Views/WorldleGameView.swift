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
    
    // MARK: - Public properties

    public var body: some View {
        ZStack {
            if appVM.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVStack(content: {
                        ForEach(appVM.countries) { country in
                            Text("\(country.name)")
                        }
                    })
                }
            }
        }
        .frame(maxWidth: .infinity)
        .task {
            await appVM.loadCountries()
        }
    }
    
    public init() {
    }
    
    // MARK: - Private properties

    // MARK: - Public methods
    
    // MARK: - Private methods

}

#Preview {
    WorldleGameView()
        .environmentObject(DeveloperPreview.shared.appViewModel)
}
