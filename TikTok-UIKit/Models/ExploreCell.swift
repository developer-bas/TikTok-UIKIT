//
//  ExploreCell.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 29/07/21.
//

import Foundation
import UIKit

enum ExploreCell {
    case banner(viewModel:ExploreBannerViewModel)
    case post(viewModel:ExplorePostViewModel)
    case hashtag(viewModel:ExploreHashtagViewModel)
    case user(viewModel:ExploreUserViewModel)

}
