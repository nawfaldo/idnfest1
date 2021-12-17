//
//  CommentInputView.swift
//  InstagramRE
//
//  Created by Nawfaldo on 05/06/21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct CommentInputView: View {
    @Binding var text: String
    let emoji = ["heart", "high five", "fire", "clapping", "crying", "heart eye", "suprised", "tears"]
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            Divider()
            
            HStack {
                HStack {
                    Spacer()
                    
                    Image("heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("high five")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("fire")
                        .resizable()
                        .frame(width: 17, height: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("clapping")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("crying")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("heart eye")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("suprised")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("tears")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 3)
            
            HStack {
                HStack(spacing: 5) {
                    
                    TextField("Add a comment...", text: $text)
                    
                    if !text.isEmpty {
                        Button(action: action, label: {
                            Text("Send")
                                .fontWeight(.medium)
                        })
                    }
                }
                .padding(7)
                .padding(.horizontal, 5)
                .overlay(Capsule().stroke(Color(.gray).opacity(0.7)))
            }
            .padding(.horizontal)
        }
    }
}
