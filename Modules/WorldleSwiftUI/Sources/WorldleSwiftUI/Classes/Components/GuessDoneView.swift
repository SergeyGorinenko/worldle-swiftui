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
            Text(guess.countryName.uppercased())
                .frame(maxWidth: .infinity)
                .minimumScaleFactor(0.5)
                .guessDoneFieldStyle()

            Text(format(distance: guess.distance))
                .guessDoneFieldStyle()

            Image(systemName: guess.direction.icon)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(Color("DirectionBGColor", bundle: Bundle.module))
                        .frame(width: 24, height: 24)
                )
                .padding(.horizontal, 8)
                .guessDoneFieldStyle()

            Text(String(format: "%0.0f%%", guess.distancePercentage))
                .guessDoneFieldStyle()
        }
        .frame(maxWidth: .infinity)
    }
    
    init(guess: GuessModel) {
        self.guess = guess
    }
    
    private func format(distance: Double) -> String {
        let formattedNumber = distanceFormatter.string(for: distance) ?? "\(distance)"
        return "\(formattedNumber)km"
    }
    
}

#Preview {
    GuessDoneView(guess: DeveloperPreview.shared.guesses.first!)
        .padding()
        .background(Color.gray)
}
