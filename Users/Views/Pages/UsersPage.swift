//
//  UsersView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import SwiftUI

struct UsersPage: View {
    @State private var users: [UserModel] = []
    @State private var filteredUsers: [UserModel] = []
    @State private var searchText = ""
    @State private var showLoading = true
    @State var showPosts = false
    
    var body: some View {
        NavigationView {
            if filteredUsers.isEmpty {
                NoInfoView()
            } else {
                List {
                    ForEach(0..<filteredUsers.count, id: \.self) { index in
                        CardAtom(user: filteredUsers[index])
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { search in
            if search.isEmpty {
                filteredUsers = users
            } else {
                filteredUsers = users.filter { user in
                    user.name.lowercased().contains(search.lowercased())
                }
            }
        }
        .accentColor(.orange)
        .overlay(SplashScreenView(show: showLoading))
        .onAppear() {
            getUsers()
        }
    }
    
    private func getUsers() {
        UsersNetworks.shared.getUsers { response in
            hideLoading()
            users.append(contentsOf: response)
            filteredUsers = users
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
