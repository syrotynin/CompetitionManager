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
    
    func addParticipant(name: String, photoURL: String? = nil, success: (Participant) -> (), failed: (NSError?) -> ()) {
        let context = persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: Participant.className, in: context) else {
            failed(NSError.noEntity)
            return
        }
        
        let user = Participant(entity: entity, insertInto: context)
        user.name = name
        user.photoURL = photoURL

        do {
            try context.save()
            success(user)
        }
        catch let error as NSError {
            failed(error)
        }
    }
    
    func allUsers(success: ([Participant]) -> (), failed: (NSError?) -> ()) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Participant>(entityName: Participant.className)
        
        do {
            let people = try context.fetch(fetchRequest)
            success(people)
        }
        catch let error as NSError {
            failed(error)
        }
    }
}
