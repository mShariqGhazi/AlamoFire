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
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeAgeLabel: UILabel!
    @IBOutlet weak var employeeSalaryLabel: UILabel!
    
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
    
    @IBAction func arabicPressed(_ sender: Any) {
        if languageButton.titleLabel?.text == "Arabic" {
            
            self.view.semanticContentAttribute = .forceRightToLeft
            
            employeeNameLabel.text = "Add Employee Name".localizableString("ar")
            employeeAgeLabel.text = "Add Employee Age".localizableString("ar")
            employeeSalaryLabel.text = "Add Employee Salary".localizableString("ar")
            
            languageButton.setTitle("English", for: .normal)
            
        }
        if languageButton.titleLabel?.text == "English" {
            
            self.view.semanticContentAttribute = .forceLeftToRight
            
            employeeNameLabel.text = "Add Employee Name".localizableString("en")
            employeeAgeLabel.text = "Add Employee Age".localizableString("en")
            employeeSalaryLabel.text = "Add Employee Salary".localizableString("en")
            
            languageButton.setTitle("Arabic", for: .normal)
        }
        
    }
    

    @IBAction func postButton(_ sender: Any) {
        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
        salary = Int(addEmployeeSalary.text!) ?? 0
        age = Int(addEmployeeAge.text!) ?? 0
        name = addEmployeeName.text ?? ""
        sending.sendData(nameInput: name, salaryInput: salary, ageInput: age)
        self.delegate?.sendDataToStore(name, salary, age)
//        print(res)
        self.navigationController?.popViewController(animated: true)
    }
    
//    func sendData(){
//        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
//        sending.sendData(nameInput: addEmployeeName.text ?? "", salaryInput: salary, ageInput: age)
//    }
    
}


extension String {
    func localizableString(_ name: String) -> String {
        let path = Bundle.main.path(forResource: name, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Translations", bundle: bundle!, value: "", comment: "")
    }
}
