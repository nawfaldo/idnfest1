//
//  ExploreProfileView.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI

struct ExploreProfileView: View {
    @Environment(\.presentationMode) var mode
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
                .padding(.top)
            
            ScrollView {
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                PostGridView(config: .profile(user.id ?? ""))
            }
        }
    }
    
    var navigation: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(Font.title3.weight(.medium))
                        .foregroundColor(Color("Adaptive"))
                })
                
                Spacer()
                
                Text(viewModel.user.username)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                
                Spacer()
                
                Image("menu")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
                    .padding(.leading, 5)
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}
