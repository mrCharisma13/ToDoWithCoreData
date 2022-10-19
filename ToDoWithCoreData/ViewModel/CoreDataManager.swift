//
//  CoreDataManager.swift
//  ToDoWithCoreData
//
//  Created by Никита Бутовцов on 18.10.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    let containerName = "TasksContainer"
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
        context = container.viewContext
    }
}
