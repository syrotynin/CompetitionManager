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
    
    func addCompetition(name: String, type: Int16 = 0, participants: NSSet? = nil, imageURL: String? = nil, success: (Competition) -> (), failed: (NSError) -> ()) {
        let context = persistentContainer.viewContext
        let entity = CoreDataManager.shared.entityForName(entityName: Competition.className)
        
        let competition = Competition(entity: entity, insertInto: context)
        competition.name = name
        competition.imageURL = imageURL
        competition.participants = participants
        competition.type = type
        
        do {
            try context.save()
            success(competition)
        }
        catch let error as NSError {
            context.delete(competition)
            failed(error)
        }
    }
    
    func updateCompetition(competition: Competition, name: String? = nil, type: Int16? = nil, participants: NSSet? = nil, imageURL: String? = nil, success: (Competition) -> (), failed: (NSError) -> ()) {
        let context = persistentContainer.viewContext
        
        if let name = name {
            competition.name = name
        }
        if let type = type {
            competition.type = type
        }
        if let participants = participants {
            competition.participants = participants
        }
        if let imageURL = imageURL {
            competition.imageURL = imageURL
        }
        
        do {
            try context.save()
            success(competition)
        }
        catch let error as NSError {
            failed(error)
        }
    }
}
