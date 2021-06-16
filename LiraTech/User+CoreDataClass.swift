//
//  User+CoreDataClass.swift
//  LiraTech
//
//  Created by Ira Zozulya on 31.05.2021.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    static func isAccessible(email: String?, password: String?) -> Bool {
        if(email == nil || password == nil) {
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
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
         
        let predicate = NSPredicate(format: "email == %@ and pass== %@", email!, password!)
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
            
            return result.count >= 1
        } catch {
            return false
        }
    }
    
    static func register(name: String?, email: String?, password: String?) -> Bool {
        if(name == nil || email == nil || password == nil) {
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
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
         
        let predicate = NSPredicate(format: "email == %@", email!)
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
            if(result.count >= 1) {
                return false
            }
        } catch {
            return false
        }
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: context)
            
        let newUser = NSManagedObject(entity: entityDescription!, insertInto: context)
        
        newUser.setValue(name!, forKey: "full_name")
        newUser.setValue(email!, forKey: "email")
        newUser.setValue(password!, forKey: "pass")
        do {
            try newUser.managedObjectContext?.save()
            return true
        } catch {
            return false
        }
    }
    
    static func getAllUserTests(email: String?, password: String?) -> Bool {
        if(email == nil || password == nil) {
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
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
         
        let predicate = NSPredicate(format: "email == %@ and pass== %@", email!, password!)
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
            
            return result.count >= 1
        } catch {
            return false
        }
    }
}
