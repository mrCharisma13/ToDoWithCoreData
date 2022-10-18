//
//  ListView.swift
//  ToDoWithCoreData
//
//  Created by Никита Бутовцов on 18.10.2022.
//

import SwiftUI

struct ListView: View {
    @StateObject var taskViewModel = ListViewModel()
    @State var textFieldText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add new task", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(hue: 1.0, saturation: 0.049, brightness: 0.932))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    guard !textFieldText.isEmpty else {return}
                    taskViewModel.addTask(task: textFieldText)
                    textFieldText = ""
                } label: {
                    Text("Add task")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color(hue: 0.185, saturation: 1.0, brightness: 1.0, opacity: 0.712))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                List {
                    ForEach(taskViewModel.tasks) { toDo in
                        Text(toDo.task ?? "no name")
                    }
                    .onDelete(perform: taskViewModel.deleteTask)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Tasks 📝")
        }
    }
}
 
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
