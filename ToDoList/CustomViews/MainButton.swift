//
//  MainButton.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 30/07/2023.
//

import SwiftUI

struct MainButton: View {
    
    let title: String
    let backgroungColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(backgroungColor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        })
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Title", backgroungColor: .blue) {
            
        }
    }
}
