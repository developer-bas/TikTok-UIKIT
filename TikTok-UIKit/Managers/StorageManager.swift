//
//  StorageManager.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 21/05/21.
//

import Foundation
import FirebaseStorage

final class StoreManager {
    static let shared = StoreManager()

    private let datebase = Storage.storage().reference()
    
    private init () {}
    
    // Public
    
    public func getVideoURl(WITH IDENTIFIER: String,completion: (URL) -> Void) {
        
    }


    public func uploadVideoURL(from url: URL){
        
    }
    
}
