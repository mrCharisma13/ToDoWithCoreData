//
//  TextFieldView.swift
//  ToDoWithCoreData
//
//  Created by Никита Бутовцов on 19.10.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldText: String
    
    var body: some View {
        TextField("Add new task", text: $textFieldText)
            .font(.headline)
            .padding(.leading)
            .frame(height: 55)
            .background(Color(hue: 1.0, saturation: 0.049, brightness: 0.932))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

