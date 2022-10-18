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
    let cantainer: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        cantainer = NSPersistentContainer(name: "TasksContainer")
        cantainer.loadPersistentStores { description, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
        context = cantainer.viewContext
    }
}
