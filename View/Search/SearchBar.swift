//
//  SearchBar.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .animation(.spring())
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                    .animation(.none)
                )
                .overlay(
                    HStack {
                        if !text.isEmpty {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 8)
                                .onTapGesture {
                                    text = ""
                                }
                        }
                    }
                )
                .onTapGesture {
//                    withAnimation {
                        isEditing = true
//                    }
                }
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color("Adaptive"))
                })
                .padding(.leading, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
