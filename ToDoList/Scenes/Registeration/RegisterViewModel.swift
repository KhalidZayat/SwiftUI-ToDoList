//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 31/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
 
    @Published var name: String = ""
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
    
    func register() {
        guard validate() else { return }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                guard let error = error else {
                    self?.errorMessage = "Something wrong happend"
                    return
                }
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.insertNewUser(id: userID)
        }
    }
    
    func insertNewUser(id: String) {
        let user = User(id: id,
                        name: name,
                        email: email,
                        joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(id)
            .setData(user.asDictionary())
    }
}
