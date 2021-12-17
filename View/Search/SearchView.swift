//
//  SearchView.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @Binding var isEditing: Bool
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .padding(.horizontal)
                .padding(.vertical, 7)
            
            ScrollView {
                if isEditing == false {
                    PostGridView(config: .explore)
                } else {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                }
            }
        }
    }
}
