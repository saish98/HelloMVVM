//
//  SignupTableViewController.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import UIKit

class SignupTableViewController: UITableViewController {

    @IBOutlet weak var textFieldFirstName: BindingTextField! {
        didSet {
            textFieldFirstName.bind { self.viewModel.firstName = $0 }
        }
    }
    
    @IBOutlet weak var textFieldLastName: BindingTextField! {
        didSet {
            textFieldLastName.bind { self.viewModel.lastName = $0 }
        }
    }
    
    @IBOutlet weak var textFieldEmail: BindingTextField! {
        didSet {
            textFieldEmail.bind { self.viewModel.email = $0 }
        }
    }
    
    @IBOutlet weak var textFieldPassword: BindingTextField! {
        didSet {
            textFieldPassword.bind { self.viewModel.password = $0 }
        }
    }
    
    var viewModel: SignupViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.viewModel = SignupViewModel(firstName: self.textFieldFirstName.text ?? "",
                                         lastName: self.textFieldLastName.text ?? "",
                                         email: self.textFieldEmail.text ?? "",
                                         password: self.textFieldPassword.text ?? "")
        
        self.tableView.tableFooterView = UIView()
        
    }
    
    //MARK: Private Functions
    private func save() {
        if self.viewModel.isValid {
            self.viewModel.apiSignup()
        }else {
            print(self.viewModel.brokenRules)
        }
        
    }
    
    //MARK: Button Action
    @IBAction func buttonSignupAction(_ sender: Any) {
        save()
    }

}
