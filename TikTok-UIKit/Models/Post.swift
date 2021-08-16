//
//  Post.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 22/05/21.
//

import Foundation

struct PostModel {
    
    let identifier: String
    
    let user = User(username: "sebas", profilePictureURL: nil, identifier: UUID().uuidString)
    
    var islikeByCurrentUser = false
    
    
    static func mockModels() -> [PostModel]{
        var posts  = [PostModel]()
        
        for _ in 0...100{
            let post = PostModel(identifier: UUID().uuidString)
            posts.append(post)
        }
        
        return posts
    }
    
}
