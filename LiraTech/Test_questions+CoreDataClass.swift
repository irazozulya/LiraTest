//
//  Test_questions+CoreDataClass.swift
//  LiraTech
//
//  Created by Ira Zozulya on 31.05.2021.
//
//

import Foundation
import CoreData

@objc(Test_questions)
public class Test_questions: NSManagedObject {
    
    static func add(answer_id: Int64, question: String?, question_id: Int64, test_id: Int64) -> Bool {
        if(answer_id == 0 || question == nil || question_id == 0 || test_id == 0) {
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
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Test_questions", in: context)
            
        let newItem = NSManagedObject(entity: entityDescription!, insertInto: context)
        
        newItem.setValue(answer_id, forKey: "answer_id")
        newItem.setValue(question!, forKey: "question")
        newItem.setValue(question_id, forKey: "question_id")
        newItem.setValue(test_id, forKey: "test_id")
        do {
            try newItem.managedObjectContext?.save()
            return true
        } catch {
            return false
        }
    }
}
