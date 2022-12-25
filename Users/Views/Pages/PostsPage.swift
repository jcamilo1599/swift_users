//
//  PostsPage.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 23/12/22.
//

import SwiftUI

struct PostsPage: View {
    @State private var posts: [PostsModel] = []
    @State private var showLoading = true
    
    var userId: Int
    var userName: String
    
    var body: some View {
        buildBody
            .navigationBarTitle(userName, displayMode: .large)
            .accentColor(.orange)
            .overlay(SplashScreenView(show: showLoading))
            .onAppear() {
                getPosts()
            }
    }
    
    private var buildBody:some View {
        List {
            if posts.isEmpty {
                NoInfoView()
            } else {
                
                ForEach(posts, id: \.id) { post in
                    CardPostAtom(post: post)
                }
            }
        }
    }
    
    private func getPosts() {
        PostsNetworks.shared.getPosts { response in
            hideLoading()
            posts.append(contentsOf: response)
        } failure: { error in
            hideLoading()
        }
    }
    
    private func hideLoading(){
        withAnimation(.spring()) {
            showLoading.toggle()
        }
    }
}

struct PostsPage_Previews: PreviewProvider {
    static var previews: some View {
        PostsPage(
            userId: 1,
            userName: "Juan Camilo"
        )
    }
}
