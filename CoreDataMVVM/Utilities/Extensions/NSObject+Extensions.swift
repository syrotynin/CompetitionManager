//
//  NSObject+Extensions.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation

extension NSObject {
    
    // MARK: Class name
    
    class var className: String {
        return String(describing: self)
    }
}
