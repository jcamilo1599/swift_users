//
//  PostsViewModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import Foundation
import SwiftUI

class PostsViewModel: ObservableObject {
    @Published var posts: [PostsModel] = []
    @Published var showLoading = false
    
    private let postsNetwork: PostsNetworksDelegate
    
    init(
        postsNetwork: PostsNetworksDelegate = PostsNetworks(userId: nil),
        userId: Int?
    ) {
        if userId != nil {
            self.postsNetwork = PostsNetworks(userId: userId)
        } else {
            self.postsNetwork = postsNetwork
        }
    }
    
    func getPosts() {
        posts = []
        showLoading = true
        
        self.postsNetwork.getPosts() { response in
            self.loading()
            self.posts.append(contentsOf: response)
        } failure: { error in
            self.loading()
        }
    }
    
    func loading(){
        let seconds = DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            withAnimation(.spring()) {
                self.showLoading.toggle()
            }
        }
    }
}
