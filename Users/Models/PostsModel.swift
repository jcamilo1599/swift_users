//
//  PostsModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 24/12/22.
//

import Foundation

// MARK: - PostsModel
struct PostsModel: Codable {
    let id: Int
    let title, body: String
}
