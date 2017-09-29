//
//  PostsTableViewController.swift
//  Desafio
//
//  Created by ios7245 on 29/09/17.
//  Copyright © 2017 fcrespo82. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class PostsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var postsTableView: UITableView!
    var posts: [Post]?
    let repository = PostsRepository.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.postsTableView.delegate = self
        self.postsTableView.dataSource = self
        // repository.listaTodos(posts: &self.posts)
        
        Alamofire.request(Config.shared.postsEndpoint).responseArray { (response: DataResponse<[Post]>) in
            if let postsInner = response.result.value {
                self.posts = postsInner
                self.postsTableView.reloadData()
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let posts = self.posts else { return 0 }
        return posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = self.postsTableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        
        if cell == nil {
            cell = UITableViewCell(style: .value2, reuseIdentifier: "postCell")
        }
        
        let post = self.posts?[indexPath.row]
        
        cell?.textLabel?.text = post?.title
        Alamofire.request("\(Config.shared.userEndpoint)/\(post?.userId)").responseObject { (response: DataResponse<User>) in
            if let userInner = response.result.value {
                cell?.detailTextLabel?.text = userInner.name
            }
            
        }

        
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = self.posts?[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let postForm = storyboard.instantiateViewController(withIdentifier: "PostForm") as! PostFormViewController
        
        postForm.post = post

        self.navigationController?.pushViewController(postForm, animated: true)
        
    }
    
}
