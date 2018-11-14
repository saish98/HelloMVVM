//
//  BrokenRule.swift
//  HelloMVVM
//
//  Created by Heady on 15/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation

struct BrokenRule {
    var propertyName: String
    var message: String
}

protocol BrokenRuleProtocole {
    var brokenRules: [BrokenRule] { get set }
    var isValid: Bool { mutating get }
    
}


extension String {
    
    func isValidInput() -> Bool {
        let myCharSet = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let output: String = self.trimmingCharacters(in: myCharSet.inverted)
        let isValid: Bool = (self == output && self.count != 0)
        
        return isValid
    }
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
