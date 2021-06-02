//
//  User_tests+CoreDataProperties.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData


extension User_tests {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User_tests> {
        return NSFetchRequest<User_tests>(entityName: "User_tests")
    }

    @NSManaged public var user_id: Int64
    @NSManaged public var test_id: Int64

}

extension User_tests : Identifiable {

}
