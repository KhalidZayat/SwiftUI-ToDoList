//
//  ContentView.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 27/07/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "To Do List",
                       subTitle: "Get things done",
                       angle: 15,
                       backgroungColor: .pink)
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                TextField("Email address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                MainButton(title: "Log in", backgroungColor: .blue) {
                    viewModel.login()
                }.padding()
            }
            .offset(y: -50)
            
            VStack {
                Text("New around here?")
                NavigationLink("Create an account",
                               destination: RegisterView())
            }
            .padding(.init(top: 20, leading: 0, bottom: 2, trailing: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
