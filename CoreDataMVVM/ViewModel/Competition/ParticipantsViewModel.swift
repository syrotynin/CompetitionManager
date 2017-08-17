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
    
    var competition: Competition?
    
    let searchString = Observable<String?>("")
    let validSelection = Observable<Bool>(false)
    let searchResults = MutableObservableArray<Participant>([])
    let selectedParticipants = MutableObservableArray<Participant>([])
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
    
    func selected(_ row: Int) {
        let participant = searchResults[row]
        if isSelected(participant) {
            selectedParticipants.remove(at: selectedParticipants.index(of: participant) ?? 0)
        } else {
            selectedParticipants.append(participant)
        }
    }
    
    func isSelected(_ participant: Participant) -> Bool {
        return selectedParticipants.contains(participant)
    }
    
    func updateCompetition(_ completion: @escaping ()->()) {
        if let competition = competition {
            CoreDataManager.shared.updateCompetition(competition: competition, participants: NSSet(array: selectedParticipants.array), success: { (competition) in
                completion()
            }) { (error) in
                self.errorMessages.next(error.localizedDescription)
            }
        }
    }
}
