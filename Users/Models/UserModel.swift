//
//  User.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int
    let name, username, email, phone, website: String
    let address: Address
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
