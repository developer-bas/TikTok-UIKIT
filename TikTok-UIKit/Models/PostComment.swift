//
//  PostComment.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 14/06/21.
//

import Foundation

struct PostComment {
    let text: String
    let user : User
    let date : Date
    
    static func mocKComments() -> [PostComment]{
        let user =  User(username: "Sebas", profilePictureURL: nil, identifier: UUID().uuidString)
        
        
        return [PostComment(text: "This is a mock message", user: user, date: Date())]
    }
}
