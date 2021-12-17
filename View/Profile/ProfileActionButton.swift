//
//  ProfileActionButton.swift
//  Instagram
//
//  Created by Nawfaldo on 24/06/21.
//

import SwiftUI

struct ProfileActionButton: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
    
    var body: some View {
        HStack(spacing: 10) {
            if viewModel.user.isCurrentUser {
                Button(action: {
                    
                }, label: {
                    HStack {
                        Spacer()
                        
                        Text("Edit Profile")
                            .foregroundColor(Color("Adaptive"))
                            .font(.callout)
                        
                        Spacer()
                    }
                    .padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke().foregroundColor(.gray.opacity(0.7)))
                })
            } else {
                Button(action: {
                    
                }, label: {
                    HStack {
                        Spacer()
                        
                        Text(isFollowed ? "Following" : "Follow")
                            .foregroundColor(isFollowed ? Color("Adaptive") : Color.white )
                            .font(.callout)
                        
                        Spacer()
                    }
                    .padding(7)
                    .background(isFollowed ? Color.clear : Color.blue)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke().foregroundColor(.gray.opacity(isFollowed ? 0.7 : 0)))
                    .onTapGesture {
                        isFollowed ? viewModel.unfollow() : viewModel.follow()
                    }
                })
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        Spacer()
                        
                        Text("Message")
                            .foregroundColor(Color("Adaptive"))
                            .font(.callout)
                        
                        Spacer()
                    }
                    .padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke().foregroundColor(.gray.opacity(0.7)))
                })
            }
        }
    }
}
