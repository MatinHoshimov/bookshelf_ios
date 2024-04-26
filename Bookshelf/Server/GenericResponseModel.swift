//
//  GenericResponseModel.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 27/03/24.
//

import Foundation

struct GenericResponseModel: Codable {
    var error: String?
    var StatusCode: Int?
}

struct GenericError: LocalizedError {
    var error: String?
    var StatusCode: Int?
}
