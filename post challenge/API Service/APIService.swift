//
//  APIService.swift
//  post challenge
//
//  Created by jcarloabanto on 5/4/21.
//

import Foundation

protocol APIServiceDelegate {
    func didUpdatePost(_ apiService: APIService, postViewModel: [PostViewModel])
}

struct APIService {
    
    var delegate: APIServiceDelegate?

    func getPostData() {
        if let url = URL(string: "https://mocki.io/v1/b4da9290-cb8b-41ef-8c23-8c85e04aabcb") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    if let postViewModelArray = self.parseJSON(safeData) {
                        self.delegate?.didUpdatePost(self, postViewModel: postViewModelArray)
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [PostViewModel]? {
        let decoder = JSONDecoder()
        
        do {
            var postViewModelArray = [PostViewModel]()
            let decodedPostArray = try decoder.decode(Post.self, from: data)
            
            for eachPost in decodedPostArray.data {
                let postViewModel = PostViewModel(post: eachPost)
                postViewModelArray.append(postViewModel)
            }
            
            return postViewModelArray
        } catch {
            return nil
        }
    }
}
