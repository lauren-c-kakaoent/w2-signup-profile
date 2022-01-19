//
//  User.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/19.
//

import Foundation

class User {
    var id: String
    var password: String
    
    init(id: String, password: String) {
        self.id = id
        self.password = password
    }
    
    static func isValidId(id: String) -> Bool {
        let pattern = "^[a-z0-9-=]{5,20}$"
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: id.count)
        
        if let regex = regex, let _ = regex.firstMatch(in: id, options: [], range: range) {
            return true
        }
        return false
    }
    
    static func isValidPassword(password: String, patterns: [PasswordPattern]) -> Bool {
        let range = NSRange(location: 0, length: password.count)
        
        for pattern in patterns {
            if let regex = try? NSRegularExpression(pattern: pattern.rawValue),
               let _ = regex.firstMatch(in: password, options: [], range: range) {
                continue
            } else {
                return false
            }
        }
        return true
    }
    
    
}

enum PasswordPattern: String {
    case LENGTH = "^[a-zA-Z0-9!@#$%]{8,16}$"
    case CAPITAL = "(?=.*[A-Z])"
    case NUMBER = "(?=.*[0-9])"
    case SPECIAL = "(?=.*[!@#$%])"
}
