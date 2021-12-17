//
//  UploadPostView.swift
//  InstagramRE
//
//  Created by Nawfaldo on 04/06/21.
//

import SwiftUI

struct UploadPostView: View {
    @Environment(\.presentationMode) var mode
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var imagePickerPresented = true
    @State var captionText = ""
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(spacing: 0) {
            navigation
                .padding(.top, 10)
            
            ScrollView {
                
                HStack(alignment: .top, spacing: 15) {
                    Button(action: {
                        imagePickerPresented.toggle()
                    }) {
                        if postImage == nil {
                            Image(systemName: "plus.square")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 95, height: 95)
                                .clipped()
                                .foregroundColor(Color("Adaptive"))
                        }
                        else if let image = postImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 95, height: 95)
                                .clipped()
                        }
                    }
                    
                    TextArea(text: $captionText, placeholder: "Write your caption..")
                }
                .padding()
                .padding(.top)
                
                VStack(spacing: 15) {
                    Divider()
                    
                    HStack {
                        Text("Tag People")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        Text("Add Location")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal)
                }
            }
         }
        .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
            ImagePicker(image: $selectedImage)
        })
    }
    
    var navigation: some View {
        VStack(spacing: 13) {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color("Adaptive"))
                })
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image) { _ in
                            mode.wrappedValue.dismiss()
                            selectedTab = 1
                        }
                    }
                }, label: {
                    Text("Share")
                        .fontWeight(.medium)
                })
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
