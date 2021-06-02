//
//  User_answers+CoreDataProperties.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData


extension User_answers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User_answers> {
        return NSFetchRequest<User_answers>(entityName: "User_answers")
    }

    @NSManaged public var answer_id: Int64
    @NSManaged public var question_id: Int64
    @NSManaged public var test_id: Int64
    @NSManaged public var user_id: Int64
    @NSManaged public var test_check: Test_questions?

}

extension User_answers : Identifiable {

}
