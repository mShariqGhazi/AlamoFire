//
//  Displayable.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/19/21.
//

import Foundation

protocol Displayable {
    var employeeId: Int { get set }
    var employeeNameText: String { get set }
    var employeeAgeText: Int { get set }
    var employeeSalaryText: Int { get set }
    var employeeProfile: String { get set }
}
