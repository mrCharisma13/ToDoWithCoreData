//
//  TaskViewModel.swift
//  ToDoWithCoreData
//
//  Created by Никита Бутовцов on 18.10.2022.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {
    let manager = CoreDataManager()
    @Published var tasks: [TaskEntity] = []
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        
        do {
            tasks = try manager.context.fetch(request)
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func deleteTask(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = tasks[index]
        manager.container.viewContext.delete(entity)
        saveData()
    }
    
    func addTask(task: String) {
        let newTask = TaskEntity(context: manager.container.viewContext)
        newTask.task = task
        saveData()
    }
    
    func saveData() {
        do {
            try manager.container.viewContext.save()
            getTasks()
        } catch let error {
            print("Error: \(error)")
        }
    }
}
