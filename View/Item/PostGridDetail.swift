//
//  PostGridDetail.swift
//  InstagramRE
//
//  Created by Nawfaldo on 06/06/21.
//

import SwiftUI

struct PostGridDetail: View {
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel: FeedCellViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            navigation
                .padding(.top)
            
            ScrollView {
                PostCell(viewModel: viewModel)
                    .padding(.top)
            }
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
                
                Text("Explore")
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
}
