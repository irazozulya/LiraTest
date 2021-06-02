//
//  Test_questions+CoreDataProperties.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData


extension Test_questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test_questions> {
        return NSFetchRequest<Test_questions>(entityName: "Test_questions")
    }

    @NSManaged public var answer_id: Int64
    @NSManaged public var question: String?
    @NSManaged public var question_id: Int64
    @NSManaged public var test_id: Int64
    @NSManaged public var correct_answers: NSSet?

}

// MARK: Generated accessors for correct_answers
extension Test_questions {

    @objc(addCorrect_answersObject:)
    @NSManaged public func addToCorrect_answers(_ value: Test_answers)

    @objc(removeCorrect_answersObject:)
    @NSManaged public func removeFromCorrect_answers(_ value: Test_answers)

    @objc(addCorrect_answers:)
    @NSManaged public func addToCorrect_answers(_ values: NSSet)

    @objc(removeCorrect_answers:)
    @NSManaged public func removeFromCorrect_answers(_ values: NSSet)

}

extension Test_questions : Identifiable {

}
