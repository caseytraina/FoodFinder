//
//  UserStruct.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/22/22.
//

import Foundation

public struct User: Codable {

    let firstName: String?
    let lastName: String?
    let email: String?
    let password: String?

    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case email
        case password
    }

}

class AllUsers: ObservableObject {
    @Published var users: [User] = []
}
