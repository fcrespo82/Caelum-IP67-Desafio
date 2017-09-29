//
//  UserRepository.swift
//  Desafio
//
//  Created by ios7245 on 29/09/17.
//  Copyright © 2017 fcrespo82. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class UserRepository: NSObject {

    static let shared = UserRepository()
    
    private override init() {}
    
    var endpoint = Config.shared.userEndpoint
    
    func listaTodos() -> [User] {
        
        var usersReturn: [User]?
        
        Alamofire.request(endpoint).responseArray { (response: DataResponse<[User]>) in
            if let users = response.result.value {
                usersReturn = users
            }
            
        }
        
        return usersReturn!
    }
    
}
