//
//  User_answers+CoreDataClass.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//
//

import Foundation
import CoreData

@objc(User_answers)
public class User_answers: NSManagedObject {
    static func retrieveByUserId(user_id: Int64) -> [User_answers] {
        if(user_id == 0) {
            return [];
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
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = User_answers.fetchRequest()
         
        let predicate = NSPredicate(format: "user_id == %@", user_id)
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
            
            return result as? [User_answers] ?? []
        } catch {
            return []
        }
    }
    
    static func add(answer_id: Int64, question_id: Int64, test_id: Int64, user_id: Int64) -> Bool {
        if(answer_id == 0 || question_id == 0 || test_id == 0 || user_id == 0) {
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
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "User_answers", in: context)
            
        let newItem = NSManagedObject(entity: entityDescription!, insertInto: context)
        
        newItem.setValue(answer_id, forKey: "answer_id")
        newItem.setValue(question_id, forKey: "question_id")
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
