//
//  UsersViewModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var filteredUsers: [UserModel] = []
    @Published var showLoading = false
    
    private let usersNetwork: UsersNetworksDelegate
    
    init(usersNetwork: UsersNetworksDelegate = UsersNetworks()) {
        self.usersNetwork = usersNetwork
    }
    
    func getUsers() {
        users = []
        showLoading = true
        
        self.usersNetwork.getUsers { response in
            self.loading()
            
            self.users.append(contentsOf: response)
            self.filteredUsers.append(contentsOf: response)
        } failure: { error in
            self.loading()
        }
    }
    
    func loading(){
        withAnimation(.spring()) {
            showLoading.toggle()
        }
    }
    
    func changeSearch(search: String) {
        if search.isEmpty {
            self.filteredUsers = self.users
        } else {
            self.filteredUsers = self.users.filter { user in
                user.name.lowercased().contains(search.lowercased())
            }
        }
    }
}
