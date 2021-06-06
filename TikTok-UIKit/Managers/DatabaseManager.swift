//
//  DatabaseManager.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 21/05/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()

    private let datebase = Database.database().reference()
    
    private init () {}
    
    // Public
    
    public func getAllUsers(completion: ([String]) -> Void) {}
    
    

}
