//
//  CompetitionType.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 8/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation

enum CompetitionType: String {
    case grid = "Grid (against all with points)"
    case elimination = "Elimination (lost - you out)"
    
    public static var all: [CompetitionType] {
        return [.grid, .elimination]
    }
}
