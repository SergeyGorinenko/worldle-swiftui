//
//  GuessInputView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct GuessInputView: View {
    
    @Binding var searchText: String
    @Binding var showSearch: Bool
    var searchAnimation: Namespace.ID
    let guessAction: (() -> Void)

    var body: some View {
        HStack(spacing: 8) {
            if !showSearch {
                textFieldView
                guessButtonView
            }
        }
        .frame(maxWidth: .infinity)
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
        .disabled(true)
        .guessFieldStyle(bgColor: Color("GuessInputBGColor", bundle: Bundle.module))
        .matchedGeometryEffect(id: "textField", in: searchAnimation)
        .onTapGesture(perform: {
            withAnimation {
                showSearch.toggle()
            }
        })
    }

    private var guessButtonView: some View {
        Button(action: {
            guessAction()
        }, label: {
            HStack(spacing: 6) {
                Image("WorldleIcon", bundle: Bundle.module)
                    .resizable()
                    .frame(width: 16, height: 16)
                
                Text("GUESS")
            }
            .padding(.horizontal, 8)
            .guessFieldStyle(bgColor: Color("GuessButtonBGColor", bundle: Bundle.module))
        })
        .matchedGeometryEffect(id: "actionButton", in: searchAnimation)
    }
    
}

#Preview {
    @Namespace var namespace

    return GuessInputView(searchText: .constant("United States"), showSearch: .constant(false), searchAnimation: namespace) {
        print("GuessInputView: Select")
    }
    .padding()
    .background(Color.gray)
}
