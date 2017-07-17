//
//  Team+CoreDataProperties.swift
//  
//
//  Created by Serhii Syrotynin on 7/14/17.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var capacity: Int16
    @NSManaged public var imageURL: String?
    @NSManaged public var name: String
    @NSManaged public var participant: NSSet?
    @NSManaged public var competition: NSSet?

}

// MARK: Generated accessors for participant
extension Team {

    @objc(addParticipantObject:)
    @NSManaged public func addToParticipant(_ value: Participant)

    @objc(removeParticipantObject:)
    @NSManaged public func removeFromParticipant(_ value: Participant)

    @objc(addParticipant:)
    @NSManaged public func addToParticipant(_ values: NSSet)

    @objc(removeParticipant:)
    @NSManaged public func removeFromParticipant(_ values: NSSet)

}

// MARK: Generated accessors for competition
extension Team {

    @objc(addCompetitionObject:)
    @NSManaged public func addToCompetition(_ value: Competition)

    @objc(removeCompetitionObject:)
    @NSManaged public func removeFromCompetition(_ value: Competition)

    @objc(addCompetition:)
    @NSManaged public func addToCompetition(_ values: NSSet)

    @objc(removeCompetition:)
    @NSManaged public func removeFromCompetition(_ values: NSSet)

}
