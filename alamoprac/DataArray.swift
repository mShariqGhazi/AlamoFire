//
//  DataArray.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/16/21.
//

import Foundation

struct DataArray: Codable {
    
    var status: String?
    var data: [DataFetched]
    
}

struct DataFetched: Codable {
    var id: Int
    var name: String
    var salary: Int
    var age: Int
    var img: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case age = "employee_age"
        case salary = "employee_salary"
        case img = "profile_image"
    }
    
}

extension DataFetched: Displayable {
    var employeeId: Int {
        get {
            id
        }
        set(newId) {
            id = newId
        }
    }
    
    var employeeNameText: String {
        get {
            name
        }
        set(newName) {
            name = newName
        }
    }
    
    var employeeAgeText: Int {
        get {
            age
        }
        set(newAge) {
            age = newAge
        }
    }
    
    var employeeSalaryText: Int {
        get {
            salary
        }
        set(newSalary) {
            salary = newSalary
        }
    }
    
    var employeeProfile: String {
        get {
            img
        }
        set(newImg) {
            img = newImg
        }
    }
    
    
//    var employeeId: Int {
//        id
//    }
//
//    var employeeNameText: String {
//        name
//    }
//
//    var employeeAgeText: Int {
//        age
//    }
//
//    var employeeSalaryText: Int {
//        salary
//    }
//
//    var employeeProfile: String {
//        img
//    }
    
}

struct inputData: Encodable {
    let name: String
    let salary: Int
    let age: Int
}
