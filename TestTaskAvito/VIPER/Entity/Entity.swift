//
//  Entity.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import Foundation

// Model

// MARK: - Parse
struct JSONContainer: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
