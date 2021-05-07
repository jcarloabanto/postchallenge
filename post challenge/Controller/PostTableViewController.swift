//
//  ViewController.swift
//  post challenge
//
//  Created by jcarloabanto on 5/4/21.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    var apiService = APIService()
    var posts = [PostViewModel]()
    var selectedViewModel: PostViewModel?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setUpUI()
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let vc = segue.destination as! DetailViewController
            vc.postViewModel = selectedViewModel!
        }
    }
    
    func setUpUI() {
        tableView.contentInset.top = 50
        tableView.tableFooterView = UIView()
        apiService.delegate = self
        apiService.getPostData()
        self.tableView.reloadData()
    }
}

extension PostTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as? PostTableViewCell
        cell?.postViewModel = posts[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedViewModel = posts[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
}

extension PostTableViewController: APIServiceDelegate {
    func didUpdatePost(_ apiService: APIService, postViewModel: [PostViewModel]) {
        self.posts = postViewModel
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
