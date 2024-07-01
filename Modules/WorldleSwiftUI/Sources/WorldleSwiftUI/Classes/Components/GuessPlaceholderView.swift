//
//  GuessPlaceholderView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct GuessPlaceholderView: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(height: 40)
            .foregroundStyle(Color("PlaceholderBGColor", bundle: Bundle.module))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("PlaceholderStrokeColor", bundle: Bundle.module), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [6]))
                    .padding(1)
            })
    }
    
}

#Preview {
    GuessPlaceholderView()
        .padding(.horizontal)
}
