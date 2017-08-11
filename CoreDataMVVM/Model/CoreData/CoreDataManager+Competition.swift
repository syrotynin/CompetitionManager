//
//  CoreDataManager+Competition.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataManager {
    
    func addCompetition(name: String, participants: NSSet? = nil, imageURL: String? = nil, success: (Competition) -> (), failed: (NSError) -> ()) {
        let context = persistentContainer.viewContext
        let entity = CoreDataManager.shared.entityForName(entityName: Competition.className)
        
        let competition = Competition(entity: entity, insertInto: context)
        competition.name = name
        competition.imageURL = imageURL
        competition.participants = participants
        
        do {
            try context.save()
            success(competition)
        }
        catch let error as NSError {
            failed(error)
        }
    }
}
