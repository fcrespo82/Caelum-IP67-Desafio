//
//  PostsRepository.swift
//  Desafio
//
//  Created by ios7245 on 29/09/17.
//  Copyright © 2017 fcrespo82. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class PostsRepository: NSObject {

    static let shared = PostsRepository()
    
    private override init() {}
    
    var endpoint = Config.shared.postsEndpoint
    
    func listaTodos(posts: inout [Post]?) {
     
        var postsReturn = posts
        
        Alamofire.request(endpoint).responseArray { (response: DataResponse<[Post]>) in
            if let postsInner = response.result.value {
                postsReturn = postsInner
            }

        }
        
        posts = postsReturn
    }
    
}
