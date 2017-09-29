//
//  Config.swift
//  Desafio
//
//  Created by ios7245 on 29/09/17.
//  Copyright © 2017 fcrespo82. All rights reserved.
//

import Foundation


class Config: NSObject {
    
    static let shared = Config()
    
    private override init() {}
    
    var postsEndpoint = "https://jsonplaceholder.typicode.com/posts"

    var userEndpoint = "https://jsonplaceholder.typicode.com/users"

}
