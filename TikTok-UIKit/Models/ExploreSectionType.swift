//
//  ExploreSectionType.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 29/07/21.
//

import Foundation
enum ExploreSectionType: CaseIterable{
    case banners
    case trandingPosts
    case trandingHashtags
    case users
    case recommended
    case popular
    case new
    
    
    var title: String{
        switch self {
        case .banners:
            return "Featured"
        case .trandingPosts:
            return "Trending videos"
        case .trandingHashtags:
            return "Hashtags"
        case .recommended:
            return "Recommended"
        case .popular:
            return "Popular"
        case .new:
            return "Recently Posted"
        case .users:
            return "Popular creators"
        }
    }
    
}
