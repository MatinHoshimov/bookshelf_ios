//
//  RegisterUserReguest.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 05/03/24.
//

import Foundation

struct RegisterUserRequest:Codable {
    let username: String
    let email: String
    let password: String
}
