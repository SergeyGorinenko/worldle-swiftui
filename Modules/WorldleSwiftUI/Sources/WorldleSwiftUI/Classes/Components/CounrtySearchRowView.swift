//
//  CounrtySearchRowView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI
import WorldleCore

struct CounrtySearchRowView: View {
    
    let country: CountryEntity
    let selectAction: ((CountryEntity) -> Void)
    
    var body: some View {
        Button {
            selectAction(country)
        } label: {
            Text(country.name.uppercased())
                .fontWeight(.semibold)
                .foregroundStyle(Color("AccentColor", bundle: Bundle.module))
                .lineLimit(1)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
        }
    }
    
}


#Preview {
    CounrtySearchRowView(country: DeveloperPreview.shared.countries.first!) { country in
        print("Selected: \(country.name)")
    }
    .background(Color.gray)
}
