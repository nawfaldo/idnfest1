//
//  MainTabView.swift
//  Instagram
//
//  Created by Nawfaldo on 24/06/21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MainTabView: View {
    let user: User
    @State var selectedTab = 1
    @State var isEditing = false
    @State var searchText = ""
    @State var uploadPost = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if selectedTab == 4 {
                    ProfileView(user: user)
                } else if selectedTab == 2 {
                    SearchView(searchText: $searchText, isEditing: $isEditing)
                } else if selectedTab == 1 {
                    FeedView()
                } else if selectedTab == 3 {
                    NotificationsView()
                }
                
                Spacer(minLength: 0)
                
                tabView
                    .padding(.bottom, 8)
            }
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    
    var tabView: some View {
        VStack(spacing: 13) {
            Divider()
            
            HStack {
                HStack {
                    Spacer()
                    
                    Image(selectedTab == 1 ? "homeFill" : "home")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("Adaptive"))
                        .onTapGesture {
                            selectedTab = 1
                        }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                        .font(Font.title2.weight(selectedTab == 2 ? .semibold : .regular))
                        .onTapGesture {
                            selectedTab = 2
                            
                            if isEditing == true {
                                isEditing.toggle()
                                searchText = ""
                            }
                        }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        uploadPost.toggle()
                    }, label: {
                        Image(systemName: "plus.square")
                            .font(Font.title2)
                            .foregroundColor(Color("Adaptive"))
                    })
                    .fullScreenCover(isPresented: $uploadPost, content: {
                        UploadPostView(selectedTab: $selectedTab)
                    })
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .font(Font.title2)
                        .onTapGesture {
                            selectedTab = 3
                        }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .font(Font.title2)
                        .onTapGesture {
                            selectedTab = 4
                        }
                    
//                    KFImage(URL(string: user.profileImageUrl))
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 24, height: 24)
//                        .clipped()
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke().foregroundColor(selectedTab == 4 ? .white : .clear))
//                        .onTapGesture {
//                            selectedTab = 4
//                        }
                    
                    Spacer()
                }
            }
        }
    }
}
