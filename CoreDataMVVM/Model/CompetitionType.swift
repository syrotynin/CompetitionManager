//
//  CompetitionType.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 8/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation
import UIKit

enum CompetitionType: Int {
    case grid = 0
    case elimination = 1
    
    public static var all: [CompetitionType] {
        return [.grid, .elimination]
    }
    
    var image: UIImage {
        switch self {
        case .grid:
            return #imageLiteral(resourceName: "grid")
        case .elimination:
            return #imageLiteral(resourceName: "elimination")
        }
    }
    
    var description: String {
        switch self {
        case .grid:
            return "Grid (against all with points)"
        case .elimination:
            return "Elimination (lost - you out)"
        }
    }
}
