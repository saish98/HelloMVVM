//
//  BindingTextField.swift
//  HelloMVVM
//
//  Created by Heady on 14/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import UIKit

class BindingTextField: UITextField {

    var textChange: (String) -> () = { _ in }
    
    func bind(callback: @escaping (String) -> ()) {
        
        self.textChange = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.textChange(textField.text!)
    }
}
