//
//  ProfileView.swift
//  Instagram
//
//  Created by Nawfaldo on 24/06/21.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var uid: String?
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            navigation
                .padding(.horizontal)
                .padding(.vertical, 7)
            
            ScrollView {
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                PostGridView(config: .profile(user.id ?? ""))
            }
        }
    }
    
    var navigation: some View {
        HStack(spacing: 20) {
            Text(viewModel.user.username)
                .font(.title2)
                .fontWeight(.medium)
            
            Spacer()
            
            Image(systemName: "plus.square")
                .font(Font.title2.weight(.medium))
            
            Button(action: {
                AuthViewModel.shared.signout()
            }, label: {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 18, height: 16)
                    .foregroundColor(Color("Adaptive"))
            })
        }
    }
}
