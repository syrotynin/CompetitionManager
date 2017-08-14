//
//  CompetitionViewModel.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 8/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

class CompetitionViewModel {
    
    let title = Observable<String?>("")
    let type = Observable<CompetitionType>(.grid)
}
