//
//  UserModel.swift
//  TravelMate
//
//  Created by Ricardo Developer on 01/06/24.
//

import Foundation

struct User {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "email": email,
            "joined": joined
        ]
    }
}
