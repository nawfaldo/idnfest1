//
//  CustomSecureField.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/27/20.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color("Adaptive"))
            }
            
            SecureField("", text: $text)
        }
        .padding(10)
        .padding(.horizontal, 5)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}
