//
//  DetailsViewController.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/17/21.
//

import UIKit

protocol dataUpdateProtocol {
    func update(_ id: Int, _ name: String, _ updatedAge: Int, _ updatedSalary: Int)
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeAge: UILabel!
    @IBOutlet weak var employeeSalary: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    var data: Displayable?
    
    var delegate: dataUpdateProtocol?
    
    var index: Int = 0
    
    var uName: String = ""
    var uSalary: Int = 0
    var uAge: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        
        nameTextField.isHidden = true
        ageTextField.isHidden = true
        salaryTextField.isHidden = true
        
    }
    
    private func commonInit() {
        guard let data = data else { return }
      
        employeeName.text = data.employeeNameText
        employeeAge.text = String(data.employeeAgeText)
        employeeSalary.text = String(data.employeeSalaryText)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UpdateControllerSegue" {
//            guard let updateVC = segue.destination as? UpdateViewController else {
//                  return
//                }
//            guard let data = data else { return }
//            updateVC.indexRow = data.employeeId
//            updateVC.delegate = self
//        }
//    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        if updateButton.titleLabel?.text == "Update" {
            
            employeeName.isHidden = true
            employeeAge.isHidden = true
            employeeSalary.isHidden = true
            
            nameTextField.isHidden = false
            ageTextField.isHidden = false
            salaryTextField.isHidden = false
            
            nameTextField.text = employeeName.text
            ageTextField.text = employeeAge.text
            salaryTextField.text = employeeSalary.text
            
            updateButton.setTitle("Save", for: .normal)
        }
        
        if updateButton.titleLabel?.text == "Save" {
            
            if nameTextField.text != "" {
                employeeName.text = nameTextField.text
                uName = nameTextField.text ?? ""
            }
            if ageTextField.text != "0" && ageTextField.text?.isEmpty == false {
                employeeAge.text = ageTextField.text
                uAge = Int(ageTextField.text!) ?? 0
            }
            if salaryTextField.text != "0" && salaryTextField.text?.isEmpty == false {
                employeeSalary.text = salaryTextField.text
                uSalary = Int(salaryTextField.text!) ?? 0
            }
            
            nameTextField.isHidden = true
            ageTextField.isHidden = true
            salaryTextField.isHidden = true
            
            employeeName.isHidden = false
            employeeAge.isHidden = false
            employeeSalary.isHidden = false
            
            updateButton.setTitle("Update", for: .normal)
            
            guard let data = data else { return }
            index = data.employeeId
            
            delegate?.update(index, uName, uAge, uSalary)
        }
        
        
    }
    

}

//extension DetailsViewController: dataUpdateProtocol {
//    func update(_ i: Int, updatedAge: Int, updatedSalary: Int) {
//        if updatedAge != 0 {
//            employeeAge.text = String(updatedAge)
//        }
//        if updatedSalary != 0 {
//            employeeSalary.text = String(updatedSalary)
//        }
//        
//    }
//}
