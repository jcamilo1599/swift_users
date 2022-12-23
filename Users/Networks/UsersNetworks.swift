//
//  UsersNetworks.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import Foundation
import Alamofire

final class UsersNetworks: ObservableObject {
    private let path = "/users"
    
    static let shared = UsersNetworks()
    
    func getUsers(
        success: @escaping (_ users: [UserModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
    }
}
