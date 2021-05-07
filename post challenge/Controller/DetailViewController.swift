//
//  DetailViewController.swift
//  post challenge
//
//  Created by jcarloabanto on 5/7/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var postViewModel: PostViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }

    func setUpView() {
        DispatchQueue.main.async {
            self.titleLabel.text = self.postViewModel?.title
            self.imgView.image = self.postViewModel?.loadImage(self.postViewModel?.imageUrl ?? "")
            self.bodyLabel.text = self.postViewModel?.body
        }
    }
}
