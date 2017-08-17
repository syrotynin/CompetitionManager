//
//  Competition+CoreDataProperties.swift
//  
//
//  Created by Serhii Syrotynin on 8/17/17.
//
//

import Foundation
import CoreData


extension Competition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Competition> {
        return NSFetchRequest<Competition>(entityName: "Competition")
    }

    @NSManaged public var imageURL: String?
    @NSManaged public var name: String?
    @NSManaged public var type: Int16
    @NSManaged public var participants: NSSet?
    @NSManaged public var teams: NSSet?

}

// MARK: Generated accessors for participants
extension Competition {

    @objc(addParticipantsObject:)
    @NSManaged public func addToParticipants(_ value: Participant)

    @objc(removeParticipantsObject:)
    @NSManaged public func removeFromParticipants(_ value: Participant)

    @objc(addParticipants:)
    @NSManaged public func addToParticipants(_ values: NSSet)

    @objc(removeParticipants:)
    @NSManaged public func removeFromParticipants(_ values: NSSet)

}

// MARK: Generated accessors for teams
extension Competition {

    @objc(addTeamsObject:)
    @NSManaged public func addToTeams(_ value: Team)

    @objc(removeTeamsObject:)
    @NSManaged public func removeFromTeams(_ value: Team)

    @objc(addTeams:)
    @NSManaged public func addToTeams(_ values: NSSet)

    @objc(removeTeams:)
    @NSManaged public func removeFromTeams(_ values: NSSet)

}
