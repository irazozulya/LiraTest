//
//  Photos+CoreDataProperties.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData


extension Photos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photos> {
        return NSFetchRequest<Photos>(entityName: "Photos")
    }

    @NSManaged public var photo: Data?
    @NSManaged public var photo_id: Int64
    @NSManaged public var test_id: Int64

}
