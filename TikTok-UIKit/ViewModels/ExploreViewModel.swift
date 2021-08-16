//
//  ExploreViewModel.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 29/07/21.
//
import UIKit
import Foundation

struct ExploreBannerViewModel {
    let image:UIImage?
    let tile : String
    let handler : (()->Void)
}

struct ExplorePostViewModel {
    let thumbnailImage: UIImage?
    let caption: String
    let handler: (() -> Void)
}


struct ExploreHashtagViewModel {
    let icon:UIImage?
    let text : String
    let handler : (()->Void)
    let count: Int // number of post associated with tag
}

struct ExploreUserViewModel {
    let profilePicture:URL?
    let username: String
    let followerCounter: Int
    let handler : (()->Void)
}
