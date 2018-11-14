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
