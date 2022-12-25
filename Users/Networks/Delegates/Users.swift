//
//  Users.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import Foundation

protocol UsersNetworksDelegate {
    func getUsers(
        success: @escaping (_ users: [UserModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    )
}
