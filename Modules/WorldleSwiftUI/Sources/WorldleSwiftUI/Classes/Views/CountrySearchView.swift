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
    var searchAnimation: Namespace.ID

    var body: some View {
        VStack(spacing: 0) {
            countrySearchInputView

            DividerView()
                .padding(.top)

            countryListView
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor", bundle: Bundle.module))
        .onAppear(perform: {
            fieldInFocus = .country
        })
    }

    private var countrySearchInputView: some View {
        CountrySearchInputView(searchText: $gameVM.searchText, showSearch: $showSearch, searchAnimation: searchAnimation, cancelAction: {
            withAnimation {
                showSearch.toggle()
            }
        })
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
    
    private var countryListView: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(gameVM.searchText.isEmpty ? gameVM.countries : gameVM.filteredCountries) { country in
                    CounrtySearchRowView(country: country) { country in
                        gameVM.selectedCountry = country
                        withAnimation {
                            showSearch.toggle()
                        }
                    }

                    DividerView()
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}


#Preview {
    @Namespace var namespace

    return CountrySearchView(showSearch: .constant(true), searchAnimation: namespace)
        .environmentObject(DeveloperPreview.shared.gameVM)
}
