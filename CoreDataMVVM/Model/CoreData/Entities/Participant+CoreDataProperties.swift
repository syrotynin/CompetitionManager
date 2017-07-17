//
//  Participant+CoreDataProperties.swift
//  
//
//  Created by Serhii Syrotynin on 7/14/17.
//
//

import Foundation
import CoreData


extension Participant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Participant> {
        return NSFetchRequest<Participant>(entityName: "Participant")
    }

    @NSManaged public var name: String
    @NSManaged public var photoURL: String?
    @NSManaged public var team: NSSet?
    @NSManaged public var competition: NSSet?

}

// MARK: Generated accessors for team
extension Participant {

    @objc(addTeamObject:)
    @NSManaged public func addToTeam(_ value: Team)

    @objc(removeTeamObject:)
    @NSManaged public func removeFromTeam(_ value: Team)

    @objc(addTeam:)
    @NSManaged public func addToTeam(_ values: NSSet)

    @objc(removeTeam:)
    @NSManaged public func removeFromTeam(_ values: NSSet)

}

// MARK: Generated accessors for competition
extension Participant {

    @objc(addCompetitionObject:)
    @NSManaged public func addToCompetition(_ value: Competition)

    @objc(removeCompetitionObject:)
    @NSManaged public func removeFromCompetition(_ value: Competition)

    @objc(addCompetition:)
    @NSManaged public func addToCompetition(_ values: NSSet)

    @objc(removeCompetition:)
    @NSManaged public func removeFromCompetition(_ values: NSSet)

}
