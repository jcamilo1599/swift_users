//
//  PostsPage.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 23/12/22.
//

import SwiftUI

struct PostsPage: View {
    @State private var showAlert = false
    @ObservedObject private var viewModel: PostsViewModel
    var user: UserModel
    
    init(user: UserModel) {
        self.viewModel = PostsViewModel(userId: user.id)
        self.user = user
    }
    
    var body: some View {
        buildBody
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(user.name).font(.headline)
                        Text(user.email).font(.subheadline)
                    }
                }
            }
            .accentColor(.orange)
            .overlay(SplashScreenView(show: viewModel.showLoading))
            .onAppear() {
                viewModel.getPosts()
            }
    }
    
    private var buildBody:some View {
        ZStack {
            List {
                if viewModel.posts.isEmpty {
                    NoInfoView()
                } else {
                    ForEach(viewModel.posts, id: \.id) { post in
                        CardPostAtom(post: post)
                    }
                }
            }
            
            FloatingButton(action: {
                showAlert = true
            }, icon: "phone.fill")
                .alert(
                    user.name + " number is " + user.phone,
                    isPresented: $showAlert
                ) {
                    Button("OK", role: .cancel) { }
                }
        }
    }
}

struct PostsPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostsPage(user: UserModel(
                id: 1,
                name: "Juan",
                email: "juancamilomarinochoa@gmail.com",
                phone: "3005190365"
            ))
        }
    }
}
