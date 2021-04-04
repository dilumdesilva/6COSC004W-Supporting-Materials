//
//  DataManager.swift
//  BudgetPlanner
//
//  Created by Dilum De Silva on 2021-04-03.
//

import Foundation
import CoreData

class DataManger {
    static let shared = DataManger()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BudgetPlanner")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func buckets() -> [Bucket] {
        let request: NSFetchRequest<Bucket> = Bucket.fetchRequest()
        var fetchedBuckets: [Bucket] = []
        do {
            fetchedBuckets = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Data fetching error")
        }
        return fetchedBuckets
    }
    
    func bucket(name: String, size: NSDecimalNumber) -> Bucket {
        let bucket = Bucket(context: persistentContainer.viewContext)
        bucket.name = name
        bucket.size = size
        return bucket
    }
    
    func expense(name: String, amount: NSDecimalNumber, bucket: Bucket) -> Expense {
        let expense = Expense(context: persistentContainer.viewContext)
        expense.expenseName = name
        expense.amount =  amount
        expense.bucket = bucket
        return expense
    }
    

    // MARK: - Core Data Saving support
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
