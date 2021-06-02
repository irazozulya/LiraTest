//
//  Photos+CoreDataClass.swift
//  LiraTech
//
//  Created by Ira Zozulya on 31.05.2021.
//
//

import Foundation
import CoreData

@objc(Photos)
public class Photos: User {
    static func add(photo: Data?, photo_id: Int64, test_id: Int64, user_id: Int64) -> Bool {
        if(photo == nil || photo_id == 0 || test_id == 0 || user_id == 0) {
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
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Photos", in: context)
            
        let newItem = NSManagedObject(entity: entityDescription!, insertInto: context)
        
        newItem.setValue(photo!, forKey: "photo")
        newItem.setValue(photo_id, forKey: "photo_id")
        newItem.setValue(test_id, forKey: "test_id")
        newItem.setValue(user_id, forKey: "user_id")
        do {
            try newItem.managedObjectContext?.save()
            return true
        } catch {
            return false
        }
    }
}
