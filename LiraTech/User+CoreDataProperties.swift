//
//  User+CoreDataProperties.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var full_name: String?
    @NSManaged public var pass: String?
    @NSManaged public var user_id: Int64
    @NSManaged public var answers: NSSet?
    @NSManaged public var tests: User_tests?

}

// MARK: Generated accessors for answers
extension User {

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: User_answers)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: User_answers)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSSet)

}

extension User : Identifiable {

}
