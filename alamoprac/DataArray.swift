//
//  DataArray.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/16/21.
//

import Foundation

struct DataArray: Codable {
    
//    var id: String?
//    var name: String
//    var salary: String?
//    var age: String?
//    var img: String?
//
//    let status: String
//    let data: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case name = "employee_name"
//        case age
//        case salary
//        case id
//        case img
//    }
    var status: String?
    var data: [DataFetched]
//
//        var name: String?
//        var city: String?
//        var countryCode:String?
//
//        enum CodingKeys: String, CodingKey {
//            case name = "name"
//            case capital = "capital"
//            case countryCode = "alpha3Code"
//        }

    
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
        id
    }
    
    var employeeNameText: String {
        name
    }
    
    var employeeAgeText: Int {
        age
    }
    
    var employeeSalaryText: Int {
        salary
    }
    
    var employeeProfile: String {
        img
    }
    
}

struct inputData: Encodable {
    let name: String
    let salary: Int
    let age: Int
}



//    let id: String?
//    let name: String?
//    let salary: String?
//    let age: String?
//    let img: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case name = "employee_name"
//        case salary = "employee_salary"
//        case age = "employee_age"
//        case img = "profile_image"
//    }
