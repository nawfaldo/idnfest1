//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Nawfaldo on 24/06/21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17) {
            HStack(spacing: 40) {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .clipShape(Circle())
                
                HStack {
                    HStack {
                        VStack(spacing: 5) {
                            Text("\(viewModel.user.stats?.posts ?? 0)")
                                .fontWeight(.medium)
                            
                            Text("Post")
                                .font(.callout)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(
                            destination: FollowerView().navigationBarHidden(true),
                            label: {
                                VStack(spacing: 5) {
                                    Text("\(viewModel.user.stats?.followers ?? 0)")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("Adaptive"))
                                    
                                    Text("Follower")
                                        .font(.callout)
                                        .foregroundColor(Color("Adaptive"))
                                }
                        })
                        
                        Spacer()
                    }
                    
                    HStack {
                        
                        NavigationLink(
                            destination: FollowingView().navigationBarHidden(true),
                            label: {
                                VStack(spacing: 5) {
                                    Text("\(viewModel.user.stats?.following ?? 0)")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("Adaptive"))
                                    
                                    Text("Following")
                                        .font(.callout)
                                        .foregroundColor(Color("Adaptive"))
                                }
                        })
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(viewModel.user.fullname)
                    .font(.callout)
                
                Text("weak one should fear the strong")
                    .font(.callout)
                    .fontWeight(.light)
            }
            
            ProfileActionButton(viewModel: viewModel)
        }
    }
}
