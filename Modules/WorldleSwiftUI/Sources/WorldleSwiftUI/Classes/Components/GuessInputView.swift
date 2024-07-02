//
//  GuessInputView.swift
//
//
//  Created by Serhii Horinenko on 01.07.2024.
//

import SwiftUI

struct GuessInputView: View {
    
    let text: String
    @Binding var showSearch: Bool
    let selectAction: (() -> Void)

    var body: some View {
        HStack(spacing: 8) {
            textFieldView
                .disabled(true)
                .onTapGesture(perform: {
                    showSearch.toggle()
                })
            guessButtonView
        }
        .frame(maxWidth: .infinity)
    }
    
    private var textFieldView: some View {
        HStack {
            if text.isEmpty {
                Text("Country, territory...")
                    .font(.headline)
            } else {
                Text(text)
            }

            Spacer()
        }
        .padding(.horizontal, 8)
        .guessFieldStyle(
            fgColor: text.isEmpty ? Color("GuessInputPlaceholderColor", bundle: Bundle.module) : nil,
            bgColor: Color("GuessInputBGColor", bundle: Bundle.module)
        )
    }

    private var guessButtonView: some View {
        Button(action: {
            selectAction()
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
    }
    
}

#Preview {
    GuessInputView(text: "URKAINE", showSearch: .constant(false), selectAction: {
        print("GuessInputView: Select")
    })
    .padding()
    .background(Color.gray)
}
