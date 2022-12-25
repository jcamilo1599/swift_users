//
//  PostsViewModelTests.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import XCTest
@testable import Users

final class PostsViewModelTests: XCTestCase {
    func test_postsNetworks() {
        let sut = PostsViewModel(postsNetwork: PostsNetworksMock(), userId: nil)
        sut.getPosts()
        
        XCTAssert(sut.posts.count == 100)
    }
}
