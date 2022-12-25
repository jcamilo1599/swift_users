//
//  PostsNetworks.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 24/12/22.
//

import Foundation
import Alamofire

class PostsNetworks: PostsNetworksDelegate {
    private let path = "/posts"
    
    var userId: Int?
    
    init(userId: Int?) {
        self.userId = userId
    }
    
    func getPosts(
        success: @escaping (_ posts: [PostsModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
        var url = Environments.URLBase + path
        
        if userId != nil {
            url = url + "?userId=" + String(userId!)
        }
        
        AF
            .request(url, method: .get)
            .validate(statusCode: 200...299)
            .responseDecodable(of: [PostsModel].self) {
                response in
                
                if let posts = response.value {
                    success(posts)
                } else {
                    print(response.error!)
                    failure(response.error)
                }
            }
    }
}
