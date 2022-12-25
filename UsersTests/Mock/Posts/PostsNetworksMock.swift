//
//  UsersNetworksMock.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import Foundation
@testable import Users

class PostsNetworksMock: PostsNetworksDelegate {
    func getPosts(success: @escaping ([Users.PostsModel]) -> (), failure: @escaping (Error?) -> ()) {
        guard let posts = readFile() else {
            failure(nil)
            return
        }
        
        success(posts)
    }
    
    private func readFile()->[Users.PostsModel]? {
        let url = Bundle.main.url(forResource: "Posts", withExtension: "json")
        if url == nil { return nil }
        
        let data = try? Data(contentsOf: url!)
        if data == nil { return nil }
        
        let decoder = JSONDecoder()
        let jsonData = try? decoder.decode([Users.PostsModel].self, from: data!)
        if jsonData == nil { return nil }
    
        return jsonData
    }
}
