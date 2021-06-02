//
//  Test_answers+CoreDataProperties.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData


extension Test_answers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test_answers> {
        return NSFetchRequest<Test_answers>(entityName: "Test_answers")
    }

    @NSManaged public var answer: String?
    @NSManaged public var answer_id: Int64
    @NSManaged public var question_id: Int64

}

extension Test_answers : Identifiable {

}
