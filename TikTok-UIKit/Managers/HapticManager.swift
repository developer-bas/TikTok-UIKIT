//
//  HapticManager.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 21/05/21.
//

import Foundation
import UIKit

final class HapticsMager{
    static let shared = HapticsMager()
    
    private init () {}
    
    public func vibrateforSelection() {
        DispatchQueue.main.async {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
        
    }
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(type)
        }
        
    }
    
}
