//
//  UsersView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import SwiftUI

struct UsersPage: View {
    @ObservedObject private var viewModel = UsersViewModel()
    @State private var searchText = ""
    
    var body: some View {
        buildBody
            .accentColor(.orange)
            .overlay(SplashScreenView(show: viewModel.showLoading))
            .onAppear() {
                viewModel.getUsers()
            }
    }
    
    private var buildBody:some View {
        NavigationView {
            List {
                TextField("Search", text: $searchText)
                    .textInputAutocapitalization(.never)
                    .onChange(of: searchText, perform: viewModel.changeSearch)
                
                if viewModel.filteredUsers.isEmpty {
                    NoInfoView()
                } else {
                    ForEach(viewModel.filteredUsers, id: \.id) { user in
                        CardUserAtom(user: user)
                    }
                }
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct UsersPage_Previews: PreviewProvider {
    static var previews: some View {
        UsersPage()
    }
}
