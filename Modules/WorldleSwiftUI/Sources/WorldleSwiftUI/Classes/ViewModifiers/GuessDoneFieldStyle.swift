//
//  GuessDoneFieldStyle.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct GuessDoneFieldStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundStyle(Color("AccentColor", bundle: Bundle.module))
            .lineLimit(1)
            .frame(height: 40)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color("BackgroundColor", bundle: Bundle.module))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("TextColor", bundle: Bundle.module), style: StrokeStyle(lineWidth: 4))
                    .padding(1)
            }
    }
    
}


extension View {
    
    func guessDoneFieldStyle() -> some View {
        self.modifier(GuessDoneFieldStyle())
    }
    
}
