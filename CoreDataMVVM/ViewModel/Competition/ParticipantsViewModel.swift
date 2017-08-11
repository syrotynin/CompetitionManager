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
    let errorMessages = PublishSubject<String, NoError>()
    
    init() {
        _ = searchString.observeNext(with: { [unowned self] text in
            if let text = text {
                self.executeSearch(text)
            }
        })
    }
    
    func executeSearch(_ text: String) {
        print("Searching for... \(text)")
        CoreDataManager.shared.fetchUsers(text, success: { (participants) in
            // clear previous results
            self.searchResults.removeAll()
            if participants.count > 0 {
                self.searchResults.insert(contentsOf: participants, at: 0)
            }
            
        }) { (error) in
            self.errorMessages.next(error.localizedDescription)
        }
    }
}
