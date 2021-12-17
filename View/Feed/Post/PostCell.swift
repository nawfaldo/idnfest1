//
//  PostCell.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI
import struct Kingfisher.KFImage


struct PostCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Adaptive"))

                Spacer()

                Button(action: {}) {
                    Image("menu")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("Adaptive"))
                        .frame(width: 13, height: 13)
                }
            }
            .padding(.horizontal)

            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()

            HStack(spacing: 13) {
                Button(action: { didLike ? viewModel.unlike() : viewModel.like() }) {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundColor(didLike ? .red : Color("Adaptive"))
                        .font(Font.title3)
                }

                Image(systemName: "bubble.right")
                    .font(Font.system(size: 18))

                Image(systemName: "paperplane")
                    .font(Font.title3.weight(.light))
                    .rotationEffect(.degrees(18))

                Spacer()

                Image("bookmark")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 5) {
//                NavigationLink(
//                    destination: PostLikeView().navigationBarHidden(true),
//                    label: {
                        Text(viewModel.likeString)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(Color("Adaptive"))
//                    })

//                if let caption = viewModel.post.caption {
                    Text("\(viewModel.post.ownerUsername)  ")
                        .font(.system(size: 14))
                        .fontWeight(.medium) +
                        Text(viewModel.post.caption)
                            .font(.system(size: 14))
//                }

                NavigationLink(
                    destination: CommentView(post: viewModel.post).navigationBarHidden(true),
                    label: {
                        Text("View all comments")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    })

                Text(viewModel.timestampString)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
    }
}

