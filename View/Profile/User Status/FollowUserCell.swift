//
//  FollowUserCell.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI

struct FollowUserCell: View {
    @State var isFollowed = true
    
    var body: some View {
        HStack(spacing: 10) {
            Image("Profile 2")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Dapa")
                    .fontWeight(.medium)
                
                Text("I love lumine")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                HStack {
                    Text(isFollowed ? "Following" : "Follow")
                        .foregroundColor(Color("Adaptive"))
                        .fontWeight(.medium)
                        .font(.callout)
                }
                .frame(width: 100)
                .padding(5)
                .background(isFollowed ? Color.clear : Color.blue)
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke().foregroundColor(.gray.opacity(isFollowed ? 0.7 : 0)))
            })
            
            Image("menu")
                .resizable()
                .renderingMode(.template)
                .frame(width: 17, height: 17)
                .padding(.leading, 5)
        }
    }
}

struct FollowUserCell_Previews: PreviewProvider {
    static var previews: some View {
        FollowerView()
            .preferredColorScheme(.dark)
    }
}
