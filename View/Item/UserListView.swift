//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/26/20.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(
                        destination: LazyView(ExploreProfileView(user: user).navigationBarHidden(true)),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                        })
                }
            }
            .padding(.top)
        }
    }
}
