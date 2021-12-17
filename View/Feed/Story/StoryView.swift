//
//  StoryView.swift
//  InstagramRE
//
//  Created by Nawfaldo on 04/06/21.
//

import SwiftUI

struct StoryView: View {
    @State var showingStory = false
    
    var body: some View {
        HStack(spacing: 20) {
            MyStoryCell()
            
//            LazyHStack(spacing: 20) {
//                ForEach(0 ..< 5) { item in
//                    OtherStoryCell()
//                        .onTapGesture {
//                            showingStory.toggle()
//                        }
//                        .fullScreenCover(isPresented: $showingStory, content: {
//                            InStoryView()
//                        })
//                }
//            }
        }
    }
}
