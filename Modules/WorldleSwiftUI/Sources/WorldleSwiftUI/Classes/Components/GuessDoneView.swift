//
//  GuessDoneView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct GuessDoneView: View {
    
    private var distanceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    var guess: GuessModel
    
    var body: some View {
        HStack(spacing: 8) {
            Text(guess.country!.name.uppercased())
                .frame(maxWidth: .infinity)
                .minimumScaleFactor(0.5)
                .guessFieldStyle()

            Text(format(distance: guess.distance))
                .guessFieldStyle()

            Image(systemName: guess.direction.icon)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(Color("DirectionBGColor", bundle: Bundle.module))
                        .frame(width: 24, height: 24)
                )
                .padding(.horizontal, 8)
                .guessFieldStyle()

            Text(String(format: "%0.0f%%", guess.distancePercentage))
                .guessFieldStyle()
        }
        .frame(maxWidth: .infinity)
    }
    
    init(guess: GuessModel) {
        self.guess = guess
    }
    
    private func format(distance: Double) -> String {
        // Convert meters to kilometers
        let distance = distance / 1000
        let formattedNumber = distanceFormatter.string(for: distance) ?? "\(distance)"
        return "\(formattedNumber)km"
    }
    
}

#Preview {
    GuessDoneView(guess: DeveloperPreview.shared.guesses.first!)
        .padding()
        .background(Color.gray)
}
