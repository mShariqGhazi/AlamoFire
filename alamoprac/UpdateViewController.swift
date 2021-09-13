//
//  UpdateViewController.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 9/9/21.
//

import UIKit

protocol dataUpdateProtocol {
    func update(_ i: Int, updatedAge: Int, updatedSalary: Int)
}

class UpdateViewController: UIViewController {
    
    @IBOutlet weak var updateAgeField: UITextField!
    @IBOutlet weak var updateSalaryField: UITextField!
    
    var delegate: dataUpdateProtocol?
    
    var indexRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        let uAge: Int  = Int(updateAgeField.text!) ?? 0
        let uSalary: Int = Int(updateSalaryField.text!) ?? 0
        delegate?.update(indexRow, updatedAge: uAge, updatedSalary: uSalary)
        self.navigationController?.popViewController(animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UpdateControllerSegue" {
//            guard let updateVC = segue.destination as? UpdateViewController else {
//                  return
//                }
//            guard let data = data else { return }
//            updateVC.indexRow = data.employeeId
//        }
//    }
    
    
}
