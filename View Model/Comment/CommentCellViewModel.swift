//
//  CommentCellViewModel.swift
//  Instagram
//
//  Created by Nawfaldo on 27/06/21.
//

import SwiftUI

class CommentCellViewModel: ObservableObject {
    @Published var comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
        fetchCommentUser()
    }
    
    func fetchCommentUser() {
        COLLECTION_USERS.document(comment.uid).getDocument { snapshot, _ in
            self.comment.user = try? snapshot?.data(as: User.self)
        }
    }
}
