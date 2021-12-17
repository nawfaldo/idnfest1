//
//  OtherStoryCell.swift
//  InstagramRE
//
//  Created by Nawfaldo on 04/06/21.
//

import SwiftUI

struct OtherStoryCell: View {
    var body: some View {
        VStack {
            Image("Profile 2")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .padding(3)
                .overlay(Circle().stroke(AngularGradient(gradient: .init(colors: [.red,.orange,.red]), center: .center), style: StrokeStyle(lineWidth: 2 )))
            
            Spacer(minLength: 10)
            
            Text("Dummy")
                .font(.caption)
                .foregroundColor(Color("Adaptive"))
        }
        .frame(height: 100)
    }
}
