//
//  UsersNetworksTests.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import XCTest
@testable import Users

final class UsersNetworksTests: XCTestCase {
    func test_usersNetworks() {
        let sut = UsersViewModel(usersNetwork: UsersNetworksMock())
        sut.getUsers()
        
        XCTAssert(sut.users.count == 10)
    }
}
