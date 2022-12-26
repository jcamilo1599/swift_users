//
//  User.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable, Hashable {
    let id: Int
    let name, email, phone: String
}
