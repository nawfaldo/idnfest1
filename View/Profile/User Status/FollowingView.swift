//
//  FollowingView.swift
//  Instagram
//
//  Created by Nawfaldo on 24/06/21.
//

import SwiftUI

struct FollowingView: View {
    @Environment(\.presentationMode) var mode
    var body: some View {
        VStack(spacing: 0) {
            navigation
                .padding(.horizontal)
                .padding(.vertical, 7)
            
            Spacer(minLength: 0)
            
            ScrollView {
                SearchBar(text: .constant(""), isEditing: .constant(false))
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                
                LazyVStack(spacing: 18) {
                    ForEach(0 ..< 5) { item in
                        FollowUserCell()
                    }
                }
                .padding()
            }
        }
    }

    var navigation: some View {
        HStack {
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(Font.title2.weight(.medium))
                    .foregroundColor(Color("Adaptive"))
            })
            
            Spacer()
            
            Text("Following")
                .font(Font.title3.weight(.medium))
            
            Spacer()
            
            Image(systemName: "chevron.left")
                .font(Font.title2.weight(.medium))
                .foregroundColor(.clear)
        }
    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingView()
            .preferredColorScheme(.dark)
    }
}
