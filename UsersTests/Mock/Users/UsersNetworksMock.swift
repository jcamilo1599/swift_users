//
//  UsersNetworksMock.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import Foundation
@testable import Users

class UsersNetworksMock: UsersNetworksDelegate {
    func getUsers(success: @escaping ([Users.UserModel]) -> (), failure: @escaping (Error?) -> ()) {
        guard let users = readFile() else {
            failure(nil)
            return
        }
        
        success(users)
    }
    
    private func readFile()->[Users.UserModel]? {
        let url = Bundle.main.url(forResource: "Users", withExtension: "json")
        if url == nil { return nil }
        
        let data = try? Data(contentsOf: url!)
        if data == nil { return nil }
        
        let decoder = JSONDecoder()
        let jsonData = try? decoder.decode([Users.UserModel].self, from: data!)
        if jsonData == nil { return nil }
    
        return jsonData
    }
}
