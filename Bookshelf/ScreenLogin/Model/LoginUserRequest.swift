//
//  LoginUserRequest.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 05/03/24.
//

import Foundation

struct LoginUserRequest{
    var email: String
    var password: String
}

struct LoginModelRequest: Codable{
    var data: LoginDataResult?
    var user: UserLoginResult?
    var token: UserTokinResult?
}

struct UserLoginResult: Codable {
    var id: String?
    var firstName: String?
    var lastName: String?
}

struct UserTokinResult: Codable {
    var token: String?
}

struct LoginDataResult: Codable {
    
}
