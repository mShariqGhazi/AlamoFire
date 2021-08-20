//
//  AddDataViewController.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/20/21.
//

import UIKit

class AddDataViewController: UIViewController {
    
    @IBOutlet weak var addEmployeeName: UITextField!
    @IBOutlet weak var addEmployeeAge: UITextField!
    @IBOutlet weak var addEmployeeSalary: UITextField!
    
    var salary: Int = 0
    var age: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEmployeeName.delegate = self
        addEmployeeAge.delegate = self
        addEmployeeSalary.delegate = self
        
    }

    @IBAction func postButton(_ sender: Any) {
//        sendData()
    }
    
//    func sendData(){
//        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
//        sending.sendData(nameInput: addEmployeeName.text ?? "", salaryInput: salary, ageInput: age)
//    }
    
}

extension UIViewController: UITextFieldDelegate {
    
    
    
}
