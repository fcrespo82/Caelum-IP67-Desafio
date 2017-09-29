//
//  Post.swift
//  Desafio
//
//  Created by ios7245 on 29/09/17.
//  Copyright © 2017 fcrespo82. All rights reserved.
//

import UIKit
import ObjectMapper

class Post: Mappable {

    var id: Double?
    var userId: Double?
    var title: String?
    var body: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
    }
    
}
