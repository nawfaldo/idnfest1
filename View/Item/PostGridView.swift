//
//  PostGridView.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/26/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    let config: PostGridConfiguration
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(
                    destination: PostGridDetail(viewModel: FeedCellViewModel(post: post)).navigationBarHidden(true),
                    label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    }).onAppear {
                        guard let index = viewModel.posts.firstIndex(where: { $0.id == post.id }) else { return }
                        if case .explore = config, index == viewModel.posts.count - 1 {
                            viewModel.fetchExplorePagePosts()
                        }
                    }
            }
        })
    }
}
