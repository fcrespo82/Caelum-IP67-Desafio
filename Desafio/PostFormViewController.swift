//
//  PostFormViewController.swift
//  Desafio
//
//  Created by ios7245 on 29/09/17.
//  Copyright © 2017 fcrespo82. All rights reserved.
//

import UIKit

class PostFormViewController: UIViewController {

    var post: Post?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var boduLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let post = post {
            self.titleLabel.text = post.title
            self.boduLabel.text = post.body
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

}
