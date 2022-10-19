//
//  ButtonView.swift
//  ToDoWithCoreData
//
//  Created by Никита Бутовцов on 19.10.2022.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var taskViewModel: ListViewModel
    @Binding var textFieldText: String
    
    var body: some View {
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
    }
}

