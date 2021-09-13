//
//  AddDataViewController.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/20/21.
//

import UIKit

protocol DataAdditionsProtocol {
    func sendDataToStore(_ name: String, _ salary: Int, _ age: Int)
}

class AddDataViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addEmployeeName: UITextField!
    @IBOutlet weak var addEmployeeAge: UITextField!
    @IBOutlet weak var addEmployeeSalary: UITextField!
    
    var name: String = ""
    var salary: Int = 0
    var age: Int = 0
    
    var delegate: DataAdditionsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEmployeeName.delegate = self
        addEmployeeAge.delegate = self
        addEmployeeSalary.delegate = self
        
    }
    
    

    @IBAction func postButton(_ sender: Any) {
        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
        salary = Int(addEmployeeSalary.text!) ?? 0
        age = Int(addEmployeeAge.text!) ?? 0
        name = addEmployeeName.text ?? ""
        let res: String = sending.sendData(nameInput: name, salaryInput: salary, ageInput: age)
        self.delegate?.sendDataToStore(name, salary, age)
        print(res)
        self.navigationController?.popViewController(animated: true)
    }
    
//    func sendData(){
//        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
//        sending.sendData(nameInput: addEmployeeName.text ?? "", salaryInput: salary, ageInput: age)
//    }
    
}
