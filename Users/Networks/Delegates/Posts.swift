//
//  Posts.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import Foundation

protocol PostsNetworksDelegate {
    func getPosts(
        success: @escaping (_ posts: [PostsModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    )
}
