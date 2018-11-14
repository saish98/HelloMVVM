//
//  User.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation

class User {
    
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
