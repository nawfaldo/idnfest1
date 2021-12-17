//
//  FeedView.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            navigation
                .padding(.horizontal)
                .padding(.vertical, 10)
            
            ScrollView(showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    StoryView()
                        .padding(.leading)
                }
                .frame(height: 105)
            
                Divider()
                    .padding(.vertical, 10)
                
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        PostCell(viewModel: FeedCellViewModel(post: post))
                    }
                }
            }
        }
    }

    var navigation: some View {
        HStack {
            Image("instagramtext")
                .resizable()
                .renderingMode(.template)
                .frame(width: 110, height: 47)
            
            Spacer()
            
            NavigationLink(
                destination: ConversationsView(),
                label: {
                    
                Image(systemName: "paperplane")
                    .font(Font.title3.weight(.medium))
                    .rotationEffect(.degrees(15))
                    .foregroundColor(.black)
                })
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .preferredColorScheme(.dark)
    }
}
