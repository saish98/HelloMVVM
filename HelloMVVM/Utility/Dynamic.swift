//
//  Dynamic.swift
//  HelloMVVM
//
//  Created by Heady on 15/11/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T? {
        didSet {
            listener?(value!)
        }
    }
    
    init(_ v:T) {
        value = v
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value!)
    }
}
