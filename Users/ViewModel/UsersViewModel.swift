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
    
    private let db = DataBase()
    private let usersNetwork: UsersNetworksDelegate
    
    init(usersNetwork: UsersNetworksDelegate = UsersNetworks()) {
        self.usersNetwork = usersNetwork
    }
    
    func getUsers() {
        let data = db.load()
        
        if data.count > 0 {
            for item in data {
                if let decode = try? JSONDecoder().decode(UserModel.self, from: item) {
                    self.users.append(decode)
                }
            }
            
            self.filteredUsers.append(contentsOf: self.users)
        } else {
            callApi()
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
    
    func changeSearch(search: String) {
        if search.isEmpty {
            self.filteredUsers = self.users
        } else {
            self.filteredUsers = self.users.filter { user in
                user.name.lowercased().contains(search.lowercased())
            }
        }
    }
    
    private func callApi() {
        showLoading = true
        
        self.usersNetwork.getUsers { response in
            var usersSet: Set<Data> = []
            
            for item in response {
                if let encoded = try? JSONEncoder().encode(item) {
                    usersSet.insert(encoded)
                }
            }
            
            self.db.save(items: usersSet)
            
            self.users.append(contentsOf: response)
            self.filteredUsers.append(contentsOf: self.users)
            
            self.loading()
        } failure: { error in
            self.loading()
        }
    }
}
