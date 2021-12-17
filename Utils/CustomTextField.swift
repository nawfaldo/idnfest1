//
//  CustomTextField.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/27/20.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color("Adaptive"))
            }
            
            TextField("", text: $text)
        }
        .padding(10)
        .padding(.horizontal, 5)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
