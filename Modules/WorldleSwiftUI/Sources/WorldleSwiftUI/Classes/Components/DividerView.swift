//
//  DividerView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct DividerView: View {
    
    var body: some View {
        Rectangle()
            .fill(Color("TextColor", bundle: Bundle.module))
            .frame(height: 2)
            .padding(.horizontal)
    }
    
}

#Preview {
    DividerView()
}
