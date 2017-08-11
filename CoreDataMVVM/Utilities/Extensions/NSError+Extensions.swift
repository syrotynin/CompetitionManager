//
//  NSError+Extensions.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation

extension NSError {
    public static var noEntity: NSError {
        return NSError(domain: "Unable to get entity description", code: 0, userInfo: nil)
    }
    
    public static var noError: NSError {
        return NSError(domain: "No error. Something went wrong", code: 0, userInfo: nil)
    }
}
