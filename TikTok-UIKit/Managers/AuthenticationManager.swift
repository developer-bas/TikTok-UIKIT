//
//  AuthenticationManager.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 21/05/21.
//

import Foundation
import FirebaseAuth

final class AuthManager{
    
    public static let shared = AuthManager()
    
    private init() {}
    
    enum SignInMethod {
        case email
        case facebook
        case google
    }
    
    
    
    public func singIn(with method: SignInMethod){}
    
    public func signOut(){
        
    }
    
    
}
