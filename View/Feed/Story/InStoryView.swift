//
//  InStoryView.swift
//  InstagramRE
//
//  Created by Nawfaldo on 05/06/21.
//

import SwiftUI

struct InStoryView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("Story")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .clipped()
                .cornerRadius(10)
            
            VStack(spacing: 10) {
                Capsule()
                    .frame(height: 2)
                
                HStack {
                    Image("Profile 2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                    Text("Chizuru  ")
                        .font(.system(size: 15))
                        .fontWeight(.medium) +
                    Text("18m")
                        .font(.system(size: 15))
                    
                    Spacer()
                    
                    Button(action: { mode.wrappedValue.dismiss() }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color("Adaptive"))
                            .font(Font.body.weight(.medium))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct InStoryView_Previews: PreviewProvider {
    static var previews: some View {
        InStoryView()
            .preferredColorScheme(.dark)
    }
}
