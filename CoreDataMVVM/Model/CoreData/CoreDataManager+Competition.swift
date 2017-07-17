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
    
    func addCompetition(name: String, participants: NSSet? = nil, imageURL: String? = nil, success: (Competition) -> (), failed: (NSError?) -> ()) {
        let context = persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: Competition.className, in: context) else {
            failed(NSError.noEntity)
            return
        }
        
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
