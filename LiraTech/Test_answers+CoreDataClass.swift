//
//  Test_answers+CoreDataClass.swift
//  LiraTech
//
//  Created by Ira Zozulya on 31.05.2021.
//
//

import Foundation
import CoreData

@objc(Test_answers)
public class Test_answers: NSManagedObject {
    
    static func add(answer: String?,answer_id: Int64, question_id: Int64) -> Bool {
        if(answer == nil || answer_id == 0 || question_id == 0) {
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
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Test_answers", in: context)
            
        let newItem = NSManagedObject(entity: entityDescription!, insertInto: context)
       
        newItem.setValue(answer!, forKey: "answer")
        newItem.setValue(answer_id, forKey: "answer_id")
        newItem.setValue(question_id, forKey: "question_id")
        do {
            try newItem.managedObjectContext?.save()
            return true
        } catch {
            return false
        }
    }
}
