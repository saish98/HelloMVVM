//
//  SignupViewModel.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation
//class Dynamic<T> {
//    typealias Listener = (T) -> Void
//    var listener: Listener?
//    
//    var value: T? {
//        didSet {
//            listener?(value!)
//        }
//    }
//    
//    init(_ v:T) {
//        value = v
//    }
//    
//    func bind(listener: Listener?) {
//        self.listener = listener
//        listener?(value!)
//    }
//}

struct BrokenRule {
    var propertyName: String
    var message: String
}

protocol ViewModel {
    var brokenRules: [BrokenRule] { get set }
    var isValid: Bool { mutating get }
    
}
class SignupViewModel: ViewModel {
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
        if firstName.isEmpty {
            self.brokenRules.append(BrokenRule(propertyName: "First Name", message: "Invalid First Name"))
        }
        
        if lastName.isEmpty {
            self.brokenRules.append(BrokenRule(propertyName: "Last Name", message: "Invalid Last Name"))
        }
        
        if email.isEmpty {
            self.brokenRules.append(BrokenRule(propertyName: "Email", message: "Invalid Email"))
        }
        
        if password.isEmpty {
            self.brokenRules.append(BrokenRule(propertyName: "Password", message: "Invalid Password"))
        }
    }
}
