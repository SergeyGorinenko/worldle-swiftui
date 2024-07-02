//
//  GuessFieldStyle.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct GuessFieldStyle: ViewModifier {

    var fgColor: Color = Color("AccentColor", bundle: Bundle.module)
    var bgColor: Color = Color("BackgroundColor", bundle: Bundle.module)

    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundStyle(fgColor)
            .lineLimit(1)
            .frame(height: 40)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(bgColor)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("TextColor", bundle: Bundle.module), style: StrokeStyle(lineWidth: 2))
                    .padding(1)
            }
    }
    
    init(fgColor: Color? = nil, bgColor: Color? = nil) {
        if let fgColor = fgColor {
            self.fgColor = fgColor
        }
        if let bgColor = bgColor {
            self.bgColor = bgColor
        }
    }
    
}


extension View {
    
    func guessFieldStyle(fgColor: Color? = nil, bgColor: Color? = nil) -> some View {
        self.modifier(GuessFieldStyle(fgColor: fgColor, bgColor: bgColor))
    }
    
}
