//
//  CurrentGuessView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct CurrentGuessView: View {
    
    var index: Int
    var total: Int

    var body: some View {
        Text("GUESS \(index + 1)/\(total)")
            .fontWeight(.bold)
            .foregroundStyle(Color("CurrGuessTextColor", bundle: Bundle.module))
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color("CurrGuessBGColor", bundle: Bundle.module))
            )
    }
    
}

#Preview {
    CurrentGuessView(index: 0, total: 6)
        .padding(.horizontal)
}
