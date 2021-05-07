//
//  PostViewModel.swift
//  post challenge
//
//  Created by jcarloabanto on 5/4/21.
//

import Foundation
import UIKit
struct PostViewModel {
    let title: String
    let body: String
    let thumbnailUrl: String
    let imageUrl: String
    init(post: PostData) {
        self.title = "Title: \(post.title)"
        self.body = post.body
        self.thumbnailUrl = post.thumbnailUrl
        self.imageUrl = post.imageUrl
    }
    
    func loadImage(_ url: String) -> UIImage? {
        guard let imageUrl = URL(string: url)  else { return nil }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return nil }
        let image = UIImage(data: imageData)
        return image
    }
    
}
