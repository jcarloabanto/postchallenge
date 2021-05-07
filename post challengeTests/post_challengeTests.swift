//
//  post_challengeTests.swift
//  post challengeTests
//
//  Created by jcarloabanto on 5/7/21.
//

import XCTest
@testable import post_challenge
class post_challengeTests: XCTestCase {

    func testPostViewModel() {
        let postData = PostData(userId: 1, id: 1, title: "test", body: "this is just a test", imageUrl: "https://via.placeholder.com/600/771796", thumbnailUrl: "https://via.placeholder.com/150/771796")
        let postViewModel = PostViewModel(post: postData)
        XCTAssertEqual("Title: \(postData.title)", postViewModel.title)
        XCTAssertEqual(postData.body, postViewModel.body)
    }

}
