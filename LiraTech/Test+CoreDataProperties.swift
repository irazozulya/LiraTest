//
//  Test+CoreDataProperties.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData


extension Test {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test> {
        return NSFetchRequest<Test>(entityName: "Test")
    }

    @NSManaged public var test_id: Int64
    @NSManaged public var title: String?
    @NSManaged public var questions: NSSet?
    @NSManaged public var photos: Photos?
    @NSManaged public var user_tests: User_tests?
    @NSManaged public var user_answers: User_answers?

}

// MARK: Generated accessors for questions
extension Test {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Test_questions)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Test_questions)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}

extension Test : Identifiable {

}
