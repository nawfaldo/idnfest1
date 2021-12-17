//
//  CommentCell.swift
//  InstagramRE
//
//  Created by Nawfaldo on 05/06/21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                KFImage(URL(string: comment.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(comment.username)  ")
                    .font(.system(size: 14))
                    .fontWeight(.medium) +
                Text(comment.commentText)
                    .font(.system(size: 14))
                
                HStack(spacing: 12) {
                    Text("\(comment.timestampString ?? "")")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("10 likes")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    
                    Text("Reply")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            Image(systemName: "heart")
                .foregroundColor(.gray)
                .font(.footnote)
                .foregroundColor(Color("Adaptive"))
        }
    }
}
