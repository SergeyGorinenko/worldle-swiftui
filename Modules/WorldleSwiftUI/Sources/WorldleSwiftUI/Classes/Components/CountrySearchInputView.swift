//
//  CountrySearchInputView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct CountrySearchInputView: View {
    
    enum CountrySearchFields {
        case country
    }

    @Binding var searchText: String
    @Binding var showSearch: Bool
    @FocusState var fieldInFocus: CountrySearchFields?
    var searchAnimation: Namespace.ID
    let cancelAction: (() -> Void)

    var body: some View {
        HStack(spacing: 8) {
            if showSearch {
                textFieldView
                cancelButtonView
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear(perform: {
            fieldInFocus = .country
        })
    }
    
    private var textFieldView: some View {
        TextField(
            "Country, territory...",
            text: $searchText,
            prompt:
                Text("Country, territory...")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(Color("GuessInputPlaceholderColor", bundle: Bundle.module))
        )
        .guessFieldStyle(bgColor: Color("GuessInputBGColor", bundle: Bundle.module))
        .focused($fieldInFocus, equals: .country)
        .matchedGeometryEffect(id: "textField", in: searchAnimation)
    }

    private var cancelButtonView: some View {
        Button(action: {
            withAnimation {
                showSearch.toggle()
            }
        }, label: {
            Text("Cancel")
                .padding(.horizontal, 8)
                .guessFieldStyle(bgColor: Color("GuessButtonBGColor", bundle: Bundle.module))
        })
        .matchedGeometryEffect(id: "actionButton", in: searchAnimation)
    }
    
}

#Preview {
    @Namespace var namespace

    return CountrySearchInputView(searchText: .constant("United States"), showSearch: .constant(true), searchAnimation: namespace) {
        print("GuessInputView: Select")
    }
    .padding(.vertical)
    .background(Color.gray)
}
