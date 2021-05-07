//
//  Post.swift
//  post challenge
//
//  Created by jcarloabanto on 5/4/21.
//

import Foundation

struct Post: Decodable {
    let data: [PostData]
}

struct PostData: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    let imageUrl: String
    let thumbnailUrl: String

}
