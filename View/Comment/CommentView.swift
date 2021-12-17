//
//  CommentView.swift
//  InstagramRE
//
//  Created by Nawfaldo on 04/06/21.
//

import SwiftUI

struct CommentView: View {
    @Environment(\.presentationMode) var mode
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            navigation
                .padding(.top)
            
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                            .padding()
                    }
                }
            }
            
            CommentInputView(text: $commentText, action: uploadComment)
                .padding(.bottom, 10)
        }
    }
    
    var navigation: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                        Image(systemName: "chevron.left")
                            .font(Font.title3.weight(.medium))
                            .foregroundColor(Color("Adaptive"))
                })
                
                Spacer()
                
                Text("Comments")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: "paperplane")
                    .font(Font.title3.weight(.medium))
                    .rotationEffect(.degrees(18))
                    .foregroundColor(.clear)
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}
