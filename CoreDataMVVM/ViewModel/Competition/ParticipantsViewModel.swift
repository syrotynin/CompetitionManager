//
//  ParticipantsViewModel.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

class ParticipantsViewModel {
    
    let searchString = Observable<String?>("")
    let validSelection = Observable<Bool>(false)
    let searchResults = MutableObservableArray<Participant>([])
    
    init() {
        _ = searchString.observeNext(with: { [unowned self] text in
            if let text = text {
                self.executeSearch(text)
            }
        })
    }
    
    func executeSearch(_ text: String) {
        // clear previous results
        self.searchResults.removeAll()
        
    }
}
