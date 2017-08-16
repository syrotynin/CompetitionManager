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
    let competitionTypes = ObservableArray<CompetitionType>(CompetitionType.all)
    var selectedType = CompetitionType.grid
    var expandedRows: [Int] = []
    
    func isSelected(_ type: CompetitionType) -> Bool {
        return selectedType == type
    }
    
    func selectType(_ row: Int) {
        selectedType = competitionTypes[row]
    }
    
    func trigger(_ row: Int) {
        if expandedRows.contains(row) {
            expandedRows.remove(at: expandedRows.index(of: row) ?? 0)
        }
        else {
            expandedRows.append(row)
        }
    }
}
