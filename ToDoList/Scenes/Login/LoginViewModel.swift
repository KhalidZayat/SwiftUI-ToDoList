//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 30/07/2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
 
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func validate() -> Bool {
        
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@"), email.contains(".") else  {
            errorMessage = "Please enter valid email."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please enter password with more than 5 charcters."
            return false
        }
        
        return true
    }
    
    func login() {
        guard validate() else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            
        }
    }
}
