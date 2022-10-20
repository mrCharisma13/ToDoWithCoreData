//
//  ListView.swift
//  ToDoWithCoreData
//
//  Created by Никита Бутовцов on 18.10.2022.
//

import SwiftUI

struct ListView: View {
    @StateObject var taskViewModel = ListViewModel()
    @State private var textFieldText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextFieldView(textFieldText: $textFieldText)
                

                ButtonView(taskViewModel: taskViewModel, textFieldText: $textFieldText)
                .padding(.horizontal)
                
                List {
                    ForEach(taskViewModel.tasks) { toDo in
                        Text(toDo.task ?? "No tasks")
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
