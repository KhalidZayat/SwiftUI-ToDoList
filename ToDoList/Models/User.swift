//
//  User.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 27/07/2023.
//

import Foundation

struct User: Codable {
    var id: String
    var name: String
    var email: String
    var joined: TimeInterval
}
