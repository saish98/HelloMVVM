//
//  SignupTableViewController.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import UIKit

class SignupTableViewController: UITableViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textFieldFirstName: BindingTextField! {
        didSet {
            textFieldFirstName.bind { self.signupViewModel.firstName = $0 }
        }
    }
    
    @IBOutlet weak var textFieldLastName: BindingTextField! {
        didSet {
            textFieldLastName.bind { self.signupViewModel.lastName = $0 }
        }
    }
    
    @IBOutlet weak var textFieldEmail: BindingTextField! {
        didSet {
            textFieldEmail.bind { self.signupViewModel.email = $0 }
        }
    }
    
    @IBOutlet weak var textFieldPassword: BindingTextField! {
        didSet {
            textFieldPassword.bind { self.signupViewModel.password = $0 }
        }
    }
    
    var signupViewModel: SignupViewModel!
    var userViewModel: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Example: Send data from View to View Model
        self.signupViewModel = SignupViewModel(firstName: self.textFieldFirstName.text ?? "",
                                         lastName: self.textFieldLastName.text ?? "",
                                         email: self.textFieldEmail.text ?? "",
                                         password: self.textFieldPassword.text ?? "")
        
        
        self.userViewModel = UserViewModel("Live Binding of First Name")
        self.userViewModel.firstName.bind{self.labelText.text = $0}
        
        self.tableView.tableFooterView = UIView()
    }
    
    //MARK: Private Functions
    private func save() {
        if self.signupViewModel.isValid {
            self.signupViewModel.apiSignup()
        }else {
            print(self.signupViewModel.brokenRules)
            var message = ""
            for rule in self.signupViewModel.brokenRules {
                message += "\(rule.message), "
            }
            
            message = String(message.dropLast(2))
            
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
        //MARK: Example: Send data from View Model to View
        self.userViewModel.firstName.value = "Live Binding of First Name: \(self.textFieldFirstName.text!)"
    }
    
    //MARK: Button Action
    @IBAction func buttonSignupAction(_ sender: Any) {
        save()
    }

}
