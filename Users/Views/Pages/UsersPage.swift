//
//  UsersView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import SwiftUI

struct UsersPage: View {
    @State private var users: [UserModel] = []
    @State private var showLoading = true
    @State var showPosts = false
    
    var body: some View {
        NavigationView {
            if (users.isEmpty) {
                NoInfoView()
            } else {
                List {
                    ForEach(0..<users.count, id: \.self) { index in
                        CardAtom(user: users[index])
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .overlay(SplashScreenView(show: showLoading))
        .onAppear() {
            getUsers()
        }
    }
    
    private func getUsers() {
        UsersNetworks.shared.getUsers { response in
            hideLoading()
            users.append(contentsOf: response)
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

struct UsersPage_Previews: PreviewProvider {
    static var previews: some View {
        UsersPage()
    }
}
