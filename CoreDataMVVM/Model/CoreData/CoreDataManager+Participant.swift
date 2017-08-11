//
//  CoreDataManager+Participant.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataManager {
    
    func addParticipant(name: String, photoURL: String? = nil, success: (Participant) -> (), failed: (NSError) -> ()) {
        let context = persistentContainer.viewContext
        let entity = CoreDataManager.shared.entityForName(entityName: Participant.className)
        
        let user = Participant(entity: entity, insertInto: context)
        user.name = name
        user.photoURL = photoURL

        do {
            try context.save()
            success(user)
        }
        catch let error as NSError {
            context.delete(user)
            failed(error)
        }
    }
    
    func allUsers(success: ([Participant]) -> (), failed: (NSError) -> ()) {
        fetchUsers("", success: success, failed: failed)
    }
    
    func fetchUsers(_ searchString: String, success: ([Participant]) -> (), failed: (NSError) -> ()) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Participant>(entityName: Participant.className)
        
        let text = searchString.trimmingCharacters(in: .whitespacesAndNewlines)
        if text.characters.count > 0 {
            fetchRequest.predicate = NSPredicate(format: "name beginswith[c] %@", text)
        }
        
        do {
            let people = try context.fetch(fetchRequest)
            success(people)
        }
        catch let error as NSError {
            failed(error)
        }
    }
}
