//
//  Displayable.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/19/21.
//

import Foundation

protocol Displayable {
    var employeeId: Int { get }
    var employeeNameText: String { get }
    var employeeAgeText: Int { get }
    var employeeSalaryText: Int { get }
    var employeeProfile: String { get }
}
