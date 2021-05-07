//
//  PostTableViewCell.swift
//  post challenge
//
//  Created by jcarloabanto on 5/7/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var postViewModel: PostViewModel! {
        didSet {
            self.titleLabel?.text = postViewModel.title
            self.imgView.image = postViewModel.loadImage(postViewModel.thumbnailUrl)
        }
    }
}
