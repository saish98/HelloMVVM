//
//  SignupViewModel.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation

class SignupViewModel: BrokenRuleProtocole {
    
    var brokenRules: [BrokenRule] = [BrokenRule]()
    var isValid: Bool {
        get {
            self.brokenRules = [BrokenRule]()
            self.validate()
            return self.brokenRules.count == 0 ? true:false
        }
    }
    
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    
    init(firstName :String, lastName :String, email :String, password :String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    func apiSignup() {
        
    }
}

extension SignupViewModel {
    
    private func validate() {
        if !firstName.trimmingCharacters(in: .whitespaces).isValidInput() {
            self.brokenRules.append(BrokenRule(propertyName: "First Name", message: "FirstName: A to Z Charaters Only\n"))
        }
        
        if !lastName.trimmingCharacters(in: .whitespaces).isValidInput() {
            self.brokenRules.append(BrokenRule(propertyName: "Last Name", message: "LastName: A to Z Charaters Only\n"))
        }
        
        if !email.trimmingCharacters(in: .whitespaces).isValidEmail() {
            self.brokenRules.append(BrokenRule(propertyName: "Email", message: "Invalid Email\n"))
        }
        
        if password.trimmingCharacters(in: .whitespaces).isEmpty {
            self.brokenRules.append(BrokenRule(propertyName: "Password", message: "Password cannot be empty"))
        }
    }
}
