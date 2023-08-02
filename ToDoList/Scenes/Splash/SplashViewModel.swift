//
//  SplashViewModel.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 31/07/2023.
//

import Foundation
import FirebaseAuth

class SplashViewModel: ObservableObject {
    
    @Published var currentUSerID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUSerID = user?.uid ?? ""
            }
        }
    }
}
