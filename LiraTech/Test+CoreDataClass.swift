//
//  Test+CoreDataClass.swift
//  LiraTech
//
//  Created by Ira Zozulya on 31.05.2021.
//
//

import Foundation
import CoreData

@objc(Test)
public class Test: NSManagedObject {
    static func add(title: String?, test_id: Int64) -> Bool {
        if(title == nil || test_id == 0) {
            return false;
        }
        
        let persistentContainer: NSPersistentContainer = {
              let container = NSPersistentContainer(name: "Model")
              container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                  if let error = error as NSError? {
                      fatalError("Unresolved error \(error), \(error.userInfo)")
                  }
              })
              return container
          }()
        
        let context: NSManagedObjectContext = {
            return persistentContainer.viewContext
          }()
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Test", in: context)
            
        let newItem = NSManagedObject(entity: entityDescription!, insertInto: context)
        
        newItem.setValue(title!, forKey: "title")
        newItem.setValue(test_id, forKey: "test_id")
        do {
            try newItem.managedObjectContext?.save()
            return true
        } catch {
            return false
        }
    }
}
