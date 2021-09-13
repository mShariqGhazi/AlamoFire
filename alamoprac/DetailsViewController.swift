//
//  DetailsViewController.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/17/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeAge: UILabel!
    @IBOutlet weak var employeeSalary: UILabel!
    
    var data: Displayable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        
    }
    
    private func commonInit() {
        guard let data = data else { return }
      
        employeeName.text = data.employeeNameText
        employeeAge.text = String(data.employeeAgeText)
        employeeSalary.text = String(data.employeeSalaryText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateControllerSegue" {
            guard let updateVC = segue.destination as? UpdateViewController else {
                  return
                }
            guard let data = data else { return }
            updateVC.indexRow = data.employeeId
            updateVC.delegate = self
        }
    }
    

}

extension DetailsViewController: dataUpdateProtocol {
    func update(_ i: Int, updatedAge: Int, updatedSalary: Int) {
        if updatedAge != 0 {
            employeeAge.text = String(updatedAge)
        }
        if updatedSalary != 0 {
            employeeSalary.text = String(updatedSalary)
        }
        
    }
}
