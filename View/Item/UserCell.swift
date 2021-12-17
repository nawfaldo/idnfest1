//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/26/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 57, height: 57)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.callout)
                    .foregroundColor(Color("Adaptive"))
                
                Text(user.fullname)
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}
