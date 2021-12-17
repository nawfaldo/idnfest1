//
//  MyStoryCell.swift
//  InstagramRE
//
//  Created by Nawfaldo on 04/06/21.
//

import SwiftUI

struct MyStoryCell: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("Profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("ReverseAdaptive"), lineWidth: 3))
            }
            .padding(.top, 5)
            
            Spacer(minLength: 10)
            
            Text("Your Story")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(height: 100)
    }
}
