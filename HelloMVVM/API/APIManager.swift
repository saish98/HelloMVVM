//
//  APIManager.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation

class APIManager {
    
    func getAllUsers() -> [User] {
        
        var users = [User]()
        users.append(User(firstName: "Mohammad", lastName: "Azam", email: "azamsharp@gmail.com", password: "password"))
        users.append(User(firstName: "John", lastName: "Doe", email: "johndoe@gmail.com", password: "password"))
        users.append(User(firstName: "Mary", lastName: "Kate", email: "marykate@gmail.com", password: "password"))
        users.append(User(firstName: "Alex", lastName: "Lowe", email: "alexlowe@gmail.com", password: "password"))
        
        return users
        
    }
}
