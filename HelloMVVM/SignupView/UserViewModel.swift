//
//  UserViewModel.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation

class UserViewModel {
    
    var firstName: Dynamic<String>
    
    init(_ firstName:String) {
        self.firstName = Dynamic<String>(firstName)
    }
    
}
