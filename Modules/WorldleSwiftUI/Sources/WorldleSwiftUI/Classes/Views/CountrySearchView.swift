//
//  CountrySearchView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct CountrySearchView: View {
    
    enum CountrySearchFields {
        case country
    }

    @EnvironmentObject var gameVM: WorldleGameViewModel
    @Binding var showSearch: Bool
    @FocusState private var fieldInFocus: CountrySearchFields?

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                textFieldView
                cancelButtonView
            }
            .padding()

            DividerView()

            countryListView
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor", bundle: Bundle.module))
        .onAppear(perform: {
            fieldInFocus = .country
        })
    }

    private var textFieldView: some View {
        TextField(
            "Country, territory...",
            text: $gameVM.searchText,
            prompt:
                Text("Country, territory...")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(Color("GuessInputPlaceholderColor", bundle: Bundle.module))
        )
        .guessFieldStyle(bgColor: Color("GuessInputBGColor", bundle: Bundle.module))
        .focused($fieldInFocus, equals: .country)
    }

    private var cancelButtonView: some View {
        Button(action: {
            showSearch.toggle()
        }, label: {
            Text("Cancel")
                .padding(.horizontal, 8)
                .guessFieldStyle(bgColor: Color("GuessButtonBGColor", bundle: Bundle.module))
        })
    }

    private var countryListView: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(gameVM.searchText.isEmpty ? gameVM.countries : gameVM.filteredCountries) { country in
                    CounrtySearchRowView(country: country) { country in
                        gameVM.selectedCountry = country
                        showSearch.toggle()
                    }

                    DividerView()
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}


#Preview {
    CountrySearchView(showSearch: .constant(true))
        .environmentObject(DeveloperPreview.shared.gameVM)
}
